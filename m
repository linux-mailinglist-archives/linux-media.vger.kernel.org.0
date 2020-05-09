Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3B7D1CC4B3
	for <lists+linux-media@lfdr.de>; Sat,  9 May 2020 23:26:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728210AbgEIV0y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 May 2020 17:26:54 -0400
Received: from retiisi.org.uk ([95.216.213.190]:50050 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727108AbgEIV0y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 9 May 2020 17:26:54 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 2B83E634C87
        for <linux-media@vger.kernel.org>; Sun, 10 May 2020 00:26:07 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1jXWz0-0001Yv-SK
        for linux-media@vger.kernel.org; Sun, 10 May 2020 00:26:06 +0300
Date:   Sun, 10 May 2020 00:26:06 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for 5.8] V4L2 fwnode improvements, sensor driver patches
Message-ID: <20200509212606.GV867@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a set of V4L2 fwnode and IMX and sensor driver patches.

In particular, Steve Longerbeam's set with V4L2 fwnode improvements that
are in turn required by patches addressing IMX staging driver TODO items. A
few improvements made it to the Sony imx219 driver as well.

Please pull.


The following changes since commit 5b9f8e4ac9473962fa0e824fd1f04138600d459d:

  media: ipu3.rst: fix a build warning (2020-05-06 14:49:41 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.8-3-signed

for you to fetch changes up to 35faa3a30df22b66a595b12e19f9df8738863d98:

  media: imx: TODO: Remove media link creation todos (2020-05-08 02:35:05 +0300)

----------------------------------------------------------------
V4L2 fwnode + sensor patches for 5.8

----------------------------------------------------------------
Dafna Hirschfeld (1):
      media: i2c: imx219: Fix a bug in imx219_enum_frame_size

Jacopo Mondi (1):
      media: i2c: imx219: Implement get_selection

Steve Longerbeam (22):
      media: entity: Pass entity to get_fwnode_pad operation
      media: v4l2-subdev: add v4l2_subdev_get_fwnode_pad_1_to_1
      media: v4l2-mc: add v4l2_create_fwnode_links helpers
      media: video-mux: Parse information from firmware without using callbacks
      media: imx: Parse information from firmware without using callbacks
      Revert "media: v4l2-fwnode: Add a convenience function for registering subdevs with notifiers"
      media: imx: csi: Implement get_fwnode_pad op
      media: video-mux: Implement get_fwnode_pad op
      media: imx: mipi csi-2: Implement get_fwnode_pad op
      media: imx: imx7-mipi-csis: Implement get_fwnode_pad op
      media: imx: imx7-media-csi: Implement get_fwnode_pad op
      media: video-mux: Create media links in bound notifier
      media: imx: mipi csi-2: Create media links in bound notifier
      media: imx7: mipi csis: Create media links in bound notifier
      media: imx7: csi: Create media links in bound notifier
      media: imx: csi: Create media links in bound notifier
      media: imx7: csi: Remove imx7_csi_get_upstream_endpoint()
      media: imx5/6/7: csi: Mark a bound video mux as a CSI mux
      media: imx: csi: Lookup upstream endpoint with imx_media_get_pad_fwnode
      media: imx: Create missing links from CSI-2 receiver
      media: imx: silence a couple debug messages
      media: imx: TODO: Remove media link creation todos

 drivers/media/i2c/imx219.c                        |  96 +++++++++++-
 drivers/media/mc/mc-entity.c                      |   2 +-
 drivers/media/platform/video-mux.c                |  87 ++++++++---
 drivers/media/v4l2-core/v4l2-fwnode.c             |  62 --------
 drivers/media/v4l2-core/v4l2-mc.c                 |  95 ++++++++++++
 drivers/media/v4l2-core/v4l2-subdev.c             |  22 +++
 drivers/staging/media/imx/TODO                    |  29 ----
 drivers/staging/media/imx/imx-media-csi.c         | 181 +++++++++++++---------
 drivers/staging/media/imx/imx-media-dev-common.c  |  50 +++---
 drivers/staging/media/imx/imx-media-dev.c         |   2 +-
 drivers/staging/media/imx/imx-media-internal-sd.c |   6 +-
 drivers/staging/media/imx/imx-media-of.c          | 114 --------------
 drivers/staging/media/imx/imx-media-utils.c       |  33 ++++
 drivers/staging/media/imx/imx-media.h             |   6 +-
 drivers/staging/media/imx/imx6-mipi-csi2.c        |  93 ++++++++---
 drivers/staging/media/imx/imx7-media-csi.c        | 160 ++++++++++---------
 drivers/staging/media/imx/imx7-mipi-csis.c        | 107 +++++++++----
 include/media/media-entity.h                      |   3 +-
 include/media/v4l2-fwnode.h                       |  38 -----
 include/media/v4l2-mc.h                           |  48 ++++++
 include/media/v4l2-subdev.h                       |  17 ++
 21 files changed, 755 insertions(+), 496 deletions(-)

-- 
Sakari Ailus
