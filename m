Return-Path: <linux-media+bounces-40455-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7457AB2E130
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 17:33:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 443213A404D
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 15:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A87A2236F7;
	Wed, 20 Aug 2025 15:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="E1hxzdyH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA58820297E
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 15:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755703330; cv=none; b=n1I9q++7/uk+eZppdESUzME9FaPy+UKwfDQeCw9K9mfaF6a0d1+ykZd6CiQ5Bu0oMfwphBjGEygx/f9LHC1B07L2NBeVpR3+y4EGAli+RL/4+qnmUC4uzCssxdPzO58LJaBbhED3acm/NBVRJon6+HgbysJUGa0VEFoTFbzK9oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755703330; c=relaxed/simple;
	bh=ve8TblAuMSCb6tU4athNRxufJKZ6IUExRK3RK/OuyCM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sRQ61Qn1SP9LsRqmzoQVByZ9Npm7Bb5cyY0g65Mzdvg/cyA9+aPqY5mnwI6fMX9R2V8xSzvjeFO3/bhIJnU/KlIbNL7CukB8YxCNMhfR1n2byFH/xUw1DvtPmOBRkUGEZhW4tpFeyG+H7MpM53jDq1/Ujao/BBPW62ufEeQ+mcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=E1hxzdyH; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-333f9160c21so48468321fa.2
        for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 08:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755703326; x=1756308126; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N1FpvzU4/OcZ3HFncGYXGBLrDfBsRLvX6s4xeHQww4w=;
        b=E1hxzdyHBx7+yg1AjXld3xFXSLhO6cZ59PNAimkvQ/cyvwRJ+a5198B+C8t4oxZzJM
         kIkpfALK34tSs9XpGxU/fmzIGT6li/JoR3IRB3OM6X8nCWOmgtG9v/NGpixBJzuQ4Lc4
         GdHZj0n2O4WIstqPcgrGEEz/INP7QMKBe1sDo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755703326; x=1756308126;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N1FpvzU4/OcZ3HFncGYXGBLrDfBsRLvX6s4xeHQww4w=;
        b=hWjKKYFCOC1Bk5hhV4U7kng3Z/qsg65s8EDydcqb3wBctsxkRn8X8EWuiYWgQ8pWa4
         +FDzMyFXN80Q581U8ZjUHK3x217+iA7CSlr5gPhxTwlNUZGo2CqZCh2YVy4AR5bCDtGg
         i/5Qh1pnmwCFlX5LtKvQ//NJcyitZo6trGgA2YDrliVQDlyvRQ1+aPXBjiDnG7V6d+tG
         VbWuz0ZnTOEfwBSLKkRX/tLrTj3xIyWsW7uboMTSssdZ3yrZ8Nf9PVNzkprbsAC7+siv
         2OLv7aqbVMNlSYbGUTPdYsbaUZZ+qhx9w2HdTZ77oPj4OCex8ivGNVRN1AvLErQo8+VO
         3ySQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoj8aqpU+4Sn8XH++s9oiXChu4mQAclmM8/B5XSyE9msi4oMY2eiM9B9NSYxvu+A7J05rHOgJ7pcc5+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzknIzRzmJ/mwAhJzJp4mqfzQNfEryl9Mgi5KJHQbl+C8pEplBS
	QHZ9mTQ05upU+B3uq6PogWU3IwKloAbUftiAePeBqiGfSpgs3IG2ugyifm27n3tw4y2BF0EoGOI
	Y6Jc=
X-Gm-Gg: ASbGncsQA1/3/M3/Nhrnq+DWRQ5fzrD41iLzTSBrCvTmWoAUIScZwaA+DGm+cji1emB
	d5HwN7iIrewVUaaSPlckrV0g2eLLR15nfuFyjKIkWsu6p4SB3YbSSgCJLIHMtks5FbZuMHbiprK
	OIClHsCrbswogoCqpaoSk0l7uoIz811/GSNIwd2oVekAjMymCAM7YxM+gIHQ2f1hbphkQh9v6KL
	TQU1buNS9W5HJXaR7/A1DaJE+hfw5+D/+iqn8qXgJtkBQISGDyt404kQW7cDpVSkKr8nCp/D1av
	cy5+B4dh4b424/h4aUU2rmZZCk2CU0UL5NFtbLkn0XlD5wQfPwLIk3g+VZ+BylwqDjP/bfupYnz
	EY7OCsWzejWHZeFxWqSKtF8a1CDQKukhCWkFCCpIRPycSOUIWnsxxH/CChriLdkms
X-Google-Smtp-Source: AGHT+IEG1ymsJOjdsRxqK3J4GaOOuo7j+GehuO6K7fbNe7VpN2VGIXMrFJBr0iOJVA57GzfsiTI45Q==
X-Received: by 2002:a2e:8a8f:0:b0:332:5a0e:fed with SMTP id 38308e7fff4ca-3353be4ad32mr6662591fa.30.1755703325713;
        Wed, 20 Aug 2025 08:22:05 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3f3e91sm2609596e87.124.2025.08.20.08.22.04
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 08:22:04 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-333f92d60ddso46829061fa.3
        for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 08:22:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWdkTXB7q8nRkNIwssemD2YFWHNq/EYv3iRKTJqJkPPPnwQtXUEnRgF+DqBB4EaAETIOigy2yQkMzmqCw==@vger.kernel.org
X-Received: by 2002:a05:651c:1118:20b0:335:16a4:cfe1 with SMTP id
 38308e7fff4ca-3353bcd5c50mr7339211fa.6.1755703323895; Wed, 20 Aug 2025
 08:22:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820143824.551777-1-sakari.ailus@linux.intel.com> <20250820143824.551777-10-sakari.ailus@linux.intel.com>
In-Reply-To: <20250820143824.551777-10-sakari.ailus@linux.intel.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 20 Aug 2025 17:21:50 +0200
X-Gmail-Original-Message-ID: <CANiDSCuBNsRq45J6RZibD=fWxWuUKBWJfW=7addXK8g7J8R8mw@mail.gmail.com>
X-Gm-Features: Ac12FXwwGHcJ2y9cwGTilVIHefPWT6Ic00MsCu97CZsAIXOY28DZX-cIYltqB3s
Message-ID: <CANiDSCuBNsRq45J6RZibD=fWxWuUKBWJfW=7addXK8g7J8R8mw@mail.gmail.com>
Subject: Re: [PATCH v5 9/9] media: uvcvideo: eUSB2 double isochronous
 bandwidth support
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-media@vger.kernel.org, 
	gregkh@linuxfoundation.org, laurent.pinchart@ideasonboard.com, 
	hdegoede@redhat.com, Thinh.Nguyen@synopsys.com, 
	Amardeep Rai <amardeep.rai@intel.com>, Kannappan R <r.kannappan@intel.com>, 
	Mathias Nyman <mathias.nyman@linux.intel.com>, Alan Stern <stern@rowland.harvard.edu>, 
	=?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sakari

I believe you have missed my previous email.

https://lore.kernel.org/linux-media/CANiDSCsocBBQRPRFAbAovkzauThgN8Qd1u8kjJ=
_af-83Nd4wvw@mail.gmail.com/

re-posting here

On Wed, 20 Aug 2025 at 16:39, Sakari Ailus <sakari.ailus@linux.intel.com> w=
rote:
>
> From: Tao Q Tao <tao.q.tao@intel.com>
>
> Use usb_endpoint_max_esit_payload() from the USB framework to find the
> maximum bytes per interval for the endpoint. Consequently this adds eUSB2
> isochronous mode and SuperSpeedPlus Isochronous Endpoint Companion suppor=
t
> where larger payloads within a service interval are possible.
>
>

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>

Co-developed-by: Amardeep Rai <amardeep.rai@intel.com>
> Signed-off-by: Amardeep Rai <amardeep.rai@intel.com>
> Signed-off-by: Tao Q Tao <tao.q.tao@intel.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> Co-developed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

nit: I believe the last tag should be: Signed-off-by:


> ---
>  drivers/media/usb/uvc/uvc_driver.c |  4 ++--
>  drivers/media/usb/uvc/uvc_video.c  | 24 +++---------------------
>  drivers/media/usb/uvc/uvcvideo.h   |  4 +---
>  3 files changed, 6 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/u=
vc_driver.c
> index 775bede0d93d..d06ca79ae2d9 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -539,7 +539,7 @@ static int uvc_parse_streaming(struct uvc_device *dev=
,
>         unsigned int nformats =3D 0, nframes =3D 0, nintervals =3D 0;
>         unsigned int size, i, n, p;
>         u32 *interval;
> -       u16 psize;
> +       u32 psize;
>         int ret =3D -EINVAL;
>
>         if (intf->cur_altsetting->desc.bInterfaceSubClass
> @@ -775,7 +775,7 @@ static int uvc_parse_streaming(struct uvc_device *dev=
,
>                                 streaming->header.bEndpointAddress);
>                 if (ep =3D=3D NULL)
>                         continue;
> -               psize =3D uvc_endpoint_max_bpi(dev->udev, ep);
> +               psize =3D usb_endpoint_max_periodic_payload(dev->udev, ep=
);
>                 if (psize > streaming->maxpsize)
>                         streaming->maxpsize =3D psize;
>         }
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uv=
c_video.c
> index a5013a7fbca4..1a0cc937de9b 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1869,24 +1869,6 @@ static void uvc_video_stop_transfer(struct uvc_str=
eaming *stream,
>                 uvc_free_urb_buffers(stream);
>  }
>
> -/*
> - * Compute the maximum number of bytes per interval for an endpoint.
> - */
> -u16 uvc_endpoint_max_bpi(struct usb_device *dev, struct usb_host_endpoin=
t *ep)
> -{
> -       u16 psize;
> -
> -       switch (dev->speed) {
> -       case USB_SPEED_SUPER:
> -       case USB_SPEED_SUPER_PLUS:
> -               return le16_to_cpu(ep->ss_ep_comp.wBytesPerInterval);
> -       default:
> -               psize =3D usb_endpoint_maxp(&ep->desc);
> -               psize *=3D usb_endpoint_maxp_mult(&ep->desc);
> -               return psize;
> -       }
> -}
> -
>  /*
>   * Initialize isochronous URBs and allocate transfer buffers. The packet=
 size
>   * is given by the endpoint.
> @@ -1897,10 +1879,10 @@ static int uvc_init_video_isoc(struct uvc_streami=
ng *stream,
>         struct urb *urb;
>         struct uvc_urb *uvc_urb;
>         unsigned int npackets, i;
> -       u16 psize;
> +       u32 psize;
>         u32 size;
>
> -       psize =3D uvc_endpoint_max_bpi(stream->dev->udev, ep);
> +       psize =3D usb_endpoint_max_periodic_payload(stream->dev->udev, ep=
);
>         size =3D stream->ctrl.dwMaxVideoFrameSize;
>
>         npackets =3D uvc_alloc_urb_buffers(stream, size, psize, gfp_flags=
);
> @@ -2043,7 +2025,7 @@ static int uvc_video_start_transfer(struct uvc_stre=
aming *stream,
>                                 continue;
>
>                         /* Check if the bandwidth is high enough. */
> -                       psize =3D uvc_endpoint_max_bpi(stream->dev->udev,=
 ep);
> +                       psize =3D usb_endpoint_max_periodic_payload(strea=
m->dev->udev, ep);
>                         if (psize >=3D bandwidth && psize < best_psize) {
>                                 altsetting =3D alts->desc.bAlternateSetti=
ng;
>                                 best_psize =3D psize;
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvc=
video.h
> index 757254fc4fe9..ac19ca721f29 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -456,7 +456,7 @@ struct uvc_streaming {
>
>         struct usb_interface *intf;
>         int intfnum;
> -       u16 maxpsize;
> +       u32 maxpsize;
>
>         struct uvc_streaming_header header;
>         enum v4l2_buf_type type;
> @@ -798,8 +798,6 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle);
>  /* Utility functions */
>  struct usb_host_endpoint *uvc_find_endpoint(struct usb_host_interface *a=
lts,
>                                             u8 epaddr);
> -u16 uvc_endpoint_max_bpi(struct usb_device *dev, struct usb_host_endpoin=
t *ep);
> -
>  /* Quirks support */
>  void uvc_video_decode_isight(struct uvc_urb *uvc_urb,
>                              struct uvc_buffer *buf,
> --
> 2.47.2
>
>


--=20
Ricardo Ribalda

