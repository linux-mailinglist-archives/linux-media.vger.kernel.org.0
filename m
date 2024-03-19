Return-Path: <linux-media+bounces-7297-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B9087FB1E
	for <lists+linux-media@lfdr.de>; Tue, 19 Mar 2024 10:52:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25C311C21C08
	for <lists+linux-media@lfdr.de>; Tue, 19 Mar 2024 09:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 518F27D09C;
	Tue, 19 Mar 2024 09:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fg0jbh/3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC50548F9
	for <linux-media@vger.kernel.org>; Tue, 19 Mar 2024 09:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710841935; cv=none; b=jocXlcIZSrDojQps8XYdmvcEzRltHlwiU4MnFBrHtfzoex8OY7w39R6pmflK83JfONsOrYR/0at4qZLD1ss2CmYXrZmQc/bwbCDDPGgEVIaX8WYRWPjup36+qeS/LhlcZR7z0/mLtruBixwDDck7Z55H2Ygti1j6a0j6buY8sVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710841935; c=relaxed/simple;
	bh=LEagbWAc5zz/B+HGLGrTfOlxNQW3K8U4/ENdnbSpQy8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LBaU6W9m8wGEV7IMIUVDSRJ8Nv4LtKIOo4wyrFWhIhx3uCU9PLP6iZA/qUksJULCckNv5x/yxwbGxuw4EAanTxR+wM+9YLgrSEjocZrWdHmpJVKkJ1SnRjH21pKbYPf8or9RS3K9aVW83LGWfh7nBjth8tU23rzMG9ie0DwxQN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fg0jbh/3; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-789e6ceaff1so326081685a.0
        for <linux-media@vger.kernel.org>; Tue, 19 Mar 2024 02:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710841932; x=1711446732; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r1STAVvMqdmXWd6Gz9r8U01l/YXJ+XzbFCILs/dS6/Y=;
        b=fg0jbh/3DSMjOlroKIeUyezenEOzulxlNkYVHSGnEljAhIoySx65elXv+TbgQv5OqD
         CNLqNZhjZI9Bmsr+yqs6SXJA2IiHOlSAwZ6PpU5HlTokdQ1QCPNPzDPlZGaIVFwZyIN3
         JMXAFkwxXAXOSKrbulgF7mnrosjHBkJTPIOks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710841932; x=1711446732;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r1STAVvMqdmXWd6Gz9r8U01l/YXJ+XzbFCILs/dS6/Y=;
        b=XAlA2GJQ+0W2CpuS5cMTPi0RNvhHdLQ1339FK4MB/R/7g3iL6MEytFRDc9Yda8XMmN
         8Busn1CofYSsGXD/6qlbNMLOHmD0UFri7tICt9QZ42IWzTB0FLX6kbPg3XW0yNKRkNLL
         ir8NOW8p3mZKjep/pyocYxAkLSitTT+SEq7aULD5DjFSudIqKHlfQArdGyhu3tPgL9Al
         jSCrEPwhOBT4bHhNt+9JdNzmJhvfpJctNbJcw0AekCrW58NOgXcn6QH65rmVOakHA+Ua
         pEz6kK9D+DrNfXOmIghrsRy7nwhd8lbcJpmYQXQxckF/yPoRjIiHXtMe7uk3Btp0ngkr
         ANMw==
X-Forwarded-Encrypted: i=1; AJvYcCXsTlMub8+caHr+NggkRNRZXFPmkKy6/Um5L1sfSxpvSV3WTQSg/odGRRo5FiKuljmq7HdbXtwUWUo9VvNmO9gyo8Uj1n+MOOXr4nM=
X-Gm-Message-State: AOJu0Yyl8VE3u0Ym3Uyw4S7clboNUlIkBJFRrkDFDiqpH0ZiRTrjWK1+
	zpcLnTX+as2+kzz9s4GWVTWLPN37DDop+WNnpiFhmqjAl07BBCjTo297wSUJ/6J7qe4SHPOs0ZI
	=
X-Google-Smtp-Source: AGHT+IExU1sxUGScWPlp4uS8jsvgCm7SAvRqqirrgrn9mv3JgXbm9jQHdx/kS1Hdvnt04mAzjzdBhQ==
X-Received: by 2002:a05:620a:88e:b0:78a:51c:8db9 with SMTP id b14-20020a05620a088e00b0078a051c8db9mr2663995qka.10.1710841932358;
        Tue, 19 Mar 2024 02:52:12 -0700 (PDT)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com. [209.85.219.43])
        by smtp.gmail.com with ESMTPSA id q10-20020a05620a038a00b00789ef21c9b8sm2848116qkm.65.2024.03.19.02.52.11
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Mar 2024 02:52:11 -0700 (PDT)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-690b24973beso51983356d6.0
        for <linux-media@vger.kernel.org>; Tue, 19 Mar 2024 02:52:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWmzoB85NJc37mgZ2sKjTWCvFIVVWFCBNp6lGg9Aphsj5zqZFN4TWGFWqAX/EBiTcMWao821ExayZKr2nPJ9f3JcW7H9ESKD4uANC4=
X-Received: by 2002:a05:6214:528f:b0:68f:de5f:44b4 with SMTP id
 kj15-20020a056214528f00b0068fde5f44b4mr4131262qvb.10.1710841931338; Tue, 19
 Mar 2024 02:52:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240319044200.32488-1-linh.tp.vu@gmail.com>
In-Reply-To: <20240319044200.32488-1-linh.tp.vu@gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 19 Mar 2024 10:51:59 +0100
X-Gmail-Original-Message-ID: <CANiDSCvMTyAm-V4wMsab1A3OH6Oq_XgP8mE17OtiDuZWPjU1zg@mail.gmail.com>
Message-ID: <CANiDSCvMTyAm-V4wMsab1A3OH6Oq_XgP8mE17OtiDuZWPjU1zg@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: fix incorrect minimum value mapping for
 relative ptz controls
To: Linh Vu <linh.tp.vu@gmail.com>, Gergo Koteles <soyer@irl.hu>
Cc: laurent.pinchart@ideasonboard.com, mchehab@kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Linh

Could you share the "lsusb  -v " info of your device, and also what
are the raw values from the device for UVC_GET_MAX, UVC_GET_MIN for
UVC_CT_PANTILT_RELATIVE_CONTROL and UVC_CT_ZOOM_RELATIVE_CONTROL ?

Something like this (not tested :) ):

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index e59a463c27618..76c7adc3aa579 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -415,7 +415,11 @@ static s32 uvc_ctrl_get_zoom(struct
uvc_control_mapping *mapping,
                return (zoom == 0) ? 0 : (zoom > 0 ? data[2] : -data[2]);

        case UVC_GET_MIN:
+               printk(KERN_ERR "zoom: GET_MIN 0%x 0x%x 0%x\n",
data[0], data[1], data[2]);
+               return data[2];
        case UVC_GET_MAX:
+               printk(KERN_ERR "zoom: GET_MAX 0%x 0x%x 0%x\n",
data[0], data[1], data[2]);
+               fallthrough;
        case UVC_GET_RES:
        case UVC_GET_DEF:
        default:
@@ -441,8 +445,11 @@ static s32 uvc_ctrl_get_rel_speed(struct
uvc_control_mapping *mapping,
                return (rel == 0) ? 0 : (rel > 0 ? data[first+1]
                                                 : -data[first+1]);
        case UVC_GET_MIN:
+               printk(KERN_ERR "speed: GET_MIN 0%x 0x%x 0%x\n",
data[first], data[first+1], data[first+2]);
                return -data[first+1];
        case UVC_GET_MAX:
+               printk(KERN_ERR "speed: GET_MAX 0%x 0x%x 0%x\n",
data[first], data[first+1], data[first+2]);
+               fallthrough;
        case UVC_GET_RES:
        case UVC_GET_DEF:
        default:

Thanks!

On Tue, 19 Mar 2024 at 06:30, Linh Vu <linh.tp.vu@gmail.com> wrote:
>
> When mapping from UVC_CT_PANTILT_RELATIVE_CONTROL
> to V4L2_CID_PAN_SPEED and V4L2_CID_TILT_SPEED,
> and from UVC_CT_ZOOM_RELATIVE_CONTROL to V4L2_CID_ZOOM_CONTINUOUS,
> the minimum value of the movement should be negated of the maximum value.
>
> For example, if a UVC device (e.g., OBSBOT Tiny 2) declares a pan speed
> range [1, 160], its V4L2_CID_PAN_SPEED mapping has range [-160, 160].
>
> Currently, calling ioctl with VIDIOC_QUERY_EXT_CTRL and V4L2_CID_PAN_SPEED
> returns a minimum value of -1. When calling ioctl with VIDIOC_S_CTRL,
> V4L2_CID_PAN_SPEED and -100, the speed (velocity) of the pan movement gets
> clamped to -1.
>
> To get the minimum value of V4L2_CID_PAN_SPEED,
> uvc_ctrl_get_rel_speed is called with
> uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN) as data,
> which should be uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX).
>
> The same thing should be done for V4L2_CID_TILT_SPEED and
> V4L2_CID_ZOOM_CONTINUOUS.
>
> For V4L2_CID_ZOOM_CONTINUOUS, uvc_ctrl_get_zoom does not add the
> sign to the returned minimum value, so it's impossible to zoom out.
>
> Modify the data that is passed when querying the minimum
> value for V4L2_CID_PAN_SPEED, V4L2_CID_TILT_SPEED and
> V4L2_CID_ZOOM_CONTINUOUS.
> Also add sign to the returned minimum value in uvc_ctrl_get_zoom.
> Thus, the correct minimum value for relative PTZ controls can be returned.
>
> Signed-off-by: Linh Vu <linh.tp.vu@gmail.com>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index e59a463c27618..00fd7e74e6d6b 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -415,6 +415,7 @@ static s32 uvc_ctrl_get_zoom(struct uvc_control_mapping *mapping,
>                 return (zoom == 0) ? 0 : (zoom > 0 ? data[2] : -data[2]);
>
>         case UVC_GET_MIN:
> +               return -data[2];
>         case UVC_GET_MAX:
>         case UVC_GET_RES:
>         case UVC_GET_DEF:
> @@ -1322,9 +1323,16 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>                 break;
>         }
>
> -       if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN)
> -               v4l2_ctrl->minimum = mapping->get(mapping, UVC_GET_MIN,
> -                                    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
> +       if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN) {
> +               if (v4l2_ctrl->id == V4L2_CID_PAN_SPEED
> +               || v4l2_ctrl->id == V4L2_CID_TILT_SPEED
> +               || v4l2_ctrl->id == V4L2_CID_ZOOM_CONTINUOUS)
> +                       v4l2_ctrl->minimum = mapping->get(mapping, UVC_GET_MIN,
> +                                               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX));
> +               else
> +                       v4l2_ctrl->minimum = mapping->get(mapping, UVC_GET_MIN,
> +                                               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
> +       }
>
>         if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX)
>                 v4l2_ctrl->maximum = mapping->get(mapping, UVC_GET_MAX,
> @@ -1909,9 +1917,15 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>                         if (ret < 0)
>                                 return ret;
>                 }
> +               if (mapping->id == V4L2_CID_PAN_SPEED
> +               || mapping->id == V4L2_CID_TILT_SPEED
> +               || mapping->id == V4L2_CID_ZOOM_CONTINUOUS)
> +                       min = mapping->get(mapping, UVC_GET_MIN,
> +                                       uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX));
> +               else
> +                       min = mapping->get(mapping, UVC_GET_MIN,
> +                                       uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
>
> -               min = mapping->get(mapping, UVC_GET_MIN,
> -                                  uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
>                 max = mapping->get(mapping, UVC_GET_MAX,
>                                    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX));
>                 step = mapping->get(mapping, UVC_GET_RES,
>
> base-commit: e0b8eb0f6d652981bfd9ba7c619c9d81ed087ad0
> --
> 2.34.1
>
>


-- 
Ricardo Ribalda

