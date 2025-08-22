Return-Path: <linux-media+bounces-40763-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC48B31A4E
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 15:55:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1C11AE41ED
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 13:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB551303CB3;
	Fri, 22 Aug 2025 13:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OvB+D9nr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84483043CE;
	Fri, 22 Aug 2025 13:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755870636; cv=none; b=oDKSAZ3YbOMFFu0/tc3u3+rzXSGHXl+r/zRh+1mM6Z0++U25GSXblTbChdGK0lxtDvxPb78LeWQsbKyCBPiiTN3nhWljUecs2l+pKlm8uQjstwWBL0+G7Uj79339DW2v4tbm/f1o7IPdUUnJhtY5FlII1aMcpRLbohoJVDcEd10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755870636; c=relaxed/simple;
	bh=zTC9rggl0i3t5XLpEsqcM+WQni9LhEviNLZmk+YbRV4=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=CmL4m/b/EZ0OeGh0h68lI8jkuXLUh92kbnTzT8T6j7TK48fkjk1ozD4D5fUCEN+S31zrMDhX9blxPw4wkeG8nPEampue9G9EuFZSQjUUvxDe5N/Wxn2YapxXDHhwwEhmIYdMZYtD+RsiTm2k0D11RO7bnUJcUR9B+MTPYOgIObU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OvB+D9nr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:7c3d:a283:5570:ad9a])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 269E411D5;
	Fri, 22 Aug 2025 15:49:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755870566;
	bh=zTC9rggl0i3t5XLpEsqcM+WQni9LhEviNLZmk+YbRV4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=OvB+D9nrGBSqzWfJeElOujCqVeuxE5UDvoDaJBLWCYyWtEIkC/xkY0aGB2C80d15Z
	 RpFE/FOCNVTRYSM8bXsYqmEq/X4WAWPaL5JKpeJc8/JizCspnqhaUaJ6RdMg2i0SsP
	 U6USyZTmJ/9KgJwp+OhpgrWi+MbX4OUCaLjX43P4=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250821000944.27849-13-laurent.pinchart@ideasonboard.com>
References: <20250821000944.27849-1-laurent.pinchart@ideasonboard.com> <20250821000944.27849-13-laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 12/12] arm64: dts: imx8mp: Specify the number of channels for CSI-2 receivers
From: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: Isaac Scott <isaac.scott@ideasonboard.com>, Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org
Date: Fri, 22 Aug 2025 15:50:22 +0200
Message-ID: <175587062299.3267892.13323129258755005337@localhost>
User-Agent: alot/0.12.dev8+g2c003385c862.d20250602

Hi Laurent,

Thank you for the patch.=20

Quoting Laurent Pinchart (2025-08-21 02:09:44)
> The CSI-2 receivers in the i.MX8MP have 3 output channels. Specify this
> in the device tree, to enable support for more than one channel in
> drivers.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Stefan Klug <stefan.klug@ideasonboard.com>
Tested-by: Stefan Klug <stefan.klug@ideasonboard.com>

Cheers,
Stefan

> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mp.dtsi
> index bb24dba7338e..1e52840078df 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -1764,6 +1764,7 @@ mipi_csi_0: csi@32e40000 {
>                                 assigned-clock-parents =3D <&clk IMX8MP_S=
YS_PLL2_250M>,
>                                                          <&clk IMX8MP_CLK=
_24M>;
>                                 power-domains =3D <&media_blk_ctrl IMX8MP=
_MEDIABLK_PD_MIPI_CSI2_1>;
> +                               fsl,num-channels =3D <3>;
>                                 status =3D "disabled";
> =20
>                                 ports {
> @@ -1799,6 +1800,7 @@ mipi_csi_1: csi@32e50000 {
>                                 assigned-clock-parents =3D <&clk IMX8MP_S=
YS_PLL2_250M>,
>                                                          <&clk IMX8MP_CLK=
_24M>;
>                                 power-domains =3D <&media_blk_ctrl IMX8MP=
_MEDIABLK_PD_MIPI_CSI2_2>;
> +                               fsl,num-channels =3D <3>;
>                                 status =3D "disabled";
> =20
>                                 ports {
> --=20
> Regards,
>=20
> Laurent Pinchart
>=20
>

