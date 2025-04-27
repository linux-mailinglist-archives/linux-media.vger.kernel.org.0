Return-Path: <linux-media+bounces-31124-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD9EA9E23B
	for <lists+linux-media@lfdr.de>; Sun, 27 Apr 2025 11:45:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95D843AE615
	for <lists+linux-media@lfdr.de>; Sun, 27 Apr 2025 09:45:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DED924E01F;
	Sun, 27 Apr 2025 09:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b="ulaOntCI"
X-Original-To: linux-media@vger.kernel.org
Received: from dane.soverin.net (dane.soverin.net [185.233.34.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C562E1DED57;
	Sun, 27 Apr 2025 09:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.34.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745747141; cv=none; b=qk3b/0oI2+ODL/zcvfC+WiUN4D4S6cFk/0gZKARokNRK1dooE9eOPUM+tsMR30XvzQKHrn0cZSot1xbNLJAqJZs1oWiFk80hHPdaQ7P7DfshzeDzpuNCHS5/yiSY5dHDkIvvniCldqJUohE+xMHq3Rc7Rp0qv9JD97gAI891mJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745747141; c=relaxed/simple;
	bh=wtXNaCiZwHuFeeesE9U1dOeQMH3rki85RDwtlsNWFFU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LlEhS80I9xERSxmYVhfCOto11aq6vY60uZzMdLprsplKfe4faqoGpxIQFoKmXmzD2K7N5rcf6MZExnEkSOWlE5NGYtx84o9HcepWuIdURGn8/DJ/dG6Anu4bYA7XIlC97+VFc1lIoYSuyR+RoZ//sUcaU/Bz83iAN1v+asc0NxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl; spf=pass smtp.mailfrom=jjverkuil.nl; dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b=ulaOntCI; arc=none smtp.client-ip=185.233.34.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jjverkuil.nl
Received: from smtp.freedom.nl (unknown [10.10.4.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by dane.soverin.net (Postfix) with ESMTPS id 4ZlhX52CFlz18nP;
	Sun, 27 Apr 2025 09:45:25 +0000 (UTC)
Received: from smtp.freedom.nl (smtp.freedom.nl [10.10.4.108]) by freedom.nl (Postfix) with ESMTPSA id 4ZlhX44ByKz2xMF;
	Sun, 27 Apr 2025 09:45:24 +0000 (UTC)
Authentication-Results: smtp.freedom.nl;
	dkim=pass (2048-bit key; unprotected) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.a=rsa-sha256 header.s=soverin1 header.b=ulaOntCI;
	dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jjverkuil.nl;
	s=soverin1; t=1745747125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=rswjIovrocctqrjdm39BXUqHn6IGAn3W8NnLInumgwU=;
	b=ulaOntCIhUSrAW6OW8ty5K0Gl38Tb7ZOTVJPYvcRrsyXtR9ndGq4cnhc1/EToahAZ+oHMc
	jQsILqVxNnNzfoW3LgDxaCLvHg/aZhjoZHnlG3VtnHeo1WXU/LoFalamJ74yzAGrQEHzBZ
	17akmoxzFo+i3DS1VaPz8kOqfuV0P6FKkMWlEAs+dxk1KEGEGqvRUe+63q6KsFxiZMBX5U
	R1WyTP/cZ7FbVHglj/3QpXsdA7hZR1STIFyjt7VFosEWgi9r8+sd1FI7ptMF/9OCKvit6x
	s1wONsTha4JVLNV8AZNDf0TbzXy8WXTnb6lnkt7rgm2GR1xsPWc6MeDAxZDbvg==
X-CM-Analysis: v=2.4 cv=d/oPyQjE c=1 sm=1 tr=0 ts=680dfcb5 a=smkfPCmiGCBx+NgG8pXs4w==:117 a=smkfPCmiGCBx+NgG8pXs4w==:17 a=IkcTkHD0fZMA:10 a=-CwenhCMtp_CBWieSUQA:9 a=QEXdDO2ut3YA:10
X-CM-Envelope: MS4xfIujUoz9Hu2jSc4hDAl8kRs58D4H4AGQC6ckbOLP5kili1KLi8EAUVGhYD2j+TvDs6HUK7LL6p0ByrOfCL4B5azj83rbaMphPvOy/lEyFrA/qwKzdMRn HgPnthsGS5jqpkZSPP0fUs3tlV/s6vI9mWw1onZPqC5ydW8yBteLanFcNUqQIlgEtNssBjMiV3sdRlOxatRUJfpWKln7ZG3o/2frVUqL46IJ90LfME8+/4rq IY9J0rtgS/2JmdFLgscAFK+EHU/4H7dddOwAfBSgMdMgdSFaHwttb9lwMqzJsld8ZfZjuUUvIsAjd3djTO28ii6N1GTINgQk2gjWfc0TnGZKGu/0p4EcTsmX QJDBbDX2sMxBKS/uVUujKAlu46/xklI2P+b8otacy1QIhO1UsnRFnvXxEFj+dEu9cAW1M5Q+WM8Ub0JzA4vH5rGN6dHboGbTdAAIUeTzwZTLFBmpvns2UFm/ 8CXdplipv8Ub2rUWwUgTT+PaCeVxxN4QWUfgoGRa8BtYL0D17HNJg/v4H7qCLoX9tVF0XF0n2xeh7rCZYB4XaOUAfhgopMtMPuFT6V5cN9Ea1J7Bu7NEX7ie J5Y=
Message-ID: <09726b7e-4ac4-4ebe-b1eb-4d142c2ee0fb@jjverkuil.nl>
Date: Sun, 27 Apr 2025 11:45:24 +0200
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
Content-Language: en-US, nl
From: Hans Verkuil <hans@jjverkuil.nl>
Autocrypt: addr=hans@jjverkuil.nl; keydata=
 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
In-Reply-To: <20250304191701.2957096-1-mattwmajewski@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spampanel-Class: ham

Hi Matthew,

On 04/03/2025 20:16, Matthew Majewski wrote:
> Hi everyone,
> 
> This patch series adds multiplane API support for the virtual M2M
> driver, along with some minor driver refactoring/improvements.
> 
> I followed the lead of the vivid driver and made multiplanar support
> selectable with a module parameter, and the default is to use the
> single planar api.
> 
> Although there are not yet any pixelformats in the driver that make
> use of multiple memory planes, adding support for these should be
> easier now with the API level changes taken care of.

Are you planning follow-up patches adding support for at least one
multiplanar format? That would be really nice.

Regards,

	Hans

> 
> v4l2-compliance reports the following with multiplane support disabled:
> 
>   Total for vim2m device /dev/video0: 48, Succeeded: 48, Failed: 0, Warnings: 0
> 
> and the same with multiplane support enabled:
> 
>   Total for vim2m device /dev/video0: 48, Succeeded: 48, Failed: 0, Warnings: 0
> 
> Patches need to be applied in increasing numerical order (Patch [3/3]
> depends on [1/3] and [2/3]).
> 
> Since the multi-plane changes had to touch a lot of the driver, I did
> a basic regression test with the following script which generates a
> test input image with vivid and an output image from vim2m for each
> supported format. I confirmed all outputs visually and verified they
> were identical to the outputs before the change. Testing was done on
> an x86_64 qemu image.
> 
> #!/bin/sh
> 
> # tested with HDMI vivid emulation
> # modprobe vivid num_inputs=1 input_types=3
> 
> vim2m=/dev/video0
> vivid=/dev/video1
> 
> width=640
> height=480
> out_width=320
> out_height=240
> 
> capture_formats=$(v4l2-ctl -d $vim2m --list-formats | awk '/\]:/ {print $2}' | sed "s/'//g")
> output_formats=$(v4l2-ctl -d $vim2m --list-formats-out | awk '/\]:/ {print $2}' | sed "s/'//g")
> 
> # Turn off text mode so that images will be identical
> v4l2-ctl -d $vivid -c osd_text_mode=2
> 
> for ofmt in ${output_formats}; do
>     # generate input image
>     inname="${width}x${height}.${ofmt}"
>     v4l2-ctl -d $vivid -v pixelformat=$ofmt,width=$width,height=$height,field=none \
>              --stream-mmap --stream-count=1 --stream-to=$inname
>     for cfmt in ${capture_formats}; do
>         outname="${out_width}x${out_height}-out.${cfmt}"
>         v4l2-ctl -d $vim2m -x pixelformat=$ofmt,width=$width,height=$height \
>                  -v pixelformat=$cfmt,width=$out_width,height=$out_height \
>                  --stream-from=$inname --stream-to=$outname --stream-mmap --stream-out-mmap \
>                  --stream-count=1
>     done
> done
> 
> Matthew Majewski (3):
>   media: v4l2-common: Add RGBR format info
>   media: vim2m: Simplify try_fmt
>   media: vim2m: Add parametized support for multiplanar API
> 
>  drivers/media/test-drivers/vim2m.c    | 327 +++++++++++++++++++++-----
>  drivers/media/v4l2-core/v4l2-common.c |   1 +
>  2 files changed, 274 insertions(+), 54 deletions(-)
> 


