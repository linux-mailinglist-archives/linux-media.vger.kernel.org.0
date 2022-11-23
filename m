Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0672663597C
	for <lists+linux-media@lfdr.de>; Wed, 23 Nov 2022 11:18:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237109AbiKWKRy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Nov 2022 05:17:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237595AbiKWKRQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Nov 2022 05:17:16 -0500
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B748112EBC3
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 02:05:25 -0800 (PST)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 20D7A1B000EF
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 12:05:22 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1669197922;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=ptiZ5MUw/dIrPaHvLFzyKDk9+PzV81psK21lIV9uXDs=;
        b=Lq2o4WoZcMDMqZJyQ6/4ISQbysn6zs9ZOOrmWCpOBYgnvoTg8L9giDZpeRrcedMvUEuYE4
        Dc4wTmAs9kyWDqST5gr+DchN1ITjIr4lX4mrNmBEz56O4XL3v7bSIOvfg+RWiTQ80JWxgY
        UnlfCmgTP8BOzmx3Fd+wL1T6sjXA5ERbeCetiboWIYcndZWnJgmyvnXogW68zD7VcBZBPH
        MR3margxq0dVEIYGVn17HcuBqJOzIWxE4TW5GEz5Gy632ne4CGH1AzqZbDiWGhPszMOFjI
        RKFLR5/EJJ6FCfz4kmkuNYgIVCY8O/DlAAhzgx1UTfrk2sgXqExllPcc2B8Cmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1669197922;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=ptiZ5MUw/dIrPaHvLFzyKDk9+PzV81psK21lIV9uXDs=;
        b=gonSZgShxzdSeGPKWEsW8yBDsZ5GtCzut2Y3qurZdncVG6GmzNWQMYEl3gvnE6Khcell8Z
        Z2o2Lj7Rh6+ctndCYs9Yurn/rAKBU4lAc8U5xMDiNhEg24rA1Kkw+QJJL7MomRC+tKHO9o
        lWR9+jlEG5ns1JJo8pjXqY/LTqbjofXoDEvDQ4NcX3+U8S1QZ3C1BJXOR6XZngq7xYa1SO
        xXUnUPzQR5BhV0OB8StwyPjeGqe+evA/Doidz0oAm8Qih4tGKqIwlUKPLEh+/iUxgo/MLt
        VX8P/JFsGEk8eVc+p+Gq7KUhV8K5Smm4SGprut7c5zHfPBHdhSGrhMYQlZL+LQ==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1669197922; a=rsa-sha256;
        cv=none;
        b=Fwb1rYhS2FnJQNmBUNWM5kFk6mWnw1tKTVgye7w5KyQo2Y0JpI0KfAX0ppupbYAmjokUmN
        xeM4ii79dW2CNoTDu1rIgq18HbQLV74lErnDu/gFDv1/5k+9jrFghCC52Kz6psUz4ipToO
        SUbVGusPHnfzHu4gy+NEsoR7XUpDl7H3wq21KM3/LUIlM2YQcPtBI4xLVPy6ADw048bzeO
        9W7b3tLZUl4UoHQzqEuJN7SUrTRM/5FxSqkxGC0ALYJtAmnXKsW7tyIi29WSa8r9uGiDgf
        y/FtccJU3hcfMzZovxuydT2M0vooZxuO5soijvfbX+BuZY1Z8pBVjAZoZGAt8w==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id B87B4634C92
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 12:05:21 +0200 (EET)
Date:   Wed, 23 Nov 2022 12:05:21 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.2] Even more V4L2 patches
Message-ID: <Y33wYUzQhIOWhTQU@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's the final set for camera sensor related patches for 6.2.

There are improvements and cleanups for the ov2740, st-vgxy61, ov9282,
ar0521, tc358746, ov08x40 and mt9p031 drivers and new drivers for Renesas
CSI-2 receiver and CRU device. Also included are Laurent's bus-type macros
for DT bindings.

Please pull.


The following changes since commit 1e284ea984d3705e042b6b07469a66f1d43371e3:

  Merge git://linuxtv.org/sailus/media_tree into media_stage (2022-11-08 08:46:21 +0000)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.2-3-signed

for you to fetch changes up to d244a87ab5e64ca874aaff961fe8d2f847a34556:

  media: i2c: refer to config VIDEO_DEV to make ov08x40 image sensor driver usable (2022-11-23 10:40:18 +0200)

----------------------------------------------------------------
Yet more V4L2 patches for 6.3

----------------------------------------------------------------
Andy Shevchenko (7):
      media: ov2740: Remove duplicative pointer in struct nvm_data
      media: ov2740: Switch from __maybe_unused to pm_sleep_ptr() etc
      media: ov2740: Remove duplicate check for NULL fwnode
      media: ov2740: Drop redundant assignments of ret = 0
      media: ov2740: Switch to use dev_err_probe()
      media: ov2740: Add missed \n to the end of the messages
      media: ov2740: Use traditional pattern when checking error codes

Benjamin Mugnier (5):
      media: i2c: st-vgxy61: Fix regulator counter underflow
      media: Documentation: st-vgxy61: Limit driver specific documentation to 80 characters
      media: Documentation: st-vgxy61: Remove quotes around 'No HDR' identifier
      media: Documentation: st-vgxy61: Fix driver specific documentation not being included in the index
      media: i2c: st-vgxy61: Fix smatch warnings

Dave Stevenson (2):
      dt-bindings: media: ovti,ov9282: Add optional regulators
      media: i2c: ov9282: Add support for regulators.

Jacopo Mondi (10):
      media: ar0521: Implement enum_frame_sizes
      media: ar0521: Add V4L2_CID_ANALOG_GAIN
      media: ar0521: Set maximum resolution to 2592x1944
      media: ar0521: Rework PLL computation
      media: ar0521: Refuse unsupported controls
      media: ar0521: Add LINK_FREQ control
      media: ar0521: Adjust exposure and blankings limits
      media: ar0521: Setup controls at s_stream time
      media: ar0521: Rework startup sequence
      media: ar0521: Tab-align definitions

Kieran Bingham (1):
      media: i2c: ov08x40: Make remove callback return void

Lad Prabhakar (4):
      media: dt-bindings: Document Renesas RZ/G2L CSI-2 block
      media: dt-bindings: Document Renesas RZ/G2L CRU block
      media: platform: Add Renesas RZ/G2L MIPI CSI-2 receiver driver
      media: platform: Add Renesas RZ/G2L CRU driver

Laurent Pinchart (2):
      dt-bindings: media: Add macros for video interface bus types
      dt-bindings: Use new video interface bus type macros in examples

Lukas Bulwahn (1):
      media: i2c: refer to config VIDEO_DEV to make ov08x40 image sensor driver usable

Marco Felsch (1):
      media: tc358746: drop selecting COMMON_CLK

Marek Vasut (2):
      media: mt9p031: Drop bogus v4l2_subdev_get_try_crop() call from mt9p031_init_cfg()
      media: mt9p031: Increase post-reset delay

 .../devicetree/bindings/media/i2c/mipi-ccs.yaml    |    3 +-
 .../devicetree/bindings/media/i2c/ovti,ov772x.yaml |    3 +-
 .../devicetree/bindings/media/i2c/ovti,ov9282.yaml |    9 +
 .../bindings/media/marvell,mmp2-ccic.yaml          |    3 +-
 .../devicetree/bindings/media/microchip,xisc.yaml  |    3 +-
 .../bindings/media/renesas,rzg2l-cru.yaml          |  157 +++
 .../bindings/media/renesas,rzg2l-csi2.yaml         |  149 +++
 .../devicetree/bindings/media/st,stm32-dcmi.yaml   |    4 +-
 .../userspace-api/media/drivers/index.rst          |    1 +
 .../userspace-api/media/drivers/st-vgxy61.rst      |   12 +-
 drivers/media/i2c/Kconfig                          |    3 +-
 drivers/media/i2c/ar0521.c                         |  352 +++++--
 drivers/media/i2c/mt9p031.c                        |    9 +-
 drivers/media/i2c/ov08x40.c                        |    4 +-
 drivers/media/i2c/ov2740.c                         |  134 ++-
 drivers/media/i2c/ov9282.c                         |   38 +
 drivers/media/i2c/st-vgxy61.c                      |   33 +-
 drivers/media/platform/renesas/Kconfig             |    1 +
 drivers/media/platform/renesas/Makefile            |    1 +
 drivers/media/platform/renesas/rzg2l-cru/Kconfig   |   33 +
 drivers/media/platform/renesas/rzg2l-cru/Makefile  |    6 +
 .../media/platform/renesas/rzg2l-cru/rzg2l-core.c  |  338 +++++++
 .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h   |  152 +++
 .../media/platform/renesas/rzg2l-cru/rzg2l-csi2.c  |  877 ++++++++++++++++
 .../media/platform/renesas/rzg2l-cru/rzg2l-ip.c    |  255 +++++
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 1057 ++++++++++++++++++++
 include/dt-bindings/media/video-interfaces.h       |   16 +
 27 files changed, 3440 insertions(+), 213 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
 create mode 100644 Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
 create mode 100644 drivers/media/platform/renesas/rzg2l-cru/Kconfig
 create mode 100644 drivers/media/platform/renesas/rzg2l-cru/Makefile
 create mode 100644 drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
 create mode 100644 drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
 create mode 100644 drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
 create mode 100644 drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
 create mode 100644 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
 create mode 100644 include/dt-bindings/media/video-interfaces.h

-- 
Kind regards,

Sakari Ailus
