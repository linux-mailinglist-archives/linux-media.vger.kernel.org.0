Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51C7B5F7511
	for <lists+linux-media@lfdr.de>; Fri,  7 Oct 2022 10:11:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbiJGILh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Oct 2022 04:11:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbiJGILf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Oct 2022 04:11:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9F55EB7F8
        for <linux-media@vger.kernel.org>; Fri,  7 Oct 2022 01:11:34 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E3F3E4D3;
        Fri,  7 Oct 2022 10:11:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665130293;
        bh=ZsK23KKzBvXN657PWS25yoGekC1Diz/n0c4/aD+asRw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Xk89//WTvRIHYBkNjV1xgZa/7zlGIEjaSAiZ+AZfKfOTTucs5xZSuA/MDiAuBpdLf
         Z3iRkVHva7BiMl38w9YzYJmnwwY4080EvzV4J7+ZqgECsuGLOxdoVy1yjwCUsrlL8w
         rAVGlrBqnI9heRfgkDj6kaVO/pf87AkGhZ6fS9X4=
Date:   Fri, 7 Oct 2022 11:11:28 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Subject: Re: [PATCH 01/10] media: ar0521: Implement enum_frame_sizes
Message-ID: <Yz/fMH5iEWtKDWNF@pendragon.ideasonboard.com>
References: <20221005190613.394277-1-jacopo@jmondi.org>
 <20221005190613.394277-2-jacopo@jmondi.org>
 <Yz8DaZvFAOMKPlCQ@pendragon.ideasonboard.com>
 <20221007072959.n52j2bzrn6xstjnd@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221007072959.n52j2bzrn6xstjnd@uno.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Fri, Oct 07, 2022 at 09:29:59AM +0200, Jacopo Mondi wrote:
> On Thu, Oct 06, 2022 at 07:33:45PM +0300, Laurent Pinchart wrote:
> > On Wed, Oct 05, 2022 at 09:06:04PM +0200, Jacopo Mondi wrote:
> > > Implement the enum_frame_size pad operation.
> > >
> > > The sensor supports a continuous size range of resolutions.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > ---
> > >  drivers/media/i2c/ar0521.c | 19 +++++++++++++++++++
> > >  1 file changed, 19 insertions(+)
> > >
> > > diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
> > > index c7bdfc69b9be..89f3c01f18ce 100644
> > > --- a/drivers/media/i2c/ar0521.c
> > > +++ b/drivers/media/i2c/ar0521.c
> > > @@ -798,6 +798,24 @@ static int ar0521_enum_mbus_code(struct v4l2_subdev *sd,
> > >  	return 0;
> > >  }
> > >
> > > +static int ar0521_enum_frame_size(struct v4l2_subdev *sd,
> > > +				  struct v4l2_subdev_state *sd_state,
> > > +				  struct v4l2_subdev_frame_size_enum *fse)
> > > +{
> > > +	if (fse->index)
> > > +		return -EINVAL;
> > > +
> > > +	if (fse->code != MEDIA_BUS_FMT_SGRBG8_1X8)
> > > +		return -EINVAL;
> > > +
> > > +	fse->min_width = AR0521_WIDTH_MIN;
> > > +	fse->max_width = AR0521_WIDTH_MAX;
> > > +	fse->min_height = AR0521_HEIGHT_MIN;
> > > +	fse->max_height = AR0521_HEIGHT_MAX;
> >
> > This matches the driver implementation of .set_fmt(), but that's because
> > the driver is *really* wrong :-( It uses the format to configure the
> > crop rectangle, which is not right. This needs to be fixed.
> 
> As far as I understand it, the driver supports smaller resolutions by
> cropping only, while the sensor would be actually capable of binning.
> 
> As the driver currently only crops, the analog rectangle always matches the
> output size hence adding s_selection(CROP) just to replicate what
> s_ftm() does feels a little dumb ?
> 
> I concur that ideally the driver should be capable of producing
> smaller resolution by binning, and in that case being able to
> configure the analog crop rectangle would be useful. But as long as it
> doesn't...

We have enough issues with sensor drivers implementing binning or
skipping in different ways to not make it worse by implementing cropping
in a creative way as wall :-)

The first step is to fix the driver to implement the selection API. Then
binning and skipping can be implemented on top, if anyone becomes
interested in them.

> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  static int ar0521_pre_streamon(struct v4l2_subdev *sd, u32 flags)
> > >  {
> > >  	struct ar0521_dev *sensor = to_ar0521_dev(sd);
> > > @@ -864,6 +882,7 @@ static const struct v4l2_subdev_video_ops ar0521_video_ops = {
> > >
> > >  static const struct v4l2_subdev_pad_ops ar0521_pad_ops = {
> > >  	.enum_mbus_code = ar0521_enum_mbus_code,
> > > +	.enum_frame_size = ar0521_enum_frame_size,
> > >  	.get_fmt = ar0521_get_fmt,
> > >  	.set_fmt = ar0521_set_fmt,
> > >  };

-- 
Regards,

Laurent Pinchart
