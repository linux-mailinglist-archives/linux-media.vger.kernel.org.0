Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9485D30BEC1
	for <lists+linux-media@lfdr.de>; Tue,  2 Feb 2021 13:53:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232095AbhBBMwO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 07:52:14 -0500
Received: from mga17.intel.com ([192.55.52.151]:58495 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232108AbhBBMwL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Feb 2021 07:52:11 -0500
IronPort-SDR: Swp0zFIQxOfzMGI82hJ0kmycpXlZOvxcNFgMnRdUV/wLCf9RXESeCrmpIrzS6IyAtrzgokGTBl
 yEvhvkC3RjKA==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="160612475"
X-IronPort-AV: E=Sophos;i="5.79,395,1602572400"; 
   d="scan'208";a="160612475"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2021 04:50:24 -0800
IronPort-SDR: 4enmk+KzrKzMsEYc2hUEN8GchXBIiYGnAtdjidhMj3ACyTk6qE7VBIjoCFux0tJ3y21FJTvttj
 qWiPlzvkFTfw==
X-IronPort-AV: E=Sophos;i="5.79,395,1602572400"; 
   d="scan'208";a="370644291"
Received: from mkrastex-mobl.ger.corp.intel.com ([10.104.84.31])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2021 04:50:21 -0800
From:   Martina Krasteva <martinax.krasteva@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
        sakari.ailus@linux.intel.com,
        daniele.alessandrelli@linux.intel.com,
        paul.j.murphy@linux.intel.com,
        gjorgjix.rosikopulos@linux.intel.com,
        martinax.krasteva@linux.intel.com
Subject: [PATCH v6 0/2] IMX334 Camera Sensor Driver
Date:   Tue,  2 Feb 2021 12:50:16 +0000
Message-Id: <20210202125018.208-1-martinax.krasteva@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Martina Krasteva <mkrasteva@mm-sol.com>

Hello,

This patch series contains Sony imx334 sensor driver and device tree binding document.

A v4l2 sub-device driver for the Sony imx334 image sensor is added.
This is a camera sensor using the i2c bus for control and the
csi-2 bus for data.

The following features are supported:
- manual exposure and analog gain control support
- vblank/hblank/pixel rate control support
- supported resolution:
    - 3840x2160 @ 60fps
- supported bayer order output:
    - SRGGB12

v1: https://patchwork.kernel.org/project/linux-media/list/?series=388393

v1->v2:
- dt-bindings doc fixes
- minor cosmetic changes
- improvement in write_reg()
- set all media bus format fields to pass v4l2-compliance test
- remove link_validate from source entity

v2: https://patchwork.kernel.org/project/linux-media/list/?series=396393

v2->v3:
- small cosmetic changes

v3: https://patchwork.kernel.org/project/linux-media/list/?series=397689

v3->v4:
- fix read/write_reg() functions

v4: https://patchwork.kernel.org/project/linux-media/list/?series=400459

v4->v5:
- add link-frequencies in dt-bindings doc
- edit required properties in db-bindings doc
- fix data_buf overrun in read_reg()
- add function to parse dt configuration
- allow cahnging vblank in power off state
- change lpfr and ppln with vblank and hblank in mode description

v5: https://patchwork.kernel.org/project/linux-media/list/?series=425541

v5->v6:
- declare imx334_parse_hw_config() as static function

Best Regards,
Martina


Martina Krasteva (2):
  dt-bindings: media: Add bindings for imx334
  media: i2c: Add imx334 camera sensor driver

 .../devicetree/bindings/media/i2c/sony,imx334.yaml |   77 ++
 MAINTAINERS                                        |    9 +
 drivers/media/i2c/Kconfig                          |   14 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/imx334.c                         | 1097 ++++++++++++++++++++
 5 files changed, 1198 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
 create mode 100644 drivers/media/i2c/imx334.c


base-commit: fb2a9c3209872b6e65661e3737f2767832a42973
-- 
2.11.0

