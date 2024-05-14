Return-Path: <linux-media+bounces-11451-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3F98C5C08
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2024 22:07:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E8C81C21B26
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2024 20:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C58B9181325;
	Tue, 14 May 2024 20:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="YVUYuY0O"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B022AF09
	for <linux-media@vger.kernel.org>; Tue, 14 May 2024 20:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715717272; cv=none; b=KZT+Gl4Y58DKiIdfMowXp2xve9GGYdEan5+cDO5ysBZX9Hpm4Joo97d7X5XFiXmAextLkEcjIlcrnQSnF0INKt8SAQAjhJSbKMEOY0Q0c8SNsbJlVCfT+8oLwbbqxN6exHTtkUiV+UYXcLN0FD7SkmSr2D2Sf2T2qjQx+2985wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715717272; c=relaxed/simple;
	bh=2W5Y/xzeG4l5pbt6ZtBAMZ+HCQ9g02ORWrF6mXtIvZM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M38+W59HyBSC7JRgsFZ+RoXQzpdemtLe56Bnon9ML2s7vQc53crQtrGTeSb4wA8IDQ4zrl5/HFqbJZ1ib/ORPgXE2vAay308qSJgSdjavj/CfI0SBhVkqtyRFGzaVaVVLxNFUcj02ueIOsPGmMoK08i0Qz89Q29njxA/2VmZC9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=YVUYuY0O; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-792bc48f6beso495975085a.2
        for <linux-media@vger.kernel.org>; Tue, 14 May 2024 13:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1715717270; x=1716322070; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vb0UKKfHIuC/I3bhXCJ6Vce1eZRAne4WwGjNCda9wdY=;
        b=YVUYuY0Oe4edXufXEsqkKFneGSSKGNzg1D0gfzxs290oynYqY2fFcjA4ZofO6M+ED5
         sDrXYOpOhFfrQh1ZvalN1/X37noIGr5k6tTMNevO57WM8tFtuCFxx2gyBYaijAB/mx9z
         FEAsFSXwBkyFq98MHQVegjXQ0fQnqdX4A3PBanD3OwmNNv9A5akxpiZtZ4piAgDG/osw
         LQFaqLHYyXs7I6l1NG1q8u38rqAF4DHsA73CLOqhJjhXned+v6v8YSubz6Fmqn2dp4OW
         pTN3H7k/lMvF3h6e3Z2v3hKe4oEGFw5b31nJRRfuiHYlgfYa29wCInf8U/xwuCdJQYd6
         i3tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715717270; x=1716322070;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vb0UKKfHIuC/I3bhXCJ6Vce1eZRAne4WwGjNCda9wdY=;
        b=XXgd3t5A/eFoo9PUm45E4Yd/b97cKuWjG1Xj+A2cdUjrWYfL9JEWpyw+vzHZqKstEd
         JI4BQuQ+PiS8EnGsHHcC6LkMJZtbol2sCkpPpmfeg5WnZkv10G8viD/TxtTGkS5bIdKw
         BLM4xrPV0hWq7H4Hi7cUUJJ4jhGZXGD8WgTXEFB99Nc9tMQ8lLa9+dzbA9C7dPEZDmct
         StzieiXAV2qtqSgcFnbe/XGp/B1pS+wEp9YnaH4Xs/B6mGRsg8de569sI3HmdIxNmjBk
         h1Bzbr8YnC+yWb77PSBPb5DD+LuCekR7BHkse3TlzkMJyu97DC9aQMPY55f4x+mYVPuq
         Go8A==
X-Forwarded-Encrypted: i=1; AJvYcCX89ufMwdhOOvL8U4g2dZTqYNjRi7wb4oWjlq+vDqn2pbw64osYw6uSxf8vKd1aQl2feboSWs6vCYiFGgLKwFgZaiXcT4YRIUfGvYM=
X-Gm-Message-State: AOJu0YygzAC7hZoUin8vj4EA1Z2iTONftLdVzfyVhscV6UHNvYfrvv+D
	4WOovshQVYvwEHKSMvPRKe4NrV/5z5adVqD+zDBLeactyLcVuctM+57na8mVE58=
X-Google-Smtp-Source: AGHT+IF3thX8SgvM4yonafhVQxSjjJkNE7UDA+c3/H6eAkRIIaHDe33Q3N9n5NZSsmCPQOku+LQk9w==
X-Received: by 2002:ae9:c103:0:b0:790:cb19:3205 with SMTP id af79cd13be357-792c75ffa6emr1539120285a.74.1715717269774;
        Tue, 14 May 2024 13:07:49 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:17:6448::7a9])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-792bf2972cdsm595605885a.54.2024.05.14.13.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 13:07:49 -0700 (PDT)
Message-ID: <95484ab70cd762ef92d32669d6b3551fd5931bd4.camel@ndufresne.ca>
Subject: Re: [PATCH 2/2] media: rkisp1: Mark subdev state pointers as const
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Dafna Hirschfeld <dafna@fastmail.com>,
 linux-rockchip@lists.infradead.org
Date: Tue, 14 May 2024 16:07:48 -0400
In-Reply-To: <20240506175255.24394-3-laurent.pinchart+renesas@ideasonboard.com>
References: 
	<20240506175255.24394-1-laurent.pinchart+renesas@ideasonboard.com>
	 <20240506175255.24394-3-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Just passed by this one ...

Le lundi 06 mai 2024 =C3=A0 20:52 +0300, Laurent Pinchart a =C3=A9crit=C2=
=A0:
> Several subdev state pointers are used to access the state read-only.
> Mark them as const.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c     | 8 ++++----
>  drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c | 8 ++++----
>  2 files changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/driver=
s/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index e45a213baf49..91301d17d356 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -173,7 +173,7 @@ static void rkisp1_gasket_disable(struct rkisp1_devic=
e *rkisp1)
>   * or at the frame end interrupt
>   */
>  static void rkisp1_config_ism(struct rkisp1_isp *isp,
> -			      struct v4l2_subdev_state *sd_state)
> +			      const struct v4l2_subdev_state *sd_state)
>  {
>  	const struct v4l2_rect *src_crop =3D
>  		v4l2_subdev_state_get_crop(sd_state,
> @@ -201,7 +201,7 @@ static void rkisp1_config_ism(struct rkisp1_isp *isp,
>   * configure ISP blocks with input format, size......
>   */
>  static int rkisp1_config_isp(struct rkisp1_isp *isp,
> -			     struct v4l2_subdev_state *sd_state,
> +			     const struct v4l2_subdev_state *sd_state,
>  			     enum v4l2_mbus_type mbus_type, u32 mbus_flags)
>  {
>  	struct rkisp1_device *rkisp1 =3D isp->rkisp1;
> @@ -309,7 +309,7 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
>  	if (src_fmt->pixel_enc =3D=3D V4L2_PIXEL_ENC_BAYER) {
>  		rkisp1_params_disable(&rkisp1->params);
>  	} else {
> -		struct v4l2_mbus_framefmt *src_frm;
> +		const struct v4l2_mbus_framefmt *src_frm;
> =20
>  		src_frm =3D v4l2_subdev_state_get_format(sd_state,
>  						       RKISP1_ISP_PAD_SOURCE_VIDEO);
> @@ -429,7 +429,7 @@ static void rkisp1_config_clk(struct rkisp1_isp *isp)
>  }
> =20
>  static int rkisp1_isp_start(struct rkisp1_isp *isp,
> -			    struct v4l2_subdev_state *sd_state,
> +			    const struct v4l2_subdev_state *sd_state,
>  			    struct media_pad *source)
>  {
>  	struct rkisp1_device *rkisp1 =3D isp->rkisp1;
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c b/dr=
ivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
> index 6f3931ca5b51..1fa991227fa9 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
> @@ -135,11 +135,11 @@ static void rkisp1_dcrop_disable(struct rkisp1_resi=
zer *rsz,
> =20
>  /* configure dual-crop unit */
>  static void rkisp1_dcrop_config(struct rkisp1_resizer *rsz,
> -				struct v4l2_subdev_state *sd_state)
> +				const struct v4l2_subdev_state *sd_state)
>  {
>  	struct rkisp1_device *rkisp1 =3D rsz->rkisp1;
> -	struct v4l2_mbus_framefmt *sink_fmt;
> -	struct v4l2_rect *sink_crop;
> +	const struct v4l2_mbus_framefmt *sink_fmt;
> +	const struct v4l2_rect *sink_crop;
>  	u32 dc_ctrl;
> =20
>  	sink_crop =3D v4l2_subdev_state_get_crop(sd_state, RKISP1_RSZ_PAD_SINK)=
;
> @@ -264,7 +264,7 @@ static void rkisp1_rsz_config_regs(struct rkisp1_resi=
zer *rsz,
>  }
> =20
>  static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
> -			      struct v4l2_subdev_state *sd_state,
> +			      const struct v4l2_subdev_state *sd_state,
>  			      enum rkisp1_shadow_regs_when when)
>  {
>  	const struct rkisp1_rsz_yuv_mbus_info *sink_yuv_info, *src_yuv_info;


