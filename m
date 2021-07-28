Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 025F13D8A16
	for <lists+linux-media@lfdr.de>; Wed, 28 Jul 2021 10:55:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234365AbhG1IzA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Jul 2021 04:55:00 -0400
Received: from comms.puri.sm ([159.203.221.185]:36396 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229574AbhG1Iy7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Jul 2021 04:54:59 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 6C214E048D;
        Wed, 28 Jul 2021 01:54:28 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id jK_RTihMX_Ee; Wed, 28 Jul 2021 01:54:27 -0700 (PDT)
Message-ID: <6461ee38c77b94c0c8853d814da6ae6ae4e684f6.camel@puri.sm>
Subject: Re: [RFC PATCH 2/3] media: imx: imx7-media-csi: Set TWO_8BIT_SENSOR
 for >= 10-bit formats
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Vasut <marex@denx.de>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
Date:   Wed, 28 Jul 2021 10:54:23 +0200
In-Reply-To: <20210516024216.4576-3-laurent.pinchart@ideasonboard.com>
References: <20210516024216.4576-1-laurent.pinchart@ideasonboard.com>
         <20210516024216.4576-3-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Sonntag, dem 16.05.2021 um 05:42 +0300 schrieb Laurent Pinchart:
> Sample code from NXP, as well as experiments on i.MX8MM with RAW10
> capture with an OV5640 sensor connected over CSI-2, showed that the
> TWO_8BIT_SENSOR field of the CSICR3 register needs to be set for
> formats
> larger than 8 bits. Do so, even if the reference manual doesn't
> clearly
> describe the effect of the field.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/staging/media/imx/imx7-media-csi.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/imx/imx7-media-csi.c
> b/drivers/staging/media/imx/imx7-media-csi.c
> index f85a2f5f1413..256b9aa978f0 100644
> --- a/drivers/staging/media/imx/imx7-media-csi.c
> +++ b/drivers/staging/media/imx/imx7-media-csi.c
> @@ -422,6 +422,7 @@ static void imx7_csi_configure(struct imx7_csi
> *csi)
>         int width = out_pix->width;
>         u32 stride = 0;
>         u32 cr1, cr18;
> +       u32 cr3 = 0;
>  
>         cr18 = imx7_csi_reg_read(csi, CSI_CSICR18);
>  
> @@ -464,6 +465,7 @@ static void imx7_csi_configure(struct imx7_csi
> *csi)
>                 case MEDIA_BUS_FMT_SGBRG10_1X10:
>                 case MEDIA_BUS_FMT_SGRBG10_1X10:
>                 case MEDIA_BUS_FMT_SRGGB10_1X10:
> +                       cr3 |= BIT_TWO_8BIT_SENSOR;
>                         cr18 |= BIT_MIPI_DATA_FORMAT_RAW10;
>                         break;
>                 case MEDIA_BUS_FMT_Y12_1X12:
> @@ -471,6 +473,7 @@ static void imx7_csi_configure(struct imx7_csi
> *csi)
>                 case MEDIA_BUS_FMT_SGBRG12_1X12:
>                 case MEDIA_BUS_FMT_SGRBG12_1X12:
>                 case MEDIA_BUS_FMT_SRGGB12_1X12:
> +                       cr3 |= BIT_TWO_8BIT_SENSOR;
>                         cr18 |= BIT_MIPI_DATA_FORMAT_RAW12;
>                         break;
>                 case MEDIA_BUS_FMT_Y14_1X14:
> @@ -478,6 +481,7 @@ static void imx7_csi_configure(struct imx7_csi
> *csi)
>                 case MEDIA_BUS_FMT_SGBRG14_1X14:
>                 case MEDIA_BUS_FMT_SGRBG14_1X14:
>                 case MEDIA_BUS_FMT_SRGGB14_1X14:
> +                       cr3 |= BIT_TWO_8BIT_SENSOR;
>                         cr18 |= BIT_MIPI_DATA_FORMAT_RAW14;
>                         break;
>                 /*
> @@ -510,7 +514,7 @@ static void imx7_csi_configure(struct imx7_csi
> *csi)
>  
>         imx7_csi_reg_write(csi, cr1, CSI_CSICR1);
>         imx7_csi_reg_write(csi, BIT_DMA_BURST_TYPE_RFF_INCR16,
> CSI_CSICR2);
> -       imx7_csi_reg_write(csi, BIT_FRMCNT_RST, CSI_CSICR3);
> +       imx7_csi_reg_write(csi, BIT_FRMCNT_RST | cr3, CSI_CSICR3);
>         imx7_csi_reg_write(csi, cr18, CSI_CSICR18);
>  
>         imx7_csi_reg_write(csi, (width * out_pix->height) >> 2,
> CSI_CSIRXCNT);

this patch series looks good to me - I need it for the driver to run on
imx8mq.

Reviewed-by: Martin Kepplinger <martin.kepplinger@puri.sm>

Could you either rebase and resend as non-RFC or queue them up more
directly?

thank you,

                     martin

