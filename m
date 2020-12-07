Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06ECA2D157A
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 17:07:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726046AbgLGQDB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 11:03:01 -0500
Received: from mga17.intel.com ([192.55.52.151]:46186 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725877AbgLGQDB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Dec 2020 11:03:01 -0500
IronPort-SDR: 0aKc6r9M4vwOM7pki2gTwSR21Eabop+QfBv8PWQuZUdoKGzSwixdgqKm8lTWhxpn1yk3+8v+l+
 p6M97zgCn9Iw==
X-IronPort-AV: E=McAfee;i="6000,8403,9827"; a="153535662"
X-IronPort-AV: E=Sophos;i="5.78,400,1599548400"; 
   d="scan'208";a="153535662"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2020 08:01:15 -0800
IronPort-SDR: qBjnZHpN5qkvWn0IbKE8KH1ACk2sZjpUDJcx4eSSZmyoVXQN8Jtt9Yc5ZhQQDZhu6ITOqk73uf
 aQYfkmoXfyXA==
X-IronPort-AV: E=Sophos;i="5.78,400,1599548400"; 
   d="scan'208";a="317228450"
Received: from mkrastex-mobl.ger.corp.intel.com ([10.104.88.5])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2020 08:01:12 -0800
From:   Martina Krasteva <martinax.krasteva@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
        sakari.ailus@linux.intel.com,
        daniele.alessandrelli@linux.intel.com,
        paul.j.murphy@linux.intel.com,
        gjorgjix.rosikopulos@linux.intel.com,
        martinax.krasteva@linux.intel.com
Subject: [PATCH v3 0/2] IMX334 Camera Sensor Driver
Date:   Mon,  7 Dec 2020 16:01:06 +0000
Message-Id: <20201207160109.490-1-martinax.krasteva@linux.intel.com>
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

Best Regards,
Martina

Martina Krasteva (2):
  dt-bindings: media: Add bindings for imx334
  media: i2c: Add imx334 camera sensor driver

 .../devicetree/bindings/media/i2c/sony,imx334.yaml |   62 ++
 MAINTAINERS                                        |    9 +
 drivers/media/i2c/Kconfig                          |   14 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/imx334.c                         | 1036 ++++++++++++++++++++
 5 files changed, 1122 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
 create mode 100644 drivers/media/i2c/imx334.c

-- 
2.11.0

