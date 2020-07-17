Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EBDF223E96
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 16:50:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726232AbgGQOuH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 10:50:07 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:37421 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726204AbgGQOuH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 10:50:07 -0400
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id C1DE824000E;
        Fri, 17 Jul 2020 14:50:01 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, jmkrzyszt@gmail.com, robert.jarzmik@free.fr,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v8 00/10] v4l2-subdev: Introduce [g|s]et_mbus_format pad op
Date:   Fri, 17 Jul 2020 16:53:14 +0200
Message-Id: <20200717145324.292820-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

One more update to address Janusz comments on patch 1/10

1) I have expanded the operation documentation slightly with:

  * applied to the hardware. The operation shall fail if the
- * pad index it has been called on is not valid.
+ * pad index it has been called on is not valid or in case of
+ * unrecoverable failures.

2) Added call wrapper to check for pad validity. I have for now ignored
   the check_which() and check_cfg() calls as the operations do not
   support TRY format.

Thanks
  j

v7->v8
- Add call wrappers to 1/10
- Expand documentation to report error on failures

v6.1->v7
- Add [6/10] as suggested by Hans
- Add Niklas tag and fix his last comment in [10/10]

v6->v6.1
- Address Niklas' comments in the last patch for rcar-csi2

v5->v6:
- Report V4L2_MBUS_DATA_ACTIVE_HIGH in ov6650 get_mbus_config
- Check for the return value of get_mbus_config() at the end of
  set_mbus_config() in ov6650 driver

v4->v5:
- Address Sakari's comment on documentation (s/should/shall)
- Use a local variable for the number of active lanes in 9/9
- Add Kieran's tags to 7/9 and 8/9
- Fix a warning on operator precedence on 3/9

v3->v4:
- Remove g/s_mbus_config video operation
- Adjust pxa quick capture interface to properly handle bus mastering
- Reword the two new operations documentation

v2->v3:
- Re-use v4l2_mbus_config and V4L2_MBUS_* flags
- Port existing drivers
- Update adv748x and rcar-csi2 patches to use V4L2_MBUS_* flags

v1->v2:
- Address Sakari's comment to use unsigned int in place of bools
- Add two new patches to address documentation
- Adjust rcar-csi2 patch as much as possible according to Niklas comments
- Add Niklas's tags

Jacopo Mondi (10):
  media: v4l2-subdev: Introduce [get|set]_mbus_config pad ops
  media: i2c: Use the new get_mbus_config pad op
  media: i2c: ov6650: Use new [get|set]_mbus_config ops
  media: pxa_camera: Use the new set_mbus_config op
  media: v4l2-subdev: Remove [s|g]_mbus_config video ops
  media: v4l2- mediabus: Add usage note for V4L2_MBUS_*
  staging: media: imx: Update TODO entry
  media: i2c: adv748x: Adjust TXA data lanes number
  media: i2c: adv748x: Implement get_mbus_config
  media: rcar-csi2: Negotiate data lanes number

 drivers/media/i2c/adv7180.c                 |   7 +-
 drivers/media/i2c/adv748x/adv748x-core.c    |  31 +++-
 drivers/media/i2c/adv748x/adv748x-csi2.c    |  31 ++++
 drivers/media/i2c/adv748x/adv748x.h         |   1 +
 drivers/media/i2c/ml86v7667.c               |   7 +-
 drivers/media/i2c/mt9m001.c                 |   7 +-
 drivers/media/i2c/mt9m111.c                 |   7 +-
 drivers/media/i2c/ov6650.c                  |  56 ++++--
 drivers/media/i2c/ov9640.c                  |   7 +-
 drivers/media/i2c/tc358743.c                |   7 +-
 drivers/media/i2c/tvp5150.c                 |   7 +-
 drivers/media/platform/pxa_camera.c         | 189 ++++++--------------
 drivers/media/platform/rcar-vin/rcar-csi2.c |  75 +++++++-
 drivers/media/v4l2-core/v4l2-subdev.c       |  16 ++
 drivers/staging/media/imx/TODO              |   4 +
 include/media/v4l2-mediabus.h               |  33 +++-
 include/media/v4l2-subdev.h                 |  38 ++--
 17 files changed, 318 insertions(+), 205 deletions(-)

--
2.27.0

