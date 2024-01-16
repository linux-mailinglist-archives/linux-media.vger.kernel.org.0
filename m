Return-Path: <linux-media+bounces-3763-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 85ADE82F2B4
	for <lists+linux-media@lfdr.de>; Tue, 16 Jan 2024 17:57:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4B981C2373A
	for <lists+linux-media@lfdr.de>; Tue, 16 Jan 2024 16:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EBC31CA86;
	Tue, 16 Jan 2024 16:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NknM//e3"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5181C6A1
	for <linux-media@vger.kernel.org>; Tue, 16 Jan 2024 16:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705424238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o4dTRWvuPi/O+JNzlX7Bz9xFyZP/pCKAA9iHB2fIN8I=;
	b=NknM//e300g+1QbpK5omZeqB5kUSSbW0D6H7hTvNJ08g1KQ1uObAH694tok4FYriMEKjZ7
	Taw9RVortpLUVPON97Qj3BXsSlacQ4i/74gO3Rv5thmreP8XaMVmsreCKRBST0i0K3ahZ+
	M2yfOxW2uVaAKAMa7d2UdUeZLlQx+vU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-WYT2PurOP5yURBn0NNMAWg-1; Tue, 16 Jan 2024 11:57:17 -0500
X-MC-Unique: WYT2PurOP5yURBn0NNMAWg-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5597030a91fso980049a12.2
        for <linux-media@vger.kernel.org>; Tue, 16 Jan 2024 08:57:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705424236; x=1706029036;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o4dTRWvuPi/O+JNzlX7Bz9xFyZP/pCKAA9iHB2fIN8I=;
        b=n4191IjeFWSG5dcVddT8Wba30U49xnqcx+RGOXu3QZiuMZBYLlJQXTUld2JhtPRl/h
         uQzMHA8qIxHzueWb/vvh8ZxDD1F/QfmS7kFGl+anjIu0UlzpLEnRP+D/rzaXnG//HRi+
         SYmvFHmALtnKN5ABT5KNerNp9VHCs+1W6CAbfOjauJZep7nyNnTW6syjvjdsqZpNb1MV
         xBChAMahIuNM8jj9qFBHFB+EWn8txBkJDip0FSv1ywtoDZiePLEg/FS3IMTuI3tdydLV
         3xDR0SrfjqJc0rPJRJx72PZJDM/8M37TIoo1mQOfXuxdLcNmXWDVHc+Hd8GudUMHpUXx
         Euqg==
X-Gm-Message-State: AOJu0Yzi+PLzGNiyDIH2EsxjS0tr/xqF0ytr9+axyx3JTfD82opF0kc+
	yjgvAeSafWpttIyNvQ0bVOsUxGl2aDZEeadoLMaa8pDeODfJ4mEFn1lDGUqYxwERdp8jPIWODFb
	wKiL2Ba0fr0hW5gAnKy99plEfFkRgRBc=
X-Received: by 2002:aa7:c2da:0:b0:555:936e:feb6 with SMTP id m26-20020aa7c2da000000b00555936efeb6mr3631002edp.22.1705424235997;
        Tue, 16 Jan 2024 08:57:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF6hRVWFFfFMFy1/neoKAbOUryBDWYyAzL0SBhVB2SntJuYgu9RgI/TVKbl8zvERQLQI0pj4w==
X-Received: by 2002:aa7:c2da:0:b0:555:936e:feb6 with SMTP id m26-20020aa7c2da000000b00555936efeb6mr3630996edp.22.1705424235709;
        Tue, 16 Jan 2024 08:57:15 -0800 (PST)
Received: from ?IPV6:2001:1c00:2a07:3a01:6c4:9fb2:fbc:7029? (2001-1c00-2a07-3a01-06c4-9fb2-0fbc-7029.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:6c4:9fb2:fbc:7029])
        by smtp.gmail.com with ESMTPSA id x10-20020a056402414a00b00559bcba330dsm498746eda.86.2024.01.16.08.57.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jan 2024 08:57:15 -0800 (PST)
Message-ID: <008f30be-7d1b-498c-88fa-d8cf061e19fa@redhat.com>
Date: Tue, 16 Jan 2024 17:57:14 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/15] Intel IPU6 and IPU6 input system drivers
Content-Language: en-US
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: bingbu.cao@intel.com, linux-media@vger.kernel.org,
 laurent.pinchart@ideasonboard.com, andriy.shevchenko@linux.intel.com,
 ilpo.jarvinen@linux.intel.com, claus.stovgaard@gmail.com,
 tomi.valkeinen@ideasonboard.com, tfiga@chromium.org,
 senozhatsky@chromium.org, andreaskleist@gmail.com,
 bingbu.cao@linux.intel.com, tian.shu.qiu@intel.com, hongju.wang@intel.com
References: <20240111065531.2418836-1-bingbu.cao@intel.com>
 <7dcbe5a7-408b-477b-b02d-e39b9ad1ab74@redhat.com>
 <Zaa0vW_TZlee2-_b@kekkonen.localdomain>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Zaa0vW_TZlee2-_b@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/16/24 17:54, Sakari Ailus wrote:
> Hi Hans,
> 
> On Tue, Jan 16, 2024 at 05:12:50PM +0100, Hans de Goede wrote:
>> Hi,
>>
>> On 1/11/24 07:55, bingbu.cao@intel.com wrote:
>>> From: Bingbu Cao <bingbu.cao@intel.com>
>>>
>>> This patch series adds a driver for Intel IPU6 input system.
>>> IPU6 is the sixth generation of Imaging Processing Unit, it is a PCI
>>> device which can be found in some Intel Client Platforms. User can use
>>> IPU6 to capture images from MIPI camera sensors.
>>>
>>> IPU6 has its own firmware which exposes ABIs to driver, and communicates
>>> with CSE to do firmware authentication. IPU6 has its MMU hardware, so
>>> the driver sets up a page table to allow IPU6 DMA to access the system
>>> memory.
>>>
>>> IPU6 input system driver uses MC and V4L2 sub-device APIs besides V4L2.
>>> ---
>>> v2 -> v3:
>>>   - Add line-based metadata capture support
>>>   - Fix header files inclusion issues
>>>   - Fix the CSI2 timing calculation
>>>   - Fix crash when remove module during streaming
>>>   - Remove some unused code
>>>   - Use cross-referencing links in documentation
>>>   - Update Makefile to use ":=" for objects
>>>   - Fix several bugs and coding style issues
>>
>> So I've given this version a try on a Lenovo X1 yoga gen 8 with ov2740
>> sensor using the ongoing libcamera SoftISP work + this small patch
>> to enable the SoftISP on IPU6 :
>>
>> https://github.com/jwrdegoede/libcamera/commit/3172f3703cf7076390fbf86c3b43e388c2422b31
>>
>> things work fine when using patch 1-15 + 17 on top of 6.7, note
>> I'm skipping patch 16 ("media: ipu6/isys: support line-based
>> metadata capture support")" here!
>>
>> However when I instead apply the whole series on top of:
>> https://git.linuxtv.org/sailus/media_tree.git/log/?h=metadata
>>
>> Then things stop working, with the following errors
>> (I added extra error logging to figure out in which syscall
>> resetRoutingTable() fails and made libcamera ignore the routing
>> errors):
>>
>> [2:02:04.466310686] [8943] ERROR SimplePipeline simple.cpp:1443 GetRouting() failed -25
>> [2:02:04.466315975] [8943] ERROR SimplePipeline simple.cpp:1574 Failed to reset routes for /dev/v4l-subdev1: Inappropriate ioctl for device
>> [2:02:04.466366331] [8943] ERROR SimplePipeline simple.cpp:1443 GetRouting() failed -25
>> [2:02:04.466370025] [8943] ERROR SimplePipeline simple.cpp:1574 Failed to reset routes for /dev/v4l-subdev4: Inappropriate ioctl for device
>>  	[2:03:32.334708887] [8929]  INFO Camera camera.cpp:1183 configuring streams: (0) 1924x1088-BGR888
>> [2:03:32.335129023] [8943] ERROR SimplePipeline simple.cpp:1205 Unable to configure capture in 1932x1092-BA10 (got 0x0-@...)
>> Failed to configure camera.
>>
>> I was sorta assuming that the new metadata-stream support would
>> be backwards compatible for userspace without support for this,
>> so I think this is a bug ?
> 
> That's the intention when it comes to the kernel APIs indeed.
> 
> I wonder how the simple pipeline handler works with this, does it try to
> configure both streams all the way from the internal source pad to the
> video node? This will certainly fail without metadata support in the ISYS
> driver. Just guessing the cause though. An extra stream from the source pad
> won't fail pipeline validation.
> 
> I should be able to set up a system to test this, too.

I did include Bingbu's patch to add metadata to the isys driver for my
testing (and I also tried reverting just that patch). I think the issue
might be that libcamera already has some streams awareness based on
an older streams patch-set.

I'll retest when Laurent's branch for this is ready.

Regards,

Hans


