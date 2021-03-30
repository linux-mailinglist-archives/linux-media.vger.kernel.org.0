Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D187F34EA30
	for <lists+linux-media@lfdr.de>; Tue, 30 Mar 2021 16:21:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231950AbhC3OUx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Mar 2021 10:20:53 -0400
Received: from mga03.intel.com ([134.134.136.65]:27451 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231344AbhC3OU3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Mar 2021 10:20:29 -0400
IronPort-SDR: ns8lQ+HwQbB8kYUttXmlvaYV4y7GkOLlr+qdK2DWsLf2f12V7a+GG3ogNBtemWtqRM6NaaE3PF
 e9/3ZjDabrYg==
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="191805406"
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; 
   d="scan'208";a="191805406"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2021 07:20:28 -0700
IronPort-SDR: 8yy3zgZeMOMOp/wksjhO4i+FNVdfl6apnVPDrZYyeszMvVqOkRjmPHL7miwTCo7GGWhptG/tcT
 SrPs6O6vLKug==
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; 
   d="scan'208";a="418190171"
Received: from mkrastex-mobl.ger.corp.intel.com ([10.104.88.1])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2021 07:20:25 -0700
From:   Martina Krasteva <martinax.krasteva@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
        sakari.ailus@linux.intel.com,
        daniele.alessandrelli@linux.intel.com,
        paul.j.murphy@linux.intel.com,
        gjorgjix.rosikopulos@linux.intel.com,
        martinax.krasteva@linux.intel.com
Subject: [PATCH 0/6] Camera Sensor Drivers
Date:   Tue, 30 Mar 2021 15:20:17 +0100
Message-Id: <20210330142023.141-1-martinax.krasteva@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Martina Krasteva <martinax.krasteva@intel.com>

Patch series contains Sony IMX335, Sony IMX412 and OmniVision OV9282
camera sensor drivers and respective binding documentation.

Martina Krasteva (6):
  dt-bindings: media: Add bindings for imx335
  media: i2c: Add imx335 camera sensor driver
  dt-bindings: media: Add bindings for imx412
  media: i2c: Add imx412 camera sensor driver
  dt-bindings: media: Add bindings for ov9282
  media: i2c: Add ov9282 camera sensor driver

 .../devicetree/bindings/media/i2c/ovti,ov9282.yaml |   90 ++
 .../devicetree/bindings/media/i2c/sony,imx335.yaml |   90 ++
 .../devicetree/bindings/media/i2c/sony,imx412.yaml |   90 ++
 MAINTAINERS                                        |   27 +
 drivers/media/i2c/Kconfig                          |   42 +
 drivers/media/i2c/Makefile                         |    4 +-
 drivers/media/i2c/imx335.c                         | 1126 +++++++++++++++++
 drivers/media/i2c/imx412.c                         | 1269 ++++++++++++++++++++
 drivers/media/i2c/ov9282.c                         | 1134 +++++++++++++++++
 9 files changed, 3871 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
 create mode 100644 drivers/media/i2c/imx335.c
 create mode 100644 drivers/media/i2c/imx412.c
 create mode 100644 drivers/media/i2c/ov9282.c


base-commit: 9d49ed9ca93b8c564033c1d6808017bc9052b5db
-- 
2.11.0

