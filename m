Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B57814FF5D7
	for <lists+linux-media@lfdr.de>; Wed, 13 Apr 2022 13:39:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235251AbiDMLlB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Apr 2022 07:41:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235269AbiDMLk6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Apr 2022 07:40:58 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4C5C5C654
        for <linux-media@vger.kernel.org>; Wed, 13 Apr 2022 04:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649849913; x=1681385913;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=pcXlmzmLZKZFHJMeE6TorRigQ/RtPP5z+F2bXVrn3PY=;
  b=IbZqQVJF9qn6oL6P0Fk0EUH78SOk1MNY6C2A4gXR0ycvIsDtMH182trW
   D9LXeeZqI+/Wr+nEk981gGjNVRl58wlF8B6YwwmIWhf6Dq0/uGjqo1WKd
   8HlR9uororaGqEArq2KlXjrJU0PtawNJDFBeamIJk6qt4hEaPRaF4aZq8
   ImagMUudcusMhstMYB8vjenNnmiPhcrmc9FhSycXlywHDp/rfF+tucTSA
   3TLGhVd3yQ7RNg9FROeCe4cpSUioFhmvvleknttIx0fXDHRIkznoPSaTG
   fCbKu/i6ld5C9grlc2m7NU3lYyXoopfFBwzD8u6RFKR4hN5zUzYzf2aOr
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="262084145"
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; 
   d="scan'208";a="262084145"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 04:38:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; 
   d="scan'208";a="655525462"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.188]) ([10.238.232.188])
  by fmsmga002.fm.intel.com with ESMTP; 13 Apr 2022 04:38:31 -0700
Subject: Re: [PATCH] media: dw9768: activate runtime PM and turn off device
To:     Tomasz Figa <tfiga@chromium.org>, Bingbu Cao <bingbu.cao@intel.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        dongchun.zhu@mediatek.com, tian.shu.qiu@intel.com
References: <1634278119-32158-1-git-send-email-bingbu.cao@intel.com>
 <CAAFQd5Aykfdj-HPzsQOyQpbGBRhtTsoRm78XgpuGkFUx1joTMA@mail.gmail.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <42bab3b2-ae4b-01a6-e2ef-58b44827a917@linux.intel.com>
Date:   Wed, 13 Apr 2022 19:38:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAAFQd5Aykfdj-HPzsQOyQpbGBRhtTsoRm78XgpuGkFUx1joTMA@mail.gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 11/5/21 2:54 PM, Tomasz Figa wrote:
> On Fri, Oct 15, 2021 at 3:12 PM Bingbu Cao <bingbu.cao@intel.com> wrote:
>>
>> When dw9768 working with ACPI systems, the dw9768 was turned
>> by i2c-core during probe, driver need activate the PM runtime
>> and ask runtime PM to turn off the device.
>>
>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
>> ---
>>  drivers/media/i2c/dw9768.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/media/i2c/dw9768.c b/drivers/media/i2c/dw9768.c
>> index c086580efac7..65c6acf3ced9 100644
>> --- a/drivers/media/i2c/dw9768.c
>> +++ b/drivers/media/i2c/dw9768.c
>> @@ -469,6 +469,11 @@ static int dw9768_probe(struct i2c_client *client)
>>
>>         dw9768->sd.entity.function = MEDIA_ENT_F_LENS;
>>
>> +       /*
>> +        * Device is already turned on by i2c-core with ACPI domain PM.
>> +        * Attempt to turn off the device to satisfy the privacy LED concerns.
>> +        */
>> +       pm_runtime_set_active(dev);
> 
> This driver is used by non-ACPI systems as well. This change will make
> the PM core not call the runtime_resume() callback provided by the
> driver and the power would never be turned on on such systems.

Tomasz,

Why the runtime_set_active() and runtime_idle() break the runtime
PM on non-ACPI systems? Did it cause the PM runtime enable failure or
incorrect PM usage count?

> 
> Wasn't the intention of Sakari's ACPI patches to allow bypassing the
> ACPI domain power on at boot up and eliminate the need for this
> change?
> 
> Best regards,
> Tomasz
> 
>>
>>         pm_runtime_enable(dev);
>>         if (!pm_runtime_enabled(dev)) {
>>                 ret = dw9768_runtime_resume(dev);
>> @@ -483,6 +488,7 @@ static int dw9768_probe(struct i2c_client *client)
>>                 dev_err(dev, "failed to register V4L2 subdev: %d", ret);
>>                 goto err_power_off;
>>         }
>> +       pm_runtime_idle(dev);
>>
>>         return 0;
>>
>> --
>> 2.7.4
>>

-- 
Best regards,
Bingbu Cao
