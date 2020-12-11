Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF3F92D7465
	for <lists+linux-media@lfdr.de>; Fri, 11 Dec 2020 11:59:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393878AbgLKK6l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Dec 2020 05:58:41 -0500
Received: from mga03.intel.com ([134.134.136.65]:5440 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2394334AbgLKK6Y (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Dec 2020 05:58:24 -0500
IronPort-SDR: KmHbuOc+vzujY0bMuugX68pMJ2cVqB+0z51JtayQtDrp9MWgbiTxpBAV8DCHtxkritXVieKS2o
 adfbCZ5Q+Avg==
X-IronPort-AV: E=McAfee;i="6000,8403,9831"; a="174527127"
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; 
   d="scan'208";a="174527127"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2020 02:56:38 -0800
IronPort-SDR: 5R59PEhGtq9cdvl6WR098dDcWcP/lPb6ofUHLeeEf/xkxcJVYgTQcO3IiBAQD1cIzvHyI8ZQ7n
 7VDcIHsqFldg==
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; 
   d="scan'208";a="365363341"
Received: from mkrastex-mobl.ger.corp.intel.com ([10.104.80.6])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2020 02:56:35 -0800
From:   Martina Krasteva <martinax.krasteva@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
        sakari.ailus@linux.intel.com,
        daniele.alessandrelli@linux.intel.com,
        paul.j.murphy@linux.intel.com,
        gjorgjix.rosikopulos@linux.intel.com,
        martinax.krasteva@linux.intel.com
Subject: [PATCH v4 0/2] IMX334 Camera Sensor Driver
Date:   Fri, 11 Dec 2020 10:56:31 +0000
Message-Id: <20201211105633.708-1-martinax.krasteva@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Martina Krasteva <martinax.krasteva@intel.com>

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

Best Regards,
Martina


Martina Krasteva (2):
  dt-bindings: media: Add bindings for imx334
  media: i2c: Add imx334 camera sensor driver

 .../devicetree/bindings/media/i2c/sony,imx334.yaml |   62 ++
 MAINTAINERS                                        |    9 +
 drivers/media/i2c/Kconfig                          |   14 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/imx334.c                         | 1038 ++++++++++++++++++++
 5 files changed, 1124 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
 create mode 100644 drivers/media/i2c/imx334.c

-- 
2.11.0

