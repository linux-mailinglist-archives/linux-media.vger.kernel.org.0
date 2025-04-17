Return-Path: <linux-media+bounces-30433-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 41568A91613
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 10:03:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A42AE5A2164
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 08:03:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EB9E22DF84;
	Thu, 17 Apr 2025 08:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Ujqd1l4e"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9A4225785;
	Thu, 17 Apr 2025 08:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744877013; cv=none; b=gFVB6VXXfe78LembQXrOlMFbWgD7T+XAuRRAc2DqdDjwWjqXxtiLP3SvS2FxIejv30PoIp5Nv/SWfzZobtdRlbaJgcvJVUBQ5lxQEoc7i2TYcw0zjEKE2rd6OuX14Ubzt6z+fMudZLptCfTxQRCySeFKZWVhoMPEr3s6ZQcAnFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744877013; c=relaxed/simple;
	bh=Nxc71yiCbB7TEaX5Vo82BTatLhGZxUaMB0WX5lsJVcc=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=cb4OZ/t5MDAGQR/v/qvxfOnpu12a4s5bJ6YDpwShrsA+aEC45zBVg8DtZDjexRYccvEZo3g0cQSPI4KWaJim9lNcAiNlmGWjQ4stHz516plEb7wO3fR8IDY3QHh8A0ORSrIJQZVSqSmHXVUZDqq1uZD9d3jtRk1gcPYx79CkrO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Ujqd1l4e; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 07A626A2;
	Thu, 17 Apr 2025 10:01:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744876886;
	bh=Nxc71yiCbB7TEaX5Vo82BTatLhGZxUaMB0WX5lsJVcc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Ujqd1l4eUkZKLv5qCIlP4bv0ZTxc2cvp4IAKW7vxY841cs7+rxev8cOpeBow7aXym
	 6/CLNQIe+k8Wv5ktuPUX9NghkoPV2c0LXhx4cz6NHP4U9fPCuQ89IIbAc34jtMqFEA
	 aLm94FPmQLm2VpCW/glSumOQVO8WcUFSNsKv04NE=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250417-adv7511-ec-const-v1-1-74301e17646e@oss.qualcomm.com>
References: <20250417-adv7511-ec-const-v1-1-74301e17646e@oss.qualcomm.com>
Subject: Re: [PATCH RESEND] media: adv7511-v4l2: use constants for BT.2020 colorimetry
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>
Date: Thu, 17 Apr 2025 09:03:26 +0100
Message-ID: <174487700624.494853.2007394433912766175@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Dmitry Baryshkov (2025-04-16 23:46:01)
> Replace numeric values with constants from hdmi.h.
>=20

[x] adv7511-v4l2.c includes hdmi.h=20
[x] hdmi.h defines the same values (through an enum)

Checks out for me.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/i2c/adv7511-v4l2.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/i2c/adv7511-v4l2.c b/drivers/media/i2c/adv7511=
-v4l2.c
> index f95a99d85360aa782279a127eee37132f9ad08fb..853c7806de928da2129f603e7=
cb673440a1fcfac 100644
> --- a/drivers/media/i2c/adv7511-v4l2.c
> +++ b/drivers/media/i2c/adv7511-v4l2.c
> @@ -1370,9 +1370,9 @@ static int adv7511_set_fmt(struct v4l2_subdev *sd,
>         case V4L2_COLORSPACE_BT2020:
>                 c =3D HDMI_COLORIMETRY_EXTENDED;
>                 if (y && format->format.ycbcr_enc =3D=3D V4L2_YCBCR_ENC_B=
T2020_CONST_LUM)
> -                       ec =3D 5; /* Not yet available in hdmi.h */
> +                       ec =3D HDMI_EXTENDED_COLORIMETRY_BT2020_CONST_LUM;
>                 else
> -                       ec =3D 6; /* Not yet available in hdmi.h */
> +                       ec =3D HDMI_EXTENDED_COLORIMETRY_BT2020;
>                 break;
>         default:
>                 break;
>=20
> ---
> base-commit: 2bdde620f7f2bff2ff1cb7dc166859eaa0c78a7c
> change-id: 20250408-adv7511-ec-const-b46796340439
>=20
> Best regards,
> --=20
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>

