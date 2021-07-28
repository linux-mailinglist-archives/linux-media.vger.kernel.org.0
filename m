Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABEE73D8EDA
	for <lists+linux-media@lfdr.de>; Wed, 28 Jul 2021 15:21:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236217AbhG1NVF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Jul 2021 09:21:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236216AbhG1NVF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Jul 2021 09:21:05 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA7CAC061757
        for <linux-media@vger.kernel.org>; Wed, 28 Jul 2021 06:21:03 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 37C013F;
        Wed, 28 Jul 2021 15:21:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1627478462;
        bh=r50RZTmZy8HVnbkDe2YTDOi+pulkxtjihvXAfJoQnw4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TPpWQiknXtWxWOOz17aeUIu8/jkUEcJgfx1b09Ui0pofQxexr4iBAPJtW1Et57d6Q
         tpx+Jf4NpfX8DG5T8xGr+ZLveTpsRkO0P6BmBckfsYikWMxevT2Q6G5832t8SVbAuV
         qWIHqN3XesmOJIRp29z08nUeasESVa6KSiDmgZOE=
Date:   Wed, 28 Jul 2021 16:20:56 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>,
        linux-imx@nxp.com, Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Vasut <marex@denx.de>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
Subject: Re: [RFC PATCH 2/3] media: imx: imx7-media-csi: Set TWO_8BIT_SENSOR
 for >= 10-bit formats
Message-ID: <YQFZuBEc4fKu+LTY@pendragon.ideasonboard.com>
References: <20210516024216.4576-1-laurent.pinchart@ideasonboard.com>
 <20210516024216.4576-3-laurent.pinchart@ideasonboard.com>
 <6461ee38c77b94c0c8853d814da6ae6ae4e684f6.camel@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6461ee38c77b94c0c8853d814da6ae6ae4e684f6.camel@puri.sm>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martin,

On Wed, Jul 28, 2021 at 10:54:23AM +0200, Martin Kepplinger wrote:
> Am Sonntag, dem 16.05.2021 um 05:42 +0300 schrieb Laurent Pinchart:
> > Sample code from NXP, as well as experiments on i.MX8MM with RAW10
> > capture with an OV5640 sensor connected over CSI-2, showed that the
> > TWO_8BIT_SENSOR field of the CSICR3 register needs to be set for
> > formats
> > larger than 8 bits. Do so, even if the reference manual doesn't
> > clearly
> > describe the effect of the field.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/staging/media/imx/imx7-media-csi.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/media/imx/imx7-media-csi.c
> > b/drivers/staging/media/imx/imx7-media-csi.c
> > index f85a2f5f1413..256b9aa978f0 100644
> > --- a/drivers/staging/media/imx/imx7-media-csi.c
> > +++ b/drivers/staging/media/imx/imx7-media-csi.c
> > @@ -422,6 +422,7 @@ static void imx7_csi_configure(struct imx7_csi
> > *csi)
> >         int width = out_pix->width;
> >         u32 stride = 0;
> >         u32 cr1, cr18;
> > +       u32 cr3 = 0;
> >  
> >         cr18 = imx7_csi_reg_read(csi, CSI_CSICR18);
> >  
> > @@ -464,6 +465,7 @@ static void imx7_csi_configure(struct imx7_csi
> > *csi)
> >                 case MEDIA_BUS_FMT_SGBRG10_1X10:
> >                 case MEDIA_BUS_FMT_SGRBG10_1X10:
> >                 case MEDIA_BUS_FMT_SRGGB10_1X10:
> > +                       cr3 |= BIT_TWO_8BIT_SENSOR;
> >                         cr18 |= BIT_MIPI_DATA_FORMAT_RAW10;
> >                         break;
> >                 case MEDIA_BUS_FMT_Y12_1X12:
> > @@ -471,6 +473,7 @@ static void imx7_csi_configure(struct imx7_csi
> > *csi)
> >                 case MEDIA_BUS_FMT_SGBRG12_1X12:
> >                 case MEDIA_BUS_FMT_SGRBG12_1X12:
> >                 case MEDIA_BUS_FMT_SRGGB12_1X12:
> > +                       cr3 |= BIT_TWO_8BIT_SENSOR;
> >                         cr18 |= BIT_MIPI_DATA_FORMAT_RAW12;
> >                         break;
> >                 case MEDIA_BUS_FMT_Y14_1X14:
> > @@ -478,6 +481,7 @@ static void imx7_csi_configure(struct imx7_csi
> > *csi)
> >                 case MEDIA_BUS_FMT_SGBRG14_1X14:
> >                 case MEDIA_BUS_FMT_SGRBG14_1X14:
> >                 case MEDIA_BUS_FMT_SRGGB14_1X14:
> > +                       cr3 |= BIT_TWO_8BIT_SENSOR;
> >                         cr18 |= BIT_MIPI_DATA_FORMAT_RAW14;
> >                         break;
> >                 /*
> > @@ -510,7 +514,7 @@ static void imx7_csi_configure(struct imx7_csi
> > *csi)
> >  
> >         imx7_csi_reg_write(csi, cr1, CSI_CSICR1);
> >         imx7_csi_reg_write(csi, BIT_DMA_BURST_TYPE_RFF_INCR16,
> > CSI_CSICR2);
> > -       imx7_csi_reg_write(csi, BIT_FRMCNT_RST, CSI_CSICR3);
> > +       imx7_csi_reg_write(csi, BIT_FRMCNT_RST | cr3, CSI_CSICR3);
> >         imx7_csi_reg_write(csi, cr18, CSI_CSICR18);
> >  
> >         imx7_csi_reg_write(csi, (width * out_pix->height) >> 2,
> > CSI_CSIRXCNT);
> 
> this patch series looks good to me - I need it for the driver to run on
> imx8mq.
> 
> Reviewed-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> 
> Could you either rebase and resend as non-RFC or queue them up more
> directly?

I've just sent a pull request that includes v1.1 of this patch. I'm
sorry I missed your Reviewed-by tag :-S

https://lore.kernel.org/linux-media/YQFY5FS8v3Y3KkEA@pendragon.ideasonboard.com/T/#u

-- 
Regards,

Laurent Pinchart
