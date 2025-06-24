Return-Path: <linux-media+bounces-35735-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EAFAE61A0
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 11:58:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2EFF8163D5A
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 09:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BBE427D776;
	Tue, 24 Jun 2025 09:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="m2pgCdyX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4F827AC31;
	Tue, 24 Jun 2025 09:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750759070; cv=none; b=q3uEtGIdXSQBGblmeLaT2n7MaLladnbmI1eSWHVcPTIj0EnizymJd2cICBy0G1RaK6ZTITFv3rFhziidxxUGZvTDxgcmBquCC4SvQIKpqvh1j5jqur6tAtdu/ClFbkA2fUK2hwnqU2m3OuEYcV0DFzKLlm3ESCAe6hVRGfjTVbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750759070; c=relaxed/simple;
	bh=246J1mNhyuBtXFqi+2FZKzXXx4yvDDpbkBVQ4CMgHPg=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=j5hPNYGlr5AQf/q6qU9HTnFx03VjQGa9bwN1N8HdTBOAC4EvdBpFA34Zu+Cv42BrQHKKuGenlt8RARuQGSmaj973Pw4mbQeWsJfhc6KBRmGA1Rt3WH3pU5PvI7eKdkQFQS/df0WnaLTGb1Q2r2FmUPl1G/LKDBdb8ttStcWR1TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=m2pgCdyX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 26A237F0;
	Tue, 24 Jun 2025 11:57:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750759050;
	bh=246J1mNhyuBtXFqi+2FZKzXXx4yvDDpbkBVQ4CMgHPg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=m2pgCdyXz41Nyt8uYIqBNl9b+rEqUU7GS8cLfn9KohEu8l9F0eu3Ibun43HuxvsKd
	 40DqbE/Gpi+31bzrfQyhpPk+cAWo0MoNVV+hcWvTDD9gO0CEy3HSW2QAKxZVZYn0he
	 HNQwmJHbZAurW+nfATnoMruSyFxa+2yTWeZHT57s=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250624065438.2021044-1-shravan.chippa@microchip.com>
References: <20250624065438.2021044-1-shravan.chippa@microchip.com>
Subject: Re: [PATCH] media: i2c: imx334: add support for additional test patterns
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, valentina.fernandezalanis@microchip.com, praveen.kumar@microchip.com, shravan.chippa@microchip.com
To: mchehab@kernel.org, sakari.ailus@linux.intel.com, shravan kumar <shravan.chippa@microchip.com>
Date: Tue, 24 Jun 2025 10:57:44 +0100
Message-ID: <175075906452.3871677.12511426007175753529@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Hi Shravan

Quoting shravan kumar (2025-06-24 07:54:38)
> From: Shravan Chippa <shravan.chippa@microchip.com>
>=20
> Added support for three additional test patterns in the
> IMX334 driver: Black and Grey Bars, Black Color, and White Color.
>=20
> Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
> ---
>  drivers/media/i2c/imx334.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
> index 846b9928d4e8..43dd7edb48c8 100644
> --- a/drivers/media/i2c/imx334.c
> +++ b/drivers/media/i2c/imx334.c
> @@ -118,6 +118,9 @@
>  #define IMX334_REG_TP                  CCI_REG8(0x329e)
>  #define IMX334_TP_COLOR_HBARS          0xa
>  #define IMX334_TP_COLOR_VBARS          0xb
> +#define IMX334_TP_BLACK                        0x0
> +#define IMX334_TP_WHITE                        0x1
> +#define IMX334_TP_BLACK_GREY           0xC

This should be lower case to match the other hex constants (0xc)

I also wonder if this list should be in register address order ... but
then it won't match the menu items ...

> =20
>  #define IMX334_TPG_EN_DOUT             CCI_REG8(0x329c)
>  #define IMX334_TP_ENABLE               0x1
> @@ -398,12 +401,18 @@ static const char * const imx334_test_pattern_menu[=
] =3D {
>         "Disabled",
>         "Vertical Color Bars",
>         "Horizontal Color Bars",
> +       "Black and Grey Bars",
> +       "Black Color",
> +       "White Color",
>  };
> =20
>  static const int imx334_test_pattern_val[] =3D {
>         IMX334_TP_DISABLE,
>         IMX334_TP_COLOR_HBARS,
>         IMX334_TP_COLOR_VBARS,
> +       IMX334_TP_BLACK_GREY,
> +       IMX334_TP_BLACK,
> +       IMX334_TP_WHITE,
>  };
> =20
>  static const struct cci_reg_sequence raw10_framefmt_regs[] =3D {
> --=20
> 2.34.1
>

