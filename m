Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 233394BE3C1
	for <lists+linux-media@lfdr.de>; Mon, 21 Feb 2022 18:57:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356504AbiBULg1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Feb 2022 06:36:27 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244809AbiBULg0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Feb 2022 06:36:26 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FE52DF48
        for <linux-media@vger.kernel.org>; Mon, 21 Feb 2022 03:36:03 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C0A13482;
        Mon, 21 Feb 2022 12:36:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645443362;
        bh=VWzwJ31kjwe24wnRnbcnbXZ2aQXEHgBBcssSGy2JmD4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LnIHs5LAU1ksca5jP5zJqJFdGR0bhfr6NiM3z1fyA5Nv4FUN/SXLauZInpwadUIgs
         KOHZJlDJIcbi+njoYTjtzgY2fw6RHtA9RPT+qFMdur5xtUccZQEv0XEevsHRGziuhK
         HgBdbeUhM1kyPTFqyjDYUelf124Fu5EwBrWEdFjQ=
Date:   Mon, 21 Feb 2022 13:35:52 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     aford173@gmail.com, slongerbeam@gmail.com, p.zabel@pengutronix.de,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        martin.kepplinger@puri.sm, rmfrfs@gmail.com,
        xavier.roumegue@oss.nxp.com, alexander.stein@ew.tq-group.com,
        dorota.czaplejewicz@puri.sm, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] media: imx: imx8mp-mipi-csi2: Remove YUV422 2X8
Message-ID: <YhN5GA2otjcPzcGT@pendragon.ideasonboard.com>
References: <20220221111611.52905-1-jacopo@jmondi.org>
 <YhN29Tat/GMl+2eS@pendragon.ideasonboard.com>
 <20220221112915.44zmds5mxolj2rkv@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220221112915.44zmds5mxolj2rkv@uno.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Mon, Feb 21, 2022 at 12:29:15PM +0100, Jacopo Mondi wrote:
> On Mon, Feb 21, 2022 at 01:26:45PM +0200, Laurent Pinchart wrote:
> > On Mon, Feb 21, 2022 at 12:16:11PM +0100, Jacopo Mondi wrote:
> > > The 2X8 variants of MEDIA_BUS_FMT_YUYV8_2X8 does not apply to serial
> >
> > Maybe s/serial/CSI-2/
> >
> > > busses.
> > >
> > > Drop it and while at it beautify the formats declaration list a little
> > > by putting the opening curly brace after the comment.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > ---
> > >  drivers/staging/media/imx/imx8mq-mipi-csi2.c | 6 ++----
> > >  1 file changed, 2 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/staging/media/imx/imx8mq-mipi-csi2.c b/drivers/staging/media/imx/imx8mq-mipi-csi2.c
> > > index 56ef3b3b2906..a3e33ce83c1f 100644
> > > --- a/drivers/staging/media/imx/imx8mq-mipi-csi2.c
> > > +++ b/drivers/staging/media/imx/imx8mq-mipi-csi2.c
> > > @@ -200,11 +200,9 @@ static const struct csi2_pix_format imx8mq_mipi_csi_formats[] = {
> > >  	}, {
> > >  		.code = MEDIA_BUS_FMT_SRGGB14_1X14,
> > >  		.width = 14,
> > > -	}, {
> > > +	},
> > >  	/* YUV formats */
> > > -		.code = MEDIA_BUS_FMT_YUYV8_2X8,
> > > -		.width = 16,
> > > -	}, {
> > > +	{
> > >  		.code = MEDIA_BUS_FMT_YUYV8_1X16,
> >
> > While at it, should we also switch this to MEDIA_BUS_FMT_UYVY8_1X16,
> > which is the canonical format for YUV422 8-bit on CSI-2 ?
> >
> 
> Should I ?
> I forgot why UYVY is preferred over YUYV.

It's a convention, we picked UYVY for CSI-2 a long time ago. Sensor
drivers should match that convention.

> Also this will break quite some scripts for many users :)
> Should I rather add it instead ?

We can also support the non-standard YUYV order if the sensor does as
well, so I don't mind having both options here. The important part is to
have UYVY.

> No problem for me in either cases
> 
> > >  		.width = 16,
> > >  	}

-- 
Regards,

Laurent Pinchart
