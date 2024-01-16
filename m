Return-Path: <linux-media+bounces-3759-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF93682F280
	for <lists+linux-media@lfdr.de>; Tue, 16 Jan 2024 17:38:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02A3E1C232B7
	for <lists+linux-media@lfdr.de>; Tue, 16 Jan 2024 16:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1B531C6A8;
	Tue, 16 Jan 2024 16:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ATL59kux"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE95A1C698
	for <linux-media@vger.kernel.org>; Tue, 16 Jan 2024 16:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705423101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bh/kx/BVUovYE3c9ZmC4MZrIUZAJ5BCKeAUaqiR/8sY=;
	b=ATL59kuxncn5yAj5Js1bYIzFZJs9LrTZkxE7vZ7i2Wu9kGu0C3J4MWMZ4exvsSrHH8ErSy
	lGXUygp9z901IXTlLvvMVrN0/5AHKAGPqO6gaTypywvQ6NAV+kry7PGOr2iwPb6Gn2Usae
	Rx+QJ5XhxS1y1ms+8NpyRMScUU0LLUc=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-113-uzI3ch6aNSm4bonzXPELDg-1; Tue, 16 Jan 2024 11:38:19 -0500
X-MC-Unique: uzI3ch6aNSm4bonzXPELDg-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2cceb983e83so77668421fa.3
        for <linux-media@vger.kernel.org>; Tue, 16 Jan 2024 08:38:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705423098; x=1706027898;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bh/kx/BVUovYE3c9ZmC4MZrIUZAJ5BCKeAUaqiR/8sY=;
        b=XHRxMkjxfWUehT6bgVCa7z37yR0UG1IJM1910G+9XNAUEQTAPsbubK3IkfpNejhG6e
         Jjo3xkUdPu1MvClz/qG1pj6LjjYfqgQOToAL2+R0mU3bcW4N+SDY3GNwa0EwS0ehfTMP
         31NQ2BX+6RpvM/oaGJoAWaK4fXeTnedgmf1H79I1npKaTIhKDO54zU6K30xofLDHdS2B
         fpCl6xanCi5RTswJMbU9BFr62ko6DE6JW2sG9qHgiO6X0NHQfpf58BDMtaIKR1F+CAYy
         byCN6i9EmTLs8Z4KyyouIEJtl9CSLhcKkRoanq9aFAWZeQok5cmyXbpXAnVCZTIlAh1O
         9s4A==
X-Gm-Message-State: AOJu0YynrkTw2OkigwEYgnX9IOILEMTNuL+2gs/9BkxoVB2fZFgg2d4Z
	8Rcjhq6kSINq7HqK7CbK9S2PkwD8wyRvBnt7GRpcVUvLc2Ab8kSwopxwj545DTXJ0bTIXcZE2io
	YUtkM5Ai+jJLAw+2H0n/6XYLGmAuT6ag=
X-Received: by 2002:a2e:9cc4:0:b0:2cd:aeab:d80d with SMTP id g4-20020a2e9cc4000000b002cdaeabd80dmr2390923ljj.51.1705423098209;
        Tue, 16 Jan 2024 08:38:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF8/yXd40R3PJvb+/2TcKuGcmUaIlzNaUCicOM5HjPSB2dvi0/skyi13GnuQjyUlwOMz3Nh1Q==
X-Received: by 2002:a2e:9cc4:0:b0:2cd:aeab:d80d with SMTP id g4-20020a2e9cc4000000b002cdaeabd80dmr2390914ljj.51.1705423097853;
        Tue, 16 Jan 2024 08:38:17 -0800 (PST)
Received: from ?IPV6:2001:1c00:2a07:3a01:6c4:9fb2:fbc:7029? (2001-1c00-2a07-3a01-06c4-9fb2-0fbc-7029.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:6c4:9fb2:fbc:7029])
        by smtp.gmail.com with ESMTPSA id y10-20020aa7ccca000000b005572a1159b9sm6906224edt.22.2024.01.16.08.38.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jan 2024 08:38:17 -0800 (PST)
Message-ID: <0f649b91-7e3e-40b0-8b19-51658ba9fa5a@redhat.com>
Date: Tue, 16 Jan 2024 17:38:15 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/15] Intel IPU6 and IPU6 input system drivers
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
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240116161840.GB16531@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/16/24 17:18, Laurent Pinchart wrote:
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
> The ABI has changed, it's not stable in mainline yet (which is why it
> requires a kernel code change to enable it, see
> https://git.linuxtv.org/sailus/media_tree.git/commit/?h=metadata&id=cc8be69a5c04b71bbf92fa26633ece13305ca451).

Thanks. So I reverted this patch to have the streams subdev API disabled by default again,
after this the resetRouting errors are gone, but things still fail with:

[2:03:32.335129023] [8943] ERROR SimplePipeline simple.cpp:1205 Unable to configure capture in 1932x1092-BA10 (got 0x0-@...)
Failed to configure camera.

When using Sakari's metadata branch and including patch 16 from this series.

I'll just use media_stage/master + this series minus patch 16 for now.

Regards,

Hans


> 
>> I would be happy to test any patches to fix this.
> 


