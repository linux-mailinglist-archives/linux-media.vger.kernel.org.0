Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7773157C99C
	for <lists+linux-media@lfdr.de>; Thu, 21 Jul 2022 13:12:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233018AbiGULMZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jul 2022 07:12:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232549AbiGULMY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jul 2022 07:12:24 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B8168212E
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 04:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658401943; x=1689937943;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YpCWcEcNnqjA7A18jAixgoJqu/ddtmq+wEzunywBf/M=;
  b=S7x3dRxlgezMgqOUajv1CgnT/76X/nW4RSk0/MykBN8oCoGWkS16q09O
   9Ya88mZQjNFpcKdp+HPeHmKQU5zE/Gtf3L+p8S6v++PreDMaP0of1Qqzg
   JBMwr6tEvPCcEFh0PYilJiqfy++W0HgRTYm5YkcDwXXiYiuuEi1NcoXjj
   aagVfrOD3bnw8OMVsTFl8Nc/HJlQJfEG0QYpohry/AmLJvpJtHg1ouNV9
   N1ELrOQcd3T5I6WYsDb12HEsfAU5YQzxtVmyY08C+lYoHOUu9OczfM0SG
   K2iiAeyoOITOWLW0faqU5llP1uc99xXxmQfFx7sttT0dtN/KP/7iriaKH
   g==;
X-IronPort-AV: E=Sophos;i="5.92,289,1650924000"; 
   d="scan'208";a="25182889"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 21 Jul 2022 13:12:21 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 21 Jul 2022 13:12:21 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 21 Jul 2022 13:12:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658401941; x=1689937941;
  h=from:to:cc:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding:subject;
  bh=YpCWcEcNnqjA7A18jAixgoJqu/ddtmq+wEzunywBf/M=;
  b=Yn1s1+AKxv6tXd+z17TJ4hgCYJa0gu9ELZQM5BwVRT8PE/ZeyRmasR9f
   n2t/jf1wRgiiOPRjrDXpksekdSgHSvMIgSYINWFbgzeDmhHsGlCqXvDXr
   47sK+QmRNUEOwRPxr3vl4TKQiIhOY2jUE8IxcusZDgpqBMQVn5bbtSYNR
   ODxxV61ouR7x8MJpgOUru7LMI5IFT1aHuEbU6GlW+de9qxrZrDTxOaEZX
   OpTvVO7aGIAnt9B8ENYtqWw4sIUR/17U0z6zrsDTGAImviHiFWyYdgsjU
   ZU61yXlM+Kcg5nyVj7bWq++W0+rQ6SFrjXwXuABBk2xFy+2M9n4L6VPYH
   w==;
X-IronPort-AV: E=Sophos;i="5.92,289,1650924000"; 
   d="scan'208";a="25182888"
Subject: Re: Re: [PATCH 17/19] media: i2c: imx290: Factor out format retrieval to
 separate function
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 21 Jul 2022 13:12:21 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 875A4280056;
        Thu, 21 Jul 2022 13:12:21 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Date:   Thu, 21 Jul 2022 13:12:21 +0200
Message-ID: <4191860.BddDVKsqQX@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <YtksM7F7xzhf2K89@pendragon.ideasonboard.com>
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com> <830803795.0ifERbkFSE@steina-w> <YtksM7F7xzhf2K89@pendragon.ideasonboard.com>
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

Am Donnerstag, 21. Juli 2022, 12:36:35 CEST schrieb Laurent Pinchart:
> Hi Alexander,
> 
> On Thu, Jul 21, 2022 at 12:11:31PM +0200, Alexander Stein wrote:
> > Am Donnerstag, 21. Juli 2022, 10:35:38 CEST schrieb Laurent Pinchart:
> > > The driver duplicates the same pattern to access the try or active
> > > format in multiple locations. Factor it out to a separate function.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > > 
> > >  drivers/media/i2c/imx290.c | 28 ++++++++++++++++++----------
> > >  1 file changed, 18 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > > index fc6e87fada1c..baf9941c5fbe 100644
> > > --- a/drivers/media/i2c/imx290.c
> > > +++ b/drivers/media/i2c/imx290.c
> > > @@ -519,6 +519,20 @@ static const struct v4l2_ctrl_ops imx290_ctrl_ops =
> > > {
> > > 
> > >  	.s_ctrl = imx290_set_ctrl,
> > >  
> > >  };
> > > 
> > > +static struct v4l2_mbus_framefmt *
> > > +imx290_get_pad_format(struct imx290 *imx290, struct v4l2_subdev_state
> > > *state, +		      u32 which)
> > > +{
> > > +	switch (which) {
> > > +	case V4L2_SUBDEV_FORMAT_TRY:
> > > +		return v4l2_subdev_get_try_format(&imx290->sd, state, 
0);
> > > +	case V4L2_SUBDEV_FORMAT_ACTIVE:
> > > +		return &imx290->current_format;
> > > +	default:
> > > +		return NULL;
> > > +	}
> > > +}
> > > +
> > > 
> > >  static int imx290_enum_mbus_code(struct v4l2_subdev *sd,
> > >  
> > >  				 struct v4l2_subdev_state 
*sd_state,
> > >  				 struct v4l2_subdev_mbus_code_enum 
*code)
> > > 
> > > @@ -562,12 +576,7 @@ static int imx290_get_fmt(struct v4l2_subdev *sd,
> > > 
> > >  	mutex_lock(&imx290->lock);
> > > 
> > > -	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
> > > -		framefmt = v4l2_subdev_get_try_format(&imx290->sd, 
sd_state,
> > > -						      fmt-
>pad);
> > > -	else
> > > -		framefmt = &imx290->current_format;
> > > -
> > > +	framefmt = imx290_get_pad_format(imx290, sd_state, fmt->which);
> > > 
> > >  	fmt->format = *framefmt;
> > 
> > NULL ptr derence here if 'fmt->which' is neither V4L2_SUBDEV_FORMAT_TRY
> > nor
> > V4L2_SUBDEV_FORMAT_ACTIVE. Same for imx290_set_fmt later on.
> 
> You're right, but this can't happen, TRY and ACTIVE are the only two
> possible values.

fmt (and therefore which) is only a u32, so there is no benefit to treat it 
like an enum. IMHO using the old if-else structure seems better. This might 
also help static code analysis which does not have such background 
information.
If 'which' would be changed to type enum v4l2_subdev_format_whence, the switch 
case seems preferable.

Best regards,
Alexander

> > >  	mutex_unlock(&imx290->lock);
> > > 
> > > @@ -627,10 +636,9 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
> > > 
> > >  	fmt->format.code = imx290_formats[i].code;
> > >  	fmt->format.field = V4L2_FIELD_NONE;
> > > 
> > > -	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> > > -		format = v4l2_subdev_get_try_format(sd, sd_state, fmt-
>pad);
> > > -	} else {
> > > -		format = &imx290->current_format;
> > > +	format = imx290_get_pad_format(imx290, sd_state, fmt->which);
> > > +
> > > +	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> > > 
> > >  		imx290->current_mode = mode;
> > >  		imx290->bpp = imx290_formats[i].bpp;




