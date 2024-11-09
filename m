Return-Path: <linux-media+bounces-21206-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBF29C2DB4
	for <lists+linux-media@lfdr.de>; Sat,  9 Nov 2024 15:05:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 606E01F22435
	for <lists+linux-media@lfdr.de>; Sat,  9 Nov 2024 14:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BA961946A0;
	Sat,  9 Nov 2024 14:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rp9qD1VF"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDC91E4B2;
	Sat,  9 Nov 2024 14:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731161100; cv=none; b=utGfPojmmx3JB3rkVZd+FiwGnlsuoWK4EXrdghv54EBT2MG/P13a6QJEzoRE94DNgGCGRmJVMb9u/Mivp20SPvHWdMJmsUqkdO1ubUmFFiSoUFrwi3DcDuW3/h+/HcUJuW0fXfAokVtTOqvCaZyLnqNTxihbxo1lD56x9mr9GiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731161100; c=relaxed/simple;
	bh=4yOu+TnIpLA5EfRXQwATgH1ejXLnej8bgp6pgBiYAGc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H+lsK0ubFIc9ZJkjxkShLhLFfGbHa5ysPGfmBatlqH+xZeRUWj98tGAcaaXlJ55VxGvya7XYxzSCkQRsyHuk+XJBNOGyl27hX+lSp0gEXl9a0aIRjNZdvnJ1K557fypYP6EfkzR7MrX8yaHn7G5XZ+KeZNxrkXbGVmW1GXEENiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rp9qD1VF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52DE4C4CECE;
	Sat,  9 Nov 2024 14:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731161100;
	bh=4yOu+TnIpLA5EfRXQwATgH1ejXLnej8bgp6pgBiYAGc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rp9qD1VFBjBLnS4/tk4g6kh75geVmsOIeVrCT7mxTSjParc09hOh0+BItRC4cZv/L
	 zkhO3IrBO0CzjPSe3n9WUITd1gLPiEKtokQRITPfh1PaHq42mN6bDS0GhbTynvHjc6
	 bgoTbm3TnnDVO6XSMYGRTkx6xinrh/5zLd6PpWaLQI9p3vG2aag7HMAveYzW9Lk9Qf
	 6HRTyAQ4C22pUxe3nK0hg7+KW9p6Wst6yZCmv6cxLeqrNgO2rR/0JrMFAq9LoO5OQT
	 hhfqk9PGR+J0iA1CoDEHhRLegQv7tYr9FQdbCdz4NFpNCpT8pW1o1apogyMtPjbGXm
	 gobdYrkGQI8MQ==
Date: Sat, 9 Nov 2024 15:04:20 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, Yunke Cao
 <yunkec@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede
 <hdegoede@redhat.com>
Subject: Re: [PATCH v2 0/6] media: uvcvideo: Implement the Privacy GPIO as a
 subdevice
Message-ID: <20241109150420.359bd50f@foz.lan>
In-Reply-To: <20241108-uvc-subdev-v2-0-85d8a051a3d3@chromium.org>
References: <20241108-uvc-subdev-v2-0-85d8a051a3d3@chromium.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Fri, 08 Nov 2024 20:25:44 +0000
Ricardo Ribalda <ribalda@chromium.org> escreveu:

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
> 
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

No matter if internally implemented as a subdevice or not,
UVC is not a MC-centric device[1]. 

It means that UVC can be compiled without media controller support,
and that its functionality shall be visible via /dev/video* nodes.

So, whatever internal implementation it is used, it shall not require
config MEDIA_CONTROLLER and the control shall be visible via
/dev/video*.

Moving privacy control out of /dev/video would mean that this will break 
support for it on existing applications, which is a big nack. Now, it would
be acceptable to have this visible via V4L2 and subdev APIs.

[1] https://www.kernel.org/doc/html/latest/userspace-api/media/glossary.html#term-MC-centric

Regards,
Mauro

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



Thanks,
Mauro

