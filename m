Return-Path: <linux-media+bounces-28884-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8191A73F2E
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 21:02:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 57DB57A3725
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 20:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F156D1C8FD6;
	Thu, 27 Mar 2025 20:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RDMF5v98"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04754158D80;
	Thu, 27 Mar 2025 20:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743105763; cv=none; b=HtlHWgRfXbupaZzFfdnLgY9gh3t10KYjk0MakbFqJqU7bpXY2PoHG5Oh9Fn5I6qFKKgmaMyPpXrcSsg+VuZqrF1doYjB/aDIdOe/2FC+GZBCAKVNIAeKpJQxCvOvsaOsn8xxyyW6PSP4w08s7xYHWHibpuSBRXywsWu3oBNbiZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743105763; c=relaxed/simple;
	bh=upFVl2TTrdrPVb+18Vptv5pAKRaC8ryTOgpQjZLsV/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q8kmT3kSL6mCumYKlZ4LBsF5mHiIUdX2ySz+i1+Bv5mzKSFf2mUZOKujKHx+pMDb0V873rYMIiAx3r+osTR84sf+Yh7c9b6LIdWvbb04EGlUjI9PAtltZz14cGYZnYmrEjI9CdbmLhNjvEqwGmyQQVCBL2bUV6rlX2QZYsxISeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RDMF5v98; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-225477548e1so29882615ad.0;
        Thu, 27 Mar 2025 13:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743105761; x=1743710561; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wuAJatc2JmXf0iY6WMCrv4PggaSVzunJXyftBhSJxQY=;
        b=RDMF5v98eP+vCjmog+yv7qvNfXaI0ia7ommlie/Lj1BIOIL1q2b+Ni/c1ttWENz0X2
         0v2/pO26a99sp0LpcLxQ+KjwJBY411Qhb93/IE1o8Si0sq3Zb5v2JTSxO3zULXU7fn0J
         yYRBqJc0VnM0ttOpErUQc030687nnvKucM8aeuVpQ6apfSKR4X1G1fEJBVypzDrpWukm
         Um6UWa2Bi58qLbcW2E4BlCMUGWwvxb1ABICy+aCn1qLyuEBjA4M1aU+F1t2+QHGHvJ6U
         NGI2Srd+P53rokNH3NMJzfWddz+EfixJhXObgVUzRqz+9pD1jkTSWTlKY/PyKFbKSsEY
         vgMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743105761; x=1743710561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wuAJatc2JmXf0iY6WMCrv4PggaSVzunJXyftBhSJxQY=;
        b=wbJk+GVLqgVPkCxyoydWMb+poXrDtmMOOgti1m+5Q1rxVxJjVj4rdt/ZNgi+G6qc9E
         jXHO5ID0onnoOMqroUuNw7NgqAXGw2l7Gr4bRZFdMqEtZrvsJ/DNF7935cGiQQQ3cN7V
         zHrfD7byNLmaFuYcavABgUQvqDsY0CYMvjQcdSHFo/kFjv0z26UGmgAgLJ2RrKMoTxHf
         P+s8lYhtgiZN3FQizisXOUaLRqVGbTkKh6G1K9AnvE2Pr+Lc6TevXItT3Jf48fpiY3W/
         RbraSOxJv6hNPmuw9/cDZCfmg8RBrjytEcDsLUYgLiy75B/sBvFT8ue9cGP3eGJNqlxy
         WxDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqgFl7n8xBIsG2hoOWUD7QBmGq3nlMLogxTojskyb3fL+3WgwjDAi97ov/pgRmF2QooEUH8yK6Wi2t@vger.kernel.org, AJvYcCXJSQl3ZhZV6wRXIZ4tdWPfpp0r4Jt8R+y1qiZxW+t7Gra+cBZZwabLa5v+ortSnVT1q+8lPaLNQbMazGM=@vger.kernel.org, AJvYcCXqc/U/exOB52JlEY+N9wv7K5XFUqYOee2JZRQ651oL27aDIJ9PPInHj/TPSEyJG5BDEbRLsFtkvABeEIFO@vger.kernel.org
X-Gm-Message-State: AOJu0YyOARycZniQcEHyYhuP28izYAqdXtppImrY4S11OWvIv9888mei
	856bnh3r29Ij5VYrDyoYn+vHufLWJisiRxgWIbmFBpiRBYy27FLTCk96xk7gJ72n+hI9F6Dilkz
	sTGZXSml/rm7YQyutOL7lN3eFDPyuFw==
X-Gm-Gg: ASbGncuFSZ52ieZunov6UpG3M0pgwu3XaW/M5fg/NpuNnoiwG/tFsp/T3aPAY9pnjBn
	rY2mzia314QznKTrUYULYjdfqlnPSxQoTwY+U1taJUCcj8thnqd27F4B3ytvgH4YCn9RwhGcMcq
	HRpEckhhk0w+yrxh8VQoCyPRmHwg==
X-Google-Smtp-Source: AGHT+IFauHqFGz+l5KSmNKiQ87uiI0RmmUS7PE3RtYqUxj+Ju364KNFhZ3pFAY9xmj01bZt3AIVOI+wHC5S3cDOhqvE=
X-Received: by 2002:a17:90b:5686:b0:2fa:15ab:4dff with SMTP id
 98e67ed59e1d1-303a906ebc2mr6863917a91.31.1743105760980; Thu, 27 Mar 2025
 13:02:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com> <20250210-8qxp_camera-v3-4-324f5105accc@nxp.com>
In-Reply-To: <20250210-8qxp_camera-v3-4-324f5105accc@nxp.com>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 27 Mar 2025 15:02:29 -0500
X-Gm-Features: AQ5f1JpXPfB7WcMK1DcTCK1yjsON2ZzVKgj_sI1ozYwDfWnEj3NMxxnXx4v7m90
Message-ID: <CAHCN7x+6_xxkx-Fft6WnfsVyqy_v3c732uKuEanrP64jv3Kj1g@mail.gmail.com>
Subject: Re: [PATCH v3 04/12] media: nxp: imx8-isi: Allow num_sources to be
 greater than num_sink
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>, 
	Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	Robert Chiras <robert.chiras@nxp.com>, "Guoniu.zhou" <guoniu.zhou@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 3:01=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:
>
> Allow num_sources (drvdata: num_channels) to be greater than num_sink
> (drvdata: num_ports + 1).
>
> ISI support stream multiplexing, such as differentiates multiple cameras
> from a single 2-lane MIPI input, or duplicates input stream into multiple
> outputs. So num_channels may be greater than num_ports at some platform.

Can you tell me which platforms support this?   Is this through
virtual channels, or do you physically connect lanes 1 and 2 to one
camera and lanes 3 and 4 to another?

adam
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change from v1 to v3
> - none
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/dr=
ivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> index 93a55c97cd173..ba5b2d3617a23 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> @@ -188,11 +188,11 @@ static int mxc_isi_crossbar_init_state(struct v4l2_=
subdev *sd,
>          * Create a 1:1 mapping between pixel link inputs and outputs to
>          * pipelines by default.
>          */
> -       routes =3D kcalloc(xbar->num_sources, sizeof(*routes), GFP_KERNEL=
);
> +       routes =3D kcalloc(xbar->num_sinks - 1, sizeof(*routes), GFP_KERN=
EL);
>         if (!routes)
>                 return -ENOMEM;
>
> -       for (i =3D 0; i < xbar->num_sources; ++i) {
> +       for (i =3D 0; i < xbar->num_sinks - 1; ++i) {
>                 struct v4l2_subdev_route *route =3D &routes[i];
>
>                 route->sink_pad =3D i;
> @@ -200,7 +200,7 @@ static int mxc_isi_crossbar_init_state(struct v4l2_su=
bdev *sd,
>                 route->flags =3D V4L2_SUBDEV_ROUTE_FL_ACTIVE;
>         }
>
> -       routing.num_routes =3D xbar->num_sources;
> +       routing.num_routes =3D xbar->num_sinks - 1;
>         routing.routes =3D routes;
>
>         ret =3D __mxc_isi_crossbar_set_routing(sd, state, &routing);
> @@ -453,7 +453,7 @@ int mxc_isi_crossbar_init(struct mxc_isi_dev *isi)
>          * the memory input.
>          */
>         xbar->num_sinks =3D isi->pdata->num_ports + 1;
> -       xbar->num_sources =3D isi->pdata->num_ports;
> +       xbar->num_sources =3D isi->pdata->num_channels;
>         num_pads =3D xbar->num_sinks + xbar->num_sources;
>
>         xbar->pads =3D kcalloc(num_pads, sizeof(*xbar->pads), GFP_KERNEL)=
;
>
> --
> 2.34.1
>
>

