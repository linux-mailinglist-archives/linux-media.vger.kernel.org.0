Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB26C635A5F
	for <lists+linux-media@lfdr.de>; Wed, 23 Nov 2022 11:43:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236515AbiKWKlu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Nov 2022 05:41:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236473AbiKWKla (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Nov 2022 05:41:30 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13E0213413F
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 02:25:38 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7AEC6890;
        Wed, 23 Nov 2022 11:25:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669199136;
        bh=2C7EboJmMcm6cY1rnTt64AHG3629MpandDyaIjbRNxI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jcojCw2vg98uhqBv90u6Awd65G+GzEWV1HGynDS7MNDg1WjsYXvM/5f+AypaOQtoP
         dkvZntBatUqJBvT2bigTia0CsF2LzBU1qlBUbCVWqNC0TcYVE55tO2iRtRx87IO+U0
         RTk++XtSjb+btM7pWuwEs8GijtFol7gqDeJL0azA=
Date:   Wed, 23 Nov 2022 12:25:21 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH v1 15/15] media: i2c: imx290: Simplify
 imx290_set_data_lanes()
Message-ID: <Y331EbmsjgVyRXiE@pendragon.ideasonboard.com>
References: <20221122223250.21233-1-laurent.pinchart@ideasonboard.com>
 <20221122223250.21233-16-laurent.pinchart@ideasonboard.com>
 <2139506.Icojqenx9y@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2139506.Icojqenx9y@steina-w>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,

On Wed, Nov 23, 2022 at 10:04:58AM +0100, Alexander Stein wrote:
> Am Dienstag, 22. November 2022, 23:32:50 CET schrieb Laurent Pinchart:
> > There's no need to check for an incorrect number of data lanes in
> > imx290_set_data_lanes() as the value is validated at probe() time. Drop
> > the check.
> > 
> > The PHY_LANE_NUM and CSI_LANE_MODE registers are programmed with a value
> > equal to the number of lanes minus one. Compute it instead of handling
> > it in the switch/case.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/i2c/imx290.c | 17 +++++------------
> >  1 file changed, 5 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > index 4dfa090f918d..369db35a7afd 100644
> > --- a/drivers/media/i2c/imx290.c
> > +++ b/drivers/media/i2c/imx290.c
> > @@ -512,28 +512,21 @@ static int imx290_set_register_array(struct imx290
> > *imx290,
> > 
> >  static int imx290_set_data_lanes(struct imx290 *imx290)
> >  {
> > -	int ret = 0, laneval, frsel;
> > +	int ret = 0;
> 
> You can remove ret and make function returning void as well as there 
> (currently) is no error handling at all. The current single caller also 
> ignores the return value.

There's error handling in this function, in the imx290_write() calls.
The ret variable should stay at least for that. As for making the
function void, I would rather fix the caller. I'll add a patch for that
in v2.

> > +	u32 frsel;
> > 
> >  	switch (imx290->nlanes) {
> >  	case 2:
> > -		laneval = 0x01;
> > +	default:
> >  		frsel = 0x02;
> >  		break;
> >  	case 4:
> > -		laneval = 0x03;
> >  		frsel = 0x01;
> >  		break;
> > -	default:
> > -		/*
> > -		 * We should never hit this since the data lane count is
> > -		 * validated in probe itself
> > -		 */
> > -		dev_err(imx290->dev, "Lane configuration not supported\n");
> > -		return -EINVAL;
> >  	}
> > 
> > -	imx290_write(imx290, IMX290_PHY_LANE_NUM, laneval, &ret);
> > -	imx290_write(imx290, IMX290_CSI_LANE_MODE, laneval, &ret);
> > +	imx290_write(imx290, IMX290_PHY_LANE_NUM, imx290->nlanes - 1, &ret);
> > +	imx290_write(imx290, IMX290_CSI_LANE_MODE, imx290->nlanes - 1, &ret);
> >  	imx290_write(imx290, IMX290_FR_FDG_SEL, frsel, &ret);
> > 
> >  	return ret;

-- 
Regards,

Laurent Pinchart
