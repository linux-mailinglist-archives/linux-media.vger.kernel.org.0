Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D37C5C2EE6
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2019 10:32:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733007AbfJAIcn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Oct 2019 04:32:43 -0400
Received: from retiisi.org.uk ([95.216.213.190]:48312 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727361AbfJAIcn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Oct 2019 04:32:43 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 853DF634C87
        for <linux-media@vger.kernel.org>; Tue,  1 Oct 2019 11:32:18 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1iFDZx-0001q2-0s
        for linux-media@vger.kernel.org; Tue, 01 Oct 2019 11:32:17 +0300
Date:   Tue, 1 Oct 2019 11:32:17 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for 5.5] Sensor driver patches
Message-ID: <20191001083216.GC896@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's the first pile of sensor driver patches for 5.5. There's mostly
sensor driver patches but no new drivers.

Please pull.


The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.5-1-signed

for you to fetch changes up to dc18c70466bbddb18091d248c0cf0c9e1625111e:

  media: i2c: ov2659: Switch to SPDX Licensing (2019-10-01 10:25:49 +0300)

----------------------------------------------------------------
Sensor + driver + framework patches for 5.5

----------------------------------------------------------------
Benoit Parrot (8):
      media: i2c: ov2659: Fix for image wrap-around in lower resolution
      media: i2c: ov2659: Fix sensor detection to actually fail when device is not present
      media: i2c: ov2659: Cleanup include file list
      media: i2c: ov2659: fix s_stream return value
      media: dt-bindings: ov2659: add powerdown/reset-gpios optional property
      media: i2c: ov2659: Add powerdown/reset gpio handling
      media: i2c: ov2659: Fix missing 720p register config
      media: i2c: ov2659: Switch to SPDX Licensing

Colin Ian King (2):
      media: i2c: mt9m001: make array init_regs static, makes object smaller
      media: s3c-camif: make array 'registers' static const, makes object smaller

Dongchun Zhu (1):
      media: i2c: ov5695: Modify the function of async register subdev related devices

Janusz Krzysztofik (9):
      media: ov6650: Fix MODULE_DESCRIPTION
      media: ov6650: Fix control handler not freed on init error
      media: ov6650: Fix crop rectangle alignment not passed back
      media: ov6650: Fix incorrect use of JPEG colorspace
      media: ov6650: Fix some format attributes not under control
      media: ov6650: Fix .get_fmt() V4L2_SUBDEV_FORMAT_TRY support
      media: ov6650: Fix default format not applied on device probe
      media: ov6650: Fix stored frame format not in sync with hardware
      media: ov6650: Fix stored crop rectangle not in sync with hardware

Sakari Ailus (2):
      v4l: Put camera sensor, lens and flash drivers under MEDIA_CAMERA_SUPPORT
      v4l: fwnode: Make v4l2_fwnode_endpoint_free() safer

YueHaibing (1):
      media: max2175: Fix build error without CONFIG_REGMAP_I2C

zhengbin (1):
      media: mc-device.c: fix memleak in media_device_register_entity

 .../devicetree/bindings/media/i2c/ov2659.txt       |   9 ++
 drivers/media/i2c/Kconfig                          |  54 ++------
 drivers/media/i2c/mt9m001.c                        |   2 +-
 drivers/media/i2c/ov2659.c                         | 139 +++++++++++++++------
 drivers/media/i2c/ov5695.c                         |   2 +-
 drivers/media/i2c/ov6650.c                         | 137 ++++++++++++--------
 drivers/media/mc/mc-device.c                       |  65 +++++-----
 drivers/media/platform/s3c-camif/camif-regs.c      |   2 +-
 drivers/media/v4l2-core/v4l2-fwnode.c              |   1 +
 9 files changed, 247 insertions(+), 164 deletions(-)

-- 
Sakari Ailus
