Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A64D27BD354
	for <lists+linux-media@lfdr.de>; Mon,  9 Oct 2023 08:26:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345206AbjJIG0i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Oct 2023 02:26:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345168AbjJIG0h (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Oct 2023 02:26:37 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC1D7A2
        for <linux-media@vger.kernel.org>; Sun,  8 Oct 2023 23:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696832795; x=1728368795;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=ZbGXxIHSkJFHNBGvORHmxc658GtvdevGlTrWBH40xZs=;
  b=BgdsWbw676IKjc36bO253hRi8yXooiRP94tXH86Ypw/G+yCnO71p+HVZ
   +sslgNgcw4+/HTMtBfRkSWPaMQd8uZ1ztnvG9FyNd7sxyFWkxXEQ9UX25
   XFXluP40T1E1p84OScG70t/LDOkQwoVGSZXM7/lzolEsNubdQB0MhkjMT
   CvKKq8pkx8Cl9inYUWHDxTwQSadjfhuSn/0ScN1rUbMEzcm24stXo2oEX
   O+UcqsB++u63qRfU6kRkj7FjwWqObLn1cq5JhnwVtoB8ovOgIq0AgqOk/
   b9/f1mYRbfVt6+r0CJ5J9Zw7OLTez+mcDJnYSfJvlXAnXoG6vNVv9eSEw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="387941856"
X-IronPort-AV: E=Sophos;i="6.03,209,1694761200"; 
   d="scan'208";a="387941856"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2023 23:26:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="729557330"
X-IronPort-AV: E=Sophos;i="6.03,209,1694761200"; 
   d="scan'208";a="729557330"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.146]) ([10.238.232.146])
  by orsmga006.jf.intel.com with ESMTP; 08 Oct 2023 23:26:31 -0700
Subject: Re: [PATCH 00/15] Intel IPU6 and IPU6 input system drivers
To:     Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     "Cao, Bingbu" <bingbu.cao@intel.com>,
        Claus Stovgaard <claus.stovgaard@gmail.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
        "tfiga@chromium.org" <tfiga@chromium.org>,
        "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
        "Wang, Hongju" <hongju.wang@intel.com>
References: <769ebe9f8eb88b2c07eae5910fc7d79c1ff888cb.camel@gmail.com>
 <5fb07c7d-390c-d7ae-c74b-8e03c75f636c@linux.intel.com>
 <0a381077-c07a-ed40-c53e-5e36177bd5f2@linux.intel.com>
 <907f992d4e333f090418f39ebd59bf8ac1fb5e3f.camel@gmail.com>
 <d451bbec67358373ca8495544cc0802233108a03.camel@gmail.com>
 <1d03c5f9-1813-40f0-f280-520e2da38e09@hansg.org>
 <1d46186b-24a6-3ae9-ccc1-0ada0f068313@redhat.com>
 <253b5ba6-d44d-4ee1-8c18-44159632d023@redhat.com>
 <DM8PR11MB565393F11EDB68BB5784661C99E9A@DM8PR11MB5653.namprd11.prod.outlook.com>
 <bc4a6204-6487-9403-243d-6f0a1b20e8ab@redhat.com>
 <20231002173841.GD10113@pendragon.ideasonboard.com>
 <2cd7e607-88f0-d173-3423-5ef3f760bd19@redhat.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <9912e213-4289-6d3d-1b58-9cd7725c4d0a@linux.intel.com>
Date:   Mon, 9 Oct 2023 14:23:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2cd7e607-88f0-d173-3423-5ef3f760bd19@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hans,

Thanks for your patch.

On 10/3/23 1:41 AM, Hans de Goede wrote:
> Hi,
> 
> On 10/2/23 19:38, Laurent Pinchart wrote:
>> On Mon, Oct 02, 2023 at 07:19:13PM +0200, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 9/4/23 05:13, Cao, Bingbu wrote:
>>>> Hans,
>>>>
>>>> Thanks for your test and report.
>>>>
>>>> I have made some changes locally which will support the latest
>>>> v4l2-async APIs, I will also add the fix for this issue and merge
>>>> them in v3.
>>>
>>> I have been trying to make rawbayer capture with the mainline isys code
>>> work in libcamera and I have hit several short comings in the ipu6-isys
>>> code. I have attached 3 patches to fix various issues please integrate
>>> these into the next version of this series.
>>
>> They look good to me.
> 
> Actually I just realized I forgot to commit + squash in a bug fix:
> 
>>> Talking about the next version of this series, I think it would be
>>> good to post a new version soon ?
>>>
>>
>>> From 14f42fd3071a7aba8b83b98802ca3b413794296d Mon Sep 17 00:00:00 2001
>>> From: Hans de Goede <hdegoede@redhat.com>
>>> Date: Mon, 2 Oct 2023 16:37:11 +0200
>>> Subject: [PATCH 1/3] media: intel/ipu6: Add mbus code filtering to isys
>>>  /dev/video enum_fmt
>>>
>>> Add mbus code filtering to ipu6_isys_vidioc_enum_fmt().
>>>
>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>> ---
>>>  .../media/pci/intel/ipu6/ipu6-isys-video.c    | 29 +++++++++++++++----
>>>  1 file changed, 23 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
>>> index dc1605491352..20fd03f6f204 100644
>>> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
>>> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
>>> @@ -130,14 +130,31 @@ int ipu6_isys_vidioc_querycap(struct file *file, void *fh,
>>>  int ipu6_isys_vidioc_enum_fmt(struct file *file, void *fh,
>>>  			      struct v4l2_fmtdesc *f)
>>>  {
>>> -	if (f->index >= ARRAY_SIZE(ipu6_isys_pfmts))
>>> -		return -EINVAL;
>>> +	unsigned int i, found = 0;
>>>  
>>> -	f->flags = 0;
>>> -	f->pixelformat = ipu6_isys_pfmts[f->index].pixelformat;
>>> -	f->mbus_code = ipu6_isys_pfmts[f->index].code;
>>> +	if (!f->mbus_code) {
>>> +		if (f->index >= ARRAY_SIZE(ipu6_isys_pfmts))
>>> +			return -EINVAL;
>>>  
>>> -	return 0;
>>> +		f->flags = 0;
>>> +		f->pixelformat = ipu6_isys_pfmts[f->index].pixelformat;
>>> +		f->mbus_code = ipu6_isys_pfmts[f->index].code;
> 
> There is a:
> 		return 0;
> 
> missing here.		
> 

I will squash them into v2.

>>> +	}
>>> +
> 
> Regards,
> 
> Hans
> 
> 
<snip>
-- 
Best regards,
Bingbu Cao
