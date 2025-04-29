Return-Path: <linux-media+bounces-31254-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F0991AA025A
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 08:05:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B95403B391B
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 06:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE6892741B7;
	Tue, 29 Apr 2025 06:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b="e+9QXw0R"
X-Original-To: linux-media@vger.kernel.org
Received: from dane.soverin.net (dane.soverin.net [185.233.34.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4594C25D8E8;
	Tue, 29 Apr 2025 06:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.34.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745906712; cv=none; b=uset6BtH+PP/AILfkskeZzQeBXrB5pKs3XNX4TB8xJo6H78IHWd2k4vKAZCC3GCprMO6fDu662UsIVjIBcoHcpcjlm97BZrPRolWuZKeL5M2sUAtI7xQG+UGYX6hoqcxsEZLsS2F/+JxXd3TBXxHPGPOfVSzUX6AVabhCkvF/MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745906712; c=relaxed/simple;
	bh=pr3dVxhRQnU5LR5K4re3AckDFTUIwxxF8FLy02mZRus=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ExT+s+0oPUUCqlHuGWj+XiD7GCWA11JdVzfWDk3PgoNwXpV+vL9ePCUFPQ6qsDNlrjQeEwrR3Mlz99t5zmzmvoL5PD3AOZHDJ4VK1BNHhxOLAwrTwjCUYJw10qjalf08speBJ0SKXW1T0mg7/Vmx+yLBDRewaYNbk/jNz1EXKDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl; spf=pass smtp.mailfrom=jjverkuil.nl; dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b=e+9QXw0R; arc=none smtp.client-ip=185.233.34.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jjverkuil.nl
Received: from smtp.freedom.nl (unknown [10.10.4.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by dane.soverin.net (Postfix) with ESMTPS id 4ZmqXp4TqKznbs;
	Tue, 29 Apr 2025 06:04:58 +0000 (UTC)
Received: from smtp.freedom.nl (smtp.freedom.nl [10.10.4.107]) by freedom.nl (Postfix) with ESMTPSA id 4ZmqXn5FD3z7x;
	Tue, 29 Apr 2025 06:04:57 +0000 (UTC)
Authentication-Results: smtp.freedom.nl;
	dkim=pass (2048-bit key; unprotected) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.a=rsa-sha256 header.s=soverin1 header.b=e+9QXw0R;
	dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jjverkuil.nl;
	s=soverin1; t=1745906698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=QXMwiC3I09Do5NBdksSEJp6/mYMhrwfaWrE5Ub73GzU=;
	b=e+9QXw0Rb4FjwMNCq0NLOd/9YycahraqrNMqRDloLJPM07m07K8QeXGinMPy45Iqzy9xLC
	5Hu9mOkzHeuf4nD7yrBnN+nXDnpufHaPggOSi/ZR8hPd6AlLJlxNqYRbdXBydLteIMbhQ8
	uZOSWH2RYBJLwo6jLXW2g9QKGReOMe+DbKuuJzBr/nGiifW73iQow64fIutscXmsUl52Xm
	GHpo3Aj7qdtz0RRTGxxulGC6DlcURVRHok3Ms1KbP3/39N5qAmKFw1x9F7doMg+KtXc4+a
	m4UBWrwgOORnjeBPvu9IX86AV0QRhziFa2w8OoupMU/5zCgEi7JijgYw6L9Nxw==
X-CM-Envelope: MS4xfBssYEzDsRMBC7Z6S/pr+mPX1j/jEAbsfjRXhUBZgJmEgKfQiDIHug4nsfi72RG4VrRhi6iXiV5tQIknzpxRRKVdXXBx5zitjIFV9kGZwmYiDqbY0ACG UjhyVhnZKFz1xO1NVJrfaUHMSY0GAS7+nGwuTE8VU6pniXC/JYter5p4QD+pGxRq2IYD6kP/DxwoTkYVYzw4VXAA2PLsl8y82xUIuh+HgU2Jx+dMj7ikaDn6 e1QMRuDjkYMc2U0ofSdNIE3r5nJx52K9TzX1hcIMXvlpPfGU8Nph2U/YktvJVwDoD3+4fi7vq9JfGaXtOVT9zBFt0rxf4UD4CANNBRgnEX+mRu0nSnOkmPvI HAfG9y99YWcm7A03nUElgBgFEozqZv9DsellGgzVgAbR8Ls/HxFHuuOlGzp2JlcSGGR/oy+L3sgVvwsW3V64vZSvbfVpVQTDkGGzM6c6o2g9Do8w3ehLdwHJ +nzLf0RhWZo+GQjrI08R62zp5yiy7VemQy4R2iPd1sxOuWTPr6f104z8SkFL3qGquFIq+H1q70yoAGQz0AKe8/8T17Hd+15awqcEfx/d4ut+5C8zllDrhINd obo=
X-CM-Analysis: v=2.4 cv=UsCZN/wB c=1 sm=1 tr=0 ts=68106c0a a=smkfPCmiGCBx+NgG8pXs4w==:117 a=smkfPCmiGCBx+NgG8pXs4w==:17 a=IkcTkHD0fZMA:10 a=cSBwheNr8OLlQuANofUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
Message-ID: <a3778455-945d-4b03-ab00-5b609127c332@jjverkuil.nl>
Date: Tue, 29 Apr 2025 08:04:57 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] media: vim2m: add multiplanar API support
To: Matthew Majewski <mattwmajewski@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Uwe Kleine-Konig <u.kleine-koenig@baylibre.com>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Naushir Patuck <naush@raspberrypi.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250304191701.2957096-1-mattwmajewski@gmail.com>
 <09726b7e-4ac4-4ebe-b1eb-4d142c2ee0fb@jjverkuil.nl>
 <8b0234aeabc8d33a2d8025b42642362481a6c06a.camel@gmail.com>
Content-Language: en-US, nl
From: Hans Verkuil <hans@jjverkuil.nl>
Autocrypt: addr=hans@jjverkuil.nl; keydata=
 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
In-Reply-To: <8b0234aeabc8d33a2d8025b42642362481a6c06a.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spampanel-Class: ham

On 28/04/2025 20:40, Matthew Majewski wrote:
> Hello Hans,
> 
> On Sun, 2025-04-27 at 11:45 +0200, Hans Verkuil wrote:
>> Hi Matthew,
>>
>> On 04/03/2025 20:16, Matthew Majewski wrote:
>>> Hi everyone,
>>>
>>> This patch series adds multiplane API support for the virtual M2M
>>> driver, along with some minor driver refactoring/improvements.
>>>
>>> I followed the lead of the vivid driver and made multiplanar
>>> support
>>> selectable with a module parameter, and the default is to use the
>>> single planar api.
>>>
>>> Although there are not yet any pixelformats in the driver that make
>>> use of multiple memory planes, adding support for these should be
>>> easier now with the API level changes taken care of.
>>
>> Are you planning follow-up patches adding support for at least one
>> multiplanar format? That would be really nice.
>>
>> Regards,
>>
>> 	Hans
>>
> 
> Yes, I currently have a WIP patch series to add support for all of the
> formats that vivid currently supports to vim2m. It involves a huge
> refactor though, so I split the groundwork for supporting the multi-
> planar formats into a separate patch series first. 

Ah, great news! Looking forward to that.

FYI: I've added vim2m multiplanar tests to contrib/test/test-media in
v4l-utils. That script is part of our regression testing, so this helps
testing multiplanar support.

Regards,

	Hans

> 
> Best,
> 
> 	Matthew
> 
>>>
>>> v4l2-compliance reports the following with multiplane support
>>> disabled:
>>>
>>>   Total for vim2m device /dev/video0: 48, Succeeded: 48, Failed: 0,
>>> Warnings: 0
>>>
>>> and the same with multiplane support enabled:
>>>
>>>   Total for vim2m device /dev/video0: 48, Succeeded: 48, Failed: 0,
>>> Warnings: 0
>>>
>>> Patches need to be applied in increasing numerical order (Patch
>>> [3/3]
>>> depends on [1/3] and [2/3]).
>>>
>>> Since the multi-plane changes had to touch a lot of the driver, I
>>> did
>>> a basic regression test with the following script which generates a
>>> test input image with vivid and an output image from vim2m for each
>>> supported format. I confirmed all outputs visually and verified
>>> they
>>> were identical to the outputs before the change. Testing was done
>>> on
>>> an x86_64 qemu image.
>>>
>>> #!/bin/sh
>>>
>>> # tested with HDMI vivid emulation
>>> # modprobe vivid num_inputs=1 input_types=3
>>>
>>> vim2m=/dev/video0
>>> vivid=/dev/video1
>>>
>>> width=640
>>> height=480
>>> out_width=320
>>> out_height=240
>>>
>>> capture_formats=$(v4l2-ctl -d $vim2m --list-formats | awk '/\]:/
>>> {print $2}' | sed "s/'//g")
>>> output_formats=$(v4l2-ctl -d $vim2m --list-formats-out | awk '/\]:/
>>> {print $2}' | sed "s/'//g")
>>>
>>> # Turn off text mode so that images will be identical
>>> v4l2-ctl -d $vivid -c osd_text_mode=2
>>>
>>> for ofmt in ${output_formats}; do
>>>     # generate input image
>>>     inname="${width}x${height}.${ofmt}"
>>>     v4l2-ctl -d $vivid -v
>>> pixelformat=$ofmt,width=$width,height=$height,field=none \
>>>              --stream-mmap --stream-count=1 --stream-to=$inname
>>>     for cfmt in ${capture_formats}; do
>>>         outname="${out_width}x${out_height}-out.${cfmt}"
>>>         v4l2-ctl -d $vim2m -x
>>> pixelformat=$ofmt,width=$width,height=$height \
>>>                  -v
>>> pixelformat=$cfmt,width=$out_width,height=$out_height \
>>>                  --stream-from=$inname --stream-to=$outname --
>>> stream-mmap --stream-out-mmap \
>>>                  --stream-count=1
>>>     done
>>> done
>>>
>>> Matthew Majewski (3):
>>>   media: v4l2-common: Add RGBR format info
>>>   media: vim2m: Simplify try_fmt
>>>   media: vim2m: Add parametized support for multiplanar API
>>>
>>>  drivers/media/test-drivers/vim2m.c    | 327 +++++++++++++++++++++-
>>> ----
>>>  drivers/media/v4l2-core/v4l2-common.c |   1 +
>>>  2 files changed, 274 insertions(+), 54 deletions(-)
>>>
>>
> 


