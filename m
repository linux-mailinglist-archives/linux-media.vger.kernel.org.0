Return-Path: <linux-media+bounces-2009-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4417280ABD2
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 19:14:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C789CB20C13
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 18:14:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A78CC481A1;
	Fri,  8 Dec 2023 18:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="p+zcH+lR"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 536342688;
	Fri,  8 Dec 2023 10:14:40 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 40C27512;
	Fri,  8 Dec 2023 19:13:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702059234;
	bh=dhnD0EjuMfh6ui42wk3riCHZnpQbewZUSrYdI1T3GBg=;
	h=From:To:Cc:Subject:Date:From;
	b=p+zcH+lRftj1pmiwZ3wE3+04ntzwksXtwiY/EWKNdVDW8nZdSdYSFMxNOm67nuRbS
	 mchiDsqP8aQKctgXLVDkHZohprcgCR8kTMQe+aOewn09yDph4iCGXDblwt1yAt/Mmi
	 oF8yuLg1xqUIzAKTTRuAuhhFRzBgcT9Z7Ze9ojaw=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Akinobu Mita <akinobu.mita@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Leon Luo <leonl@leopardimaging.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Pavel Machek <pavel@ucw.cz>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Ricardo Ribalda <ribalda@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-tegra@vger.kernel.org
Subject: [PATCH v4 0/8] media: v4l2-subdev: Improve frame interval handling
Date: Fri,  8 Dec 2023 20:14:34 +0200
Message-ID: <20231208181442.13356-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This patch series improves frame interval handling in the V4L2 subdev
in-kernel and userspace APIs.

Frame interval are exposed to userspace on pads and streams, but the
frame interval handling is currently implemented through a v4l2_subdev
video operation, without involving the subdev state. This makes frame
intervals a second class citizen compared to formats and selection
rectangles.

Patch 1/8 is a preparatory fix that Tomi posted today, and on which this
series depends. I've included here for completeness.

Patch 2/8 then starts the work by addressing the first issue, namely the
frame interval operations being video ops. This requires touching all
the drivers using frame intervals.

Patch 3/8 adds a 'which' field to the subdev frame interval userspace
API, allowing frame intervals to be tried the same way formats and
selection rectangles can. Again, the same drivers need to be touched to
preserve their current behaviour.

Patch 4/8 adds support for storing the frame interval in the subdev
state, alongside the formats and selection rectangles, with similar
accessors and helper functions.

Patches 5/8 to 7/8 address small issues in the subdev uAPI documentation
that were raised during review of v2 or discovered when working on v3.

Finally, patch 8/8 demonstrates how this is used in drivers, with the
thp7312 driver serving as an example.

The series is based on the latest stage master branch.

Given the large number of drivers that this series touches, I would like
to get it merged in v6.8 without too much delay to avoid rebasing.

Laurent Pinchart (7):
  media: v4l2-subdev: Turn .[gs]_frame_interval into pad operations
  media: v4l2-subdev: Add which field to struct
    v4l2_subdev_frame_interval
  media: v4l2-subdev: Store frame interval in subdev state
  media: docs: uAPI: Clarify error documentation for invalid 'which'
    value
  media: docs: uAPI: Expand error documentation for invalid 'which'
    value
  media: docs: uAPI: Fix documentation of 'which' field for routing
    ioctls
  media: i2c: thp7312: Store frame interval in subdev state

Tomi Valkeinen (1):
  media: v4l: subdev: Move out subdev state lock macros outside
    CONFIG_MEDIA_CONTROLLER

 .../v4l/vidioc-subdev-enum-frame-interval.rst |   9 +-
 .../v4l/vidioc-subdev-enum-frame-size.rst     |   7 +-
 .../v4l/vidioc-subdev-enum-mbus-code.rst      |   7 +-
 .../media/v4l/vidioc-subdev-g-client-cap.rst  |   5 +
 .../media/v4l/vidioc-subdev-g-crop.rst        |   7 +-
 .../media/v4l/vidioc-subdev-g-fmt.rst         |   5 +-
 .../v4l/vidioc-subdev-g-frame-interval.rst    |  20 +-
 .../media/v4l/vidioc-subdev-g-routing.rst     |   7 +-
 .../media/v4l/vidioc-subdev-g-selection.rst   |   7 +-
 drivers/media/i2c/adv7180.c                   |  10 +-
 drivers/media/i2c/et8ek8/et8ek8_driver.c      |  12 +-
 drivers/media/i2c/imx214.c                    |  12 +-
 drivers/media/i2c/imx274.c                    |  54 ++--
 drivers/media/i2c/max9286.c                   |  20 +-
 drivers/media/i2c/mt9m111.c                   |  20 +-
 drivers/media/i2c/mt9m114.c                   |  20 +-
 drivers/media/i2c/mt9v011.c                   |  24 +-
 drivers/media/i2c/mt9v111.c                   |  22 +-
 drivers/media/i2c/ov2680.c                    |  10 +-
 drivers/media/i2c/ov5640.c                    |  22 +-
 drivers/media/i2c/ov5648.c                    |  62 ++---
 drivers/media/i2c/ov5693.c                    |  10 +-
 drivers/media/i2c/ov6650.c                    |  22 +-
 drivers/media/i2c/ov7251.c                    |  12 +-
 drivers/media/i2c/ov7670.c                    |  22 +-
 drivers/media/i2c/ov772x.c                    |  20 +-
 drivers/media/i2c/ov7740.c                    |  40 ++-
 drivers/media/i2c/ov8865.c                    |  54 ++--
 drivers/media/i2c/ov9650.c                    |  20 +-
 drivers/media/i2c/s5c73m3/s5c73m3-core.c      |  20 +-
 drivers/media/i2c/s5k5baf.c                   |  26 +-
 drivers/media/i2c/thp7312.c                   | 160 ++++++------
 drivers/media/i2c/tvp514x.c                   |  33 +--
 drivers/media/usb/em28xx/em28xx-video.c       |   6 +-
 drivers/media/v4l2-core/v4l2-common.c         |   8 +-
 drivers/media/v4l2-core/v4l2-subdev.c         | 130 +++++++---
 .../media/atomisp/i2c/atomisp-gc0310.c        |  10 +-
 .../media/atomisp/i2c/atomisp-gc2235.c        |  10 +-
 .../media/atomisp/i2c/atomisp-mt9m114.c       |  10 +-
 .../media/atomisp/i2c/atomisp-ov2722.c        |  10 +-
 .../staging/media/atomisp/pci/atomisp_cmd.c   |   4 +-
 .../staging/media/atomisp/pci/atomisp_ioctl.c |   4 +-
 drivers/staging/media/imx/imx-ic-prp.c        |  20 +-
 drivers/staging/media/imx/imx-ic-prpencvf.c   |  20 +-
 drivers/staging/media/imx/imx-media-capture.c |   6 +-
 drivers/staging/media/imx/imx-media-csi.c     |  20 +-
 drivers/staging/media/imx/imx-media-vdic.c    |  20 +-
 drivers/staging/media/tegra-video/csi.c       |  12 +-
 include/media/v4l2-common.h                   |   4 +-
 include/media/v4l2-subdev.h                   | 231 +++++++++++-------
 include/uapi/linux/v4l2-subdev.h              |  15 +-
 51 files changed, 815 insertions(+), 526 deletions(-)


base-commit: e55a9482888da73eeadde5f13ef8bafce68a38ed
-- 
Regards,

Laurent Pinchart


