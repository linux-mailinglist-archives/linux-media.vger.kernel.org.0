Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBB877D444D
	for <lists+linux-media@lfdr.de>; Tue, 24 Oct 2023 02:51:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230366AbjJXAv1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Oct 2023 20:51:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231599AbjJXAv0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Oct 2023 20:51:26 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F42FC0
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 17:51:24 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F3BCEAE;
        Tue, 24 Oct 2023 02:51:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698108672;
        bh=/UNf1TP4fkxpsgDz9Jc6oksVjD6oBfDT6QZiUbU/Uak=;
        h=From:To:Cc:Subject:Date:From;
        b=tDSByEAcl5kXJp0T2g2Pab9XVpVk7aEhLq8J72/pGPnRNL+3Id5DLRXXs2aUqsRDS
         4248dYXXJ+HwOiChwHX9B9QxZuCN8IeQs2CIaXaGUPAB//siu4GTttvgY3Ec1ctmXQ
         pdqhrc2JihDDe1dOHxkQveHD08QZBwoLJVlam9lw=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Hans de Goede <hansg@kernel.org>
Subject: [RFC PATCH v1 0/4] media: v4l2-subdev: Improve frame interval handling
Date:   Tue, 24 Oct 2023 03:51:26 +0300
Message-ID: <20231024005130.28026-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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
thp7312 driver serving as an example. This driver isn't upstream yet,
the latest version can be found on the linux-media mailing list ([1]).

Sakari, these patches conflict with your "[PATCH v3 0/8] Unify
sub-device state access functions" series. I plan to rebase on top once
it reaches the media tree. This shouldn't prevent reviewing this RFC in
the meantime :-)

[1] https://lore.kernel.org/linux-media/20231017132103.9914-1-laurent.pinchart@ideasonboard.com/

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
 drivers/media/i2c/imx274.c                    |  54 +++----
 drivers/media/i2c/max9286.c                   |  20 ++-
 drivers/media/i2c/mt9m111.c                   |  20 ++-
 drivers/media/i2c/mt9m114.c                   |  20 ++-
 drivers/media/i2c/mt9v011.c                   |  24 +--
 drivers/media/i2c/mt9v111.c                   |  22 ++-
 drivers/media/i2c/ov2680.c                    |  10 +-
 drivers/media/i2c/ov5640.c                    |  22 ++-
 drivers/media/i2c/ov5648.c                    |  62 ++++----
 drivers/media/i2c/ov5693.c                    |  10 +-
 drivers/media/i2c/ov6650.c                    |  22 ++-
 drivers/media/i2c/ov7251.c                    |  12 +-
 drivers/media/i2c/ov7670.c                    |  22 +--
 drivers/media/i2c/ov772x.c                    |  20 ++-
 drivers/media/i2c/ov7740.c                    |  40 ++---
 drivers/media/i2c/ov8865.c                    |  54 ++++---
 drivers/media/i2c/ov9650.c                    |  20 ++-
 drivers/media/i2c/s5c73m3/s5c73m3-core.c      |  20 ++-
 drivers/media/i2c/s5k5baf.c                   |  26 ++--
 drivers/media/i2c/thp7312.c                   | 145 ++++++++++--------
 drivers/media/i2c/tvp514x.c                   |  33 ++--
 drivers/media/usb/em28xx/em28xx-video.c       |   6 +-
 drivers/media/v4l2-core/v4l2-common.c         |   8 +-
 drivers/media/v4l2-core/v4l2-subdev.c         | 120 +++++++++++----
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
 include/media/v4l2-subdev.h                   |  79 ++++++++--
 include/uapi/linux/v4l2-subdev.h              |  13 +-
 44 files changed, 706 insertions(+), 404 deletions(-)

-- 
Regards,

Laurent Pinchart

