Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC14A7A0C5A
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:16:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240636AbjINSQ6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:16:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237421AbjINSQ5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:16:57 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E130F1FF9
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:16:52 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BF04C15EF;
        Thu, 14 Sep 2023 20:15:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715318;
        bh=H+xr+MlosSl2ZfbpK9WbZTB/d+uaGmX0PIUr06rm/Qc=;
        h=From:To:Cc:Subject:Date:From;
        b=EEa50HCIaM1e381eZXH43twsxPBrAoaM7pqBsJ+MGKd1cNzZkXMrMzUo18pMJB9lT
         gIxbMIhM/Q9+lvEnHlmRnWBRMCPDVfEXVjm+E3AYr3iBX3heq+C8lE8Pi2m8TZBtWG
         HHKAaeYud2tGHpmvU/RzEOxxNuYOtOLdWvZe08+Q=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        =?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
        Martin Kepplinger <martink@posteo.de>,
        Ricardo Ribalda <ribalda@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Jimmy Su <jimmy.su@intel.com>,
        Jason Chen <jason.z.chen@intel.com>,
        Arec Kao <arec.kao@intel.com>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Mikhail Rudenko <mike.rudenko@gmail.com>,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH 00/57] media: i2c: Reduce cargo cult
Date:   Thu, 14 Sep 2023 21:16:07 +0300
Message-ID: <20230914181704.4811-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

While working on camera sensor drivers, I got bothered by the amount of
bad practices we have grown slowly as a result of cargo-cult
programming. This patch series is an attempt to improve the situation by
addressing two common problems.

The first problem is addressed in patches 01/57 to 30/57. The subdev
.s_stream() operation is not reentrant, it should never be called to
start an already started subdev, or stop an already stopped one. This
requirement has never been formally documented, which has led many
drivers to track the streaming status and return immediately from
.s_stream() if the requested streaming state matches the current state.

Patch 01/57 first updates the documentation, and the next 29 patches
drop the unneeded checks from camera sensor drivers.

The second problem is addressed in patches 31/57 to 57/57. Starting and
stopping streaming on a camera pipeline requires coordination of the
different blocks. This is handled by the bridge driver, which starts and
stops streaming on the sensor explicitly with the .s_stream() operation.
Despite thus, many sensor drivers track the streaming state internally,
to stop the sensor in the system suspend handler if it is streaming, and
restart it in the system resume handler. This is not needed, and
couldn't work anyway in the general case as starting the sensor before
the bridge can prevent the bridge from synchronizing, for instance for
CSI-2 buses with a continuous clock.

Patches 31/57 to 34/57 refactor and improve the camera sensor
documentation, and the next 23 patches drop system suspend and resume
handlers from camera sensor drivers. Patch 53/57 is a bit of an oddball
as it drops stream handling from the runtime PM handlers instead, which
is even more incorrect as the sensor just can't be streaming already
when the runtime PM resume handler is called.

There are still a few related issues in drivers/media/i2c/ that I have
decided *not* to address in this series:

- The series focusses on camera sensor drivers, the lens controllers,
  flash controllers, and the ADV748x (HDMI/CVBS to CSI-2 converter)
  still implement system PM handlers.

- The et8ek8 driver still implements system PM handlers. While fixable,
  the change will be bigger as the sensor should also move away from the
  .s_power() operation. This requires more testing, which I can't easily
  perform.

- More generally, the series doesn't address drivers that rely on the
  .s_power() operation instead of implementing runtime PM (disregarding
  the drivers other than camera sensors, there are still 17 of them).

The second part of the series unfortunately depends on the first part.
I've decided to split the patches in two parts to clearly show the two
separate issues, and then split them further by driver. If strongly
desired, I could squash patches from the first and second parts together
when they address the same driver, although that will cause quite a bit
of churn to update all commit messages. I prefer keeping the per-driver
split to facilitate backporting.

Laurent Pinchart (57):
  media: v4l2-subdev: Document .s_stream() operation requirements
  media: i2c: hi556: Drop check for reentrant .s_stream()
  media: i2c: hi846: Drop check for reentrant .s_stream()
  media: i2c: imx208: Drop check for reentrant .s_stream()
  media: i2c: imx214: Drop check for reentrant .s_stream()
  media: i2c: imx219: Drop check for reentrant .s_stream()
  media: i2c: imx258: Drop check for reentrant .s_stream()
  media: i2c: imx319: Drop check for reentrant .s_stream()
  media: i2c: imx334: Drop check for reentrant .s_stream()
  media: i2c: imx335: Drop check for reentrant .s_stream()
  media: i2c: imx355: Drop check for reentrant .s_stream()
  media: i2c: imx412: Drop check for reentrant .s_stream()
  media: i2c: mt9m001: Drop check for reentrant .s_stream()
  media: i2c: og01a1b: Drop check for reentrant .s_stream()
  media: i2c: ov01a10: Drop check for reentrant .s_stream()
  media: i2c: ov08d10: Drop check for reentrant .s_stream()
  media: i2c: ov08x40: Drop check for reentrant .s_stream()
  media: i2c: ov13858: Drop check for reentrant .s_stream()
  media: i2c: ov13b10: Drop check for reentrant .s_stream()
  media: i2c: ov2685: Drop check for reentrant .s_stream()
  media: i2c: ov2740: Drop check for reentrant .s_stream()
  media: i2c: ov4689: Drop check for reentrant .s_stream()
  media: i2c: ov5647: Drop check for reentrant .s_stream()
  media: i2c: ov5670: Drop check for reentrant .s_stream()
  media: i2c: ov5675: Drop check for reentrant .s_stream()
  media: i2c: ov5695: Drop check for reentrant .s_stream()
  media: i2c: ov7740: Drop check for reentrant .s_stream()
  media: i2c: ov8856: Drop check for reentrant .s_stream()
  media: i2c: ov9282: Drop check for reentrant .s_stream()
  media: i2c: ov9734: Drop check for reentrant .s_stream()
  Documentation: media: camera-sensor: Fix typo and vocabulary selection
  Documentation: media: camera-sensor: Use link to upstream DT bindings
  Documentation: media: camera-sensor: Move power management section
  Documentation: media: camera-sensor: Improve power management
    documentation
  media: i2c: ar0521: Drop system suspend and resume handlers
  media: i2c: ccs: Drop system suspend and resume handlers
  media: i2c: hi556: Drop system suspend and resume handlers
  media: i2c: hi846: Drop system suspend and resume handlers
  media: i2c: hi847: Drop system suspend and resume handlers
  media: i2c: imx208: Drop system suspend and resume handlers
  media: i2c: imx214: Drop system suspend and resume handlers
  media: i2c: imx219: Drop system suspend and resume handlers
  media: i2c: imx258: Drop system suspend and resume handlers
  media: i2c: imx319: Drop system suspend and resume handlers
  media: i2c: imx355: Drop system suspend and resume handlers
  media: i2c: og01a1b: Drop system suspend and resume handlers
  media: i2c: ov01a10: Drop system suspend and resume handlers
  media: i2c: ov02a10: Drop system suspend and resume handlers
  media: i2c: ov08d10: Drop system suspend and resume handlers
  media: i2c: ov08x40: Drop system suspend and resume handlers
  media: i2c: ov13858: Drop system suspend and resume handlers
  media: i2c: ov2740: Drop system suspend and resume handlers
  media: i2c: ov13b10: Drop stream handling in runtime PM handlers
  media: i2c: ov5670: Drop system suspend and resume handlers
  media: i2c: ov5675: Drop system suspend and resume handlers
  media: i2c: ov8856: Drop system suspend and resume handlers
  media: i2c: ov9734: Drop system suspend and resume handlers

 .../driver-api/media/camera-sensor.rst        | 107 +++++++++++-------
 drivers/media/i2c/ar0521.c                    |  30 +----
 drivers/media/i2c/ccs/ccs-core.c              |  37 ------
 drivers/media/i2c/hi556.c                     |  50 --------
 drivers/media/i2c/hi846.c                     |  28 +----
 drivers/media/i2c/hi847.c                     |  52 ---------
 drivers/media/i2c/imx208.c                    |  47 --------
 drivers/media/i2c/imx214.c                    |  40 -------
 drivers/media/i2c/imx219.c                    |  44 -------
 drivers/media/i2c/imx258.c                    |  40 -------
 drivers/media/i2c/imx319.c                    |  44 -------
 drivers/media/i2c/imx334.c                    |   9 --
 drivers/media/i2c/imx335.c                    |   9 --
 drivers/media/i2c/imx355.c                    |  45 --------
 drivers/media/i2c/imx412.c                    |   9 --
 drivers/media/i2c/mt9m001.c                   |   6 -
 drivers/media/i2c/og01a1b.c                   |  50 --------
 drivers/media/i2c/ov01a10.c                   |  59 +---------
 drivers/media/i2c/ov02a10.c                   |   2 -
 drivers/media/i2c/ov08d10.c                   |  52 ---------
 drivers/media/i2c/ov08x40.c                   |  44 -------
 drivers/media/i2c/ov13858.c                   |  44 -------
 drivers/media/i2c/ov13b10.c                   |  38 +------
 drivers/media/i2c/ov2685.c                    |   7 --
 drivers/media/i2c/ov2740.c                    |  45 --------
 drivers/media/i2c/ov4689.c                    |   7 --
 drivers/media/i2c/ov5647.c                    |   6 -
 drivers/media/i2c/ov5670.c                    |  36 ------
 drivers/media/i2c/ov5675.c                    |  44 -------
 drivers/media/i2c/ov5695.c                    |   6 -
 drivers/media/i2c/ov7740.c                    |   7 --
 drivers/media/i2c/ov8856.c                    |  47 --------
 drivers/media/i2c/ov9282.c                    |   9 --
 drivers/media/i2c/ov9734.c                    |  50 --------
 include/media/v4l2-subdev.h                   |   4 +-
 35 files changed, 76 insertions(+), 1078 deletions(-)


base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
-- 
Regards,

Laurent Pinchart

