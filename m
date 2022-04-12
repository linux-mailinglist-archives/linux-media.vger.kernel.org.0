Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 637E34FDF2F
	for <lists+linux-media@lfdr.de>; Tue, 12 Apr 2022 14:04:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350261AbiDLMGG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Apr 2022 08:06:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354012AbiDLMET (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Apr 2022 08:04:19 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 402793E5E4
        for <linux-media@vger.kernel.org>; Tue, 12 Apr 2022 04:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649761569; x=1681297569;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=21BeDH4ycPfkIoVWkm+nqXIS4BuevH+M/AZYj89qgnI=;
  b=iYoTNYfhIU9gzQ3ezI9u2ZtPomSfXsZBrrA5ScWJ3+iLeHske8AUTp8o
   vU/nzT5kQNI2P9UD5vkSe89wDoVM/87uAH7Odz5Fef5L0gtVeIocGa2ox
   HtnJdE8zQ/rhReshyQWMd2kXPBAG8EbpG5jclrRp2/dw1L+d5mF5a2ckA
   Jl7YLk2HfnbFqdEdvaVehiZxRGNU9G1JH9Rt4sv/OMu1KbRbefU/z16La
   ZZpjKwSQSFSh2eVd/u4SaFNi0/QRs8PZ/OFecFwDm1jp6OFlgVPBcwTEG
   hla1GkvGRB8YRRAxYCEatHsfAnKEAEeUmOcx1fhLUM8xtHjAIYASTSsW6
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="244231514"
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; 
   d="scan'208";a="244231514"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2022 04:05:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; 
   d="scan'208";a="655061958"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.188]) ([10.238.232.188])
  by fmsmga002.fm.intel.com with ESMTP; 12 Apr 2022 04:05:31 -0700
Subject: Re: [PATCH] media: dw9768: activate runtime PM and turn off device
To:     Tomasz Figa <tfiga@chromium.org>,
        "Cao, Bingbu" <bingbu.cao@intel.com>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
References: <1634278119-32158-1-git-send-email-bingbu.cao@intel.com>
 <CAAFQd5Aykfdj-HPzsQOyQpbGBRhtTsoRm78XgpuGkFUx1joTMA@mail.gmail.com>
 <DM8PR11MB565395F554C6D1C4978EBC2A998E9@DM8PR11MB5653.namprd11.prod.outlook.com>
 <CAAFQd5B9hZNn4UuB8h0RLUwSxwTFGC219LFe8jGE1jDd+EfosA@mail.gmail.com>
 <CAAFQd5B_LTXa=ECg0wRzGLqGJaiz3HrY_C9BJgByj4QFTJzu-Q@mail.gmail.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <64cf6ebd-03d4-3cc2-5eed-bc723eb3214a@linux.intel.com>
Date:   Tue, 12 Apr 2022 19:05:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAAFQd5B_LTXa=ECg0wRzGLqGJaiz3HrY_C9BJgByj4QFTJzu-Q@mail.gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 4/12/22 5:39 PM, Tomasz Figa wrote:
> On Tue, Nov 16, 2021 at 1:57 PM Tomasz Figa <tfiga@chromium.org> wrote:
>>
>> On Fri, Nov 5, 2021 at 9:52 PM Cao, Bingbu <bingbu.cao@intel.com> wrote:
>>>
>>>> -----Original Message-----
>>>> From: Tomasz Figa <tfiga@chromium.org>
>>>> Sent: Friday, November 5, 2021 2:55 PM
>>>> To: Cao, Bingbu <bingbu.cao@intel.com>
>>>> Cc: linux-media@vger.kernel.org; sakari.ailus@linux.intel.com;
>>>> dongchun.zhu@mediatek.com; Qiu, Tian Shu <tian.shu.qiu@intel.com>;
>>>> bingbu.cao@linux.intel.com
>>>> Subject: Re: [PATCH] media: dw9768: activate runtime PM and turn off
>>>> device
>>>>
>>>> On Fri, Oct 15, 2021 at 3:12 PM Bingbu Cao <bingbu.cao@intel.com> wrote:
>>>>>
>>>>> When dw9768 working with ACPI systems, the dw9768 was turned by
>>>>> i2c-core during probe, driver need activate the PM runtime and ask
>>>>> runtime PM to turn off the device.
>>>>>
>>>>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
>>>>> ---
>>>>>  drivers/media/i2c/dw9768.c | 6 ++++++
>>>>>  1 file changed, 6 insertions(+)
>>>>>
>>>>> diff --git a/drivers/media/i2c/dw9768.c b/drivers/media/i2c/dw9768.c
>>>>> index c086580efac7..65c6acf3ced9 100644
>>>>> --- a/drivers/media/i2c/dw9768.c
>>>>> +++ b/drivers/media/i2c/dw9768.c
>>>>> @@ -469,6 +469,11 @@ static int dw9768_probe(struct i2c_client
>>>>> *client)
>>>>>
>>>>>         dw9768->sd.entity.function = MEDIA_ENT_F_LENS;
>>>>>
>>>>> +       /*
>>>>> +        * Device is already turned on by i2c-core with ACPI domain PM.
>>>>> +        * Attempt to turn off the device to satisfy the privacy LED
>>>> concerns.
>>>>> +        */
>>>>> +       pm_runtime_set_active(dev);
>>>>
>>>> This driver is used by non-ACPI systems as well. This change will make
>>>> the PM core not call the runtime_resume() callback provided by the
>>>> driver and the power would never be turned on on such systems.
>>>>
>>>
>>>> Wasn't the intention of Sakari's ACPI patches to allow bypassing the
>>>> ACPI domain power on at boot up and eliminate the need for this change?
>>>
>>> Tomasz, thanks for your review.
>>>
>>> The comment here is invalid, it should not be strongly related to the privacy
>>> LED concern. Anyway, the device should be turned off on ACPI and non-ACPI
>>> systems even without Sakari's changes.
>>>
>>> I am wondering how the driver work with PM core on non-ACPI system.
>>>
>>
>> On non-ACPI systems it's the driver which handles the power sequencing
>> of the chip so the regulators wouldn't be implicitly enabled by the
>> subsystem before (unless they're shared with some other device and the
>> corresponding driver enabled them).
> 
> It looks like this patch made into Linus' tree and broke the driver on
> ARM devices. Could we please revert it?

If revert the patch, the device will not work on ACPI system, is there some
other solution? Have no details about the failure on ARM device.

> 
> Best regards,
> Tomasz
> 
>>
>>>>
>>>> Best regards,
>>>> Tomasz
>>>>
>>>>>
>>>>>         pm_runtime_enable(dev);
>>>>>         if (!pm_runtime_enabled(dev)) {
>>>>>                 ret = dw9768_runtime_resume(dev); @@ -483,6 +488,7 @@
>>>>> static int dw9768_probe(struct i2c_client *client)
>>>>>                 dev_err(dev, "failed to register V4L2 subdev: %d",
>>>> ret);
>>>>>                 goto err_power_off;
>>>>>         }
>>>>> +       pm_runtime_idle(dev);
>>>>>
>>>>>         return 0;
>>>>>
>>>>> --
>>>>> 2.7.4
>>>>>

-- 
Best regards,
Bingbu Cao
