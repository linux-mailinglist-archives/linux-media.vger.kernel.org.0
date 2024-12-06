Return-Path: <linux-media+bounces-22803-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D729E7117
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 15:51:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31B2A18846B2
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 14:51:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B82B11F8F13;
	Fri,  6 Dec 2024 14:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="P7D43zKc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C421537D4
	for <linux-media@vger.kernel.org>; Fri,  6 Dec 2024 14:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733496698; cv=none; b=aS9qNvThD5uSAqcQi0H4KpQy1Kt+g6SJgwPRXt45DCYB3WllwKORfRU3q1LZvVg27iIqN5CsxhXhkphTyPAcmWkEz/JkBXdeudXfTT8VUuUPCOj2zY/UKIsXVWvECQZzZ+YxNMZL3B7xDgeX9h0S+9xZkP3rNomMKJoJGRdPiyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733496698; c=relaxed/simple;
	bh=/tuYPwJTtJ4Svob5I/ujRMdmikjrzcucjhMGBvhTg/A=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=pCZfmCe7xbxn9gC72kukMrOwT/vaqNi1BB/Ex8ZCxuw2VWNdnAiy2LArrJp5aHVPU7EadZKZAeKXmfMgj7BgIr3TBCH0l8c6KkjUxme/8VE4Vmk3J50nFxhUCwFzltQJLwGEoC9FhrAFqomQYJ8dXyvUyJBBlBCJSWFKqMweD60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=P7D43zKc; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5d0d4a2da4dso3505753a12.1
        for <linux-media@vger.kernel.org>; Fri, 06 Dec 2024 06:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1733496694; x=1734101494; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u4sWRf4hJF+nJwKhKGaqJGBfySo0Ly+PnsMhNpbfdzo=;
        b=P7D43zKchPrhdx3fk4Ecjry55dvz3dYInI/0bHsdDgwvTvqIv+CjFOgtb5nq2NC581
         1KIUWBnoLGanbgqju8OX0gunuamecdC07hwa0oPs2YdmkGXa6LFzdEjLlbHk6oMh0tJK
         ZoiQu56CDMfc+VZNAY1g5dhrKdGxmDwdqzgjWFBcTeyHa8JEsJOiYJIIUof0UMQVvrM/
         S7kzXSEk2zK7PCLtHtcOvDw3cFi7KdmZb7pD5MNyvrr0lxtomrMVFfbeUqV55CmrWd2x
         ji+nqPLrFMeUWSS8caktjRI+X7f+P0nlUOQLwnYPg1NiBxZxUu/YxUlug9CdeJhvxmkP
         8TSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733496694; x=1734101494;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u4sWRf4hJF+nJwKhKGaqJGBfySo0Ly+PnsMhNpbfdzo=;
        b=rLi1PDfn/uBsLqi1aC9OtUPpSPtFhhdUiJ9ZZ5+cTsb7efE9QeDcU5HhKiSentB/oQ
         RSFWcLr436c9FgnvAyboBpCc8Ah7CDJMFv1rg9f2/ua6x9jUJvroOO6VfrI1iRxNjael
         zKJOgr6fsfAXxZ39EPsUXrHZrjaTSNE7MW28A7xeGR8HRtAkaT5tQzHPKTfJRAZ25ob9
         cizgFztS6Dp0VlpnZo5TPzw5UikOofIUXw0CPnU2OJDniJr/EQW0wkHNRm+ehxIbenpL
         z4Gc7Cxbz6ni/Uostwp2QpbqScaOW5zkW1OAs/yxe+Tz02g6BFXubv35ALJ2ZPy0eWGZ
         Z0UQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkhGV/oJN2NRPuTHKn6GFQLuwMgHa9xqW41lhkW/9Wsdskd+FfvJKB7Lgb9HmiKzTVkplNGpcO5WoDpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCzbXSTvp2v99APA24eouTxs/7JPfLyiLqFtpRCUIFXnxKcpBu
	aIH2lWzoHEWcQVVE1aekEeIxM1W9fSflOh2lCciujJUwWvv3paMmT49lem9zysg=
X-Gm-Gg: ASbGncv7kQ4H19WGAWVYmSTIly80Ef/kADG8QVVp/Xf74pR+sWzbec7prL7eibAf0g/
	dmd6QSYHNx3R+V3vuuDytk28THTG3vh/ElpcMAsW6ejDcZkEVwYZrhjOK4M4IO4WnWe312WKHvS
	D0IBFvJsPO+0Sf2OoeRRmyV5Oh5KjJ/wCr3J1FWtwuBxzId4PUgSxGyVVIr8Jjhi198+s5JNdoS
	5zNnZo9qLbAjOoq3yUqMAIqP3bzIsOvQnd8+nj2HfvYreIms1vMxsTk5cn0l7U4MmJCWwLTJMb8
	xoZwRoX6hhCLIqG/REUOYp7UryA13dEGlrNj6GTTxTK4xU7FhWNmOyZwKAfj7w==
X-Google-Smtp-Source: AGHT+IF3ycQKdVhs/GREAgOvRVra6yPFbB24y2IHadPhsDlfk3Y572eRHeBOD9F6SFeEhTxMX7fWeA==
X-Received: by 2002:a05:6402:358a:b0:5d2:7199:ae7 with SMTP id 4fb4d7f45d1cf-5d3be6d74b2mr3641833a12.11.1733496694443;
        Fri, 06 Dec 2024 06:51:34 -0800 (PST)
Received: from localhost (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3bc829433sm1261863a12.38.2024.12.06.06.51.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 06:51:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Dec 2024 15:51:33 +0100
Message-Id: <D64PAIXELZ6A.37ZSFBIRPE6MT@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Jordan Crouse" <jorcrous@amazon.com>, <linux-media@vger.kernel.org>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Robert Foss" <rfoss@kernel.org>, "Todor Tomov"
 <todor.too@gmail.com>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/2] media: camss: Increase the maximum frame size
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20240802152435.35796-1-jorcrous@amazon.com>
 <20240802152435.35796-2-jorcrous@amazon.com>
In-Reply-To: <20240802152435.35796-2-jorcrous@amazon.com>

On Fri Aug 2, 2024 at 5:24 PM CEST, Jordan Crouse wrote:
> Commit 35493d653a2d
> ("media: camss: add support for vidioc_enum_framesizes ioctl") added a
> maximum frame width and height but the values selected seemed to have
> been arbitrary. In reality the cam hardware doesn't seem to have a maximu=
m
> size restriction so double up the maximum reported width and height to
> allow for larger frames.
>
> Also increase the maximum size checks at each point in the pipeline so
> the increased sizes are allowed all the way down to the sensor.

Hi Jordan,

Looks like this hasn't landed yet, do you plan on resending this?

Just wanted to try a 8192x6144 format but csid limiting the size to 8191
is a bit in the way.

Regards
Luca

>
> Signed-off-by: Jordan Crouse <jorcrous@amazon.com>
> ---
>
>  drivers/media/platform/qcom/camss/camss-csid.c   | 8 ++++----
>  drivers/media/platform/qcom/camss/camss-csiphy.c | 4 ++--
>  drivers/media/platform/qcom/camss/camss-ispif.c  | 4 ++--
>  drivers/media/platform/qcom/camss/camss-vfe.c    | 4 ++--
>  drivers/media/platform/qcom/camss/camss-video.c  | 6 +++---
>  5 files changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/med=
ia/platform/qcom/camss/camss-csid.c
> index 858db5d4ca75..886c42c82612 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -752,8 +752,8 @@ static void csid_try_format(struct csid_device *csid,
>  		if (i >=3D csid->res->formats->nformats)
>  			fmt->code =3D MEDIA_BUS_FMT_UYVY8_1X16;
> =20
> -		fmt->width =3D clamp_t(u32, fmt->width, 1, 8191);
> -		fmt->height =3D clamp_t(u32, fmt->height, 1, 8191);
> +		fmt->width =3D clamp_t(u32, fmt->width, 1, 16383);
> +		fmt->height =3D clamp_t(u32, fmt->height, 1, 16383);
> =20
>  		fmt->field =3D V4L2_FIELD_NONE;
>  		fmt->colorspace =3D V4L2_COLORSPACE_SRGB;
> @@ -781,8 +781,8 @@ static void csid_try_format(struct csid_device *csid,
>  			if (i >=3D csid->res->formats->nformats)
>  				fmt->code =3D MEDIA_BUS_FMT_UYVY8_1X16;
> =20
> -			fmt->width =3D clamp_t(u32, fmt->width, 1, 8191);
> -			fmt->height =3D clamp_t(u32, fmt->height, 1, 8191);
> +			fmt->width =3D clamp_t(u32, fmt->width, 1, 16383);
> +			fmt->height =3D clamp_t(u32, fmt->height, 1, 16383);
> =20
>  			fmt->field =3D V4L2_FIELD_NONE;
>  		}
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/m=
edia/platform/qcom/camss/camss-csiphy.c
> index 2f7361dfd461..43c35ad6ac84 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -368,8 +368,8 @@ static void csiphy_try_format(struct csiphy_device *c=
siphy,
>  		if (i >=3D csiphy->res->formats->nformats)
>  			fmt->code =3D MEDIA_BUS_FMT_UYVY8_1X16;
> =20
> -		fmt->width =3D clamp_t(u32, fmt->width, 1, 8191);
> -		fmt->height =3D clamp_t(u32, fmt->height, 1, 8191);
> +		fmt->width =3D clamp_t(u32, fmt->width, 1, 16383);
> +		fmt->height =3D clamp_t(u32, fmt->height, 1, 16383);
> =20
>  		fmt->field =3D V4L2_FIELD_NONE;
>  		fmt->colorspace =3D V4L2_COLORSPACE_SRGB;
> diff --git a/drivers/media/platform/qcom/camss/camss-ispif.c b/drivers/me=
dia/platform/qcom/camss/camss-ispif.c
> index a12dcc7ff438..01e2ded8da0b 100644
> --- a/drivers/media/platform/qcom/camss/camss-ispif.c
> +++ b/drivers/media/platform/qcom/camss/camss-ispif.c
> @@ -912,8 +912,8 @@ static void ispif_try_format(struct ispif_line *line,
>  		if (i >=3D line->nformats)
>  			fmt->code =3D MEDIA_BUS_FMT_UYVY8_1X16;
> =20
> -		fmt->width =3D clamp_t(u32, fmt->width, 1, 8191);
> -		fmt->height =3D clamp_t(u32, fmt->height, 1, 8191);
> +		fmt->width =3D clamp_t(u32, fmt->width, 1, 16383);
> +		fmt->height =3D clamp_t(u32, fmt->height, 1, 16383);
> =20
>  		fmt->field =3D V4L2_FIELD_NONE;
>  		fmt->colorspace =3D V4L2_COLORSPACE_SRGB;
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index 83c5a36d071f..826c0fb31785 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -1049,8 +1049,8 @@ static void vfe_try_format(struct vfe_line *line,
>  		if (i >=3D line->nformats)
>  			fmt->code =3D MEDIA_BUS_FMT_UYVY8_1X16;
> =20
> -		fmt->width =3D clamp_t(u32, fmt->width, 1, 8191);
> -		fmt->height =3D clamp_t(u32, fmt->height, 1, 8191);
> +		fmt->width =3D clamp_t(u32, fmt->width, 1, 16383);
> +		fmt->height =3D clamp_t(u32, fmt->height, 1, 16383);
> =20
>  		fmt->field =3D V4L2_FIELD_NONE;
>  		fmt->colorspace =3D V4L2_COLORSPACE_SRGB;
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/me=
dia/platform/qcom/camss/camss-video.c
> index cd72feca618c..5fee3733da8e 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -19,10 +19,10 @@
>  #include "camss.h"
> =20
>  #define CAMSS_FRAME_MIN_WIDTH		1
> -#define CAMSS_FRAME_MAX_WIDTH		8191
> +#define CAMSS_FRAME_MAX_WIDTH		16833
>  #define CAMSS_FRAME_MIN_HEIGHT		1
> -#define CAMSS_FRAME_MAX_HEIGHT_RDI	8191
> -#define CAMSS_FRAME_MAX_HEIGHT_PIX	4096
> +#define CAMSS_FRAME_MAX_HEIGHT_RDI	16833
> +#define CAMSS_FRAME_MAX_HEIGHT_PIX	8192
> =20
>  /* ---------------------------------------------------------------------=
--------
>   * Helper functions


