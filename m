Return-Path: <linux-media+bounces-13969-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2773891349C
	for <lists+linux-media@lfdr.de>; Sat, 22 Jun 2024 17:03:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7962284772
	for <lists+linux-media@lfdr.de>; Sat, 22 Jun 2024 15:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE98316F8F3;
	Sat, 22 Jun 2024 15:03:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC011DFD9;
	Sat, 22 Jun 2024 15:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719068627; cv=none; b=MJw7W3NTs/npq30bg1yGfhWMdgBTfg2BoGSZCh7pS2W7q9agrnE4upfcbNRyhncA49qXNG4DkitIqh/TdAIeLazcSRVuN6tnGCsHvuTOfsfZD9NtF2zcPSUqjDM5myGmjDeUCWP9Yp3uv/sdgT2g0IVlyMrV3SVcu+bWX24Kz28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719068627; c=relaxed/simple;
	bh=cjKMZmz1+T3iNBF6JIejoovikIM6tTkLPyR5PvQ3o/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I5QT5px6ud+oTgl7mp/ZgerpLUoQuiS/tjpFBmgLcSynxe4QWJdwmWfAikanSD/0eRjCXgFhMGalGY/4Xuf67tKN+Qkxm5zLmNqZKlZCviw584JkNAkHJSx3LOt1bQOOKZbj9IOdkSicmZ4Bxochi5d2DfMIlBCISGQWZ9kkqp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52cdf9f934fso338042e87.1;
        Sat, 22 Jun 2024 08:03:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719068623; x=1719673423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VNuj2fx5FjpZLP3qt6F+gtN+RXIt6q+vnIfAmNUtpEE=;
        b=jQuON8Eb1eBLrHlFBfH6ltT7OMtDwwsWQV35a705++287iBbg1YYCG8VSqafegwjmx
         EKT+3y1VnokG4troX1OACvcwj5CIBPTvNjMsR1wHJMPRrZTrFrsQp/3MJGo5hZ82ycaN
         oTzO66KYSnDMVeIcrb2bRBaOIrxtgOR7AVhogmQshZuCm2+c4/slCmK3m6C4VgmptuhE
         48d0ne2WS3FTKmIqTRJGIAqc/R12Jwy8YxDRf5bfmj84yUkju0bhP0Lkdp1xejSzHnix
         aY8E8pyBElZN/8B6upUVIpAOPH1BcxdMSwHqCJUu51nAokpVW3bE7tgIqAoUQqp/d8OM
         +6ig==
X-Forwarded-Encrypted: i=1; AJvYcCWjls4Vd/AIeYJ3wuzCQRGe41nVMtx8SnP/fTNb3xhqX6GLVVmF+scJwOVUjxh5jfT4Psq5dZaCBgADPXoEecXNY2xaUNK7a+FmxhZ+bqWHBKY=
X-Gm-Message-State: AOJu0YyI82pH/hEeRnXDwe2VHKdyPVxGMq8YOZMpi5onRcmd0DvD2ABw
	CfVHq9PIqovCW23oj4f8dkVftIrSNTg93/z4Z0MmZCLxN+Jl95/Oc1C5JQ==
X-Google-Smtp-Source: AGHT+IGb5Qj5yzpvLcoI/S56QEZUHxLIvrTzISuBLHBKmZUyn9LItifwuSl1rwU4ufOxO38aKZ7x7A==
X-Received: by 2002:ac2:5ec1:0:b0:52c:d9f8:b033 with SMTP id 2adb3069b0e04-52ce063e78amr476447e87.3.1719068622697;
        Sat, 22 Jun 2024 08:03:42 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd63b443fsm513795e87.24.2024.06.22.08.03.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Jun 2024 08:03:41 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ec58040f39so2506641fa.2;
        Sat, 22 Jun 2024 08:03:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXQJB3vTPLL3M0HWluDgp2njXcDUUF8rerLyBsOoo9sza+jqXJtNfr74lVgRs4H6BBqKWAkOPjIAmf4wfcHt8fxbSEBSNUOvDEd6PcHjikWBmE=
X-Received: by 2002:a2e:7d11:0:b0:2ec:f68:51e0 with SMTP id
 38308e7fff4ca-2ec59526da8mr3595311fa.44.1719068621641; Sat, 22 Jun 2024
 08:03:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240619012356.22685-1-laurent.pinchart+renesas@ideasonboard.com> <20240619012356.22685-3-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20240619012356.22685-3-laurent.pinchart+renesas@ideasonboard.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 22 Jun 2024 23:03:32 +0800
X-Gmail-Original-Message-ID: <CAGb2v66TeWWE+F9KXG+8_9e7rDcq2zjm6ugFiUT_bYVOTM6P-A@mail.gmail.com>
Message-ID: <CAGb2v66TeWWE+F9KXG+8_9e7rDcq2zjm6ugFiUT_bYVOTM6P-A@mail.gmail.com>
Subject: Re: [PATCH 2/8] media: sun4i_csi: Implement link validate for
 sun4i_csi subdev
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, Eugen Hristev <eugen.hristev@collabora.com>, 
	Maxime Ripard <mripard@kernel.org>, Sakari Ailus <sakari.ailus@iki.fi>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2024 at 9:24=E2=80=AFAM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
>
> The sun4i_csi driver doesn't implement link validation for the subdev it
> registers, leaving the link between the subdev and its source
> unvalidated. Fix it, using the v4l2_subdev_link_validate() helper.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>

Acked-by: Chen-Yu Tsai <wens@csie.org>

> ---
>  drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers=
/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> index 097a3a08ef7d..dbb26c7b2f8d 100644
> --- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> +++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> @@ -39,6 +39,10 @@ static const struct media_entity_operations sun4i_csi_=
video_entity_ops =3D {
>         .link_validate =3D v4l2_subdev_link_validate,
>  };
>
> +static const struct media_entity_operations sun4i_csi_subdev_entity_ops =
=3D {
> +       .link_validate =3D v4l2_subdev_link_validate,
> +};
> +
>  static int sun4i_csi_notify_bound(struct v4l2_async_notifier *notifier,
>                                   struct v4l2_subdev *subdev,
>                                   struct v4l2_async_connection *asd)
> @@ -214,6 +218,7 @@ static int sun4i_csi_probe(struct platform_device *pd=
ev)
>         subdev->internal_ops =3D &sun4i_csi_subdev_internal_ops;
>         subdev->flags =3D V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS=
_EVENTS;
>         subdev->entity.function =3D MEDIA_ENT_F_VID_IF_BRIDGE;
> +       subdev->entity.ops =3D &sun4i_csi_subdev_entity_ops;
>         subdev->owner =3D THIS_MODULE;
>         snprintf(subdev->name, sizeof(subdev->name), "sun4i-csi-0");
>         v4l2_set_subdevdata(subdev, csi);
> --
> Regards,
>
> Laurent Pinchart
>
>

