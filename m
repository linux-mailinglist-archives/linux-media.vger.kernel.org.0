Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4D2D3930B3
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 16:21:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236329AbhE0OXX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 May 2021 10:23:23 -0400
Received: from mga01.intel.com ([192.55.52.88]:47557 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235487AbhE0OXX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 May 2021 10:23:23 -0400
IronPort-SDR: pmfyoggzUkeYdkI5O8ZZCjYITAhIGXC4pbCchORrs2AgkGOSpeaqKfmocoPce7TPzUNEBnwU03
 f6ud3K73ssqw==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="223947904"
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; 
   d="scan'208";a="223947904"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2021 07:21:50 -0700
IronPort-SDR: l5XQLCXxqvBtSuoPbVUjztfQwxt/+Cu0quf3Wz3ebb3Z7POvNMKXr489SITB/YcHZytprlTrkh
 x1B53q5DVjFg==
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; 
   d="scan'208";a="477506739"
Received: from mkrastex-mobl.ger.corp.intel.com ([10.104.88.6])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2021 07:21:47 -0700
From:   Martina Krasteva <martinax.krasteva@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
        sakari.ailus@linux.intel.com,
        daniele.alessandrelli@linux.intel.com,
        paul.j.murphy@linux.intel.com,
        gjorgjix.rosikopulos@linux.intel.com,
        martinax.krasteva@linux.intel.com
Subject: [PATCH v2 0/6] Camera Sensor Drivers
Date:   Thu, 27 May 2021 15:21:39 +0100
Message-Id: <20210527142145.173-1-martinax.krasteva@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Martina Krasteva <martinax.krasteva@intel.com>

Patch series contains Sony IMX335, Sony IMX412 and OmniVision OV9282
camera sensor drivers and respective binding documentation.

v1->v2:
- define maxItems for reset-gpios in dt binding document
- make sure the device is powered off on remove
- use pm_runtime_resume_and_get() instead of pm_runtime_get_sync()

v1: https://patchwork.kernel.org/project/linux-media/list/?series=458115

Martina Krasteva (6):
  dt-bindings: media: Add bindings for imx335
  media: i2c: Add imx335 camera sensor driver
  dt-bindings: media: Add bindings for imx412
  media: i2c: Add imx412 camera sensor driver
  dt-bindings: media: Add bindings for ov9282
  media: i2c: Add ov9282 camera sensor driver

 .../devicetree/bindings/media/i2c/ovti,ov9282.yaml |   91 ++
 .../devicetree/bindings/media/i2c/sony,imx335.yaml |   91 ++
 .../devicetree/bindings/media/i2c/sony,imx412.yaml |   91 ++
 MAINTAINERS                                        |   27 +
 drivers/media/i2c/Kconfig                          |   42 +
 drivers/media/i2c/Makefile                         |    4 +-
 drivers/media/i2c/imx335.c                         | 1129 +++++++++++++++++
 drivers/media/i2c/imx412.c                         | 1272 ++++++++++++++++++++
 drivers/media/i2c/ov9282.c                         | 1137 +++++++++++++++++
 9 files changed, 3883 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
 create mode 100644 drivers/media/i2c/imx335.c
 create mode 100644 drivers/media/i2c/imx412.c
 create mode 100644 drivers/media/i2c/ov9282.c


base-commit: f6b46ef27317b3441138b902689bd89e4f82c6f4
-- 
2.11.0

