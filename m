Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19C9F7E5989
	for <lists+linux-media@lfdr.de>; Wed,  8 Nov 2023 15:56:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231133AbjKHO4e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Nov 2023 09:56:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231534AbjKHO4d (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Nov 2023 09:56:33 -0500
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB2061BE5
        for <linux-media@vger.kernel.org>; Wed,  8 Nov 2023 06:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699455391; x=1730991391;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=/8woytjOV5hLgZ3X7AmkDpzpZaMcws4bBqFAxhZSs/c=;
  b=Zoig3Dh1skclmgYM6q33F7nU6SXpkf0WFXmOIEIBXPgAjCpBRKkBUykG
   goRgJVPCDeVJm6bVlVgOWuHipxpC61QEnwVfV2XmorueOcPRNUI6gVDbT
   ULS+4DNsve+41PE7j0dMl+tJdtOH9aowxnAziFHPDPjuvwdMBZ02N7axl
   w0mfFaaI6HRk2KMsNY4Ofp+5mSAVqQctrzAp9+4vqD2SjTYxQT4ZDEn3m
   s8xnQ0UG090t8HidnTB6Gpl0hl0K773Lv2voy9NZWGriXbGGg3KZ6OaKP
   Z1KfFHPIKhAnqHrsWQmo0n7TsFykUSswrCccnEtvyLBitpmwYhjVG7lV0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="8431208"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; 
   d="scan'208";a="8431208"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2023 06:56:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="1010284352"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; 
   d="scan'208";a="1010284352"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.139]) ([10.238.232.139])
  by fmsmga006.fm.intel.com with ESMTP; 08 Nov 2023 06:56:26 -0800
Subject: Re: [PATCH v2 08/15] media: intel/ipu6: add IPU6 CSI2 receiver v4l2
 sub-device
To:     "Cao, Bingbu" <bingbu.cao@intel.com>,
        Andreas Helbech Kleist <andreaskleist@gmail.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>
Cc:     "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
        "claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>,
        "tfiga@chromium.org" <tfiga@chromium.org>,
        "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
        "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
        "Wang, Hongju" <hongju.wang@intel.com>
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
 <20231024112924.3934228-9-bingbu.cao@intel.com>
 <7c0a91f986baf62efcf0f021924653a00cdcc503.camel@gmail.com>
 <DM8PR11MB565383A795F071F50B04D1BF99A8A@DM8PR11MB5653.namprd11.prod.outlook.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <017f1495-a2f3-fb8b-5ee6-396ae5ac35bc@linux.intel.com>
Date:   Wed, 8 Nov 2023 22:51:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <DM8PR11MB565383A795F071F50B04D1BF99A8A@DM8PR11MB5653.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 11/8/23 10:50 PM, Cao, Bingbu wrote:
> Andreas,
> 
> ------------------------------------------------------------------------
> BRs,  
> Bingbu Cao 
> 
>> -----Original Message-----
>> From: Andreas Helbech Kleist <andreaskleist@gmail.com>
>> Sent: Wednesday, November 8, 2023 7:26 PM
>> To: Cao, Bingbu <bingbu.cao@intel.com>; linux-media@vger.kernel.org;
>> sakari.ailus@linux.intel.com; laurent.pinchart@ideasonboard.com
>> Cc: andriy.shevchenko@linux.intel.com; hdegoede@redhat.com;
>> ilpo.jarvinen@linux.intel.com; claus.stovgaard@gmail.com;
>> tfiga@chromium.org; senozhatsky@chromium.org;
>> tomi.valkeinen@ideasonboard.com; bingbu.cao@linux.intel.com; Qiu, Tian Shu
>> <tian.shu.qiu@intel.com>; Wang, Hongju <hongju.wang@intel.com>
>> Subject: Re: [PATCH v2 08/15] media: intel/ipu6: add IPU6 CSI2 receiver
>> v4l2 sub-device
>>
>> Hi Bingbu,
>>
>> On Tue, 2023-10-24 at 19:29 +0800, bingbu.cao@intel.com wrote:
>>> From: Bingbu Cao <bingbu.cao@intel.com>
>>>
>>> Input system CSI2 receiver is exposed as a v4l2 sub-device.
>>> Each CSI2 sub-device represent one single CSI2 hardware port which be
>>> linked with external sub-device such camera sensor by linked with ISYS
>>> CSI2's sink pad. CSI2 source pad is linked to the sink pad of video
>>> capture device.
>>>
>>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
>>> ---
>>>  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 654
>>> ++++++++++++++++++
>>>  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h |  81 +++
>>>  .../media/pci/intel/ipu6/ipu6-isys-subdev.c   | 379 ++++++++++
>>>  .../media/pci/intel/ipu6/ipu6-isys-subdev.h   |  58 ++
>>>  .../intel/ipu6/ipu6-platform-isys-csi2-reg.h  | 187 +++++
>>>  5 files changed, 1359 insertions(+)
>>>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
>>>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
>>>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
>>>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
>>>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-platform-isys-
>>> csi2-reg.h
>>>
>>> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
>>> b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
>>> new file mode 100644
>>> index 000000000000..0dedf3f51850
>>> --- /dev/null
>>> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
>> ...
>>>
>>> +
>>> +#define DIV_SHIFT      8
>>> +#define CSI2_ACCINV    8
>>> +
>>> +static u32 calc_timing(s32 a, s32 b, s64 link_freq, u32 accinv) {
>>> +       return accinv * a + (accinv * b * (500000000 >> DIV_SHIFT)
>>> +                            / (int32_t)(link_freq >> DIV_SHIFT)); }
>>
>> I think accinv should be s32 here. When accinv is unsigned, the expression
>> (accinv * b) becomes unsigned, and thus negative values of b gives
>> incorrect results.
> 
> accinv is always an unsigned value, so I think we don't need change the
> type of argument. Following usual arithmetic conversions, I think it needs
> a signed integer cast here. What do you think?

However, I can also follow your comments to change to s32. Thanks!
> 
> 
>>
>> This is different from e.g. https://github.com/intel/ipu6-drivers.
>>
>> /Andreas

-- 
Best regards,
Bingbu Cao
