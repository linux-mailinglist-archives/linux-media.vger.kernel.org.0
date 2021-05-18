Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AAFB3877BE
	for <lists+linux-media@lfdr.de>; Tue, 18 May 2021 13:32:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239963AbhERLds (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 May 2021 07:33:48 -0400
Received: from comms.puri.sm ([159.203.221.185]:58860 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239882AbhERLdq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 May 2021 07:33:46 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id DF965E04DC;
        Tue, 18 May 2021 04:32:28 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id sedvUtkbU7DN; Tue, 18 May 2021 04:32:24 -0700 (PDT)
Message-ID: <db9ce7990ccecc655205324b060fdd263eefb99c.camel@puri.sm>
Subject: Re: [RFC PATCH 3/3] media: imx: imx7-media-csi: Don't set PIXEL_BIT
 in CSICR1
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
Date:   Tue, 18 May 2021 13:32:19 +0200
In-Reply-To: <20210516024216.4576-4-laurent.pinchart@ideasonboard.com>
References: <20210516024216.4576-1-laurent.pinchart@ideasonboard.com>
         <20210516024216.4576-4-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Sonntag, dem 16.05.2021 um 05:42 +0300 schrieb Laurent Pinchart:
> The PIXEL_BIT field of the CSICR1 register is documented as setting
> the
> Bayer data width to 10 bits, and is set by the driver for all non-YUV
> pixel formats. Test code from NXP showed that the bit shouldn't be
> set
> for Bayer formats, and this was confirmed by experimentation with
> RAW8
> capture (which doesn't work when setting the field) and RAW10 capture
> (for which setting the field doesn't seem to make a difference) on
> i.MX8MM with an OV5640 sensor connected over CSI-2. Don't set it.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/staging/media/imx/imx7-media-csi.c | 15 ---------------
>  1 file changed, 15 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx7-media-csi.c
> b/drivers/staging/media/imx/imx7-media-csi.c
> index 256b9aa978f0..94ee8d9838ee 100644
> --- a/drivers/staging/media/imx/imx7-media-csi.c
> +++ b/drivers/staging/media/imx/imx7-media-csi.c
> @@ -495,21 +495,6 @@ static void imx7_csi_configure(struct imx7_csi
> *csi)
>                         cr18 |= BIT_MIPI_DATA_FORMAT_YUV422_8B;
>                         break;
>                 }
> -
> -               switch (out_pix->pixelformat) {
> -               case V4L2_PIX_FMT_Y10:
> -               case V4L2_PIX_FMT_Y12:
> -               case V4L2_PIX_FMT_SBGGR8:
> -               case V4L2_PIX_FMT_SGBRG8:
> -               case V4L2_PIX_FMT_SGRBG8:
> -               case V4L2_PIX_FMT_SRGGB8:
> -               case V4L2_PIX_FMT_SBGGR16:
> -               case V4L2_PIX_FMT_SGBRG16:
> -               case V4L2_PIX_FMT_SGRBG16:
> -               case V4L2_PIX_FMT_SRGGB16:
> -                       cr1 |= BIT_PIXEL_BIT;
> -                       break;
> -               }
>         }
>  
>         imx7_csi_reg_write(csi, cr1, CSI_CSICR1);

I can confirm I never needed to set that bit despite said documentation
for 10bit bayer (on imx8mq).

Tested-by: Martin Kepplinger <martin.kepplinger@puri.sm>

thanks,
                              martin


