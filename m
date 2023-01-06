Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7B6D660679
	for <lists+linux-media@lfdr.de>; Fri,  6 Jan 2023 19:40:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235688AbjAFSkI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Jan 2023 13:40:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229949AbjAFSkF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Jan 2023 13:40:05 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBC4F7CDD1;
        Fri,  6 Jan 2023 10:40:04 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 12AC24AE;
        Fri,  6 Jan 2023 19:40:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673030403;
        bh=eKTjCmNETdoTWuGxya1AaXh3iHPcYCLW/EQ66gdW1KU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=s32TjE4l5VxD54umwLVjqdErnG94fbs+tuMFvuV4VpWIWTrqLWBezxYRMWnc6X0IN
         cny+iZwGi5ivKJ6On5j78hB2PMWZ2d8+JobRP9ojrchUTZn6Q3nqfTtw+P3/qm7Dmy
         u78YP23fkbrVUQDkgf89qCT7XX6RQvSgMIX88rPg=
Date:   Fri, 6 Jan 2023 20:39:58 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fabio Estevam <festevam@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/8] media: imx-pxp: explicitly disable unused blocks
Message-ID: <Y7hq/lrZcOUIv3XY@pendragon.ideasonboard.com>
References: <20230105134729.59542-1-m.tretter@pengutronix.de>
 <20230105134729.59542-5-m.tretter@pengutronix.de>
 <Y7gTgEDL1qsWfH8r@pendragon.ideasonboard.com>
 <20230106140855.GD24101@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230106140855.GD24101@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

On Fri, Jan 06, 2023 at 03:08:55PM +0100, Michael Tretter wrote:
> On Fri, 06 Jan 2023 14:26:40 +0200, Laurent Pinchart wrote:
> > On Thu, Jan 05, 2023 at 02:47:25PM +0100, Michael Tretter wrote:
> > > Various multiplexers in the pipeline are not used with the currently
> > > configured data path. Disable all unused multiplexers by selecting the
> > > "no output" (3) option.
> > > 
> > > The datasheet doesn't explicitly require this, but the PXP has been seen
> > > to hang after processing a few hundreds of frames otherwise.
> > 
> > On which platform(s) have you noticed that ?
> 
> I didn't observe this myself, but took this information from the comment in
> your earlier patch [0] that disables the unused multiplexers.
> 
> https://lore.kernel.org/linux-media/20200510223100.11641-2-laurent.pinchart@ideasonboard.com/

I suppose I should trust myself :-)

> > > As at it, add documentation for the multiplexers that are actually
> > > relevant for the data path.
> > > 
> > > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > > ---
> > >  drivers/media/platform/nxp/imx-pxp.c | 30 +++++++++++++++++-----------
> > >  1 file changed, 18 insertions(+), 12 deletions(-)
> > > 
> > > diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
> > > index a957fee88829..6ffd07cda965 100644
> > > --- a/drivers/media/platform/nxp/imx-pxp.c
> > > +++ b/drivers/media/platform/nxp/imx-pxp.c
> > > @@ -731,22 +731,28 @@ static u32 pxp_data_path_ctrl0(struct pxp_ctx *ctx)
> > >  	u32 ctrl0;
> > >  
> > >  	ctrl0 = 0;
> > > -	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX15_SEL(0);
> > > +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX15_SEL(3);
> > > +	/* Bypass Dithering x3CH */
> > >  	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX14_SEL(1);
> > > -	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX13_SEL(0);
> > > +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX13_SEL(3);
> > > +	/* Select Rotation */
> > >  	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX12_SEL(0);
> > > +	/* Select LUT */
> > >  	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX11_SEL(0);
> > > -	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX10_SEL(0);
> > > +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX10_SEL(3);
> > > +	/* Select MUX8 for LUT */
> > >  	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX9_SEL(1);
> > > +	/* Select CSC 2 */
> > >  	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX8_SEL(0);
> > > -	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX7_SEL(0);
> > > -	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX6_SEL(0);
> > > -	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX5_SEL(0);
> > > -	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX4_SEL(0);
> > > +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX7_SEL(3);
> > > +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX6_SEL(3);
> > > +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX5_SEL(3);
> > > +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX4_SEL(3);
> > > +	/* Bypass Rotation 2 */
> > >  	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX3_SEL(0);
> > > -	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX2_SEL(0);
> > > -	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX1_SEL(0);
> > > -	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX0_SEL(0);
> > > +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX2_SEL(3);
> > > +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX1_SEL(3);
> > > +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX0_SEL(3);
> > 
> > The muxes being disabled look fine to me, but the values of MUX8, MUX12
> > and MUX14 look strange based on the i.MX7D reference manual. Maybe the
> > register values were different in previous SoCs ? I haven't found any
> > other relevant reference manual that document the mux values, I may have
> > overlooked something.
> 
> The MUX8, MUX12 and MUX14 are documented in the i.MX6ULL reference manual
> section 41.11.51 and their location and function in the data path is shown in
> Figure 41-1. "PXP Architecture" on page 2490.

I've seen that, but as far as I can tell, the description of the
register in section 41.11.51 doesn't tell what the different MUX* field
value map to. Figure 41-1 shows that, for instance, MUX8 handles CSC2
bypass, but it doesn't tell what value corresponds to what path.

> > Anyway, this isn't an issue with this patch, so
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > >  
> > >  	return ctrl0;
> > >  }
> > > @@ -760,8 +766,8 @@ static void pxp_set_data_path(struct pxp_ctx *ctx)
> > >  	ctrl0 = pxp_data_path_ctrl0(ctx);
> > >  
> > >  	ctrl1 = 0;
> > > -	ctrl1 |= BF_PXP_DATA_PATH_CTRL1_MUX17_SEL(1);
> > > -	ctrl1 |= BF_PXP_DATA_PATH_CTRL1_MUX16_SEL(1);
> > > +	ctrl1 |= BF_PXP_DATA_PATH_CTRL1_MUX17_SEL(3);
> > > +	ctrl1 |= BF_PXP_DATA_PATH_CTRL1_MUX16_SEL(3);
> > >  
> > >  	writel(ctrl0, dev->mmio + HW_PXP_DATA_PATH_CTRL0);
> > >  	writel(ctrl1, dev->mmio + HW_PXP_DATA_PATH_CTRL1);

-- 
Regards,

Laurent Pinchart
