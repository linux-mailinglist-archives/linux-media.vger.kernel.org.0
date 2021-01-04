Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDA1C2E9489
	for <lists+linux-media@lfdr.de>; Mon,  4 Jan 2021 13:07:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726026AbhADMHD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jan 2021 07:07:03 -0500
Received: from retiisi.eu ([95.216.213.190]:49062 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725840AbhADMHD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 Jan 2021 07:07:03 -0500
Received: from valkosipuli.localdomain (unknown [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id ABDC3634C87
        for <linux-media@vger.kernel.org>; Mon,  4 Jan 2021 14:06:12 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kwOcm-0000XH-Jd
        for linux-media@vger.kernel.org; Mon, 04 Jan 2021 14:06:12 +0200
Date:   Mon, 4 Jan 2021 14:06:12 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for 5.12] V4L2 camera sensor and other patches
Message-ID: <20210104120612.GB850@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a large chunk of V4L2 core IOCTL handling, documentation, camera
sensor and IPU3 patches for 5.12. Notable additions are drivers for ov5648
and ov8856 drivers from Paul Kocialkowski.

A few patches changing V4L2 core IOCTL handling address a long-standing
memory leak issue.

Documentation patches improve documentation e.g. on V4L2 sub-device ops,
add an entity function for ISPs and document clock handling for camera
sensors and document relation between pixel rate and link frequency on
CSI-2 with C-PHY.

There are also noteworthy improvements to the ov5647 driver from Jacopo
Mondi and Dave Stevenson.

Please pull.


The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.12-1.2-signed

for you to fetch changes up to 4e3e9a6501921f3525b9e16e26a969718d9f30c0:

  media: mt9v111: Remove unneeded device-managed puts (2021-01-04 13:51:12 +0200)

----------------------------------------------------------------
V4L2 patches for 5.12

----------------------------------------------------------------
Andy Shevchenko (1):
      media: ipu3-cio2: Build only for x86

Dave Stevenson (8):
      media: ov5647: Add support for PWDN GPIO.
      media: ov5647: Add support for non-continuous clock mode
      media: ov5647: Add set_fmt and get_fmt calls.
      media: ov5647: Add support for get_selection()
      media: ov5647: Set V4L2_SUBDEV_FL_HAS_EVENTS flag
      media: ov5647: Support V4L2_CID_PIXEL_RATE
      media: ov5647: Support V4L2_CID_VBLANK control
      media: ov5647: Advertise the correct exposure range

David Plowman (1):
      media: ov5647: Support gain, exposure and AWB controls

Ezequiel Garcia (1):
      media: mt9v111: Remove unneeded device-managed puts

Hans Verkuil (1):
      media: i2c: imx219: take lock in imx219_enum_mbus_code/frame_size

Jacopo Mondi (22):
      dt-bindings: media: i2c: Rename ov5647.yaml
      media: ov5647: Fix format initialization
      media: ov5647: Fix style issues
      media: ov5647: Replace license with SPDX identifier
      media: ov5647: Fix return value from read/write
      media: ov5647: Program mode at s_stream(1) time
      media: ov5647: Implement enum_frame_size()
      media: ov5647: Protect s_stream() with mutex
      media: ov5647: Rationalize driver structure name
      media: ov5647: Break out format handling
      media: ov5647: Rename SBGGR8 VGA mode
      media: ov5647: Add SGGBR10_1X10 modes
      media: ov5647: Use SBGGR10_1X10 640x480 as default
      media: ov5647: Implement set_fmt pad operation
      media: ov5647: Support V4L2_CID_HBLANK control
      media: ov5647: Use pm_runtime infrastructure
      media: ov5647: Rework s_stream() operation
      media: ov5647: Apply controls only when powered
      media: ov5647: Constify oe_enable/disable reglist
      media: ov5647: Support VIDIOC_SUBSCRIBE_EVENT
      media: ov5647: Remove 640x480 SBGGR8 mode
      media: i2c: ov5670: Fix PIXEL_RATE minimum value

Paul Kocialkowski (4):
      dt-bindings: media: i2c: Add OV5648 bindings documentation
      media: i2c: Add support for the OV5648 image sensor
      dt-bindings: media: i2c: Add OV8865 bindings documentation
      media: i2c: Add support for the OV8865 image sensor

Pavel Machek (1):
      media: ipu3-cio2: Fix mbus_code processing in cio2_subdev_set_fmt()

Sakari Ailus (8):
      Documentation: v4l: Remove reference to video ops
      Documentation: v4l: Document that link_validate op is valid for sink only
      Documentation: media: Update pixel rate formula for C-PHY
      v4l: fwnode: v4l2_async_notifier_parse_fwnode_endpoints is deprecated
      media: uapi: Add an entity type for Image Signal Processors
      v4l: ioctl: Fix memory leak in video_usercopy
      v4l: ioctl: Use kmalloc to allocate a small chunk of memory
      Documentation: media: Document clock handling in camera sensor drivers

 .../media/i2c/{ov5647.yaml => ovti,ov5647.yaml}    |    0
 .../devicetree/bindings/media/i2c/ovti,ov5648.yaml |  115 +
 .../devicetree/bindings/media/i2c/ovti,ov8865.yaml |  124 +
 Documentation/driver-api/media/camera-sensor.rst   |   20 +-
 Documentation/driver-api/media/csi2.rst            |    4 +-
 Documentation/driver-api/media/v4l2-subdev.rst     |   15 +-
 .../userspace-api/media/mediactl/media-types.rst   |    7 +
 MAINTAINERS                                        |    2 +-
 drivers/media/i2c/Kconfig                          |   26 +
 drivers/media/i2c/Makefile                         |    2 +
 drivers/media/i2c/imx219.c                         |    8 +-
 drivers/media/i2c/mt9v111.c                        |    6 -
 drivers/media/i2c/ov5647.c                         | 1259 +++++++--
 drivers/media/i2c/ov5648.c                         | 2623 +++++++++++++++++
 drivers/media/i2c/ov5670.c                         |    3 +-
 drivers/media/i2c/ov8865.c                         | 2972 ++++++++++++++++++++
 drivers/media/pci/intel/ipu3/Kconfig               |    3 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2.c           |    2 +-
 drivers/media/v4l2-core/v4l2-ioctl.c               |   36 +-
 include/media/v4l2-fwnode.h                        |    4 +
 include/uapi/linux/media.h                         |    1 +
 21 files changed, 6981 insertions(+), 251 deletions(-)
 rename Documentation/devicetree/bindings/media/i2c/{ov5647.yaml => ovti,ov5647.yaml} (100%)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
 create mode 100644 drivers/media/i2c/ov5648.c
 create mode 100644 drivers/media/i2c/ov8865.c

-- 
Sakari Ailus
