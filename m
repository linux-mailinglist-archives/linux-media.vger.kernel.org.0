Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C58657C934
	for <lists+linux-media@lfdr.de>; Thu, 21 Jul 2022 12:40:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232620AbiGUKkn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jul 2022 06:40:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232613AbiGUKkm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jul 2022 06:40:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E8E2481C3
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 03:40:40 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2A064496;
        Thu, 21 Jul 2022 12:40:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1658400038;
        bh=3OSoPgEFfn441/N+K4BOr6J4yJayFMNH/xKjLg8ax+E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=V8Y/4cOH/mtmY98P+XWfAxll4h+FO2r4JOkC+SpAx7ERYidJAT3tHgedA7OXP3vwW
         HUrsg391hiGjijN95iUzf/0wZB13tm2T3u0tsKahsLNRqVLWA9l961tgsNFYUxGqXb
         KdmAxxmj8bQ5ExtE16zMGhFHhuWY5eGgfXHGQglU=
Date:   Thu, 21 Jul 2022 13:40:36 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     linux-media@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH 16/19] media: i2c: imx290: Move registers with fixed
 value to init array
Message-ID: <YtktJD/HQu44jTdr@pendragon.ideasonboard.com>
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com>
 <20220721083540.1525-17-laurent.pinchart@ideasonboard.com>
 <3980578.jE0xQCEvom@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3980578.jE0xQCEvom@steina-w>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,

On Thu, Jul 21, 2022 at 12:08:50PM +0200, Alexander Stein wrote:
> Am Donnerstag, 21. Juli 2022, 10:35:37 CEST schrieb Laurent Pinchart:
> > Registers 0x3012, 0x3013 and 0x3480 are not documented and are set in
> > the per-mode register arrays with values indentical for all modes. Move
> > them to the common array.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/i2c/imx290.c | 8 ++------
> >  1 file changed, 2 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > index 78772c6327a2..fc6e87fada1c 100644
> > --- a/drivers/media/i2c/imx290.c
> > +++ b/drivers/media/i2c/imx290.c
> > @@ -192,6 +192,7 @@ static const struct imx290_regval
> > imx290_global_init_settings[] = { { IMX290_REG_8BIT(0x300f), 0x00 },
> >  	{ IMX290_REG_8BIT(0x3010), 0x21 },
> >  	{ IMX290_REG_8BIT(0x3012), 0x64 },
> > +	{ IMX290_REG_8BIT(0x3013), 0x00 },
> >  	{ IMX290_REG_8BIT(0x3016), 0x09 },
> >  	{ IMX290_REG_8BIT(0x3070), 0x02 },
> >  	{ IMX290_REG_8BIT(0x3071), 0x11 },
> > @@ -230,6 +231,7 @@ static const struct imx290_regval
> > imx290_global_init_settings[] = { { IMX290_REG_8BIT(0x33b0), 0x50 },
> >  	{ IMX290_REG_8BIT(0x33b2), 0x1a },
> >  	{ IMX290_REG_8BIT(0x33b3), 0x04 },
> > +	{ IMX290_REG_8BIT(0x3480), 0x49 },
> >  };
> > 
> >  static const struct imx290_regval imx290_1080p_settings[] = {
> > @@ -239,15 +241,12 @@ static const struct imx290_regval
> > imx290_1080p_settings[] = { { IMX290_OPB_SIZE_V, 10 },
> >  	{ IMX290_X_OUT_SIZE, 1920 },
> >  	{ IMX290_Y_OUT_SIZE, 1080 },
> > -	{ IMX290_REG_8BIT(0x3012), 0x64 },
> > -	{ IMX290_REG_8BIT(0x3013), 0x00 },
> >  	{ IMX290_INCKSEL1, 0x18 },
> >  	{ IMX290_INCKSEL2, 0x03 },
> >  	{ IMX290_INCKSEL3, 0x20 },
> >  	{ IMX290_INCKSEL4, 0x01 },
> >  	{ IMX290_INCKSEL5, 0x1a },
> >  	{ IMX290_INCKSEL6, 0x1a },
> > -	{ IMX290_REG_8BIT(0x3480), 0x49 },
> >  	/* data rate settings */
> >  	{ IMX290_REPETITION, 0x10 },
> >  	{ IMX290_TCLKPOST, 87 },
> > @@ -267,15 +266,12 @@ static const struct imx290_regval
> > imx290_720p_settings[] = { { IMX290_OPB_SIZE_V, 4 },
> >  	{ IMX290_X_OUT_SIZE, 1280 },
> >  	{ IMX290_Y_OUT_SIZE, 720 },
> > -	{ IMX290_REG_8BIT(0x3012), 0x64 },
> > -	{ IMX290_REG_8BIT(0x3013), 0x00 },
> >  	{ IMX290_INCKSEL1, 0x20 },
> >  	{ IMX290_INCKSEL2, 0x00 },
> >  	{ IMX290_INCKSEL3, 0x20 },
> >  	{ IMX290_INCKSEL4, 0x01 },
> >  	{ IMX290_INCKSEL5, 0x1a },
> >  	{ IMX290_INCKSEL6, 0x1a },
> > -	{ IMX290_REG_8BIT(0x3480), 0x49 },
> >  	/* data rate settings */
> >  	{ IMX290_REPETITION, 0x10 },
> >  	{ IMX290_TCLKPOST, 79 },
> 
> 0x3480 is INCKSEL7 for imx327, not sure if that should be set yet for imx290 
> (only) driver, without proper imx327 support.

Do you mean the register doesn't exist on the IMX290 ? We could make it
conditional on the sensor model, but it's not added by this patch, it
has been there since the first version of the driver, so I'd rather do
that on top.

-- 
Regards,

Laurent Pinchart
