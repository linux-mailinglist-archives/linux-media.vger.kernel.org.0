Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A6E17B68FC
	for <lists+linux-media@lfdr.de>; Tue,  3 Oct 2023 14:29:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232131AbjJCM3u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Oct 2023 08:29:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240033AbjJCM3u (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Oct 2023 08:29:50 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08ABEBF
        for <linux-media@vger.kernel.org>; Tue,  3 Oct 2023 05:29:45 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (185-9-11-240.cust.suomicom.net [185.9.11.240])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4S0HFg3LZWz49Q6R
        for <linux-media@vger.kernel.org>; Tue,  3 Oct 2023 15:29:43 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1696336183;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=u8oFEkb02CRpjv0oQTAcRfQOsv+Db+LReedkdS6VGOM=;
        b=amlf7wcHBsAtzoGk64xjYTZ1ULJcu4kZXt8dns2gbCyB4u5ssW84OVcUMX/LbVIen0UCbZ
        XUr9TuB4yd12m1xgqHmJaXEh0SCyipYvW9RqceHqvTVseFUA4GVDvx1mCGl0eYjgDl2VgY
        m697w28N4Mrza+gKUY/4OQp/sDrbSqF4XCdEk5pQRxy2dCwGVN/Dd74mWNwiNYZxNuhcLF
        h4bVI0S2uX9WVoSoOAQHOYukmHtyg8B/R7Ou8Md+RjRN7CCPESJ4H7akWf0XSD0lsML5BN
        877DL+0brTtjK10IDk65k+lJfd4RFVJcscofR6UIgMAdFLF7ta3Ase3J58t/HA==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1696336183; a=rsa-sha256;
        cv=none;
        b=osXcKPyv5RE0JUTHfi+CqWz6F643fggRB12Mj18x+fwojHJ/FspkuDuTI3xfYBnM9Vv3yy
        j2J6kng9NRcOU7Do842/OasDcQiIO1CQQlAdakGpmZtI/qE0LY9TI895EaYX1RsLxVc1wQ
        SvLWO0EFn+5b9PZ8xNYXO50/2ZHWYVenmV7XI2dVatOVAxyHorj3JIEdEVG9jye5iHPvzL
        3YbQJFfxPGRWkR0+D2X/BATOg2ZDj9xWHIyrycr+v+npzUw1jEoCvhGH8cjpeL8Hm232cc
        3hGnRXgyMFUxl6lk0nG1yqRxZF+c3A28EL3mX4Wuz/vuqLuInUqvmZD48HYzTQ==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1696336183;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=u8oFEkb02CRpjv0oQTAcRfQOsv+Db+LReedkdS6VGOM=;
        b=hlmfiPek+nTY1Xd6QpPfeX3bT7fEtSeK+vAPHQKpgGKhXh+9EPQiE4qeQCsEWfh6P4ySEv
        ADk5ktmwhKQi2CJ6OM6eHYF0jMYrvqBu3LzLZrLieo8OhiSdZmYZSSoZtb3FVJPxNULInQ
        40q3SPuspdjVy+DImE1Xsgyu/bDLeWR4meGWStNGjmM7iSNVrUazjZU4fCvBZ5Qt/O+3dx
        qzZsI6PMbnGxCfxw2dFvtTgbJ++wmcbv5koi26J+Bqx8ljwmp3hdez20eClvhkKcpowfZv
        NQ0GUG0Lc5EWE2h/6L/96r7TOTp1LBHzOz1JXoDrfFON2yFNOqiBoe3yE16Scw==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id DC431634C93
        for <linux-media@vger.kernel.org>; Tue,  3 Oct 2023 15:29:42 +0300 (EEST)
Date:   Tue, 3 Oct 2023 12:29:42 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.7] Camera sensor patches, preparation for enabling
 streams API
Message-ID: <ZRwJNg5Ez6iSBINf@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro, Hans,

This set contains cleanups and improvements for the imx219 driver from
Laurent, additional mode for the hi556 driver from Bingbu, maintainer
changes for some Intel-written sensor drivers as well as preparation for
generic line based metadata support, including moving
CCS and ov2740 drivers to use sub-device state.

Please pull.


The following changes since commit 1aa687a41c6b1ca28b45f230eb7ad2d3d6d35bc6:

  media: qcom: camss: Comment CSID dt_id field (2023-09-28 09:41:54 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.7-2-signed

for you to fetch changes up to 64079722be862e4e31b15f75503dee0315aca84e:

  media: Documentation: Split camera sensor documentation (2023-10-03 14:43:04 +0300)

----------------------------------------------------------------
V4L2 patches for 6.7

----------------------------------------------------------------
Bingbu Cao (1):
      media: i2c/hi556: add a new mode 1296x722 settings

Laurent Pinchart (22):
      media: dt-bindings: media: i2c: Add MT9M114 camera sensor binding
      media: i2c: Add driver for onsemi MT9M114 camera sensor
      media: i2c: imx219: Convert to CCI register access helpers
      media: i2c: imx219: Drop unused macros
      media: i2c: imx219: Replace register addresses with macros
      media: i2c: imx219: Drop IMX219_REG_CSI_LANE_MODE from common regs array
      media: i2c: imx219: Fix test pattern window for 640x480 mode
      media: i2c: imx219: Set mode registers programmatically
      media: i2c: imx219: Merge format and binning setting functions
      media: i2c: imx219: Initialize ycbcr_enc
      media: i2c: imx219: Use active crop rectangle to configure registers
      media: i2c: imx219: Infer binning settings from format and crop
      media: i2c: imx219: Access height from active format in imx219_set_ctrl
      media: i2c: imx219: Don't store the current mode in the imx219 structure
      media: i2c: imx219: Drop IMX219_VTS_* macros
      media: i2c: imx219: Group functions by purpose
      media: i2c: imx219: Remove unneeded goto
      media: i2c: imx219: Implement .init_cfg() using .set_fmt()
      media: i2c: imx219: Separate horizontal and vertical binning
      media: i2c: imx219: Calculate crop rectangle dynamically
      media: i2c: imx219: Name all subdev state variables 'state'
      media: i2c: imx219: Move variables to inner scope

Sakari Ailus (23):
      media: ov9282: Assign maintenance to Dave
      media: imx412: Orphan the driver
      media: imx335: Orphan the driver
      media: imx334: Orphan the driver
      media: Documentation: Align numbered list, make it a proper ReST
      media: ccs: Fix driver quirk struct documentation
      media: ccs: Correctly initialise try compose rectangle
      media: ccs: Correct error handling in ccs_register_subdev
      media: ccs: Switch to init_cfg
      media: ccs: Rename ccs_create_subdev as ccs_init_subdev
      media: ccs: Move media_entity_pads_init to init from register
      media: ccs: Obtain media bus formats before initialising up sub-devices
      media: ccs: Use sub-device active state
      media: ccs: Partially revert "media: i2c: Use pm_runtime_resume_and_get()"
      media: ccs: Drop re-entrant s_stream support
      media: ov2740: Enable runtime PM before registering the async subdev
      media: ov2740: Use sub-device active state
      media: ov2740: Return -EPROBE_DEFER if no endpoint is found
      media: v4l: subdev: Clear frame descriptor before get_frame_desc
      media: v4l: subdev: Print debug information on frame descriptor
      media: mc: Check pad flag validity
      media: Add MIPI CSI-2 generic long packet type definition
      media: Documentation: Split camera sensor documentation

 .../bindings/media/i2c/onnn,mt9m114.yaml           |  114 +
 Documentation/driver-api/media/camera-sensor.rst   |  131 +-
 .../userspace-api/media/drivers/camera-sensor.rst  |  104 +
 .../userspace-api/media/drivers/index.rst          |    1 +
 Documentation/userspace-api/media/v4l/control.rst  |    4 +
 .../userspace-api/media/v4l/dev-subdev.rst         |   49 +-
 MAINTAINERS                                        |   23 +-
 drivers/media/i2c/Kconfig                          |   11 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/ccs/ccs-core.c                   |  374 ++-
 drivers/media/i2c/ccs/ccs-quirk.h                  |    4 +-
 drivers/media/i2c/ccs/ccs.h                        |    4 +-
 drivers/media/i2c/ds90ub913.c                      |    2 -
 drivers/media/i2c/ds90ub953.c                      |    2 -
 drivers/media/i2c/ds90ub960.c                      |    2 -
 drivers/media/i2c/hi556.c                          |   64 +-
 drivers/media/i2c/imx219.c                         | 1247 +++++-----
 drivers/media/i2c/mt9m114.c                        | 2481 ++++++++++++++++++++
 drivers/media/i2c/ov2740.c                         |  125 +-
 drivers/media/mc/mc-entity.c                       |   15 +-
 drivers/media/platform/nxp/imx-mipi-csis.c         |    2 -
 drivers/media/v4l2-core/v4l2-subdev.c              |   38 +
 include/media/mipi-csi2.h                          |    1 +
 23 files changed, 3636 insertions(+), 1163 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
 create mode 100644 Documentation/userspace-api/media/drivers/camera-sensor.rst
 create mode 100644 drivers/media/i2c/mt9m114.c

-- 
Sakari Ailus
