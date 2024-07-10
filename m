Return-Path: <linux-media+bounces-14828-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E114D92CE7C
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 11:45:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C9BA1F22D57
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 09:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCB9018FC91;
	Wed, 10 Jul 2024 09:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vPsAUgXI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D572D18FA21;
	Wed, 10 Jul 2024 09:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720604713; cv=none; b=nr6E0IpdV5YGOmxKzgnoOkpLiWngoT+AuNQMMxCsEDSoS/29eGvg1Kv4Y+sX7G1OuB64TI310I/t3h8ayQOs2GUBMJw1/QJrwzXGReEiJ3ouL0QJqmMEC0LiXjkanRxuhqE4vawPyEurpVgNEnzl/cEwGnzdzle8If3MWoX1+E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720604713; c=relaxed/simple;
	bh=SU0OXTXcgrgcb40M8RdzQZc4cjpRrbRxB9mGDlIVMHU=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=WiLGJoij+7JlZjXewJnX/mq9z+M290cVgYIeXyGO/THYMSqKw96vTM5mHOtfH7ECT2UM5AnXLDZqLPs3aIR3woyqVxbEslI8dClYa4ayMbEauePV/bmMdNZiO5TIFTF0TlS3Yj8nAKpZEcOuM1/zjsrwh0YEUWM4Sg5qs318Dyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vPsAUgXI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BEE0D8D0;
	Wed, 10 Jul 2024 11:44:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1720604677;
	bh=SU0OXTXcgrgcb40M8RdzQZc4cjpRrbRxB9mGDlIVMHU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=vPsAUgXIjK15Ej9TYCT1/9XCyUDxNF8C/k0C27hVU7Mk5hwNvPEwFJkpme7wPms2l
	 MS9k5X5HaULrrgWxlEI9M+pH65NhI4+mYiOEpNjUVbeBkN9jcme7w1PKUjEn+Mu167
	 S7Q7EkA1BaBvm+xzp5ivX6cYlnMnkvTZSWypH/Ic=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240710044633.81372-2-umang.jain@ideasonboard.com>
References: <20240710044633.81372-1-umang.jain@ideasonboard.com> <20240710044633.81372-2-umang.jain@ideasonboard.com>
Subject: Re: [PATCH 1/2] media: imx335: Rectify name of mode struct
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Alexander Shiyan <eagle.alexander923@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, open list <linux-kernel@vger.kernel.org>, Umang Jain <umang.jain@ideasonboard.com>
To: Umang Jain <umang.jain@ideasonboard.com>, linux-media@vger.kernel.org
Date: Wed, 10 Jul 2024 10:45:07 +0100
Message-ID: <172060470724.392292.7908105003803538787@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Umang Jain (2024-07-10 05:46:31)
> In commit 81495a59baeb ("media: imx335: Fix active area height discrepenc=
y")
> the height for the mode struct was rectified to '1944'. However, the
> name of mode struct is still reflecting to '1940'. Update it.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

>=20
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>  drivers/media/i2c/imx335.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
> index 990d74214cc2..6c1e61b6696b 100644
> --- a/drivers/media/i2c/imx335.c
> +++ b/drivers/media/i2c/imx335.c
> @@ -252,7 +252,7 @@ static const int imx335_tpg_val[] =3D {
>  };
> =20
>  /* Sensor mode registers */
> -static const struct cci_reg_sequence mode_2592x1940_regs[] =3D {
> +static const struct cci_reg_sequence mode_2592x1944_regs[] =3D {
>         { IMX335_REG_MODE_SELECT, IMX335_MODE_STANDBY },
>         { IMX335_REG_MASTER_MODE, 0x00 },
>         { IMX335_REG_WINMODE, 0x04 },
> @@ -416,8 +416,8 @@ static const struct imx335_mode supported_mode =3D {
>         .vblank_max =3D 133060,
>         .pclk =3D 396000000,
>         .reg_list =3D {
> -               .num_of_regs =3D ARRAY_SIZE(mode_2592x1940_regs),
> -               .regs =3D mode_2592x1940_regs,
> +               .num_of_regs =3D ARRAY_SIZE(mode_2592x1944_regs),
> +               .regs =3D mode_2592x1944_regs,
>         },
>  };
> =20
> --=20
> 2.45.0
>

