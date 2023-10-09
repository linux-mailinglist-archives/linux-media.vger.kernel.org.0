Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C0F97BDCE6
	for <lists+linux-media@lfdr.de>; Mon,  9 Oct 2023 14:53:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376561AbjJIMx5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Oct 2023 08:53:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376630AbjJIMxz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Oct 2023 08:53:55 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 560D2AC
        for <linux-media@vger.kernel.org>; Mon,  9 Oct 2023 05:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696855988;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WWfych/7Wf6yqPSH8gD4TB6K1Be3QCSJUhU9hsC83C0=;
        b=EVIPkj4YanrFteN6Sgh0EApFQLvNZOVHRQ0k7L/TvNhwyBAiiErDN6hEdZP4K0XsOWAnTL
        UNHS0pRWikNcC7lSV0odmX9xHXvPmj5YwNHOdy5hNwuRV8UuTAmieliiLBW6oebv44Ncl0
        SqvEPhtiTY5s6Ah23bcjseh+6f+eBY8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-_s0ZVWLbMP6m_qc09Ore1g-1; Mon, 09 Oct 2023 08:53:07 -0400
X-MC-Unique: _s0ZVWLbMP6m_qc09Ore1g-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9b2e3f315d5so495611166b.1
        for <linux-media@vger.kernel.org>; Mon, 09 Oct 2023 05:53:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696855986; x=1697460786;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WWfych/7Wf6yqPSH8gD4TB6K1Be3QCSJUhU9hsC83C0=;
        b=IlIHAPeCyQTDqo7fYBieUF3484C477DifMozrkFJvGZkTkTdC3Q2IPabJmWF0gj6aL
         tNuL5kHG3L0vhSDSVSJRmKkss9X0hP4d8RWSsVYJBKb136NUwmqIyPj2NMxhRN9JIEGJ
         17x+HCuVMHwFsNxP3RHuvyjqdpV9p/3KdU87aAfPRYkfHUgifQQonLGn7xZ4Dc4JOCCw
         JytyenIrMZcy5czrI3LA24phGkPTUQGkVWG6i5TaiTW1WqdHZwu2bkn88xNaSQaD38BC
         iOQJKP2IlOElV1gUNVud3EjBN2bfdagJIVtdfUiXDX6TdRdncuLkUXkC50TLfWhzPqil
         WdqQ==
X-Gm-Message-State: AOJu0Yy4A4QckjN/2eSf+E91BJ7CcWMwAvIcCdPJT3iencaNK9fx6aOZ
        csEBpNTSdcDbFavBJAja1gYyAfe3X/6gqxSqI37EsLSBVg8n+i/zt3Erx8VVshvhE9f9PlX31T0
        KCvaJSFVe4r3z2NbcsUhixcE=
X-Received: by 2002:a17:906:e218:b0:9b2:be5e:3674 with SMTP id gf24-20020a170906e21800b009b2be5e3674mr10113652ejb.36.1696855985987;
        Mon, 09 Oct 2023 05:53:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELhguk6JpGFGYSO9zx9akb98BpA64o7T7Xp76iowzxYQjglHCjOd2PP2wBHDI6HrQZeydMQQ==
X-Received: by 2002:a17:906:e218:b0:9b2:be5e:3674 with SMTP id gf24-20020a170906e21800b009b2be5e3674mr10113635ejb.36.1696855985589;
        Mon, 09 Oct 2023 05:53:05 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id kt13-20020a170906aacd00b009a5f1d15644sm6601477ejb.119.2023.10.09.05.53.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 05:53:04 -0700 (PDT)
Message-ID: <db9e3071-4bf6-0534-b7e2-0bcac92be025@redhat.com>
Date:   Mon, 9 Oct 2023 14:53:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 00/15] Intel IPU6 and IPU6 input system drivers
Content-Language: en-US, nl
To:     Bingbu Cao <bingbu.cao@linux.intel.com>,
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
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <0693c525-f260-2885-239f-41d26247c1fa@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu,

On 10/9/23 14:25, Bingbu Cao wrote:
> 
> Hans and Laurent,
> 
> On 10/3/23 1:41 AM, Hans de Goede wrote:
>> Hi,
>>
>> On 10/2/23 19:38, Laurent Pinchart wrote:
>>> On Mon, Oct 02, 2023 at 07:19:13PM +0200, Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 9/4/23 05:13, Cao, Bingbu wrote:
>>>>> Hans,
>>>>>
>>>>> Thanks for your test and report.
>>>>>
>>>>> I have made some changes locally which will support the latest
>>>>> v4l2-async APIs, I will also add the fix for this issue and merge
>>>>> them in v3.
>>>>
>>>> I have been trying to make rawbayer capture with the mainline isys code
>>>> work in libcamera and I have hit several short comings in the ipu6-isys
>>>> code. I have attached 3 patches to fix various issues please integrate
>>>> these into the next version of this series.
>>>
>>> They look good to me.
>>
>> Actually I just realized I forgot to commit + squash in a bug fix:
>>
>>>> Talking about the next version of this series, I think it would be
>>>> good to post a new version soon ?
>>>>
>>>
>>>> From 14f42fd3071a7aba8b83b98802ca3b413794296d Mon Sep 17 00:00:00 2001
>>>> From: Hans de Goede <hdegoede@redhat.com>
>>>> Date: Mon, 2 Oct 2023 16:37:11 +0200
>>>> Subject: [PATCH 1/3] media: intel/ipu6: Add mbus code filtering to isys
>>>>  /dev/video enum_fmt
>>>>
>>>> Add mbus code filtering to ipu6_isys_vidioc_enum_fmt().
>>>>
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>> ---
>>>>  .../media/pci/intel/ipu6/ipu6-isys-video.c    | 29 +++++++++++++++----
>>>>  1 file changed, 23 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
>>>> index dc1605491352..20fd03f6f204 100644
>>>> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
>>>> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
>>>> @@ -130,14 +130,31 @@ int ipu6_isys_vidioc_querycap(struct file *file, void *fh,
>>>>  int ipu6_isys_vidioc_enum_fmt(struct file *file, void *fh,
>>>>  			      struct v4l2_fmtdesc *f)
>>>>  {
>>>> -	if (f->index >= ARRAY_SIZE(ipu6_isys_pfmts))
>>>> -		return -EINVAL;
>>>> +	unsigned int i, found = 0;
>>>>  
>>>> -	f->flags = 0;
>>>> -	f->pixelformat = ipu6_isys_pfmts[f->index].pixelformat;
>>>> -	f->mbus_code = ipu6_isys_pfmts[f->index].code;
>>>> +	if (!f->mbus_code) {
>>>> +		if (f->index >= ARRAY_SIZE(ipu6_isys_pfmts))
>>>> +			return -EINVAL;
>>>>  
>>>> -	return 0;
>>>> +		f->flags = 0;
>>>> +		f->pixelformat = ipu6_isys_pfmts[f->index].pixelformat;
>>>> +		f->mbus_code = ipu6_isys_pfmts[f->index].code;
>>
>> There is a:
>> 		return 0;
>>
>> missing here.		
>>
>>>> +	}
>>>> +
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>>>> +	for (i = 0; i < ARRAY_SIZE(ipu6_isys_pfmts); i++) {
>>>> +		if (f->mbus_code != ipu6_isys_pfmts[i].code)
>>>> +			continue;
>>>> +
>>>> +		if (f->index == found) {
>>>> +			f->flags = 0;
>>>> +			f->pixelformat = ipu6_isys_pfmts[i].pixelformat;
>>>> +			return 0;
>>>> +		}
>>>> +
>>>> +		found++;
>>>> +	}
> 
> A little confused here -
> 
> If the `mbus_code` argument here is not zero, does the user expect that
> the first try (f->index == 0) should be found and return? `found` is
> always 0 here?

Notice how formats where:

		if (f->mbus_code != ipu6_isys_pfmts[i].code)

Is true are skipped:

		if (f->mbus_code != ipu6_isys_pfmts[i].code)
			continue;

The idea is that for (f->index == 0) the first format
matching the passed in mbus_code is returned and then
for  (f->index == 1) the second format matching the passed
in mbus_code is returned, etc.

In practice this means that e.g. for a mbus_code for
a 10bit raw bayer format both the padded (one 10 bits
pixel in each 16bit integer) and packed formats are
returned.


> My understanding is - user will try to enum again if return -EINVAL.

No, -EINVAL means that the end of the list of
formats has been reached, so the user keeps
calling this function with higher
f->index values until -EINVAL is returned.

Regards,

Hans





> 
>>>> +
>>>> +	return -EINVAL;
>>>>  }
>>>>
> 
> 
> <snip>

