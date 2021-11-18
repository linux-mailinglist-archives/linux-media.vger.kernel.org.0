Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD84D455795
	for <lists+linux-media@lfdr.de>; Thu, 18 Nov 2021 10:01:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244964AbhKRJEM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Nov 2021 04:04:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245012AbhKRJEE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Nov 2021 04:04:04 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9914BC061570;
        Thu, 18 Nov 2021 01:01:04 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id d5so10127537wrc.1;
        Thu, 18 Nov 2021 01:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:content-transfer-encoding:date:message-id:cc:subject
         :from:to:references:in-reply-to;
        bh=HoB8UigyPFgMPV3vxuTV7Mz+M/fc/B322pVo6Nb1Z/M=;
        b=Tkp+Hyi8/PwTDgDCb8mHGZWCuQFfKMxxxMOdGnnXMwFJkVRW9gr+p6nBSd1JUfT7v2
         rGwxVTuCK59egHqpvNsqMiDQx6E9mtsQDzJzie9CSTfiPdT8BXQkAiukKa5evJvsThec
         qPFP3hI5LrpfL3yhpBTacL39PriVqBQQJjTJk1CFOv/L1Jk5iU96Fy+U9pqPwLxAbagN
         oY/hap7xdWyAxspz+v6yobF0eGU0547G9HpfzDFmhEUVszGR6X1YOF3J+RzTOhcIXhrs
         Uy8P8wlEsGM8vsULmfSwVe3lqpxQNl+NJtDBeOQMjDrZx/pzJAUO5MGwfIUfTaHZNP9m
         j/WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:cc:subject:from:to:references:in-reply-to;
        bh=HoB8UigyPFgMPV3vxuTV7Mz+M/fc/B322pVo6Nb1Z/M=;
        b=55T0VJdW5bTTRw6r6C5zE7eula1CXciyWf9Wg4p6myCsHyRWtwSRL0hl3IrWu5FmHz
         hQiS2GhYlK+wzvUTpGtRePLpCibQKVKIL6oKcBhY7kzEGPiMK6C/VNtlDyyeQD15YsXa
         bgSbEtRQptbI0o9zFb2LG6FPpCinGD2YkhXmpE2s86KeEekIWu5GcMjiJxqmDFbJCwDo
         YKraeVeIPs046sbsviQ4CsMSNCstx7jMB8S/5ABvU30Km+vZWLVy8Xu/yBuu/rqtEFFE
         saDsj5Rl+usOJ9APuWtpfNxWu1tIsYjA1bUnJrzbAv7e4qH3nwNVF9AbxNFBmG5JEYAc
         H5Rw==
X-Gm-Message-State: AOAM531kMEVCCd8NCDJaVywr5/4oxBazXgfcTRAvtIPqfZMSz/waeh35
        JplrE27lU7YB1pxOrt32Jqc=
X-Google-Smtp-Source: ABdhPJxpXMQii2ux6+hCaETePd4TfBQSSFXNgyFjTdkHDPE54QnR1Eaeb78OxXTzBwpPO7Gb6joitQ==
X-Received: by 2002:adf:9bdb:: with SMTP id e27mr29564347wrc.417.1637226063168;
        Thu, 18 Nov 2021 01:01:03 -0800 (PST)
Received: from localhost (a109-49-33-111.cpe.netcabo.pt. [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id l7sm3029048wry.86.2021.11.18.01.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 01:01:02 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Thu, 18 Nov 2021 09:01:01 +0000
Message-Id: <CFSS79FWS3AE.3DWGLGKSNQIH9@arch-thunder>
Cc:     <devicetree@vger.kernel.org>, <kernel@pengutronix.de>,
        <kernel@puri.sm>, <linux-arm-kernel@lists.infradead.org>,
        <linux-imx@nxp.com>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <robh@kernel.org>,
        <shawnguo@kernel.org>
Subject: Re: [PATCH v2 1/2] media: imx: imx7-media-csi: add support for
 imx8mq
From:   "Rui Miguel Silva" <rmfrfs@gmail.com>
To:     "Martin Kepplinger" <martin.kepplinger@puri.sm>,
        <laurent.pinchart@ideasonboard.com>, <mchehab@kernel.org>
References: <20211118063347.3370678-1-martin.kepplinger@puri.sm>
In-Reply-To: <20211118063347.3370678-1-martin.kepplinger@puri.sm>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martin,
Thanks for this version.

On Thu Nov 18, 2021 at 6:33 AM WET, Martin Kepplinger wrote:

> Modeled after the NXP driver mx6s_capture.c that this driver is based on,
> imx8mq needs different settings for the baseaddr_switch mechanism. Define
> the needed bits and set that for imx8mq.
>
> Without these settings, the system will "sometimes" hang completely when
> starting to stream (the interrupt will never be called).
>
> Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>

LGTM

Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>

------
Cheers,
     Rui
> ---
>
> revision history
> ----------------
> v2: (thank you Rui and Laurent)
>  * rename function and enum
>  * remove unrealted newline
>  * add Laurents reviewed tag to the bindings patch
>
> v1:
> https://lore.kernel.org/linux-media/20211117092710.3084034-1-martin.keppl=
inger@puri.sm/T/#t
>
>
>
>  drivers/staging/media/imx/imx7-media-csi.c | 32 ++++++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging=
/media/imx/imx7-media-csi.c
> index 2288dadb2683..1f3d9e27270d 100644
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
> @@ -154,6 +159,11 @@
>  #define CSI_CSICR18			0x48
>  #define CSI_CSICR19			0x4c
> =20
> +enum imx_csi_model {
> +	IMX7_CSI_IMX7 =3D 0,
> +	IMX7_CSI_IMX8MQ,
> +};
> +
>  struct imx7_csi {
>  	struct device *dev;
>  	struct v4l2_subdev sd;
> @@ -189,6 +199,8 @@ struct imx7_csi {
>  	bool is_csi2;
> =20
>  	struct completion last_eof_completion;
> +
> +	enum imx_csi_model model;
>  };
> =20
>  static struct imx7_csi *
> @@ -537,6 +549,16 @@ static void imx7_csi_deinit(struct imx7_csi *csi,
>  	clk_disable_unprepare(csi->mclk);
>  }
> =20
> +static void imx7_csi_baseaddr_switch_on_second_frame(struct imx7_csi *cs=
i)
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
> @@ -552,6 +574,9 @@ static void imx7_csi_enable(struct imx7_csi *csi)
>  	/* Enable the RxFIFO DMA and the CSI. */
>  	imx7_csi_dmareq_rff_enable(csi);
>  	imx7_csi_hw_enable(csi);
> +
> +	if (csi->model =3D=3D IMX7_CSI_IMX8MQ)
> +		imx7_csi_baseaddr_switch_on_second_frame(csi);
>  }
> =20
>  static void imx7_csi_disable(struct imx7_csi *csi)
> @@ -1155,6 +1180,8 @@ static int imx7_csi_probe(struct platform_device *p=
dev)
>  	if (IS_ERR(csi->regbase))
>  		return PTR_ERR(csi->regbase);
> =20
> +	csi->model =3D (enum imx_csi_model)of_device_get_match_data(&pdev->dev)=
;
> +
>  	spin_lock_init(&csi->irqlock);
>  	mutex_init(&csi->lock);
> =20
> @@ -1249,8 +1276,9 @@ static int imx7_csi_remove(struct platform_device *=
pdev)
>  }
> =20
>  static const struct of_device_id imx7_csi_of_match[] =3D {
> -	{ .compatible =3D "fsl,imx7-csi" },
> -	{ .compatible =3D "fsl,imx6ul-csi" },
> +	{ .compatible =3D "fsl,imx8mq-csi", .data =3D (void *)IMX7_CSI_IMX8MQ }=
,
> +	{ .compatible =3D "fsl,imx7-csi", .data =3D (void *)IMX7_CSI_IMX7 },
> +	{ .compatible =3D "fsl,imx6ul-csi", .data =3D (void *)IMX7_CSI_IMX7 },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, imx7_csi_of_match);
> --=20
> 2.30.2



