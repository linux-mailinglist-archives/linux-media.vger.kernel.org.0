Return-Path: <linux-media+bounces-49697-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BD0CE9731
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 11:45:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9077F3025315
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 10:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC3572C2349;
	Tue, 30 Dec 2025 10:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NR7XmZpq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CBD1E633C;
	Tue, 30 Dec 2025 10:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767091495; cv=none; b=FMUshM5RcPSJpRWW3bPKkuFIEEIgC99EhQT9Ft6bvAb1CjH0D7elXZdbUUICY0r3mi+2MI9uk8wpr3pa+pONXBRORp2qWaJ8fOkwaw2qEjDzgPKafWNj+W2aRFHCp+1yVrnoa8ZdZm+w9ipN57RB8XEddXIaZu4fsveevhtqkyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767091495; c=relaxed/simple;
	bh=rhWe+Ey92W2kKbYTZrcEMAeI4LummbguS9JllshcH/E=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=cpY78mN/pAQAWETJA67OMic9+rOW7nCYYT3yKxM4/HVIgFO7sKcHIs1HYGcFIAOnUqs4SX7pKJ0lv0cghrgHLrJ4cYM2/Q4EgC9c9FWH3RiALCr8cEfCv1fVGUV6Intu+s8D5iTb/PzPBSH1YPDbRIBj+5HOdxHuLkhMKOGNHY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NR7XmZpq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BCAF16A8;
	Tue, 30 Dec 2025 11:44:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1767091475;
	bh=rhWe+Ey92W2kKbYTZrcEMAeI4LummbguS9JllshcH/E=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=NR7XmZpqluqhN4q4Y0bGd1/u+/wPAd85o7AaADyiYfknvot7090rFII/BvlR05nZH
	 43/eWgr8Bu09nzjq4W53FNRA1o8Jz+nWWRNS1bXQZpzLEp0jtcA8krT1AvDmeopzGI
	 6uDR14LkoikS1tYQYDsJZgajlHiwBmLL/2bZqD7o=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251217-imx283-ext-v1-2-906a762f592d@emfend.at>
References: <20251217-imx283-ext-v1-0-906a762f592d@emfend.at> <20251217-imx283-ext-v1-2-906a762f592d@emfend.at>
Subject: Re: [PATCH 2/3] media: i2c: imx283: add support for non-continuous MIPI clock mode
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Matthias Fend <matthias.fend@emfend.at>
To: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias Fend <matthias.fend@emfend.at>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Umang Jain <uajain@igalia.com>
Date: Tue, 30 Dec 2025 10:44:48 +0000
Message-ID: <176709148864.3401191.3323585790771042734@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Matthias Fend (2025-12-17 07:06:01)
> Add support for selecting between continuous and non-continuous MIPI clock
> mode.
>=20
> Previously, the CSI-2 non-continuous clock endpoint flag was ignored and
> the sensor was always configured for non-continuous clock mode. For
> existing device tree nodes that do not have this property enabled, this
> update will therefore change the actual clock mode.

So this means that not specifying non-continous will now enforce
continuous mode on existing devices ?

Are there any implications to that? I know there are quite a few users
of the sensor on Raspberry Pi for instance.

I think it should be fine though.

> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
> ---
>  drivers/media/i2c/imx283.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
> index 8ab63ad8f385f6e2a2d7432feff0af09a5356dc4..7a6ab2941ea985401b21d6016=
3b58e980cf31ddc 100644
> --- a/drivers/media/i2c/imx283.c
> +++ b/drivers/media/i2c/imx283.c
> @@ -149,6 +149,9 @@
>  #define IMX283_REG_PLSTMG02            CCI_REG8(0x36aa)
>  #define   IMX283_PLSTMG02_VAL          0x00
> =20
> +#define IMX283_REG_MIPI_CLK            CCI_REG8(0x3a43)
> +#define   IMX283_MIPI_CLK_NONCONTINUOUS        BIT(0)

I can't find this in my datasheet, so no specific comment on the
register I'm afraid. Did you get this from the vendor or is it an
assumption from other sony drivers?

I assume you can measurably detect that this register impacts the clock
on a CSI scope or such perhaps from the receiver?

So even with all that I think this appears to be correct. I'll test it
more when I can but otherwise:


Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> +
>  #define IMX283_REG_EBD_X_OUT_SIZE      CCI_REG16_LE(0x3a54)
> =20
>  /* Test pattern generator */
> @@ -565,6 +568,7 @@ struct imx283 {
>         struct v4l2_ctrl *hblank;
>         struct v4l2_ctrl *vflip;
> =20
> +       bool mipi_clk_noncontinuous;
>         unsigned long link_freq_bitmap;
> =20
>         u16 hmax;
> @@ -988,6 +992,7 @@ static int imx283_set_pad_format(struct v4l2_subdev *=
sd,
>  static int imx283_standby_cancel(struct imx283 *imx283)
>  {
>         unsigned int link_freq_idx;
> +       u8 mipi_clk;
>         int ret =3D 0;
> =20
>         cci_write(imx283->cci, IMX283_REG_STANDBY,
> @@ -1007,6 +1012,10 @@ static int imx283_standby_cancel(struct imx283 *im=
x283)
>         /* Enable PLL */
>         cci_write(imx283->cci, IMX283_REG_STBPL, IMX283_STBPL_NORMAL, &re=
t);
> =20
> +       /* Configure MIPI clock mode */
> +       mipi_clk =3D imx283->mipi_clk_noncontinuous ? IMX283_MIPI_CLK_NON=
CONTINUOUS : 0;
> +       cci_write(imx283->cci, IMX283_REG_MIPI_CLK, mipi_clk, &ret);
> +
>         /* Configure the MIPI link speed */
>         link_freq_idx =3D __ffs(imx283->link_freq_bitmap);
>         cci_multi_reg_write(imx283->cci, link_freq_reglist[link_freq_idx]=
.regs,
> @@ -1426,6 +1435,9 @@ static int imx283_parse_endpoint(struct imx283 *imx=
283)
>                 goto done_endpoint_free;
>         }
> =20
> +       imx283->mipi_clk_noncontinuous =3D
> +               bus_cfg.bus.mipi_csi2.flags & V4L2_MBUS_CSI2_NONCONTINUOU=
S_CLOCK;
> +
>         ret =3D v4l2_link_freq_to_bitmap(imx283->dev, bus_cfg.link_freque=
ncies,
>                                        bus_cfg.nr_of_link_frequencies,
>                                        link_frequencies, ARRAY_SIZE(link_=
frequencies),
>=20
> --=20
> 2.34.1
>

