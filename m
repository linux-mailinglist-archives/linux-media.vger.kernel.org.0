Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB7A33829B3
	for <lists+linux-media@lfdr.de>; Mon, 17 May 2021 12:21:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236275AbhEQKWa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 May 2021 06:22:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230248AbhEQKWa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 May 2021 06:22:30 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBF79C061573
        for <linux-media@vger.kernel.org>; Mon, 17 May 2021 03:21:13 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id r12so5795102wrp.1
        for <linux-media@vger.kernel.org>; Mon, 17 May 2021 03:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:content-transfer-encoding:date:message-id:cc:subject
         :from:to:references:in-reply-to;
        bh=qvRzzRLLcu4dcIkgDy/SSU5DLTHbPvdSUySllQ5EIUc=;
        b=DzN9PNffdjzZnQimIfuCh8eY1Evp3rPEI/kCphll6Vgt1SSpm6ABMzcLMFMRlpqQtA
         EgDr9bmO0NAvs4XLq+PsI1Dvl+CYmVWYJof4rTaVQaDwT6QZprX28AdK1lPUJwygWn86
         aPN7Xx2vAZYBWkqnB0XQ6HviZim+DUY4xxlCfJiBqdZ63mQlfWkGtPV0lNQYEy6o2jie
         mTPW96PXQC6dfQCxnSdbymKRKq3LXT42h1uQxEHFpZykFPyLzpxLWLAjuJ+8nvuDPTzM
         0eKdJk+Bqx6Rp0DyqAuUUosXUdx8BcZPKIwCi8NObAZGQpjBlpEDNXamGcnLMyq2A936
         +gzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:cc:subject:from:to:references:in-reply-to;
        bh=qvRzzRLLcu4dcIkgDy/SSU5DLTHbPvdSUySllQ5EIUc=;
        b=tbR9k3ffV6HR7vn86wifaz5ruxaAzJIQZstyzP1W9DCvFToxuEoM1n+Hftu7u87KWY
         z42bqaDQhn2BKwQv8y7nPRymaKXOlGB794FvusoarqjKp+2RPYrMjm2k7Zt1LEvSBX/k
         bx7iM89KFTOLEEY4dD99mO6uFoHOC4GKpfLqyiz8RS1w0kLL4Eg+qvSpY6v+xy6/Vmfo
         pyGsEZ9jy19Dtqf34VUCZWLZ+4ZClgKK8OvOUn/KRQi6dBm/weoneSQs26d8VqQ2eE4p
         1Hi86lmHQOPa7UDDMl+v59pp5Em/QIaWsPqy/BdCQWmYY8hfTdVJYsccUWXvIqrlI9/4
         RGuQ==
X-Gm-Message-State: AOAM5331Bbtx/o+JuyURKexPvyc9oKqqzNYCt1Mx6OfflaxubksY3zvM
        npAPtaBc5/k3g18TzFwmC5c=
X-Google-Smtp-Source: ABdhPJwPbDSXkZUARb4iXvU7FKJIwkfZAGE8zFU+lPO/ovuM8bgcVQJ1rCd5o2V/f6yen8C4LbYgcQ==
X-Received: by 2002:a5d:64e4:: with SMTP id g4mr72864101wri.366.1621246872780;
        Mon, 17 May 2021 03:21:12 -0700 (PDT)
Received: from localhost (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id r2sm17791823wrv.39.2021.05.17.03.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 03:21:12 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 17 May 2021 11:21:11 +0100
Message-Id: <CBFG1V17RJK2.2Q6JTIOSUD8ML@arch-thunder>
Cc:     <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>,
        <linux-imx@nxp.com>, "Steve Longerbeam" <slongerbeam@gmail.com>,
        "Philipp Zabel" <p.zabel@pengutronix.de>,
        "Marek Vasut" <marex@denx.de>,
        "Marco Felsch" <m.felsch@pengutronix.de>,
        "Martin Kepplinger" <martin.kepplinger@puri.sm>,
        "Dorota Czaplejewicz" <dorota.czaplejewicz@puri.sm>
Subject: Re: [RFC PATCH 2/3] media: imx: imx7-media-csi: Set TWO_8BIT_SENSOR
 for >= 10-bit formats
From:   "Rui Miguel Silva" <rmfrfs@gmail.com>
To:     "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        <linux-media@vger.kernel.org>
References: <20210516024216.4576-1-laurent.pinchart@ideasonboard.com>
 <20210516024216.4576-3-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20210516024216.4576-3-laurent.pinchart@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,
On Sun May 16, 2021 at 3:42 AM WEST, Laurent Pinchart wrote:

> Sample code from NXP, as well as experiments on i.MX8MM with RAW10
> capture with an OV5640 sensor connected over CSI-2, showed that the
> TWO_8BIT_SENSOR field of the CSICR3 register needs to be set for formats
> larger than 8 bits. Do so, even if the reference manual doesn't clearly
> describe the effect of the field.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/staging/media/imx/imx7-media-csi.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging=
/media/imx/imx7-media-csi.c
> index f85a2f5f1413..256b9aa978f0 100644
> --- a/drivers/staging/media/imx/imx7-media-csi.c
> +++ b/drivers/staging/media/imx/imx7-media-csi.c
> @@ -422,6 +422,7 @@ static void imx7_csi_configure(struct imx7_csi *csi)
>  	int width =3D out_pix->width;
>  	u32 stride =3D 0;
>  	u32 cr1, cr18;
> +	u32 cr3 =3D 0;
> =20
>  	cr18 =3D imx7_csi_reg_read(csi, CSI_CSICR18);
> =20
> @@ -464,6 +465,7 @@ static void imx7_csi_configure(struct imx7_csi *csi)
>  		case MEDIA_BUS_FMT_SGBRG10_1X10:
>  		case MEDIA_BUS_FMT_SGRBG10_1X10:
>  		case MEDIA_BUS_FMT_SRGGB10_1X10:
> +			cr3 |=3D BIT_TWO_8BIT_SENSOR;
>  			cr18 |=3D BIT_MIPI_DATA_FORMAT_RAW10;
>  			break;
>  		case MEDIA_BUS_FMT_Y12_1X12:
> @@ -471,6 +473,7 @@ static void imx7_csi_configure(struct imx7_csi *csi)
>  		case MEDIA_BUS_FMT_SGBRG12_1X12:
>  		case MEDIA_BUS_FMT_SGRBG12_1X12:
>  		case MEDIA_BUS_FMT_SRGGB12_1X12:
> +			cr3 |=3D BIT_TWO_8BIT_SENSOR;
>  			cr18 |=3D BIT_MIPI_DATA_FORMAT_RAW12;
>  			break;
>  		case MEDIA_BUS_FMT_Y14_1X14:
> @@ -478,6 +481,7 @@ static void imx7_csi_configure(struct imx7_csi *csi)
>  		case MEDIA_BUS_FMT_SGBRG14_1X14:
>  		case MEDIA_BUS_FMT_SGRBG14_1X14:
>  		case MEDIA_BUS_FMT_SRGGB14_1X14:
> +			cr3 |=3D BIT_TWO_8BIT_SENSOR;
>  			cr18 |=3D BIT_MIPI_DATA_FORMAT_RAW14;
>  			break;
>  		/*
> @@ -510,7 +514,7 @@ static void imx7_csi_configure(struct imx7_csi *csi)
> =20
>  	imx7_csi_reg_write(csi, cr1, CSI_CSICR1);
>  	imx7_csi_reg_write(csi, BIT_DMA_BURST_TYPE_RFF_INCR16, CSI_CSICR2);
> -	imx7_csi_reg_write(csi, BIT_FRMCNT_RST, CSI_CSICR3);
> +	imx7_csi_reg_write(csi, BIT_FRMCNT_RST | cr3, CSI_CSICR3);

I would prefer if you initialize cr3 with BIT_FRMCNT_RST above at
declaration or even better bellow after cr18 read or something like
that, would make it more coherent with the rest of the cr's handling.

other than that LGTM.

------
Cheers,
     Rui


>  	imx7_csi_reg_write(csi, cr18, CSI_CSICR18);
> =20
>  	imx7_csi_reg_write(csi, (width * out_pix->height) >> 2, CSI_CSIRXCNT);
> --=20
> Regards,
>
> Laurent Pinchart



