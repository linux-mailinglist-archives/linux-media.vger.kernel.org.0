Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC00421F30E
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2020 15:54:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726793AbgGNNyy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jul 2020 09:54:54 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:46517 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725906AbgGNNyx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jul 2020 09:54:53 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 5C3C91C0002;
        Tue, 14 Jul 2020 13:54:48 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, jmkrzyszt@gmail.com, robert.jarzmik@free.fr,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v6 0/9] v4l2-subdev: Introduce [g|s]et_mbus_format pad op
Date:   Tue, 14 Jul 2020 15:58:03 +0200
Message-Id: <20200714135812.55158-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Minor update to the ov6650 to address some of Janusz's comments there.
(now in Cc with Robert for the pxa part. Sorry for missing that in the
previous versions).

Quoting the previous cover letters:

-------------------------------------------------------------------------------
Most of the existing users are i2c camera drivers reporting a static media bus
configuration though g_mbus_config. Porting them is performed in a single
hopefully not controversial patch [2/8]

Two existing users stand-out, and they've probably been developed together:
pxa_camera and ov6650. Those have bee ported separately in single patches
with extensive change logs as their operations semantic had to change to port
them to use the new operations. Not having any of those two platforms, the
changes have been compile-tested only.

The only existing users of the s|g_mbus_config ops are now the soc_camera based
drivers currently living in staging.

The last three patches are similar to the ones posted in v2, with the exception
that they have been updated to use the V4L2_MBUS_* flags as well.
-------------------------------------------------------------------------------

Will report again the use cases I'm trying to address here:
------------------------------------------------------------------------------
Quoting:
https://patchwork.kernel.org/cover/10855919/
"The use case this series cover is the following one:
the Gen-3 R-Car boards include an ADV748x HDMI/CVBS to CSI-2 converter
connected to its CSI-2 receivers. The ADV748x chip has recently gained support
for routing both HDMI and analogue video streams through its 4 lanes TXA
transmitter, specifically to support the Ebisu board that has a single CSI-2
receiver, compared to all other Gen-3 board where the ADV748x TXes are connected
to different CSI-2 receivers, and where analogue video is streamed out from the
ADV748x single lane TXB transmitter.
To properly support transmission of analogue video through TXA, the number of
data lanes shall be dynamically reduced to 1, in order to comply with the MIPI
CSI-2 minimum clock frequency requirements"

During the discussion of the RFC, Dave reported another use case for media
bus parameter negotiation on his platform:
https://patchwork.kernel.org/patch/10855923/#22569149

Hyun is now using this series to configure GMSL devices.
------------------------------------------------------------------------------

Thanks
   j

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



Jacopo Mondi (9):
  media: v4l2-subdev: Introduce [get|set]_mbus_config pad ops
  media: i2c: Use the new get_mbus_config pad op
  media: i2c: ov6650: Use new [get|set]_mbus_config ops
  media: pxa_camera: Use the new set_mbus_config op
  media: v4l2-subdev: Remove [s|g]_mbus_config video ops
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
 drivers/media/platform/rcar-vin/rcar-csi2.c |  74 +++++++-
 drivers/staging/media/imx/TODO              |   4 +
 include/media/v4l2-subdev.h                 |  37 ++--
 15 files changed, 271 insertions(+), 201 deletions(-)

--
2.27.0

