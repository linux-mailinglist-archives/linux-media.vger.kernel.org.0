Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B82FB57C926
	for <lists+linux-media@lfdr.de>; Thu, 21 Jul 2022 12:37:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232771AbiGUKhS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jul 2022 06:37:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233400AbiGUKhB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jul 2022 06:37:01 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96E5683F05
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 03:36:46 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4BEF1496;
        Thu, 21 Jul 2022 12:36:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1658399797;
        bh=RcouM7KjPSBZouKe89CEK1182/QVoxNsxGFcwNZBqiI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oDbt1b3ZQbFGI3NK0kyoD2VEj8vINvtEVj+B7lsUHlg7b4P8IAqc57BCSyOCrqMzp
         mgnRT6yKEgGY+APWimBRviuk/7PPKJ0rRRMd7KWth3/jNqNHfs5SGwZU/cCRLl158/
         Ic5DdoAxNY7o3aVqhnzlxMSfxYeobfPdBtrTWp4E=
Date:   Thu, 21 Jul 2022 13:36:35 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     linux-media@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH 17/19] media: i2c: imx290: Factor out format retrieval to
 separate function
Message-ID: <YtksM7F7xzhf2K89@pendragon.ideasonboard.com>
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com>
 <20220721083540.1525-18-laurent.pinchart@ideasonboard.com>
 <830803795.0ifERbkFSE@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <830803795.0ifERbkFSE@steina-w>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,

On Thu, Jul 21, 2022 at 12:11:31PM +0200, Alexander Stein wrote:
> Am Donnerstag, 21. Juli 2022, 10:35:38 CEST schrieb Laurent Pinchart:
> > The driver duplicates the same pattern to access the try or active
> > format in multiple locations. Factor it out to a separate function.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/i2c/imx290.c | 28 ++++++++++++++++++----------
> >  1 file changed, 18 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > index fc6e87fada1c..baf9941c5fbe 100644
> > --- a/drivers/media/i2c/imx290.c
> > +++ b/drivers/media/i2c/imx290.c
> > @@ -519,6 +519,20 @@ static const struct v4l2_ctrl_ops imx290_ctrl_ops = {
> >  	.s_ctrl = imx290_set_ctrl,
> >  };
> > 
> > +static struct v4l2_mbus_framefmt *
> > +imx290_get_pad_format(struct imx290 *imx290, struct v4l2_subdev_state *state,
> > +		      u32 which)
> > +{
> > +	switch (which) {
> > +	case V4L2_SUBDEV_FORMAT_TRY:
> > +		return v4l2_subdev_get_try_format(&imx290->sd, state, 0);
> > +	case V4L2_SUBDEV_FORMAT_ACTIVE:
> > +		return &imx290->current_format;
> > +	default:
> > +		return NULL;
> > +	}
> > +}
> > +
> >  static int imx290_enum_mbus_code(struct v4l2_subdev *sd,
> >  				 struct v4l2_subdev_state *sd_state,
> >  				 struct v4l2_subdev_mbus_code_enum *code)
> > @@ -562,12 +576,7 @@ static int imx290_get_fmt(struct v4l2_subdev *sd,
> > 
> >  	mutex_lock(&imx290->lock);
> > 
> > -	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
> > -		framefmt = v4l2_subdev_get_try_format(&imx290->sd, sd_state,
> > -						      fmt->pad);
> > -	else
> > -		framefmt = &imx290->current_format;
> > -
> > +	framefmt = imx290_get_pad_format(imx290, sd_state, fmt->which);
> >  	fmt->format = *framefmt;
> 
> NULL ptr derence here if 'fmt->which' is neither V4L2_SUBDEV_FORMAT_TRY nor 
> V4L2_SUBDEV_FORMAT_ACTIVE. Same for imx290_set_fmt later on.

You're right, but this can't happen, TRY and ACTIVE are the only two
possible values.

> >  	mutex_unlock(&imx290->lock);
> > @@ -627,10 +636,9 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
> >  	fmt->format.code = imx290_formats[i].code;
> >  	fmt->format.field = V4L2_FIELD_NONE;
> > 
> > -	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> > -		format = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
> > -	} else {
> > -		format = &imx290->current_format;
> > +	format = imx290_get_pad_format(imx290, sd_state, fmt->which);
> > +
> > +	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> >  		imx290->current_mode = mode;
> >  		imx290->bpp = imx290_formats[i].bpp;

-- 
Regards,

Laurent Pinchart
