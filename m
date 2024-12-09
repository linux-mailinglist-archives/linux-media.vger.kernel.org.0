Return-Path: <linux-media+bounces-22860-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 765419E8E16
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 09:57:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E411280E1B
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 08:57:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F7CA21A946;
	Mon,  9 Dec 2024 08:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="m1Riq1Ob"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD64218EAA
	for <linux-media@vger.kernel.org>; Mon,  9 Dec 2024 08:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733734403; cv=none; b=tmV2MMZjb0BRZ3uB0vhBytfEECEBRR065AoO6ejHbR+PofTtK1yKvokLPrXFb+BaEby11gfhbKDR3lCvMye61qPqtoWLBm2GK1EZXUwGQUc82ctCDyBmyHE5kgmymFYNcVcfGvQpXSbagOCk245WHlTQDDuWElDfJhNbEh5THrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733734403; c=relaxed/simple;
	bh=XrkuNBaA2KFMauWBm/RYoNs/Hm4MI1nuYtz383nCUnU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zw1CpxsLccUJUqzjc+1fVX8kmH3kw934jnGVyXSwZp93JIRxS2ifR0kqf/9Oa5WtlbscC/ZiDIIov+tBkGkMSPKeXpm0dh5HmI0sAEMuKG/lNZxjxZUHGqOy91O1LvPL1HP3owkQIl7PyNN5KqiGmCPcn7j/LMISrj2XCTw4jeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=m1Riq1Ob; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6ef8028fe9fso33667027b3.2
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2024 00:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733734400; x=1734339200; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iPUVctTsNe0r6IsZecNZEOZeVyvwjX2Ivrhtlu3S+Ng=;
        b=m1Riq1Obkeyq66a0uWBWl87D3iF+0UYJyBeGdcUE4i6L7dc3rueA8h/IRa5tVYuOx0
         3cWb4ba5zP3y2ohKTQb2MNpSk+b+SFfp+Dyi8B9/rTFwq0cSkbtZKxyj//lsZeMW0w2I
         SX3DKczqVp/duExuM686q9uXAx4Tfed+JL0Pk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733734400; x=1734339200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iPUVctTsNe0r6IsZecNZEOZeVyvwjX2Ivrhtlu3S+Ng=;
        b=nR7pCROzIrUiiZEy+kMt88cbGqciYrpt/7IgTvqvdM7hqG9l7dRk3QmWr+LPbBndlG
         0ZDErY23R+2J+emGMsPgMIXSq5GUCPyZIM/z+yrC+I3YwaKq6T5cN3dE2s7m7/jjFOCY
         +QxfGJtOnwQen79GExKQSl7yQsMqhcQ1LNEbiKl16RpTdsrZeAv3v6lJrQhqIXR7NacN
         KPFCbTXUxoSmI4PlbhXV8bh/t+F7LE8wpi+GV2Q0+exEtrMtpVQ1B0DsS1LVJ6mUIOFQ
         /QpUOmaw8RQSQ/FHkgpcdH/lu/tGbAiRbECEraMEgbeeIqGMWIMZQLEQ43P07Wn5uujJ
         HKxg==
X-Forwarded-Encrypted: i=1; AJvYcCWeR/OjGC1UNUzoOu39VD0MHUviwldk2QylH7GpGlNSVVzVENENEYMmBMqgAYDSIj7FgB+/hlBB0kwjDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3fCvS3xDyG71M3k3/z/f9W6bMf4HdLQBopfyHMAxh4bZLfemA
	GMJVsKQ1vcJ3YZBygI16vA3dc6L5P9m8ofTl2tr11YCC4mKJYpI5jZmWLvdtBeHobhZH4w0ZlaJ
	IO+//31JTARzlvJKmJrh4mHrUwHN6BI0BwnpP
X-Gm-Gg: ASbGncsx+d9HX40yVcMHva9SpMAgnaBgtoK4QAShzkPoMt/EHeAEznV+Pt2sKDMiEBb
	Svq8hWcqxHofr5L/g1P3TkpxP6x4Bt0s=
X-Google-Smtp-Source: AGHT+IGwuFimavtR5bh3h9P+zvQY5iOG73cLkemO+XKYDlhb2TDqMuz/IxiB1BILzRlt/SAPe4mvu0sMF8C4J4ccZ9k=
X-Received: by 2002:a05:690c:7088:b0:6e5:9cb7:853c with SMTP id
 00721157ae682-6efe3c836b8mr98477407b3.31.1733734399790; Mon, 09 Dec 2024
 00:53:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
In-Reply-To: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
From: Yunke Cao <yunkec@chromium.org>
Date: Mon, 9 Dec 2024 17:53:08 +0900
Message-ID: <CAEDqmY5nuJQkv-J6WgyqXG7J1GR+8Sa3wzXQ7RpDMUrdDgTOKg@mail.gmail.com>
Subject: Re: [PATCH v15 00/19] media: uvcvideo: Implement UVC v1.5 ROI
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	Ricardo Ribalda <ribalda@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Yunke Cao <yunkec@google.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Daniel Scally <dan.scally@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ricardo,

I've tested the patchset with the fix I commented on in patch 18/19 on
Chrome OS and verified that the region of interest works as expected.

Tested-by: Yunke Cao <yunkec@google.com>

Best,
Yunke

On Fri, Nov 15, 2024 at 4:10=E2=80=AFAM Ricardo Ribalda <ribalda@chromium.o=
rg> wrote:
>
> This patchset implements UVC v1.5 region of interest using V4L2
> control API.
>
> ROI control is consisted two uvc specific controls.
> 1. A rectangle control with a newly added type V4L2_CTRL_TYPE_RECT.
> 2. An auto control with type bitmask.
>
> V4L2_CTRL_WHICH_MIN/MAX_VAL is added to support the rectangle control.
>
> The corresponding v4l-utils series can be found at
> https://patchwork.linuxtv.org/project/linux-media/list/?series=3D11069 .
>
> Tested with v4l2-compliance, v4l2-ctl, calling ioctls on usb cameras and
> VIVID with a newly added V4L2_CTRL_TYPE_RECT control.
>
> This set includes also the patch:
> media: uvcvideo: Fix event flags in uvc_ctrl_send_events
> It is not technically part of this change, but we conflict with it.
>
> I am continuing the work that Yunke did.
>
> Changes in v15:
> - Modify mapping set/get to support any size
> - Remove v4l2_size field. It is not needed, we can use the v4l2_type to
>   infer it.
> - Improve documentation.
> - Lots of refactoring, now adding compound and roi are very small
>   patches.
> - Remove rectangle clamping, not supported by some firmware.
> - Remove init, we can add it later.
> - Move uvc_cid to USER_BASE
>
> - Link to v14: https://lore.kernel.org/linux-media/20231201071907.3080126=
-1-yunkec@google.com/
>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> Hans Verkuil (1):
>       media: v4l2-ctrls: add support for V4L2_CTRL_WHICH_MIN/MAX_VAL
>
> Ricardo Ribalda (12):
>       media: uvcvideo: Fix event flags in uvc_ctrl_send_events
>       media: uvcvideo: Handle uvc menu translation inside uvc_get_le_valu=
e
>       media: uvcvideo: Handle uvc menu translation inside uvc_set_le_valu=
e
>       media: uvcvideo: refactor uvc_ioctl_g_ext_ctrls
>       media: uvcvideo: uvc_ioctl_(g|s)_ext_ctrls: handle NoP case
>       media: uvcvideo: Support any size for mapping get/set
>       media: uvcvideo: Factor out clamping from uvc_ctrl_set
>       media: uvcvideo: Factor out query_boundaries from query_ctrl
>       media: uvcvideo: Use the camera to clamp compound controls
>       media: uvcvideo: let v4l2_query_v4l2_ctrl() work with v4l2_query_ex=
t_ctrl
>       media: uvcvideo: Introduce uvc_mapping_v4l2_size
>       media: uvcvideo: Add sanity check to uvc_ioctl_xu_ctrl_map
>
> Yunke Cao (6):
>       media: v4l2_ctrl: Add V4L2_CTRL_TYPE_RECT
>       media: vivid: Add a rectangle control
>       media: uvcvideo: add support for compound controls
>       media: uvcvideo: support V4L2_CTRL_WHICH_MIN/MAX_VAL
>       media: uvcvideo: implement UVC v1.5 ROI
>       media: uvcvideo: document UVC v1.5 ROI
>
>  .../userspace-api/media/drivers/uvcvideo.rst       |  64 ++
>  .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst |  26 +-
>  .../userspace-api/media/v4l/vidioc-queryctrl.rst   |  14 +
>  .../userspace-api/media/videodev2.h.rst.exceptions |   4 +
>  drivers/media/i2c/imx214.c                         |   4 +-
>  drivers/media/platform/qcom/venus/venc_ctrls.c     |   9 +-
>  drivers/media/test-drivers/vivid/vivid-ctrls.c     |  34 +
>  drivers/media/usb/uvc/uvc_ctrl.c                   | 805 +++++++++++++++=
+-----
>  drivers/media/usb/uvc/uvc_v4l2.c                   |  77 +-
>  drivers/media/usb/uvc/uvcvideo.h                   |  25 +-
>  drivers/media/v4l2-core/v4l2-ctrls-api.c           |  54 +-
>  drivers/media/v4l2-core/v4l2-ctrls-core.c          | 167 ++++-
>  drivers/media/v4l2-core/v4l2-ioctl.c               |   4 +-
>  include/media/v4l2-ctrls.h                         |  38 +-
>  include/uapi/linux/usb/video.h                     |   1 +
>  include/uapi/linux/uvcvideo.h                      |  13 +
>  include/uapi/linux/v4l2-controls.h                 |   9 +
>  include/uapi/linux/videodev2.h                     |   5 +
>  18 files changed, 1062 insertions(+), 291 deletions(-)
> ---
> base-commit: 5516200c466f92954551406ea641376963c43a92
> change-id: 20241113-uvc-roi-66bd6cfa1e64
>
> Best regards,
> --
> Ricardo Ribalda <ribalda@chromium.org>
>

