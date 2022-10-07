Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE6DD5F74B7
	for <lists+linux-media@lfdr.de>; Fri,  7 Oct 2022 09:30:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229897AbiJGHaJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Oct 2022 03:30:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229872AbiJGHaH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Oct 2022 03:30:07 -0400
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EF56326EA
        for <linux-media@vger.kernel.org>; Fri,  7 Oct 2022 00:30:03 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id DEAB2240002;
        Fri,  7 Oct 2022 07:30:00 +0000 (UTC)
Date:   Fri, 7 Oct 2022 09:29:59 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Subject: Re: [PATCH 01/10] media: ar0521: Implement enum_frame_sizes
Message-ID: <20221007072959.n52j2bzrn6xstjnd@uno.localdomain>
References: <20221005190613.394277-1-jacopo@jmondi.org>
 <20221005190613.394277-2-jacopo@jmondi.org>
 <Yz8DaZvFAOMKPlCQ@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Yz8DaZvFAOMKPlCQ@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Thu, Oct 06, 2022 at 07:33:45PM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Wed, Oct 05, 2022 at 09:06:04PM +0200, Jacopo Mondi wrote:
> > Implement the enum_frame_size pad operation.
> >
> > The sensor supports a continuous size range of resolutions.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  drivers/media/i2c/ar0521.c | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
> > index c7bdfc69b9be..89f3c01f18ce 100644
> > --- a/drivers/media/i2c/ar0521.c
> > +++ b/drivers/media/i2c/ar0521.c
> > @@ -798,6 +798,24 @@ static int ar0521_enum_mbus_code(struct v4l2_subdev *sd,
> >  	return 0;
> >  }
> >
> > +static int ar0521_enum_frame_size(struct v4l2_subdev *sd,
> > +				  struct v4l2_subdev_state *sd_state,
> > +				  struct v4l2_subdev_frame_size_enum *fse)
> > +{
> > +	if (fse->index)
> > +		return -EINVAL;
> > +
> > +	if (fse->code != MEDIA_BUS_FMT_SGRBG8_1X8)
> > +		return -EINVAL;
> > +
> > +	fse->min_width = AR0521_WIDTH_MIN;
> > +	fse->max_width = AR0521_WIDTH_MAX;
> > +	fse->min_height = AR0521_HEIGHT_MIN;
> > +	fse->max_height = AR0521_HEIGHT_MAX;
>
> This matches the driver implementation of .set_fmt(), but that's because
> the driver is *really* wrong :-( It uses the format to configure the
> crop rectangle, which is not right. This needs to be fixed.
>

As far as I understand it, the driver supports smaller resolutions by
cropping only, while the sensor would be actually capable of binning.

As the driver currently only crops, the analog rectangle always matches the
output size hence adding s_selection(CROP) just to replicate what
s_ftm() does feels a little dumb ?

I concur that ideally the driver should be capable of producing
smaller resolution by binning, and in that case being able to
configure the analog crop rectangle would be useful. But as long as it
doesn't...

> > +
> > +	return 0;
> > +}
> > +
> >  static int ar0521_pre_streamon(struct v4l2_subdev *sd, u32 flags)
> >  {
> >  	struct ar0521_dev *sensor = to_ar0521_dev(sd);
> > @@ -864,6 +882,7 @@ static const struct v4l2_subdev_video_ops ar0521_video_ops = {
> >
> >  static const struct v4l2_subdev_pad_ops ar0521_pad_ops = {
> >  	.enum_mbus_code = ar0521_enum_mbus_code,
> > +	.enum_frame_size = ar0521_enum_frame_size,
> >  	.get_fmt = ar0521_get_fmt,
> >  	.set_fmt = ar0521_set_fmt,
> >  };
>
> --
> Regards,
>
> Laurent Pinchart
