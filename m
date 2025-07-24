Return-Path: <linux-media+bounces-38427-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4C4B11218
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 22:19:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 075307B229B
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 20:17:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACA1B239567;
	Thu, 24 Jul 2025 20:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WjeQZFTc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D9A9443;
	Thu, 24 Jul 2025 20:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753388353; cv=none; b=UQlBJTdBq4CTpISNhX84qZXb8GU9HT07jt6TKBJYP666axQZVesKysGhMzZamaOX9F9LcNV81MH0SB7HjI2N+yox+1QBiO+XGWg8md2bIS+1GwEn7sjA9YXKugDkXwcT7XjRiEhclh3n5mGHY6obn9kXxBfZF4QlKu2ppBaLEH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753388353; c=relaxed/simple;
	bh=k+nnBxI2ivuJQq1IRpNsfqQSrTJOOPmunynAP2fyw3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uPf9xjgd53RqWQtXLC2qMt2TYifLOPkoadaBl56WJ8B/ZOVPw6wkP1Cx36on1BbkfmQH8EHw4LNwcXnN35X2I/Agdm+FE49GA+ouLl7gwMYX/D9jz6Mk0PuquOWLmXi/nF8u3W5QOW0nKDk5mL/PT+QPfwXmWn2gRaw4kgHXbPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WjeQZFTc; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45600581226so14934955e9.1;
        Thu, 24 Jul 2025 13:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753388349; x=1753993149; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PEVseRPVVao+xeDXS/I/3gsf95DLS+6mSeDY070gmUg=;
        b=WjeQZFTc0ah7tkgQS7D1r58cIFMLcr/XAF1Z2FuqTvR/BQOtPJmGkJVgOf7v4066l9
         DWJ9Q0T0QcIpG8TOa2T6RbSDwkByGdABN2hooJQQW3LvUYV7fOf84wbmYQiauaXvAGFC
         OIdaqhEOfVXNgXCoIFy1HzJkukd1nV0bvoCPg8qbXoVtBBqjp+6GIf2yrwgiZwVr8cDN
         bweHYi67Zi/9EcZom9UKiEOqKdZUEaqHb/divAlTjcj7eSDEwZrf2WnbtusaNeytUMI5
         uNAZtgNCJCoMaaSvqoAecLL0qBKlgDp4iTpYK2siIQtNJUqfNSq+Xdj+DrhkRryxJ1zt
         MDEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753388349; x=1753993149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PEVseRPVVao+xeDXS/I/3gsf95DLS+6mSeDY070gmUg=;
        b=hzatKTzHQSbsslOc8Lb/qIwq8xwF96FFlO9cd6oD8dPWCB7o+aAdnEHj1WZyKcRHdG
         JmFm4t38WmiVDMB9XIvbxvNgbEpgbCGKh0SSXf+Grp0sfUrWCDB7oeedIw4M4/5s7VJF
         mC3ZLVXUqgHhLJt1FvZRACdTN0pwQA2UH1oFwsioheg85ePf3X2r9GqwbyL+zbZBIaO4
         t9x/KDFi+10lvYrfE2JTNIdWge+Ki4voam9cu/C1lCj5KruI17H+3RxtVprBA/7wDkPo
         /R+5FGtv6upiXxsKw2DKRhGc218XFG0S2iv38D8ccVoubS/7B0JTj5Jg/kZQzthbHEmZ
         lImg==
X-Forwarded-Encrypted: i=1; AJvYcCW0pBqaa5k85sImqkyWkTApqckrWzqIHiUSl+xZt270roiPFjQ1Oy+UdXdXh7suU923J/ytDZZmBoN1FGhLRYSZi38=@vger.kernel.org, AJvYcCXfR4GUXWL0KOLyeC0u9NyEtFLEgK7wL6egshgtWszWVuMAh/zXPit2/whiBtIyI4/X46F3i6vUYtzx@vger.kernel.org
X-Gm-Message-State: AOJu0YxN1YDacO6RkVJFw1OEsNLnY4CRSPDq2oOr9ryqC2EPU498Nayb
	xhin6e9+lxj9Hol49688VvUA/ojyliWpG+jvqie46xTBJGZMPEhKGbPziWFSMhBiVH0b4H2uasX
	a9uSwKr1SJO+65xER5MvUiwj9CBIhQC8=
X-Gm-Gg: ASbGncuxOY8dX97wUPqyKPfpaAJ/IhAVmk4027FlcMbIo3Uu9nSmlHceuZap76sHZyc
	t9mM04LuYumOPLpNhPCp7u2Ti3b87gefimAF4wri0AxhcFLXoc0v99S8xXWpB5a+rnGnvTqHp8Y
	mhhOIhuFLfBg9XFQ5gdOIZ+KMVczVC67IKQZzUw6g5O9P3lTeBE6V78o98H2gMnczsZnP3LMwhw
	FZFLPWh
X-Google-Smtp-Source: AGHT+IEo380v+BdOqMWHpyiCP47G6cxBUBer8Fxfw+SLiSh9Ts52GOWDKPtTGLTVYQHCgySwCcZ1zdWPiR1vyioig9Q=
X-Received: by 2002:a5d:64e2:0:b0:3b7:5b40:703 with SMTP id
 ffacd0b85a97d-3b768f06ab7mr6405353f8f.46.1753388348919; Thu, 24 Jul 2025
 13:19:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250714-ivc-v4-0-534ea488c738@ideasonboard.com>
 <20250714-ivc-v4-2-534ea488c738@ideasonboard.com> <CA+V-a8s-WA8wyka6Z3Y-Fp1xNbcB=i8wPucJqA-nsp_fOKk=BQ@mail.gmail.com>
 <f5bed915-f6f6-4b64-b1d0-cf4ba1c3ec30@ideasonboard.com>
In-Reply-To: <f5bed915-f6f6-4b64-b1d0-cf4ba1c3ec30@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 24 Jul 2025 21:18:41 +0100
X-Gm-Features: Ac12FXyQXJ_bn90oC3PQAc75xrG_SulsUzWNMoH5X9Qod7uRCe5qK-wjbjwER48
Message-ID: <CA+V-a8tghkRS5+ip7bXL_6zZehxUu97E8JAzs2gkbkr=WEYY=A@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] media: platform: Add Renesas Input Video Control
 block driver
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, jacopo.mondi@ideasonboard.com, 
	biju.das.jz@bp.renesas.com, laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,

On Thu, Jul 24, 2025 at 7:04=E2=80=AFPM Dan Scally <dan.scally@ideasonboard=
.com> wrote:
>
> Hi Prabhakar - thanks for the review
>
> On 24/07/2025 17:52, Lad, Prabhakar wrote:
> > Hi Daniel,
> >
> > Thank you for the patch.
> >
> > On Mon, Jul 14, 2025 at 4:25=E2=80=AFPM Daniel Scally
> > <dan.scally@ideasonboard.com> wrote:
> >> Add a driver for the Input Video Control block in an RZ/V2H SoC which
> >> feeds data into the Arm Mali-C55 ISP.
> >>
> > s/V2H/V2HP everywhere.
> Ack!
> >> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> >> ---
> >> Changes in v5:
> >>
> >>          - Fixed .enum_frame_sizes() to properly check that the
> >>            given mbus_code matches the source pads format.
> >>          - Tidy up extra space in Kconfig
> >>          - Revise Kconfig option message
> >>          - Don't mark functions inline
> >>          - Fixup misleading comment
> >>          - select CONFIG_PM
> >>          - Use the new pm_sleep_ptr() functionality
> >>          - Minor formatting
> >>
> >> Changes in v4:
> >>
> >>          - Update the compatible to renesas,r9a09g057-ivc
> >>          - Dropped the media jobs / scheduler functionality, and re
> >>            worked the driver to have its own workqueue pushing frames
> >>          - Fix .enum_mbus_code() to return 20-bit output for source
> >>            pad.
> >>          - Fix some alignment issues
> >>          - Make the forwarding of sink to source pad format a more
> >>            explicit operation.
> >>          - Rename rzv2h_initialise_video_device_and_queue()
> >>          - Reversed order of v4l2_subdev_init_finalize() and
> >>            v4l2_async_register_subdev() to make sure everything is
> >>            finished initialising before registering the subdev.
> >>          - Change function to MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER
> >>          - Use a parametised macro for min vblank
> >>          - Minor formatting
> >>          - Use the DEFAULT macros for quantization / ycbcr_enc values
> >>          - Switch to using the mplane API
> >>          - Dropped select RESET_CONTROLLER
> >>          - Used the new helpers for starting a media pipeline
> >>          - Switch from threaded irq to normal with driver workqueue
> >>            and revised startup routine
> >>
> >> Changes in v3:
> >>
> >>          - Account for the renamed CRU pixel formats
> >>
> >> Changes in v2:
> >>
> >>          - Added selects and depends statements to Kconfig entry
> >>          - Fixed copyright year
> >>          - Stopped including in .c files headers already included in .=
h
> >>          - Fixed uninitialized variable in iterator
> >>          - Only check vvalid member in interrupt function and wait
> >>            unconditionally elsewhere
> >>          - __maybe_unused for the PM ops
> >>          - Initialise the subdevice after setting up PM
> >>          - Fixed the remove function for the driver to actually do
> >>            something.
> >>          - Some minor formatting changes
> >>          - Fixed the quantization member for the format
> >>          - Changes accounting for the v2 of the media jobs framework
> >>          - Change min_queued_buffers to 0
> >> ---
> >>   drivers/media/platform/renesas/Kconfig             |   1 +
> >>   drivers/media/platform/renesas/Makefile            |   1 +
> >>   drivers/media/platform/renesas/rzv2h-ivc/Kconfig   |  18 +
> >>   drivers/media/platform/renesas/rzv2h-ivc/Makefile  |   5 +
> >>   .../platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c     | 229 +++++++++
> >>   .../platform/renesas/rzv2h-ivc/rzv2h-ivc-subdev.c  | 376 +++++++++++=
+++
<snip>
> > ISP Probe:
> > [   11.600383] mali-c55 16080000.isp: Detected Mali-C55 ISP 9000043.310=
32022.0
> > [   11.622062] mali-c55 16080000.isp: Runtime PM usage count underflow!
> >
> > Logs from IVC:
> > root@rzv2h-evk:~/c55# media-ctl -p
> > Media controller API version 6.16.0
> >
> > Media device information
> > ------------------------
> > driver          mali-c55
> > model           ARM Mali-C55 ISP
> > serial
> > bus info        platform:16080000.isp
> > hw revision     0x1d982d6
> > driver version  6.16.0
> >
> > Device topology
> > - entity 1: mali-c55 tpg (1 pad, 1 link, 0 routes)
> >              type V4L2 subdev subtype Sensor flags 0
> >              device node name /dev/v4l-subdev0
> >          pad0: SOURCE
> >                  [stream:0 fmt:SRGGB20_1X20/1920x1080 field:none
> > colorspace:raw xfer:none ycbcr:601 quantization:lim-range]
> >                  -> "mali-c55 isp":0 []
> >
> > - entity 3: mali-c55 isp (5 pads, 6 links, 0 routes)
> >              type V4L2 subdev subtype Unknown flags 0
> >              device node name /dev/v4l-subdev1
> >          pad0: SINK,MUST_CONNECT
> >                  [stream:0 fmt:SGRBG20_1X20/2304x1296 field:none
> > colorspace:raw xfer:none ycbcr:601 quantization:lim-range
> >                   crop:(0,0)/2304x1296]
> >                  <- "mali-c55 tpg":0 []
> >                  <- "rzv2h ivc block":1 [ENABLED]
> >          pad1: SOURCE
> >                  [stream:0 fmt:RGB121212_1X36/2304x1296 field:none
> > colorspace:srgb xfer:none ycbcr:601 quantization:lim-range]
> >                  -> "mali-c55 resizer fr":0 [ENABLED,IMMUTABLE]
> >          pad2: SOURCE
> >                  [stream:0 fmt:SGRBG20_1X20/2304x1296 field:none
> > colorspace:raw xfer:none ycbcr:601 quantization:lim-range]
> >                  -> "mali-c55 resizer fr":2 [ENABLED,IMMUTABLE]
> >          pad3: SOURCE
> >                  [stream:0 fmt:unknown/0x0 field:none]
> >                  -> "mali-c55 3a stats":0 []
> >          pad4: SINK
> >                  [stream:0 fmt:unknown/0x0 field:none]
> >                  <- "mali-c55 3a params":0 []
> >
> > - entity 9: mali-c55 resizer fr (3 pads, 3 links, 0 routes)
> >              type V4L2 subdev subtype Unknown flags 0
> >              device node name /dev/v4l-subdev2
> >          pad0: SINK
> >                  [stream:0 fmt:RGB121212_1X36/2304x1296 field:none
> > colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range
> >                   crop:(0,0)/2304x1296
> >                   compose:(0,0)/2304x1296]
> >                  <- "mali-c55 isp":1 [ENABLED,IMMUTABLE]
> >          pad1: SOURCE
> >                  [stream:0 fmt:RGB121212_1X36/2304x1296 field:none
> > colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range]
> >                  -> "mali-c55 fr":0 [ENABLED]
> >          pad2: SINK
> >                  <- "mali-c55 isp":2 [ENABLED,IMMUTABLE]
> >
> > - entity 13: mali-c55 fr (1 pad, 1 link)
> >               type Node subtype V4L flags 0
> >               device node name /dev/video0
> >          pad0: SINK
> >                  <- "mali-c55 resizer fr":1 [ENABLED]
> >
> > - entity 17: mali-c55 3a params (1 pad, 1 link)
> >               type Node subtype V4L flags 0
> >               device node name /dev/video1
> >          pad0: SOURCE
> >                  -> "mali-c55 isp":4 []
> >
> > - entity 21: mali-c55 3a stats (1 pad, 1 link)
> >               type Node subtype V4L flags 0
> >               device node name /dev/video2
> >          pad0: SINK
> >                  <- "mali-c55 isp":3 []
> >
> > - entity 37: rzv2h ivc block (2 pads, 2 links, 0 routes)
> >               type V4L2 subdev subtype Unknown flags 0
> >               device node name /dev/v4l-subdev3
> >          pad0: SINK
> >                  [stream:0 fmt:SGRBG10_1X10/2304x1296 field:none
> > colorspace:raw xfer:none ycbcr:601 quantization:full-range]
> >                  <- "rzv2h-ivc":0 [ENABLED,IMMUTABLE]
> >          pad1: SOURCE
> >                  [stream:0 fmt:SGRBG20_1X20/2304x1296 field:none
> > colorspace:raw xfer:none ycbcr:601 quantization:full-range]
> >                  -> "mali-c55 isp":0 [ENABLED]
> >
> > - entity 40: rzv2h-ivc (1 pad, 1 link)
> >               type Node subtype V4L flags 0
> >               device node name /dev/video3
> >          pad0: SOURCE
> >                  -> "rzv2h ivc block":0 [ENABLED,IMMUTABLE]
> >
> > root@rzv2h-evk:~/c55#
> > root@rzv2h-evk:~# v4l2-ctl -d3 --stream-out-mmap
> > --stream-from=3D/root/c55/frame-15.bin --stream-loop
> >>>>> VIDIOC_STREAMON returned -1 (Input/output error)
> > root@rzv2h-evk:~#
> >
> > Logs from ISP:
> > root@rzv2h-evk:~/c55# ./isp.sh
> > Device /dev/video0 opened.
> > Device `ARM Mali-C55 ISP' on `platform:16080000.isp' (driver
> > 'mali-c55') supports video, capture, with mplanes.
> > Video format set: RGB565 (50424752) 2304x1296 field none, 1 planes:
> >   * Stride 4608, buffer size 5971968
> > Video format: RGB565 (50424752) 2304x1296 field none, 1 planes:
> >   * Stride 4608, buffer size 5971968
> > 8 buffers requested.
> > length: 1 offset: 4017363672 timestamp type/source: mono/EoF
> > Buffer 0/0 mapped at address 0xffff81f2e000.
> > length: 1 offset: 4017363672 timestamp type/source: mono/EoF
> > Buffer 1/0 mapped at address 0xffff8197c000.
> > length: 1 offset: 4017363672 timestamp type/source: mono/EoF
> > Buffer 2/0 mapped at address 0xffff813ca000.
> > length: 1 offset: 4017363672 timestamp type/source: mono/EoF
> > Buffer 3/0 mapped at address 0xffff80e18000.
> > length: 1 offset: 4017363672 timestamp type/source: mono/EoF
> > Buffer 4/0 mapped at address 0xffff80866000.
> > length: 1 offset: 4017363672 timestamp type/source: mono/EoF
> > Buffer 5/0 mapped at address 0xffff802b4000.
> > length: 1 offset: 4017363672 timestamp type/source: mono/EoF
> > Buffer 6/0 mapped at address 0xffff7fd02000.
> > length: 1 offset: 4017363672 timestamp type/source: mono/EoF
> > Buffer 7/0 mapped at address 0xffff7f750000.
> > [   92.647719] kauditd_printk_skb: 8 callbacks suppressed
> > [   92.647734] audit: type=3D1006 audit(1753371566.385:25): pid=3D407
> > uid=3D0 old-auid=3D4294967295 auid=3D0 tty=3D(none) old-ses=3D429496729=
5 ses=3D4
> > res=3D1
> > [   92.665263] audit: type=3D1300 audit(1753371566.385:25):
> > arch=3Dc00000b7 syscall=3D64 success=3Dyes exit=3D1 a0=3D7 a1=3Dffffc4f=
f5740 a2=3D1
> > a3=3D1 items=3D0 ppid=3D1 pid=3D407 auid=3D0 uid=3D0 gid=3D0 euid=3D0 s=
uid=3D0 fsuid=3D0
> > egid=3D0 sgid=3D0 fsgid=3D0 tty=3D(none) ses=3D4 comm=3D"sshd"
> > exe=3D"/usr/sbin/sshd" key=3D(null)
> > [   92.689604] audit: type=3D1327 audit(1753371566.385:25):
> > proctitle=3D737368643A20726F6F74205B707269765D
> >
> > [  100.932191] rz-dmac 11400000.dma-controller: dma_sync_wait: timeout!
> > [  100.938566] mali-c55 16080000.isp: Failed to DMA xfer ISP config
> > [  100.944702] mali-c55 16080000.isp: failed to write ISP config
> > [  100.950562] mali-c55 16080000.isp: Failed to start ISP
>
>
> Hm, Is this on the EVK? How did you set up devicetree?  It's trying to us=
e the DMA write; I've so
> far just been using CPU write on the RZ/V2H...I'll try to replicate it an=
d see where I get
>
>
Yes this is on the EVK. I have the changes [0] done to get it working
(Ive not enabled the DMA).

[0] https://gist.github.com/prabhakarlad/bb1d3649243617d88c9b4e8b386f0803

Cheers,
Prabhakar

