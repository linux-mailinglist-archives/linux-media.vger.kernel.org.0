Return-Path: <linux-media+bounces-1091-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CD47F9EC2
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 12:39:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F143E2812B9
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 11:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82EF51A706;
	Mon, 27 Nov 2023 11:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EDF813A
	for <linux-media@vger.kernel.org>; Mon, 27 Nov 2023 03:38:57 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1r7Zwb-0002vG-1v; Mon, 27 Nov 2023 12:38:29 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1r7ZwY-00Bvkh-VA; Mon, 27 Nov 2023 12:38:26 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1r7ZwT-000AAH-2o;
	Mon, 27 Nov 2023 12:38:21 +0100
Message-ID: <ba856a09de62a6ddbf1c19d5fd502de1cbc3e273.camel@pengutronix.de>
Subject: Re: [PATCH v8 3/5] media: stm32-dcmipp: STM32 DCMIPP camera
 interface driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Alain Volmat <alain.volmat@foss.st.com>, Hugues Fruchet
 <hugues.fruchet@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,  Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Russell King <linux@armlinux.org.uk>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Dan Scally
 <dan.scally@ideasonboard.com>,  linux-media@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Date: Mon, 27 Nov 2023 12:38:21 +0100
In-Reply-To: <20231122073927.788810-4-alain.volmat@foss.st.com>
References: <20231122073927.788810-1-alain.volmat@foss.st.com>
	 <20231122073927.788810-4-alain.volmat@foss.st.com>
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

On Mi, 2023-11-22 at 08:39 +0100, Alain Volmat wrote:
> From: Hugues Fruchet <hugues.fruchet@foss.st.com>
>=20
> This V4L2 subdev driver enables Digital Camera Memory Interface
> Pixel Processor(DCMIPP) of STMicroelectronics STM32 SoC series.
>=20
> Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
[...]
> diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b=
/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> new file mode 100644
> index 000000000000..28ddb26314c3
> --- /dev/null
> +++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> @@ -0,0 +1,604 @@
[...]
> +struct dcmipp_device {
> +	/* The platform device */
> +	struct platform_device		pdev;
> +	struct device			*dev;
> +
> +	/* Hardware resources */
> +	struct reset_control		*rstc;

As long as rstc is only used in dcmipp_probe(), there is no need to
carry it around in struct dcmipp_device.

[...]
> +static int dcmipp_probe(struct platform_device *pdev)
> +{
> +	struct dcmipp_device *dcmipp;
> +	struct clk *kclk;

rstc could be a local variable here.

[...]

> +	/* Get hardware resources from devicetree */
> +	dcmipp->rstc =3D devm_reset_control_get_exclusive(&pdev->dev, NULL);
> +	if (IS_ERR(dcmipp->rstc))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(dcmipp->rstc),
> +				     "Could not get reset control\n");
[...]
> +	/* Reset device */
> +	ret =3D reset_control_assert(dcmipp->rstc);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to assert the reset line\n");
> +		return ret;
> +	}
> +
> +	usleep_range(3000, 5000);
> +
> +	ret =3D reset_control_deassert(dcmipp->rstc);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to deassert the reset line\n");
> +		return ret;
> +	}

regards
Philipp

