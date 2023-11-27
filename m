Return-Path: <linux-media+bounces-1081-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF537F9E3E
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 12:14:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC60028131F
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 11:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59A6519446;
	Mon, 27 Nov 2023 11:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LNixyqg9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74BBFB8;
	Mon, 27 Nov 2023 03:13:55 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5AB782B6;
	Mon, 27 Nov 2023 12:13:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701083598;
	bh=Gm8Kz6NILXLvY3vZqwE4lOS8CXmGsgLFcYSluZC/vdQ=;
	h=From:To:Cc:Subject:Date:From;
	b=LNixyqg9clNXx2WfaTSSJzB7EViDbfYSurvsFPeIl0v9mIyPY1vUyXIgY+M0yCdc3
	 MmEq8nh4s87XQ5YlJJVryjEjXz6zQKuvhOc+Z1h+I8gjrd2KI3tI/gqNZ2BZbj7QAz
	 ORZ8QiYQtrCFlMP6v6zu6RbmucIu1SAYqb72n6Uk=
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
Subject: [PATCH v2 0/4] media: v4l2-subdev: Improve frame interval handling
Date: Mon, 27 Nov 2023 13:13:55 +0200
Message-ID: <20231127111359.30315-1-laurent.pinchart@ideasonboard.com>
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

Patch 1/4 starts by addressing the first issue, namely the frame
interval operations being video ops. This requires touching all the
drivers using frame intervals.

Patch 2/4 then adds a 'which' field to the subdev frame interval
userspace API, allowing frame intervals to be tried the same way formats
and selection rectangles can. Again, the same drivers need to be touched
to preserve their current behaviour.

Patch 3/4 adds support for storing the frame interval in the subdev
state, alongside the formats and selection rectangles, with similar
accessors and helper functions.

Finally, patch 4/4 demonstrates how this is used in drivers, with the
thp7312 driver serving as an example.

The series is based on Sakari's latest master branch ([1]).

Given the large number of drivers that this series touches, I would like
to get it merged in v6.8 without too much delay to avoid rebasing.

[1] https://git.linuxtv.org/sailus/media_tree.git/log/

Laurent Pinchart (4):
  media: v4l2-subdev: Turn .[gs]_frame_interval into pad operations
  media: v4l2-subdev: Add which field to struct
    v4l2_subdev_frame_interval
  media: v4l2-subdev: Store frame interval in subdev state
  media: i2c: thp7312: Store frame interval in subdev state

 .../media/v4l/vidioc-subdev-g-client-cap.rst  |   5 +
 .../v4l/vidioc-subdev-g-frame-interval.rst    |  17 +-
 drivers/media/i2c/adv7180.c                   |  10 +-
 drivers/media/i2c/et8ek8/et8ek8_driver.c      |  12 +-
 drivers/media/i2c/imx214.c                    |  12 +-
 drivers/media/i2c/imx274.c                    |  54 +++---
 drivers/media/i2c/max9286.c                   |  20 ++-
 drivers/media/i2c/mt9m111.c                   |  20 ++-
 drivers/media/i2c/mt9m114.c                   |  20 ++-
 drivers/media/i2c/mt9v011.c                   |  24 +--
 drivers/media/i2c/mt9v111.c                   |  22 ++-
 drivers/media/i2c/ov2680.c                    |  10 +-
 drivers/media/i2c/ov5640.c                    |  22 ++-
 drivers/media/i2c/ov5648.c                    |  62 +++----
 drivers/media/i2c/ov5693.c                    |  10 +-
 drivers/media/i2c/ov6650.c                    |  22 ++-
 drivers/media/i2c/ov7251.c                    |  12 +-
 drivers/media/i2c/ov7670.c                    |  22 +--
 drivers/media/i2c/ov772x.c                    |  20 ++-
 drivers/media/i2c/ov7740.c                    |  40 ++---
 drivers/media/i2c/ov8865.c                    |  54 +++---
 drivers/media/i2c/ov9650.c                    |  20 ++-
 drivers/media/i2c/s5c73m3/s5c73m3-core.c      |  20 ++-
 drivers/media/i2c/s5k5baf.c                   |  26 ++-
 drivers/media/i2c/thp7312.c                   | 160 ++++++++++--------
 drivers/media/i2c/tvp514x.c                   |  33 ++--
 drivers/media/usb/em28xx/em28xx-video.c       |   6 +-
 drivers/media/v4l2-core/v4l2-common.c         |   8 +-
 drivers/media/v4l2-core/v4l2-subdev.c         | 128 ++++++++++----
 .../media/atomisp/i2c/atomisp-gc0310.c        |  10 +-
 .../media/atomisp/i2c/atomisp-gc2235.c        |  10 +-
 .../media/atomisp/i2c/atomisp-mt9m114.c       |  10 +-
 .../media/atomisp/i2c/atomisp-ov2722.c        |  10 +-
 .../staging/media/atomisp/pci/atomisp_cmd.c   |   4 +-
 .../staging/media/atomisp/pci/atomisp_ioctl.c |   4 +-
 drivers/staging/media/imx/imx-ic-prp.c        |  20 ++-
 drivers/staging/media/imx/imx-ic-prpencvf.c   |  20 ++-
 drivers/staging/media/imx/imx-media-capture.c |   6 +-
 drivers/staging/media/imx/imx-media-csi.c     |  20 ++-
 drivers/staging/media/imx/imx-media-vdic.c    |  20 ++-
 drivers/staging/media/tegra-video/csi.c       |  12 +-
 include/media/v4l2-common.h                   |   4 +-
 include/media/v4l2-subdev.h                   |  65 +++++--
 include/uapi/linux/v4l2-subdev.h              |  13 +-
 44 files changed, 706 insertions(+), 413 deletions(-)


base-commit: 543efaddeac0c7769c39d7aaa886e8b001acac76
-- 
Regards,

Laurent Pinchart


