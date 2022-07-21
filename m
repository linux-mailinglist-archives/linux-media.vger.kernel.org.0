Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35D5757C9C6
	for <lists+linux-media@lfdr.de>; Thu, 21 Jul 2022 13:32:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233005AbiGULcp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jul 2022 07:32:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbiGULco (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jul 2022 07:32:44 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D069947B95
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 04:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658403163; x=1689939163;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HA4H83DCz5tsP4yEcoXGdG811sZ+516EIix/uyDxZFc=;
  b=QSQH3oasxhYQc3l6hG9EpcwUT3GVl4jm9ZZkMX+/aJfUHvwF0RaoeRyj
   tXoHwj5NibUcoJlmxjSX/+2eHhqz/EZPXLGwBlJVNv4u50X0rACEGYI2B
   c17uotGLSVYUU5n4qHcFERXGbqPPOoNjyajltxPdH0Byt9uNrJ36aDYTU
   CH4ipGJFjitRaOgvH5mTgOLARMwgBjhUrnmS5GUNQL9mCuUEPErMIaofU
   iI4NNlSMGYZ/yFM/6wfNNraFkoLh2J+5aWn0l0ZIUxRvX3xLn1MYT6UmN
   w5n7xc2NRzRFdR1CZv3mcXu3TfSzTFaNp63MrgsEuT7XCTnbunaSymX7x
   w==;
X-IronPort-AV: E=Sophos;i="5.92,289,1650924000"; 
   d="scan'208";a="25183432"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 21 Jul 2022 13:32:41 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 21 Jul 2022 13:32:41 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 21 Jul 2022 13:32:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658403161; x=1689939161;
  h=from:to:cc:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding:subject;
  bh=HA4H83DCz5tsP4yEcoXGdG811sZ+516EIix/uyDxZFc=;
  b=hdBY1InmQgdGVpJJOiRa6FjqteH+nQ9B9VgVJHjM4eAVswcqw2NDSgOl
   MhjmBulHT+VRGrncWywYP7SKQyFWw2piTNv6yr4whW/U1oQnHH4RmrWoE
   dR7UqMf8iy79iIPj2iW9jb2VgnAvgQSfEUZKJzeUKe9dpKvJ+JugVbJxa
   BXWyk+DvpfaFzXWrbJj6iYEgcEoWYm2A8MyeWJLO1a01UpRBxKyWoVCSk
   Q8bWsh91FiEGg0t0/AkTUQ10+eTBYNBCJeo4yQ300TVnaXIlL2+7r5EVk
   NSQUn8XMOzOYWD01gD+vvnvlxkPknZtCvN2XGGhN2kMxhOhyBVgjzWwoq
   g==;
X-IronPort-AV: E=Sophos;i="5.92,289,1650924000"; 
   d="scan'208";a="25183430"
Subject: Re: Re: [PATCH 14/19] media: i2c: imx290: Implement HBLANK and VBLANK
 controls
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 21 Jul 2022 13:32:40 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id D37F9280056;
        Thu, 21 Jul 2022 13:32:40 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Date:   Thu, 21 Jul 2022 13:32:40 +0200
Message-ID: <4167869.k3LOHGUjKi@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <Ytk1wWOec2tkOB8M@pendragon.ideasonboard.com>
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com> <3399452.atdPhlSkOF@steina-w> <Ytk1wWOec2tkOB8M@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Am Donnerstag, 21. Juli 2022, 13:17:21 CEST schrieb Laurent Pinchart:
> Hi Alexander,
> 
> On Thu, Jul 21, 2022 at 12:05:46PM +0200, Alexander Stein wrote:
> > Am Donnerstag, 21. Juli 2022, 10:35:35 CEST schrieb Laurent Pinchart:
> > > Add support for the V4L2_CID_HBLANK and V4L2_CID_VBLANK controls to the
> > > imx290 driver. Make the controls read-only to start with, to report the
> > > values to userspace for timing calculation.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > > 
> > >  drivers/media/i2c/imx290.c | 39 +++++++++++++++++++++++++++++++++++++-
> > >  1 file changed, 38 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > > index 4408dd3e191f..7190399f4111 100644
> > > --- a/drivers/media/i2c/imx290.c
> > > +++ b/drivers/media/i2c/imx290.c
> > > @@ -146,6 +146,8 @@ struct imx290 {
> > > 
> > >  	struct v4l2_ctrl_handler ctrls;
> > >  	struct v4l2_ctrl *link_freq;
> > >  	struct v4l2_ctrl *pixel_rate;
> > > 
> > > +	struct v4l2_ctrl *hblank;
> > > +	struct v4l2_ctrl *vblank;
> > > 
> > >  	struct mutex lock;
> > >  
> > >  };
> > > 
> > > @@ -642,6 +644,20 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
> > > 
> > >  		if (imx290->pixel_rate)
> > >  		
> > >  			__v4l2_ctrl_s_ctrl_int64(imx290->pixel_rate,
> > >  			
> > >  						 
imx290_calc_pixel_rate(imx290));
> > > 
> > > +
> > > +		if (imx290->hblank) {
> > > +			unsigned int hblank = mode->hmax - mode-
>width;
> > > +
> > > +			__v4l2_ctrl_modify_range(imx290->hblank, 
hblank, hblank,
> > > +						 1, hblank);
> > > +		}
> > > +
> > > +		if (imx290->vblank) {
> > > +			unsigned int vblank = IMX290_VMAX_DEFAULT - 
mode->height;
> > > +
> > > +			__v4l2_ctrl_modify_range(imx290->vblank, 
vblank, vblank,
> > > +						 1, vblank);
> > > +		}
> > > 
> > >  	}
> > >  	
> > >  	*format = fmt->format;
> > > 
> > > @@ -880,9 +896,10 @@ static const struct media_entity_operations
> > > imx290_subdev_entity_ops = {> > 
> > >  static int imx290_ctrl_init(struct imx290 *imx290)
> > >  {
> > > 
> > > +	unsigned int blank;
> > > 
> > >  	int ret;
> > > 
> > > -	v4l2_ctrl_handler_init(&imx290->ctrls, 5);
> > > +	v4l2_ctrl_handler_init(&imx290->ctrls, 7);
> > > 
> > >  	imx290->ctrls.lock = &imx290->lock;
> > >  	
> > >  	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> > > 
> > > @@ -910,6 +927,26 @@ static int imx290_ctrl_init(struct imx290 *imx290)
> > > 
> > >  				     
ARRAY_SIZE(imx290_test_pattern_menu) - 1,
> > >  				     0, 0, 
imx290_test_pattern_menu);
> > > 
> > > +	/*
> > > +	 * Horizontal blanking is controlled through the HMAX register, 
which
> > > +	 * contains a line length in INCK clock units. The INCK frequency 
is
> > > +	 * fixed to 74.25 MHz. The HMAX value is currently fixed to 1100,
> > > +	 * convert it to a number of pixels based on the nominal pixel 
rate.
> > > +	 */
> > 
> > Currently the driver only supports 37.125 MHz, please refer to
> > imx290_probe.
> Indeed. Re-reading the comment, I suspect something is wrong, as hmax is
> not converted to pixels here (and is also not fixed to 1100). The only
> datasheet I found that is publicly accessed doesn't explain very clearly
> how the HMAX value should be computed. Based on your experience with IMX
> sensors, would you be able to shed some light on this ?

Can you share the link to this datasheet you found?
Sorry, my experience is more like try and error. I don't fully understand this 
as well, but apparently this depends on frame rate select (FRSEL).

Best regards,
Alexander

> > > +	blank = imx290->current_mode->hmax - imx290->current_mode->width;
> > > +	imx290->hblank = v4l2_ctrl_new_std(&imx290->ctrls, 
&imx290_ctrl_ops,
> > > +					   V4L2_CID_HBLANK, 
blank, blank, 1,
> > > +					   blank);
> > > +	if (imx290->hblank)
> > > +		imx290->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > > +
> > > +	blank = IMX290_VMAX_DEFAULT - imx290->current_mode->height;
> > > +	imx290->vblank = v4l2_ctrl_new_std(&imx290->ctrls, 
&imx290_ctrl_ops,
> > > +					   V4L2_CID_VBLANK, 
blank, blank, 1,
> > > +					   blank);
> > > +	if (imx290->vblank)
> > > +		imx290->vblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > > +
> > > 
> > >  	imx290->sd.ctrl_handler = &imx290->ctrls;
> > >  	
> > >  	if (imx290->ctrls.error) {




