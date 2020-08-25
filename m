Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67A73251AF4
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 16:37:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbgHYOh1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Aug 2020 10:37:27 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:37199 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726180AbgHYOhK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Aug 2020 10:37:10 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 7C58E5805FE;
        Tue, 25 Aug 2020 10:37:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 25 Aug 2020 10:37:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=H
        tVzFrXziOlq76uUCaIpFOvTH7H2DzX74Ml2C1IAMv0=; b=eiBYMCihWL0V93kLu
        npZ6AgwwZ+rSaibWLDbrDACuNunJBTtNa4Z+Qm66nLlc29nSmeKmsTLoG7yoDZ0s
        KjZItgc9hkvX8tO1ra4p5/gEtujMc+/xMcDhc9uTnYDRet+KGZoJnVlTgzN/kVWZ
        bL5qwaHRM42TGHEkH1/ORcQGLYtYNd6CAmmXlibBL/iP+/Z2IXH+bjZmGPDaspKO
        sJLPr/WoePbJbcoBFG8nJBB0MONFUQ1X+Py2XQglYcDA31bqJ1QANcNT+qgtoCOK
        NdFDe98FLkceguleFCQKFv5eluI/YdM6dNnVo428j8xZ63OVpLQBF99KwN4aYa9N
        hr1Aw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=HtVzFrXziOlq76uUCaIpFOvTH7H2DzX74Ml2C1IAM
        v0=; b=SVndoAAY01rmHFSTrFQJfDvpCrDXPX3YZLrzIUUuN8MnQZUMk25hZPV4W
        edDngmWqC1pnMMGugnEOOBPFCy3fFQinqvmV7xieYyAc7zYOxWkaMMSmBiuT4a3z
        BuvAtRxil2nrZoiVistzT2tRo1VRDzGotTCLrXDL5qTQDnlNRDRQKA+clMl5/Qv/
        1+e1g+G6OBAyexgttAPgm24EW/Sz1eLPDJcQr001DkzPNlwxEnDNxFUUu6fPE0Ty
        r9GGtgIduq7W0Lx9qcf5FBlmGbv7RgxsL8Rj7DHy6pF3yLXItx83Z+aLBD0WqFD3
        8gfDw4Uv6XZUSHPlFTEoaMentww1g==
X-ME-Sender: <xms:EiJFX8FBccaKVq2rMTA4x39nz7C2q1bVX_MpVlrfcCbwyxlwE702Nw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvtddgkeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtugfgjgesthhqredttddtudenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeehledvhfeklefgveelkeeludevffethfdukedvfffhhfegfeeugfehgeef
    jeevtdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:EiJFX1WBLoNjH7x-SoP6fP3kBBe7IvpT4n_Z5UOKR1at0k3lOVo05Q>
    <xmx:EiJFX2LHu4qhr7K7NQG7iNB3dkHT3jR6Qzt_N8XOPobD557A5J24kA>
    <xmx:EiJFX-FcUdakonBiyjer_EJahRI31wYlHpmJyIzO98FD927rpEJSzg>
    <xmx:EyJFX-R3a6C552l4eFfhSE5TrMRUZZrB0eIsF6wCFYsGoQb4C1uifg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id E8292328005A;
        Tue, 25 Aug 2020 10:37:05 -0400 (EDT)
Date:   Tue, 25 Aug 2020 16:37:04 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     =?utf-8?B?S8OpdmluIEwnaMO0cGl0YWw=?= <kevin.lhopital@bootlin.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com, wens@csie.org,
        yong.deng@magewell.com, p.zabel@pengutronix.de,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        paul.kocialkowski@bootlin.com, thomas.petazzoni@bootlin.com
Subject: Re: [PATCH 5/7] media: sunxi: sun6i-csi: Add support of MIPI CSI-2
 for A83T
Message-ID: <20200825143704.qkg2re5bxm2cufnd@gilmour.lan>
References: <20200821145935.20346-1-kevin.lhopital@bootlin.com>
 <20200821145935.20346-6-kevin.lhopital@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200821145935.20346-6-kevin.lhopital@bootlin.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Fri, Aug 21, 2020 at 04:59:33PM +0200, K=E9vin L'h=F4pital wrote:
> This patch add the support only for the Allwinner A83T MIPI CSI2
>=20
> Currently, the driver is not supported the other Allwinner V3's MIPI CSI2
>=20
> It has been tested with the ov8865 image sensor.
>=20
> Signed-off-by: K=E9vin L'h=F4pital <kevin.lhopital@bootlin.com>

Explaining how it's different from the v3s would help

> ---
>  .../media/platform/sunxi/sun6i-csi/Makefile   |   2 +-
>  .../platform/sunxi/sun6i-csi/sun6i_csi.c      |  82 ++++--
>  .../sunxi/sun6i-csi/sun8i_a83t_dphy.c         |  20 ++
>  .../sunxi/sun6i-csi/sun8i_a83t_dphy.h         |  16 ++
>  .../sunxi/sun6i-csi/sun8i_a83t_dphy_reg.h     |  15 ++
>  .../sunxi/sun6i-csi/sun8i_a83t_mipi_csi2.c    | 249 ++++++++++++++++++
>  .../sunxi/sun6i-csi/sun8i_a83t_mipi_csi2.h    |  16 ++
>  .../sun6i-csi/sun8i_a83t_mipi_csi2_reg.h      |  42 +++
>  8 files changed, 425 insertions(+), 17 deletions(-)
>  create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_dph=
y.c
>  create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_dph=
y.h
>  create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_dph=
y_reg.h
>  create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_mip=
i_csi2.c
>  create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_mip=
i_csi2.h
>  create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_mip=
i_csi2_reg.h
>=20
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/Makefile b/drivers/me=
dia/platform/sunxi/sun6i-csi/Makefile
> index e7e315347804..0f3849790463 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/Makefile
> +++ b/drivers/media/platform/sunxi/sun6i-csi/Makefile
> @@ -1,4 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -sun6i-csi-y +=3D sun6i_video.o sun6i_csi.o
> +sun6i-csi-y +=3D sun6i_video.o sun6i_csi.o sun8i_a83t_mipi_csi2.o sun8i_=
a83t_dphy.o
> =20
>  obj-$(CONFIG_VIDEO_SUN6I_CSI) +=3D sun6i-csi.o
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c b/drivers=
/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> index 680fa31f380a..37aec0b57a46 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> @@ -26,6 +26,7 @@
> =20
>  #include "sun6i_csi.h"
>  #include "sun6i_csi_reg.h"
> +#include "sun8i_a83t_mipi_csi2.h"
> =20
>  #define MODULE_NAME	"sun6i-csi"
> =20
> @@ -40,6 +41,18 @@ bool sun6i_csi_is_format_supported(struct sun6i_csi *c=
si,
>  {
>  	struct sun6i_csi_dev *sdev =3D sun6i_csi_to_dev(csi);
> =20
> +	if (csi->v4l2_ep.bus_type =3D=3D V4L2_MBUS_CSI2_DPHY) {
> +		if (!sdev->clk_mipi) {
> +			dev_err(sdev->dev, "Use MIPI-CSI2 device with no MIPI clock\n");
> +			return false;
> +		}
> +		if (!sdev->clk_misc) {
> +			dev_err(sdev->dev, "Use MIPI-CSI2 device with no misc clock\n");
> +			return false;
> +		}
> +		return true;
> +	}
> +

I'm not sure we need to check for that everywhere, just doing so in the
fwnode parsing function sohuld be enough.

>  	/*
>  	 * Some video receivers have the ability to be compatible with
>  	 * 8bit and 16bit bus width.
> @@ -160,10 +173,14 @@ int sun6i_csi_set_power(struct sun6i_csi *csi, bool=
 enable)
>  		regmap_update_bits(regmap, CSI_EN_REG, CSI_EN_CSI_EN, 0);
> =20
>  		clk_disable_unprepare(sdev->clk_ram);
> +
>  		if (of_device_is_compatible(dev->of_node,
>  					    "allwinner,sun50i-a64-csi"))
>  			clk_rate_exclusive_put(sdev->clk_mod);
>  		clk_disable_unprepare(sdev->clk_mod);
> +		if (csi->v4l2_ep.bus_type =3D=3D V4L2_MBUS_CSI2_DPHY)
> +			sun6i_mipi_csi_clk_disable(csi);
> +
>  		reset_control_assert(sdev->rstc_bus);
>  		return 0;
>  	}
> @@ -189,10 +206,18 @@ int sun6i_csi_set_power(struct sun6i_csi *csi, bool=
 enable)
>  		goto clk_ram_disable;
>  	}
> =20
> +	if (csi->v4l2_ep.bus_type =3D=3D V4L2_MBUS_CSI2_DPHY) {
> +		ret =3D sun6i_mipi_csi_clk_enable(csi);
> +		if (ret)
> +			goto reset_control_assert;
> +	}
> +
>  	regmap_update_bits(regmap, CSI_EN_REG, CSI_EN_CSI_EN, CSI_EN_CSI_EN);
> =20
>  	return 0;
> =20
> +reset_control_assert:
> +	reset_control_assert(sdev->rstc_bus);
>  clk_ram_disable:
>  	clk_disable_unprepare(sdev->clk_ram);
>  clk_mod_disable:
> @@ -421,27 +446,33 @@ static void sun6i_csi_setup_bus(struct sun6i_csi_de=
v *sdev)
>  		if (flags & V4L2_MBUS_PCLK_SAMPLE_FALLING)
>  			cfg |=3D CSI_IF_CFG_CLK_POL_FALLING_EDGE;
>  		break;
> +	case V4L2_MBUS_CSI2_DPHY:
> +		cfg |=3D CSI_IF_CFG_MIPI_IF_MIPI;
> +		sun6i_mipi_csi_setup_bus(csi);
> +		break;
>  	default:
>  		dev_warn(sdev->dev, "Unsupported bus type: %d\n",
>  			 endpoint->bus_type);
>  		break;
>  	}
> =20
> -	switch (bus_width) {
> -	case 8:
> -		cfg |=3D CSI_IF_CFG_IF_DATA_WIDTH_8BIT;
> -		break;
> -	case 10:
> -		cfg |=3D CSI_IF_CFG_IF_DATA_WIDTH_10BIT;
> -		break;
> -	case 12:
> -		cfg |=3D CSI_IF_CFG_IF_DATA_WIDTH_12BIT;
> -		break;
> -	case 16: /* No need to configure DATA_WIDTH for 16bit */
> -		break;
> -	default:
> -		dev_warn(sdev->dev, "Unsupported bus width: %u\n", bus_width);
> -		break;
> +	if (endpoint->bus_type !=3D V4L2_MBUS_CSI2_DPHY) {
> +		switch (bus_width) {
> +		case 8:
> +			cfg |=3D CSI_IF_CFG_IF_DATA_WIDTH_8BIT;
> +			break;
> +		case 10:
> +			cfg |=3D CSI_IF_CFG_IF_DATA_WIDTH_10BIT;
> +			break;
> +		case 12:
> +			cfg |=3D CSI_IF_CFG_IF_DATA_WIDTH_12BIT;
> +			break;
> +		case 16: /* No need to configure DATA_WIDTH for 16bit */
> +			break;
> +		default:
> +			dev_warn(sdev->dev, "Unsupported bus width: %u\n", bus_width);
> +			break;
> +		}
>  	}

I'm not sure why we need to do some setup in both cases, and some only
in the MIPI-CSI case here, can you clarify that a bit?

> =20
>  	regmap_write(sdev->regmap, CSI_IF_CFG_REG, cfg);
> @@ -593,6 +624,9 @@ void sun6i_csi_set_stream(struct sun6i_csi *csi, bool=
 enable)
>  	struct regmap *regmap =3D sdev->regmap;
> =20
>  	if (!enable) {
> +		if (csi->v4l2_ep.bus_type =3D=3D V4L2_MBUS_CSI2_DPHY)
> +			sun6i_mipi_csi_set_stream(csi, 0);
> +
>  		regmap_update_bits(regmap, CSI_CAP_REG, CSI_CAP_CH0_VCAP_ON, 0);
>  		regmap_write(regmap, CSI_CH_INT_EN_REG, 0);
>  		return;
> @@ -609,6 +643,9 @@ void sun6i_csi_set_stream(struct sun6i_csi *csi, bool=
 enable)
> =20
>  	regmap_update_bits(regmap, CSI_CAP_REG, CSI_CAP_CH0_VCAP_ON,
>  			   CSI_CAP_CH0_VCAP_ON);
> +
> +	if (csi->v4l2_ep.bus_type =3D=3D V4L2_MBUS_CSI2_DPHY)
> +		sun6i_mipi_csi_set_stream(csi, 1);
>  }
> =20
>  /* ---------------------------------------------------------------------=
--------
> @@ -692,6 +729,7 @@ static int sun6i_csi_fwnode_parse(struct device *dev,
>  	}
> =20
>  	switch (vep->bus_type) {
> +	case V4L2_MBUS_CSI2_DPHY:
>  	case V4L2_MBUS_PARALLEL:
>  	case V4L2_MBUS_BT656:
>  		csi->v4l2_ep =3D *vep;
> @@ -812,7 +850,7 @@ static const struct regmap_config sun6i_csi_regmap_co=
nfig =3D {
>  	.reg_bits       =3D 32,
>  	.reg_stride     =3D 4,
>  	.val_bits       =3D 32,
> -	.max_register	=3D 0x9c,
> +	.max_register	=3D 0x2000,
>  };
> =20
>  static int sun6i_csi_resource_request(struct sun6i_csi_dev *sdev,
> @@ -847,6 +885,18 @@ static int sun6i_csi_resource_request(struct sun6i_c=
si_dev *sdev,
>  		return PTR_ERR(sdev->clk_ram);
>  	}
> =20
> +	sdev->clk_mipi =3D devm_clk_get(&pdev->dev, "mipi");
> +	if (IS_ERR(sdev->clk_mipi)) {
> +		sdev->clk_mipi =3D NULL;
> +		dev_warn(&pdev->dev, "Unable to acquire mipi clock. No mipi support\n"=
);
> +	}
> +
> +	sdev->clk_misc =3D devm_clk_get(&pdev->dev, "misc");
> +	if (IS_ERR(sdev->clk_misc)) {
> +		sdev->clk_misc =3D NULL;
> +		dev_warn(&pdev->dev, "Unable to acquire misc clock. No mipi support\n"=
);
> +	}
> +

This will raise an error on platforms that use that driver for CSI but
don't have MIPI-CSI (like the H3 IIRC?), this isn't really ok.

I guess we could have a per-soc flag where you'd say if MIPI-CSI is
supported and only try to get the clock on the relevant SoCs.

Also, you're changing the DT binding, the documentation should be
updated.

>  	sdev->rstc_bus =3D devm_reset_control_get_shared(&pdev->dev, NULL);
>  	if (IS_ERR(sdev->rstc_bus)) {
>  		dev_err(&pdev->dev, "Cannot get reset controller\n");
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_dphy.c b/d=
rivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_dphy.c
> new file mode 100644
> index 000000000000..3f5e4395aaa5
> --- /dev/null
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_dphy.c
> @@ -0,0 +1,20 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * sun6i_dphy.c
> + * Copyright K=E9vin L'h=F4pital (C) 2020
> + */
> +
> +#include "sun8i_a83t_dphy.h"
> +#include "sun8i_a83t_dphy_reg.h"
> +
> +void sun6i_dphy_first_init(struct sun6i_csi_dev *sdev)
> +{
> +	regmap_write(sdev->regmap, DPHY_CTRL_REG, 0xb8df698e);
> +}
> +
> +void sun6i_dphy_second_init(struct sun6i_csi_dev *sdev)
> +{
> +	regmap_write(sdev->regmap, DPHY_CTRL_REG, 0x80008000);
> +	regmap_write(sdev->regmap, DPHY_ANA0_REG, 0xa0200000);
> +}

Some documentation/comment on what that first init and second init is,
and what those magic values are doing would be great here.

> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_dphy.h b/d=
rivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_dphy.h
> new file mode 100644
> index 000000000000..f776ed098cb3
> --- /dev/null
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_dphy.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * sun6i_dphy.h
> + * Copyright K=E9vin L'h=F4pital (C) 2020
> + */
> +
> +#ifndef __SUN8I_A83T_DPHY_H__
> +#define __SUN8I_A83T_DPHY_H__
> +
> +#include <linux/regmap.h>
> +#include "sun6i_csi.h"
> +
> +void sun6i_dphy_first_init(struct sun6i_csi_dev *sdev);
> +void sun6i_dphy_second_init(struct sun6i_csi_dev *sdev);
> +
> +#endif /* __SUN8I_A83T_DPHY_H__ */
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_dphy_reg.h=
 b/drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_dphy_reg.h
> new file mode 100644
> index 000000000000..c88824e4ec2e
> --- /dev/null
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_dphy_reg.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Allwinner A83t DPHY register description
> + * Copyright K=E9vin L'h=F4pital (C) 2020
> + */
> +
> +#ifndef __SUN8I_A83T_DPHY_REG_H__
> +#define __SUN8I_A83T_DPHY_REG_H__
> +
> +
> +#define DPHY_OFFSET			0x1000
> +#define DPHY_CTRL_REG			(DPHY_OFFSET + 0x010)
> +#define DPHY_ANA0_REG			(DPHY_OFFSET + 0x030)
> +
> +#endif /* __SUN8I_A83T_DPHY_REG_H__ */

Ideally this should be a D-PHY driver under drivers/phy

> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_mipi_csi2.=
c b/drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_mipi_csi2.c
> new file mode 100644
> index 000000000000..3f117e8d447f
> --- /dev/null
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_mipi_csi2.c
> @@ -0,0 +1,249 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Allwinner A83t MIPI Camera Sensor Interface driver
> + * Copyright K=E9vin L'h=F4pital (C) 2020
> + */
> +
> +#include <linux/clk.h>
> +#include "sun8i_a83t_mipi_csi2.h"
> +#include "sun8i_a83t_mipi_csi2_reg.h"
> +#include "sun8i_a83t_dphy.h"
> +#include <linux/delay.h>
> +
> +#define IS_FLAG(x, y) (((x) & (y)) =3D=3D y)
> +
> +enum mipi_csi2_pkt_fmt {
> +	MIPI_FS           =3D 0X00,
> +	MIPI_FE           =3D 0X01,
> +	MIPI_LS           =3D 0X02,
> +	MIPI_LE           =3D 0X03,
> +	MIPI_SDAT0          =3D 0X08,
> +	MIPI_SDAT1          =3D 0X09,
> +	MIPI_SDAT2          =3D 0X0A,
> +	MIPI_SDAT3          =3D 0X0B,
> +	MIPI_SDAT4          =3D 0X0C,
> +	MIPI_SDAT5          =3D 0X0D,
> +	MIPI_SDAT6          =3D 0X0E,
> +	MIPI_SDAT7          =3D 0X0F,
> +	MIPI_BLK            =3D 0X11,
> +	MIPI_EMBD         =3D 0X12,
> +	MIPI_YUV420       =3D 0X18,
> +	MIPI_YUV420_10    =3D 0X19,
> +	MIPI_YUV420_CSP   =3D 0X1C,
> +	MIPI_YUV420_CSP_10 =3D  0X1D,
> +	MIPI_YUV422       =3D 0X1E,
> +	MIPI_YUV422_10    =3D 0X1F,
> +	MIPI_RGB565       =3D 0X22,
> +	MIPI_RGB888       =3D 0X24,
> +	MIPI_RAW8         =3D 0X2A,
> +	MIPI_RAW10          =3D 0X2B,
> +	MIPI_RAW12          =3D 0X2C,
> +	MIPI_USR_DAT0     =3D 0X30,
> +	MIPI_USR_DAT1     =3D 0X31,
> +	MIPI_USR_DAT2     =3D 0X32,
> +	MIPI_USR_DAT3     =3D 0X33,
> +	MIPI_USR_DAT4     =3D 0X34,
> +	MIPI_USR_DAT5     =3D 0X35,
> +	MIPI_USR_DAT6     =3D 0X36,
> +	MIPI_USR_DAT7     =3D 0X37,
> +};
> +
> +static inline struct sun6i_csi_dev *sun6i_csi_to_dev(struct sun6i_csi *c=
si)
> +{
> +	return container_of(csi, struct sun6i_csi_dev, csi);
> +}
> +
> +static enum mipi_csi2_pkt_fmt get_pkt_fmt(u16 bus_pix_code)
> +{
> +	switch (bus_pix_code) {
> +	case MEDIA_BUS_FMT_RGB565_1X16:
> +		return MIPI_RGB565;
> +	case MEDIA_BUS_FMT_UYVY8_2X8:
> +	case MEDIA_BUS_FMT_UYVY8_1X16:
> +		return MIPI_YUV422;
> +	case MEDIA_BUS_FMT_UYVY10_2X10:
> +		return MIPI_YUV422_10;
> +	case MEDIA_BUS_FMT_RGB888_1X24:
> +		return MIPI_RGB888;
> +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> +	case MEDIA_BUS_FMT_SGBRG8_1X8:
> +	case MEDIA_BUS_FMT_SGRBG8_1X8:
> +	case MEDIA_BUS_FMT_SRGGB8_1X8:
> +		return MIPI_RAW8;
> +	case MEDIA_BUS_FMT_SBGGR10_1X10:
> +	case MEDIA_BUS_FMT_SGBRG10_1X10:
> +	case MEDIA_BUS_FMT_SGRBG10_1X10:
> +	case MEDIA_BUS_FMT_SRGGB10_1X10:
> +		return MIPI_RAW10;
> +	case MEDIA_BUS_FMT_SBGGR12_1X12:
> +	case MEDIA_BUS_FMT_SGBRG12_1X12:
> +	case MEDIA_BUS_FMT_SGRBG12_1X12:
> +	case MEDIA_BUS_FMT_SRGGB12_1X12:
> +		return MIPI_RAW12;
> +	default:
> +		return MIPI_RAW8;
> +	}
> +}
> +
> +

There's an extra new line here

> +void sun6i_mipi_csi_set_stream(struct sun6i_csi *csi, bool enable)
> +{
> +	struct sun6i_csi_dev *sdev =3D sun6i_csi_to_dev(csi);
> +
> +	if (enable)
> +		regmap_write_bits(sdev->regmap, MIPI_CSI2_CFG_REG,
> +				  MIPI_CSI2_CFG_REG_SYNC_EN,
> +				  MIPI_CSI2_CFG_REG_SYNC_EN);
> +	else
> +		regmap_write_bits(sdev->regmap, MIPI_CSI2_CFG_REG,
> +				  MIPI_CSI2_CFG_REG_SYNC_EN, 0);

Do you really need regmap_write_bits here, or is regmap_update_bits
enough?

> +
> +}
> +
> +void sun6i_mipi_csi_init(struct sun6i_csi_dev *sdev)
> +{
> +	regmap_write(sdev->regmap, MIPI_CSI2_CTRL_REG, 0xb8c39bec);
> +	regmap_write(sdev->regmap, MIPI_CSI2_RX_PKT_NUM_REG, 0xb8d257f8);
> +	sun6i_dphy_first_init(sdev);
> +	regmap_write(sdev->regmap, MIPI_CSI2_RSVD1_REG,
> +		     HW_LOCK_REGISTER_VALUE_1);
> +	regmap_write(sdev->regmap, MIPI_CSI2_RSVD2_REG,
> +		     HW_LOCK_REGISTER_VALUE_2);
> +	regmap_write(sdev->regmap, MIPI_CSI2_RX_PKT_NUM_REG, 0);
> +	regmap_write(sdev->regmap, MIPI_CSI2_VCDT0_REG, 0);
> +	regmap_write(sdev->regmap, MIPI_CSI2_CFG_REG, 0xb8c64f24);
> +	sun6i_dphy_second_init(sdev);
> +	regmap_write(sdev->regmap, MIPI_CSI2_CTRL_REG, 0x80000000);
> +	regmap_write(sdev->regmap, MIPI_CSI2_CFG_REG, 0x12200000);

Again, some defines / comments would be great here.

> +}
> +
> +void sun6i_mipi_csi_setup_bus(struct sun6i_csi *csi)
> +{
> +	struct v4l2_fwnode_endpoint *endpoint =3D &csi->v4l2_ep;
> +	struct sun6i_csi_dev *sdev =3D sun6i_csi_to_dev(csi);
> +	int lane_num =3D endpoint->bus.mipi_csi2.num_data_lanes;
> +	int flags =3D endpoint->bus.mipi_csi2.flags;
> +	int total_rx_ch =3D 0;
> +	int vc[4];
> +	int ch;
> +
> +	sun6i_mipi_csi_init(sdev);
> +
> +	if (IS_FLAG(flags, V4L2_MBUS_CSI2_CHANNEL_0)) {
> +		vc[total_rx_ch] =3D 0;
> +		total_rx_ch++;
> +	}
> +
> +	if (IS_FLAG(flags, V4L2_MBUS_CSI2_CHANNEL_1)) {
> +		vc[total_rx_ch] =3D 1;
> +		total_rx_ch++;
> +	}
> +
> +	if (IS_FLAG(flags, V4L2_MBUS_CSI2_CHANNEL_2)) {
> +		vc[total_rx_ch] =3D 2;
> +		total_rx_ch++;
> +	}
> +
> +	if (IS_FLAG(flags, V4L2_MBUS_CSI2_CHANNEL_3)) {
> +		vc[total_rx_ch] =3D 3;
> +		total_rx_ch++;
> +	}
> +

Is it supposed to handle multiple virtual channels at once? If so, how
do you get the results of each virtual channel?

> +	if (!total_rx_ch) {
> +		dev_dbg(sdev->dev,
> +			 "No receive channel assigned, using channel 0.\n");
> +		vc[total_rx_ch] =3D 0;
> +		total_rx_ch++;
> +	}
> +	/* Set lane. */
> +	regmap_write_bits(sdev->regmap, MIPI_CSI2_CFG_REG,
> +			  MIPI_CSI2_CFG_REG_N_LANE_MASK, (lane_num - 1) <<
> +			  MIPI_CSI2_CFG_REG_N_LANE_SHIFT);
> +	/* Set total channels. */
> +	regmap_write_bits(sdev->regmap, MIPI_CSI2_CFG_REG,
> +			  MIPI_CSI2_CFG_REG_N_CHANNEL_MASK, (total_rx_ch - 1) <<
> +			  MIPI_CSI2_CFG_REG_N_CHANNEL_SHIFT);
> +
> +	for (ch =3D 0; ch < total_rx_ch; ch++) {
> +		switch (ch) {
> +		case 0:
> +			regmap_write_bits(sdev->regmap, MIPI_CSI2_VCDT0_REG,
> +					  MIPI_CSI2_VCDT0_REG_CH0_DT_MASK,
> +					  get_pkt_fmt(csi->config.code));
> +			regmap_write_bits(sdev->regmap, MIPI_CSI2_VCDT0_REG,
> +					  MIPI_CSI2_VCDT0_REG_CH0_VC_MASK,
> +					  vc[ch] << MIPI_CSI2_VCDT0_REG_CH0_VC_SHIFT);
> +			break;
> +		case 1:
> +			regmap_write_bits(sdev->regmap, MIPI_CSI2_VCDT0_REG,
> +					  MIPI_CSI2_VCDT0_REG_CH1_DT_MASK,
> +					  get_pkt_fmt(csi->config.code)
> +					  <<
> +					  MIPI_CSI2_VCDT0_REG_CH1_DT_SHIFT);
> +			regmap_write_bits(sdev->regmap, MIPI_CSI2_VCDT0_REG,
> +					  MIPI_CSI2_VCDT0_REG_CH1_VC_MASK,
> +					  vc[ch] << MIPI_CSI2_VCDT0_REG_CH1_VC_SHIFT);
> +			break;
> +		case 2:
> +			regmap_write_bits(sdev->regmap, MIPI_CSI2_VCDT0_REG,
> +					  MIPI_CSI2_VCDT0_REG_CH2_DT_MASK,
> +					  get_pkt_fmt(csi->config.code)
> +					  <<
> +					  MIPI_CSI2_VCDT0_REG_CH2_DT_SHIFT);
> +			regmap_write_bits(sdev->regmap, MIPI_CSI2_VCDT0_REG,
> +					  MIPI_CSI2_VCDT0_REG_CH2_VC_MASK,
> +					  vc[ch] << MIPI_CSI2_VCDT0_REG_CH2_VC_SHIFT);
> +			break;
> +		case 3:
> +			regmap_write_bits(sdev->regmap, MIPI_CSI2_VCDT0_REG,
> +					  MIPI_CSI2_VCDT0_REG_CH3_DT_MASK,
> +					  get_pkt_fmt(csi->config.code)
> +					  <<
> +					  MIPI_CSI2_VCDT0_REG_CH3_DT_SHIFT);
> +			regmap_write_bits(sdev->regmap, MIPI_CSI2_VCDT0_REG,
> +					  MIPI_CSI2_VCDT0_REG_CH3_VC_MASK,
> +					  vc[ch] << MIPI_CSI2_VCDT0_REG_CH3_VC_SHIFT);
> +			break;
> +		default:
> +			regmap_write(sdev->regmap, MIPI_CSI2_VCDT0_REG,
> +				     MIPI_CSI2_VCDT0_REG_DEFAULT);
> +			break;
> +		}
> +	}
> +	mdelay(10);

Why do you need an mdelay here?

> +
> +}
> +
> +int sun6i_mipi_csi_clk_enable(struct sun6i_csi *csi)
> +{
> +	struct sun6i_csi_dev *sdev =3D sun6i_csi_to_dev(csi);
> +	int ret;
> +
> +	ret =3D clk_prepare_enable(sdev->clk_mipi);
> +	if (ret) {
> +		dev_err(sdev->dev, "Enable clk_mipi clk err %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret =3D clk_prepare_enable(sdev->clk_misc);
> +	if (ret) {
> +		dev_err(sdev->dev, "Enable clk_misc clk err %d\n", ret);
> +		goto clk_mipi_disable;
> +	}
> +
> +	return 0;
> +
> +clk_mipi_disable:
> +	clk_disable_unprepare(sdev->clk_mipi);
> +	return ret;
> +}
> +
> +void sun6i_mipi_csi_clk_disable(struct sun6i_csi *csi)
> +{
> +	struct sun6i_csi_dev *sdev =3D sun6i_csi_to_dev(csi);
> +
> +	clk_disable_unprepare(sdev->clk_misc);
> +	clk_disable_unprepare(sdev->clk_mipi);
> +}
> +
> +
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_mipi_csi2.=
h b/drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_mipi_csi2.h
> new file mode 100644
> index 000000000000..a94c69ccee39
> --- /dev/null
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_mipi_csi2.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright K=E9vin L'h=F4pital (C) 2020
> + */
> +
> +#ifndef __SUN8I_A83T_MIPI_CSI2_H__
> +#define __SUN8I_A83T_MIPI_CSI2_H__
> +#include <linux/regmap.h>
> +#include "sun6i_csi.h"
> +
> +void sun6i_mipi_csi_set_stream(struct sun6i_csi *csi, bool enable);
> +void sun6i_mipi_csi_setup_bus(struct sun6i_csi *csi);
> +int sun6i_mipi_csi_clk_enable(struct sun6i_csi *csi);
> +void sun6i_mipi_csi_clk_disable(struct sun6i_csi *csi);
> +
> +#endif /* __SUN8I_A83T_MIPI_CSI2_H__ */
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_mipi_csi2_=
reg.h b/drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_mipi_csi2_reg.h
> new file mode 100644
> index 000000000000..4d6fde3e50ef
> --- /dev/null
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_mipi_csi2_reg.h
> @@ -0,0 +1,42 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Allwinner A83t MIPI CSI register description
> + * Copyright K=E9vin L'h=F4pital (C) 2020
> + */
> +
> +#ifndef __SUN8I_A83T_MIPI_CSI2_REG_H__
> +#define __SUN8I_A83T_MIPI_CSI2_REG_H__
> +
> +
> +#define MIPI_CSI2_OFFSET			0x1000
> +#define MIPI_CSI2_CTRL_REG			(MIPI_CSI2_OFFSET + 0x004)
> +#define MIPI_CSI2_RX_PKT_NUM_REG		(MIPI_CSI2_OFFSET + 0x008)
> +#define MIPI_CSI2_RSVD1_REG			(MIPI_CSI2_OFFSET + 0x018)
> +#define HW_LOCK_REGISTER_VALUE_1		0xb8c8a30c
> +#define MIPI_CSI2_RSVD2_REG			(MIPI_CSI2_OFFSET + 0x01c)
> +#define HW_LOCK_REGISTER_VALUE_2		0xb8df8ad7

We should have defines for those, or at least where they are coming from

> +#define MIPI_CSI2_CFG_REG			(MIPI_CSI2_OFFSET + 0x100)
> +#define MIPI_CSI2_CFG_REG_SYNC_EN		BIT(31)
> +#define MIPI_CSI2_CFG_REG_N_LANE_SHIFT		4
> +#define MIPI_CSI2_CFG_REG_N_LANE_MASK		0x30

GENMASK would be great here (and everywhere below too)

Maxime
