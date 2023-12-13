Return-Path: <linux-media+bounces-2346-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5A981140D
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 15:04:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 178811F2254F
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 14:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB18A2E643;
	Wed, 13 Dec 2023 14:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ELbssE8H"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F98D107
	for <linux-media@vger.kernel.org>; Wed, 13 Dec 2023 06:04:45 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AFF2566F;
	Wed, 13 Dec 2023 15:03:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702476237;
	bh=W++YXbpgzWxthBnqi209lWfp3i7sK0kJ94RRNJ7CQ6o=;
	h=From:To:Cc:Subject:Date:From;
	b=ELbssE8HEnWpFwEDLJgHezUMyLc7CoHUxnSLRc3gL3E0ZRxshSl6nNRiFpNVWx87h
	 oFjBy7f1+SqodZgFB0f5jfTYmvHZFliVc0YWOTBLZ+lLNT511weAb84LT1ri1QU0kl
	 cZklRfzQhcvwIyw1LFRlsD7hJBNafSZy0/WeSeRI=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v5 0/8] media: v4l2-subdev: Improve frame interval handling
Date: Wed, 13 Dec 2023 16:04:42 +0200
Message-ID: <20231213140450.21359-1-laurent.pinchart@ideasonboard.com>
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

Compared to v4, review comments have been taken into account for patch
3/8, Reviewed-by tags added, and the series rebased on the latest stage
master branch.

I have limited the recipients on this version to avoid spamming all
drivers maintainers, as they have had a chance to review patches 2/8 and
3/8, and I understand v5 will be final and get before the end of this
week.

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
 drivers/media/i2c/adv7180.c                   |  14 +-
 drivers/media/i2c/et8ek8/et8ek8_driver.c      |  20 +-
 drivers/media/i2c/imx214.c                    |  16 +-
 drivers/media/i2c/imx274.c                    |  62 +++--
 drivers/media/i2c/max9286.c                   |  28 ++-
 drivers/media/i2c/mt9m111.c                   |  28 ++-
 drivers/media/i2c/mt9m114.c                   |  28 ++-
 drivers/media/i2c/mt9v011.c                   |  32 ++-
 drivers/media/i2c/mt9v111.c                   |  30 ++-
 drivers/media/i2c/ov2680.c                    |  14 +-
 drivers/media/i2c/ov5640.c                    |  30 ++-
 drivers/media/i2c/ov5648.c                    |  66 ++---
 drivers/media/i2c/ov5693.c                    |  14 +-
 drivers/media/i2c/ov6650.c                    |  30 ++-
 drivers/media/i2c/ov7251.c                    |  20 +-
 drivers/media/i2c/ov7670.c                    |  30 ++-
 drivers/media/i2c/ov772x.c                    |  28 ++-
 drivers/media/i2c/ov7740.c                    |  40 ++-
 drivers/media/i2c/ov8865.c                    |  58 +++--
 drivers/media/i2c/ov9650.c                    |  28 ++-
 drivers/media/i2c/s5c73m3/s5c73m3-core.c      |  28 ++-
 drivers/media/i2c/s5k5baf.c                   |  34 ++-
 drivers/media/i2c/thp7312.c                   | 160 ++++++------
 drivers/media/i2c/tvp514x.c                   |  41 ++--
 drivers/media/usb/em28xx/em28xx-video.c       |   6 +-
 drivers/media/v4l2-core/v4l2-common.c         |   8 +-
 drivers/media/v4l2-core/v4l2-subdev.c         | 130 +++++++---
 .../media/atomisp/i2c/atomisp-gc0310.c        |  14 +-
 .../media/atomisp/i2c/atomisp-gc2235.c        |  14 +-
 .../media/atomisp/i2c/atomisp-mt9m114.c       |  14 +-
 .../media/atomisp/i2c/atomisp-ov2722.c        |  14 +-
 .../staging/media/atomisp/pci/atomisp_cmd.c   |   4 +-
 .../staging/media/atomisp/pci/atomisp_ioctl.c |   4 +-
 drivers/staging/media/imx/imx-ic-prp.c        |  28 ++-
 drivers/staging/media/imx/imx-ic-prpencvf.c   |  28 ++-
 drivers/staging/media/imx/imx-media-capture.c |   6 +-
 drivers/staging/media/imx/imx-media-csi.c     |  28 ++-
 drivers/staging/media/imx/imx-media-vdic.c    |  28 ++-
 drivers/staging/media/tegra-video/csi.c       |  16 +-
 include/media/v4l2-common.h                   |   4 +-
 include/media/v4l2-subdev.h                   | 231 +++++++++++-------
 include/uapi/linux/v4l2-subdev.h              |  15 +-
 51 files changed, 1019 insertions(+), 526 deletions(-)


base-commit: 09b4195021be69af1e1936cca995712a6d0f2562
-- 
Regards,

Laurent Pinchart


