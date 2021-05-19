Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B90383883A8
	for <lists+linux-media@lfdr.de>; Wed, 19 May 2021 02:16:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234442AbhESASM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 May 2021 20:18:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233554AbhESASK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 May 2021 20:18:10 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8F2FC06175F
        for <linux-media@vger.kernel.org>; Tue, 18 May 2021 17:16:51 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4B88C45E;
        Wed, 19 May 2021 02:16:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621383408;
        bh=z8kQ7DN7UAW9uFR7aHFXUNXvFLWZhpzGDPlFX40MmQI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rMhzSZ2e1c2jKeptH85VSWrQhEuJpLCq2+nS2aT0Z5HGzlT6+JErMzAmAejaPtSwc
         p03wlx/VN3enzCGrZO6iTsFpi0xcfOfjgJfVrkNMF4+D+O7Gw9Eh9xIQpTJxTv+CN2
         9UKooksYbBKOxg8rQ/VxEBw5+JOCL5ssYPQ7IHhU=
Date:   Wed, 19 May 2021 03:16:47 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Frieder Schrempf <frieder.schrempf@kontron.de>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>,
        linux-imx@nxp.com, Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Vasut <marex@denx.de>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
Subject: Re: [RFC PATCH 2/3] media: imx: imx7-media-csi: Set TWO_8BIT_SENSOR
 for >= 10-bit formats
Message-ID: <YKRY7y4ykERzdRSe@pendragon.ideasonboard.com>
References: <20210516024216.4576-1-laurent.pinchart@ideasonboard.com>
 <20210516024216.4576-3-laurent.pinchart@ideasonboard.com>
 <a0b7ab70-97b2-1511-bdd3-b7c78056042b@kontron.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a0b7ab70-97b2-1511-bdd3-b7c78056042b@kontron.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Frieder,

On Mon, May 17, 2021 at 12:21:17PM +0200, Frieder Schrempf wrote:
> On 16.05.21 04:42, Laurent Pinchart wrote:
> > Sample code from NXP, as well as experiments on i.MX8MM with RAW10
> > capture with an OV5640 sensor connected over CSI-2, showed that the
> > TWO_8BIT_SENSOR field of the CSICR3 register needs to be set for formats
> > larger than 8 bits. Do so, even if the reference manual doesn't clearly
> > describe the effect of the field.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> For the ADV7280-M I also have the diffs below applied. Do you think
> setting BIT_MIPI_DOUBLE_CMPNT is specific to MEDIA_BUS_FMT_UYVY8_2X8?

Do you need MEDIA_BUS_FMT_UYVY8_2X8 ? Neither MEDIA_BUS_FMT_UYVY8_1X16
nor MEDIA_BUS_FMT_UYVY8_2X8 match exactly how YUV 4:2:2 data is
transmitted over CSI-2. V4L2 uses MEDIA_BUS_FMT_UYVY8_1X16 as a
convention.

> In the RM it mentions YUV422 in the description of
> BIT_MIPI_DOUBLE_CMPNT and without setting it, the colors are all
> wrong.

That's interesting. I've tested YUV 4:2:2 with an OV5640 sensor, and I
don't recall having to set the MIPI_DOUBLE_CMPNT field. I'll try to
retest.

> I know this is not really related to this patch. I'm just wondering
> how to properly support my setup.

It's hard to tell :-( The MIPI_CSI2_ISP_CONFIG PIXEL_MODE and PARALLEL
fields are not well documented, and neither is the CSI_CR18
MIPI_DOUBLE_CMPNT field. While the CSIS and the CSI bridge are
documented, how they're integrated isn't described. So far, I can only
guess.

> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> @@ -346,6 +346,11 @@ struct csis_pix_format {
>  
>  static const struct csis_pix_format mipi_csis_formats[] = {
>         /* YUV formats. */
> +       {
> +               .code = MEDIA_BUS_FMT_UYVY8_2X8,
> +               .data_type = MIPI_CSI2_DATA_TYPE_YUV422_8,
> +               .width = 8,
> +       },
>         {
>                 .code = MEDIA_BUS_FMT_UYVY8_1X16,
>                 .data_type = MIPI_CSI2_DATA_TYPE_YUV422_8,
> 
> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> @@ -504,7 +504,7 @@ static void __mipi_csis_set_format(struct csi_state *state)
>         /* Color format */
>         val = mipi_csis_read(state, MIPI_CSIS_ISP_CONFIG_CH(0));
>         val &= ~(MIPI_CSIS_ISPCFG_ALIGN_32BIT | MIPI_CSIS_ISPCFG_FMT_MASK);
> -       val |= MIPI_CSIS_ISPCFG_FMT(state->csis_fmt->data_type);
> +       val |= MIPI_CSIS_ISPCFG_FMT(state->csis_fmt->data_type) | MIPI_CSIS_ISPCFG_PIXEL_MODE_DUAL;
>         mipi_csis_write(state, MIPI_CSIS_ISP_CONFIG_CH(0), val);
>  
>         /* Pixel resolution */
> 
> --- a/drivers/staging/media/imx/imx7-media-csi.c
> +++ b/drivers/staging/media/imx/imx7-media-csi.c
> @@ -492,7 +492,8 @@ static void imx7_csi_configure(struct imx7_csi *csi)
>                 case MEDIA_BUS_FMT_UYVY8_1X16:
>                 case MEDIA_BUS_FMT_YUYV8_2X8:
>                 case MEDIA_BUS_FMT_YUYV8_1X16:
> -                       cr18 |= BIT_MIPI_DATA_FORMAT_YUV422_8B;
> +                       cr3 |= BIT_TWO_8BIT_SENSOR;
> +                       cr18 |= BIT_MIPI_DATA_FORMAT_YUV422_8B | BIT_MIPI_DOUBLE_CMPNT;

I notice that you set both PIXEL_MODE_DUAL and MIPI_DOUBLE_CMPNT. Have
you tried setting neither ?

Have you also tried using MEDIA_BUS_FMT_UYVY8_1X16 ? The difference
between MEDIA_BUS_FMT_UYVY8_2X8 and MEDIA_BUS_FMT_UYVY8_1X16 in this
driver is the width value passed to v4l2_get_link_freq(). With
MEDIA_BUS_FMT_UYVY8_2X8 you'll end up with a computed link frequency
equal to half of the actual value, and thus a wrong Ths_settle value. It
shuold have no other influence though.

>                         break;
>                 }
>         }
> 
> > ---
> >  drivers/staging/media/imx/imx7-media-csi.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
> > index f85a2f5f1413..256b9aa978f0 100644
> > --- a/drivers/staging/media/imx/imx7-media-csi.c
> > +++ b/drivers/staging/media/imx/imx7-media-csi.c
> > @@ -422,6 +422,7 @@ static void imx7_csi_configure(struct imx7_csi *csi)
> >  	int width = out_pix->width;
> >  	u32 stride = 0;
> >  	u32 cr1, cr18;
> > +	u32 cr3 = 0;
> >  
> >  	cr18 = imx7_csi_reg_read(csi, CSI_CSICR18);
> >  
> > @@ -464,6 +465,7 @@ static void imx7_csi_configure(struct imx7_csi *csi)
> >  		case MEDIA_BUS_FMT_SGBRG10_1X10:
> >  		case MEDIA_BUS_FMT_SGRBG10_1X10:
> >  		case MEDIA_BUS_FMT_SRGGB10_1X10:
> > +			cr3 |= BIT_TWO_8BIT_SENSOR;
> >  			cr18 |= BIT_MIPI_DATA_FORMAT_RAW10;
> >  			break;
> >  		case MEDIA_BUS_FMT_Y12_1X12:
> > @@ -471,6 +473,7 @@ static void imx7_csi_configure(struct imx7_csi *csi)
> >  		case MEDIA_BUS_FMT_SGBRG12_1X12:
> >  		case MEDIA_BUS_FMT_SGRBG12_1X12:
> >  		case MEDIA_BUS_FMT_SRGGB12_1X12:
> > +			cr3 |= BIT_TWO_8BIT_SENSOR;
> >  			cr18 |= BIT_MIPI_DATA_FORMAT_RAW12;
> >  			break;
> >  		case MEDIA_BUS_FMT_Y14_1X14:
> > @@ -478,6 +481,7 @@ static void imx7_csi_configure(struct imx7_csi *csi)
> >  		case MEDIA_BUS_FMT_SGBRG14_1X14:
> >  		case MEDIA_BUS_FMT_SGRBG14_1X14:
> >  		case MEDIA_BUS_FMT_SRGGB14_1X14:
> > +			cr3 |= BIT_TWO_8BIT_SENSOR;
> >  			cr18 |= BIT_MIPI_DATA_FORMAT_RAW14;
> >  			break;
> >  		/*
> > @@ -510,7 +514,7 @@ static void imx7_csi_configure(struct imx7_csi *csi)
> >  
> >  	imx7_csi_reg_write(csi, cr1, CSI_CSICR1);
> >  	imx7_csi_reg_write(csi, BIT_DMA_BURST_TYPE_RFF_INCR16, CSI_CSICR2);
> > -	imx7_csi_reg_write(csi, BIT_FRMCNT_RST, CSI_CSICR3);
> > +	imx7_csi_reg_write(csi, BIT_FRMCNT_RST | cr3, CSI_CSICR3);
> >  	imx7_csi_reg_write(csi, cr18, CSI_CSICR18);
> >  
> >  	imx7_csi_reg_write(csi, (width * out_pix->height) >> 2, CSI_CSIRXCNT);
> > 

-- 
Regards,

Laurent Pinchart
