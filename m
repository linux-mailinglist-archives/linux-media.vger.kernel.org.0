Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 792D04BDF9F
	for <lists+linux-media@lfdr.de>; Mon, 21 Feb 2022 18:50:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347284AbiBUL3t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Feb 2022 06:29:49 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:47186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356254AbiBUL3p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Feb 2022 06:29:45 -0500
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [IPv6:2001:4b98:dc4:8::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61C68D59
        for <linux-media@vger.kernel.org>; Mon, 21 Feb 2022 03:29:21 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id DC409200003;
        Mon, 21 Feb 2022 11:29:16 +0000 (UTC)
Date:   Mon, 21 Feb 2022 12:29:15 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     aford173@gmail.com, slongerbeam@gmail.com, p.zabel@pengutronix.de,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        martin.kepplinger@puri.sm, rmfrfs@gmail.com,
        xavier.roumegue@oss.nxp.com, alexander.stein@ew.tq-group.com,
        dorota.czaplejewicz@puri.sm, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] media: imx: imx8mp-mipi-csi2: Remove YUV422 2X8
Message-ID: <20220221112915.44zmds5mxolj2rkv@uno.localdomain>
References: <20220221111611.52905-1-jacopo@jmondi.org>
 <YhN29Tat/GMl+2eS@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YhN29Tat/GMl+2eS@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Mon, Feb 21, 2022 at 01:26:45PM +0200, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Mon, Feb 21, 2022 at 12:16:11PM +0100, Jacopo Mondi wrote:
> > The 2X8 variants of MEDIA_BUS_FMT_YUYV8_2X8 does not apply to serial
>
> Maybe s/serial/CSI-2/
>
> > busses.
> >
> > Drop it and while at it beautify the formats declaration list a little
> > by putting the opening curly brace after the comment.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  drivers/staging/media/imx/imx8mq-mipi-csi2.c | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/staging/media/imx/imx8mq-mipi-csi2.c b/drivers/staging/media/imx/imx8mq-mipi-csi2.c
> > index 56ef3b3b2906..a3e33ce83c1f 100644
> > --- a/drivers/staging/media/imx/imx8mq-mipi-csi2.c
> > +++ b/drivers/staging/media/imx/imx8mq-mipi-csi2.c
> > @@ -200,11 +200,9 @@ static const struct csi2_pix_format imx8mq_mipi_csi_formats[] = {
> >  	}, {
> >  		.code = MEDIA_BUS_FMT_SRGGB14_1X14,
> >  		.width = 14,
> > -	}, {
> > +	},
> >  	/* YUV formats */
> > -		.code = MEDIA_BUS_FMT_YUYV8_2X8,
> > -		.width = 16,
> > -	}, {
> > +	{
> >  		.code = MEDIA_BUS_FMT_YUYV8_1X16,
>
> While at it, should we also switch this to MEDIA_BUS_FMT_UYVY8_1X16,
> which is the canonical format for YUV422 8-bit on CSI-2 ?
>

Should I ?
I forgot why UYVY is preferred over YUYV.

Also this will break quite some scripts for many users :)
Should I rather add it instead ?

No problem for me in either cases

> >  		.width = 16,
> >  	}
>
> --
> Regards,
>
> Laurent Pinchart
