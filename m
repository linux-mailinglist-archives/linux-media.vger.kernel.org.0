Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08CBF26A248
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 11:33:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbgIOJdJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 05:33:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726340AbgIOJdI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 05:33:08 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF44DC06174A
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2020 02:33:08 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D68A8275;
        Tue, 15 Sep 2020 11:33:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600162384;
        bh=Ou1BWGh7ahARaEybRMQDuxTrhRKG2UDF7oq1dlRScek=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lJxlZXJxs+2/xq5zFNwi2S+qQEtJUeloVAju1JHhHd4TiRFzl/xpgmmk6JfqkE68A
         QsKest42WOUHDTKNvBhxbSimRDAEvyFibBRwsTECu16Esh9ZOhyR/Vv7wpR0740UrF
         vRM+Q3RgfeUoCPygp4ZHlG5R8G1N6rKDNo5+9EWU=
Date:   Tue, 15 Sep 2020 12:32:35 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v2 04/34] media: bcm2835-unicam: Driver for CCP2/CSI2
 camera interface
Message-ID: <20200915093235.GC13260@pendragon.ideasonboard.com>
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
 <20200504092611.9798-5-laurent.pinchart@ideasonboard.com>
 <20200915070326.GI834@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200915070326.GI834@valkosipuli.retiisi.org.uk>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

(With a question for Dave below)

I'm replying to the two main points of your review. All the other
comments look fine at a glance, Jacopo is having a more detailed look
and will incorporate them in v3.

On Tue, Sep 15, 2020 at 10:03:26AM +0300, Sakari Ailus wrote:
> Hi Laurent,
> 
> Thanks for the patch, and my apologies for the late review. Please do cc me
> for v3.
> 
> After a quick look I can already say this is the cleanest Unicam driver
> I've ever seen. But please also see my detailed comments below.
> 
> On Mon, May 04, 2020 at 12:25:41PM +0300, Laurent Pinchart wrote:
> > From: Naushir Patuck <naush@raspberrypi.com>
> > 
> > Add a driver for the Unicam camera receiver block on BCM283x processors.
> > Compared to the bcm2835-camera driver present in staging, this driver
> > handles the Unicam block only (CSI-2 receiver), and doesn't depend on
> > the VC4 firmware running on the VPU.
> > 
> > The commit is made up of a series of changes cherry-picked from the
> > rpi-5.4.y branch of https://github.com/raspberrypi/linux/ with
> > additional enhancements, forward-ported to the mainline kernel.
> > 
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > Changes since v1:
> > 
> > - Re-fetch mbus code from subdev on a g_fmt call
> > - Group all ioctl disabling together
> > - Fix reference counting in unicam_open
> > - Add support for VIDIOC_[S|G]_SELECTION
> > ---
> >  MAINTAINERS                                   |    7 +
> >  drivers/media/platform/Kconfig                |    1 +
> >  drivers/media/platform/Makefile               |    2 +
> >  drivers/media/platform/bcm2835/Kconfig        |   15 +
> >  drivers/media/platform/bcm2835/Makefile       |    3 +
> >  .../media/platform/bcm2835/bcm2835-unicam.c   | 2825 +++++++++++++++++
> >  .../media/platform/bcm2835/vc4-regs-unicam.h  |  253 ++
> >  7 files changed, 3106 insertions(+)
> >  create mode 100644 drivers/media/platform/bcm2835/Kconfig
> >  create mode 100644 drivers/media/platform/bcm2835/Makefile
> >  create mode 100644 drivers/media/platform/bcm2835/bcm2835-unicam.c
> >  create mode 100644 drivers/media/platform/bcm2835/vc4-regs-unicam.h

[snip]

> > diff --git a/drivers/media/platform/bcm2835/bcm2835-unicam.c b/drivers/media/platform/bcm2835/bcm2835-unicam.c
> > new file mode 100644
> > index 000000000000..2e9387cbc1e0
> > --- /dev/null
> > +++ b/drivers/media/platform/bcm2835/bcm2835-unicam.c
> > @@ -0,0 +1,2825 @@

[snip]

> > +static int unicam_enum_frameintervals(struct file *file, void *priv,
> > +				      struct v4l2_frmivalenum *fival)
> > +{
> > +	struct unicam_node *node = video_drvdata(file);
> > +	struct unicam_device *dev = node->dev;
> > +	const struct unicam_fmt *fmt;
> > +	struct v4l2_subdev_frame_interval_enum fie = {
> > +		.index = fival->index,
> > +		.width = fival->width,
> > +		.height = fival->height,
> > +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> > +	};
> > +	int ret;
> > +
> > +	fmt = find_format_by_pix(dev, fival->pixel_format);
> > +	if (!fmt)
> > +		return -EINVAL;
> > +
> > +	fie.code = fmt->code;
> > +	ret = v4l2_subdev_call(dev->sensor, pad, enum_frame_interval,
> > +			       NULL, &fie);
> 
> You're adding a new CSI-2 receiver driver but your driver appears to be
> video node centric and does not use MC / V4L2 subdev uAPIs for pipeline
> configuration.
> 
> This is effectively needed if you want to be able to capture embedded data.
> 
> I'd also recommend it since this way the driver will be compliant with all
> camera sensor drivers, not just those that expose a single sub-device.
> There are no good ways to change this once your driver is in upstream
> kernel.
> 
> This is also why e.g. ipu3-cio2 driver is MC-centric.

I've had lengthy discussions with Dave on this topic. While I agree with
you in principle, Dave had good arguments for keeping this
video-node-centric. We all agreed it wasn't a perfect solution, but it
could still be a pragmatic one.

If I remember correctly the discussion was in private e-mails though.
Dave, I'm pretty sure you're tired of repeating the same thing, but
Sakari can't be expected to know all we've talked about. I can try to
summarize your points, but I may not do a very good job at defending
your point of view given that I wish you would be wrong :-) Would you
like to summarize your position, or should I give it a go ?

> > +	if (ret)
> > +		return ret;
> > +
> > +	fival->type = V4L2_FRMIVAL_TYPE_DISCRETE;
> > +	fival->discrete = fie.interval;
> > +
> > +	return 0;
> > +}

[snip]

> > +static int register_node(struct unicam_device *unicam, struct unicam_node *node,
> > +			 enum v4l2_buf_type type, int pad_id)
> > +{

[snip]

> > +	if (pad_id != METADATA_PAD || unicam->sensor_embedded_data) {
> > +		ret = media_create_pad_link(&unicam->sensor->entity, pad_id,
> > +					    &node->video_dev.entity, 0,
> > +					    MEDIA_LNK_FL_ENABLED |
> > +					    MEDIA_LNK_FL_IMMUTABLE);
> 
> This does create two links between the sensor and the CSI-2 receiver,
> doesn't it?
> 
> The links in Media controller represent physical links, not logical flows
> of data. At the time the API was added, it wasn't thought there would be a
> need to separate the two.
> 
> There is an effort to add the concept of data flow to V4L2, but it's been
> complicated and we haven't had patches for the CSI-2 receiver driver to
> support it. Perhaps Unicam could be the first one to do that?

I agree that this is the right approach. The V4L2 multiplexed streams
support seems to be one of these cursed series, where bad things happen
to anyone who touches it. I was about to actively start working on it
again back in June for a different project, which then got frozen at the
last minute :-S

Would you like to give it a try ? :-) I'd be more than happy to provide
you hardware as a present.

> Alternatively support for embedded data could be removed in the meantime.
> 
> The latest patchset is here I believe:
> 
> <URL:https://patchwork.kernel.org/project/linux-media/list/?series=98277>
> 
> > +		if (ret)
> > +			unicam_err(unicam, "Unable to create pad link for %s\n",
> > +				   vdev->name);
> > +	}
> > +
> > +	return ret;
> > +}

-- 
Regards,

Laurent Pinchart
