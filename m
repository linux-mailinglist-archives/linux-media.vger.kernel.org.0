Return-Path: <linux-media+bounces-19799-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AF79A2583
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2024 16:49:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06209284DD7
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2024 14:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDE7F1DE889;
	Thu, 17 Oct 2024 14:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WhcUAsFq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C801D517F
	for <linux-media@vger.kernel.org>; Thu, 17 Oct 2024 14:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729176549; cv=none; b=q7AX85oBaC/0x+xX3dDhboFZN6R8w6DBa9XW005xRxbYQknlN7NMQwXn3CJDvfS5whDkQUlr2uwTI1xq/SrNg5XthjMACC07adYjC0Yn2HBHXU+/R1Ao73ELJwPBAIb9iLnPSgiJXkhHx9yyXM46/Wizcr17P7bRecRIa9FJ6NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729176549; c=relaxed/simple;
	bh=O5cmHWgNcrvPdHvINyTIuC2crWDWkfdn5c5WMjW75KY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KpwreKfRqsJhHzyuPzPxjYqDatNBhqTwN+99v50IsXA2TqnGU73PHbkZAvUq9Ka1BpVI5HJNc+jifehkkEuyse+tbJHFIITRcc1+rBXmEioDNPqsr822ogViyLCZr7Du9cr8YlRfEXn/TWlgKZ061Vv9EKEGCTjvJSNEKRmk8Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WhcUAsFq; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3a39f73a2c7so4946825ab.0
        for <linux-media@vger.kernel.org>; Thu, 17 Oct 2024 07:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729176543; x=1729781343; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o+g/HOj2hlbkF9MmWrIIn1Wval6OJZ4TG/OoDLT8WlA=;
        b=WhcUAsFqSDQfO/YGmzEowhdM5QpZqKUDOkJSpLWr56P17Js7lu0sl7LN2a6m32YyKN
         PlfgpCjbyPeRLH8zbAZ7gK5nYEjlW6Gni52NwgtagWhlzSrwbbZbyTTETOPhN8Uq4dn7
         WqE4FeJqmCIHhuVzLIhsQjq1ICog7GmQXV7HI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729176543; x=1729781343;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o+g/HOj2hlbkF9MmWrIIn1Wval6OJZ4TG/OoDLT8WlA=;
        b=L5f0dX8qIBwhdByfEJxUBdKQrJzbBgjve1knbss1qHeWtcEpEEG4g4LUvKdKJq1mIo
         pR9TMfaE8E1GGLZzxWx96t4dlSZtBLceSRik4z+/dxXugTA2ZwqohJynhmwgGql0APnW
         I3NUurJOsNE/8h486wYV88WuNWmAEI3kGViajNZQqFd6BEUqWsAgvMAEyriFzHHtqmat
         igwMlAI8xXz7KD2mwAh8AVni+nRu6BR7NmyGOZUODyMlI2KUKMXxAJK152YiDIKs/Fe6
         jK3T5fPzwQakMNno38Q1MtNxxlXxPTdXi60Dc1W5Csj8kAQp4Z+08cyo5dXPteYIoGAk
         DHFQ==
X-Gm-Message-State: AOJu0Yw3nSO1pp9PIzkxsH9zwlLMUZ/RlgXoOS4XZqYOVWXoZ9dIv9tP
	QXz9ux606B2UEiR2fX48qt5XJu7OH6jfowBDCm/eTpiXO5Dgj2vsXr7SzGdPyyyDig8guh3q7OE
	=
X-Google-Smtp-Source: AGHT+IGYYM08dcDDeuZ7XzhktYiaO2EwoxMDGRS5ZS2uV5ExFoDzLVLMNKrY9gYh1ohV+8rO9I+zKA==
X-Received: by 2002:a05:6e02:1d15:b0:3a3:3e17:993f with SMTP id e9e14a558f8ab-3a3b5f4411fmr213100495ab.8.1729176542989;
        Thu, 17 Oct 2024 07:49:02 -0700 (PDT)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com. [209.85.216.54])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ea9c71a8aesm5066554a12.81.2024.10.17.07.49.01
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 07:49:02 -0700 (PDT)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2e2eb9dde40so831062a91.0
        for <linux-media@vger.kernel.org>; Thu, 17 Oct 2024 07:49:01 -0700 (PDT)
X-Received: by 2002:a17:90a:ce17:b0:2e2:9522:278f with SMTP id
 98e67ed59e1d1-2e2f0d91b3emr23959709a91.32.1729176540794; Thu, 17 Oct 2024
 07:49:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <69d2363e-49bb-4c7f-9c91-6a22b0c6e9e3@xs4all.nl>
In-Reply-To: <69d2363e-49bb-4c7f-9c91-6a22b0c6e9e3@xs4all.nl>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 17 Oct 2024 23:48:45 +0900
X-Gmail-Original-Message-ID: <CANiDSCv94bauTR2dLZu1okyX71c-8xH_7r+-624Reca=WrsZEQ@mail.gmail.com>
Message-ID: <CANiDSCv94bauTR2dLZu1okyX71c-8xH_7r+-624Reca=WrsZEQ@mail.gmail.com>
Subject: Re: [RFC PATCH] media: uvc: ensure video device entities have a
 unique name
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-ccpol: medium

Hi Hans

On Thu, 17 Oct 2024 at 18:25, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> The video device names (also used as entity names) are identical
> for the video capture and metadata capture devices.
>
> This series ensures that the video device names are unique.
>
> It also fixes a bug where a metadata device would be created
> for video output devices, but that's for video capture devices
> only.
You probably want to split that fix in a separate patch, but be aware
that there might be userspace depending on the extra metadata device
:(

>
> This fixes a compliance failure when running
> 'v4l2-compliance -M /dev/mediaX'.
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
> RFC for now.
>
> Based on the code I assume one UVC device can have multiple
> capture and/or output devices, so I added an instance index.

I believe we tried something similar and we ended up reverting it :(

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f66dcb32af19faf49cc4a9222c3152b10c6ec84a

Maybe, as you suggest, dropping the Cap prefix for the first inst is
enough, if my memory is correct I think I also tried with that but we
ended up abandoning the patch
https://lore.kernel.org/linux-media/20220920-resend-meta-v5-0-3385df697370@chromium.org/
https://lore.kernel.org/linux-media/Y6OP%2Fqz9R4BgXi4o@pendragon.ideasonboard.com/
>
> But I may be wrong about that.
>
> I also assume that there is no metadata for UVC video outputs.
>
> It might also be safer to drop the 'Cap0 ' prefix if inst == 0,
> just in case someone relies on the name.
> ---
>  drivers/media/usb/uvc/uvc_driver.c   | 34 +++++++++++++++++++---------
>  drivers/media/usb/uvc/uvc_metadata.c |  4 ++--
>  drivers/media/usb/uvc/uvcvideo.h     |  3 ++-
>  3 files changed, 27 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index ab9cdb50e74e..59e5769166f2 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -1956,6 +1956,7 @@ static void uvc_unregister_video(struct uvc_device *dev)
>
>  int uvc_register_video_device(struct uvc_device *dev,
>                               struct uvc_streaming *stream,
> +                             unsigned int inst,
>                               struct video_device *vdev,
>                               struct uvc_video_queue *queue,
>                               enum v4l2_buf_type type,
> @@ -1990,17 +1991,18 @@ int uvc_register_video_device(struct uvc_device *dev,
>         case V4L2_BUF_TYPE_VIDEO_CAPTURE:
>         default:
>                 vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
> +               snprintf(vdev->name, sizeof(vdev->name), "Cap%u %s", inst, dev->name);
>                 break;
>         case V4L2_BUF_TYPE_VIDEO_OUTPUT:
>                 vdev->device_caps = V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_STREAMING;
> +               snprintf(vdev->name, sizeof(vdev->name), "Out%u %s", inst, dev->name);
>                 break;
>         case V4L2_BUF_TYPE_META_CAPTURE:
>                 vdev->device_caps = V4L2_CAP_META_CAPTURE | V4L2_CAP_STREAMING;
> +               snprintf(vdev->name, sizeof(vdev->name), "Meta%u %s", inst, dev->name);
>                 break;
>         }
>
> -       strscpy(vdev->name, dev->name, sizeof(vdev->name));
> -
>         /*
>          * Set the driver data before calling video_register_device, otherwise
>          * the file open() handler might race us.
> @@ -2020,7 +2022,7 @@ int uvc_register_video_device(struct uvc_device *dev,
>  }
>
>  static int uvc_register_video(struct uvc_device *dev,
> -               struct uvc_streaming *stream)
> +               struct uvc_streaming *stream, unsigned int inst)
>  {
>         int ret;
>
> @@ -2041,7 +2043,7 @@ static int uvc_register_video(struct uvc_device *dev,
>         uvc_debugfs_init_stream(stream);
>
>         /* Register the device with V4L. */
> -       return uvc_register_video_device(dev, stream, &stream->vdev,
> +       return uvc_register_video_device(dev, stream, inst, &stream->vdev,
>                                          &stream->queue, stream->type,
>                                          &uvc_fops, &uvc_ioctl_ops);
>  }
> @@ -2054,9 +2056,13 @@ static int uvc_register_terms(struct uvc_device *dev,
>  {
>         struct uvc_streaming *stream;
>         struct uvc_entity *term;
> +       unsigned int inst_cap = 0;
> +       unsigned int inst_out = 0;
>         int ret;
>
>         list_for_each_entry(term, &chain->entities, chain) {
> +               bool is_capture;
> +
>                 if (UVC_ENTITY_TYPE(term) != UVC_TT_STREAMING)
>                         continue;
>
> @@ -2069,16 +2075,22 @@ static int uvc_register_terms(struct uvc_device *dev,
>                 }
>
>                 stream->chain = chain;
> -               ret = uvc_register_video(dev, stream);
> +               is_capture = stream->type == V4L2_BUF_TYPE_VIDEO_CAPTURE;
> +               ret = uvc_register_video(dev, stream,
> +                                        is_capture ? inst_cap : inst_out);
>                 if (ret < 0)
>                         return ret;
>
> -               /*
> -                * Register a metadata node, but ignore a possible failure,
> -                * complete registration of video nodes anyway.
> -                */
> -               uvc_meta_register(stream);
> -
> +               if (is_capture) {
> +                       /*
> +                        * Register a metadata node, but ignore a possible failure,
> +                        * complete registration of video nodes anyway.
> +                        */
> +                       uvc_meta_register(stream, inst_cap);
> +                       inst_cap++;
> +               } else {
> +                       inst_out++;
> +               }
>                 term->vdev = &stream->vdev;
>         }
>
> diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
> index 82de7781f5b6..685182302602 100644
> --- a/drivers/media/usb/uvc/uvc_metadata.c
> +++ b/drivers/media/usb/uvc/uvc_metadata.c
> @@ -156,7 +156,7 @@ static const struct v4l2_file_operations uvc_meta_fops = {
>         .mmap = vb2_fop_mmap,
>  };
>
> -int uvc_meta_register(struct uvc_streaming *stream)
> +int uvc_meta_register(struct uvc_streaming *stream, unsigned int inst)
>  {
>         struct uvc_device *dev = stream->dev;
>         struct video_device *vdev = &stream->meta.vdev;
> @@ -170,7 +170,7 @@ int uvc_meta_register(struct uvc_streaming *stream)
>          */
>         vdev->queue = &queue->queue;
>
> -       return uvc_register_video_device(dev, stream, vdev, queue,
> +       return uvc_register_video_device(dev, stream, inst, vdev, queue,
>                                          V4L2_BUF_TYPE_META_CAPTURE,
>                                          &uvc_meta_fops, &uvc_meta_ioctl_ops);
>  }
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 07f9921d83f2..92c72ef6ea49 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -738,10 +738,11 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
>  void uvc_video_clock_update(struct uvc_streaming *stream,
>                             struct vb2_v4l2_buffer *vbuf,
>                             struct uvc_buffer *buf);
> -int uvc_meta_register(struct uvc_streaming *stream);
> +int uvc_meta_register(struct uvc_streaming *stream, unsigned int inst);
>
>  int uvc_register_video_device(struct uvc_device *dev,
>                               struct uvc_streaming *stream,
> +                             unsigned int inst,
>                               struct video_device *vdev,
>                               struct uvc_video_queue *queue,
>                               enum v4l2_buf_type type,
> --
> 2.43.0
>
>


-- 
Ricardo Ribalda

