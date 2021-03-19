Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB727342400
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 19:07:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230263AbhCSSGs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 14:06:48 -0400
Received: from mga09.intel.com ([134.134.136.24]:57280 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230092AbhCSSGl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 14:06:41 -0400
IronPort-SDR: 02RIacOS6LXOHf0kwbBq7aSUHSfGT1mKcF9r3X2jNUeTcEMVRa0xpLJpZEgbDGQbfMrIyNg5O4
 78CFwISmpaow==
X-IronPort-AV: E=McAfee;i="6000,8403,9928"; a="190035996"
X-IronPort-AV: E=Sophos;i="5.81,262,1610438400"; 
   d="scan'208";a="190035996"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2021 11:06:39 -0700
IronPort-SDR: r5kRvCOGKo7ZcqvQs4AB5PV/u9Te7o7cm7LxcShYESu6hkq8uzrZnNbNZ9DKWHITbR1h5y6u2i
 Q014uFIsRC7w==
X-IronPort-AV: E=Sophos;i="5.81,262,1610438400"; 
   d="scan'208";a="413605679"
Received: from mkrastex-mobl.ger.corp.intel.com ([10.104.88.55])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2021 11:06:36 -0700
From:   Martina Krasteva <martinax.krasteva@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
        sakari.ailus@linux.intel.com,
        daniele.alessandrelli@linux.intel.com,
        paul.j.murphy@linux.intel.com,
        gjorgjix.rosikopulos@linux.intel.com,
        martinax.krasteva@linux.intel.com
Subject: [PATCH 00/10] Keem Bay Camera Subsystem
Date:   Fri, 19 Mar 2021 18:06:22 +0000
Message-Id: <20210319180632.585-1-martinax.krasteva@linux.intel.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Martina Krasteva <martinax.krasteva@intel.com>

Patch series contains Keem Bay Camera Subsystem driver implementation,
documentation and devicetree binding document.

Gjorgji Rosikopulos (7):
  media: Keem Bay Camera: Keem Bay camera driver
  media: Keem Bay Camera: Add VPU camera interface
  uapi: Keem Bay ISP Parameters data types
  media: v4l: Add Keem Bay Camera meta buffer formats
  media: Keem Bay Camera: Add ISP sub-device
  media: Keem Bay Camera: Add metadata video node
  media: admin-guide: Add documentation for Keem Bay Camera

Martina Krasteva (3):
  dt-bindings: media: Add bindings for Keem Bay Camera
  media: Keem Bay Camera: Add pipeline support
  media: Keem Bay Camera: Add capture video node

 Documentation/admin-guide/media/keembay-camera.dot |   12 +
 Documentation/admin-guide/media/keembay-camera.rst |  174 ++
 Documentation/admin-guide/media/v4l-drivers.rst    |    1 +
 .../bindings/media/intel,keembay-camera.yaml       |   98 ++
 .../userspace-api/media/v4l/meta-formats.rst       |    1 +
 .../media/v4l/pixfmt-meta-intel-kmb.rst            |   98 ++
 MAINTAINERS                                        |   14 +
 drivers/media/platform/Kconfig                     |    1 +
 drivers/media/platform/Makefile                    |    2 +
 drivers/media/platform/keembay-camera/Kconfig      |   11 +
 drivers/media/platform/keembay-camera/Makefile     |    5 +
 .../platform/keembay-camera/keembay-cam-xlink.c    |  327 ++++
 .../platform/keembay-camera/keembay-cam-xlink.h    |   49 +
 .../media/platform/keembay-camera/keembay-camera.c |  287 +++
 .../media/platform/keembay-camera/keembay-camera.h |   43 +
 .../media/platform/keembay-camera/keembay-isp.c    | 1397 +++++++++++++++
 .../media/platform/keembay-camera/keembay-isp.h    |  136 ++
 .../platform/keembay-camera/keembay-metadata.c     | 1860 ++++++++++++++++++++
 .../platform/keembay-camera/keembay-metadata.h     |  154 ++
 .../keembay-camera/keembay-params-defaults.c       |  326 ++++
 .../keembay-camera/keembay-params-defaults.h       |   38 +
 .../platform/keembay-camera/keembay-pipeline.c     |  401 +++++
 .../platform/keembay-camera/keembay-pipeline.h     |   75 +
 .../media/platform/keembay-camera/keembay-video.c  |  922 ++++++++++
 .../media/platform/keembay-camera/keembay-video.h  |   74 +
 .../platform/keembay-camera/keembay-vpu-cmd.h      |  110 ++
 .../platform/keembay-camera/keembay-vpu-frame.h    |  102 ++
 .../platform/keembay-camera/keembay-vpu-isp.h      |  724 ++++++++
 .../platform/keembay-camera/keembay-vpu-pipe.h     |  110 ++
 .../platform/keembay-camera/keembay-vpu-src.h      |  193 ++
 include/uapi/linux/keembay-isp-ctl.h               |  796 +++++++++
 include/uapi/linux/videodev2.h                     |    4 +
 32 files changed, 8545 insertions(+)
 create mode 100644 Documentation/admin-guide/media/keembay-camera.dot
 create mode 100644 Documentation/admin-guide/media/keembay-camera.rst
 create mode 100644 Documentation/devicetree/bindings/media/intel,keembay-camera.yaml
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-meta-intel-kmb.rst
 create mode 100644 drivers/media/platform/keembay-camera/Kconfig
 create mode 100644 drivers/media/platform/keembay-camera/Makefile
 create mode 100644 drivers/media/platform/keembay-camera/keembay-cam-xlink.c
 create mode 100644 drivers/media/platform/keembay-camera/keembay-cam-xlink.h
 create mode 100644 drivers/media/platform/keembay-camera/keembay-camera.c
 create mode 100644 drivers/media/platform/keembay-camera/keembay-camera.h
 create mode 100644 drivers/media/platform/keembay-camera/keembay-isp.c
 create mode 100644 drivers/media/platform/keembay-camera/keembay-isp.h
 create mode 100644 drivers/media/platform/keembay-camera/keembay-metadata.c
 create mode 100644 drivers/media/platform/keembay-camera/keembay-metadata.h
 create mode 100644 drivers/media/platform/keembay-camera/keembay-params-defaults.c
 create mode 100644 drivers/media/platform/keembay-camera/keembay-params-defaults.h
 create mode 100644 drivers/media/platform/keembay-camera/keembay-pipeline.c
 create mode 100644 drivers/media/platform/keembay-camera/keembay-pipeline.h
 create mode 100644 drivers/media/platform/keembay-camera/keembay-video.c
 create mode 100644 drivers/media/platform/keembay-camera/keembay-video.h
 create mode 100644 drivers/media/platform/keembay-camera/keembay-vpu-cmd.h
 create mode 100644 drivers/media/platform/keembay-camera/keembay-vpu-frame.h
 create mode 100644 drivers/media/platform/keembay-camera/keembay-vpu-isp.h
 create mode 100644 drivers/media/platform/keembay-camera/keembay-vpu-pipe.h
 create mode 100644 drivers/media/platform/keembay-camera/keembay-vpu-src.h
 create mode 100644 include/uapi/linux/keembay-isp-ctl.h


base-commit: f00397ee41c79b6155b9b44abd0055b2c0621349
-- 
2.11.0

