Return-Path: <linux-media+bounces-680-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F7D7F3718
	for <lists+linux-media@lfdr.de>; Tue, 21 Nov 2023 21:05:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7370281CAE
	for <lists+linux-media@lfdr.de>; Tue, 21 Nov 2023 20:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D7A420DC0;
	Tue, 21 Nov 2023 20:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BOuFVD7f"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72E801BB
	for <linux-media@vger.kernel.org>; Tue, 21 Nov 2023 12:05:48 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3b5ff072fc4so3772039b6e.3
        for <linux-media@vger.kernel.org>; Tue, 21 Nov 2023 12:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700597147; x=1701201947; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gOM9RKHgmvEognuoT2mihAVZYGmbf7+DM5clLXjwU9Q=;
        b=BOuFVD7fADDqrgn4G2OHVptKHm+nXE6k3t6NfWYNt2kltbw4m5ZcxC4Jowm8cOgv5m
         ie0rzz4wd0pj6HbzTF3r/Pdp2b7YXzuzIlX3NcgM/TgQE/iGa1US6vhdRMCi9v2XpBZo
         M0SYX/SLKtKPmcKExZppZgoEvy8KRSGx1WlmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700597147; x=1701201947;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gOM9RKHgmvEognuoT2mihAVZYGmbf7+DM5clLXjwU9Q=;
        b=CUyPxHb0opP+TTLZELls0dFDs9QOxAJlx4zgdNr0OGzZzv/RzQUTtl857aeR9z26Fw
         bZYdqSobkjU2WVop+6ElhnUYuoBJzchxE+2Y4vM553XsP+BZJgGyC3ZuPoBsR8JFgbhD
         bo2ftLEaZ/6wh+XKQi+KXyOCxdjLjkE8ukeXT+5Py+x82V+3kwJIiJeI630n3+SXK4hC
         WQ9RTQKde/UoV8OFMnCb69x0GkZNYZe/lEeJRxiHVtjh9XhZoGLQtk42VOQSDBsQoh5y
         jZeP4URkqINR1kLRgZEzC0nrVpL6J0FE9i6/ocdbJqCyXbigIG72a+9JhG/ZswkZ2FLF
         DYDw==
X-Gm-Message-State: AOJu0Yx6C7mvQofGhSJtYojvxdQSnFLFgQMcqvI3nFnkfs9rfDi7xedM
	n8rL0lbuabN3wLkcdpcbP/zXM6Y+DwgGO1KDRKmapA==
X-Google-Smtp-Source: AGHT+IES0vGAS6dnzrEsbpt7vq+vcUrVgVaBn/FjOfEP/wPFZniVXHSg9aDhRB3CryZ1YSzKViVsmg==
X-Received: by 2002:a05:6808:2099:b0:3b8:3bbc:6b6a with SMTP id s25-20020a056808209900b003b83bbc6b6amr483630oiw.24.1700597147084;
        Tue, 21 Nov 2023 12:05:47 -0800 (PST)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com. [209.85.160.47])
        by smtp.gmail.com with ESMTPSA id f6-20020a05680814c600b003b83c13c570sm73809oiw.16.2023.11.21.12.05.46
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 12:05:46 -0800 (PST)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1f055438492so3420121fac.3
        for <linux-media@vger.kernel.org>; Tue, 21 Nov 2023 12:05:46 -0800 (PST)
X-Received: by 2002:a05:6871:4417:b0:1d5:8fb8:98ef with SMTP id
 nd23-20020a056871441700b001d58fb898efmr450576oab.31.1700597145898; Tue, 21
 Nov 2023 12:05:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230111-uvc_privacy_subdev-v1-0-f859ac9a01e3@chromium.org>
In-Reply-To: <20230111-uvc_privacy_subdev-v1-0-f859ac9a01e3@chromium.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 21 Nov 2023 21:05:30 +0100
X-Gmail-Original-Message-ID: <CANiDSCvxZyFqR06a6eb22duyBMEt8yroo8H_Hpmid2vOy7ucVw@mail.gmail.com>
Message-ID: <CANiDSCvxZyFqR06a6eb22duyBMEt8yroo8H_Hpmid2vOy7ucVw@mail.gmail.com>
Subject: Re: [PATCH RFC 0/3] meida: uvcvideo: reimplement privacy gpio as a
 separate subdevice
To: Yunke Cao <yunkec@chromium.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sakari

Could you take a look at this RFC? Would be great to have your opinion
from a subdevice point of view.

Thanks!
On Wed, 11 Jan 2023 at 09:52, Yunke Cao <yunkec@chromium.org> wrote:
>
> privacy_gpio in uvc were added as V4L2_CID_PRIVACY in uvc video node in
> https://lore.kernel.org/all/20201223133528.55014-1-ribalda@chromium.org/
>
> Userspace applications often require to constantly poll privacy control.
> Currently, polling privacy control requires keeping the video node open,
> which prevents the camera from autosuspending.
>
> This patchset adds a separate v4l2 subdevice. Userspace access the gpio
> via V4L2_CID_PRIVACY in the new subdevice. Applications can poll the
> privacy control status without opening the video node and activate the
> camera.
>
> The non-gpio V4L2_CID_PRIVACY in uvc is not affected.
>
> Suggested-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Yunke Cao <yunkec@chromium.org>
> ---
> Yunke Cao (3):
>       media: v4l2-ctrls: Expose v4l2_ctrl_fill_event()
>       media: uvcvideo: remove entity privacy control in the uvc video node
>       media: uvcvideo: reimplement privacy GPIO as a separate subdevice
>
>  drivers/media/usb/uvc/uvc_ctrl.c          | 17 -------
>  drivers/media/usb/uvc/uvc_driver.c        | 44 ++----------------
>  drivers/media/usb/uvc/uvc_entity.c        | 76 +++++++++++++++++++++++++++++++
>  drivers/media/usb/uvc/uvcvideo.h          | 19 +++++---
>  drivers/media/v4l2-core/v4l2-ctrls-core.c |  9 ++--
>  include/media/v4l2-ctrls.h                | 12 +++++
>  6 files changed, 111 insertions(+), 66 deletions(-)
> ---
> base-commit: 7dd4b804e08041ff56c88bdd8da742d14b17ed25
> change-id: 20230111-uvc_privacy_subdev-1e7a167e86eb
>
> Best regards,
> --
> Yunke Cao <yunkec@chromium.org>



-- 
Ricardo Ribalda

