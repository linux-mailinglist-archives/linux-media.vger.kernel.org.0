Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 535C949386A
	for <lists+linux-media@lfdr.de>; Wed, 19 Jan 2022 11:28:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240421AbiASK2e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Jan 2022 05:28:34 -0500
Received: from meesny.iki.fi ([195.140.195.201]:59144 "EHLO meesny.iki.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240412AbiASK2d (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Jan 2022 05:28:33 -0500
Received: from hillosipuli.retiisi.eu (dkvn5pty0gzs3nltj987t-3.rev.dnainternet.fi [IPv6:2001:14ba:4457:9640:1e2d:1f75:a607:ef37])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4AD6820208
        for <linux-media@vger.kernel.org>; Wed, 19 Jan 2022 12:28:31 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1642588111;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=QBIyyctWMG97WOlyRfXilee+Z5tQMN8+XYdyj4Nc2Mg=;
        b=uUjpS2IsUeEeBkFlakHeSPNH+Z1jj3fJExXaJhD51vuqOuXzbgDlzSfTREIMlrqz4YW9u4
        XCkU5D1J5VdXHZy81NIs2LFkS5pDoTcMx8iSylyb85iRZbCQ/8ZylJOZBztDrMIWQD9+xx
        9Iw3oCEUa5TJHo9pRPsBCEsHdQT2Uk0=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id D73AE634C93
        for <linux-media@vger.kernel.org>; Wed, 19 Jan 2022 12:28:30 +0200 (EET)
Date:   Wed, 19 Jan 2022 12:28:30 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR 5.18] V4L2 patches
Message-ID: <Yefnzk4ndvoxGEB+@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1642588111; a=rsa-sha256; cv=none;
        b=A+16FvqVGRc9XRl8gJTerqjFIs1nJvKR6xTrs4iBaqF8JOVv0LVqPPIhTZ6P8FyXL2ZNd7
        Ojrex1WcQdNtp8jBUO98/QMS9bdSidsd4uBOL38FFIz0lLeRvAKAswjK2gG7K6EufAhpny
        G/AZ374j8WTQWB0QQUxxrixwarUcjzo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1642588111;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=QBIyyctWMG97WOlyRfXilee+Z5tQMN8+XYdyj4Nc2Mg=;
        b=SGr8hv2BSfvGE1htgHYncOga4BGksCbq+RH3bvfWMWnMdUlm36FRiGOCB19q5bVocDm5y8
        0HNFvptG1WoO9tKGrUKnN8kLXqDBjCG/Ima+vJl9ag5cBSofMSDpXCqFsd3XtdRuATxnuD
        M8nwSCOZbWKOlF1q/7XXxa6xHX8D8qU=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a bunch of patches again for 5.18. Most notably there's V4L2 fwnode
/ mbus_config cleanup by Laurent, the hi847 camera sensor driver from Shawn
Tu and the od08d10 camera sensor driver by Jimmy Su. Fixes elsewhere are
included, too.

Please pull.


The following changes since commit 68b9bcc8a534cd11fe55f8bc82f948aae7d81b3c:

  media: ipu3-cio2: Add support for instantiating i2c-clients for VCMs (2021-12-16 20:58:56 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.18-1-signed

for you to fetch changes up to dd19217c0d6aa5fc90a89ebd01968a3e299232a3:

  media: i2c: Add ov08d10 camera sensor driver (2022-01-19 12:19:35 +0200)

----------------------------------------------------------------
V4L2 patches for 5.18

----------------------------------------------------------------
Janusz Krzysztofik (4):
      media: ov6650: Fix set format try processing path
      media: ov6650: Add try support to selection API operations
      media: ov6650: Fix crop rectangle affected by set format
      media: ov6650: Fix missing frame interval enumeration support

Jimmy Su (1):
      media: i2c: Add ov08d10 camera sensor driver

Laurent Pinchart (8):
      media: pxa_camera: Drop usage of .set_mbus_config()
      media: i2c: ov6650: Drop implementation of .set_mbus_config()
      media: v4l2-subdev: Drop .set_mbus_config() operation
      media: v4l2-fwnode: Move bus config structure to v4l2_mediabus.h
      media: v4l2-mediabus: Use structures to describe bus configuration
      media: v4l2-mediabus: Drop legacy V4L2_MBUS_CSI2_*_LANE flags
      media: v4l2-mediabus: Drop legacy V4L2_MBUS_CSI2_CHANNEL_* flags
      media: v4l2-mediabus: Drop V4L2_MBUS_CSI2_CONTINUOUS_CLOCK flag

Robert Foss (2):
      media: camss: csiphy: Move to hardcode CSI Clock Lane number
      media: dt-bindings: media: camss: Remove clock-lane property

Sakari Ailus (3):
      v4l: Avoid unaligned access warnings when printing 4cc modifiers
      ov5648: Don't pack controls struct
      ov8865: Fix indentation in set_selection callback

Shawn Tu (1):
      media: hi847: Add support for Hi-847 sensor

 .../bindings/media/qcom,msm8916-camss.yaml         |   10 -
 .../bindings/media/qcom,msm8996-camss.yaml         |   20 -
 .../bindings/media/qcom,sdm660-camss.yaml          |   20 -
 .../bindings/media/qcom,sdm845-camss.yaml          |   17 -
 MAINTAINERS                                        |   13 +
 drivers/gpu/ipu-v3/ipu-csi.c                       |    6 +-
 drivers/media/i2c/Kconfig                          |   26 +
 drivers/media/i2c/Makefile                         |    2 +
 drivers/media/i2c/adv7180.c                        |   10 +-
 drivers/media/i2c/adv748x/adv748x-csi2.c           |   18 +-
 drivers/media/i2c/hi847.c                          | 3012 ++++++++++++++++++++
 drivers/media/i2c/ml86v7667.c                      |    5 +-
 drivers/media/i2c/mt9m001.c                        |    8 +-
 drivers/media/i2c/mt9m111.c                        |   14 +-
 drivers/media/i2c/ov08d10.c                        | 1526 ++++++++++
 drivers/media/i2c/ov5648.c                         |    6 +-
 drivers/media/i2c/ov6650.c                         |  206 +-
 drivers/media/i2c/ov8865.c                         |    8 +-
 drivers/media/i2c/ov9640.c                         |    8 +-
 drivers/media/i2c/tc358743.c                       |   26 +-
 drivers/media/i2c/tvp5150.c                        |    6 +-
 drivers/media/platform/pxa_camera.c                |   21 +-
 .../platform/qcom/camss/camss-csiphy-2ph-1-0.c     |   19 +-
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |   17 +-
 drivers/media/platform/qcom/camss/camss-csiphy.c   |   21 +-
 drivers/media/platform/qcom/camss/camss-csiphy.h   |    7 +
 drivers/media/platform/qcom/camss/camss.c          |    2 +-
 drivers/media/platform/rcar-vin/rcar-csi2.c        |   16 +-
 drivers/media/platform/rcar-vin/rcar-vin.h         |    2 +-
 drivers/media/platform/stm32/stm32-dcmi.c          |    2 +-
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h |    2 +-
 drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c |    2 +-
 drivers/media/platform/ti-vpe/cal-camerarx.c       |    6 +-
 drivers/media/v4l2-core/v4l2-fwnode.c              |   18 +-
 drivers/media/v4l2-core/v4l2-ioctl.c               |   12 +-
 drivers/media/v4l2-core/v4l2-subdev.c              |    8 -
 drivers/staging/media/imx/imx-media-csi.c          |    7 +-
 drivers/staging/media/imx/imx6-mipi-csi2.c         |   25 +-
 drivers/staging/media/imx/imx7-mipi-csis.c         |    2 +-
 drivers/staging/media/imx/imx8mq-mipi-csi2.c       |    2 +-
 drivers/staging/media/max96712/max96712.c          |    2 +-
 include/media/v4l2-fwnode.h                        |   61 +-
 include/media/v4l2-mediabus.h                      |  104 +-
 include/media/v4l2-subdev.h                        |   13 -
 44 files changed, 4902 insertions(+), 436 deletions(-)
 create mode 100644 drivers/media/i2c/hi847.c
 create mode 100644 drivers/media/i2c/ov08d10.c

-- 
Kind regards,

Sakari Ailus
