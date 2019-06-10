Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 460DD3B327
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2019 12:28:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389412AbfFJK2S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jun 2019 06:28:18 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:37392 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389277AbfFJK2R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jun 2019 06:28:17 -0400
Received: by mail-wm1-f66.google.com with SMTP id 22so7620446wmg.2;
        Mon, 10 Jun 2019 03:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version:content-transfer-encoding;
        bh=7m8Bu7lB4ksYeqfRRC/lPM6W8s5DmEJuKn8IqoNFhQw=;
        b=tBDV51glZGanQgxTrzVO0gB6qKNLNtHFVJzlIdOXKGFCpw7T2XTusKAcqq5pAPTZAV
         T6CwrZ2oBTDEfeBXhPbGHmcpWOZs6QTbrqEv638tstP43CPTIdgyI41jQmDrxkqKexUU
         PB+xRjdPYhQmXn4iaBf36w0LvmNDU8/8osT9T5NNys5zD+/3v+tag4dVgO8yKRUr59K4
         Yo93vCwOp0HnDL7ooheDNURFFjUecG1drH7yqU4z8fUD6JLePi+D8Ucl1MqXjiyvR8bN
         e7HApf+oVcNBzoZYrjDHSi8Kxy4eKs9VeP/L1UuHL+l0m9zwz0btnfIUxobuQx6kNaO8
         Bb5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
        bh=7m8Bu7lB4ksYeqfRRC/lPM6W8s5DmEJuKn8IqoNFhQw=;
        b=TcgAlBFLImgyfhpdltZKIRfbo50jBOgUb4Q6Zf/RhdKXI5hmmWz/qAjx8o5zgHV5hW
         Q8YfXplsJOCwoe9ZfXXenriihCmPLuz8IpkERzP9ttvqpJIpb4oiscgBDuc6WLIr3C2c
         uwb0q8vVmO/oxOX0L7YabD8CVlOT7nb7W9kG5aHlo2UYAXcbKPuT5ClhPjJ6Zu6JVpgw
         gjASdz4mefZfTh4EPAqdp/qwRoOAqxVUiblET5ZlASZAdZktOiygwOrKF+nbDMISlzo+
         uTYRzLgUUqaOXLDHMWZ/e7Dk/AgEdVKvNwT7TwXMQ+fRaB+93gUSngnPHzjoXWDTq/jZ
         HtBQ==
X-Gm-Message-State: APjAAAXonoCNcMRaz5liA+kbVWUHOofdFzJGcjI1rTppkdz5oRv31Vm5
        zgBIn8UOHar1Jpd/IAY72u8=
X-Google-Smtp-Source: APXvYqz1+ua/jKrobyjGWLS/odDhaaFrpS9jOQgWwoi1byT+KHk9e6DZ6ewbswDaW86v2EWAQi4f6g==
X-Received: by 2002:a7b:cc93:: with SMTP id p19mr8190437wma.12.1560162494535;
        Mon, 10 Jun 2019 03:28:14 -0700 (PDT)
Received: from arch-late ([87.196.73.9])
        by smtp.gmail.com with ESMTPSA id z5sm8466932wma.36.2019.06.10.03.28.12
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 10 Jun 2019 03:28:13 -0700 (PDT)
References: <20190606153825.8183-1-sebastien.szymanski@armadeus.com> <20190606153825.8183-2-sebastien.szymanski@armadeus.com>
User-agent: mu4e 1.2.0; emacs 27.0.50
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     =?utf-8?Q?S=C3=A9bastien?= Szymanski 
        <sebastien.szymanski@armadeus.com>
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 2/3] media: imx7-media-csi: add i.MX6UL support
In-reply-to: <20190606153825.8183-2-sebastien.szymanski@armadeus.com>
Date:   Mon, 10 Jun 2019 11:28:06 +0100
Message-ID: <m34l4xpweh.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sebastien,
Thanks for the patch.

On Thu 06 Jun 2019 at 16:38, S=C3=A9bastien Szymanski wrote:
> i.MX7 and i.MX6UL/L have the same CSI controller. So add i.MX6UL/L support
> to imx7-media-csi driver.
>
> Signed-off-by: S=C3=A9bastien Szymanski <sebastien.szymanski@armadeus.com>
> ---
>
> Changes for v2:
>  - rebase on top of linuxtv/master
>  - mention i.MX6UL/L in header and Kconfig help text
>  - rename csi_type to csi_soc_id
>
>  drivers/staging/media/imx/Kconfig          |  4 +-
>  drivers/staging/media/imx/imx7-media-csi.c | 62 ++++++++++++++++------
>  2 files changed, 49 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/staging/media/imx/Kconfig b/drivers/staging/media/im=
x/Kconfig
> index ad3d7df6bb3c..8b6dc42c39e0 100644
> --- a/drivers/staging/media/imx/Kconfig
> +++ b/drivers/staging/media/imx/Kconfig
> @@ -22,11 +22,11 @@ config VIDEO_IMX_CSI
>  	  A video4linux camera sensor interface driver for i.MX5/6.
>
>  config VIDEO_IMX7_CSI
> -	tristate "i.MX7 Camera Sensor Interface driver"
> +	tristate "i.MX6UL/L / i.MX7 Camera Sensor Interface driver"
>  	depends on VIDEO_IMX_MEDIA && VIDEO_DEV && I2C
>  	default y
>  	help
>  	  Enable support for video4linux camera sensor interface driver for
> -	  i.MX7.
> +	  i.MX6UL/L or i.MX7.
>  endmenu
>  endif
> diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging=
/media/imx/imx7-media-csi.c
> index 9101566f3f67..902bdce594cf 100644
> --- a/drivers/staging/media/imx/imx7-media-csi.c
> +++ b/drivers/staging/media/imx/imx7-media-csi.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * V4L2 Capture CSI Subdev for Freescale i.MX7 SOC
> + * V4L2 Capture CSI Subdev for Freescale i.MX6UL/L / i.MX7 SOC
>   *
>   * Copyright (c) 2019 Linaro Ltd
>   *
> @@ -152,6 +152,11 @@
>  #define CSI_CSICR18		0x48
>  #define CSI_CSICR19		0x4c
>
> +enum csi_soc_id {
> +	IMX7,
> +	IMX6UL
> +};
> +
>  struct imx7_csi {
>  	struct device *dev;
>  	struct v4l2_subdev sd;
> @@ -191,6 +196,7 @@ struct imx7_csi {
>  	bool is_init;
>  	bool is_streaming;
>  	bool is_csi2;
> +	enum csi_soc_id soc_id;
>
>  	struct completion last_eof_completion;
>  };
> @@ -548,6 +554,14 @@ static int imx7_csi_pad_link_validate(struct v4l2_su=
bdev *sd,
>  	if (ret)
>  		return ret;
>
> +	if (csi->soc_id =3D=3D IMX6UL) {
> +		mutex_lock(&csi->lock);
> +		csi->is_csi2 =3D false;
> +		mutex_unlock(&csi->lock);
> +
> +		return 0;
> +	}
> +
>  	ret =3D imx7_csi_get_upstream_endpoint(csi, &upstream_ep, true);
>  	if (ret) {
>  		v4l2_err(&csi->sd, "failed to find upstream endpoint\n");
> @@ -757,6 +771,7 @@ static int imx7_csi_configure(struct imx7_csi *csi)
>  	struct v4l2_pix_format *out_pix =3D &vdev->fmt.fmt.pix;
>  	__u32 in_code =3D csi->format_mbus[IMX7_CSI_PAD_SINK].code;
>  	u32 cr1, cr18;
> +	int width =3D out_pix->width;
>
>  	if (out_pix->field =3D=3D V4L2_FIELD_INTERLACED) {
>  		imx7_csi_deinterlace_enable(csi, true);
> @@ -766,15 +781,27 @@ static int imx7_csi_configure(struct imx7_csi *csi)
>  		imx7_csi_buf_stride_set(csi, 0);
>  	}
>
> -	imx7_csi_set_imagpara(csi, out_pix->width, out_pix->height);
> +	cr18 =3D imx7_csi_reg_read(csi, CSI_CSICR18);
> +
> +	if (!csi->is_csi2) {
> +		if (out_pix->pixelformat =3D=3D V4L2_PIX_FMT_UYVY ||
> +		    out_pix->pixelformat =3D=3D V4L2_PIX_FMT_YUYV)
> +			width *=3D 2;
> +
> +		imx7_csi_set_imagpara(csi, width, out_pix->height);
> +
> +		cr18 |=3D (BIT_BASEADDR_SWITCH_EN | BIT_BASEADDR_SWITCH_SEL |
> +			BIT_BASEADDR_CHG_ERR_EN);
> +		imx7_csi_reg_write(csi, cr18, CSI_CSICR18);
>
> -	if (!csi->is_csi2)
>  		return 0;
> +	}
> +
> +	imx7_csi_set_imagpara(csi, width, out_pix->height);
>
>  	cr1 =3D imx7_csi_reg_read(csi, CSI_CSICR1);
>  	cr1 &=3D ~BIT_GCLK_MODE;
>
> -	cr18 =3D imx7_csi_reg_read(csi, CSI_CSICR18);
>  	cr18 &=3D BIT_MIPI_DATA_FORMAT_MASK;
>  	cr18 |=3D BIT_DATA_FROM_MIPI;
>
> @@ -809,11 +836,9 @@ static void imx7_csi_enable(struct imx7_csi *csi)
>  {
>  	imx7_csi_sw_reset(csi);
>
> -	if (csi->is_csi2) {
> -		imx7_csi_dmareq_rff_enable(csi);
> -		imx7_csi_hw_enable_irq(csi);
> -		imx7_csi_hw_enable(csi);
> -	}
> +	imx7_csi_dmareq_rff_enable(csi);
> +	imx7_csi_hw_enable_irq(csi);
> +	imx7_csi_hw_enable(csi);
>  }
>
>  static void imx7_csi_disable(struct imx7_csi *csi)
> @@ -1166,19 +1191,32 @@ static int imx7_csi_parse_endpoint(struct device =
*dev,
>  	return fwnode_device_is_available(asd->match.fwnode) ? 0 : -EINVAL;
>  }
>
> +static const struct of_device_id imx7_csi_of_match[] =3D {
> +	{ .compatible =3D "fsl,imx7-csi", .data =3D (void *)IMX7 },
> +	{ .compatible =3D "fsl,imx6ul-csi", .data =3D (void *)IMX6UL },

looking at this again I think we can do this is a different way.
Instead data being the soc_id, just set here if it is_csi2 or not.

This would avoid to add a soc_id  to the struct that it really it
is used only to setup the is_csi2 var. I think this will make this
patch a lot simpler.

> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, imx7_csi_of_match);
> +
>  static int imx7_csi_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
>  	struct device_node *node =3D dev->of_node;
>  	struct imx_media_dev *imxmd;
>  	struct imx7_csi *csi;
> +	const struct of_device_id *of_id;
>  	int ret;
>
> +	of_id =3D of_match_node(imx7_csi_of_match, node);

With the above said, here I think we can use the of_match_device?

hope this makes sense also to you.

Once again thanks for the patches.

---
Cheers,
        Rui

> +	if (!of_id)
> +		return -ENODEV;
> +
>  	csi =3D devm_kzalloc(&pdev->dev, sizeof(*csi), GFP_KERNEL);
>  	if (!csi)
>  		return -ENOMEM;
>
>  	csi->dev =3D dev;
> +	csi->soc_id =3D (enum csi_soc_id)of_id->data;
>
>  	csi->mclk =3D devm_clk_get(&pdev->dev, "mclk");
>  	if (IS_ERR(csi->mclk)) {
> @@ -1294,12 +1332,6 @@ static int imx7_csi_remove(struct platform_device =
*pdev)
>  	return 0;
>  }
>
> -static const struct of_device_id imx7_csi_of_match[] =3D {
> -	{ .compatible =3D "fsl,imx7-csi" },
> -	{ },
> -};
> -MODULE_DEVICE_TABLE(of, imx7_csi_of_match);
> -
>  static struct platform_driver imx7_csi_driver =3D {
>  	.probe =3D imx7_csi_probe,
>  	.remove =3D imx7_csi_remove,

