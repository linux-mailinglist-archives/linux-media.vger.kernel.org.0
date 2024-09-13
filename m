Return-Path: <linux-media+bounces-18282-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8D7978BE9
	for <lists+linux-media@lfdr.de>; Sat, 14 Sep 2024 01:41:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9D3C1F23B21
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 23:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAD3718D654;
	Fri, 13 Sep 2024 23:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Lbly2bty"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E49418BB9C
	for <linux-media@vger.kernel.org>; Fri, 13 Sep 2024 23:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726270876; cv=none; b=eBYTHfUKDDT4MA+T8x7Lym7IDU7M/IXPqnV2ONmn697qW39jV6dI3nvGOE77CTDQf9ZbnPllt8HcMa8q1d9mmh43nP2yt93QJfbyAcJIci/nsO1/8C1THsEtfItpkgEtiqSVesMfCvCkWG34CZPfHxMUYQPh5L56/AZU7r7HCMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726270876; c=relaxed/simple;
	bh=tjtfi0CIaewdCH1xpV9noxx1MJ1OFq3hPgMfQH3knuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cglrdJJcz2KWiNYlzsb5XwqEdd7AurKDj7iTLxs0yfuMTFA3OnbFcIh4+BmvS5F1T2NXjcy1LKbXiuRfXDQxPx2z6D8MzVJRqwvV9IdgFfPqH/3CQzESiHy34v8vvSn/xihB9J/viR9UGlFfEewPh4tm9z5OFQ/FAiSNg11UUbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Lbly2bty; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (213-229-8-243.static.upcbusiness.at [213.229.8.243])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4DB339FF;
	Sat, 14 Sep 2024 01:39:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1726270793;
	bh=tjtfi0CIaewdCH1xpV9noxx1MJ1OFq3hPgMfQH3knuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lbly2btylmOFKXgLt1G4VcIxI35/rhvV5yn5xp0RZFLsSim3eixrmc30d4wMeUd4u
	 3lB3JStDYVWzx8yjukD4g0z1gkpkLuOQCjyIE98+bVTEEWFsffm8SsfpplzIOezVkg
	 bFHKN7ZoeINL0ZK7W25uWlero+gvyTAc+bt+EiIY=
Date: Sat, 14 Sep 2024 02:40:37 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: David Given <dg@cowlark.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org
Subject: Re: No uvc video support for D3DFMT video GUIDs?
Message-ID: <20240913234037.GB9669@pendragon.ideasonboard.com>
References: <CALgV52gdx5m3eP88Sqa4s09qy+N4rpaZ8UHFXfphkCXZUxyNHQ@mail.gmail.com>
 <CANiDSCuOojPtX4M9Q7DOe4sR-DpuKp1Rzzpa3NrJxV7HuzAAeg@mail.gmail.com>
 <CALgV52iM3B4G2Sa0jjuMcEZtE+rn8B80NOMWj3i4jEUCiVVnRw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CALgV52iM3B4G2Sa0jjuMcEZtE+rn8B80NOMWj3i4jEUCiVVnRw@mail.gmail.com>

Hi David,

On Sat, Sep 14, 2024 at 01:01:25AM +0200, David Given wrote:
> After learning the difference between GUID text and memory
> representation, I have hacked support into the kernel. And it doesn't
> work.
> 
> The kernel tracing says this:
> 
> mplayer says this:
> 
> ---snip---
> name: Video 4 Linux 2 input
> author: Martin Olschewski <olschewski@zpr.uni-koeln.de>
> comment: first try, more to come ;-)
> v4l2: your device driver does not support VIDIOC_G_STD ioctl, VIDIOC_G_PARM was
> used instead.
> Selected device: IR VIDEO: IR Camera
> Capabilities:  video capture  streaming
> supported norms:
> inputs: 0 = Camera 1;
> Current input: 0
> Current format: RGB565
> v4l2: ioctl set format failed: Input/output error
> v4l2: ioctl set mute failed: Invalid argument
> v4l2: 0 frames successfully processed, 0 frames dropped.
> ---snip---
> 
> mplayer says this:
> 
> ---snip---
> [17267.675757] usb 3-5.4.3: UVC non compliance - GET_DEF(PROBE) not
> supported. Enabling workaround.
> [17460.849025] uvcvideo 3-5.4.3:1.1: Failed to query (130) UVC probe
> control : -32 (exp. 26).
>   (this last line appears when mplayer runs)

Ouch :-(

> ---snip---
> 
> v4l2-compliance's report on the format ioctls says this (the entire
> thing for both devices is on pastebin as it's big:
> https://pastebin.com/RAzpkigp)
> 
> ---snip---
> Format ioctls (Input 0):
>        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>                fail: v4l2-test-formats.cpp(1442): ret && node->has_frmintervals
>        test VIDIOC_G/S_PARM: FAIL
>        test VIDIOC_G_FBUF: OK (Not Supported)
>        test VIDIOC_G_FMT: OK
>                fail: v4l2-test-formats.cpp(767): Video Capture is valid, but no
> TRY_FMT was implemented
>        test VIDIOC_TRY_FMT: FAIL
>                fail: v4l2-test-formats.cpp(473): expected EINVAL, but got 5 whe
> n getting format for buftype 1
>        test VIDIOC_S_FMT: FAIL
>        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>        test Cropping: OK (Not Supported)
>        test Composing: OK (Not Supported)
>                fail: v4l2-test-formats.cpp(1853): doioctl(node, VIDIOC_S_FMT, &
> fmt)
>                fail: v4l2-test-formats.cpp(2001): testBasicScaling(node, fmt)
>        test Scaling: FAIL
> ---snip---
> 
> I'm feeling like this is a very ill camera. However, capturing does

Lots of UVC cameras are very ill, as vendors typically test their
devices with windows only :-S

> work on Windows. I see there is support for UVC device quirks
> (https://elixir.bootlin.com/linux/v6.10.10/source/drivers/media/usb/uvc/uvcvideo.h#L63).
> Any suggestions of anything which might work? I tried a few things
> randomly and nothing seemed to make a difference.

UVC_QUIRK_PROBE_DEF may help. Please check if it results in any change
in the kernel log messages, not just if you can capture frames from the
camera, as sometimes multiple quirks may be needed.

> On Thu, 12 Sept 2024 at 12:52, Ricardo Ribalda <ribalda@chromium.org> wrote:
> >
> > Hi David
> >
> >
> > On Wed, 11 Sept 2024 at 21:58, David Given <dg@cowlark.com> wrote:
> > >
> > > Hello,
> > >
> > > I've just received a review sample thermal camera which doesn't work
> > > with Linux uvcvideo. It's reporting itself as providing a D3DFMT GUID:
> > >
> > > ---snip---
> > >      VideoStreaming Interface Descriptor:
> > >        bLength                            27
> > >        bDescriptorType                    36
> > >        bDescriptorSubtype                  4 (FORMAT_UNCOMPRESSED)
> > >        bFormatIndex                        1
> > >        bNumFrameDescriptors                1
> > >        guidFormat
> > > {e436eb7b-524f-11ce-9f53-0020af0ba770}
> > >        bBitsPerPixel                      16
> > >        bDefaultFrameIndex                  1
> > >        bAspectRatioX                       0
> > >        bAspectRatioY                       0
> > >        bmInterlaceFlags                 0x00
> > >          Interlaced stream or variable: No
> > >          Fields per frame: 2 fields
> > >          Field 1 first: No
> > >          Field pattern: Field 1 only
> > >        bCopyProtect                        0
> > > ---snip---
> > >
> > > This corresponds to D3DFMT_R5G6B5 or MEDIASUBTYPE_RGB565, based on the
> > > reference here: https://gix.github.io/media-types/#ID0EC2AI However,
> > > the UVC driver is expecting RGB565 to be using the 4cc RGBP GUID
> > > 52474250-0000-1000-8000-00aa00389b71. This is very nearly the same as
> > > the alternative GUID described on the document above,
> > > 00000017-0000-0010-8000-00AA00389B71, which uses an index rather than
> > > a 4cc.
> > >
> > > I haven't been able to find any references as to what GUIDs are
> > > supported for guidFormat.
> >
> > The uvc spec only defines GUIDs for YUY2, NV12, M420 and I420.
> >
> > It would have been nice that the vendor had used the same GUID as
> > TomTom (Check 507910799160e85eac5e7729e0d2f1ba26f6a8cf)
> > but apparently it is not required to be like this.
> >
> >
> > Why dont you try adding a new mapping to  include/linux/usb/uvc.h and
> > drivers/media/common/uvc.c ? Similar to what Marek did here:
> > 015d44c2b700ba9639dd29672ba362796cc0be54
> >
> > I believe that if a camera does not use TomToms GUID and the new GUI,
> > everything would work...
> >
> > Regards
> >
> > > (a) Is the camera wrong?
> > > (b) Is the kernel wrong?
> > > (c) Am I looking at the wrong document?
> > >
> > > The easy fix is to patch the uvcvideo driver to support the e436...
> > > GUID, but that doesn't seem a great idea. Any suggestions?

-- 
Regards,

Laurent Pinchart

