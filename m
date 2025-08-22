Return-Path: <linux-media+bounces-40719-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 914D7B3101A
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 09:18:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D46EAA28C77
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 07:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB6092E764E;
	Fri, 22 Aug 2025 07:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="Hfgjd+BY";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="bflPl7O1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B782E1EFB;
	Fri, 22 Aug 2025 07:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755847112; cv=none; b=tfkfDp9614pb+xug8syAmiwUgMTWg3LPK7l9E6J8c6i0pZd191gKL66qYdGIKpb/D7WxYSucixD97ryIDw4Kj11I3HoHoqg7xlXGFbTnz5Udk81R+wrYXAsgpY+D9Z4Ae5Hhq+u5PUsL4rs+GAi3RnRBck8wq/Y7LznlUKKW3Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755847112; c=relaxed/simple;
	bh=JOIcA35LYZ+cFAmjq/RJg21EiGT23nqMt5mZXJ7p/YQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AItjUw2jfck4V77ZSIrPeUDo5ew8oyhLEioPZrYOdIxsZDe0m2MXVpRjztAeToPM4zlut+YCpxT7cwSrU5o+vCIVxBhuerpqTK++TJx09B0dtnG/IA9Hdzy/pS/CfIegMEEgtMc5OSh3phfUiaPmeq3TUVBnfPJr5L+3bF9sGMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=Hfgjd+BY; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=bflPl7O1 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1755847108; x=1787383108;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PFtRRdSk6EXHxiRkGSoXab9HwZbgtylqXqkki/BPNC0=;
  b=Hfgjd+BYSVgNxX5v6b006PUwFAfmaAQSX/IlLZTQ0HUlAR7Ababq114r
   3sS1DxO0d/ijcBZzOxisBZYhoFb5Cjv0jJyejuaUSM8rwDX9BoCPSuaNw
   OY3sQamNnYsjuS54yzFAGR+asmDx8RlYWAufwpFrCHjnVcm/6sO9iVopE
   KP/K4eLc6nBW/7P//BvYL3oCmtNUSPBZkTWb74XbTMBUOqA+1wAURTF7c
   uHYKfDhGbs1D8meYZn5PrAbDu8sJmfxVh2b3COhaZFwyB4J05WJ8Ihy/3
   EQxGI3dvffqB3nX50lH6Yx0KeFq0kXMNfanDWErrytgMcb9yqrNI/qv53
   w==;
X-CSE-ConnectionGUID: jdtU2+6TTs+ljT2Y7Oo4iA==
X-CSE-MsgGUID: 66aOcjvFQSqa2upgXwJG5Q==
X-IronPort-AV: E=Sophos;i="6.17,309,1747692000"; 
   d="scan'208";a="45860505"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 22 Aug 2025 09:18:19 +0200
X-CheckPoint: {68A819BB-10-AD8F5F64-F0EACAA5}
X-MAIL-CPID: F8CEB0701F16A335037C7670FF115625_1
X-Control-Analysis: str=0001.0A002118.68A81968.004B,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 63873164EDC;
	Fri, 22 Aug 2025 09:18:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1755847094;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PFtRRdSk6EXHxiRkGSoXab9HwZbgtylqXqkki/BPNC0=;
	b=bflPl7O1lmdOWGFy1KCkTbLUjNvN3q0QihZmaWQnsB1oondb/nt7RRFoshqeyI7X5qPzfw
	qnylA7HzM40ttwRwy/UEbh0LvxaHdCeBSyuxGn8KRjVEFgvJXKpApQIxSq36DjoHUKxGkj
	T+X+sxy6yIFMa6JseA8+DW7D7yyYI7+f9Z1gvfddrLZJWDQQOmmoEydhPNwADgx4b88o9y
	GPYvtFvddBqC+iclHNmp7jCT5/CqAozX7aTg1nvis0Sc7op8raV104hMSr/8BByrk2mUxP
	rD267CXeLNhameyaAcnaguDd2CHsofZY5AT1skCb/dlP38XqaIaAf3NLLnnrCA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: linux-media@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Isaac Scott <isaac.scott@ideasonboard.com>,
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>,
 Purism Kernel Team <kernel@puri.sm>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject:
 Re: [PATCH v2 04/12] media: imx-mipi-csis: Shorten name of subdev state
 variables
Date: Fri, 22 Aug 2025 09:18:10 +0200
Message-ID: <5040209.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250821000944.27849-5-laurent.pinchart@ideasonboard.com>
References:
 <20250821000944.27849-1-laurent.pinchart@ideasonboard.com>
 <20250821000944.27849-5-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi Laurent,

thanks for the patch.

Am Donnerstag, 21. August 2025, 02:09:36 CEST schrieb Laurent Pinchart:
> Rename subdev state parameters passed to subdev operations from sd_state
> to state. This standardizes the naming of the subdev state variables
> through the driver, and helps shortening lines.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Maybe add a 'No functionality change', it's just rename. Either way:
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/p=
latform/nxp/imx-mipi-csis.c
> index 0f0863011230..894d12fef519 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -996,7 +996,7 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd,=
 int enable)
>  }
> =20
>  static int mipi_csis_enum_mbus_code(struct v4l2_subdev *sd,
> -				    struct v4l2_subdev_state *sd_state,
> +				    struct v4l2_subdev_state *state,
>  				    struct v4l2_subdev_mbus_code_enum *code)
>  {
>  	/*
> @@ -1009,7 +1009,7 @@ static int mipi_csis_enum_mbus_code(struct v4l2_sub=
dev *sd,
>  		if (code->index > 0)
>  			return -EINVAL;
> =20
> -		fmt =3D v4l2_subdev_state_get_format(sd_state, code->pad);
> +		fmt =3D v4l2_subdev_state_get_format(state, code->pad);
>  		code->code =3D fmt->code;
>  		return 0;
>  	}
> @@ -1026,7 +1026,7 @@ static int mipi_csis_enum_mbus_code(struct v4l2_sub=
dev *sd,
>  }
> =20
>  static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
> -			     struct v4l2_subdev_state *sd_state,
> +			     struct v4l2_subdev_state *state,
>  			     struct v4l2_subdev_format *sdformat)
>  {
>  	const struct csis_pix_format *csis_fmt;
> @@ -1038,7 +1038,7 @@ static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
>  	 * modified.
>  	 */
>  	if (sdformat->pad =3D=3D CSIS_PAD_SOURCE)
> -		return v4l2_subdev_get_fmt(sd, sd_state, sdformat);
> +		return v4l2_subdev_get_fmt(sd, state, sdformat);
> =20
>  	if (sdformat->pad !=3D CSIS_PAD_SINK)
>  		return -EINVAL;
> @@ -1076,7 +1076,7 @@ static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
>  			      &sdformat->format.height, 1,
>  			      CSIS_MAX_PIX_HEIGHT, 0, 0);
> =20
> -	fmt =3D v4l2_subdev_state_get_format(sd_state, sdformat->pad);
> +	fmt =3D v4l2_subdev_state_get_format(state, sdformat->pad);
> =20
>  	fmt->code =3D csis_fmt->code;
>  	fmt->width =3D sdformat->format.width;
> @@ -1090,7 +1090,7 @@ static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
>  	sdformat->format =3D *fmt;
> =20
>  	/* Propagate the format from sink to source. */
> -	fmt =3D v4l2_subdev_state_get_format(sd_state, CSIS_PAD_SOURCE);
> +	fmt =3D v4l2_subdev_state_get_format(state, CSIS_PAD_SOURCE);
>  	*fmt =3D sdformat->format;
> =20
>  	/* The format on the source pad might change due to unpacking. */
> @@ -1130,7 +1130,7 @@ static int mipi_csis_get_frame_desc(struct v4l2_sub=
dev *sd, unsigned int pad,
>  }
> =20
>  static int mipi_csis_init_state(struct v4l2_subdev *sd,
> -				struct v4l2_subdev_state *sd_state)
> +				struct v4l2_subdev_state *state)
>  {
>  	struct v4l2_subdev_format fmt =3D {
>  		.pad =3D CSIS_PAD_SINK,
> @@ -1147,7 +1147,7 @@ static int mipi_csis_init_state(struct v4l2_subdev =
*sd,
>  		V4L2_MAP_QUANTIZATION_DEFAULT(false, fmt.format.colorspace,
>  					      fmt.format.ycbcr_enc);
> =20
> -	return mipi_csis_set_fmt(sd, sd_state, &fmt);
> +	return mipi_csis_set_fmt(sd, state, &fmt);
>  }
> =20
>  static int mipi_csis_log_status(struct v4l2_subdev *sd)
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



