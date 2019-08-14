Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68FC78CEB9
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2019 10:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726585AbfHNIna (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 04:43:30 -0400
Received: from retiisi.org.uk ([95.216.213.190]:34774 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726496AbfHNIna (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 04:43:30 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id CADE2634C88
        for <linux-media@vger.kernel.org>; Wed, 14 Aug 2019 11:43:17 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1hxosH-0000su-5L
        for linux-media@vger.kernel.org; Wed, 14 Aug 2019 11:43:17 +0300
Date:   Wed, 14 Aug 2019 11:43:17 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for 5.4] More sensor driver, omap3isp and documentation
 patches
Message-ID: <20190814084317.GI2527@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Please pull.


The following changes since commit 0dc99e042a4cfbc1e27572d523d2a1dbaf402cbf:

  media: MAINTAINERS: Remove zoran driver (2019-08-13 11:55:34 -0300)

are available in the Git repository at:

  ssh://linuxtv.org/git/sailus/media_tree.git tags/for-5.4-4-signed

for you to fetch changes up to 91a393dd12ba00d3916496a18ae3df090d2d351b:

  media: docs-rst: Clarify duration of LP-11 mode (2019-08-14 11:33:45 +0300)

----------------------------------------------------------------
Sensor driver stuff for 5.4

----------------------------------------------------------------
Ezequiel Garcia (1):
      media: i2c: ov5645: Fix power sequence

Luca Weiss (1):
      media: ov5640: Add support for flash and lens devices

Sakari Ailus (5):
      ov8856: Check reading clock frequency succeeded
      omap3isp: Set device on omap3isp subdevs
      omap3isp: Don't set streaming state on random subdevs
      v4l: Documentation: Serial busses use parallel mbus codes
      v4l: Documentation: Raw Bayer formats are not RGB formats

Shawn Tu (1):
      ov5675: Add support for OV5675 sensor

Steve Longerbeam (1):
      media: docs-rst: Clarify duration of LP-11 mode

 Documentation/media/kapi/csi2.rst                  |   17 +-
 Documentation/media/uapi/v4l/control.rst           |    2 +-
 Documentation/media/uapi/v4l/hist-v4l2.rst         |    2 +-
 Documentation/media/uapi/v4l/pixfmt-bayer.rst      |   38 +
 Documentation/media/uapi/v4l/pixfmt-packed-rgb.rst | 1306 --------------------
 Documentation/media/uapi/v4l/pixfmt-rgb.rst        | 1302 ++++++++++++++++++-
 Documentation/media/uapi/v4l/pixfmt-v4l2.rst       |    2 +-
 Documentation/media/uapi/v4l/pixfmt.rst            |    1 +
 Documentation/media/uapi/v4l/subdev-formats.rst    |    8 +
 MAINTAINERS                                        |    7 +
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
 23 files changed, 2594 insertions(+), 1336 deletions(-)
 create mode 100644 Documentation/media/uapi/v4l/pixfmt-bayer.rst
 delete mode 100644 Documentation/media/uapi/v4l/pixfmt-packed-rgb.rst
 create mode 100644 drivers/media/i2c/ov5675.c

-- 
Sakari Ailus
