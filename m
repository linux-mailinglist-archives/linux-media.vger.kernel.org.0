Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 710BD11ACF
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2019 16:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbfEBOG2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 May 2019 10:06:28 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:34430 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726282AbfEBOG1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 May 2019 10:06:27 -0400
Received: by mail-wm1-f65.google.com with SMTP id b67so6705727wmg.1;
        Thu, 02 May 2019 07:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version:content-transfer-encoding;
        bh=QGgQfDpOC9GynBt/HJwUnNrT3bmyX6mwS6UqDLi7QQ8=;
        b=bKjBe+dqOnsrcqtMj0TiGJlgZ14Ixvdw6Hn9wrx4AxmmuSQ3thnQBSM8atO2YZ3OZj
         CUrq/DbFIUqQ43IZuaqGMcfUklWjxUSwgjtKlDDkhdB+xnVn2pKugkfRkk0SWVhHXUOf
         6O6rnBQ8Hn8gmp1dm//3et3sh7Fz4qN/3wqy+cACNkwc9LKzhG4XWIvZX6O54OJz0Ofz
         YURV80ECF3JjftX15fUIr/5rxiy8LSqEouWuyBCnVbi+icNYd54MJK5WczVk0y10QQpu
         ZwAK8i61zzkZL6pTde1z3OgHlfArtROuX93kNS4PxNRirQ898bhMA9fLiJQ0d+6zmde/
         NbRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
        bh=QGgQfDpOC9GynBt/HJwUnNrT3bmyX6mwS6UqDLi7QQ8=;
        b=chPi3pD/lU9QBgf0u+x4dyOg/V38+vELYaP30QhXRS3jqSoVYkTVY2Irwr4hRvAgYQ
         wswb/Mb163lCFzwHDpWrOyt4L17Tevb1REbt7Vto6PKxUYcrzRgRZUtM37k/vOYJFb/n
         H12vPg0muGRPxpPPruDskVAZn+J1vstD2rFM7ol3bA+1shrReb1fTMd2eaZtdjfQlLfc
         7V3+FuSFf1Ia9gNty46n1XqGdX/krWKEaTthisCHjUW7sNl7zKNoCaZwdTNhgWBfE+Rs
         N53l5GeoeZndSjaalMoevcRQ4PuCR1AbstXonICV1Czq7Td9aOPHl8HITHEUbrAx6RNs
         dxUg==
X-Gm-Message-State: APjAAAUnvvlbMIINvxGY4sbhhNMDLTP240OtH4jJf9DuOIkqmunWJNAf
        QFmB2IuGofbe3JEsYztUK3g=
X-Google-Smtp-Source: APXvYqxZXZ22Iljv7+3hgL97YvrsJFnjhKlJsF8hKZ3bTipu9wZZ9dxg6aqgHYdr8QVWRbqQoBPVQg==
X-Received: by 2002:a7b:c38c:: with SMTP id s12mr2432243wmj.136.1556805984157;
        Thu, 02 May 2019 07:06:24 -0700 (PDT)
Received: from arch-late (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id s3sm44918727wre.97.2019.05.02.07.06.22
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 May 2019 07:06:23 -0700 (PDT)
References: <20190430074911.8361-1-sebastien.szymanski@armadeus.com>
User-agent: mu4e 1.2.0; emacs 27.0.50
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     =?utf-8?Q?S=C3=A9bastien?= Szymanski 
        <sebastien.szymanski@armadeus.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: Re: [PATCH 2/2] media: imx7-media-csi: add i.MX6UL support
In-reply-to: <20190430074911.8361-1-sebastien.szymanski@armadeus.com>
Date:   Thu, 02 May 2019 15:06:21 +0100
Message-ID: <m3imut54te.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sebastien,
Many thanks for this patch.

Please note that there is another series on top of this code [0],
that turns my patch that you mention below obsolete, maybe you may
want to rebase on top of that. and also a different patch from me
[1].

[0]: https://lore.kernel.org/lkml/20190430225018.30252-2-slongerbeam@gmail.=
com/#b
[1]: https://lore.kernel.org/linux-media/20190430222523.22814-1-rui.silva@l=
inaro.org/

On Tue 30 Apr 2019 at 08:49, S=C3=A9bastien Szymanski wrote:
> i.MX7 and i.MX6UL/L have the same CSI controller. So add i.MX6UL/L support
> to imx7-media-csi driver.
>
> Signed-off-by: S=C3=A9bastien Szymanski <sebastien.szymanski@armadeus.com>

Can you also add i.MX6UL/L to the header of this file and maybe in
the help string in the Kconfig. That would make it clear that this
is supported also by this driver.

> ---
>  This patch needs the following patch from Rui Miguel Silva:
>  https://patchwork.linuxtv.org/patch/55657/
>
>  I have tested this patch with a OV5640 sensor (8-bit parallel). The pipe=
line is:
>
>  Device topology
>  - entity 1: csi (2 pads, 2 links)
>             type V4L2 subdev subtype Unknown flags 0
>             device node name /dev/v4l-subdev0
>         pad0: Sink
>                 [fmt:UYVY8_2X8/640x480 field:none colorspace:smpte170m xf=
er:709 ycbcr:601 quantization:lim-range]
>                 <- "ov5640 1-003c":0 [ENABLED]
>         pad1: Source
>                 [fmt:UYVY8_2X8/640x480 field:none colorspace:smpte170m xf=
er:709 ycbcr:601 quantization:lim-range]
>                 -> "csi capture":0 [ENABLED]
>
>  - entity 4: csi capture (1 pad, 1 link)
>             type Node subtype V4L flags 0
>             device node name /dev/video0
>         pad0: Sink
>                 <- "csi":1 [ENABLED]
>
>  - entity 10: ov5640 1-003c (1 pad, 1 link)
>              type V4L2 subdev subtype Sensor flags 0
>              device node name /dev/v4l-subdev1
>         pad0: Source
>                 [fmt:UYVY8_2X8/640x480@1/30 field:none colorspace:srgb xf=
er:srgb ycbcr:601 quantization:full-range]
>                 -> "csi":0 [ENABLED]
>
>  drivers/staging/media/imx/imx7-media-csi.c | 61 ++++++++++++++++------
>  1 file changed, 46 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging=
/media/imx/imx7-media-csi.c
> index a708a0340eb1..ef4534a96fa0 100644
> --- a/drivers/staging/media/imx/imx7-media-csi.c
> +++ b/drivers/staging/media/imx/imx7-media-csi.c
> @@ -154,6 +154,11 @@
>=20=20
>  static const char * const imx7_csi_clk_id[] =3D {"axi", "dcic", "mclk"};
>=20=20
> +enum csi_type {

maybe here the name could be something along enum csi_device_id, I
don't know, type does not sound good to me??

> +	IMX7,
> +	IMX6UL
> +};
> +
>  struct imx7_csi {
>  	struct device *dev;
>  	struct v4l2_subdev sd;
> @@ -195,6 +200,7 @@ struct imx7_csi {
>  	bool is_init;
>  	bool is_streaming;
>  	bool is_csi2;
> +	enum csi_type type;

here the same, instead type maybe dev_id?? or dev_type??

>=20=20
>  	struct completion last_eof_completion;
>  };
> @@ -554,6 +560,14 @@ static int imx7_csi_pad_link_validate(struct v4l2_su=
bdev *sd,
>  	if (ret)
>  		return ret;
>=20=20
> +	if (csi->type =3D=3D IMX6UL) {
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
> @@ -763,6 +777,7 @@ static int imx7_csi_configure(struct imx7_csi *csi)
>  	struct v4l2_pix_format *out_pix =3D &vdev->fmt.fmt.pix;
>  	__u32 in_code =3D csi->format_mbus[IMX7_CSI_PAD_SINK].code;
>  	u32 cr1, cr18;
> +	int width =3D out_pix->width;
>=20=20
>  	if (out_pix->field =3D=3D V4L2_FIELD_INTERLACED) {
>  		imx7_csi_deinterlace_enable(csi, true);
> @@ -772,15 +787,27 @@ static int imx7_csi_configure(struct imx7_csi *csi)
>  		imx7_csi_buf_stride_set(csi, 0);
>  	}
>=20=20
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
>=20=20
> -	if (!csi->is_csi2)
>  		return 0;
> +	}
> +
> +	imx7_csi_set_imagpara(csi, width, out_pix->height);
>=20=20
>  	cr1 =3D imx7_csi_reg_read(csi, CSI_CSICR1);
>  	cr1 &=3D ~BIT_GCLK_MODE;
>=20=20
> -	cr18 =3D imx7_csi_reg_read(csi, CSI_CSICR18);
>  	cr18 &=3D BIT_MIPI_DATA_FORMAT_MASK;
>  	cr18 |=3D BIT_DATA_FROM_MIPI;
>=20=20
> @@ -815,12 +842,9 @@ static int imx7_csi_enable(struct imx7_csi *csi)
>  {
>  	imx7_csi_sw_reset(csi);
>=20=20
> -	if (csi->is_csi2) {
> -		imx7_csi_dmareq_rff_enable(csi);
> -		imx7_csi_hw_enable_irq(csi);
> -		imx7_csi_hw_enable(csi);
> -		return 0;
> -	}
> +	imx7_csi_dmareq_rff_enable(csi);
> +	imx7_csi_hw_enable_irq(csi);
> +	imx7_csi_hw_enable(csi);
>=20=20
>  	return 0;
>  }
> @@ -1218,20 +1242,33 @@ static int imx7_csi_clocks_get(struct imx7_csi *c=
si)
>  	return devm_clk_bulk_get(dev, csi->num_clks, csi->clks);
>  }
>=20=20
> +static const struct of_device_id imx7_csi_of_match[] =3D {
> +	{ .compatible =3D "fsl,imx7-csi", .data =3D (void *)IMX7 },
> +	{ .compatible =3D "fsl,imx6ul-csi", .data =3D (void *)IMX6UL },
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
>  	struct resource *res;
>  	int ret;
>=20=20
> +	of_id =3D of_match_node(imx7_csi_of_match, node);
> +	if (!of_id)
> +		return -ENODEV;
> +
>  	csi =3D devm_kzalloc(&pdev->dev, sizeof(*csi), GFP_KERNEL);
>  	if (!csi)
>  		return -ENOMEM;
>=20=20
>  	csi->dev =3D dev;
> +	csi->type =3D (enum csi_type)of_id->data;
>=20=20
>  	ret =3D imx7_csi_clocks_get(csi);
>  	if (ret < 0) {
> @@ -1349,12 +1386,6 @@ static int imx7_csi_remove(struct platform_device =
*pdev)
>  	return 0;
>  }
>=20=20
> -static const struct of_device_id imx7_csi_of_match[] =3D {
> -	{ .compatible =3D "fsl,imx7-csi" },
> -	{ },
> -};
> -MODULE_DEVICE_TABLE(of, imx7_csi_of_match);
> -
>  static struct platform_driver imx7_csi_driver =3D {
>  	.probe =3D imx7_csi_probe,
>  	.remove =3D imx7_csi_remove,

