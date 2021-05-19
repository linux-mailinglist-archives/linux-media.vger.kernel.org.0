Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A370388FD7
	for <lists+linux-media@lfdr.de>; Wed, 19 May 2021 16:07:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353823AbhESOI3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 May 2021 10:08:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346859AbhESOI1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 May 2021 10:08:27 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EAA7C06175F
        for <linux-media@vger.kernel.org>; Wed, 19 May 2021 07:07:05 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id u5-20020a7bc0450000b02901480e40338bso3371238wmc.1
        for <linux-media@vger.kernel.org>; Wed, 19 May 2021 07:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:content-transfer-encoding:date:message-id:subject:from
         :to:cc:references:in-reply-to;
        bh=Bkv+zvzXINhOZaAJcPv95LawMTnaCWfzRsV1aUsFx1E=;
        b=DgUcvJxZjoznKN326byUoEND1hDd2S+0stet38GbpMMG8Fzkp3tcXwX+nACbDgjDlm
         zcbed2tHpQZxNifm2mT28c5HG9ngMt6dy77ZsNOVgztEhydNJiU+pAxOEx6XX7HHnWe7
         L5GcRsFbELiftRxRmlHymwlVhWCag6TBuDQ5MChcPQmGSy0nb5UtF8k6Req8lb5TwW1o
         Ex0mHX9/wgZ+YbJZGkFgN+Ngj+kacRC3sn/YeGGopcz2dnk/zGMUgFwztbeg1m7yEJ/V
         k5AkHg86QCOblnkThfgr+I1ylO5vMmWBrvv2OLiVn5MyyfbgMhFEZVvW2vKoA6/brIUL
         LRtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:subject:from:to:cc:references:in-reply-to;
        bh=Bkv+zvzXINhOZaAJcPv95LawMTnaCWfzRsV1aUsFx1E=;
        b=Wqd7xU70oRw9ZDycEIsz+iYRogfWWJ9Bfn8ytyBZFsUUT4H4ij6NCRHFHzTJgLuXC2
         XmS8TLKZ17yO/lbEg3n7bXje6pNm6tldkuKcHFk3lOax+MvTuPHM1dgX3YBnHA6h6vZ4
         Ljmk4Zvx58eXOUls5fV+Kh9maexZEvK02CidSKVdHUgnaxygUk+JeTopvuBC+XINzeeO
         y9SncN2J0o6R7+Td0oKWW4VN35k4YjqMWjB+8vcTC4stQ8vvG4UHBu3m477VFLmhY1Mi
         dhaLy03/1N0cmkRtq+mPfsn+4MMV330V1a5jTqmJ/XLLPgbpncLScrspqyfY5613vk2t
         gmFw==
X-Gm-Message-State: AOAM5319bicHGgT1tUuSUhPt3zJWtw78BTSDA31HyDdAPJIfsuy+DKQj
        pNVIqabRpC0Wy1HFT4kGgok=
X-Google-Smtp-Source: ABdhPJz/oPWSLx2FyM7RtPunwaviOWsAd/J+am6gcw4kVFT1qcLuNGM4MwzcQp7KE1NphnksP86isg==
X-Received: by 2002:a05:600c:4f4e:: with SMTP id m14mr11345947wmq.164.1621433224067;
        Wed, 19 May 2021 07:07:04 -0700 (PDT)
Received: from localhost (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id x13sm15689014wro.31.2021.05.19.07.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 07:07:03 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 19 May 2021 15:07:02 +0100
Message-Id: <CBHA3VHGIILR.1FSF2H4I4IPI6@arch-thunder>
Subject: Re: [RFC PATCH 2/3 v1.1] media: imx: imx7-media-csi: Set
 TWO_8BIT_SENSOR for >= 10-bit formats
From:   "Rui Miguel Silva" <rmfrfs@gmail.com>
To:     "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        <linux-media@vger.kernel.org>
Cc:     <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>,
        <linux-imx@nxp.com>, "Steve Longerbeam" <slongerbeam@gmail.com>,
        "Philipp Zabel" <p.zabel@pengutronix.de>,
        "Marek Vasut" <marex@denx.de>,
        "Marco Felsch" <m.felsch@pengutronix.de>,
        "Martin Kepplinger" <martin.kepplinger@puri.sm>,
        "Dorota Czaplejewicz" <dorota.czaplejewicz@puri.sm>
References: <CBFG1V17RJK2.2Q6JTIOSUD8ML@arch-thunder>
 <20210519002332.10406-1-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20210519002332.10406-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks Laurent,
On Wed May 19, 2021 at 1:23 AM WEST, Laurent Pinchart wrote:

> Sample code from NXP, as well as experiments on i.MX8MM with RAW10
> capture with an OV5640 sensor connected over CSI-2, showed that the
> TWO_8BIT_SENSOR field of the CSICR3 register needs to be set for formats
> larger than 8 bits. Do so, even if the reference manual doesn't clearly
> describe the effect of the field.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

------
Cheers,
     Rui
> ---
> Changes since v1:
>
> - Initialize cr3 to BIT_FRMCNT_RST
> ---
>  drivers/staging/media/imx/imx7-media-csi.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging=
/media/imx/imx7-media-csi.c
> index f85a2f5f1413..5ae9ed1849e9 100644
> --- a/drivers/staging/media/imx/imx7-media-csi.c
> +++ b/drivers/staging/media/imx/imx7-media-csi.c
> @@ -421,6 +421,7 @@ static void imx7_csi_configure(struct imx7_csi *csi)
>  	struct v4l2_pix_format *out_pix =3D &vdev->fmt;
>  	int width =3D out_pix->width;
>  	u32 stride =3D 0;
> +	u32 cr3 =3D BIT_FRMCNT_RST;
>  	u32 cr1, cr18;
> =20
>  	cr18 =3D imx7_csi_reg_read(csi, CSI_CSICR18);
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
> +	imx7_csi_reg_write(csi, cr3, CSI_CSICR3);
>  	imx7_csi_reg_write(csi, cr18, CSI_CSICR18);
> =20
>  	imx7_csi_reg_write(csi, (width * out_pix->height) >> 2, CSI_CSIRXCNT);
> --=20
> Regards,
>
> Laurent Pinchart



