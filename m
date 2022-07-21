Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 994A957C9A2
	for <lists+linux-media@lfdr.de>; Thu, 21 Jul 2022 13:17:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233013AbiGULR0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jul 2022 07:17:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbiGULR0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jul 2022 07:17:26 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3F4E81B0E
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 04:17:24 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 360EB496;
        Thu, 21 Jul 2022 13:17:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1658402243;
        bh=HarqVL04CNjSZQMaIpVewVDXTux1ireyWp2VcXygxlE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hah9L2QZAzdNnbC89IjK9eX7uKMtrFtIwql6p+DRwXNQiNzZthvonKP5pCk1+xakE
         1boetjcd3u2+yV2B9JSHbnf+cVjXIIqTQ/6TxDNkbHlq1RB70/0SmyqnnYfcUEuiqk
         PeG7IjoTcjrLdHvJvEDpCh9bipz7YHR8iFLy5A2Y=
Date:   Thu, 21 Jul 2022 14:17:21 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     linux-media@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH 14/19] media: i2c: imx290: Implement HBLANK and VBLANK
 controls
Message-ID: <Ytk1wWOec2tkOB8M@pendragon.ideasonboard.com>
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com>
 <20220721083540.1525-15-laurent.pinchart@ideasonboard.com>
 <3399452.atdPhlSkOF@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3399452.atdPhlSkOF@steina-w>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,

On Thu, Jul 21, 2022 at 12:05:46PM +0200, Alexander Stein wrote:
> Am Donnerstag, 21. Juli 2022, 10:35:35 CEST schrieb Laurent Pinchart:
> > Add support for the V4L2_CID_HBLANK and V4L2_CID_VBLANK controls to the
> > imx290 driver. Make the controls read-only to start with, to report the
> > values to userspace for timing calculation.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/i2c/imx290.c | 39 +++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 38 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > index 4408dd3e191f..7190399f4111 100644
> > --- a/drivers/media/i2c/imx290.c
> > +++ b/drivers/media/i2c/imx290.c
> > @@ -146,6 +146,8 @@ struct imx290 {
> >  	struct v4l2_ctrl_handler ctrls;
> >  	struct v4l2_ctrl *link_freq;
> >  	struct v4l2_ctrl *pixel_rate;
> > +	struct v4l2_ctrl *hblank;
> > +	struct v4l2_ctrl *vblank;
> > 
> >  	struct mutex lock;
> >  };
> > @@ -642,6 +644,20 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
> >  		if (imx290->pixel_rate)
> >  			__v4l2_ctrl_s_ctrl_int64(imx290->pixel_rate,
> >  						 imx290_calc_pixel_rate(imx290));
> > +
> > +		if (imx290->hblank) {
> > +			unsigned int hblank = mode->hmax - mode->width;
> > +
> > +			__v4l2_ctrl_modify_range(imx290->hblank, hblank, hblank,
> > +						 1, hblank);
> > +		}
> > +
> > +		if (imx290->vblank) {
> > +			unsigned int vblank = IMX290_VMAX_DEFAULT - mode->height;
> > +
> > +			__v4l2_ctrl_modify_range(imx290->vblank, vblank, vblank,
> > +						 1, vblank);
> > +		}
> >  	}
> > 
> >  	*format = fmt->format;
> > @@ -880,9 +896,10 @@ static const struct media_entity_operations imx290_subdev_entity_ops = {
> > 
> >  static int imx290_ctrl_init(struct imx290 *imx290)
> >  {
> > +	unsigned int blank;
> >  	int ret;
> > 
> > -	v4l2_ctrl_handler_init(&imx290->ctrls, 5);
> > +	v4l2_ctrl_handler_init(&imx290->ctrls, 7);
> >  	imx290->ctrls.lock = &imx290->lock;
> > 
> >  	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> > @@ -910,6 +927,26 @@ static int imx290_ctrl_init(struct imx290 *imx290)
> >  				     ARRAY_SIZE(imx290_test_pattern_menu) - 1,
> >  				     0, 0, imx290_test_pattern_menu);
> > 
> > +	/*
> > +	 * Horizontal blanking is controlled through the HMAX register, which
> > +	 * contains a line length in INCK clock units. The INCK frequency is
> > +	 * fixed to 74.25 MHz. The HMAX value is currently fixed to 1100,
> > +	 * convert it to a number of pixels based on the nominal pixel rate.
> > +	 */
> 
> Currently the driver only supports 37.125 MHz, please refer to imx290_probe.

Indeed. Re-reading the comment, I suspect something is wrong, as hmax is
not converted to pixels here (and is also not fixed to 1100). The only
datasheet I found that is publicly accessed doesn't explain very clearly
how the HMAX value should be computed. Based on your experience with IMX
sensors, would you be able to shed some light on this ?

> > +	blank = imx290->current_mode->hmax - imx290->current_mode->width;
> > +	imx290->hblank = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> > +					   V4L2_CID_HBLANK, blank, blank, 1,
> > +					   blank);
> > +	if (imx290->hblank)
> > +		imx290->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > +
> > +	blank = IMX290_VMAX_DEFAULT - imx290->current_mode->height;
> > +	imx290->vblank = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> > +					   V4L2_CID_VBLANK, blank, blank, 1,
> > +					   blank);
> > +	if (imx290->vblank)
> > +		imx290->vblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > +
> >  	imx290->sd.ctrl_handler = &imx290->ctrls;
> > 
> >  	if (imx290->ctrls.error) {

-- 
Regards,

Laurent Pinchart
