Return-Path: <linux-media+bounces-21208-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC959C2E40
	for <lists+linux-media@lfdr.de>; Sat,  9 Nov 2024 16:37:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 914E0B217F0
	for <lists+linux-media@lfdr.de>; Sat,  9 Nov 2024 15:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65F7519C560;
	Sat,  9 Nov 2024 15:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C2MuX/hq"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8089519B3D8
	for <linux-media@vger.kernel.org>; Sat,  9 Nov 2024 15:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731166638; cv=none; b=LeRKB1ASTPkoQMSDUxh5TDA6PUAveueocWI3zCeU1a23CZtXyVjiuiLCXQC5UommI68fIBD944IYC2f9xMhDFGx1BjBDU11CdQbufuPoqIDVFm6AWZoBweET/ECraLYH4BuaMgrZJYmjrQBWtuNii+wth5V4QpByGQjuGxdefW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731166638; c=relaxed/simple;
	bh=CMhgmPa/7GY5jY/1jI5kork1XPLfwQIpAg+Qm01pifY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WIpMEMuop26/0hqvnC6qM554tirQPFt03fqjTq2Eb1NbzsyuWQbTdDd+awaV0lSEN7mRrrSbmapcvQcLJHhAvXvQo854Bnr3L1LARWKZ5IEEcDzFG36l7TVQYlN8pf/HD+3rWCMFsTV/Nusi0E0NWs8Vk0NjKVi4ZRHqsPz3yrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C2MuX/hq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731166635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nTbYIYpi07qaYiHPrfSS1ML2U/iwniiMpToNMNJxlZA=;
	b=C2MuX/hqJYHwiX0D369GRz6jXXCTTinFtuSciZd0wO3nHVtc/7PjhRW6l48wZuEzYAj7vr
	HHKC4g+USh6RJZoDDHyLmr3tbcONhGAVw0/hgVoq0Mp4nfJELxqPFJeQL4rRffZCgwo3vH
	nLZOPILa7xM/zmiNGLYuPJNJOnl8Pos=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-230-yIlLBcOpP1CSH7xMgfblsA-1; Sat, 09 Nov 2024 10:37:13 -0500
X-MC-Unique: yIlLBcOpP1CSH7xMgfblsA-1
X-Mimecast-MFC-AGG-ID: yIlLBcOpP1CSH7xMgfblsA
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a99f084683fso279958166b.3
        for <linux-media@vger.kernel.org>; Sat, 09 Nov 2024 07:37:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731166632; x=1731771432;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nTbYIYpi07qaYiHPrfSS1ML2U/iwniiMpToNMNJxlZA=;
        b=U/lxqou4Rsehcm/5hgQla+rAmoc89dkMkomq+NyrQBd33f9nDUXyffPLP1tPAkbf36
         Di/jFrSB4uoSSWAMK5q4sFho0RVUDjvuQJ8NtAUfJ64Rxlbg2bsvVo3Luh2+oHQAiYcF
         MsLwWf5wlAINud8sQx6dbXltjEPb8OsdQg5EdSuP8fBhGhSYo9iAWBsFIHGmrXb2d90W
         ka2FyMYkhT8E2voLdSd0QCrVzQ3+gZIqpSD6lknHCzrSsTWxxaeU3JGd6sur6DBhFqbz
         Qs/5oUaX/IFJ5dJPvntuhEbDnSbZTDmBprh4tY5cipWOFiBOlapt7a153AvPl8XKb8JW
         q8YA==
X-Forwarded-Encrypted: i=1; AJvYcCUJp+VBr9eFPCaA3zILxiRxcnDtms8eq1gHQ5DJd5iI/iDu8enavplMJHPpzJvllTg7QpDHlrIiqyXK5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YycPX3WSTWrggbo4+xv9QTTB7LETqdOw1jlg0sZBagoJkKkTBxc
	4jtpdormCBR3pf3NcoT3q67WgmEu0Os32L39gQW2gU1WW0WXnbxpi4LsBIxQrPLBovZi9hp9X6p
	uu46YlzuHlDCMVXhQbYMZ1b5q+ZoM829CGWoRlue+oFDpdybKrCITHeMjKLJ/
X-Received: by 2002:a17:907:2d0c:b0:a9a:154e:dd86 with SMTP id a640c23a62f3a-a9eeff43e6emr705692566b.28.1731166632338;
        Sat, 09 Nov 2024 07:37:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGrOh7Jh0sTG4WbDk95Xyy5PpWsN6x46Bhm3llxBbdpXsDX5h83aXperpcSkWuSHdHDt3a7XA==
X-Received: by 2002:a17:907:2d0c:b0:a9a:154e:dd86 with SMTP id a640c23a62f3a-a9eeff43e6emr705688766b.28.1731166631819;
        Sat, 09 Nov 2024 07:37:11 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0a18521sm377753266b.20.2024.11.09.07.37.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Nov 2024 07:37:11 -0800 (PST)
Message-ID: <5b5f3bb7-7933-4861-be81-30345e333395@redhat.com>
Date: Sat, 9 Nov 2024 16:37:10 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] media: uvcvideo: Implement the Privacy GPIO as a
 subdevice
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 Yunke Cao <yunkec@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>
References: <20241108-uvc-subdev-v2-0-85d8a051a3d3@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241108-uvc-subdev-v2-0-85d8a051a3d3@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricardo,

FYI / some background: I have been asked to start helping /
co-maintaining UVC with Laurent. I'll send out a patch adding
myself as UVC maintainer soon.

On 8-Nov-24 9:25 PM, Ricardo Ribalda wrote:
> Some notebooks have a button to disable the camera (not to be mistaken
> with the mechanical cover). This is a standard GPIO linked to the
> camera via the ACPI table.
> 
> 4 years ago we added support for this button in UVC via the Privacy control.
> This has two issues:
> - If the camera has its own privacy control, it will be masked
> - We need to power-up the camera to read the privacy control gpio.
> 
> We tried to fix the power-up issues implementing "granular power
> saving" but it has been more complicated than anticipated....

I have been discussing UVC power-management with Laurent, also
related to power-consumption issues caused by libcamera's pipeline
handler holding open the /dev/video# node as long as the camera
manager object exists.

For now we have fixed this with some relatively small changes to
libcamera's uvcvideo pipeline handler, but that is really meant
as an interim solution and as this privacy control series shows
the power-management issues are real.

Combined with Mauro's remarks about how this is an userspace ABI break (1)
I think we should maybe first take another look at the powermanagement
issues in general rather then moving forward with this series.

My apologies for this, I realize how annoying it can be when you are
working on a patch series to fix a specific issue and a reviewer
moves the goal-posts like this. But I do really think that just fixing
the generic power-management issues would be better and I also think
that this should be feasible / not too hard.

Here is what I have in mind for this:

1. Assume that the results of trying a specific fmt do not change over time.

2. Only allow userspace to request fmts which match one of the enum-fmts ->
   enum-frame-sizes -> enum-frame-rates tripplet results
   (constrain what userspace requests to these)

3. Run the equivalent of tryfmt on all possible combinations (so the usaul
   3 levels nested loop for this) on probe() and cache the results

4. Make try_fmt / set_fmt not poweron the device but instead constrain
   the requested fmt to one from our cached fmts

5. On stream-on do the actual power-on + set-fmt + verify that we get
   what we expect based on the cache, and otherwise return -EIO.

I think that should sort the issue, assuming that 1. above holds true.

One downside is that this stops UVC button presses from working when
not streaming. But userspace will typically only open the /dev/video#
node if it plans to stream anyways so there should not be much of
a difference wrt button press behavior.

This should also make camera enumeration faster for apps, since
most apps / frameworks do the whole 3 levels nested loop for this
on startup, for which atm we go out to the hw, which now instead
will come from the fmts cache and thus will be much much faster,
so this should lead to a noticeable speedup for apps accessing UVC
cameras which would be another nice win.

Downside is that the initial probe will take longer see we do
all the tryfmt-s there now. But I think that taking a bit longer
to probe while the machine is booting should not be an issue.

Regards,

Hans


1) Which is technically correct, but FWIW I agree with you that I think
most userspace consumers will not care




> Last year, we proposed a patchset to implement the privacy gpio as a
> subdevice https://lore.kernel.org/linux-media/20230111-uvc_privacy_subdev-v1-0-f859ac9a01e3@chromium.org/
> 
> I think it is a pretty clean solution and makes sense to use a
> subdevice for something that is a sub device of the camera :).
> 
> This is an attempt to continue with that approach.
> 
> Tested on gimble:
> gimble-rev3 ~ # v4l2-ctl --all -d /dev/v4l-subdev0
> Driver Info:
>         Driver version   : 6.6.56
>         Capabilities     : 0x00000000
> Media Driver Info:
>         Driver name      : uvcvideo
>         Model            : HP 5M Camera: HP 5M Camera
>         Serial           : 0001
>         Bus info         : usb-0000:00:14.0-6
>         Media version    : 6.6.56
>         Hardware revision: 0x00009601 (38401)
>         Driver version   : 6.6.56
> Interface Info:
>         ID               : 0x0300001d
>         Type             : V4L Sub-Device
> Entity Info:
>         ID               : 0x00000013 (19)
>         Name             : GPIO
>         Function         : Unknown sub-device (00020006)
> 
> Camera Controls
> 
>                         privacy 0x009a0910 (bool)   : default=0 value=0 flags=read-only, volatile
> 
> gimble-rev3 ~ # media-ctl  -p
> Media controller API version 6.6.56
> 
> Media device information
> ------------------------
> driver          uvcvideo
> model           HP 5M Camera: HP 5M Camera
> serial          0001
> bus info        usb-0000:00:14.0-6
> hw revision     0x9601
> driver version  6.6.56
> 
> Device topology
> - entity 1: HP 5M Camera: HP 5M Camera (1 pad, 1 link)
>             type Node subtype V4L flags 1
>             device node name /dev/video0
>         pad0: Sink
>                 <- "Extension 8":1 [ENABLED,IMMUTABLE]
> 
> - entity 4: HP 5M Camera: HP 5M Camera (0 pad, 0 link)
>             type Node subtype V4L flags 0
>             device node name /dev/video1
> 
> - entity 8: Extension 8 (2 pads, 2 links, 0 routes)
>             type V4L2 subdev subtype Unknown flags 0
>         pad0: Sink
>                 <- "Extension 4":1 [ENABLED,IMMUTABLE]
>         pad1: Source
>                 -> "HP 5M Camera: HP 5M Camera":0 [ENABLED,IMMUTABLE]
> 
> - entity 11: Extension 4 (2 pads, 2 links, 0 routes)
>              type V4L2 subdev subtype Unknown flags 0
>         pad0: Sink
>                 <- "Processing 2":1 [ENABLED,IMMUTABLE]
>         pad1: Source
>                 -> "Extension 8":0 [ENABLED,IMMUTABLE]
> 
> - entity 14: Processing 2 (2 pads, 2 links, 0 routes)
>              type V4L2 subdev subtype Unknown flags 0
>         pad0: Sink
>                 <- "Camera 1":0 [ENABLED,IMMUTABLE]
>         pad1: Source
>                 -> "Extension 4":0 [ENABLED,IMMUTABLE]
> 
> - entity 17: Camera 1 (1 pad, 1 link, 0 routes)
>              type V4L2 subdev subtype Sensor flags 0
>         pad0: Source
>                 -> "Processing 2":0 [ENABLED,IMMUTABLE]
> 
> - entity 19: GPIO (0 pad, 0 link, 0 routes)
>              type V4L2 subdev subtype Decoder flags 0
>              device node name /dev/v4l-subdev0
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> Changes in v2:
> - Rebase on top of https://patchwork.linuxtv.org/project/linux-media/patch/20241106-uvc-crashrmmod-v6-1-fbf9781c6e83@chromium.org/
> - Create uvc_gpio_cleanup and uvc_gpio_deinit
> - Refactor quirk: do not disable irq
> - Change define number for MEDIA_ENT_F_GPIO
> - Link to v1: https://lore.kernel.org/r/20241031-uvc-subdev-v1-0-a68331cedd72@chromium.org
> 
> ---
> Ricardo Ribalda (5):
>       media: uvcvideo: Factor out gpio functions to its own file
>       Revert "media: uvcvideo: Allow entity-defined get_info and get_cur"
>       media: uvcvideo: Create ancillary link for GPIO subdevice
>       media: v4l2-core: Add new MEDIA_ENT_F_GPIO
>       media: uvcvideo: Use MEDIA_ENT_F_GPIO for the GPIO entity
> 
> Yunke Cao (1):
>       media: uvcvideo: Re-implement privacy GPIO as a separate subdevice
> 
>  .../userspace-api/media/mediactl/media-types.rst   |   4 +
>  drivers/media/usb/uvc/Makefile                     |   3 +-
>  drivers/media/usb/uvc/uvc_ctrl.c                   |  40 +----
>  drivers/media/usb/uvc/uvc_driver.c                 | 123 +-------------
>  drivers/media/usb/uvc/uvc_entity.c                 |  20 ++-
>  drivers/media/usb/uvc/uvc_gpio.c                   | 187 +++++++++++++++++++++
>  drivers/media/usb/uvc/uvc_video.c                  |   4 +
>  drivers/media/usb/uvc/uvcvideo.h                   |  34 ++--
>  drivers/media/v4l2-core/v4l2-async.c               |   3 +-
>  include/uapi/linux/media.h                         |   1 +
>  10 files changed, 252 insertions(+), 167 deletions(-)
> ---
> base-commit: 4353256f5487e0c5c47e8ff764bf4f9e679fb525
> change-id: 20241030-uvc-subdev-89f4467a00b5
> 
> Best regards,


