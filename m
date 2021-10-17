Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1496B430B68
	for <lists+linux-media@lfdr.de>; Sun, 17 Oct 2021 20:24:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344078AbhJQS0X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Oct 2021 14:26:23 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:54935 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344031AbhJQS0W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Oct 2021 14:26:22 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 7FC2C200005;
        Sun, 17 Oct 2021 18:24:09 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     tomi.valkeinen@ideasonboard.com, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        kieran.bingham@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 00/13] media: Add multiplexed support to R-Car CSI-2 and GMSL
Date:   Sun, 17 Oct 2021 20:24:36 +0200
Message-Id: <20211017182449.64192-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,
  this series is based on v9 of Tomi's
"v4l: subdev internal routing and streams":

With a few out-of-tree patches for GMSL support on top.

The series aims to
1) Plumb into Tomi's v4l2 subdev streams and routing to compare it with the
   previous implementations of multistream support
2) Add support for multiplexed streams to R-Car CSI-2 and MAX9286

For testing, I have re-proposed Niklas' patches on top of v4l2-ctl to control
routing and ported them to this last version. Support for state-based format
handling has been added on top. Two simple scripts to be deployed in vin-test
have been used to set routing and capture frames. Both are available at:
https://git.sr.ht/~jmondi_/v4l2-utils
https://git.sr.ht/~jmondi_/vin-test-multi

v2 contains changes to max9286 and R-Car CSI-2 while changes to support
routing VIN are still WIP and not included.

Tested on Eagle V3M by routing VC0 and VC1 to VIN0 and VIN3 respectively.

Thanks
   j

v1->v2:
- Rebase on Tomi's v9
- Break-out max9286 and CSI-2 mux support
- Add for_each_active_route() macro
- Add get_frame_desc to R-Car CSI-2

Jacopo Mondi (13):
  media: max9286: Add support for v4l2_subdev_state
  media: max9286: Implement set_routing
  media: max9286: Use enabled routes to calculate pixelrate
  media: max9286: Use routes to configure link order
  media: max9286: Move format to subdev state
  media: subdev: Add for_each_active_route() macro
  media: max9286: Implement get_frame_desc()
  media: rcar-csi2: Add support for v4l2_subdev_state
  media: rcar-csi2: Implement set_routing
  media: rcar-csi2: Move format to subdev state
  media: rcar-csi2: Config by using the remote frame_desc
  media: rcar-csi2: Implement .get_frame_desc()
  media: rcar-vin: Support multiplexed CSI-2 receiver

 drivers/media/i2c/ds90ub913.c               |   8 +-
 drivers/media/i2c/ds90ub953.c               |   7 +-
 drivers/media/i2c/ds90ub960.c               |   8 +-
 drivers/media/i2c/max9286.c                 | 448 ++++++++++++++------
 drivers/media/platform/rcar-vin/rcar-csi2.c | 338 ++++++++++++---
 drivers/media/platform/rcar-vin/rcar-dma.c  |   3 +-
 drivers/media/platform/ti-vpe/cal-video.c   |   9 +-
 drivers/media/v4l2-core/v4l2-subdev.c       |  18 +
 include/media/v4l2-subdev.h                 |  11 +
 9 files changed, 640 insertions(+), 210 deletions(-)

--
2.33.0

