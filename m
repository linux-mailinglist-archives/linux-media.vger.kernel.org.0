Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 110392CF075
	for <lists+linux-media@lfdr.de>; Fri,  4 Dec 2020 16:12:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730282AbgLDPLu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Dec 2020 10:11:50 -0500
Received: from mga04.intel.com ([192.55.52.120]:56236 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728626AbgLDPLu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 4 Dec 2020 10:11:50 -0500
IronPort-SDR: VrPDwLPcIaaZzcvIFG96813IaTkZb6efgD56z8voITGSa7Jtf1gNKrUyPzxTkpqo2Uy1G+6mmo
 i+7wqm44Y5Gw==
X-IronPort-AV: E=McAfee;i="6000,8403,9824"; a="170821609"
X-IronPort-AV: E=Sophos;i="5.78,393,1599548400"; 
   d="scan'208";a="170821609"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2020 07:10:08 -0800
IronPort-SDR: RUziKg/ghDglkchMiNebHJjim4jtXnw3iDquTSitK5j385eGfNu6yBdAzxijv3sW3dbF6PKiCn
 Mns+v8rVDVQQ==
X-IronPort-AV: E=Sophos;i="5.78,393,1599548400"; 
   d="scan'208";a="550980261"
Received: from mkrastex-mobl.ger.corp.intel.com ([10.104.80.1])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2020 07:10:05 -0800
From:   Martina Krasteva <martinax.krasteva@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
        sakari.ailus@linux.intel.com,
        daniele.alessandrelli@linux.intel.com,
        paul.j.murphy@linux.intel.com,
        gjorgjix.rosikopulos@linux.intel.com,
        martinax.krasteva@linux.intel.com
Subject: [PATCH v2 0/2] IMX334 Camera Sensor Driver
Date:   Fri,  4 Dec 2020 15:10:01 +0000
Message-Id: <20201204151003.167-1-martinax.krasteva@linux.intel.com>
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

v1->v2:
- dt-bindings doc fixes
- minor cosmetic changes
- improvement in write_reg()
- set all media bus format fields to pass v4l2-compliance test
- remove link_validate from source entity

v1: https://patchwork.kernel.org/project/linux-media/list/?series=388393

Best Regards,
Martina

Martina Krasteva (2):
  dt-bindings: media: Add bindings for imx334
  media: i2c: Add imx334 camera sensor driver

 .../devicetree/bindings/media/i2c/sony,imx334.yaml |   62 ++
 MAINTAINERS                                        |    9 +
 drivers/media/i2c/Kconfig                          |   14 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/imx334.c                         | 1040 ++++++++++++++++++++
 5 files changed, 1126 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
 create mode 100644 drivers/media/i2c/imx334.c

-- 
2.11.0

