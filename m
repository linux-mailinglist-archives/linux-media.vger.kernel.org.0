Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E96687BF120
	for <lists+linux-media@lfdr.de>; Tue, 10 Oct 2023 04:57:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1441862AbjJJC5f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Oct 2023 22:57:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379344AbjJJC5e (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Oct 2023 22:57:34 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F298B93
        for <linux-media@vger.kernel.org>; Mon,  9 Oct 2023 19:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696906653; x=1728442653;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=DRKOmXB0RTWRvFkOYb3sgdgkgF4BOTGZuGGuAwbo9pE=;
  b=nGtkX5nM1SmZfM8YmrYZwcGy7pXOOmnLeAK9PDnUfz99Nq/pwUWNO1Lb
   73KoRxo/6a7t+wdEEQ7rqN633UeCQpfJIrb8Jsbs8+ifkFylfM/b8uwSz
   /EGl0e5qqAGLQpLM0rpHsLhyhWm1joUFS010SWFuy97edoPQAxn0yTAAX
   bVrUx6TKT4S4955dtRn65EG/UNU5jW+aa7Xux5hLahs286MoEqPYTHPrg
   +4yJgS73phQGRBdDrLDcp9B85v509lDPUxDbk5jN798C8il0+WgKhH2hV
   TXqLCPXXiMY2oucUCJbHkmM9q85rwfmUdLoGlrqkWAkfWxJRyMr77Lp/Z
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="388167520"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="388167520"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 19:57:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="1000491047"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="1000491047"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.146]) ([10.238.232.146])
  by fmsmga006.fm.intel.com with ESMTP; 09 Oct 2023 19:57:28 -0700
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
 <0693c525-f260-2885-239f-41d26247c1fa@linux.intel.com>
 <db9e3071-4bf6-0534-b7e2-0bcac92be025@redhat.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <9868d2d7-880a-990d-8c61-7a87c989a45b@linux.intel.com>
Date:   Tue, 10 Oct 2023 10:54:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <db9e3071-4bf6-0534-b7e2-0bcac92be025@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hans,

On 10/9/23 8:53 PM, Hans de Goede wrote:
> Hi Bingbu,
> 
> On 10/9/23 14:25, Bingbu Cao wrote:
>>
>> Hans and Laurent,
>>
>> On 10/3/23 1:41 AM, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 10/2/23 19:38, Laurent Pinchart wrote:
>>>> On Mon, Oct 02, 2023 at 07:19:13PM +0200, Hans de Goede wrote:
>>>>> Hi,
>>>>>
>>>>> On 9/4/23 05:13, Cao, Bingbu wrote:
>>>>>> Hans,
>>>>>>
>>>>>> Thanks for your test and report.
>>>>>>
>>>>>> I have made some changes locally which will support the latest
>>>>>> v4l2-async APIs, I will also add the fix for this issue and merge
>>>>>> them in v3.
>>>>>
>>>>> I have been trying to make rawbayer capture with the mainline isys code
>>>>> work in libcamera and I have hit several short comings in the ipu6-isys
>>>>> code. I have attached 3 patches to fix various issues please integrate
>>>>> these into the next version of this series.
>>>>
>>>> They look good to me.
>>>
>>> Actually I just realized I forgot to commit + squash in a bug fix:
>>>
>>>>> Talking about the next version of this series, I think it would be
>>>>> good to post a new version soon ?
>>>>>
>>>>
>>>>> From 14f42fd3071a7aba8b83b98802ca3b413794296d Mon Sep 17 00:00:00 2001
>>>>> From: Hans de Goede <hdegoede@redhat.com>
>>>>> Date: Mon, 2 Oct 2023 16:37:11 +0200
>>>>> Subject: [PATCH 1/3] media: intel/ipu6: Add mbus code filtering to isys
>>>>>  /dev/video enum_fmt
>>>>>
>>>>> Add mbus code filtering to ipu6_isys_vidioc_enum_fmt().
>>>>>
>>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>>> ---
>>>>>  .../media/pci/intel/ipu6/ipu6-isys-video.c    | 29 +++++++++++++++----
>>>>>  1 file changed, 23 insertions(+), 6 deletions(-)
>>>>>
>>>>> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
>>>>> index dc1605491352..20fd03f6f204 100644
>>>>> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
>>>>> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
>>>>> @@ -130,14 +130,31 @@ int ipu6_isys_vidioc_querycap(struct file *file, void *fh,
>>>>>  int ipu6_isys_vidioc_enum_fmt(struct file *file, void *fh,
>>>>>  			      struct v4l2_fmtdesc *f)
>>>>>  {
>>>>> -	if (f->index >= ARRAY_SIZE(ipu6_isys_pfmts))
>>>>> -		return -EINVAL;
>>>>> +	unsigned int i, found = 0;
>>>>>  
>>>>> -	f->flags = 0;
>>>>> -	f->pixelformat = ipu6_isys_pfmts[f->index].pixelformat;
>>>>> -	f->mbus_code = ipu6_isys_pfmts[f->index].code;
>>>>> +	if (!f->mbus_code) {
>>>>> +		if (f->index >= ARRAY_SIZE(ipu6_isys_pfmts))
>>>>> +			return -EINVAL;
>>>>>  
>>>>> -	return 0;
>>>>> +		f->flags = 0;
>>>>> +		f->pixelformat = ipu6_isys_pfmts[f->index].pixelformat;
>>>>> +		f->mbus_code = ipu6_isys_pfmts[f->index].code;
>>>
>>> There is a:
>>> 		return 0;
>>>
>>> missing here.		
>>>
>>>>> +	}
>>>>> +
>>>
>>> Regards,
>>>
>>> Hans
>>>
>>>
>>>
>>>>> +	for (i = 0; i < ARRAY_SIZE(ipu6_isys_pfmts); i++) {
>>>>> +		if (f->mbus_code != ipu6_isys_pfmts[i].code)
>>>>> +			continue;
>>>>> +
>>>>> +		if (f->index == found) {
>>>>> +			f->flags = 0;
>>>>> +			f->pixelformat = ipu6_isys_pfmts[i].pixelformat;
>>>>> +			return 0;
>>>>> +		}
>>>>> +
>>>>> +		found++;
>>>>> +	}
>>
>> A little confused here -
>>
>> If the `mbus_code` argument here is not zero, does the user expect that
>> the first try (f->index == 0) should be found and return? `found` is
>> always 0 here?
> 
> Notice how formats where:
> 
> 		if (f->mbus_code != ipu6_isys_pfmts[i].code)
> 
> Is true are skipped:
> 
> 		if (f->mbus_code != ipu6_isys_pfmts[i].code)
> 			continue;
> 
> The idea is that for (f->index == 0) the first format
> matching the passed in mbus_code is returned and then
> for  (f->index == 1) the second format matching the passed
> in mbus_code is returned, etc.

Ack. So for 1:1 match case, is (f->index == 0) expected for all formats?

> 
> In practice this means that e.g. for a mbus_code for
> a 10bit raw bayer format both the padded (one 10 bits
> pixel in each 16bit integer) and packed formats are
> returned.
> 
> 
>> My understanding is - user will try to enum again if return -EINVAL.
> 
> No, -EINVAL means that the end of the list of
> formats has been reached, so the user keeps
> calling this function with higher
> f->index values until -EINVAL is returned.

So for libcamera, it's trying to enumerate all the pixel formats,
Is it trying to enumerate from index 0 for each `mbus_code` or continue next
format enumeration from higher index?

> 
> Regards,
> 
> Hans
> 
> 
> 
> 
> 
>>
>>>>> +
>>>>> +	return -EINVAL;
>>>>>  }
>>>>>
>>
>>
>> <snip>
> 

-- 
Best regards,
Bingbu Cao
