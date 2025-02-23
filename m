Return-Path: <linux-media+bounces-26732-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AB0A41141
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 20:06:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DCAF07A64C2
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 19:04:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2315F82866;
	Sun, 23 Feb 2025 19:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Rp4Fx0wM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A4A8C1E
	for <linux-media@vger.kernel.org>; Sun, 23 Feb 2025 19:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740337551; cv=none; b=We+dzi82HVPbH9d8EMsZQ0Nc0G7WEBPfWyU9Lni5jGQzoox6WUp7VRyFP6OPTKI+E1vBghP5I6XAvDJUiXjCbc2OzgZ2sNbT171UpB5v6lqX6hsKwlfO01Om2qs1/i/renEeWfQnM/P8vtLTtZyWwnTj90zyQrL1F3dp89K/jUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740337551; c=relaxed/simple;
	bh=+adymESIddJh0dk6O/CnPGdCge1UfwBnKc89AmI1+hg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BLM18t7V2ZcFiPa5JiErMXK2yUpugzfX7Ua2JGg1VbTxbsiPjMXvzH3tGNnXdzCrHxfhrJBE6DpKxXeT11SJQ8Gs4GdwrovXhF48TG1fz3qdqyWf6GdvlsOdhrTQJQtWUHarLrw49lsgOiimhFuuMIJVZbSRK8evh5ddPc/DJ1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Rp4Fx0wM; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30a28bf1baaso33173771fa.3
        for <linux-media@vger.kernel.org>; Sun, 23 Feb 2025 11:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740337548; x=1740942348; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v/FmC8dB465uP72vMBqAXzIwgVrdSLbk0OVCoidVxmY=;
        b=Rp4Fx0wMdIGz30XMkBQQSaFamMHakWtbWo+/NmI7qweXb0T8Da13Lm4wW5qfsBlF/J
         jRQnR71P6gygLo22vZGXsIlv8vAni6SXWcxkXd+GUkKwp7/fOQ8zRoqjwomVjt6f/zei
         m3W8noPrGyuhNn72T6UXME1Kiiug0tt4xQb+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740337548; x=1740942348;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v/FmC8dB465uP72vMBqAXzIwgVrdSLbk0OVCoidVxmY=;
        b=blfK4ln1W06bS+mx5Eh1LxKf/IV4oJz0ja52DDanyCqOJg5udU7aS9W/l0Dffo00G1
         khzhhCwWx4dBmkWyRMfhzaCR2Ld2TKRLCEB6/l0uVGyS8cenEjKGMkYwCnUCjQlWTUpt
         f0XDx/lW7aKcM/2UASaIuH/EkF9GuLFMuwGIUhystv6mEyMV7hKsofsacmrEJjyTqsUQ
         BiZk+YJ1oWP11Egm/kxBrfSjDf1kTTmmDBwTMPueajOuAcUKwmnX5wtkyI89ZG75genM
         6+LhB7D5JLPUMNbKVdOhPB5ST0UAXOMYu8J/GPeLtz2npLxjg4wFd9yJu02P78o5P7ZR
         m79w==
X-Gm-Message-State: AOJu0YxgvsgAaZXEFXli2+gg1UO7p1e8W//3w3O25+6g4K9kYZld4Pyw
	tNyBIB6gI2K+8jQb59n5Vt+JCJoYF2oSbcjgAPc2kETR6Dy1fUdDCEm/OUmPFahPBLMSciJuVM5
	CGA==
X-Gm-Gg: ASbGncs+KeSaqSIQ+llcOugYI1IyJRmONXSD+BnZlZ58Us2J6QNEg+r2XdP2DJbruXN
	IMnPam1zeJ/QgIeqGtlkEKaKjbmNi7gzJ/wKZW/zNRI6tmTC3VLTZGu5YuZG7y/4PeKJHGBWL6l
	yY8EjDU7MbZJTPtLJt7uZwqIW1nzD/2v8PpW8c5hM/kv4sIuYKpdInEh+VLgKYt/PHrZZOF5Npx
	WKfsgyH2mtAwRWrUwrAshGK8txJ/Wk6nm2d/9hti5UJ68LuD+vDhpASK/QD3j9GC8AAsBVY67t0
	pvSyvYKAtNZ8voH1CZzhN3NyOdncPn5Qnio5rLkfk1uT2Uv5kZcbdUkE7XLEs0pe
X-Google-Smtp-Source: AGHT+IGR2HdYsvfrlyrzk1RMDkWZ9BY4fnHcKThuSJ3VibnpVwi4rg7nYF0yXjRay5/beD090mnlag==
X-Received: by 2002:a05:6512:104f:b0:545:f9c:a825 with SMTP id 2adb3069b0e04-5483912fcb9mr3671908e87.2.1740337547497;
        Sun, 23 Feb 2025 11:05:47 -0800 (PST)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54527244fd7sm2979313e87.12.2025.02.23.11.05.46
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Feb 2025 11:05:46 -0800 (PST)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-546210287c1so3833723e87.2
        for <linux-media@vger.kernel.org>; Sun, 23 Feb 2025 11:05:46 -0800 (PST)
X-Received: by 2002:a05:6512:1309:b0:545:aa5:d455 with SMTP id
 2adb3069b0e04-5483913f943mr4568156e87.15.1740337545929; Sun, 23 Feb 2025
 11:05:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250223150557.25148-1-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20250223150557.25148-1-laurent.pinchart@ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sun, 23 Feb 2025 20:05:33 +0100
X-Gmail-Original-Message-ID: <CANiDSCush=-=De9vVa5HGq0hgsgzPXxivAm3iOF_Dde17OqLHw@mail.gmail.com>
X-Gm-Features: AWEUYZlwxt18Yf54BDBlJmivQ3qpgIYNmgJawq_u7iCskFiOJpu67U2dbmZ6oRk
Message-ID: <CANiDSCush=-=De9vVa5HGq0hgsgzPXxivAm3iOF_Dde17OqLHw@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Drop the uvc_driver structure
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Sun, 23 Feb 2025 at 16:06, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> The uvc_driver structure used to contain more fields, but those got
> removed in commit ba2fa99668bb ("[media] uvcvideo: Hardcode the
> index/selector relationship for XU controls"). The structure is now just
> a wrapper around usb_driver. Drop it.
>
> Fixes: ba2fa99668bb ("[media] uvcvideo: Hardcode the index/selector relationship for XU controls")
Do we really want to declare a fix here?

> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 35 +++++++++++++++---------------
>  drivers/media/usb/uvc/uvcvideo.h   |  7 ------
>  2 files changed, 17 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index deadbcea5e22..84e931959198 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -37,6 +37,8 @@ static unsigned int uvc_quirks_param = -1;
>  unsigned int uvc_dbg_param;
>  unsigned int uvc_timeout_param = UVC_CTRL_STREAMING_TIMEOUT;
>
> +static struct usb_driver uvc_driver;
> +
>  /* ------------------------------------------------------------------------
>   * Utility functions
>   */
> @@ -546,7 +548,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
>                 return -EINVAL;
>         }
>
> -       if (usb_driver_claim_interface(&uvc_driver.driver, intf, dev)) {
> +       if (usb_driver_claim_interface(&uvc_driver, intf, dev)) {
>                 uvc_dbg(dev, DESCR,
>                         "device %d interface %d is already claimed\n",
>                         dev->udev->devnum,
> @@ -556,7 +558,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
>
>         streaming = uvc_stream_new(dev, intf);
>         if (streaming == NULL) {
> -               usb_driver_release_interface(&uvc_driver.driver, intf);
> +               usb_driver_release_interface(&uvc_driver, intf);
>                 return -ENOMEM;
>         }
>
> @@ -779,7 +781,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
>         return 0;
>
>  error:
> -       usb_driver_release_interface(&uvc_driver.driver, intf);
> +       usb_driver_release_interface(&uvc_driver, intf);
>         uvc_stream_delete(streaming);
>         return ret;
>  }
> @@ -1922,8 +1924,7 @@ static void uvc_delete(struct kref *kref)
>                 struct uvc_streaming *streaming;
>
>                 streaming = list_entry(p, struct uvc_streaming, list);
> -               usb_driver_release_interface(&uvc_driver.driver,
> -                       streaming->intf);
> +               usb_driver_release_interface(&uvc_driver, streaming->intf);
>                 uvc_stream_delete(streaming);
>         }
>
> @@ -3196,17 +3197,15 @@ static const struct usb_device_id uvc_ids[] = {
>
>  MODULE_DEVICE_TABLE(usb, uvc_ids);
>
> -struct uvc_driver uvc_driver = {
> -       .driver = {
> -               .name           = "uvcvideo",
> -               .probe          = uvc_probe,
> -               .disconnect     = uvc_disconnect,
> -               .suspend        = uvc_suspend,
> -               .resume         = uvc_resume,
> -               .reset_resume   = uvc_reset_resume,
> -               .id_table       = uvc_ids,
> -               .supports_autosuspend = 1,
> -       },
> +static struct usb_driver uvc_driver = {
> +       .name           = "uvcvideo",
> +       .probe          = uvc_probe,
> +       .disconnect     = uvc_disconnect,
> +       .suspend        = uvc_suspend,
> +       .resume         = uvc_resume,
> +       .reset_resume   = uvc_reset_resume,
> +       .id_table       = uvc_ids,
> +       .supports_autosuspend = 1,
>  };
>
>  static int __init uvc_init(void)
> @@ -3215,7 +3214,7 @@ static int __init uvc_init(void)
>
>         uvc_debugfs_init();
>
> -       ret = usb_register(&uvc_driver.driver);
> +       ret = usb_register(&uvc_driver);
>         if (ret < 0) {
>                 uvc_debugfs_cleanup();
>                 return ret;
> @@ -3226,7 +3225,7 @@ static int __init uvc_init(void)
>
>  static void __exit uvc_cleanup(void)
>  {
> -       usb_deregister(&uvc_driver.driver);
> +       usb_deregister(&uvc_driver);
>         uvc_debugfs_cleanup();
>  }
>
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index b63720e21075..b4ee701835fc 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -632,10 +632,6 @@ struct uvc_fh {
>         unsigned int pending_async_ctrls;
>  };
>
> -struct uvc_driver {
> -       struct usb_driver driver;
> -};
> -
>  /* ------------------------------------------------------------------------
>   * Debugging, printing and logging
>   */
> @@ -686,9 +682,6 @@ do {                                                                        \
>   * Internal functions.
>   */
>
> -/* Core driver */
> -extern struct uvc_driver uvc_driver;
> -
>  struct uvc_entity *uvc_entity_by_id(struct uvc_device *dev, int id);
>
>  /* Video buffers queue management. */
>
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> --
> Regards,
>
> Laurent Pinchart
>


-- 
Ricardo Ribalda

