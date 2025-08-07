Return-Path: <linux-media+bounces-38996-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9811AB1D290
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 08:39:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4AA017032E
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 06:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 050E02248B9;
	Thu,  7 Aug 2025 06:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UMsR/+1n"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A642222575
	for <linux-media@vger.kernel.org>; Thu,  7 Aug 2025 06:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754548754; cv=none; b=gNuYl3Q4WmMoFo+oVaF2w0jNnRiYIZJLx1nZiN+V+d9XnApM+8SxkNhsUhwE0D6Ppi2QF25uvIgbcknqlE9yqQsmYNjILX4Jgl4qQHahUU3Krf9/NRdraQ0JTqPGIBDYV6wli/WPqvLg2aGQjJK1a7cyMxBtUsdpyiFE38I00+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754548754; c=relaxed/simple;
	bh=MXdjMRzs4/Yis1JOxgwQyQXVfB8C3Y+1VqYmkTyBzQQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D3Z1llPdYsldvguzOcaGI6SiIanmRi+FauYmEKhwxYeYc0a0vpUEdDtltj16pTU5z7ofANUha7m4fJn8Og0HcVtcgoBeaLQKz48m2ezaV2bVSNY9h5N9cgK1nxSUckM0LxwjQtN1meq24OekzPuAlx5fRVLnsJo+2+kLDN7fPgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UMsR/+1n; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-55b8f1a13e9so555177e87.1
        for <linux-media@vger.kernel.org>; Wed, 06 Aug 2025 23:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1754548750; x=1755153550; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZiIsxBEMLwOXjJq0NeBsN3GxwEnPTJQznjK+141SLRA=;
        b=UMsR/+1nalAaaz/79jnO2Bwg6x+Sh/1KevtyUiZlC681cdeqiPXW5I8sxducu0lFCt
         sy50m4NHxPHMIfnHzYiV5lEwEteMG/g60MRjyX5+pQiLCdzu8N3+9jPkadut/70NhcXf
         N+pT+lyQ9jSQGZ8xuS8DkxPR4dKFTMlGWcYjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754548750; x=1755153550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZiIsxBEMLwOXjJq0NeBsN3GxwEnPTJQznjK+141SLRA=;
        b=dRvKuIBITcs8W4fmJlTuoubTx/BM8yWd1Vht0QK+VoWAt2BHqWAY+jbIYg/ZouUmNA
         oRHyMKVLsK45JBpSDbCPaeAJ/oPA5x6Bih9nvoEt4si7NLO5qWjnyhudh5lVzsJuUa7p
         cw0z6NaOCnAT99/aYAdnOwkMGIT3zyT53OhkFEr55RUGiiY6bACwc/hZ5uaNDjmwL/Al
         pF6zal+XIwtzk8VWzmhYPobf0PR8DuugDu4Ab/GkQX0muHZdWjwY4QR/WKBlh1BWCntU
         h7J4PNBmhZG94tZTJxVspvk6CpJdfGfqkycg9XxV4NGXwu9pE8/83Ar8Ul6Yady86g9Y
         599Q==
X-Forwarded-Encrypted: i=1; AJvYcCXJPyYBUJsITTWVTrtRtXxsgAqlwRTTPrZoFrIw1o/VeEYMqdYwxIwFG1O+qiiCgrN3yNEQVzpQq74shA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRxMY+eyBRYV4LJZe4d4RxoDlmzHvL4lJQW8VZDCeIroX9Ut/Z
	MebBghBPBFIgGi4htpxCYdVE+WSdRZm2xYK4YvMfCUkIItsPs9QhFhNMrmxh/M+X7KSdBnSDM7F
	TAQ4=
X-Gm-Gg: ASbGncsLkre2m3/SCVP0VPmqvSSqZ829xnwuR65YKQe9OegR3mLXCOabUCBJyu6yC9I
	bryx3Sc3LVJGmi7ExpCvzHOeN70bbm5Gy5Q5fzgG4qpu0z0RKiNU7m8NIPXHix25ZQ16lkj27jz
	viUiCWvJ8lpZO9Wq3T0KGtbbFhg2kb1lI8jc0V8r6BIf9CTh5ojMgF2lDqpK1y4YuCXIY3isl/5
	WylZy/oIapNOhIRtvx1di3KGpSfGF9YndIocsfCOc7ohWVIo5f0w6vRl28uSDa6ama//vUkREm9
	hx0ca7xow4Ehm+DY3LQ6C70l4M0llMPeI+ld/4qFFqumRKmjEsQnXALuB5Cfy/IVhckCvd0Ba2K
	J7P5QyxX6RzKZr8jtc4gI5fmOWDh3HshbyI1nLo9MXvkAGp8Qw5pDQ0K64i9pX+5Q
X-Google-Smtp-Source: AGHT+IF2Wa2V7RV2bPAPLGPBNIgZ45NfDLQHk9E0UlKa10E14kiLnq6sVZFEztShdzGH1Avi8k3WOQ==
X-Received: by 2002:ac2:4c45:0:b0:55b:9424:ddb9 with SMTP id 2adb3069b0e04-55caf5f82bfmr1889194e87.44.1754548750138;
        Wed, 06 Aug 2025 23:39:10 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88c99078sm2495214e87.102.2025.08.06.23.39.09
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 23:39:09 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-32e14ce168eso6715791fa.1
        for <linux-media@vger.kernel.org>; Wed, 06 Aug 2025 23:39:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVw1fSB+HpNNR8gm6e61YunjWF1+oSNaPY5zKwF4mmRKP+4i31YH++n0bWFDLIgujMeEMpoRiSnRr12Eg==@vger.kernel.org
X-Received: by 2002:a05:651c:334a:b0:32c:bc69:e926 with SMTP id
 38308e7fff4ca-3338122fe44mr10081581fa.7.1754548748780; Wed, 06 Aug 2025
 23:39:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250807055355.1257029-1-sakari.ailus@linux.intel.com> <20250807055355.1257029-5-sakari.ailus@linux.intel.com>
In-Reply-To: <20250807055355.1257029-5-sakari.ailus@linux.intel.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 7 Aug 2025 08:38:55 +0200
X-Gmail-Original-Message-ID: <CANiDSCsocBBQRPRFAbAovkzauThgN8Qd1u8kjJ_af-83Nd4wvw@mail.gmail.com>
X-Gm-Features: Ac12FXxYhHXMWpUQanb1KXmhOH6Gp8gXQfNOLFtPT7TKV2Pe1Uyva1tWR3Xqv_Q
Message-ID: <CANiDSCsocBBQRPRFAbAovkzauThgN8Qd1u8kjJ_af-83Nd4wvw@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] media: uvcvideo: eUSB2 double isochronous
 bandwidth support
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-media@vger.kernel.org, 
	gregkh@linuxfoundation.org, laurent.pinchart@ideasonboard.com, 
	hdegoede@redhat.com, Thinh.Nguyen@synopsys.com, 
	Amardeep Rai <amardeep.rai@intel.com>, Kannappan R <r.kannappan@intel.com>, 
	Mathias Nyman <mathias.nyman@linux.intel.com>, Alan Stern <stern@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 7 Aug 2025 at 07:54, Sakari Ailus <sakari.ailus@linux.intel.com> wr=
ote:
>
> From: Tao Q Tao <tao.q.tao@intel.com>
>
> Use usb_endpoint_max_isoc_bpi() from the USB framework to find the maximu=
m
> bytes per interval for the endpoint. Consequently this adds eUSB2
> isochronous mode and SuperSpeedPlus Isochronous Endpoint Compaion support
> where larger bpi values are possible.
>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Co-developed-by: Amardeep Rai <amardeep.rai@intel.com>
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
> index da24a655ab68..fde0bc95622c 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -536,7 +536,7 @@ static int uvc_parse_streaming(struct uvc_device *dev=
,
>         unsigned int nformats =3D 0, nframes =3D 0, nintervals =3D 0;
>         unsigned int size, i, n, p;
>         u32 *interval;
> -       u16 psize;
> +       u32 psize;
>         int ret =3D -EINVAL;
>
>         if (intf->cur_altsetting->desc.bInterfaceSubClass
> @@ -772,7 +772,7 @@ static int uvc_parse_streaming(struct uvc_device *dev=
,
>                                 streaming->header.bEndpointAddress);
>                 if (ep =3D=3D NULL)
>                         continue;
> -               psize =3D uvc_endpoint_max_bpi(dev->udev, ep);
> +               psize =3D usb_endpoint_max_isoc_bpi(dev->udev, ep);
>                 if (psize > streaming->maxpsize)
>                         streaming->maxpsize =3D psize;
>         }
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uv=
c_video.c
> index a75af314e46b..335b1c4eff9b 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1860,24 +1860,6 @@ static void uvc_video_stop_transfer(struct uvc_str=
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
> @@ -1888,10 +1870,10 @@ static int uvc_init_video_isoc(struct uvc_streami=
ng *stream,
>         struct urb *urb;
>         struct uvc_urb *uvc_urb;
>         unsigned int npackets, i;
> -       u16 psize;
> +       u32 psize;
>         u32 size;
>
> -       psize =3D uvc_endpoint_max_bpi(stream->dev->udev, ep);
> +       psize =3D usb_endpoint_max_isoc_bpi(stream->dev->udev, ep);
>         size =3D stream->ctrl.dwMaxVideoFrameSize;
>
>         npackets =3D uvc_alloc_urb_buffers(stream, size, psize, gfp_flags=
);
> @@ -2034,7 +2016,7 @@ static int uvc_video_start_transfer(struct uvc_stre=
aming *stream,
>                                 continue;
>
>                         /* Check if the bandwidth is high enough. */
> -                       psize =3D uvc_endpoint_max_bpi(stream->dev->udev,=
 ep);
> +                       psize =3D usb_endpoint_max_isoc_bpi(stream->dev->=
udev, ep);
>                         if (psize >=3D bandwidth && psize < best_psize) {
>                                 altsetting =3D alts->desc.bAlternateSetti=
ng;
>                                 best_psize =3D psize;
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvc=
video.h
> index b9f8eb62ba1d..a77ba76e033a 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -450,7 +450,7 @@ struct uvc_streaming {
>
>         struct usb_interface *intf;
>         int intfnum;
> -       u16 maxpsize;
> +       u32 maxpsize;
>
>         struct uvc_streaming_header header;
>         enum v4l2_buf_type type;
> @@ -818,8 +818,6 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle);
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
> 2.39.5
>
>


--=20
Ricardo Ribalda

