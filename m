Return-Path: <linux-media+bounces-12456-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E5E8D818F
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 13:50:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B627C282F27
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 11:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF43D8593D;
	Mon,  3 Jun 2024 11:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Kz0pq0xI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9DF85928
	for <linux-media@vger.kernel.org>; Mon,  3 Jun 2024 11:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717415413; cv=none; b=Icv5lV3xKTk8YEmfR9tTtOeJE9LwcsKgoPUd6UwtvDCSVHE+mbWhguKG4o9ZnmHBUnKh3siw5/BtWudXhLnSmEFfsSpmNZ5ETYqM8GOlnamSgifJq8YweKMhyvhOsBeW3ynZ7TefiJ87LUOq1Ud3Dxk3d/WgSQs0ms+e5hzhyys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717415413; c=relaxed/simple;
	bh=05B4p2rv3Qe9JKaIpGYffAxk+1ldI7JRkOPrkIt7xdY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LIRfZhhLhLRrsa5aqRp6sZTUF+WQuFM0qyrat16fUz/2UBvgxClBROoD+tyPfqoWXeSTCcwUe9bTyZ8ru0BSXSzC1mV73VJHJbBpRFFiJaOBGxusuVvWd8IZ4jddicnT3bXKnAyJVFZ0qnkUzAJUZzaUVaNs/r0HMSSQRR/j7ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Kz0pq0xI; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3d1b7ad2283so1769736b6e.3
        for <linux-media@vger.kernel.org>; Mon, 03 Jun 2024 04:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717415410; x=1718020210; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/2D3kDdYe/wPgM031L5fSfVW0xrekq6nogjEUevsgZY=;
        b=Kz0pq0xITPLdyg5pQJ8Xiu6DkLDfjbsC9++RLWT/iIsY9JgM6Rnhf8LvyE14v2e4wO
         r+h30OoELmoYZE3z6lpXurDKl+jYWW7DBg/Ji3aceRwxjhZip1cNTlk+jIVAZ9C86CHs
         KVJEUgfvN/qEtWz+kmXxizvd9faKMUaOJSZLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717415410; x=1718020210;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/2D3kDdYe/wPgM031L5fSfVW0xrekq6nogjEUevsgZY=;
        b=FXXuF7J7cHXAFONWEhv7aHdbcR6BW/wmmiXQzAl0Ywv8vCgGXZazIUHkBFq/Gf1JZA
         mtQNt7mZYLP7pi1h7qYYA3o3X31QvBlcJpuSWvs+xl6e7LVUUvAyU7ySHSpSHStCvMfh
         wsy/YlPlDGrXWtxbqF3dexxFhFNhFSkw62SdHMKQ9dM1Zh57+bZsd/WgjhQjoZ0T/HcV
         TqQtaVrlNix50ddXOpcDHJCjcDX6xH34sIMXv2bWa1em6GMO4uKjyX6LMAlBxnfAZGsA
         lEK+EU+V65NixinrXJXmc6flkBVJKnvecdwl4I/kW4GLLnClrJ6rbCmGp8myWaHQoRK5
         DuWQ==
X-Gm-Message-State: AOJu0YzaTpGNhjKDJxkA6cVHZrXq2Ke+y1pobGVLfbuau6K7mn061PEg
	jVhdPSr7vRchj9gLKZLqlY8EJ4OsznSlvj9mR3W9m7EED9hWC9WGxafOMlS7mx4VmGk/wbjhpCQ
	=
X-Google-Smtp-Source: AGHT+IFOdZ6WEWA2dZhARruRJJn0QScRcA+qBXylCaQwYPWqRofE7Fy0Ek+dyt0auAA0xBmJwGHnMA==
X-Received: by 2002:a05:6808:3091:b0:3c7:3106:e2e1 with SMTP id 5614622812f47-3d1e34719bbmr10885717b6e.8.1717415408877;
        Mon, 03 Jun 2024 04:50:08 -0700 (PDT)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com. [209.85.167.173])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d1e1933f38sm1306983b6e.0.2024.06.03.04.50.07
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jun 2024 04:50:08 -0700 (PDT)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3c9cf863a58so1828237b6e.2
        for <linux-media@vger.kernel.org>; Mon, 03 Jun 2024 04:50:07 -0700 (PDT)
X-Received: by 2002:a05:6808:1415:b0:3c9:9404:6c99 with SMTP id
 5614622812f47-3d1e35b9151mr11324235b6e.42.1717415407255; Mon, 03 Jun 2024
 04:50:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240602065053.36850-1-dhs@frame.work>
In-Reply-To: <20240602065053.36850-1-dhs@frame.work>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 3 Jun 2024 13:49:51 +0200
X-Gmail-Original-Message-ID: <CANiDSCuhOhrN3FaCyFeGgnJ8BD_YDU8ZHq8MrXG3icSNN+iiKg@mail.gmail.com>
Message-ID: <CANiDSCuhOhrN3FaCyFeGgnJ8BD_YDU8ZHq8MrXG3icSNN+iiKg@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Override default flags
To: Daniel Schaefer <dhs@frame.work>
Cc: linux-media@vger.kernel.org, Edgar Thier <info@edgarthier.net>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Levin <ktl@frame.work>
Content-Type: text/plain; charset="UTF-8"

Hi Daniel

Thanks for the patch. Some minor nits.

Feel free to ignore it if you prefer your style.


On Sun, 2 Jun 2024 at 08:52, Daniel Schaefer <dhs@frame.work> wrote:
>
> When the UVC device has a control that is readonly it doesn't set the
> SET_CUR flag. For example the privacy control has SET_CUR flag set in
> the defaults in the `uvc_ctrls` variable. Even if the device does not
> have it set, it's not cleared by uvc_ctrl_get_flags.
>
> Originally written with assignment in commit 859086ae3636 ("media:
> uvcvideo: Apply flags from device to actual properties"). But changed to
> |= in commit 0dc68cabdb62 ("media: uvcvideo: Prevent setting unavailable
> flags"). It would not clear the default flags.
>
> With this patch applied the correct flags are reported to user space.
> Tested with:
>
> ```
> > v4l2-ctl --list-ctrls | grep privacy
> privacy 0x009a0910 (bool)   : default=0 value=0 flags=read-only
> ```
>
> Cc: Edgar Thier <info@edgarthier.net>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Kieran Levin <ktl@frame.work>
> Signed-off-by: Daniel Schaefer <dhs@frame.work>
Fixes: 0dc68cabdb62 ("media: uvcvideo: Prevent setting unavailable flags")

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 26 +++++++++++++++++---------
>  1 file changed, 17 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 4b685f883e4d..f50542e26542 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -2031,15 +2031,23 @@ static int uvc_ctrl_get_flags(struct uvc_device *dev,
>         else
>                 ret = uvc_query_ctrl(dev, UVC_GET_INFO, ctrl->entity->id,
>                                      dev->intfnum, info->selector, data, 1);
> -       if (!ret)
> -               info->flags |= (data[0] & UVC_CONTROL_CAP_GET ?
> -                               UVC_CTRL_FLAG_GET_CUR : 0)
> -                           |  (data[0] & UVC_CONTROL_CAP_SET ?
> -                               UVC_CTRL_FLAG_SET_CUR : 0)
> -                           |  (data[0] & UVC_CONTROL_CAP_AUTOUPDATE ?
> -                               UVC_CTRL_FLAG_AUTO_UPDATE : 0)
> -                           |  (data[0] & UVC_CONTROL_CAP_ASYNCHRONOUS ?
> -                               UVC_CTRL_FLAG_ASYNCHRONOUS : 0);
> +       if (!ret) {
> +               info->flags = (data[0] & UVC_CONTROL_CAP_GET)
> +                       ? (info->flags | UVC_CTRL_FLAG_GET_CUR)
> +                       : (info->flags & ~UVC_CTRL_FLAG_GET_CUR);
> +
> +               info->flags = (data[0] & UVC_CONTROL_CAP_SET)
> +                       ? (info->flags | UVC_CTRL_FLAG_SET_CUR)
> +                       : (info->flags & ~UVC_CTRL_FLAG_SET_CUR);
> +
> +               info->flags = (data[0] & UVC_CONTROL_CAP_AUTOUPDATE)
> +                       ? (info->flags | UVC_CTRL_FLAG_AUTO_UPDATE)
> +                       : (info->flags & ~UVC_CTRL_FLAG_AUTO_UPDATE);
> +
> +               info->flags = (data[0] & UVC_CONTROL_CAP_ASYNCHRONOUS)
> +                       ? (info->flags | UVC_CTRL_FLAG_ASYNCHRONOUS)
> +                       : (info->flags & ~UVC_CTRL_FLAG_ASYNCHRONOUS);
> +       }

nit: I would have done it as
diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 4b685f883e4d..c453a67e1407 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2031,7 +2031,12 @@ static int uvc_ctrl_get_flags(struct uvc_device *dev,
        else
                ret = uvc_query_ctrl(dev, UVC_GET_INFO, ctrl->entity->id,
                                     dev->intfnum, info->selector, data, 1);
-       if (!ret)
+       if (!ret) {
+               info->flags &= ~(UVC_CTRL_FLAG_GET_CUR |
+                               UVC_CTRL_FLAG_SET_CUR |
+                               UVC_CTRL_FLAG_AUTO_UPDATE |
+                               UVC_CTRL_FLAG_ASYNCHRONOUS);
+
                info->flags |= (data[0] & UVC_CONTROL_CAP_GET ?
                                UVC_CTRL_FLAG_GET_CUR : 0)
                            |  (data[0] & UVC_CONTROL_CAP_SET ?
@@ -2040,6 +2045,7 @@ static int uvc_ctrl_get_flags(struct uvc_device *dev,
                                UVC_CTRL_FLAG_AUTO_UPDATE : 0)
                            |  (data[0] & UVC_CONTROL_CAP_ASYNCHRONOUS ?
                                UVC_CTRL_FLAG_ASYNCHRONOUS : 0);
+       }


>
>         kfree(data);
>         return ret;
> --
> 2.43.0
>
>


-- 
Ricardo Ribalda

