Return-Path: <linux-media+bounces-12635-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE2F8FE404
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 12:16:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A1F3B24A38
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 09:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE15217FACC;
	Thu,  6 Jun 2024 09:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Jj/FlyJI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0EE17FAB0
	for <linux-media@vger.kernel.org>; Thu,  6 Jun 2024 09:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717667893; cv=none; b=Wte638Kl6eEPAjRkjhQh8jWvKRbcV7ZbX9irrv6HwsAsvPdvH4xPVjt1nhbZg6wLMts1m4jUBlh5BAdQNny6+anvK19q/r485hHIzKshKnqOkZRpEsSMagda6ZCboxA0M9r3UBFIexWS4NOhFlaj7xXtGlGWY83nvNbPkgihMbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717667893; c=relaxed/simple;
	bh=PK/Yr00ssDR4VQl+Nq6ESa54g10t7lTOOMbDa1l6uRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m7OkryzlN70cFuhlVj0ntnLDp2Sui9qzU+wRqgiP1qVhub3t1gisjfdgi4WY1qDJQ2h5Se8BQFtLTWcwMsDng0CZguClz9Yhez0lcozWqAdP65KDQYHVNVNoWaG4MzULpWoh+1LGxh498UZBa5PmU34AODHDGlEG/l2J72V4Qfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Jj/FlyJI; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dfa682a4025so862520276.2
        for <linux-media@vger.kernel.org>; Thu, 06 Jun 2024 02:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717667889; x=1718272689; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IWM8oINC8AeyIZo0cnk7DqiORcHA5KDENrV1ggbh44E=;
        b=Jj/FlyJIEZ/Lpa7fdzfrt6Xwtreg6atdovYWXs3mFWi1vi9bOjOrIiwUZZtRFSi7OI
         Lt+TcyBAQMJmcDXyOwsnlXyuBVcM+ChxuLOEr/RUvAZ/DUYCNFc5eLDOiCgFG1r6+LrT
         wovguryV/MjmNGPBr7mj7TvvbSY9pRm4659xg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717667889; x=1718272689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IWM8oINC8AeyIZo0cnk7DqiORcHA5KDENrV1ggbh44E=;
        b=Vk+EsuhgYZnnWoLoi032ibNjnNBsl5l1VA0kK94EE/lvFU3NvLO3J87yNaP+mCcCl3
         VVSbZZfOUxdlE9WMxpsaLFwpgv2QPw7qfU03Dy/uoCROqRlXmnQyKTDAHhenGQWqN0Qc
         eSL1oUtVPG5Ia/ai/G5LXmP4FzzkKVQYFmPg7wrzu30j4BJMO/4ewyOX/g6hKY4LG8IF
         Us+gHiGJ8SBo3v9MXAvEKlS0LFfgBqFamF3bK2upxDIyIT7jQe0OyWvtZMZ0qmlwOIBH
         Hzy+z6hCTSaDjnfZww2PZGdDxlOHo7qwX9v3i3wbkzuUN+95qBdhnLBNQ9a5yM6dM0fX
         W9tA==
X-Forwarded-Encrypted: i=1; AJvYcCUpBCgVAdRXuL6E9l2gqTvY5O7thhYZ8cm5uFNQTXo6amTJLBbwf/IJjI7SbMYD2MRnHomu6UX77DEXjNLRcIcU/+2kRpjkiM7BWk0=
X-Gm-Message-State: AOJu0Yxta0jj+65+ieLBoSaFXPKbopp1qA6gXCJxGVNn6KWe14vJQIsc
	a+HJgAwrWQ2ZCXLyov8aEJ3fB0Ht7714yzTJxgmh7dHK2BG2A++JmfFcxJ1spYvxZuL3Ek3FlOI
	GmA==
X-Google-Smtp-Source: AGHT+IF1EZz74mRyi5eNLD2Jdi5U0QZcOr8lpn8hqfyv+TXNsk3GeZo1ZL7X4mb3JWVQl50hIfpzMQ==
X-Received: by 2002:a25:7453:0:b0:dfa:6d3b:dbaa with SMTP id 3f1490d57ef6-dfacac5ba7emr4896609276.36.1717667889626;
        Thu, 06 Jun 2024 02:58:09 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-dfae52bd7a2sm225540276.12.2024.06.06.02.58.08
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 02:58:09 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-62a08091c2bso7303797b3.0
        for <linux-media@vger.kernel.org>; Thu, 06 Jun 2024 02:58:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWfrEUJLWFucYWvcYLQ/6TR4MUE5X2oQlND+AsoegTEufsRX5Rx1+GS491sJrck7UNORgfs7WtOAxjVs9r7jrfwtoT/cWf8+8GDUks=
X-Received: by 2002:a81:f806:0:b0:61b:3484:316b with SMTP id
 00721157ae682-62cbb4d423dmr48382467b3.14.1717667887633; Thu, 06 Jun 2024
 02:58:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240327-guenter-mini-v4-0-49955c198eae@chromium.org> <20240327-guenter-mini-v4-1-49955c198eae@chromium.org>
In-Reply-To: <20240327-guenter-mini-v4-1-49955c198eae@chromium.org>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 6 Jun 2024 18:57:50 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BhJExCEA7_Ck2skWR52baSDH63-+oEZnpo4UiMc0C7=A@mail.gmail.com>
Message-ID: <CAAFQd5BhJExCEA7_Ck2skWR52baSDH63-+oEZnpo4UiMc0C7=A@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] media: uvcvideo: stop stream during unregister
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Max Staudt <mstaudt@chromium.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Alan Stern <stern@rowland.harvard.edu>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sean Paul <seanpaul@chromium.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ricardo,

On Wed, Mar 27, 2024 at 5:24=E2=80=AFPM Ricardo Ribalda <ribalda@chromium.o=
rg> wrote:
>
> uvc_unregister_video() can be called asynchronously from
> uvc_disconnect(). If the device is still streaming when that happens, a
> plethora of race conditions can happen.
>
> Make sure that the device has stopped streaming before exiting this
> function.
>
> If the user still holds handles to the driver's file descriptors, any
> ioctl will return -ENODEV from the v4l2 core.
>
> This change make uvc more consistent with the rest of the v4l2 drivers
> using the vb2_fop_* and vb2_ioctl_* helpers.
>
> Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>

First of all, thanks for the patch. I have a question about the
problem being fixed here.

Could you point out a specific race condition example that could
happen without this change?
From what I see in __video_do_ioctl((), no ioctls would be executed
anymore after the video node is unregistered.
Since the device is not present either, what asynchronous code paths
could be still triggered?

[1] https://elixir.bootlin.com/linux/latest/source/drivers/media/v4l2-core/=
v4l2-ioctl.c#L3023

Best regards,
Tomasz

> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/u=
vc_driver.c
> index bbd90123a4e76..17fc945c8deb6 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -1911,8 +1911,19 @@ static void uvc_unregister_video(struct uvc_device=
 *dev)
>                 if (!video_is_registered(&stream->vdev))
>                         continue;
>
> +               /*
> +                * Serialize other access to the stream.
> +                */
> +               mutex_lock(&stream->mutex);
> +               uvc_queue_streamoff(&stream->queue, stream->type);
>                 video_unregister_device(&stream->vdev);
>                 video_unregister_device(&stream->meta.vdev);
> +               mutex_unlock(&stream->mutex);
> +
> +               /*
> +                * Now the vdev is not streaming and all the ioctls will
> +                * return -ENODEV
> +                */
>
>                 uvc_debugfs_cleanup_stream(stream);
>         }
>
> --
> 2.44.0.396.g6e790dbe36-goog
>

