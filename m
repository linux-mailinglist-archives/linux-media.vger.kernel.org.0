Return-Path: <linux-media+bounces-39795-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53300B246FC
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 12:18:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4580F7B1FA6
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 10:17:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 942EE2D1F7E;
	Wed, 13 Aug 2025 10:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bIpT6YGJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F55D23D7D3;
	Wed, 13 Aug 2025 10:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755080302; cv=none; b=RTELDtNkAz2RtrtGfw/AmBV3jjhoRDVkrY43A9H0hMbUTZyz125WSMQBc8MA8kw0j4bKfyBuRAuiJ+Xjbiz0LS3gpvZ1rQqSz2V7/PoA570OBIUBMF/6efpvTab5J9Hsn7yT91YcgV4SM4l4ZRah3NoqkLTsPqaNYEwh2f7ZbBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755080302; c=relaxed/simple;
	bh=IwFhHUafpP4zZE/ofefxf99dwR5vkpPWQjUI+AKcMHI=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=BUS7f4tg3Lrx2fPpWKmBFB28/x2iSAoUpGOw2RbbzGiLBjSQGLaSbWXt0z0WPmwwu83d7W2+8/PeX8DP40KHUrsC3MMiROxb2DC2ogAWz6hWQRMU9Pk3kauTm1Io8+lD8fYw+VAGdGFJwse/a8J13AqOA8mrx76Uy1EN8jyuq70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bIpT6YGJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D42452EC;
	Wed, 13 Aug 2025 12:17:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755080245;
	bh=IwFhHUafpP4zZE/ofefxf99dwR5vkpPWQjUI+AKcMHI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=bIpT6YGJ08SUPeWFtmWrcEeZMomlm1hbRsVna/NhAc7Hsv9N8b09NJWkXpnSX/NrT
	 ZrFcaZkbjumK4WT/OKbDZI8gQFF2LJwJCiURiIy2vcIgaup1RjaHST7Wq7fRAIFe6G
	 /XvxAm1hEb2Bscn8bksgLWz2bkV4AlzDx1wHLHnI=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250813094746.557013-1-liaoyuanhong@vivo.com>
References: <20250813094746.557013-1-liaoyuanhong@vivo.com>
Subject: Re: [PATCH] media: imx296: Remove redundant semicolons
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Liao Yuanhong <liaoyuanhong@vivo.com>, Manivannan Sadhasivam <mani@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Date: Wed, 13 Aug 2025 11:18:16 +0100
Message-ID: <175508029630.560048.7835285687538106544@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Liao Yuanhong (2025-08-13 10:47:46)
> Remove unnecessary semicolons.

Well ... there's only one so it's not plural ;-) but indeed this is very
redundant!


Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

>=20
> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
> ---
>  drivers/media/i2c/imx296.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/i2c/imx296.c b/drivers/media/i2c/imx296.c
> index f3bec16b527c..cbbe0e7a37a9 100644
> --- a/drivers/media/i2c/imx296.c
> +++ b/drivers/media/i2c/imx296.c
> @@ -922,7 +922,7 @@ static int imx296_read_temperature(struct imx296 *sen=
sor, int *temp)
> =20
>         tmdout &=3D IMX296_TMDOUT_MASK;
> =20
> -       /* T(=EF=BF=BD=EF=BF=BDC) =3D 246.312 - 0.304 * TMDOUT */;
> +       /* T(=EF=BF=BD=EF=BF=BDC) =3D 246.312 - 0.304 * TMDOUT */
>         *temp =3D 246312 - 304 * tmdout;
> =20
>         return imx296_write(sensor, IMX296_TMDCTRL, 0, NULL);
> --=20
> 2.34.1
>

