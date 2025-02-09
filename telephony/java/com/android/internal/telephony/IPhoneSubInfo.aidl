/*
 * Copyright (C) 2007 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.android.internal.telephony;

import android.telephony.ImsiEncryptionInfo;

/**
 * Interface used to retrieve various phone-related subscriber information.
 *
 */
interface IPhoneSubInfo {

    /** @deprecated Use {@link #getDeviceIdWithFeature(String, String) instead */
    @UnsupportedAppUsage
    String getDeviceId(String callingPackage);

    /**
     * Retrieves the unique device ID, e.g., IMEI for GSM phones.
     */
    String getDeviceIdWithFeature(String callingPackage, String callingFeatureId);

     /**
     * Retrieves the unique Network Access ID
     */
    String getNaiForSubscriber(int subId, String callingPackage, String callingFeatureId);

    /**
     * Retrieves the unique device ID of a phone for the device, e.g., IMEI
     * for GSM phones.
     */
    String getDeviceIdForPhone(int phoneId, String callingPackage, String callingFeatureId);

    /**
     * Retrieves the IMEI.
     */
    String getImeiForSubscriber(int subId, String callingPackage, String callingFeatureId);

    /**
     * Retrieves the software version number for the device, e.g., IMEI/SV
     * for GSM phones.
     */
    String getDeviceSvn(String callingPackage, String callingFeatureId);

    /**
     * Retrieves the software version number of a subId for the device, e.g., IMEI/SV
     * for GSM phones.
     */
    String getDeviceSvnUsingSubId(int subId, String callingPackage, String callingFeatureId);

    /** @deprecated Use {@link #getSubscriberIdWithFeature(String, String) instead */
    @UnsupportedAppUsage
    String getSubscriberId(String callingPackage);

    /**
     * Retrieves the unique sbuscriber ID, e.g., IMSI for GSM phones.
     */
    String getSubscriberIdWithFeature(String callingPackage, String callingComponenId);

    /**
     * Retrieves the unique subscriber ID of a given subId, e.g., IMSI for GSM phones.
     */
    String getSubscriberIdForSubscriber(int subId, String callingPackage,
            String callingFeatureId);

    /**
     * Retrieves the Group Identifier Level1 for GSM phones of a subId.
     */
    String getGroupIdLevel1ForSubscriber(int subId, String callingPackage,
            String callingFeatureId);

    /**
     * Retrieves the Group Identifier Level1 of a subId.
     */
    String getGroupIdLevel2ForSubscriber(int subId, String callingPackage,
            String callingFeatureId);

    /** @deprecared Use {@link getIccSerialNumberWithFeature(String, String)} instead */
    @UnsupportedAppUsage
    String getIccSerialNumber(String callingPackage);

    /**
     * Retrieves the serial number of the ICC, if applicable.
     */
    String getIccSerialNumberWithFeature(String callingPackage, String callingFeatureId);

    /**
     * Retrieves the serial number of a given subId.
     */
    String getIccSerialNumberForSubscriber(int subId, String callingPackage,
            String callingFeatureId);

    /**
     * Retrieves the phone number string for line 1.
     */
    String getLine1Number(String callingPackage, String callingFeatureId);

    /**
     * Retrieves the phone number string for line 1 of a subcription.
     */
    String getLine1NumberForSubscriber(int subId, String callingPackage, String callingFeatureId);


    /**
     * Retrieves the alpha identifier for line 1.
     */
    String getLine1AlphaTag(String callingPackage, String callingFeatureId);

    /**
     * Retrieves the alpha identifier for line 1 of a subId.
     */
    String getLine1AlphaTagForSubscriber(int subId, String callingPackage,
            String callingFeatureId);


    /**
     * Retrieves MSISDN Number.
     */
    String getMsisdn(String callingPackage, String callingFeatureId);

    /**
     * Retrieves the Msisdn of a subId.
     */
    String getMsisdnForSubscriber(int subId, String callingPackage, String callingFeatureId);

    /**
     * Retrieves the voice mail number.
     */
    String getVoiceMailNumber(String callingPackage, String callingFeatureId);

    /**
     * Retrieves the voice mail number of a given subId.
     */
    String getVoiceMailNumberForSubscriber(int subId, String callingPackage,
            String callingFeatureId);

    /**
     * Retrieves the Carrier information used to encrypt IMSI and IMPI.
     */
    ImsiEncryptionInfo getCarrierInfoForImsiEncryption(int subId, int keyType,
            String callingPackage);

    /**
     * Stores the Carrier information used to encrypt IMSI and IMPI.
     */
    void setCarrierInfoForImsiEncryption(int subId, String callingPackage,
    in ImsiEncryptionInfo imsiEncryptionInfo);

    /**
     * Resets the Carrier Keys in the database. This involves 2 steps:
     *  1. Delete the keys from the database.
     *  2. Send an intent to download new Certificates.
     */
    void resetCarrierKeysForImsiEncryption(int subId, String callingPackage);

    /**
     * Retrieves the alpha identifier associated with the voice mail number.
     */
    String getVoiceMailAlphaTag(String callingPackage, String callingFeatureId);

    /**
     * Retrieves the alpha identifier associated with the voice mail number
     * of a subId.
     */
    String getVoiceMailAlphaTagForSubscriber(int subId, String callingPackage,
            String callingFeatureId);

    /**
     * Returns the IMS private user identity (IMPI) that was loaded from the ISIM.
     * @return the IMPI, or null if not present or not loaded
     */
    String getIsimImpi(int subId);

    /**
     * Returns the IMS home network domain name that was loaded from the ISIM.
     * @return the IMS domain name, or null if not present or not loaded
     */
    String getIsimDomain(int subId);

    /**
     * Returns the IMS public user identities (IMPU) that were loaded from the ISIM.
     * @return an array of IMPU strings, with one IMPU per string, or null if
     *      not present or not loaded
     */
    String[] getIsimImpu(int subId);

    /**
     * Returns the IMS Service Table (IST) that was loaded from the ISIM.
     * @return IMS Service Table or null if not present or not loaded
     */
    String getIsimIst(int subId);

    /**
     * Returns the IMS Proxy Call Session Control Function(PCSCF) that were loaded from the ISIM.
     * @return an array of PCSCF strings with one PCSCF per string, or null if
     *      not present or not loaded
     */
    String[] getIsimPcscf(int subId);

    /**
     * Returns the response of the SIM application on the UICC to authentication
     * challenge/response algorithm. The data string and challenge response are
     * Base64 encoded Strings.
     * Can support EAP-SIM, EAP-AKA with results encoded per 3GPP TS 31.102.
     *
     * @param subId subscription ID to be queried
     * @param appType ICC application type (@see com.android.internal.telephony.PhoneConstants#APPTYPE_xxx)
     * @param authType Authentication type, see PhoneConstants#AUTHTYPE_xxx
     * @param data authentication challenge data
     * @return challenge response
     */
    String getIccSimChallengeResponse(int subId, int appType, int authType, String data);
}
