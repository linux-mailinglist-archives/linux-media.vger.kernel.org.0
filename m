Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CE0C746D3D
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 11:24:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231509AbjGDJYW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 05:24:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231627AbjGDJYC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 05:24:02 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B09AC1A2;
        Tue,  4 Jul 2023 02:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1688462594; x=1719998594;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aNGyxILi3oLUNTq/+M2u6LKoLN9GJ0UumxD9SUazkbY=;
  b=GIWD2MidtjO6M5kdc3ae/Q71SVZjQOF9FvenQyFYGIeTOPeoK8MLVy48
   RB2SHo0sc1KWyLd+dVOplJJocwzY9VpNjVBtBOnOqgk4wjTdspfGpXDjR
   QW5qqdaWK2rzuOSk5yO/5JG3DdOs+shDmhDFGwO1PwzPa/OZLxLEDLQt0
   9s9ZXEHJovdOCk5vdk+VPwJD4ABQs3sJ8z3P+gRQpKvQxqssWWoo89mZc
   uK7vBWPzQWGekOy/S20nU9skmC46LX4M4Jracuv6ce9OF7Skq2M4sOx4Q
   E6u4urVpaekLlj3F/wX5/93PQTeozwdf/Eox6lCTMfMo5Qx7gfr+zkmwT
   g==;
X-IronPort-AV: E=Sophos;i="6.01,180,1684792800"; 
   d="scan'208";a="31743075"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 04 Jul 2023 11:23:11 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 85D6D280087;
        Tue,  4 Jul 2023 11:23:11 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-imx@nxp.com, guoniu.zhou@oss.nxp.com
Cc:     mchehab@kernel.org, laurent.pinchart@ideasonboard.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, jacopo.mondi@ideasonboard.com
Subject: Re: [PATCH 2/2] media: nxp: add driver for i.MX93 MIPI CSI-2 controller and D-PHY
Date:   Tue, 04 Jul 2023 11:23:11 +0200
Message-ID: <10303134.nUPlyArG6x@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230703113734.762307-3-guoniu.zhou@oss.nxp.com>
References: <20230703113734.762307-1-guoniu.zhou@oss.nxp.com> <20230703113734.762307-3-guoniu.zhou@oss.nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Guoniu,

thanks for posting this patch.

Am Montag, 3. Juli 2023, 13:37:34 CEST schrieb guoniu.zhou@oss.nxp.com:
> From: "Guoniu.zhou" <guoniu.zhou@nxp.com>
>=20
> The MIPI CSI-2 controller and MIPI Rx D-PHY found on i.MX93 originate
> from Synopsys. MIPI CSI-2 controller implements the CSI-2 protocol on
> host side. MIPI 2-lane Rx D-PHY module implement the physical layer
> for the MIPI D-PHY interface. Lane operation ranging from 80 Mbps to
> 1.5Gbps in forward direction.
>=20
> Add V4L2 subdev driver support both for CSI-2 controller and D-PHY
> since the PHY is wrapped by the CSI-2 controller and only expose a
> control interface to the CSI-2 controller.
>=20
> Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
> ---
>  MAINTAINERS                                |   10 +
>  drivers/media/platform/nxp/Kconfig         |   11 +
>  drivers/media/platform/nxp/Makefile        |    3 +
>  drivers/media/platform/nxp/dwc-mipi-csi2.c | 1384 ++++++++++++++++++++
>  drivers/media/platform/nxp/dwc-mipi-csi2.h |  289 ++++
>  drivers/media/platform/nxp/dwc-mipi-dphy.c |  195 +++
>  6 files changed, 1892 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c83475103a25..349d981f9c24 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15189,6 +15189,16 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
>  F:	sound/soc/codecs/tfa989x.c
>=20
> +NXP i.MX93 MIPI CSI-2 V4L2 DRIVER
> +M:	G.N. Zhou (OSS) <guoniu.zhou@oss.nxp.com>
> +R:	NXP Linux Team <linux-imx@nxp.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/nxp,dwc-mipi-csi2.yaml
> +F:	drivers/media/platform/nxp/dwc-mipi-csi2.c
> +F:	drivers/media/platform/nxp/dwc-mipi-csi2.h
> +F:	drivers/media/platform/nxp/dwc-mipi-dphy.c
> +
>  NZXT-KRAKEN2 HARDWARE MONITORING DRIVER
>  M:	Jonas Malaco <jonas@protocubo.io>
>  L:	linux-hwmon@vger.kernel.org
> diff --git a/drivers/media/platform/nxp/Kconfig
> b/drivers/media/platform/nxp/Kconfig index a0ca6b297fb8..4b8b713022d4
> 100644
> --- a/drivers/media/platform/nxp/Kconfig
> +++ b/drivers/media/platform/nxp/Kconfig
> @@ -30,6 +30,17 @@ config VIDEO_IMX_MIPI_CSIS
>=20
>  source "drivers/media/platform/nxp/imx8-isi/Kconfig"
>=20
> +config VIDEO_DWC_MIPI_CSIS
> +	tristate "DesignWare Cores MIPI CSI-2 receiver found on i.MX93"
> +	depends on ARCH_MXC || COMPILE_TEST
> +	depends on VIDEO_DEV
> +	select MEDIA_CONTROLLER
> +	select V4L2_FWNODE
> +	select VIDEO_V4L2_SUBDEV_API
> +	help
> +	  Video4Linux2 sub-device driver for the DesignWare Cores MIPI
> +	  CSI-2 receiver used on i.MX93.
> +
>  # mem2mem drivers
>=20
>  config VIDEO_IMX_PXP
> diff --git a/drivers/media/platform/nxp/Makefile
> b/drivers/media/platform/nxp/Makefile index b8e672b75fed..07f43795dc16
> 100644
> --- a/drivers/media/platform/nxp/Makefile
> +++ b/drivers/media/platform/nxp/Makefile
> @@ -4,6 +4,9 @@ obj-y +=3D dw100/
>  obj-y +=3D imx-jpeg/
>  obj-y +=3D imx8-isi/
>=20
> +dwc-mipi-csis-y :=3D dwc-mipi-csi2.o dwc-mipi-dphy.o
> +
> +obj-$(CONFIG_VIDEO_DWC_MIPI_CSIS) +=3D dwc-mipi-csis.o
>  obj-$(CONFIG_VIDEO_IMX7_CSI) +=3D imx7-media-csi.o
>  obj-$(CONFIG_VIDEO_IMX_MIPI_CSIS) +=3D imx-mipi-csis.o
>  obj-$(CONFIG_VIDEO_IMX_PXP) +=3D imx-pxp.o
> diff --git a/drivers/media/platform/nxp/dwc-mipi-csi2.c
> b/drivers/media/platform/nxp/dwc-mipi-csi2.c new file mode 100644
> index 000000000000..f03a23d9ef71
> --- /dev/null
> +++ b/drivers/media/platform/nxp/dwc-mipi-csi2.c
> @@ -0,0 +1,1384 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2023 NXP
> + *
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/errno.h>
> +#include <linux/iopoll.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +
> +#include <media/mipi-csi2.h>
> +
> +#include "dwc-mipi-csi2.h"
> +
> +#define DWC_MIPI_CSIS_DRIVER_NAME	"dwc-mipi-csi2"
> +
> +#define DWC_CSI2RX_DEF_MBUS_CODE	MEDIA_BUS_FMT_UYVY8_1X16
> +#define DWC_CSI2RX_DEF_PIX_WIDTH	1920U
> +#define DWC_CSI2RX_DEF_PIX_HEIGHT	1080U
> +#define DWC_CSI2RX_MAX_PIX_WIDTH	0xffff
> +#define DWC_CSI2RX_MAX_PIX_HEIGHT	0xffff
> +
> +/* Set default high speed frequency range to 1.5Gbps  */
> +#define DPHY_DEFAULT_FREQRANGE		0x2c
> +
> +enum imx93_csi_clks {
> +	PER,
> +	PIXEL,
> +	PHY_CFG,
> +};
> +
> +enum model {
> +	DWC_CSI2RX_IMX93,
> +};
> +
> +enum dwc_csi2rx_intf {
> +	DWC_CSI2RX_INTF_IDI,

This is unused, what is it intented for?

> +	DWC_CSI2RX_INTF_IPI,
> +};
> +
> +struct dwc_csi_plat_data {
> +	enum model model;
> +	enum dwc_csi2rx_intf intf;
> +
> +	const struct clk_bulk_data *clks;
> +	u32 num_clks;
> +
> +	const struct dwc_csi_event *events;
> +	u32 num_events;
> +	u32 events_mask;
> +};
> +
> +/*
> -------------------------------------------------------------------------=
=2D-
> -- + * Events
> + */
> +
> +struct dwc_csi_event {
> +	u32 mask;
> +	const char * const name;
> +	unsigned int counter;
> +};
> +
> +static struct dwc_csi_event mxc_imx93_events[] =3D {
> +	{ CSI2RX_INT_ST_MAIN_FATAL_ERR_IPI, "IPI Interface Fatal Error" },
> +	{ CSI2RX_INT_ST_MAIN_ERR_PHY, "PHY Error" },
> +	{ CSI2RX_INT_ST_MAIN_ERR_ECC, "Header Single Bit Error" },
> +	{ CSI2RX_INT_ST_MAIN_ERR_DID, "Data ID Error" },
> +	{ CSI2RX_INT_ST_MAIN_FATAL_ERR_PLD_CRC, "Payload CRC Fatal Error" },
> +	{ CSI2RX_INT_ST_MAIN_FATAL_ERR_CRC_FRAME, "Frame CRC Fatal Error" },
> +	{ CSI2RX_INT_ST_MAIN_FATAL_ERR_SEQ_FRAME, "Frame Sequence Fatal=20
Error" },
> +	{ CSI2RX_INT_ST_MAIN_FATAL_ERR_BNDRY_FRAMEL, "Frame Boundaries Fatal
> Error" }, +	{ CSI2RX_INT_ST_MAIN_FATAL_ERR_PKT, "Packet Construction=20
=46atal
> Error" }, +	{ CSI2RX_INT_ST_MAIN_FATAL_ERR_PHY, "PHY Fatal Error" },
> +};
> +
> +/*
> -------------------------------------------------------------------------=
=2D-
> -- + * Format helpers
> + */
> +
> +struct dwc_csi_pix_format {
> +	u32 code;
> +	u32 output;
> +	u32 data_type;
> +	u8 width;
> +};
> +
> +/* List of supported pixel formats for the subdev */
> +static const struct dwc_csi_pix_format dwc_csi_formats[] =3D {
> +	/* YUV formats */
> +	{
> +		.code =3D MEDIA_BUS_FMT_UYVY8_1X16,
> +		.output =3D MEDIA_BUS_FMT_UYVY8_1X16,
> +		.data_type =3D MIPI_CSI2_DT_YUV422_8B,
> +		.width =3D 16,
> +	},
> +	/* RGB formats */
> +	{
> +		.code =3D MEDIA_BUS_FMT_RGB565_1X16,
> +		.output =3D MEDIA_BUS_FMT_RGB565_1X16,
> +		.data_type =3D MIPI_CSI2_DT_RGB565,
> +		.width =3D 16,
> +	}, {
> +		.code =3D MEDIA_BUS_FMT_BGR888_1X24,
> +		.output =3D MEDIA_BUS_FMT_RGB888_1X24,
> +		.data_type =3D MIPI_CSI2_DT_RGB888,
> +		.width =3D 24,
> +	},
> +	/* RAW (Bayer and greyscale) formats. */
> +	{
> +		.code =3D MEDIA_BUS_FMT_SBGGR8_1X8,
> +		.output =3D MEDIA_BUS_FMT_SBGGR8_1X8,
> +		.data_type =3D MIPI_CSI2_DT_RAW8,
> +		.width =3D 8,
> +	}, {
> +		.code =3D MEDIA_BUS_FMT_SGBRG8_1X8,
> +		.output =3D MEDIA_BUS_FMT_SGBRG8_1X8,
> +		.data_type =3D MIPI_CSI2_DT_RAW8,
> +		.width =3D 8,
> +	}, {
> +		.code =3D MEDIA_BUS_FMT_SGRBG8_1X8,
> +		.output =3D MEDIA_BUS_FMT_SGRBG8_1X8,
> +		.data_type =3D MIPI_CSI2_DT_RAW8,
> +		.width =3D 8,
> +	}, {
> +		.code =3D MEDIA_BUS_FMT_SRGGB8_1X8,
> +		.output =3D MEDIA_BUS_FMT_SRGGB8_1X8,
> +		.data_type =3D MIPI_CSI2_DT_RAW8,
> +		.width =3D 8,
> +	}, {
> +		.code =3D MEDIA_BUS_FMT_Y8_1X8,
> +		.output =3D MEDIA_BUS_FMT_Y8_1X8,
> +		.data_type =3D MIPI_CSI2_DT_RAW8,
> +		.width =3D 8,
> +	}, {
> +		.code =3D MEDIA_BUS_FMT_SBGGR10_1X10,
> +		.output =3D MEDIA_BUS_FMT_SBGGR10_1X10,
> +		.data_type =3D MIPI_CSI2_DT_RAW10,
> +		.width =3D 10,
> +	}, {
> +		.code =3D MEDIA_BUS_FMT_SGBRG10_1X10,
> +		.output =3D MEDIA_BUS_FMT_SGBRG10_1X10,
> +		.data_type =3D MIPI_CSI2_DT_RAW10,
> +		.width =3D 10,
> +	}, {
> +		.code =3D MEDIA_BUS_FMT_SGRBG10_1X10,
> +		.output =3D MEDIA_BUS_FMT_SGRBG10_1X10,
> +		.data_type =3D MIPI_CSI2_DT_RAW10,
> +		.width =3D 10,
> +	}, {
> +		.code =3D MEDIA_BUS_FMT_SRGGB10_1X10,
> +		.output =3D MEDIA_BUS_FMT_SRGGB10_1X10,
> +		.data_type =3D MIPI_CSI2_DT_RAW10,
> +		.width =3D 10,
> +	}, {
> +		.code =3D MEDIA_BUS_FMT_Y10_1X10,
> +		.output =3D MEDIA_BUS_FMT_Y10_1X10,
> +		.data_type =3D MIPI_CSI2_DT_RAW10,
> +		.width =3D 10,
> +	}, {
> +		.code =3D MEDIA_BUS_FMT_SBGGR12_1X12,
> +		.output =3D MEDIA_BUS_FMT_SBGGR12_1X12,
> +		.data_type =3D MIPI_CSI2_DT_RAW12,
> +		.width =3D 12,
> +	}, {
> +		.code =3D MEDIA_BUS_FMT_SGBRG12_1X12,
> +		.output =3D MEDIA_BUS_FMT_SGBRG12_1X12,
> +		.data_type =3D MIPI_CSI2_DT_RAW12,
> +		.width =3D 12,
> +	}, {
> +		.code =3D MEDIA_BUS_FMT_SGRBG12_1X12,
> +		.output =3D MEDIA_BUS_FMT_SGRBG12_1X12,
> +		.data_type =3D MIPI_CSI2_DT_RAW12,
> +		.width =3D 12,
> +	}, {
> +		.code =3D MEDIA_BUS_FMT_SRGGB12_1X12,
> +		.output =3D MEDIA_BUS_FMT_SRGGB12_1X12,
> +		.data_type =3D MIPI_CSI2_DT_RAW12,
> +		.width =3D 12,
> +	}, {
> +		.code =3D MEDIA_BUS_FMT_Y12_1X12,
> +		.output =3D MEDIA_BUS_FMT_Y12_1X12,
> +		.data_type =3D MIPI_CSI2_DT_RAW12,
> +		.width =3D 12,
> +	}, {
> +		.code =3D MEDIA_BUS_FMT_SBGGR14_1X14,
> +		.output =3D MEDIA_BUS_FMT_SBGGR14_1X14,
> +		.data_type =3D MIPI_CSI2_DT_RAW14,
> +		.width =3D 14,
> +	}, {
> +		.code =3D MEDIA_BUS_FMT_SGBRG14_1X14,
> +		.output =3D MEDIA_BUS_FMT_SGBRG14_1X14,
> +		.data_type =3D MIPI_CSI2_DT_RAW14,
> +		.width =3D 14,
> +	}, {
> +		.code =3D MEDIA_BUS_FMT_SGRBG14_1X14,
> +		.output =3D MEDIA_BUS_FMT_SGRBG14_1X14,
> +		.data_type =3D MIPI_CSI2_DT_RAW14,
> +		.width =3D 14,
> +	}, {
> +		.code =3D MEDIA_BUS_FMT_SRGGB14_1X14,
> +		.output =3D MEDIA_BUS_FMT_SRGGB14_1X14,
> +		.data_type =3D MIPI_CSI2_DT_RAW14,
> +		.width =3D 14,
> +	}
> +};
> +
> +static const struct v4l2_mbus_framefmt dwc_csi_default_fmt =3D {
> +	.code =3D DWC_CSI2RX_DEF_MBUS_CODE,
> +	.width =3D DWC_CSI2RX_DEF_PIX_WIDTH,
> +	.height =3D DWC_CSI2RX_DEF_PIX_HEIGHT,
> +	.field =3D V4L2_FIELD_NONE,
> +	.colorspace =3D V4L2_COLORSPACE_SMPTE170M,
> +	.xfer_func =3D V4L2_MAP_XFER_FUNC_DEFAULT(V4L2_COLORSPACE_SMPTE170M),
> +	.ycbcr_enc =3D V4L2_MAP_YCBCR_ENC_DEFAULT(V4L2_COLORSPACE_SMPTE170M),
> +	.quantization =3D V4L2_QUANTIZATION_LIM_RANGE,
> +};
> +
> +static const struct dwc_csi_pix_format *find_csi_format(u32 code)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(dwc_csi_formats); i++)
> +		if (code =3D=3D dwc_csi_formats[i].code)
> +			return &dwc_csi_formats[i];
> +	return NULL;
> +}
> +
> +/*
> -------------------------------------------------------------------------=
=2D-
> -- + * DWC MIPI CSI-2 Host Controller Hardware operation
> + */
> +
> +static int dwc_csi_device_pg_enable(struct dwc_csi_device *csidev)
> +{
> +	const struct dwc_csi_pix_format *csi_fmt =3D csidev->csi_fmt;
> +	struct v4l2_mbus_framefmt *format;
> +	u32 val;
> +
> +	if (!csidev->pg_enable)
> +		return 0;
> +
> +	if (!csi_fmt) {
> +		dev_err(csidev->dev, "CSI pixel format is NULL\n");
> +		return -EINVAL;
> +	}
> +
> +	format =3D &csidev->format_mbus[DWC_CSI2RX_PAD_SINK];
> +
> +	if (csi_fmt->data_type !=3D MIPI_CSI2_DT_RGB888) {
> +		dev_err(csidev->dev, "Pattern generator only support=20
RGB888\n");
> +		return -EINVAL;
> +	}
> +
> +	val =3D CSI2RX_PPI_PG_PATTERN_HRES_HRES(format->width);
> +	dwc_csi_write(csidev, CSI2RX_PPI_PG_PATTERN_HRES, val);
> +
> +	val =3D CSI2RX_PPI_PG_PATTERN_VRES_VRES(format->height);
> +	dwc_csi_write(csidev, CSI2RX_PPI_PG_PATTERN_VRES, val);
> +
> +	val =3D CSI2RX_PPI_PG_CONFIG_DATA_TYPE(csi_fmt->data_type);
> +	val |=3D CSI2RX_PPI_PG_CONFIG_VIR_CHAN(0);
> +	val |=3D CSI2RX_PPI_PG_CONFIG_PG_MODE(csidev->pg_pattern);
> +	dwc_csi_write(csidev, CSI2RX_PPI_PG_CONFIG, val);
> +
> +	/*
> +	 * Select line start packets to construct vertical
> +	 * timing information for IPI interface
> +	 **/
> +	val =3D CSI2RX_IPI_ADV_FEATURES_SYNC_EVENT_MODE;
> +	val |=3D CSI2RX_IPI_ADV_FEATURES_SYNC_LS_PKT;
> +	val |=3D CSI2RX_IPI_ADV_FEATURES_LINE_EVENT_SEL;
> +	dwc_csi_write(csidev, CSI2RX_IPI_ADV_FEATURES, val);
> +
> +	val =3D CSI2RX_PPI_PG_ENABLE_EN;
> +	dwc_csi_write(csidev, CSI2RX_PPI_PG_ENABLE, val);
> +
> +	return 0;
> +}
> +
> +static void dwc_csi_device_pg_disable(struct dwc_csi_device *csidev)
> +{
> +	dwc_csi_write(csidev, CSI2RX_PPI_PG_ENABLE, 0);
> +	csidev->pg_enable =3D false;
> +}
> +
> +static void dwc_csi_ipi_enable(struct dwc_csi_device *csidev)
> +{
> +	const struct dwc_csi_plat_data *pdata =3D csidev->pdata;
> +	u32 val;
> +
> +	if (pdata->intf !=3D DWC_CSI2RX_INTF_IPI)
> +		return;
> +
> +	/* Memory is automatically flushed at each Frame Start */
> +	val =3D CSI2RX_IPI_MEM_FLUSH_AUTO;
> +	dwc_csi_write(csidev, CSI2RX_IPI_MEM_FLUSH, val);
> +
> +	/* Enable IPI */
> +	val =3D dwc_csi_read(csidev, CSI2RX_IPI_MODE);
> +	val |=3D CSI2RX_IPI_MODE_ENABLE;
> +	dwc_csi_write(csidev, CSI2RX_IPI_MODE, val);
> +}
> +
> +static void dwc_csi_ipi_disable(struct dwc_csi_device *csidev)
> +{
> +	const struct dwc_csi_plat_data *pdata =3D csidev->pdata;
> +
> +	if (pdata->intf !=3D DWC_CSI2RX_INTF_IPI)
> +		return;
> +
> +	dwc_csi_write(csidev, CSI2RX_IPI_MODE, 0);
> +}
> +
> +static void dwc_csi_device_ipi_config(struct dwc_csi_device *csidev)
> +{
> +	const struct dwc_csi_pix_format *csi_fmt =3D csidev->csi_fmt;
> +	const struct dwc_csi_plat_data *pdata =3D csidev->pdata;
> +	u32 val;
> +
> +	if (pdata->intf !=3D DWC_CSI2RX_INTF_IPI)
> +		return;
> +
> +	/* Do IPI soft reset */
> +	dwc_csi_write(csidev, CSI2RX_IPI_SOFTRSTN, 0x0);
> +	dwc_csi_write(csidev, CSI2RX_IPI_SOFTRSTN, 0x1);
> +
> +	/* Select virtual channel and data type to be processed by IPI */
> +	val =3D CSI2RX_IPI_DATA_TYPE_DT(csi_fmt->data_type);
> +	dwc_csi_write(csidev, CSI2RX_IPI_DATA_TYPE, val);
> +
> +	/* Set virtual channel 0 as default */
> +	val  =3D CSI2RX_IPI_VCID_VC(0);
> +	dwc_csi_write(csidev, CSI2RX_IPI_VCID, val);
> +
> +	/*
> +	 * Select IPI camera timing mode and allow the pixel stream
> +	 * to be non-continuous when pixel interface FIFO is empty
> +	 */
> +	val =3D dwc_csi_read(csidev, CSI2RX_IPI_MODE);
> +	val &=3D ~CSI2RX_IPI_MODE_CONTROLLER;
> +	val &=3D ~CSI2RX_IPI_MODE_COLOR_MODE16;
> +	val |=3D CSI2RX_IPI_MODE_CUT_THROUGH;
> +	dwc_csi_write(csidev, CSI2RX_IPI_MODE, val);
> +}
> +
> +static void dwc_csi_device_reset(struct dwc_csi_device *csidev)
> +{
> +	/* Reset mipi csi host, active low */
> +	dwc_csi_write(csidev, CSI2RX_HOST_RESETN, 0);
> +	dwc_csi_write(csidev, CSI2RX_HOST_RESETN, 1);
> +}
> +
> +static void dwc_csi_device_startup(struct dwc_csi_device *csidev)
> +{
> +	/* Release DWC_mipi_csi2_host from reset */
> +	dwc_csi_device_reset(csidev);
> +
> +	/* Apply PHY Reset */
> +	dphy_rx_reset(csidev);
> +
> +	/* Release PHY test codes from reset */
> +	dphy_rx_test_code_reset(csidev);
> +}
> +
> +static int dwc_csi_device_init(struct dwc_csi_device *csidev)
> +{
> +	struct device *dev =3D csidev->dev;
> +	u32 val;
> +	int ret;
> +
> +	/* Release Synopsys DPHY test codes from reset */
> +	dwc_csi_write(csidev, CSI2RX_DPHY_RSTZ, 0x0);
> +	dwc_csi_write(csidev, CSI2RX_DPHY_SHUTDOWNZ, 0x0);
> +	dwc_csi_write(csidev, CSI2RX_HOST_RESETN, 0);
> +
> +	/* Set testclr=3D1'b1 */
> +	val =3D dwc_csi_read(csidev, CSI2RX_DPHY_TEST_CTRL0);
> +	val |=3D CSI2RX_DPHY_TEST_CTRL0_TEST_CLR;
> +	dwc_csi_write(csidev, CSI2RX_DPHY_TEST_CTRL0, val);
> +
> +	/* Wait for at least 15ns */
> +	ndelay(15);
> +
> +	/* Configure the PHY frequency range */
> +	dphy_rx_test_code_config(csidev);
> +	dphy_rx_test_code_dump(csidev);
> +
> +	/* Config the number of active lanes */
> +	val =3D CSI2RX_N_LANES_N_LANES(csidev->bus.num_data_lanes - 1);
> +	dwc_csi_write(csidev, CSI2RX_N_LANES, val);
> +
> +	/* Release PHY from reset */
> +	dwc_csi_write(csidev, CSI2RX_DPHY_SHUTDOWNZ, 0x1);
> +	dwc_csi_write(csidev, CSI2RX_DPHY_RSTZ, 0x1);
> +	dwc_csi_write(csidev, CSI2RX_HOST_RESETN, 0x1);
> +
> +	/* Check if lanes are in stop state */
> +	ret =3D readl_poll_timeout(csidev->regs + CSI2RX_DPHY_STOPSTATE,
> +				 val, val !=3D 0x10003, 10, 10000);
> +	if (ret) {
> +		dev_err(dev, "Lanes are not in stop state(%#x)\n", val);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void dwc_csi_device_hs_rx_start(struct dwc_csi_device *csidev)
> +{
> +	dwc_csi_ipi_enable(csidev);
> +}
> +
> +static int dwc_csi_device_hs_rx_stop(struct dwc_csi_device *csidev)
> +{
> +	struct device *dev =3D csidev->dev;
> +	u32 val;
> +
> +	dwc_csi_ipi_disable(csidev);
> +	dphy_rx_power_off(csidev);
> +
> +	/* Check clock lanes are not in High Speed Mode */
> +	val =3D dwc_csi_read(csidev, CSI2RX_DPHY_RX_STATUS);
> +	if (val & CSI2RX_DPHY_RX_STATUS_CLK_LANE_HS) {
> +		dev_err(dev, "Clock lanes are still in HS mode\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static void dwc_csi_device_enable_interrupts(struct dwc_csi_device *csid=
ev,
> bool on) +{
> +	/* Define errors to be enabled */
> +	dwc_csi_write(csidev, CSI2RX_INT_MSK_DPHY_FATAL, on ? 0x3 : 0);
> +	dwc_csi_write(csidev, CSI2RX_INT_MSK_PKT_FATAL, on ? 0x3 : 0);
> +	dwc_csi_write(csidev, CSI2RX_INT_MSK_DPHY, on ? 0x30003 : 0);
> +	dwc_csi_write(csidev, CSI2RX_INT_MSK_IPI_FATAL, on ? 0x7f : 0);
> +}
> +
> +static int dwc_csi_clk_enable(struct dwc_csi_device *csidev)
> +{
> +	const struct dwc_csi_plat_data *pdata =3D csidev->pdata;
> +
> +	return clk_bulk_prepare_enable(pdata->num_clks, csidev->clks);
> +}
> +
> +static void dwc_csi_clk_disable(struct dwc_csi_device *csidev)
> +{
> +	const struct dwc_csi_plat_data *pdata =3D csidev->pdata;
> +
> +	clk_bulk_disable_unprepare(pdata->num_clks, csidev->clks);
> +}
> +
> +static int dwc_csi_clk_get(struct dwc_csi_device *csidev)
> +{
> +	const struct dwc_csi_plat_data *pdata =3D csidev->pdata;
> +	unsigned int size;
> +	int ret;
> +
> +	size =3D pdata->num_clks * sizeof(*csidev->clks);
> +
> +	csidev->clks =3D devm_kmalloc(csidev->dev, size, GFP_KERNEL);
> +	if (!csidev->clks)
> +		return -ENOMEM;
> +
> +	memcpy(csidev->clks, pdata->clks, size);
> +
> +	ret =3D devm_clk_bulk_get(csidev->dev, pdata->num_clks, csidev->clks);
> +	if (ret < 0) {
> +		dev_err(csidev->dev, "Failed to acquire clocks: %d\n",=20
ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> -------------------------------------------------------------------------=
=2D-
> -- + * Debug
> + */
> +
> +static void dwc_csi_clear_counters(struct dwc_csi_device *csidev)
> +{
> +	unsigned long flags;
> +	unsigned int i;
> +
> +	spin_lock_irqsave(&csidev->slock, flags);
> +
> +	for (i =3D 0; i < csidev->pdata->num_events; ++i)
> +		csidev->events[i].counter =3D 0;
> +
> +	spin_unlock_irqrestore(&csidev->slock, flags);
> +}
> +
> +static void dwc_csi_log_counters(struct dwc_csi_device *csidev)
> +{
> +	unsigned int num_events =3D csidev->pdata->num_events;
> +	unsigned long flags;
> +	unsigned int i;
> +
> +	spin_lock_irqsave(&csidev->slock, flags);
> +
> +	for (i =3D 0; i < num_events; ++i) {
> +		if (csidev->events[i].counter > 0)
> +			dev_info(csidev->dev, "%s events: %d\n",
> +				 csidev->events[i].name,
> +				 csidev->events[i].counter);
> +	}
> +
> +	spin_unlock_irqrestore(&csidev->slock, flags);
> +}
> +
> +static void dwc_csi_dump_regs(struct dwc_csi_device *csidev)
> +{
> +#define DWC_MIPI_CSIS_DEBUG_REG(name)		{name, #name}
> +	static const struct {
> +		u32 offset;
> +		const char * const name;
> +	} registers[] =3D {
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_VERSION),
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_N_LANES),
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_HOST_RESETN),
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_INT_ST_MAIN),
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_DPHY_SHUTDOWNZ),
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_DPHY_RSTZ),
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_DPHY_RX_STATUS),
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_DPHY_STOPSTATE),
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_DPHY_TEST_CTRL0),
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_DPHY_TEST_CTRL1),
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_PPI_PG_PATTERN_VRES),
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_PPI_PG_PATTERN_HRES),
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_PPI_PG_CONFIG),
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_PPI_PG_ENABLE),
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_PPI_PG_STATUS),
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_IPI_MODE),
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_IPI_VCID),
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_IPI_DATA_TYPE),
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_IPI_MEM_FLUSH),
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_IPI_SOFTRSTN),
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_IPI_ADV_FEATURES),
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_INT_ST_DPHY_FATAL),
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_INT_ST_PKT_FATAL),
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_INT_ST_DPHY_FATAL),
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_INT_ST_IPI_FATAL),
> +	};
> +
> +	unsigned int i;
> +	u32 cfg;
> +
> +	dev_dbg(csidev->dev, "--- REGISTERS ---\n");
> +
> +	for (i =3D 0; i < ARRAY_SIZE(registers); i++) {
> +		cfg =3D dwc_csi_read(csidev, registers[i].offset);
> +		dev_dbg(csidev->dev, "%14s[0x%02x]: 0x%08x\n",
> +			registers[i].name, registers[i].offset, cfg);
> +	}
> +}
> +
> +/*
> -------------------------------------------------------------------------=
=2D-
> -- + * V4L2 subdev operations
> + */
> +
> +static inline struct dwc_csi_device *
> +sd_to_dwc_csi_device(struct v4l2_subdev *sdev)
> +{
> +	return container_of(sdev, struct dwc_csi_device, sd);
> +}
> +
> +static struct v4l2_mbus_framefmt *
> +dwc_csi_get_pad_format(struct dwc_csi_device *csidev,
> +			struct v4l2_subdev_state *sd_state,
> +			enum v4l2_subdev_format_whence which,
> +			unsigned int pad)
> +{
> +	if (which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> +		return v4l2_subdev_get_try_format(&csidev->sd, sd_state,=20
pad);
> +
> +	return &csidev->format_mbus[pad];
> +}
> +
> +static int dwc_csi_subdev_init_cfg(struct v4l2_subdev *sd,
> +				    struct v4l2_subdev_state=20
*sd_state)
> +{
> +	struct dwc_csi_device *csidev =3D sd_to_dwc_csi_device(sd);
> +	struct v4l2_mbus_framefmt *fmt_sink;
> +	struct v4l2_mbus_framefmt *fmt_source;
> +
> +	fmt_sink =3D dwc_csi_get_pad_format(csidev, sd_state,
> +					   V4L2_SUBDEV_FORMAT_TRY,
> +					   DWC_CSI2RX_PAD_SINK);
> +	*fmt_sink =3D dwc_csi_default_fmt;
> +
> +	fmt_source =3D dwc_csi_get_pad_format(csidev, sd_state,
> +					     V4L2_SUBDEV_FORMAT_TRY,
> +					     DWC_CSI2RX_PAD_SOURCE);
> +	*fmt_source =3D *fmt_sink;
> +
> +	return 0;
> +}
> +
> +static int dwc_csi_subdev_enum_mbus_code(struct v4l2_subdev *sd,
> +					  struct v4l2_subdev_state=20
*sd_state,
> +					  struct=20
v4l2_subdev_mbus_code_enum *code)
> +{
> +	struct dwc_csi_device *csidev =3D sd_to_dwc_csi_device(sd);
> +
> +	/*
> +	 * The CSIS can't transcode in any way, the source format is=20
identical
> +	 * to the sink format.
> +	 */
> +	if (code->pad =3D=3D DWC_CSI2RX_PAD_SOURCE) {
> +		struct v4l2_mbus_framefmt *fmt;
> +
> +		if (code->index > 0)
> +			return -EINVAL;
> +
> +		fmt =3D dwc_csi_get_pad_format(csidev, sd_state, code-
>which,
> +					      code->pad);
> +		code->code =3D fmt->code;
> +		return 0;
> +	}
> +
> +	if (code->pad !=3D DWC_CSI2RX_PAD_SINK)
> +		return -EINVAL;
> +
> +	if (code->index >=3D ARRAY_SIZE(dwc_csi_formats))
> +		return -EINVAL;
> +
> +	code->code =3D dwc_csi_formats[code->index].code;
> +
> +	return 0;
> +}
> +
> +static int dwc_csi_subdev_get_fmt(struct v4l2_subdev *sd,
> +				   struct v4l2_subdev_state *sd_state,
> +				   struct v4l2_subdev_format=20
*sdformat)
> +{
> +	struct dwc_csi_device *csidev =3D sd_to_dwc_csi_device(sd);
> +	struct v4l2_mbus_framefmt *fmt;
> +
> +	fmt =3D dwc_csi_get_pad_format(csidev, sd_state, sdformat->which,
> +				      sdformat->pad);
> +
> +	mutex_lock(&csidev->lock);
> +	sdformat->format =3D *fmt;
> +	mutex_unlock(&csidev->lock);
> +
> +	return 0;
> +}
> +
> +static int dwc_csi_subdev_set_fmt(struct v4l2_subdev *sd,
> +				   struct v4l2_subdev_state *sd_state,
> +				   struct v4l2_subdev_format=20
*sdformat)
> +{
> +	struct dwc_csi_device *csidev =3D sd_to_dwc_csi_device(sd);
> +	struct dwc_csi_pix_format const *csi_fmt;
> +	struct v4l2_mbus_framefmt *fmt;
> +	unsigned int align;
> +
> +	/*
> +	 * The CSIS can't transcode in any way, the source format can't be
> +	 * modified.
> +	 */
> +	if (sdformat->pad =3D=3D DWC_CSI2RX_PAD_SOURCE)
> +		return dwc_csi_subdev_get_fmt(sd, sd_state, sdformat);
> +
> +	if (sdformat->pad !=3D DWC_CSI2RX_PAD_SINK)
> +		return -EINVAL;
> +
> +	/*
> +	 * Validate the media bus code and clamp and align the size.
> +	 *
> +	 * The total number of bits per line must be a multiple of 8. We=20
thus
> +	 * need to align the width for formats that are not multiples of 8
> +	 * bits.
> +	 */
> +	csi_fmt =3D find_csi_format(sdformat->format.code);
> +	if (!csi_fmt)
> +		csi_fmt =3D &dwc_csi_formats[0];
> +
> +	switch (csi_fmt->width % 8) {
> +	case 0:
> +		align =3D 0;
> +		break;
> +	case 4:
> +		align =3D 1;
> +		break;
> +	case 2:
> +	case 6:
> +		align =3D 2;
> +		break;
> +	default:
> +		/* 1, 3, 5, 7 */
> +		align =3D 3;
> +		break;
> +	}

Is this switch-case actually necessary? If the bits per line have to be a=20
multiple of 8, IMHO calling v4l_bound_align_image() with walign=3D3 should =
be=20
enough for all cases.

> +	v4l_bound_align_image(&sdformat->format.width, 1,
> +			      DWC_CSI2RX_MAX_PIX_WIDTH, align,
> +			      &sdformat->format.height, 1,
> +			      DWC_CSI2RX_MAX_PIX_HEIGHT, 0, 0);
> +
> +	fmt =3D dwc_csi_get_pad_format(csidev, sd_state, sdformat->which,
> +				      sdformat->pad);
> +
> +	mutex_lock(&csidev->lock);
> +
> +	fmt->code =3D csi_fmt->code;
> +	fmt->width =3D sdformat->format.width;
> +	fmt->height =3D sdformat->format.height;
> +	fmt->colorspace =3D sdformat->format.colorspace;
> +	fmt->quantization =3D sdformat->format.quantization;
> +	fmt->xfer_func =3D sdformat->format.xfer_func;
> +	fmt->ycbcr_enc =3D sdformat->format.ycbcr_enc;
> +
> +	sdformat->format =3D *fmt;
> +
> +	/* Propagate the format from sink to source. */
> +	fmt =3D dwc_csi_get_pad_format(csidev, sd_state, sdformat->which,
> +				      DWC_CSI2RX_PAD_SOURCE);
> +	*fmt =3D sdformat->format;
> +
> +	/* The format on the source pad might change due to unpacking. */
> +	fmt->code =3D csi_fmt->output;
> +
> +	/* Store the CSIS format descriptor for active formats. */
> +	if (sdformat->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE)
> +		csidev->csi_fmt =3D csi_fmt;
> +
> +	mutex_unlock(&csidev->lock);
> +
> +	return 0;
> +}
> +
> +static int dwc_csi_get_frame_desc(struct v4l2_subdev *sd, unsigned int p=
ad,
> +				   struct v4l2_mbus_frame_desc *fd)
> +{
> +	struct dwc_csi_device *csidev =3D sd_to_dwc_csi_device(sd);
> +	struct v4l2_mbus_frame_desc_entry *entry =3D &fd->entry[0];
> +
> +	if (pad !=3D DWC_CSI2RX_PAD_SOURCE)
> +		return -EINVAL;
> +
> +	fd->type =3D V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL;
> +	fd->num_entries =3D 1;
> +
> +	memset(entry, 0, sizeof(*entry));
> +
> +	mutex_lock(&csidev->lock);
> +
> +	entry->flags =3D 0;
> +	entry->pixelcode =3D csidev->csi_fmt->code;
> +	entry->bus.csi2.vc =3D 0;
> +	entry->bus.csi2.dt =3D csidev->csi_fmt->data_type;
> +
> +	mutex_unlock(&csidev->lock);
> +
> +	return 0;
> +}
> +
> +static int dwc_csi_start_stream(struct dwc_csi_device *csidev)
> +{
> +	int ret;
> +
> +	dwc_csi_device_startup(csidev);
> +
> +	ret =3D dwc_csi_device_init(csidev);
> +	if (ret)
> +		return ret;
> +
> +	dwc_csi_device_ipi_config(csidev);
> +
> +	ret =3D dwc_csi_device_pg_enable(csidev);
> +	if (ret)
> +		return ret;
> +
> +	dwc_csi_device_hs_rx_start(csidev);
> +
> +	dwc_csi_device_enable_interrupts(csidev, true);
> +
> +	return 0;
> +}
> +
> +static void dwc_csi_stop_stream(struct dwc_csi_device *csidev)
> +{
> +	dwc_csi_device_enable_interrupts(csidev, false);
> +	dwc_csi_device_hs_rx_stop(csidev);
> +	dwc_csi_device_pg_disable(csidev);
> +}
> +
> +static int dwc_csi_subdev_s_stream(struct v4l2_subdev *sd, int enable)
> +{
> +	struct dwc_csi_device *csidev =3D sd_to_dwc_csi_device(sd);
> +	int ret;
> +
> +	if (!csidev->sensor_sd) {
> +		dev_err(csidev->dev, "Sensor don't link with CSIS pad\n");
> +		return -EPIPE;
> +	}
> +
> +	mutex_lock(&csidev->lock);
> +
> +	if (!enable) {
> +		dwc_csi_stop_stream(csidev);
> +		dwc_csi_log_counters(csidev);
> +		pm_runtime_put(csidev->dev);
> +		goto sd_stream;
> +	}
> +
> +	ret =3D pm_runtime_resume_and_get(csidev->dev);
> +	if (ret < 0)
> +		goto unlocked;
> +
> +	dwc_csi_clear_counters(csidev);
> +
> +	/* CSIS HW configuration */
> +	ret =3D dwc_csi_start_stream(csidev);
> +	if (ret) {
> +		pm_runtime_put(csidev->dev);
> +		goto unlocked;
> +	}
> +
> +	dwc_csi_dump_regs(csidev);
> +
> +sd_stream:
> +	/*
> +	 * when enable CSI pattern generator, the clock source of
> +	 * pattern generator will be from external sensor, so it
> +	 * also need to enable external sensor clock.
> +	 */
> +	v4l2_subdev_call(csidev->sensor_sd, video, s_stream, enable);
> +	dwc_csi_log_counters(csidev);
> +unlocked:
> +	mutex_unlock(&csidev->lock);
> +	return ret;
> +}
> +
> +static const struct v4l2_subdev_pad_ops dwc_csi_subdev_pad_ops =3D {
> +	.init_cfg =3D dwc_csi_subdev_init_cfg,
> +	.enum_mbus_code	=3D dwc_csi_subdev_enum_mbus_code,
> +	.get_fmt =3D dwc_csi_subdev_get_fmt,
> +	.set_fmt =3D dwc_csi_subdev_set_fmt,
> +	.get_frame_desc =3D dwc_csi_get_frame_desc,
> +};
> +
> +static const struct v4l2_subdev_video_ops dwc_csi_subdev_video_ops =3D {
> +	.s_stream =3D dwc_csi_subdev_s_stream,
> +};
> +
> +static const struct v4l2_subdev_ops dwc_csi_subdev_ops =3D {
> +	.pad   =3D &dwc_csi_subdev_pad_ops,
> +	.video =3D &dwc_csi_subdev_video_ops,
> +};
> +
> +/*
> -------------------------------------------------------------------------=
=2D-
> -- + * Media entity operations
> + */
> +
> +static int dwc_csi_link_setup(struct media_entity *entity,
> +			       const struct media_pad *local_pad,
> +			       const struct media_pad *remote_pad, u32=20
flags)
> +{
> +	struct v4l2_subdev *sd =3D media_entity_to_v4l2_subdev(entity);
> +	struct dwc_csi_device *csidev =3D sd_to_dwc_csi_device(sd);
> +	struct v4l2_subdev *remote_sd;
> +
> +	dev_dbg(csidev->dev, "link setup %s -> %s", remote_pad->entity-
>name,
> +		local_pad->entity->name);
> +
> +	/* We only care about the link to the source. */
> +	if (!(local_pad->flags & MEDIA_PAD_FL_SINK))
> +		return 0;
> +
> +	remote_sd =3D media_entity_to_v4l2_subdev(remote_pad->entity);
> +
> +	if (flags & MEDIA_LNK_FL_ENABLED) {
> +		if (csidev->sensor_sd)
> +			return -EBUSY;
> +
> +		csidev->sensor_sd =3D remote_sd;
> +		csidev->remote_pad =3D remote_pad->index;
> +	} else {
> +		csidev->sensor_sd =3D NULL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int dwc_csi_link_validate(struct media_link *link)
> +{
> +	struct media_pad *sink_pad =3D link->sink;
> +	struct v4l2_subdev *sink_sd;
> +	struct dwc_csi_device *csidev;
> +
> +	sink_sd =3D media_entity_to_v4l2_subdev(sink_pad->entity);
> +	csidev =3D sd_to_dwc_csi_device(sink_sd);
> +
> +	dev_dbg(csidev->dev, "entity name:%s pad index=3D%d\n",
> +			   sink_sd->name, sink_pad->index);
> +
> +	/*
> +	 * Skip link validate when pattern enabled since the soruce
> +	 * data will be from CSI pattern generator, not sensor.
> +	 */
> +	if (csidev->pg_enable && sink_pad->index =3D=3D DWC_CSI2RX_PAD_SINK)
> +		return 0;
> +
> +	return v4l2_subdev_link_validate(link);
> +}
> +
> +static const struct media_entity_operations dwc_csi_entity_ops =3D {
> +	.link_setup	=3D dwc_csi_link_setup,
> +	.link_validate	=3D dwc_csi_link_validate,
> +	.get_fwnode_pad =3D v4l2_subdev_get_fwnode_pad_1_to_1,
> +};
> +
> +/*
> -------------------------------------------------------------------------=
=2D-
> -- + * Async subdev notifier
> + */
> +
> +static inline struct dwc_csi_device *
> +notifier_to_dwc_csi_device(struct v4l2_async_notifier *n)
> +{
> +	return container_of(n, struct dwc_csi_device, notifier);
> +}
> +
> +static int dwc_csi_notify_bound(struct v4l2_async_notifier *notifier,
> +				  struct v4l2_subdev *sd,
> +				  struct v4l2_async_subdev *asd)
> +{
> +	struct dwc_csi_device *csidev =3D=20
notifier_to_dwc_csi_device(notifier);
> +	struct media_pad *sink =3D &csidev-
>sd.entity.pads[DWC_CSI2RX_PAD_SINK];
> +
> +	return v4l2_create_fwnode_links_to_pad(sd, sink, 0);
> +}
> +
> +static const struct v4l2_async_notifier_operations dwc_csi_notify_ops =
=3D {
> +	.bound =3D dwc_csi_notify_bound,
> +};
> +
> +static int dwc_csi_async_register(struct dwc_csi_device *csidev)
> +{
> +	struct v4l2_fwnode_endpoint vep =3D {
> +		.bus_type =3D V4L2_MBUS_CSI2_DPHY,
> +	};
> +	struct v4l2_async_subdev *asd;
> +	struct fwnode_handle *ep;
> +	unsigned int i;
> +	int ret;
> +
> +	v4l2_async_nf_init(&csidev->notifier);
> +
> +	ep =3D fwnode_graph_get_endpoint_by_id(dev_fwnode(csidev->dev), 0, 0,
> +					    =20
=46WNODE_GRAPH_ENDPOINT_NEXT);
> +	if (!ep)
> +		return -ENOTCONN;
> +
> +	ret =3D v4l2_fwnode_endpoint_parse(ep, &vep);
> +	if (ret)
> +		goto err_parse;
> +
> +	for (i =3D 0; i < vep.bus.mipi_csi2.num_data_lanes; ++i) {
> +		if (vep.bus.mipi_csi2.data_lanes[i] !=3D i + 1) {
> +			dev_err(csidev->dev,
> +				"data lanes reordering is not=20
supported");
> +			ret =3D -EINVAL;
> +			goto err_parse;
> +		}
> +	}
> +
> +	csidev->bus =3D vep.bus.mipi_csi2;
> +
> +	if (fwnode_property_read_u32(ep, "fsl,hsfreqrange",
> +				     &csidev->hsfreqrange))
> +		csidev->hsfreqrange =3D DPHY_DEFAULT_FREQRANGE;
> +
> +	dev_dbg(csidev->dev, "data lanes: %d\n", csidev-
>bus.num_data_lanes);
> +	dev_dbg(csidev->dev, "flags: 0x%08x\n", csidev->bus.flags);
> +	dev_dbg(csidev->dev, "high speed frequency range: 0x%X\n",
> csidev->hsfreqrange); +
> +	asd =3D v4l2_async_nf_add_fwnode_remote(&csidev->notifier, ep,
> +					      struct=20
v4l2_async_subdev);
> +	if (IS_ERR(asd)) {
> +		ret =3D PTR_ERR(asd);
> +		goto err_parse;
> +	}
> +
> +	fwnode_handle_put(ep);
> +
> +	csidev->notifier.ops =3D &dwc_csi_notify_ops;
> +
> +	ret =3D v4l2_async_subdev_nf_register(&csidev->sd, &csidev->notifier);
> +	if (ret)
> +		return ret;

I'm not sure which part causes the following message:
> dwc-mipi-csi2 4ae00000.mipi-csi: Consider updating driver dwc-mipi-csi2 t=
o=20
match on endpoints

But as this is a new driver, this should be addressed.

> +
> +	return v4l2_async_register_subdev(&csidev->sd);
> +
> +err_parse:
> +	fwnode_handle_put(ep);
> +
> +	return ret;
> +}
> +
> +/*
> -------------------------------------------------------------------------=
=2D-
> -- + * Pattern Generator operations
> + */
> +
> +static ssize_t pg_enable_show(struct device *dev,
> +			      struct device_attribute *attr, char *buf)
> +{
> +	struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> +	struct dwc_csi_device *csidev =3D sd_to_dwc_csi_device(sd);
> +
> +	return sprintf(buf, "%d\n", csidev->pg_enable);
> +}
> +
> +static ssize_t pg_enable_store(struct device *dev,
> +			       struct device_attribute *attr,
> +			       const char *buf, size_t len)
> +{
> +	struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> +	struct dwc_csi_device *csidev =3D sd_to_dwc_csi_device(sd);
> +	int ret;
> +	u8 val;
> +
> +	ret =3D kstrtou8(buf, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	csidev->pg_enable =3D val;
> +	return len;
> +}
> +static DEVICE_ATTR_RW(pg_enable);
> +
> +static ssize_t pg_active_show(struct device *dev,
> +			      struct device_attribute *attr, char *buf)
> +{
> +	struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> +	struct dwc_csi_device *csidev =3D sd_to_dwc_csi_device(sd);
> +	u32 val;
> +
> +	if (!pm_runtime_get_if_in_use(dev)) {
> +		csidev->pg_active =3D false;
> +		goto out;
> +	}
> +
> +	val =3D dwc_csi_read(csidev, CSI2RX_PPI_PG_STATUS);
> +	csidev->pg_active =3D val & BIT(0);
> +
> +out:
> +	return sprintf(buf, "%d\n", csidev->pg_active);
> +}
> +static DEVICE_ATTR_RO(pg_active);
> +
> +static ssize_t pg_pattern_show(struct device *dev,
> +			       struct device_attribute *attr, char *buf)
> +{
> +	struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> +	struct dwc_csi_device *csidev =3D sd_to_dwc_csi_device(sd);
> +	char temp[16] =3D "vertical";
> +
> +	if (csidev->pg_pattern =3D=3D PATTERN_HORIZONTAL)
> +		strcpy(temp, "horizontal");
> +
> +	return sprintf(buf, "%s\n", temp);
> +}
> +
> +static ssize_t pg_pattern_store(struct device *dev,
> +				struct device_attribute *attr,
> +				const char *buf, size_t len)
> +{
> +	struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> +	struct dwc_csi_device *csidev =3D sd_to_dwc_csi_device(sd);
> +	char temp[16];
> +	int ret =3D -EINVAL;
> +
> +	if (sscanf(buf, "%s", temp) > 0) {
> +		ret =3D len;
> +		if (!strcmp(temp, "horizontal"))
> +			csidev->pg_pattern =3D PATTERN_HORIZONTAL;
> +		else if (!strcmp(temp, "vertical"))
> +			csidev->pg_pattern =3D PATTERN_VERTICAL;
> +		else
> +			ret =3D -EINVAL;
> +	}
> +
> +	return ret;
> +}
> +static DEVICE_ATTR_RW(pg_pattern);
> +
> +static void dwc_csi_pattern_generator_init(struct dwc_csi_device *csidev)
> +{
> +	csidev->pg_enable =3D false;
> +	csidev->pg_active =3D false;
> +	csidev->pg_pattern =3D PATTERN_VERTICAL;
> +
> +	device_create_file(csidev->dev, &dev_attr_pg_enable);
> +	device_create_file(csidev->dev, &dev_attr_pg_active);
> +	device_create_file(csidev->dev, &dev_attr_pg_pattern);
> +}
> +
> +static void dwc_csi_pattern_generator_deinit(struct dwc_csi_device *csid=
ev)
> +{
> +	device_remove_file(csidev->dev, &dev_attr_pg_pattern);
> +	device_remove_file(csidev->dev, &dev_attr_pg_active);
> +	device_remove_file(csidev->dev, &dev_attr_pg_enable);
> +}

I get the idea, but isn't using a V4L2_CID_TEST_PATTERN control the better=
=20
choice?

> +/*
> -------------------------------------------------------------------------=
=2D-
> -- + * Suspend/resume
> + */
> +
> +static int dwc_csi_system_suspend(struct device *dev)
> +{
> +	return pm_runtime_force_suspend(dev);
> +}
> +
> +static int dwc_csi_system_resume(struct device *dev)
> +{
> +	int ret;
> +
> +	ret =3D pm_runtime_force_resume(dev);
> +	if (ret < 0) {
> +		dev_err(dev, "force resume %s failed!\n", dev_name(dev));
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int dwc_csi_runtime_suspend(struct device *dev)
> +{
> +	struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> +	struct dwc_csi_device *csidev =3D sd_to_dwc_csi_device(sd);
> +
> +	dwc_csi_clk_disable(csidev);
> +
> +	return 0;
> +}
> +
> +static int dwc_csi_runtime_resume(struct device *dev)
> +{
> +	struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> +	struct dwc_csi_device *csidev =3D sd_to_dwc_csi_device(sd);
> +	int ret;
> +
> +	ret =3D dwc_csi_clk_enable(csidev);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops dwc_csi_device_pm_ops =3D {
> +	SET_SYSTEM_SLEEP_PM_OPS(dwc_csi_system_suspend,=20
dwc_csi_system_resume)
> +	SET_RUNTIME_PM_OPS(dwc_csi_runtime_suspend, dwc_csi_runtime_resume,=20
NULL)
> +};
> +
> +/*
> -------------------------------------------------------------------------=
=2D-
> -- + * IRQ handling
> + */
> +
> +static irqreturn_t dwc_csi_irq_handler(int irq, void *priv)
> +{
> +	struct dwc_csi_device *csidev =3D priv;
> +	unsigned long flags;
> +	u32 status;
> +	int i;
> +
> +	status =3D dwc_csi_read(csidev, CSI2RX_INT_ST_MAIN);
> +
> +	spin_lock_irqsave(&csidev->slock, flags);
> +
> +	if (status & csidev->pdata->events_mask) {
> +		for (i =3D 0; i < csidev->pdata->num_events; ++i) {
> +			struct dwc_csi_event *event =3D &csidev-
>events[i];
> +
> +			if (status & event->mask)
> +				event->counter++;
> +		}
> +	}
> +
> +	spin_unlock_irqrestore(&csidev->slock, flags);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +/*
> -------------------------------------------------------------------------=
=2D-
> -- + * Probe/remove & platform driver
> + */
> +
> +static int dwc_csi_param_init(struct dwc_csi_device *csidev)
> +{
> +	int i;
> +
> +	/* Initialize the same format for pads of CSIS entity */
> +	for (i =3D 0; i < DWC_CSI2RX_PADS_NUM; ++i)
> +		csidev->format_mbus[i] =3D dwc_csi_default_fmt;
> +
> +	csidev->csi_fmt =3D &dwc_csi_formats[0];
> +
> +	return 0;
> +}
> +
> +static int dwc_csi_event_init(struct dwc_csi_device *csidev)
> +{
> +	unsigned int size =3D csidev->pdata->num_events
> +			  * sizeof(*csidev->events);
> +
> +	csidev->events =3D devm_kzalloc(csidev->dev, size, GFP_KERNEL);
> +	if (!csidev->events)
> +		return -ENOMEM;
> +
> +	memcpy(csidev->events, csidev->pdata->events, size);
> +
> +	return 0;
> +}
> +
> +static int dwc_csi_subdev_init(struct dwc_csi_device *csidev)
> +{
> +	struct v4l2_subdev *sd =3D &csidev->sd;
> +
> +	v4l2_subdev_init(sd, &dwc_csi_subdev_ops);
> +	sd->owner =3D THIS_MODULE;
> +	snprintf(sd->name, sizeof(sd->name), "csidev-%s", dev_name(csidev-
>dev));
> +
> +	sd->flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	sd->entity.function =3D MEDIA_ENT_F_VID_IF_BRIDGE;
> +	sd->entity.ops =3D &dwc_csi_entity_ops;
> +
> +	sd->dev =3D csidev->dev;
> +
> +	csidev->pads[DWC_CSI2RX_PAD_SINK].flags =3D MEDIA_PAD_FL_SINK;
> +	csidev->pads[DWC_CSI2RX_PAD_SOURCE].flags =3D MEDIA_PAD_FL_SOURCE;
> +
> +	return media_entity_pads_init(&csidev->sd.entity,=20
DWC_CSI2RX_PADS_NUM,
> +				      csidev->pads);
> +}
> +
> +static int dwc_csi_device_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct dwc_csi_device *csidev;
> +	unsigned long cfg_rate;
> +	int irq;
> +	int ret;
> +
> +	csidev =3D devm_kzalloc(dev, sizeof(*csidev), GFP_KERNEL);
> +	if (!csidev)
> +		return -ENOMEM;
> +
> +	mutex_init(&csidev->lock);

I think you are missing the initialization of csidev->slock here.
> +
> +	csidev->dev =3D dev;
> +	csidev->pdata =3D of_device_get_match_data(dev);
> +
> +	csidev->regs =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(csidev->regs)) {
> +		dev_err(dev, "Failed to get DWC csi2 register map\n");
> +		return PTR_ERR(csidev->regs);
> +	}
> +
> +	irq =3D platform_get_irq(pdev, 0);
> +	if (irq < 0) {
> +		dev_err(dev, "Failed to get IRQ (%d)\n", irq);
> +		return irq;
> +	}
> +
> +	ret =3D devm_request_irq(dev, irq, dwc_csi_irq_handler, 0,
> +			       dev_name(dev), csidev);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to request IRQ (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	ret =3D dwc_csi_clk_get(csidev);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to get clocks\n");
> +		return ret;
> +	}
> +
> +	/* cfgclkfreqrange[5:0] =3D round[(cfg_clk(MHz) - 17) * 4] */
> +	cfg_rate =3D clk_get_rate(csidev->clks[PHY_CFG].clk);
> +	if (!cfg_rate) {
> +		dev_err(dev, "Failed to get phy_cfg clock rate\n");
> +		return -EINVAL;
> +	}
> +
> +	csidev->cfgclkfreqrange =3D ((cfg_rate / 1000000) - 17) * 4;
> +
> +	ret =3D dwc_csi_param_init(csidev);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D dwc_csi_event_init(csidev);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D dwc_csi_subdev_init(csidev);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to initialize subdev\n");
> +		return ret;
> +	}
> +
> +	platform_set_drvdata(pdev, &csidev->sd);
> +
> +	ret =3D dwc_csi_async_register(csidev);
> +	if (ret < 0) {
> +		dev_err(dev, "Async register failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	pm_runtime_enable(dev);
> +
> +	dwc_csi_pattern_generator_init(csidev);
> +
> +	return 0;
> +}
> +
> +static int dwc_csi_device_remove(struct platform_device *pdev)
> +{
> +	struct v4l2_subdev *sd =3D platform_get_drvdata(pdev);
> +	struct dwc_csi_device *csidev =3D sd_to_dwc_csi_device(sd);
> +
> +	v4l2_async_nf_unregister(&csidev->notifier);
> +	v4l2_async_nf_cleanup(&csidev->notifier);
> +	v4l2_async_unregister_subdev(&csidev->sd);
> +
> +	/* Remove pattern generator device attribute */
> +	dwc_csi_pattern_generator_deinit(csidev);
> +
> +	pm_runtime_disable(&pdev->dev);
> +
> +	media_entity_cleanup(&csidev->sd.entity);
> +	fwnode_handle_put(csidev->sd.fwnode);
> +	mutex_destroy(&csidev->lock);
> +
> +	pm_runtime_set_suspended(&pdev->dev);
> +	return 0;
> +}
> +
> +static const struct clk_bulk_data mxc_imx93_clks[] =3D {
> +	{ .id =3D "per" },
> +	{ .id =3D "pixel" },
> +	{ .id =3D "phy_cfg" },
> +};
> +
> +static const struct dwc_csi_plat_data mxc_imx93_data =3D {
> +	.model		=3D DWC_CSI2RX_IMX93,
> +	.intf		=3D DWC_CSI2RX_INTF_IPI,
> +	.clks		=3D mxc_imx93_clks,
> +	.num_clks	=3D ARRAY_SIZE(mxc_imx93_clks),
> +	.events		=3D mxc_imx93_events,
> +	.num_events	=3D ARRAY_SIZE(mxc_imx93_events),
> +	.events_mask	=3D 0x500ff,
> +};
> +
> +static const struct of_device_id dwc_csi_device_of_match[] =3D {
> +	{ .compatible =3D "fsl,imx93-mipi-csi2", .data =3D &mxc_imx93_data },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, dwc_csi_device_of_match);
> +
> +static struct platform_driver dwc_csi_device_driver =3D {
> +	.driver =3D {
> +		.owner          =3D THIS_MODULE,
> +		.name           =3D DWC_MIPI_CSIS_DRIVER_NAME,
> +		.of_match_table =3D dwc_csi_device_of_match,
> +		.pm             =3D &dwc_csi_device_pm_ops,
> +	},
> +	.probe  =3D dwc_csi_device_probe,
> +	.remove =3D dwc_csi_device_remove,
> +};
> +
> +module_platform_driver(dwc_csi_device_driver);
> +
> +MODULE_DESCRIPTION("DesignWare Core MIPI CSI2 driver");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:" DWC_MIPI_CSIS_DRIVER_NAME);
> diff --git a/drivers/media/platform/nxp/dwc-mipi-csi2.h
> b/drivers/media/platform/nxp/dwc-mipi-csi2.h new file mode 100644
> index 000000000000..cdb85d867f22
> --- /dev/null
> +++ b/drivers/media/platform/nxp/dwc-mipi-csi2.h
> @@ -0,0 +1,289 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright 2023 NXP
> + */
> +
> +#ifndef __DWC_MIPI_CSI2_H__
> +#define __DWC_MIPI_CSI2_H__
> +
> +#include <linux/device.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-mc.h>
> +#include <media/v4l2-subdev.h>
> +
> +/* MIPI CSI-2 Host Controller Registers Define */
> +
> +/* Core Version */
> +#define CSI2RX_VERSION					0x0
> +
> +/* Number of Lanes */
> +#define CSI2RX_N_LANES					0x4
> +#define CSI2RX_N_LANES_N_LANES(x)			((x) & 0x7)
> +
> +/* Logic Reset */
> +#define CSI2RX_HOST_RESETN				0x8
> +#define CSI2RX_HOST_RESETN_ENABLE			BIT(0)
> +
> +/* Main Interrupt Status */
> +#define CSI2RX_INT_ST_MAIN				0xc
> +#define CSI2RX_INT_ST_MAIN_FATAL_ERR_IPI		BIT(18)
> +#define CSI2RX_INT_ST_MAIN_ERR_PHY			BIT(16)
> +#define CSI2RX_INT_ST_MAIN_ERR_ECC			BIT(7)
> +#define CSI2RX_INT_ST_MAIN_ERR_DID			BIT(6)
> +#define CSI2RX_INT_ST_MAIN_FATAL_ERR_PLD_CRC		BIT(5)
> +#define CSI2RX_INT_ST_MAIN_FATAL_ERR_CRC_FRAME		BIT(4)
> +#define CSI2RX_INT_ST_MAIN_FATAL_ERR_SEQ_FRAME		BIT(3)
> +#define CSI2RX_INT_ST_MAIN_FATAL_ERR_BNDRY_FRAMEL	BIT(2)
> +#define CSI2RX_INT_ST_MAIN_FATAL_ERR_PKT		BIT(1)
> +#define CSI2RX_INT_ST_MAIN_FATAL_ERR_PHY		BIT(0)
> +
> +/* PHY Shutdown */
> +#define CSI2RX_DPHY_SHUTDOWNZ				0x40
> +#define CSI2RX_DPHY_SHUTDOWNZ_ENABLE			BIT(0)
> +
> +/* DPHY Reset */
> +#define CSI2RX_DPHY_RSTZ				0x44
> +#define CSI2RX_DPHY_RSTZ_ENABLE				BIT(0)
> +
> +/* RX PHY Status */
> +#define CSI2RX_DPHY_RX_STATUS				0x48
> +#define CSI2RX_DPHY_RX_STATUS_CLK_LANE_HS		BIT(17)
> +#define CSI2RX_DPHY_RX_STATUS_CLK_LANE_ULP		BIT(16)
> +#define CSI2RX_DPHY_RX_STATUS_DATA_LANE1_ULP		BIT(1)
> +#define CSI2RX_DPHY_RX_STATUS_DATA_LANE0_ULP		BIT(0)
> +
> +/* STOP STATE PHY Status */
> +#define CSI2RX_DPHY_STOPSTATE				0x4c
> +#define CSI2RX_DPHY_STOPSTATE_CLK_LANE			BIT(16)
> +#define CSI2RX_DPHY_STOPSTATE_DATA_LANE1		BIT(1)
> +#define CSI2RX_DPHY_STOPSTATE_DATA_LANE0		BIT(0)
> +
> +/* DPHY Test and Control Interface 1 */
> +#define CSI2RX_DPHY_TEST_CTRL0				0x50
> +#define CSI2RX_DPHY_TEST_CTRL0_TEST_CLR			BIT(0)
> +#define CSI2RX_DPHY_TEST_CTRL0_TEST_CLKEN		BIT(1)
> +
> +/* DPHY Test and Control Interface 2 */
> +#define CSI2RX_DPHY_TEST_CTRL1				0x54
> +#define CSI2RX_DPHY_TEST_CTRL1_TEST_DIN(x)		((x) & 0xff)
> +#define CSI2RX_DPHY_TEST_CTRL1_TEST_DOUT(x)		(((x) & 0xff00)=20
>> 8)
> +#define CSI2RX_DPHY_TEST_CTRL1_TEST_EN			BIT(16)
> +
> +/* Pattern Generator vertical Resolution */
> +#define CSI2RX_PPI_PG_PATTERN_VRES			0x60
> +#define CSI2RX_PPI_PG_PATTERN_VRES_VRES(x)		((x) & 0xffff)
> +
> +/* Pattern Generator horizontal Resolution */
> +#define CSI2RX_PPI_PG_PATTERN_HRES			0x64
> +#define CSI2RX_PPI_PG_PATTERN_HRES_HRES(x)		((x) & 0xffff)
> +
> +/* Pattern Generator */
> +#define CSI2RX_PPI_PG_CONFIG				0x68
> +#define CSI2RX_PPI_PG_CONFIG_DATA_TYPE(x)		(((x) & 0x3f) <<=20
8)
> +#define CSI2RX_PPI_PG_CONFIG_VIR_CHAN(x)		(((x) & 0x3) <<=20
14)
> +#define CSI2RX_PPI_PG_CONFIG_VIR_CHAN_EX(x)		(((x) & 0x3) <<=20
16)
> +#define CSI2RX_PPI_PG_CONFIG_VIR_CHAN_EX_2_EN		BIT(18)
> +#define CSI2RX_PPI_PG_CONFIG_PG_MODE(x)			(x)
> +
> +/* Pattern Generator Enable */
> +#define CSI2RX_PPI_PG_ENABLE				0x6c
> +#define CSI2RX_PPI_PG_ENABLE_EN				BIT(0)
> +
> +/* Pattern Generator Status */
> +#define CSI2RX_PPI_PG_STATUS				0x70
> +#define CSI2RX_PPI_PG_STATUS_ACTIVE			BIT(0)
> +
> +/* IPI Mode */
> +#define CSI2RX_IPI_MODE					0x80
> +#define CSI2RX_IPI_MODE_ENABLE				BIT(24)
> +#define CSI2RX_IPI_MODE_CUT_THROUGH			BIT(16)
> +#define CSI2RX_IPI_MODE_COLOR_MODE16			BIT(8)
> +#define CSI2RX_IPI_MODE_CONTROLLER			BIT(1)
> +
> +/* IPI Virtual Channel */
> +#define CSI2RX_IPI_VCID					0x84
> +#define CSI2RX_IPI_VCID_VC(x)				((x)  &=20
0x3)
> +#define CSI2RX_IPI_VCID_VC_0_1(x)			(((x) & 0x3) <<=20
2)
> +#define CSI2RX_IPI_VCID_VC_2				BIT(4)
> +
> +/* IPI Data Type */
> +#define CSI2RX_IPI_DATA_TYPE				0x88
> +#define CSI2RX_IPI_DATA_TYPE_DT(x)			((x) & 0x3f)
> +#define CSI2RX_IPI_DATA_TYPE_EMB_DATA_EN		BIT(8)
> +
> +/* IPI Flush Memory */
> +#define CSI2RX_IPI_MEM_FLUSH				0x8c
> +#define CSI2RX_IPI_MEM_FLUSH_AUTO			BIT(8)
> +
> +/* IPI HSA */
> +#define CSI2RX_IPI_HSA_TIME				0x90
> +#define CSI2RX_IPI_HSA_TIME_VAL(x)			((x) & 0xfff)
> +
> +/* IPI HBP */
> +#define CSI2RX_IPI_HBP_TIME				0x94
> +#define CSI2RX_IPI_HBP_TIME_VAL(x)			((x) & 0xfff)
> +
> +/* IPI HSD */
> +#define CSI2RX_IPI_HSD_TIME				0x98
> +#define CSI2RX_IPI_HSD_TIME_VAL(x)			((x) & 0xfff)
> +
> +/* IPI HLINE */
> +#define CSI2RX_IPI_HLINE_TIME				0x9C
> +#define CSI2RX_IPI_HLINE_TIME_VAL(x)			((x) & 0x3fff)
> +
> +/* IPI Soft Reset */
> +#define CSI2RX_IPI_SOFTRSTN				0xa0
> +
> +/* IPI Advanced Features */
> +#define CSI2RX_IPI_ADV_FEATURES				0xac
> +#define CSI2RX_IPI_ADV_FEATURES_SYNC_EVENT_MODE		BIT(24)
> +#define CSI2RX_IPI_ADV_FEATURES_SYNC_EMBEDDED_PKT	BIT(21)
> +#define CSI2RX_IPI_ADV_FEATURES_SYNC_BLANKING_PKT	BIT(20)
> +#define CSI2RX_IPI_ADV_FEATURES_SYNC_NULL_PKT		BIT(19)
> +#define CSI2RX_IPI_ADV_FEATURES_SYNC_LS_PKT		BIT(18)
> +#define CSI2RX_IPI_ADV_FEATURES_SYNC_VIDEO_PKT		BIT(17)
> +#define CSI2RX_IPI_ADV_FEATURES_LINE_EVENT_SEL		BIT(16)
> +#define CSI2RX_IPI_ADV_FEATURES_DT_OVER_WRITE(x)	(((x) & 0x3f) << 8)
> +#define CSI2RX_IPI_ADV_FEATURES_DT_OVER_WRITE_EN	BIT(0)
> +
> +/* IPI VSA */
> +#define CSI2RX_IPI_VSA_LINES				0xb0
> +#define CSI2RX_IPI_VSA_LINES_VAL(x)			((x) & 0x3ff)
> +
> +/* IPI VBP */
> +#define CSI2RX_IPI_VBP_LINES				0xb4
> +#define CSI2RX_IPI_VBP_LINES_VAL(x)			((x) & 0x3ff)
> +
> +/* IPI VFP */
> +#define CSI2RX_IPI_VFP_LINES				0xb8
> +#define CSI2RX_IPI_VFP_LINES_VAL(x)			((x) & 0x3ff)
> +
> +/* IPI VACTIVE */
> +#define CSI2RX_IPI_VACTIVE_LINES			0xbc
> +#define CSI2RX_IPI_VACTIVE_LINES_VAL(x)			((x) &=20
0x3fff)
> +
> +/* Fatal Interruption Caused by PHY */
> +#define CSI2RX_INT_ST_DPHY_FATAL			0xe0
> +#define CSI2RX_INT_ST_DPHY_FATAL_ERR_SOT_LANE1		BIT(1)
> +#define CSI2RX_INT_ST_DPHY_FATAL_ERR_SOT_LANE0		BIT(0)
> +
> +/* Mask for Fatal Interruption Caused by PHY */
> +#define CSI2RX_INT_MSK_DPHY_FATAL			0xe4
> +#define CSI2RX_INT_MSK_DPHY_FATAL_ERR_SOT_LANE1		BIT(1)
> +#define CSI2RX_INT_MSK_DPHY_FATAL_ERR_SOT_LANE0		BIT(0)
> +
> +/* Force for Fatal Interruption Caused by PHY */
> +#define CSI2RX_INT_FORCE_DPHY_FATAL			0xe8
> +
> +/* Fatal Interruption Caused During Packet Construction */
> +#define CSI2RX_INT_ST_PKT_FATAL			0xf0
> +#define CSI2RX_INT_ST_PKT_FATAL_ERR_PAYLOAD		BIT(1)
> +#define CSI2RX_INT_ST_PKT_FATAL_ERR_ECC		BIT(0)
> +
> +/* Mask for Fatal Interruption Caused During Packet Construction */
> +#define CSI2RX_INT_MSK_PKT_FATAL			0xf4
> +#define CSI2RX_INT_MSK_PKT_FATAL_ERR_PAYLOAD		BIT(1)
> +#define CSI2RX_INT_MSK_PKT_FATAL_ERR_ECC		BIT(0)
> +
> +/* Force for Fatal Interruption Caused During Packet Construction */
> +#define CSI2RX_INT_FORCE_PKT_FATAL			0xf8
> +
> +/* Interruption Caused by PHY */
> +#define CSI2RX_INT_ST_DPHY				0x110
> +#define CSI2RX_INT_ST_DPHY_ERR_ESC_LANE1		BIT(17)
> +#define CSI2RX_INT_ST_DPHY_ERR_ESC_LANE0		BIT(16)
> +#define CSI2RX_INT_ST_DPHY_ERR_SOT_LANE1		BIT(1)
> +#define CSI2RX_INT_ST_DPHY_ERR_SOT_LANE0		BIT(0)
> +
> +/* Mask for Interruption Caused by PHY */
> +#define CSI2RX_INT_MSK_DPHY				0x114
> +#define CSI2RX_INT_MSK_DPHY_ESC_ERR_LANE1		BIT(17)
> +#define CSI2RX_INT_MSK_DPHY_ESC_ERR_LANE0		BIT(16)
> +#define CSI2RX_INT_MSK_DPHY_SOT_ERR_LANE1		BIT(1)
> +#define CSI2RX_INT_MSK_DPHY_SOT_ERR_LANE0		BIT(0)
> +
> +/* Force for Interruption Caused by PHY */
> +#define CSI2RX_INT_FORCE_DPHY				0x118
> +
> +/* Fatal Interruption Caused by IPI Interface */
> +#define CSI2RX_INT_ST_IPI_FATAL			0x140
> +#define CSI2RX_INT_ST_IPI_FATAL_ERR_PD_FIFO_OVERFLOW	BIT(6)
> +#define CSI2RX_INT_ST_IPI_FATAL_ERR_FIFO_OVERFLOW	BIT(5)
> +#define CSI2RX_INT_ST_IPI_FATAL_ERR_HLINE_TIME		BIT(4)
> +#define CSI2RX_INT_ST_IPI_FATAL_ERR_FIFO_NOT_EMPTY	BIT(3)
> +#define CSI2RX_INT_ST_IPI_FATAL_ERR_FRAME_SYNC		BIT(2)
> +#define CSI2RX_INT_ST_IPI_FATAL_ERR_IF_FIFO_OVERFLOW	BIT(1)
> +#define CSI2RX_INT_ST_IPI_FATAL_ERR_IF_FIFO_UNDERFLOW	BIT(0)
> +
> +/* Mask for Fatal Interruption Caused by IPI Interface */
> +#define CSI2RX_INT_MSK_IPI_FATAL			0x144
> +#define CSI2RX_INT_MSK_IPI_FATAL_ERR_PD_FIFO_OVERFLOW	BIT(6)
> +#define CSI2RX_INT_MSK_IPI_FATAL_ERR_FIFO_OVERFLOW	BIT(5)
> +#define CSI2RX_INT_MSK_IPI_FATAL_ERR_HLINE_TIME		BIT(4)
> +#define CSI2RX_INT_MSK_IPI_FATAL_ERR_FIFO_NOT_EMPTY	BIT(3)
> +#define CSI2RX_INT_MSK_IPI_FATAL_ERR_FRAME_SYNC		BIT(2)
> +#define CSI2RX_INT_MSK_IPI_FATAL_ERR_IF_FIFO_OVERFLOW	BIT(1)
> +#define CSI2RX_INT_MSK_IPI_FATAL_ERR_IF_FIFO_UNDERFLOW	BIT(0)
> +
> +/* Force for Fatal Interruption Caused by IPI Interface */
> +#define CSI2RX_INT_FORCE_IPI_FATAL			0x148
> +
> +/* Data De-Scrambling */
> +#define CSI2RX_SCRAMBLING				0x300
> +
> +/* De-scrambler Seed for Lane 1 */
> +#define CSI2RX_SCRAMBLING_SEED1				0x304
> +
> +/* De-scrambler Seed for Lane 2 */
> +#define CSI2RX_SCRAMBLING_SEED2				0x308
> +
> +#define dwc_csi_write(csidev, reg, val)	writel((val), csidev->regs=20
+ (reg))
> +#define dwc_csi_read(csidev, reg)	readl(csidev->regs + (reg))
> +
> +#define DWC_CSI2RX_PAD_SINK		0
> +#define DWC_CSI2RX_PAD_SOURCE		1
> +#define DWC_CSI2RX_PADS_NUM		2
> +
> +struct dwc_csi_device {
> +	struct device *dev;
> +	void __iomem *regs;
> +	struct clk_bulk_data *clks;
> +	const struct dwc_csi_plat_data *pdata;
> +
> +	struct v4l2_subdev sd;
> +	struct v4l2_async_notifier notifier;
> +	struct v4l2_subdev *sensor_sd;
> +	struct media_pad pads[DWC_CSI2RX_PADS_NUM];
> +	u16 remote_pad;
> +
> +	struct v4l2_mbus_config_mipi_csi2 bus;
> +	u32 cfgclkfreqrange;
> +	u32 hsfreqrange;
> +
> +	spinlock_t slock;	/* Protect events */
> +	struct mutex lock;
> +
> +	struct dwc_csi_event *events;
> +	const struct dwc_csi_pix_format *csi_fmt;
> +	struct v4l2_mbus_framefmt format_mbus[DWC_CSI2RX_PADS_NUM];
> +
> +	/* Used for pattern generator */
> +	bool pg_enable;
> +	bool pg_active;
> +	enum {
> +		PATTERN_VERTICAL,
> +		PATTERN_HORIZONTAL,
> +	} pg_pattern;
> +};
> +
> +void dphy_rx_reset(struct dwc_csi_device *csidev);
> +void dphy_rx_test_code_reset(struct dwc_csi_device *csidev);
> +void dphy_rx_test_code_config(struct dwc_csi_device *csidev);
> +void dphy_rx_power_off(struct dwc_csi_device *csidev);
> +void dphy_rx_test_code_dump(struct dwc_csi_device *csidev);
> +
> +#endif /* __DWC_MIPI_CSI2_H__ */
> diff --git a/drivers/media/platform/nxp/dwc-mipi-dphy.c
> b/drivers/media/platform/nxp/dwc-mipi-dphy.c new file mode 100644
> index 000000000000..cc443f282bb7
> --- /dev/null
> +++ b/drivers/media/platform/nxp/dwc-mipi-dphy.c
> @@ -0,0 +1,195 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2023 NXP
> + */
> +
> +#include "dwc-mipi-csi2.h"
> +
> +/*
> + * DPHY testcode used to configure Rx DPHY
> + */
> +
> +/* System configuration 0 */
> +#define DPHY_RX_SYS_0					0x01
> +#define HSFREQRANGE_OVR_EN_RW				BIT(5)
> +
> +/* System configuration 1 */
> +#define DPHY_RX_SYS_1					0x02
> +#define HSFREQRANGE_OVR_RW(x)				((x) &=20
0x7F)
> +#define TIMEBASE_OVR_EN_RW				BIT(7)
> +
> +/* System configuration 2 */
> +#define DPHY_RX_SYS_2					0x03
> +#define TIMEBASE_OVR_RW(x)				((x) & 0xFF)
> +
> +static inline void dphy_rx_test_ctrl_set(struct dwc_csi_device *csidev,
> +					 u32 offset, u32 mask, u32=20
code)
> +{
> +	u32 val;
> +
> +	val =3D dwc_csi_read(csidev, offset);
> +	val &=3D ~(mask);
> +	val |=3D code;
> +	dwc_csi_write(csidev, offset, val);
> +}
> +
> +static inline void dphy_rx_test_ctrl_clr(struct dwc_csi_device *csidev,
> +					 u32 offset, u32 code)
> +{
> +	u32 val;
> +
> +	val =3D dwc_csi_read(csidev, offset);
> +	val &=3D ~(code);
> +	dwc_csi_write(csidev, offset, val);
> +}
> +
> +static u8 dphy_rx_test_ctrl_get(struct dwc_csi_device *csidev, u32 offse=
t)
> +{
> +	u32 val;
> +
> +	val =3D dwc_csi_read(csidev, offset);
> +	val =3D CSI2RX_DPHY_TEST_CTRL1_TEST_DOUT(val);
> +
> +	return (u8)val;
> +}
> +static void dphy_rx_write(struct dwc_csi_device *csidev, u8 addr, u8 val=
ue)
> +{
> +	u32 val;
> +
> +	/*
> +	 * Set PHY_TST_CTRL1, bit[16] and write PHY_TST_CTRL1,
> +	 * bit[7:0] with test code address
> +	 */
> +	val =3D CSI2RX_DPHY_TEST_CTRL1_TEST_EN;
> +	val |=3D CSI2RX_DPHY_TEST_CTRL1_TEST_DIN(addr);
> +	dphy_rx_test_ctrl_set(csidev, CSI2RX_DPHY_TEST_CTRL1, 0x100ff, val);
> +
> +	/*
> +	 * Set and clear PHY_TST_CTRL0, bit[1]
> +	 */
> +	val =3D CSI2RX_DPHY_TEST_CTRL0_TEST_CLKEN;
> +	dphy_rx_test_ctrl_set(csidev, CSI2RX_DPHY_TEST_CTRL0, 0x2, val);
> +	dphy_rx_test_ctrl_clr(csidev, CSI2RX_DPHY_TEST_CTRL0, val);
> +
> +	/*
> +	 * Write PHY_TST_CTRL1, bit[7:0] with test code content
> +	 */
> +	val =3D CSI2RX_DPHY_TEST_CTRL1_TEST_DIN(value);
> +	dphy_rx_test_ctrl_set(csidev, CSI2RX_DPHY_TEST_CTRL1, 0xff, val);
> +
> +	/*
> +	 * Clear PHY_TST_CTRL1, bit[16]
> +	 */
> +	val =3D CSI2RX_DPHY_TEST_CTRL1_TEST_EN;
> +	dphy_rx_test_ctrl_clr(csidev, CSI2RX_DPHY_TEST_CTRL1, val);
> +
> +	/*
> +	 * Set and clear PHY_TST_CTRL0, bit[1]
> +	 */
> +	val =3D CSI2RX_DPHY_TEST_CTRL0_TEST_CLKEN;
> +	dphy_rx_test_ctrl_set(csidev, CSI2RX_DPHY_TEST_CTRL0, 0x2, val);
> +	dphy_rx_test_ctrl_clr(csidev, CSI2RX_DPHY_TEST_CTRL0, val);
> +}
> +
> +static int dphy_rx_read(struct dwc_csi_device *csidev, u8 addr)
> +{
> +	u32 val;
> +
> +	/*
> +	 * Set PHY_TST_CTRL1, bit[16] and write PHY_TST_CTRL1,
> +	 * bit[7:0] with test code address
> +	 */
> +	val =3D CSI2RX_DPHY_TEST_CTRL1_TEST_EN;
> +	val |=3D CSI2RX_DPHY_TEST_CTRL1_TEST_DIN(addr);
> +	dphy_rx_test_ctrl_set(csidev, CSI2RX_DPHY_TEST_CTRL1, 0x100ff, val);
> +
> +	/* Set and clear PHY_TST_CTRL0, bit[1] */
> +	val =3D CSI2RX_DPHY_TEST_CTRL0_TEST_CLKEN;
> +	dphy_rx_test_ctrl_set(csidev, CSI2RX_DPHY_TEST_CTRL0, 0x2, val);
> +	dphy_rx_test_ctrl_clr(csidev, CSI2RX_DPHY_TEST_CTRL0, val);
> +
> +	/* Read PHY_TST_CTRL1, bit[15:8] with the test code content */
> +	val =3D dphy_rx_test_ctrl_get(csidev, CSI2RX_DPHY_TEST_CTRL1);
> +
> +	/* Clear PHY_TST_CTRL1, bit[16] */
> +	dphy_rx_test_ctrl_clr(csidev, CSI2RX_DPHY_TEST_CTRL1,
> +				CSI2RX_DPHY_TEST_CTRL1_TEST_EN);
> +
> +	return val;
> +}
> +
> +void dphy_rx_reset(struct dwc_csi_device *csidev)
> +{
> +	dwc_csi_write(csidev, CSI2RX_DPHY_RSTZ, 0x0);
> +	dwc_csi_write(csidev, CSI2RX_DPHY_SHUTDOWNZ, 0x0);
> +	ndelay(15);
> +
> +	dwc_csi_write(csidev, CSI2RX_DPHY_SHUTDOWNZ, 0x1);
> +	ndelay(5);
> +	dwc_csi_write(csidev, CSI2RX_DPHY_RSTZ, 0x1);
> +}
> +
> +void dphy_rx_test_code_reset(struct dwc_csi_device *csidev)
> +{
> +	u32 val;
> +
> +	/* Set PHY_TST_CTRL0, bit[0] */
> +	val =3D dwc_csi_read(csidev, CSI2RX_DPHY_TEST_CTRL0);
> +	val |=3D CSI2RX_DPHY_TEST_CTRL0_TEST_CLR;
> +	dwc_csi_write(csidev, CSI2RX_DPHY_TEST_CTRL0, val);
> +
> +	/* Clear PHY_TST_CTRL0, bit[0] */
> +	val =3D dwc_csi_read(csidev, CSI2RX_DPHY_TEST_CTRL0);
> +	val &=3D ~CSI2RX_DPHY_TEST_CTRL0_TEST_CLR;
> +	dwc_csi_write(csidev, CSI2RX_DPHY_TEST_CTRL0, val);
> +}
> +
> +void dphy_rx_test_code_config(struct dwc_csi_device *csidev)
> +{
> +	u32 val;
> +	u8 dphy_val;
> +
> +	/* Set testclr=3D1'b0 */
> +	val =3D dwc_csi_read(csidev, CSI2RX_DPHY_TEST_CTRL0);
> +	val &=3D ~CSI2RX_DPHY_TEST_CTRL0_TEST_CLR;
> +	dwc_csi_write(csidev, CSI2RX_DPHY_TEST_CTRL0, val);
> +
> +	/* Enable hsfreqrange_ovr_en and set hsfreqrange */
> +	dphy_rx_write(csidev, DPHY_RX_SYS_0, HSFREQRANGE_OVR_EN_RW);
> +	dphy_rx_write(csidev, DPHY_RX_SYS_1,
> +		      HSFREQRANGE_OVR_RW(csidev->hsfreqrange));
> +
> +	/* Enable timebase_ovr_en */
> +	dphy_val =3D dphy_rx_read(csidev, DPHY_RX_SYS_1);
> +	dphy_val |=3D TIMEBASE_OVR_EN_RW;
> +	dphy_rx_write(csidev, DPHY_RX_SYS_1, dphy_val);
> +
> +	/* Set cfgclkfreqrange */
> +	dphy_rx_write(csidev, DPHY_RX_SYS_2,
> +		      TIMEBASE_OVR_RW(csidev->cfgclkfreqrange + 0x44));

RM Rev 2. mentions that depending on cfgclkfreqrange another configuration,=
=20
called counter_for_des_en_config_if, also needs to be set. Is this missing=
=20
here?

> +}
> +
> +void dphy_rx_power_off(struct dwc_csi_device *csidev)
> +{
> +	dwc_csi_write(csidev, CSI2RX_DPHY_RSTZ, 0x0);
> +	dwc_csi_write(csidev, CSI2RX_DPHY_SHUTDOWNZ, 0x0);
> +}
> +
> +void dphy_rx_test_code_dump(struct dwc_csi_device *csidev)
> +{
> +#define DPHY_DEBUG_REG(name)		{name, #name}
> +	static const struct {
> +		u32 offset;
> +		const char * const name;
> +	} test_codes[] =3D {
> +		DPHY_DEBUG_REG(DPHY_RX_SYS_0),
> +		DPHY_DEBUG_REG(DPHY_RX_SYS_1),
> +		DPHY_DEBUG_REG(DPHY_RX_SYS_2),
> +	};
> +	unsigned int i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(test_codes); i++)
> +		dev_dbg(csidev->dev, "%14s[0x%02x]: 0x%02x\n",
> +			test_codes[i].name, test_codes[i].offset,
> +			dphy_rx_read(csidev, test_codes[i].offset));
> +}

Could you also provide a complete DT configuration? I tried myself, but I j=
ust=20
ended up in getting errors while trying to use a MIPI-CSI camera
dwc-mipi-csi2 4ae00000.mipi-csi: IPI Interface Fatal Error events: 2800064
dwc-mipi-csi2 4ae00000.mipi-csi: PHY Error events: 2174
dwc-mipi-csi2 4ae00000.mipi-csi: IPI Interface Fatal Error events: 2800064
dwc-mipi-csi2 4ae00000.mipi-csi: PHY Error events: 2174

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


