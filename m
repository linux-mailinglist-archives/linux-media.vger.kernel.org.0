Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7344D8D0C0
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2019 12:33:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727039AbfHNKdF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 06:33:05 -0400
Received: from retiisi.org.uk ([95.216.213.190]:35718 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726770AbfHNKdF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 06:33:05 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id A6161634C88
        for <linux-media@vger.kernel.org>; Wed, 14 Aug 2019 13:32:52 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1hxqaK-0000uv-0G
        for linux-media@vger.kernel.org; Wed, 14 Aug 2019 13:32:52 +0300
Date:   Wed, 14 Aug 2019 13:32:51 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL v2 for 5.4] More sensor driver, omap3isp and documentation
 patches
Message-ID: <20190814103251.GA3504@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a bunch of sensor driver, omap3isp and documentatino patches.
Noteworthy bit is perhaps a driver for the ov5675 sensor.

There are some checkpatch warnings there (patches 1, 6 and 8), the first
two seem false positives whereas the last one comes from the documentation
license header.

I've since v1 added a few more patches; IMX driver improvements as well as
a MAINTAINERS entry for ov5670.

Please pull.


The following changes since commit 0dc99e042a4cfbc1e27572d523d2a1dbaf402cbf:

  media: MAINTAINERS: Remove zoran driver (2019-08-13 11:55:34 -0300)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.4-6-signed

for you to fetch changes up to 852a51507ac865d7fbbf1305e2f485e7a4131b95:

  MAINTAINERS: Add entry for the ov5670 driver (2019-08-14 12:59:16 +0300)

----------------------------------------------------------------
Camera driver + framework patches for 5.4

----------------------------------------------------------------
Ezequiel Garcia (2):
      media: i2c: ov5645: Fix power sequence
      media: imx: mipi csi-2: Don't fail if initial state times-out

Luca Weiss (1):
      media: ov5640: Add support for flash and lens devices

Sakari Ailus (6):
      ov8856: Check reading clock frequency succeeded
      omap3isp: Set device on omap3isp subdevs
      omap3isp: Don't set streaming state on random subdevs
      v4l: Documentation: Serial busses use parallel mbus codes
      v4l: Documentation: Raw Bayer formats are not RGB formats
      MAINTAINERS: Add entry for the ov5670 driver

Shawn Tu (1):
      ov5675: Add support for OV5675 sensor

Steve Longerbeam (1):
      media: docs-rst: Clarify duration of LP-11 mode

Sébastien Szymanski (2):
      media: dt-bindings: imx7-csi: add i.MX6UL/L support
      media: imx7-media-csi: add i.MX6UL support

 .../devicetree/bindings/media/imx7-csi.txt         |    2 +-
 Documentation/media/kapi/csi2.rst                  |   17 +-
 Documentation/media/uapi/v4l/control.rst           |    2 +-
 Documentation/media/uapi/v4l/hist-v4l2.rst         |    2 +-
 Documentation/media/uapi/v4l/pixfmt-bayer.rst      |   38 +
 Documentation/media/uapi/v4l/pixfmt-packed-rgb.rst | 1306 --------------------
 Documentation/media/uapi/v4l/pixfmt-rgb.rst        | 1302 ++++++++++++++++++-
 Documentation/media/uapi/v4l/pixfmt-v4l2.rst       |    2 +-
 Documentation/media/uapi/v4l/pixfmt.rst            |    1 +
 Documentation/media/uapi/v4l/subdev-formats.rst    |    8 +
 MAINTAINERS                                        |   15 +
 drivers/media/i2c/Kconfig                          |   13 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/ov5640.c                         |    2 +-
 drivers/media/i2c/ov5645.c                         |   26 +-
 drivers/media/i2c/ov5675.c                         | 1183 ++++++++++++++++++
 drivers/media/i2c/ov8856.c                         |    5 +-
 drivers/media/platform/omap3isp/isp.c              |    8 +
 drivers/media/platform/omap3isp/ispccdc.c          |    1 +
 drivers/media/platform/omap3isp/ispccp2.c          |    1 +
 drivers/media/platform/omap3isp/ispcsi2.c          |    1 +
 drivers/media/platform/omap3isp/isppreview.c       |    1 +
 drivers/media/platform/omap3isp/ispresizer.c       |    1 +
 drivers/media/platform/omap3isp/ispstat.c          |    2 +
 drivers/staging/media/imx/Kconfig                  |    4 +-
 drivers/staging/media/imx/imx6-mipi-csi2.c         |   12 +-
 drivers/staging/media/imx/imx7-media-csi.c         |   30 +-
 27 files changed, 2630 insertions(+), 1356 deletions(-)
 create mode 100644 Documentation/media/uapi/v4l/pixfmt-bayer.rst
 delete mode 100644 Documentation/media/uapi/v4l/pixfmt-packed-rgb.rst
 create mode 100644 drivers/media/i2c/ov5675.c

-- 
Sakari Ailus
