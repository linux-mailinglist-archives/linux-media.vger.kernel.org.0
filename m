Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDBD86D2107
	for <lists+linux-media@lfdr.de>; Fri, 31 Mar 2023 14:59:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232651AbjCaM7y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Mar 2023 08:59:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232723AbjCaM7x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Mar 2023 08:59:53 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF9C58A7C
        for <linux-media@vger.kernel.org>; Fri, 31 Mar 2023 05:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680267581; x=1711803581;
  h=subject:to:references:from:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding;
  bh=1VwBzQZUb1569TlFP1pZ870lSn8rNGgpYZVy+dpCWEA=;
  b=myu6bNiluDSN9qmw0GWgIIiRQsnoENR/OStrytasuR3W8qsXBOpLEMxs
   qNYACof0p44VLNbOnY2P/ZaUyC18/4KK1nf9SGEZDfzcbIe0oQ41eZv96
   zuTqUPNqJ1Qs5Ak8V7oToakGdtdAIU9rnnieh74SanEkhWeo+aKHLVnnv
   VLRPg9olVg6Q64a/PqsyAn9UT53HrdZKfn8BHM+nfyRjAjeDkKlzpTRJ5
   /A6rHzi+I95hvtOVXcF7B8M4CjCG5z3DiKY6h97XyRnj8rWgdb5I2MbFJ
   3FVMsBjNYK2us8KCqdJlwGFegkNk7BR8OlNMq9O+Rhfg0cJZo5VkXMBrf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="321097024"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="321097024"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 05:59:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="859312209"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="859312209"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.139]) ([10.238.232.139])
  by orsmga005.jf.intel.com with ESMTP; 31 Mar 2023 05:59:39 -0700
Subject: Re: [PATCH v2] media: ipu3-cio2: support more camera sensors in
 cio2-bridge
To:     Dan Scally <dan.scally@ideasonboard.com>, bingbu.cao@intel.com,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        andriy.shevchenko@linux.intel.com, djrscally@gmail.com
References: <20230303181504.1813469-1-bingbu.cao@intel.com>
 <f5ce2815-a875-25a4-269d-69b30ce534b7@ideasonboard.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <06f27826-356d-2ed1-2b28-2de59cfae14b@linux.intel.com>
Date:   Fri, 31 Mar 2023 21:00:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f5ce2815-a875-25a4-269d-69b30ce534b7@ideasonboard.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 3/6/23 5:34 PM, Dan Scally wrote:
> Good morning Bingbu
> 
> On 03/03/2023 18:15, bingbu.cao@intel.com wrote:
>> From: Bingbu Cao <bingbu.cao@intel.com>
>>
>> Add more camera sensors into the supported camera sensors list
>> to make cio2-bridge to support more camera sensors.
>>
>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> 
> Thanks; this looks ok to me now:
> 
> 
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> 
Sakari, 

Will you pick this change?

>> ---
>> Changes from v1:
>>   - remove some sensors without available drivers
>>   - add .link_frequencies for each sensor
>>
>> ---
>>   drivers/media/pci/intel/ipu3/cio2-bridge.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c b/drivers/media/pci/intel/ipu3/cio2-bridge.c
>> index dfefe0d8aa95..d59bec8a94e2 100644
>> --- a/drivers/media/pci/intel/ipu3/cio2-bridge.c
>> +++ b/drivers/media/pci/intel/ipu3/cio2-bridge.c
>> @@ -29,6 +29,14 @@ static const struct cio2_sensor_config cio2_supported_sensors[] = {
>>       CIO2_SENSOR_CONFIG("INT347E", 1, 319200000),
>>       /* Omnivision OV2680 */
>>       CIO2_SENSOR_CONFIG("OVTI2680", 0),
>> +    /* Omnivision ov8856 */
>> +    CIO2_SENSOR_CONFIG("OVTI8856", 3, 180000000, 360000000, 720000000),
>> +    /* Omnivision ov2740 */
>> +    CIO2_SENSOR_CONFIG("INT3474", 1, 360000000),
>> +    /* Hynix hi556 */
>> +    CIO2_SENSOR_CONFIG("INT3537", 1, 437000000),
>> +    /* Omnivision ov13b10 */
>> +    CIO2_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
>>   };
>>     static const struct cio2_property_names prop_names = {

-- 
Best regards,
Bingbu Cao
