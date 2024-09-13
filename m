Return-Path: <linux-media+bounces-18281-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B82AA978B98
	for <lists+linux-media@lfdr.de>; Sat, 14 Sep 2024 01:01:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCC691C22699
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 23:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 100A61714C6;
	Fri, 13 Sep 2024 23:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cowlark.com header.i=@cowlark.com header.b="Bat9unlz"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.mythic-beasts.com (mx1.mythic-beasts.com [46.235.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0E26F2EB
	for <linux-media@vger.kernel.org>; Fri, 13 Sep 2024 23:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.224.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726268511; cv=none; b=EqoEfftnaajDU9qvKJ1m8+/dJ67YacPS8P8zgy35oWqXAgCMuR1xLI2AayYlnQ9P0wRDzMRUwagG4sIEYtsiag3EhYR3v9RiCzkEfKuUQ8Vk/HQeRuLtl5K1OIap4/Ph3s8CqGK+GWe82FELxugD3IYUOn2rnTLAyta3SX+Cjsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726268511; c=relaxed/simple;
	bh=NFf5hCrSwSyN7JxqUCl7CiR2Mb5Q1gAD9JT4L+nxnLQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P95O+Gibkzcto9suiMkUOcVydnyY8mYm//sQ3YRz2xUOXYmIhGv3E6mkYrhaVs/lekStzytrOjC0CCXhVgmhMg4yRcxhRYN42ls3zjBbrzbA90NdbGoiKYnFWmwiAMGzVzW2XAx1bcG3hMD6ZB2YKIXLmchcchPgxuMYt0G9Pbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cowlark.com; spf=pass smtp.mailfrom=cowlark.com; dkim=pass (2048-bit key) header.d=cowlark.com header.i=@cowlark.com header.b=Bat9unlz; arc=none smtp.client-ip=46.235.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cowlark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cowlark.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cowlark.com
	; s=mythic-beasts-k1; h=To:Subject:Date:From;
	bh=30KdyPWPmVyhCmKAV3n6wdvIwne5+aLf/LWT3z1+Aoo=; b=Bat9unlzDFgXG7D5gvLeI18BmN
	n0Ht3M96ewrD6VLFVW/U0O03QDuITxggzhHEslsKsYz3rzokd4YJcTgAtuIGD/NZZDDIzBxJBd5RJ
	RgbxvdJK8NoBiXNicvX83YwdjY+41O2J4QNkmkoo9/KnwB0ECK6Mtf0rRNaRnURWCt3O2bmr1M6Pi
	csdctH70+EAlRyr7dYAf7xf1DicszrpVvuTC1iQ7RmBCbFK9bjRDSzMvR+D41/eRaBAqLSWL6J5nB
	4JaRPjSi8ftEfBzgvKFywxeBrW5B6MpDBwj92N1bVt6H8dFuyJ0DVUq48s+p8+48Gf/GmG+DD1vVn
	DcOIAqAA==;
Received: by mailhub-cam-d.mythic-beasts.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <dg@cowlark.com>)
	id 1spFIJ-007kVf-Os
	for linux-media@vger.kernel.org; Sat, 14 Sep 2024 00:01:39 +0100
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7d4f9e39c55so1960555a12.2
        for <linux-media@vger.kernel.org>; Fri, 13 Sep 2024 16:01:38 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw16XtXEb0kMSwwSdkFbL3Q5HDwJKuKj2DxkZyM9eV50XV31uOj
	jLR7EBSp5cgLOCWh/gc4AhBpIEmvYSpviO6V5TnGqQRrjFJhNi0K+O5PBEU22YrWQjH7Mwc11wr
	71FLx4kj8ozmfT/VwBgV9v47rRho=
X-Google-Smtp-Source: AGHT+IGqZlcfnhUQZXKXNZDQiz2tAugPhBdJ410qT1DA6pwfzxGqvjALC13fA4JQRT0EGJs9iXRtgo4jxrPlRcsQoRw=
X-Received: by 2002:a17:90a:644d:b0:2da:89ac:75b9 with SMTP id
 98e67ed59e1d1-2db9ff9237emr8277401a91.11.1726268496663; Fri, 13 Sep 2024
 16:01:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALgV52gdx5m3eP88Sqa4s09qy+N4rpaZ8UHFXfphkCXZUxyNHQ@mail.gmail.com>
 <CANiDSCuOojPtX4M9Q7DOe4sR-DpuKp1Rzzpa3NrJxV7HuzAAeg@mail.gmail.com>
In-Reply-To: <CANiDSCuOojPtX4M9Q7DOe4sR-DpuKp1Rzzpa3NrJxV7HuzAAeg@mail.gmail.com>
From: David Given <dg@cowlark.com>
Date: Sat, 14 Sep 2024 01:01:25 +0200
X-Gmail-Original-Message-ID: <CALgV52iM3B4G2Sa0jjuMcEZtE+rn8B80NOMWj3i4jEUCiVVnRw@mail.gmail.com>
Message-ID: <CALgV52iM3B4G2Sa0jjuMcEZtE+rn8B80NOMWj3i4jEUCiVVnRw@mail.gmail.com>
Subject: Re: No uvc video support for D3DFMT video GUIDs?
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: linux-media@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-BlackCat-Spam-Score: 9

After learning the difference between GUID text and memory
representation, I have hacked support into the kernel. And it doesn't
work.

The kernel tracing says this:

mplayer says this:

---snip---
name: Video 4 Linux 2 input
author: Martin Olschewski <olschewski@zpr.uni-koeln.de>
comment: first try, more to come ;-)
v4l2: your device driver does not support VIDIOC_G_STD ioctl, VIDIOC_G_PARM was
used instead.
Selected device: IR VIDEO: IR Camera
Capabilities:  video capture  streaming
supported norms:
inputs: 0 = Camera 1;
Current input: 0
Current format: RGB565
v4l2: ioctl set format failed: Input/output error
v4l2: ioctl set mute failed: Invalid argument
v4l2: 0 frames successfully processed, 0 frames dropped.
---snip---

mplayer says this:

---snip---
[17267.675757] usb 3-5.4.3: UVC non compliance - GET_DEF(PROBE) not
supported. Enabling workaround.
[17460.849025] uvcvideo 3-5.4.3:1.1: Failed to query (130) UVC probe
control : -32 (exp. 26).
  (this last line appears when mplayer runs)
---snip---

v4l2-compliance's report on the format ioctls says this (the entire
thing for both devices is on pastebin as it's big:
https://pastebin.com/RAzpkigp)

---snip---
Format ioctls (Input 0):
       test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
               fail: v4l2-test-formats.cpp(1442): ret && node->has_frmintervals
       test VIDIOC_G/S_PARM: FAIL
       test VIDIOC_G_FBUF: OK (Not Supported)
       test VIDIOC_G_FMT: OK
               fail: v4l2-test-formats.cpp(767): Video Capture is valid, but no
TRY_FMT was implemented
       test VIDIOC_TRY_FMT: FAIL
               fail: v4l2-test-formats.cpp(473): expected EINVAL, but got 5 whe
n getting format for buftype 1
       test VIDIOC_S_FMT: FAIL
       test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
       test Cropping: OK (Not Supported)
       test Composing: OK (Not Supported)
               fail: v4l2-test-formats.cpp(1853): doioctl(node, VIDIOC_S_FMT, &
fmt)
               fail: v4l2-test-formats.cpp(2001): testBasicScaling(node, fmt)
       test Scaling: FAIL
---snip---

I'm feeling like this is a very ill camera. However, capturing does
work on Windows. I see there is support for UVC device quirks
(https://elixir.bootlin.com/linux/v6.10.10/source/drivers/media/usb/uvc/uvcvideo.h#L63).
Any suggestions of anything which might work? I tried a few things
randomly and nothing seemed to make a difference.

On Thu, 12 Sept 2024 at 12:52, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Hi David
>
>
> On Wed, 11 Sept 2024 at 21:58, David Given <dg@cowlark.com> wrote:
> >
> > Hello,
> >
> > I've just received a review sample thermal camera which doesn't work
> > with Linux uvcvideo. It's reporting itself as providing a D3DFMT GUID:
> >
> > ---snip---
> >      VideoStreaming Interface Descriptor:
> >        bLength                            27
> >        bDescriptorType                    36
> >        bDescriptorSubtype                  4 (FORMAT_UNCOMPRESSED)
> >        bFormatIndex                        1
> >        bNumFrameDescriptors                1
> >        guidFormat
> > {e436eb7b-524f-11ce-9f53-0020af0ba770}
> >        bBitsPerPixel                      16
> >        bDefaultFrameIndex                  1
> >        bAspectRatioX                       0
> >        bAspectRatioY                       0
> >        bmInterlaceFlags                 0x00
> >          Interlaced stream or variable: No
> >          Fields per frame: 2 fields
> >          Field 1 first: No
> >          Field pattern: Field 1 only
> >        bCopyProtect                        0
> > ---snip---
> >
> > This corresponds to D3DFMT_R5G6B5 or MEDIASUBTYPE_RGB565, based on the
> > reference here: https://gix.github.io/media-types/#ID0EC2AI However,
> > the UVC driver is expecting RGB565 to be using the 4cc RGBP GUID
> > 52474250-0000-1000-8000-00aa00389b71. This is very nearly the same as
> > the alternative GUID described on the document above,
> > 00000017-0000-0010-8000-00AA00389B71, which uses an index rather than
> > a 4cc.
> >
> > I haven't been able to find any references as to what GUIDs are
> > supported for guidFormat.
>
> The uvc spec only defines GUIDs for YUY2, NV12, M420 and I420.
>
> It would have been nice that the vendor had used the same GUID as
> TomTom (Check 507910799160e85eac5e7729e0d2f1ba26f6a8cf)
> but apparently it is not required to be like this.
>
>
> Why dont you try adding a new mapping to  include/linux/usb/uvc.h and
> drivers/media/common/uvc.c ? Similar to what Marek did here:
> 015d44c2b700ba9639dd29672ba362796cc0be54
>
> I believe that if a camera does not use TomToms GUID and the new GUI,
> everything would work...
>
> Regards
>
> >
> > (a) Is the camera wrong?
> > (b) Is the kernel wrong?
> > (c) Am I looking at the wrong document?
> >
> > The easy fix is to patch the uvcvideo driver to support the e436...
> > GUID, but that doesn't seem a great idea. Any suggestions?
> >
>
>
> --
> Ricardo Ribalda

