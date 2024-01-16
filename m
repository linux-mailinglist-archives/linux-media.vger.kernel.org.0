Return-Path: <linux-media+bounces-3761-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1B182F28B
	for <lists+linux-media@lfdr.de>; Tue, 16 Jan 2024 17:43:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B05CB235AB
	for <lists+linux-media@lfdr.de>; Tue, 16 Jan 2024 16:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E466610976;
	Tue, 16 Jan 2024 16:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D6C4CT3Z"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEF51CA82
	for <linux-media@vger.kernel.org>; Tue, 16 Jan 2024 16:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705423402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NpjVHVAsVg7DCwoqimY0/yUn3djvZaQ/4c3OtMnsydU=;
	b=D6C4CT3Z0P/JxO+mBifo8KcclC8NkWcQpMf82uSA4x4Mjvt4iRvkHSuFsa9OgxCAiiep0S
	09M891uQxleO/Ll8o6LwHeVSyrmv+UO+bWlCGeWMpexoRPXgNmn5xa0fP/+LERReFzjR1Q
	fgHjY7gDw51OHaO2M8rFDs8Av3X5oIE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-241-7ja6IoDvOquu2u2wcYwYLQ-1; Tue, 16 Jan 2024 11:43:18 -0500
X-MC-Unique: 7ja6IoDvOquu2u2wcYwYLQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a2b762cfdafso360812166b.1
        for <linux-media@vger.kernel.org>; Tue, 16 Jan 2024 08:43:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705423397; x=1706028197;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NpjVHVAsVg7DCwoqimY0/yUn3djvZaQ/4c3OtMnsydU=;
        b=ryidgqdk8nF4JIv3+en16jI+NA0nVdgZpUo/8q1Xwk3TgOHn9U0CAG33aZoaofJ8tq
         Sh5whom7w560GlaEKSdTd4MyyxSGcPbolsOcYWe7LmztUYuUHb7zKMXLACZRPo0BGbNy
         g8Fcznze7nJ9lSogP5bn5LSscKl+ekdytKviQXmtKZvJYStZEFxHNiK8GbCapNEgbAK6
         bmwGs3ywo0DocUKIZI2PmFSQTOEM/UluBT2LiMvxlJMH/f3ammV/o7uPKXIduduYzxAz
         UqjvNgw0dqn9IsElrijORzd1WjSZsAQMJp8HAQcdrouRWKjxqLr9ZO6GT5DF9M+eYe/0
         9/Zw==
X-Gm-Message-State: AOJu0YzaDUJwDrUA1GLKu0iyzz4Sv8fV2VwnsoYuY8gZxfOvYyLwR9nn
	/iLMH1ebXfd7PiRm+k/E86C7GXTFYjdGn8juiO4XA1m6QyPziQ1SovXG1YUNjxhOj1SHD9Q2sIV
	DCdcxisHRXeO2TKj1dG8H3zm9xZm1uck=
X-Received: by 2002:a17:906:2995:b0:a27:7075:7613 with SMTP id x21-20020a170906299500b00a2770757613mr3731063eje.67.1705423397416;
        Tue, 16 Jan 2024 08:43:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGhv4f8IW7BS5BnasGWOJNzKT7WyjRc7rBPxoBE/dMmftoiZpE5bDhLXmuAGQi/enQXL3QaoQ==
X-Received: by 2002:a17:906:2995:b0:a27:7075:7613 with SMTP id x21-20020a170906299500b00a2770757613mr3731059eje.67.1705423397133;
        Tue, 16 Jan 2024 08:43:17 -0800 (PST)
Received: from ?IPV6:2001:1c00:2a07:3a01:6c4:9fb2:fbc:7029? (2001-1c00-2a07-3a01-06c4-9fb2-0fbc-7029.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:6c4:9fb2:fbc:7029])
        by smtp.gmail.com with ESMTPSA id f11-20020a170906084b00b00a2c32b6053dsm6677393ejd.166.2024.01.16.08.43.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jan 2024 08:43:16 -0800 (PST)
Message-ID: <62e438a9-522b-44e5-89ae-cf239b368369@redhat.com>
Date: Tue, 16 Jan 2024 17:43:15 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/15] Intel IPU6 and IPU6 input system drivers
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: bingbu.cao@intel.com, linux-media@vger.kernel.org,
 sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com,
 ilpo.jarvinen@linux.intel.com, claus.stovgaard@gmail.com,
 tomi.valkeinen@ideasonboard.com, tfiga@chromium.org,
 senozhatsky@chromium.org, andreaskleist@gmail.com,
 bingbu.cao@linux.intel.com, tian.shu.qiu@intel.com, hongju.wang@intel.com
References: <20240111065531.2418836-1-bingbu.cao@intel.com>
 <7dcbe5a7-408b-477b-b02d-e39b9ad1ab74@redhat.com>
 <20240116161840.GB16531@pendragon.ideasonboard.com>
 <0f649b91-7e3e-40b0-8b19-51658ba9fa5a@redhat.com>
 <20240116164202.GC16531@pendragon.ideasonboard.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240116164202.GC16531@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/16/24 17:42, Laurent Pinchart wrote:
> On Tue, Jan 16, 2024 at 05:38:15PM +0100, Hans de Goede wrote:
>> Hi,
>>
>> On 1/16/24 17:18, Laurent Pinchart wrote:
>>> On Tue, Jan 16, 2024 at 05:12:50PM +0100, Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 1/11/24 07:55, bingbu.cao@intel.com wrote:
>>>>> From: Bingbu Cao <bingbu.cao@intel.com>
>>>>>
>>>>> This patch series adds a driver for Intel IPU6 input system.
>>>>> IPU6 is the sixth generation of Imaging Processing Unit, it is a PCI
>>>>> device which can be found in some Intel Client Platforms. User can use
>>>>> IPU6 to capture images from MIPI camera sensors.
>>>>>
>>>>> IPU6 has its own firmware which exposes ABIs to driver, and communicates
>>>>> with CSE to do firmware authentication. IPU6 has its MMU hardware, so
>>>>> the driver sets up a page table to allow IPU6 DMA to access the system
>>>>> memory.
>>>>>
>>>>> IPU6 input system driver uses MC and V4L2 sub-device APIs besides V4L2.
>>>>> ---
>>>>> v2 -> v3:
>>>>>   - Add line-based metadata capture support
>>>>>   - Fix header files inclusion issues
>>>>>   - Fix the CSI2 timing calculation
>>>>>   - Fix crash when remove module during streaming
>>>>>   - Remove some unused code
>>>>>   - Use cross-referencing links in documentation
>>>>>   - Update Makefile to use ":=" for objects
>>>>>   - Fix several bugs and coding style issues
>>>>
>>>> So I've given this version a try on a Lenovo X1 yoga gen 8 with ov2740
>>>> sensor using the ongoing libcamera SoftISP work + this small patch
>>>> to enable the SoftISP on IPU6 :
>>>>
>>>> https://github.com/jwrdegoede/libcamera/commit/3172f3703cf7076390fbf86c3b43e388c2422b31
>>>>
>>>> things work fine when using patch 1-15 + 17 on top of 6.7, note
>>>> I'm skipping patch 16 ("media: ipu6/isys: support line-based
>>>> metadata capture support")" here!
>>>>
>>>> However when I instead apply the whole series on top of:
>>>> https://git.linuxtv.org/sailus/media_tree.git/log/?h=metadata
>>>>
>>>> Then things stop working, with the following errors
>>>> (I added extra error logging to figure out in which syscall
>>>> resetRoutingTable() fails and made libcamera ignore the routing
>>>> errors):
>>>>
>>>> [2:02:04.466310686] [8943] ERROR SimplePipeline simple.cpp:1443 GetRouting() failed -25
>>>> [2:02:04.466315975] [8943] ERROR SimplePipeline simple.cpp:1574 Failed to reset routes for /dev/v4l-subdev1: Inappropriate ioctl for device
>>>> [2:02:04.466366331] [8943] ERROR SimplePipeline simple.cpp:1443 GetRouting() failed -25
>>>> [2:02:04.466370025] [8943] ERROR SimplePipeline simple.cpp:1574 Failed to reset routes for /dev/v4l-subdev4: Inappropriate ioctl for device
>>>>  	[2:03:32.334708887] [8929]  INFO Camera camera.cpp:1183 configuring streams: (0) 1924x1088-BGR888
>>>> [2:03:32.335129023] [8943] ERROR SimplePipeline simple.cpp:1205 Unable to configure capture in 1932x1092-BA10 (got 0x0-@...)
>>>> Failed to configure camera.
>>>>
>>>> I was sorta assuming that the new metadata-stream support would
>>>> be backwards compatible for userspace without support for this,
>>>> so I think this is a bug ?
>>>
>>> The ABI has changed, it's not stable in mainline yet (which is why it
>>> requires a kernel code change to enable it, see
>>> https://git.linuxtv.org/sailus/media_tree.git/commit/?h=metadata&id=cc8be69a5c04b71bbf92fa26633ece13305ca451).
>>
>> Thanks. So I reverted this patch to have the streams subdev API disabled by default again,
>> after this the resetRouting errors are gone, but things still fail with:
>>
>> [2:03:32.335129023] [8943] ERROR SimplePipeline simple.cpp:1205 Unable to configure capture in 1932x1092-BA10 (got 0x0-@...)
>> Failed to configure camera.
>>
>> When using Sakari's metadata branch and including patch 16 from this series.
> 
> I'm working on updating libcamera to the latest routing API, I'll ask
> you to retest with the pipeline handler if you can when I'll be done.

Sounds good, thanks.

Regards,

Hans




