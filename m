Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E39237DF6F
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2019 17:50:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730835AbfHAPu1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Aug 2019 11:50:27 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39529 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726654AbfHAPu1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Aug 2019 11:50:27 -0400
Received: by mail-wr1-f68.google.com with SMTP id x4so20973960wrt.6;
        Thu, 01 Aug 2019 08:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version:content-transfer-encoding;
        bh=MdD3yVftBwNWkd7YK5mpx8hpnNaO44neO5nfkst92qA=;
        b=nTR0aPMcbDKv5QlZWvAmqmaRyIxcWeuPi5tVIgtY1YtjK5VNl4wwvtwdZqBvnJE3NX
         AC7s3L2HM4AMXaL4qbTRAkhdDNzpbOj/ufbcAbAN+ieycxTQF8U+SltTeQTIRYSewwrW
         Ux5YRDoeugjvk3dn7bgKhaou4N3Ka/DnX7Ne5wyxHdKWT96a9epVraOkS1NuTJeDOBhS
         NzxxWEwJns9NHtPbTfNues19ke7+bGj91zmAQ9xVcyoA1vunpJQghgZHhLiFsy58aYv9
         soFz4694czeiLZvOREbM1wA1WKqKD+jG5tg6XWP/+RVxtTIgmUSUk3Pmxju1QZp4c12d
         vIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
        bh=MdD3yVftBwNWkd7YK5mpx8hpnNaO44neO5nfkst92qA=;
        b=exUKkxNzOXI318x0bX3MkeLM9BzTKwIvQiTDLnGVeIAInPRAA4kqh+oZf70qvWlCpN
         JjwV2CyTtvsN8ZOLiskzwwa1DuZlpr0Dap+j69jVdGTJwb0B5l3uyzEwx9CtGlXOmx2t
         xkkC8+Rgytsj/yijcw7942EVC/AHSQ11uYX0GTiI1It3kUo1a1EizjSrPaku97x6rxat
         AzhQohvDCAfozzMa02c/u/7DCVqcfnqnc0llLquDgKFUJsMc/Jv5NiskvQ+YTQrl0XBR
         Nw4PypSYOUIVzitZELhUIelWIXxyziMNWskPxh7+Zu4Q5Kilv+IVEwaMhqNiUyMQT0+H
         iCCg==
X-Gm-Message-State: APjAAAVlHqTmMOSrtMnFUnGzOrBhzl5fF0o11gKcBmg7ec15UPgfGLTe
        lXI+7wPQIaKhNtgeqKtQrdTSEUYG5m4=
X-Google-Smtp-Source: APXvYqwfes83IZco8VCmVHkM+VIu8RJ68J3JBXtZmqlQFPT28fxlRhF9j3I0aZfyzMoxrCr0UHJQsQ==
X-Received: by 2002:adf:f204:: with SMTP id p4mr22834294wro.317.1564674624623;
        Thu, 01 Aug 2019 08:50:24 -0700 (PDT)
Received: from arch-late (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id y12sm66278221wrm.79.2019.08.01.08.50.22
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 01 Aug 2019 08:50:23 -0700 (PDT)
References: <20190731163330.32532-1-sebastien.szymanski@armadeus.com>
User-agent: mu4e 1.2.0; emacs 27.0.50
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     =?utf-8?Q?S=C3=A9bastien?= Szymanski 
        <sebastien.szymanski@armadeus.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org
Subject: Re: [PATCH v3 2/3] media: imx7-media-csi: add i.MX6UL support
In-reply-to: <20190731163330.32532-1-sebastien.szymanski@armadeus.com>
Date:   Thu, 01 Aug 2019 16:50:22 +0100
Message-ID: <m31ry4c2bl.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sebastien,
Thanks for the patch.

On Wed 31 Jul 2019 at 17:33, S=C3=A9bastien Szymanski wrote:
> i.MX7 and i.MX6UL/L have the same CSI controller. So add i.MX6UL/L support
> to imx7-media-csi driver.
>
> Signed-off-by: S=C3=A9bastien Szymanski <sebastien.szymanski@armadeus.com>
>

LGTM. Thanks for adding the support to this imx6ul/l soc.

Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

---
Cheers,
	Rui

> ---
>
> Changes for v3:
> - rebase on Linux v5.3-rc2
> - remove csi_soc_id var as it's not needed anymore thanks to commit
>   e0c76a7d3428 ("media: imx7-media-csi: get csi upstream endpoint")
>
> Changes for v2:
>  - rebase on top of linuxtv/master
>  - mention i.MX6UL/L in header and Kconfig help text
>  - rename csi_type to csi_soc_id
>
>  drivers/staging/media/imx/Kconfig          |  4 +--
>  drivers/staging/media/imx/imx7-media-csi.c | 30 +++++++++++++++-------
>  2 files changed, 23 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/staging/media/imx/Kconfig b/drivers/staging/media/im=
x/Kconfig
> index 4c726345dc25..f51476243016 100644
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
> index 500b4c08d967..4ca79ff4c9b3 100644
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
> @@ -765,6 +765,7 @@ static int imx7_csi_configure(struct imx7_csi *csi)
>  	struct v4l2_pix_format *out_pix =3D &vdev->fmt.fmt.pix;
>  	__u32 in_code =3D csi->format_mbus[IMX7_CSI_PAD_SINK].code;
>  	u32 cr1, cr18;
> +	int width =3D out_pix->width;
>
>  	if (out_pix->field =3D=3D V4L2_FIELD_INTERLACED) {
>  		imx7_csi_deinterlace_enable(csi, true);
> @@ -774,15 +775,27 @@ static int imx7_csi_configure(struct imx7_csi *csi)
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
> @@ -817,11 +830,9 @@ static void imx7_csi_enable(struct imx7_csi *csi)
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
> @@ -1302,6 +1313,7 @@ static int imx7_csi_remove(struct platform_device *=
pdev)
>
>  static const struct of_device_id imx7_csi_of_match[] =3D {
>  	{ .compatible =3D "fsl,imx7-csi" },
> +	{ .compatible =3D "fsl,imx6ul-csi" },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, imx7_csi_of_match);

