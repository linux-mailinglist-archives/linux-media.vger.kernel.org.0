Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E8742BABD9
	for <lists+linux-media@lfdr.de>; Fri, 20 Nov 2020 15:28:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726559AbgKTO2J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Nov 2020 09:28:09 -0500
Received: from mga14.intel.com ([192.55.52.115]:21379 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725801AbgKTO2J (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Nov 2020 09:28:09 -0500
IronPort-SDR: X7ciaVmYzAHZHgrPEqkJHCecNHvtOHnmUit9O0RkdtupB3rfE5RFK/AcqEXE1rlt8N3uTFrbd2
 ID9057J3hY+Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9810"; a="170698829"
X-IronPort-AV: E=Sophos;i="5.78,356,1599548400"; 
   d="scan'208";a="170698829"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2020 06:28:09 -0800
IronPort-SDR: 9kN5ygrkG1GRPnwrRdWjZd9MOVs+zIdb02q42FIcEyCEgBafHaxXgfpu5/hA9uQw6Ntv6Ps5Vx
 XuLegeEGMgxQ==
X-IronPort-AV: E=Sophos;i="5.78,356,1599548400"; 
   d="scan'208";a="545461392"
Received: from mkrastex-mobl.ger.corp.intel.com ([10.104.67.10])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2020 06:28:06 -0800
From:   Martina Krasteva <martinax.krasteva@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
        sakari.ailus@linux.intel.com,
        daniele.alessandrelli@linux.intel.com,
        gjorgjix.rosikopulos@linux.intel.com,
        martinax.krasteva@linux.intel.com
Subject: [PATCH 0/2] IMX334 Camera Sensor Driver
Date:   Fri, 20 Nov 2020 14:28:01 +0000
Message-Id: <20201120142803.308-1-martinax.krasteva@linux.intel.com>
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


Best Regards,
Martina

Martina Krasteva (2):
  dt-bindings: media: Add bindings for imx334
  media: Add imx334 camera sensor driver

 .../devicetree/bindings/media/i2c/sony,imx334.yaml |   59 ++
 MAINTAINERS                                        |    8 +
 drivers/media/i2c/Kconfig                          |   14 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/imx334.c                         | 1089 ++++++++++++++++++++
 5 files changed, 1171 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
 create mode 100644 drivers/media/i2c/imx334.c

-- 
2.11.0

