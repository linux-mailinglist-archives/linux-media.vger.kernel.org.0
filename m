Return-Path: <linux-media+bounces-2409-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD3F812E4C
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 12:13:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CEEB1C2156E
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 11:13:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EC134120F;
	Thu, 14 Dec 2023 11:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MedEXLVz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC5E7CF
	for <linux-media@vger.kernel.org>; Thu, 14 Dec 2023 03:12:47 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4DE422E4;
	Thu, 14 Dec 2023 12:11:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702552319;
	bh=E6zExOdENYnuPCJGVM+IzHnJMm1tOJcR09EJKGkQ16Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MedEXLVzeLTTGwsa5YMNIyuL7VZ7i6m6JxQb9f3UlSYhSS38IE6UtrX533hVlUlNp
	 jGK0WoB2ox2L+2ecRBIFYF69Ioew505Y1b/03Iy/0eq1bAzT4T3orQHpGE1ZR29lRV
	 dmMRA/Ghotn6ui4sID/NAZ143+B0detC5eZWwxCY=
Date: Thu, 14 Dec 2023 13:12:52 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tommaso Merciai <tomm.merciai@gmail.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v6 2/8] media: v4l2-subdev: Turn .[gs]_frame_interval
 into pad operations
Message-ID: <20231214111252.GA21146@pendragon.ideasonboard.com>
References: <20231213150010.25593-1-laurent.pinchart@ideasonboard.com>
 <20231213150010.25593-3-laurent.pinchart@ideasonboard.com>
 <ZXq7a4nm03xrWYHF@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <20231214091710.GA15238@pendragon.ideasonboard.com>
 <ZXrR7W4BlHCJWNX9@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZXrR7W4BlHCJWNX9@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>

On Thu, Dec 14, 2023 at 10:59:09AM +0100, Tommaso Merciai wrote:
> On Thu, Dec 14, 2023 at 11:17:10AM +0200, Laurent Pinchart wrote:
> > On Thu, Dec 14, 2023 at 09:23:07AM +0100, Tommaso Merciai wrote:
> > > On Wed, Dec 13, 2023 at 05:00:04PM +0200, Laurent Pinchart wrote:
> > > > The subdev .[gs]_frame_interval are video operations, but they operate
> > > > on pads (and even on streams). Not only is this confusing, it causes
> > > > practical issues for drivers as the operations don't receive a subdev
> > > > state pointer, requiring manual state handling.
> > > > 
> > > > To improve the situation, turn the operations into pad operations, and
> > > > extend them to receive a state pointer like other pad operations.
> > > > 
> > > > While at it, rename the operations to .[gs]et_frame_interval at the same
> > > > time to match the naming scheme of other pad operations. This isn't
> > > > strictly necessary, but given that all drivers using those operations
> > > > need to be modified, handling the rename separately would generate more
> > > > churn for very little gain (if at all).
> > > > 
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > > > Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de> # for imx-media
> > > > Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # for tegra-video
> > > > ---
> > > > Changes since v5:
> > > > 
> > > > - Address the alvium-csi2 driver
> > > > 
> > > > Changes since v3:
> > > > 
> > > > - Address the thp7312 driver
> > > > ---
> > > >  drivers/media/i2c/adv7180.c                   |  7 ++-
> > > >  drivers/media/i2c/alvium-csi2.c               | 11 ++--
> > > >  drivers/media/i2c/et8ek8/et8ek8_driver.c      |  6 +-
> > > >  drivers/media/i2c/imx214.c                    |  9 +--
> > > >  drivers/media/i2c/imx274.c                    | 48 +++++---------
> > > >  drivers/media/i2c/max9286.c                   | 14 +++--
> > > >  drivers/media/i2c/mt9m111.c                   | 14 +++--
> > > >  drivers/media/i2c/mt9m114.c                   | 14 +++--
> > > >  drivers/media/i2c/mt9v011.c                   | 18 +++---
> > > >  drivers/media/i2c/mt9v111.c                   | 16 ++---
> > > >  drivers/media/i2c/ov2680.c                    |  7 ++-
> > > >  drivers/media/i2c/ov5640.c                    | 16 ++---
> > > >  drivers/media/i2c/ov5648.c                    | 59 ++++++++---------
> > > >  drivers/media/i2c/ov5693.c                    |  7 ++-
> > > >  drivers/media/i2c/ov6650.c                    | 16 ++---
> > > >  drivers/media/i2c/ov7251.c                    |  6 +-
> > > >  drivers/media/i2c/ov7670.c                    | 18 +++---
> > > >  drivers/media/i2c/ov772x.c                    | 14 +++--
> > > >  drivers/media/i2c/ov7740.c                    | 40 +++++-------
> > > >  drivers/media/i2c/ov8865.c                    | 51 +++++++--------
> > > >  drivers/media/i2c/ov9650.c                    | 14 +++--
> > > >  drivers/media/i2c/s5c73m3/s5c73m3-core.c      | 14 +++--
> > > >  drivers/media/i2c/s5k5baf.c                   | 20 +++---
> > > >  drivers/media/i2c/thp7312.c                   | 22 +++----
> > > >  drivers/media/i2c/tvp514x.c                   | 29 +++------
> > > >  drivers/media/usb/em28xx/em28xx-video.c       |  6 +-
> > > >  drivers/media/v4l2-core/v4l2-common.c         |  8 +--
> > > >  drivers/media/v4l2-core/v4l2-subdev.c         | 63 +++++++++++--------
> > > >  .../media/atomisp/i2c/atomisp-gc0310.c        |  7 ++-
> > > >  .../media/atomisp/i2c/atomisp-gc2235.c        |  7 ++-
> > > >  .../media/atomisp/i2c/atomisp-mt9m114.c       |  7 ++-
> > > >  .../media/atomisp/i2c/atomisp-ov2722.c        |  7 ++-
> > > >  .../staging/media/atomisp/pci/atomisp_cmd.c   |  4 +-
> > > >  .../staging/media/atomisp/pci/atomisp_ioctl.c |  4 +-
> > > >  drivers/staging/media/imx/imx-ic-prp.c        | 14 +++--
> > > >  drivers/staging/media/imx/imx-ic-prpencvf.c   | 14 +++--
> > > >  drivers/staging/media/imx/imx-media-capture.c |  6 +-
> > > >  drivers/staging/media/imx/imx-media-csi.c     | 14 +++--
> > > >  drivers/staging/media/imx/imx-media-vdic.c    | 14 +++--
> > > >  drivers/staging/media/tegra-video/csi.c       |  9 +--
> > > >  include/media/v4l2-common.h                   |  4 +-
> > > >  include/media/v4l2-subdev.h                   | 22 ++++---
> > > >  42 files changed, 352 insertions(+), 348 deletions(-)
> > 
> > [snip]
> > 
> > > > diff --git a/drivers/media/i2c/alvium-csi2.c b/drivers/media/i2c/alvium-csi2.c
> > > > index c8827603eb23..a173abb0509f 100644
> > > > --- a/drivers/media/i2c/alvium-csi2.c
> > > > +++ b/drivers/media/i2c/alvium-csi2.c
> > > > @@ -1649,6 +1649,7 @@ static int alvium_hw_init(struct alvium_dev *alvium)
> > > >  /* --------------- Subdev Operations --------------- */
> > > >  
> > > >  static int alvium_g_frame_interval(struct v4l2_subdev *sd,
> > > > +				   struct v4l2_subdev_state *sd_state,
> > > >  				   struct v4l2_subdev_frame_interval *fi)
> > > >  {
> > > >  	struct alvium_dev *alvium = sd_to_alvium(sd);
> > > > @@ -1696,23 +1697,19 @@ static int alvium_set_frame_interval(struct alvium_dev *alvium,
> > > >  }
> > > >  
> > > >  static int alvium_s_frame_interval(struct v4l2_subdev *sd,
> > > > +				   struct v4l2_subdev_state *sd_state,
> > > >  				   struct v4l2_subdev_frame_interval *fi)
> > > >  {
> > > >  	struct alvium_dev *alvium = sd_to_alvium(sd);
> > > > -	struct v4l2_subdev_state *state;
> > > >  	int ret;
> > > >  
> > > >  	if (alvium->streaming)
> > > >  		return -EBUSY;
> > > >  
> > > > -	state = v4l2_subdev_lock_and_get_active_state(sd);
> > > > -
> > > >  	ret = alvium_set_frame_interval(alvium, fi);
> > > >  	if (!ret)
> > > >  		ret = alvium_set_frame_rate(alvium);
> > > >  
> > > > -	v4l2_subdev_unlock_state(state);
> > > > -
> > > >  	return ret;
> > > >  }
> > > >  
> > > > @@ -2238,8 +2235,6 @@ static const struct v4l2_subdev_core_ops alvium_core_ops = {
> > > >  };
> > > >  
> > > >  static const struct v4l2_subdev_video_ops alvium_video_ops = {
> > > > -	.g_frame_interval	= alvium_g_frame_interval,
> > > > -	.s_frame_interval	= alvium_s_frame_interval,
> > > >  	.s_stream		= alvium_s_stream,
> > > >  };
> > > >  
> > > > @@ -2249,6 +2244,8 @@ static const struct v4l2_subdev_pad_ops alvium_pad_ops = {
> > > >  	.set_fmt = alvium_set_fmt,
> > > >  	.get_selection = alvium_get_selection,
> > > >  	.set_selection = alvium_set_selection,
> > > > +	.get_frame_interval = alvium_g_frame_interval,
> > > > +	.set_frame_interval = alvium_s_frame_interval,
> > > >  };
> > > >  
> > > >  static const struct v4l2_subdev_internal_ops alvium_internal_ops = {
> > > 
> > > Applied and tested on my side. From functional perspective
> > > all is working properly on my hw. Hope this help.
> > > 
> > > Tested-by: Tommaso Merciai <tomm.merciai@gmail.com>
> > 
> > Would you be able to send a patch on top of the media_stage master
> > branch to support the TRY frame intervals in the alvium driver ?
> 
> Can I use ov5640_try_frame_interval as reference?

No, that driver hasn't been converted. You can look at patch 8/8 in this
series instead.

The goal is to drop at least the following fields from the alvium_dev
structure:

	struct v4l2_fract frame_interval;
	u64 dft_fr;
	u64 min_fr;
	u64 max_fr;
	u64 fr;

Some of them are used only to pass data from alvium_get_frame_interval()
to its callers, so you can turn that into function parameters instead.
fr and frame_interval should be replaced by usage of the subdev state.

Looking some more at the driver, you should also drop the mode field.

> > [snip]

-- 
Regards,

Laurent Pinchart

