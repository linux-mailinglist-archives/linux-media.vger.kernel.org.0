Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD4D045493D
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 15:51:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233936AbhKQOyv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 09:54:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231788AbhKQOyv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 09:54:51 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80B7FC061570;
        Wed, 17 Nov 2021 06:51:52 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id y196so2472111wmc.3;
        Wed, 17 Nov 2021 06:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:content-transfer-encoding:date:message-id:cc:subject
         :from:to:references:in-reply-to;
        bh=jJ51ZlH+2lE8rLSSFCiYjXjBtLDKQFWHhyS+Y+x5rso=;
        b=EJFSm/6QhkB5EwLlV7ulH4Kv0lZPoeIvlf0+dl+5Jp+1HqbXIpUP5HhYNmgBJTDzO1
         Ru88IiQiRV4eAqbzcsN0QPoiohfoPuCd+Pn567jxPVnPEzOtHeiyILKzTlbP01ReR2Uc
         bp/vHtQd5g7rNOpIDNE9T5x+2qx4sfmOOzndY6n9YRO0tU0PNAbS5F1DegSTiz9aoB1r
         m2hgskZZ6+ErJq7hzDY7vX20m5q5Fhh90CVb6Elal0oGxqSLQkkgUWQ+9RQki3zdt7E/
         lzh4nddM7Ai4INJscIUq1q58SIDV4qIm3cEqTJ4aSzavScQ68dDinTTimRTZQPhmVLw/
         uvtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:cc:subject:from:to:references:in-reply-to;
        bh=jJ51ZlH+2lE8rLSSFCiYjXjBtLDKQFWHhyS+Y+x5rso=;
        b=LK1az/klk8Kbu0PcbA5v0yHTaAk2g/2FenEWy64dQDJXiLQTGyIFhOUzuFiGL2cPYU
         jI8e4QdhOrig79JPvBCQKUK8aF55vkhAY2DEVXxPf7wjhkzlLanZiIE9+Q+9W8k3gF1j
         1bp0PxN0nmtwkeAp/rPfih6lUQuVCkA/02jTwTpNGnqQ3nKoGYssOp1R6ZX4qRUzAxHR
         6L40be+iTFc+DSjCnLSlG+MRq16Yj+C03rr39m/Ly0AfVwcqPAhrvLiFclUtKyEydZTg
         OHG3nahoogptS1/fyzUtFC7ruS4arPqbb0kj4es2McAmfKxmXz4ug0AgPx1Ik0WuMz5J
         osJQ==
X-Gm-Message-State: AOAM532THfOMvpNpkvNL8Mu3Kg3fo7/Tn7e9cC44Mma3Jzw9npm/sf2t
        EZUlL/DZ6BagnRLxeMslp4c=
X-Google-Smtp-Source: ABdhPJzHtEsTAdKaqa4gQxikWsbXFcywF/SZtl1a+gJCxhuR5b8+1mx7mQYYZoC5FJl1qFAIBeS3iQ==
X-Received: by 2002:a05:600c:21d6:: with SMTP id x22mr265604wmj.194.1637160711086;
        Wed, 17 Nov 2021 06:51:51 -0800 (PST)
Received: from localhost (a109-49-33-111.cpe.netcabo.pt. [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id m34sm6599446wms.25.2021.11.17.06.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 06:51:50 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 17 Nov 2021 14:51:48 +0000
Message-Id: <CFS51AQQ7SCD.7FK8RLAWLXRH@arch-thunder>
Cc:     <kernel@pengutronix.de>, <kernel@puri.sm>, <linux-imx@nxp.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] media: imx: imx7-media-csi: add support for imx8mq
From:   "Rui Miguel Silva" <rmfrfs@gmail.com>
To:     "Martin Kepplinger" <martin.kepplinger@puri.sm>,
        <laurent.pinchart@ideasonboard.com>, <mchehab@kernel.org>,
        <robh@kernel.org>, <shawnguo@kernel.org>
References: <20211117092710.3084034-1-martin.kepplinger@puri.sm>
In-Reply-To: <20211117092710.3084034-1-martin.kepplinger@puri.sm>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martin,
Thanks for the patch.

On Wed Nov 17, 2021 at 9:27 AM WET, Martin Kepplinger wrote:

> Modeled after the NXP driver mx6s_capture.c that this driver is based on,
> imx8mq needs different settings for the baseaddr_switch mechanism. Define
> the needed bits and set that for imx8mq.
>
> Without these settings, the system will "sometimes" hang completely when
> starting to stream (the interrupt will never be called).
>
> Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> ---
>  drivers/staging/media/imx/imx7-media-csi.c | 34 ++++++++++++++++++++--
>  1 file changed, 32 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging=
/media/imx/imx7-media-csi.c
> index 2288dadb2683..8619cf2fc694 100644
> --- a/drivers/staging/media/imx/imx7-media-csi.c
> +++ b/drivers/staging/media/imx/imx7-media-csi.c
> @@ -12,6 +12,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/module.h>
> +#include <linux/of_device.h>
>  #include <linux/of_graph.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/platform_device.h>
> @@ -122,6 +123,10 @@
>  #define BIT_DATA_FROM_MIPI		BIT(22)
>  #define BIT_MIPI_YU_SWAP		BIT(21)
>  #define BIT_MIPI_DOUBLE_CMPNT		BIT(20)
> +#define BIT_MASK_OPTION_FIRST_FRAME	(0 << 18)
> +#define BIT_MASK_OPTION_CSI_EN		(1 << 18)
> +#define BIT_MASK_OPTION_SECOND_FRAME	(2 << 18)
> +#define BIT_MASK_OPTION_ON_DATA		(3 << 18)
>  #define BIT_BASEADDR_CHG_ERR_EN		BIT(9)
>  #define BIT_BASEADDR_SWITCH_SEL		BIT(5)
>  #define BIT_BASEADDR_SWITCH_EN		BIT(4)
> @@ -154,6 +159,12 @@
>  #define CSI_CSICR18			0x48
>  #define CSI_CSICR19			0x4c
> =20
> +enum imx_soc {
> +	IMX6UL =3D 0,
> +	IMX7,
> +	IMX8MQ,

maybe instead of this enum we could use a bool in structure...
>
>+};
> +
>  struct imx7_csi {
>  	struct device *dev;
>  	struct v4l2_subdev sd;
> @@ -189,6 +200,8 @@ struct imx7_csi {
>  	bool is_csi2;
> =20
>  	struct completion last_eof_completion;
> +
> +	enum imx_soc type;

here, bool is_imx8mq?

>  };
> =20
>  static struct imx7_csi *
> @@ -537,6 +550,16 @@ static void imx7_csi_deinit(struct imx7_csi *csi,
>  	clk_disable_unprepare(csi->mclk);
>  }
> =20
> +static void imx8mq_baseaddr_switch(struct imx7_csi *csi)

I think this function needs a better name. First add the imx7_csi
prefix that all functions have, and also you are setting it specific
to second frame and the function should not be specific to imx8.

maybe something:

imx7_csi_write_on_second_frame_enable, maybe?

> +{
> +	u32 cr18 =3D imx7_csi_reg_read(csi, CSI_CSICR18);
> +
> +	cr18 |=3D BIT_BASEADDR_SWITCH_EN | BIT_BASEADDR_SWITCH_SEL |
> +		BIT_BASEADDR_CHG_ERR_EN;
> +	cr18 |=3D BIT_MASK_OPTION_SECOND_FRAME;
> +	imx7_csi_reg_write(csi, cr18, CSI_CSICR18);
> +}
> +
>  static void imx7_csi_enable(struct imx7_csi *csi)
>  {
>  	/* Clear the Rx FIFO and reflash the DMA controller. */
> @@ -551,7 +574,11 @@ static void imx7_csi_enable(struct imx7_csi *csi)
> =20
>  	/* Enable the RxFIFO DMA and the CSI. */
>  	imx7_csi_dmareq_rff_enable(csi);
> +

unrelated new line.

>  	imx7_csi_hw_enable(csi);
> +
> +	if (csi->type =3D=3D IMX8MQ)
> +		imx8mq_baseaddr_switch(csi);

change this to new types and names?

>  }
> =20
>  static void imx7_csi_disable(struct imx7_csi *csi)
> @@ -1155,6 +1182,8 @@ static int imx7_csi_probe(struct platform_device *p=
dev)
>  	if (IS_ERR(csi->regbase))
>  		return PTR_ERR(csi->regbase);
> =20
> +	csi->type =3D (enum imx_soc)of_device_get_match_data(&pdev->dev);

here something:
        csi->is_imx8mq =3D of_device_is_compatible(np, "fsl,imx8mq-csi");
> +
>  	spin_lock_init(&csi->irqlock);
>  	mutex_init(&csi->lock);
> =20
> @@ -1249,8 +1278,9 @@ static int imx7_csi_remove(struct platform_device *=
pdev)
>  }
> =20
>  static const struct of_device_id imx7_csi_of_match[] =3D {
> -	{ .compatible =3D "fsl,imx7-csi" },
> -	{ .compatible =3D "fsl,imx6ul-csi" },
> +	{ .compatible =3D "fsl,imx8mq-csi", .data =3D (void *)IMX8MQ },

and with the above you should not need to add the data field here.

------
Cheers,
     Rui

> +	{ .compatible =3D "fsl,imx7-csi", .data =3D (void *)IMX7 },
> +	{ .compatible =3D "fsl,imx6ul-csi", .data =3D (void *)IMX6UL },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, imx7_csi_of_match);
> --=20
> 2.30.2



