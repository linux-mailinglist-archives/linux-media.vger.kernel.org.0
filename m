Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99DFE30ADCD
	for <lists+linux-media@lfdr.de>; Mon,  1 Feb 2021 18:28:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231624AbhBAR1N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Feb 2021 12:27:13 -0500
Received: from mga05.intel.com ([192.55.52.43]:30392 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231417AbhBAR0g (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Feb 2021 12:26:36 -0500
IronPort-SDR: ckb1o7kTFJUa8wBrvEdB5nn8t27vZt/OCijad38rWGOxG+e0uVt9Dj2e+GyoS9GJ1g2NDWVvoW
 DBXCtAohw12Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="265552653"
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; 
   d="scan'208";a="265552653"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 09:24:51 -0800
IronPort-SDR: Wmcj+LS7ydY41SRV0tgwXKw/KY4Mf34WnVd+y3CDKXK2xuxtgtnXG+/UAu56b9FoqK8gwZRCTf
 cdPGRTZUMGkw==
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; 
   d="scan'208";a="391007220"
Received: from mkrastex-mobl.ger.corp.intel.com ([10.104.80.35])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 09:24:48 -0800
From:   Martina Krasteva <martinax.krasteva@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
        sakari.ailus@linux.intel.com,
        daniele.alessandrelli@linux.intel.com,
        paul.j.murphy@linux.intel.com,
        gjorgjix.rosikopulos@linux.intel.com,
        martinax.krasteva@linux.intel.com
Subject: [PATCH v5 0/2] IMX334 Camera Sensor Driver
Date:   Mon,  1 Feb 2021 17:24:43 +0000
Message-Id: <20210201172445.164-1-martinax.krasteva@linux.intel.com>
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


base-commit: fd821bf0ed9a7db09d2e007df697f4d9ecfda99a
-- 
2.11.0

