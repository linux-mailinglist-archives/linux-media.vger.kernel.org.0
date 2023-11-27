Return-Path: <linux-media+bounces-1098-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7767FA15E
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 14:51:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBF651C20E19
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 13:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E61030331;
	Mon, 27 Nov 2023 13:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HJMD3qNI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B236185;
	Mon, 27 Nov 2023 05:51:06 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A05002B6;
	Mon, 27 Nov 2023 14:50:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701093027;
	bh=7ElhO05i4kqly44Mcz2c9LriWZ/g9C7WknA9ZPpu1FM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HJMD3qNIkE1ojcYYrncWdjZ4bERWAmfc4SHdsnGPK8qd/w6Kyyl9SeE24e8kaWFJv
	 y99qC3WMxl9A9Hioj2Mf/y6ZzBffEdevqFFAojPAv9I0ApbY9U5Bgx1N+TVM8rRgxF
	 8RmqQ5cKlfXzoYgSxoFbxtt/46HjZ0jKn/UtdXN4=
Date: Mon, 27 Nov 2023 15:51:08 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org, Akinobu Mita <akinobu.mita@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Leon Luo <leonl@leopardimaging.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Pavel Machek <pavel@ucw.cz>, Philipp Zabel <p.zabel@pengutronix.de>,
	Ricardo Ribalda <ribalda@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 0/4] media: v4l2-subdev: Improve frame interval
 handling
Message-ID: <20231127135108.GB31314@pendragon.ideasonboard.com>
References: <20231127111359.30315-1-laurent.pinchart@ideasonboard.com>
 <5672608d-75a8-4313-a7d4-f545f3e2674a@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5672608d-75a8-4313-a7d4-f545f3e2674a@xs4all.nl>

Hi Hans,

On Mon, Nov 27, 2023 at 02:28:09PM +0100, Hans Verkuil wrote:
> On 27/11/2023 12:13, Laurent Pinchart wrote:
> > Hello,
> > 
> > This patch series improves frame interval handling in the V4L2 subdev
> > in-kernel and userspace APIs.
> > 
> > Frame interval are exposed to userspace on pads and streams, but the
> > frame interval handling is currently implemented through a v4l2_subdev
> > video operation, without involving the subdev state. This makes frame
> > intervals a second class citizen compared to formats and selection
> > rectangles.
> > 
> > Patch 1/4 starts by addressing the first issue, namely the frame
> > interval operations being video ops. This requires touching all the
> > drivers using frame intervals.
> > 
> > Patch 2/4 then adds a 'which' field to the subdev frame interval
> > userspace API, allowing frame intervals to be tried the same way formats
> > and selection rectangles can. Again, the same drivers need to be touched
> > to preserve their current behaviour.
> > 
> > Patch 3/4 adds support for storing the frame interval in the subdev
> > state, alongside the formats and selection rectangles, with similar
> > accessors and helper functions.
> > 
> > Finally, patch 4/4 demonstrates how this is used in drivers, with the
> > thp7312 driver serving as an example.
> > 
> > The series is based on Sakari's latest master branch ([1]).
> > 
> > Given the large number of drivers that this series touches, I would like
> > to get it merged in v6.8 without too much delay to avoid rebasing.
> > 
> > [1] https://git.linuxtv.org/sailus/media_tree.git/log/
> > 
> > Laurent Pinchart (4):
> >   media: v4l2-subdev: Turn .[gs]_frame_interval into pad operations
> >   media: v4l2-subdev: Add which field to struct
> >     v4l2_subdev_frame_interval
> >   media: v4l2-subdev: Store frame interval in subdev state
> >   media: i2c: thp7312: Store frame interval in subdev state
> 
> Wouldn't it be possible to first add the get/set_frame_interval() op
> to v4l2-subdev.h (so keep the old one), then add the which field,
> and only after that convert the subdev drivers.
> 
> At the end there is a final patch removing the old ops.
> 
> Main reason is that the core changes are easier to review, and it is

To review the core changes you can just skip the driver part in patches
1/4 and 2/4. I think turning the old operation into a new operation
better shows the impact on the subsytem, compared to adding a new one
and dropping the old one, so it's easier to review in the sense that a
diff is easier to review than a copy+modify followed by a remove. I
grant you that the patches that change the API also come with lots of
driver changes, so that part makes it a bit more annoying to review.

I would rather not refactor the series unless it really helps, as it
will quite a bit of work to refactor the patches, for the exact same end
result. Splitting the driver changes in one patch per driver would also
improve my kernel development stats, but that would be gaming the system
:-)

> easier to deal with cases where a subdev patch no longer applies, you
> can merge the remainder and fix that subdev in a follow-up patch.
> 
> Only when all subdevs are converted is the final patch applied.

If I had to carry the series over multiple kernel releases, I would
agree with that. I however hope to get it in v6.8 :-) I'm fine handling
the pain of rebase operations until then. If, for some reason, this
change turns out to be controversial and needs to be carried forward
over a longer period of time, I could restructure the series.

> I might well have missed something that prevents doing this, but if
> possible I think this would be a better approach.

I don't think it would be impossible to restructure the patches in that
way, but as I explained I'm not sure to really see the added value. I
may also be missing something. If you find it particularly difficult to
review 1/4 and 2/4, please let me know.

> > 
> >  .../media/v4l/vidioc-subdev-g-client-cap.rst  |   5 +
> >  .../v4l/vidioc-subdev-g-frame-interval.rst    |  17 +-
> >  drivers/media/i2c/adv7180.c                   |  10 +-
> >  drivers/media/i2c/et8ek8/et8ek8_driver.c      |  12 +-
> >  drivers/media/i2c/imx214.c                    |  12 +-
> >  drivers/media/i2c/imx274.c                    |  54 +++---
> >  drivers/media/i2c/max9286.c                   |  20 ++-
> >  drivers/media/i2c/mt9m111.c                   |  20 ++-
> >  drivers/media/i2c/mt9m114.c                   |  20 ++-
> >  drivers/media/i2c/mt9v011.c                   |  24 +--
> >  drivers/media/i2c/mt9v111.c                   |  22 ++-
> >  drivers/media/i2c/ov2680.c                    |  10 +-
> >  drivers/media/i2c/ov5640.c                    |  22 ++-
> >  drivers/media/i2c/ov5648.c                    |  62 +++----
> >  drivers/media/i2c/ov5693.c                    |  10 +-
> >  drivers/media/i2c/ov6650.c                    |  22 ++-
> >  drivers/media/i2c/ov7251.c                    |  12 +-
> >  drivers/media/i2c/ov7670.c                    |  22 +--
> >  drivers/media/i2c/ov772x.c                    |  20 ++-
> >  drivers/media/i2c/ov7740.c                    |  40 ++---
> >  drivers/media/i2c/ov8865.c                    |  54 +++---
> >  drivers/media/i2c/ov9650.c                    |  20 ++-
> >  drivers/media/i2c/s5c73m3/s5c73m3-core.c      |  20 ++-
> >  drivers/media/i2c/s5k5baf.c                   |  26 ++-
> >  drivers/media/i2c/thp7312.c                   | 160 ++++++++++--------
> >  drivers/media/i2c/tvp514x.c                   |  33 ++--
> >  drivers/media/usb/em28xx/em28xx-video.c       |   6 +-
> >  drivers/media/v4l2-core/v4l2-common.c         |   8 +-
> >  drivers/media/v4l2-core/v4l2-subdev.c         | 128 ++++++++++----
> >  .../media/atomisp/i2c/atomisp-gc0310.c        |  10 +-
> >  .../media/atomisp/i2c/atomisp-gc2235.c        |  10 +-
> >  .../media/atomisp/i2c/atomisp-mt9m114.c       |  10 +-
> >  .../media/atomisp/i2c/atomisp-ov2722.c        |  10 +-
> >  .../staging/media/atomisp/pci/atomisp_cmd.c   |   4 +-
> >  .../staging/media/atomisp/pci/atomisp_ioctl.c |   4 +-
> >  drivers/staging/media/imx/imx-ic-prp.c        |  20 ++-
> >  drivers/staging/media/imx/imx-ic-prpencvf.c   |  20 ++-
> >  drivers/staging/media/imx/imx-media-capture.c |   6 +-
> >  drivers/staging/media/imx/imx-media-csi.c     |  20 ++-
> >  drivers/staging/media/imx/imx-media-vdic.c    |  20 ++-
> >  drivers/staging/media/tegra-video/csi.c       |  12 +-
> >  include/media/v4l2-common.h                   |   4 +-
> >  include/media/v4l2-subdev.h                   |  65 +++++--
> >  include/uapi/linux/v4l2-subdev.h              |  13 +-
> >  44 files changed, 706 insertions(+), 413 deletions(-)
> > 
> > 
> > base-commit: 543efaddeac0c7769c39d7aaa886e8b001acac76

-- 
Regards,

Laurent Pinchart

