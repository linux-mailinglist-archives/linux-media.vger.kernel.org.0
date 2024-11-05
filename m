Return-Path: <linux-media+bounces-20906-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5948D9BCA19
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 11:15:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 112FC1F22239
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 10:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E90B41D27A6;
	Tue,  5 Nov 2024 10:15:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D061CEE98
	for <linux-media@vger.kernel.org>; Tue,  5 Nov 2024 10:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730801718; cv=none; b=YeVLpJZPO6UCZDwnFm7d2JPVak96qQ9txlC/ySE8Tn60GGXq+hsvkI1TUuRY3I7Sx7atcwUET3p51HLMAovIqPEM0zZ1T91UuzYgKDM5qSvaAhIoxDPqYrDTY9CRtBoC9n3Jh2c/QVNkkUHna40iVQ4LwUu77LL+d1khVZyQrsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730801718; c=relaxed/simple;
	bh=qaOyvLUdtRoZx5aWGtD3YPw+iGoEYAbw93GqV/vZSAk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZcKczTiqwnPanPtz+yAcGlZ7qtx3sz5BlExLy98H9FvHPeN99fV7Jp5+V+kJmS+Bu8v4ki8JqEIjwBVfPDJGATFicBvwhmpOuARgPwQ6qNdPCEIWMI+lbBYU0OplPFCP0Vp3hD4OHvt5maciy84gAVfhhxTX8NF5hdeyrTOrxCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1t8GaH-00021Q-OL; Tue, 05 Nov 2024 11:14:49 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1t8GaG-0027zm-0C;
	Tue, 05 Nov 2024 11:14:48 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1t8GaF-0005OF-39;
	Tue, 05 Nov 2024 11:14:47 +0100
Message-ID: <8841158ed61b2b92a92ac6d2afcbd7cff12a6680.camel@pengutronix.de>
Subject: Re: [PATCH v2 03/15] media: stm32: csi: addition of the STM32 CSI
 driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Alain Volmat <alain.volmat@foss.st.com>, Hugues Fruchet
 <hugues.fruchet@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Date: Tue, 05 Nov 2024 11:14:47 +0100
In-Reply-To: <20241105-csi_dcmipp_mp25-v2-3-b9fc8a7273c2@foss.st.com>
References: <20241105-csi_dcmipp_mp25-v2-0-b9fc8a7273c2@foss.st.com>
	 <20241105-csi_dcmipp_mp25-v2-3-b9fc8a7273c2@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

On Di, 2024-11-05 at 08:49 +0100, Alain Volmat wrote:
> The STM32 CSI controller is tightly coupled with the DCMIPP and act as an
> input stage to receive data coming from the sensor and transferring
> them into the DCMIPP.
>=20
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
>=20
> ---
> v2: correct data-lanes handling, using values 1 & 2
>     update yaml filename in MAINTAINERS
> ---
>  MAINTAINERS                                 |    8 +
>  drivers/media/platform/st/stm32/Kconfig     |   14 +
>  drivers/media/platform/st/stm32/Makefile    |    1 +
>  drivers/media/platform/st/stm32/stm32-csi.c | 1144 +++++++++++++++++++++=
++++++
>  4 files changed, 1167 insertions(+)
>=20
[...]
> diff --git a/drivers/media/platform/st/stm32/stm32-csi.c b/drivers/media/=
platform/st/stm32/stm32-csi.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..c7f47472c6b3699e94113ce0f=
38b280a2e45ce15
> --- /dev/null
> +++ b/drivers/media/platform/st/stm32/stm32-csi.c
> @@ -0,0 +1,1144 @@
[...]
> +static int stm32_csi_get_resources(struct stm32_csi_dev *csidev,
> +				   struct platform_device *pdev)
> +{
> +	int irq, ret;
> +
> +	csidev->base =3D devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
> +	if (IS_ERR(csidev->base))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(csidev->base),
> +				     "Failed to ioremap resource\n");
> +
> +	csidev->pclk =3D devm_clk_get(&pdev->dev, "pclk");
> +	if (IS_ERR(csidev->pclk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(csidev->pclk),
> +				     "Couldn't get pclk\n");
> +
> +	csidev->txesc =3D devm_clk_get(&pdev->dev, "txesc");
> +	if (IS_ERR(csidev->txesc))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(csidev->txesc),
> +				     "Couldn't get txesc\n");
> +
> +	csidev->csi2phy =3D devm_clk_get(&pdev->dev, "csi2phy");
> +	if (IS_ERR(csidev->csi2phy))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(csidev->csi2phy),
> +				     "Couldn't get csi2phy\n");

Consider using devm_clk_bulk_get().

> +	csidev->rstc =3D devm_reset_control_get_exclusive(&pdev->dev, NULL);
> +	if (IS_ERR(csidev->rstc))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(csidev->rstc),
> +				     "Couldn't get reset control\n");

If this wasn't in a separate function, rstc wouldn't have to be stored
on csidev as it's only ever used in stm32_csi_probe().

> +
> +	csidev->supplies[0].supply =3D "vdd";
> +	csidev->supplies[1].supply =3D "vdda18";
> +	ret =3D devm_regulator_bulk_get(&pdev->dev, ARRAY_SIZE(csidev->supplies=
),
> +				      csidev->supplies);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "Failed to request regulator vdd\n");
> +
> +	irq =3D platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +
> +	ret =3D devm_request_threaded_irq(&pdev->dev, irq, NULL,
> +					stm32_csi_irq_thread, IRQF_ONESHOT,
> +					dev_name(&pdev->dev), csidev);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "Unable to request irq");
> +
> +	return 0;
> +}

regards
Philipp

