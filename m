Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E21F525269
	for <lists+linux-media@lfdr.de>; Thu, 12 May 2022 18:21:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356416AbiELQV6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 May 2022 12:21:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356462AbiELQVN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 May 2022 12:21:13 -0400
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5120112AEF
        for <linux-media@vger.kernel.org>; Thu, 12 May 2022 09:21:09 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id CE5D620106
        for <linux-media@vger.kernel.org>; Thu, 12 May 2022 19:21:06 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1652372466;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=MEpYLmM1hbzizLyOq/k5NY5phSBa06efwG27yz/wA/o=;
        b=L3qW/IkJV0DTvvWGBCH+X7yrhkcvAxvgKMdySky7Hi6v72dgStf5I/eYPGrFJleclggDz/
        4JxldBw10dAbPIki1c0Lr1LZAWJ0AURkYkqDk2VfgmBVwzEEv9+5Q9eJmk4zjxlUT8oM8L
        QOYNQZfpHkqNezboM5oP/o9xJkYawa4=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 82220634C91
        for <linux-media@vger.kernel.org>; Thu, 12 May 2022 19:21:05 +0300 (EEST)
Date:   Thu, 12 May 2022 19:21:05 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR 5.19] More V4L2 patches
Message-ID: <Yn0z8Tjj53FBd09R@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1652372466;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=MEpYLmM1hbzizLyOq/k5NY5phSBa06efwG27yz/wA/o=;
        b=rVPrsiFHW5NdTzzjVIxg5uDvjESEIejcc/CyQ64nZCCxBqzgMkOaSYOTwSTUDUmNpsD+xW
        Vi/2i+qT1X8hvcg+sFYyya9YAOQ0vjfJlSxNVQV0fIUvqpd2YBBS7lkLg4EQb2f7WCguod
        rtMYSNGnmbFHqMSWwy6qXLxvNdQK6N8=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1652372466; a=rsa-sha256; cv=none;
        b=NJyc55QPAFviV7LhAKiR59TajY23/j3zDCMu5JzTIDqlPqj/gISj4QWv6YrQNl77NU8P7S
        mbqC14UT3oIBNJzy8hA9JKoCl62C2Am4JDpEiMeHPkTBfvUUPlN0d3isE5Go37mpKTZuIE
        LBVuH6v55Vq5vCPwjOgpHTAWlLv9wuE=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a new bunch of V4L2 patches for 5.19. Hopefully this will be in time
for merging still.

There are no new drivers, just fixes and improvements to the existing ones.

Otherwise noteworthy changes are ACPI support for ov7251 IR camera sensor,
CSI-2 frame descriptors and addition of MIPI DPI bus type for DT and
v4l2-fwnode.

Please pull.


The following changes since commit 6c1c1eb8c87de221051b9198d40971640060842f:

  media: ext-ctrls-codec.rst: fix indentation (2022-04-25 23:55:02 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.19-2-signed

for you to fetch changes up to 79afd8fce8ce8d690de6f56304524f4daf8b3aa4:

  media: i2c: Add vblank control to ov7251 driver (2022-05-11 09:49:26 +0300)

----------------------------------------------------------------
V4L2 patches for 5.19

----------------------------------------------------------------
Bingbu Cao (1):
      media: ov8856: apply digital gain by setting global gain control register

Bryan O'Donoghue (4):
      media: i2c: imx412: Fix reset GPIO polarity
      media: i2c: imx412: Fix power_off ordering
      media: dt-bindings: imx412: Add regulator descriptions
      media: i2c: imx412: Add bulk regulator support

Daniel Scally (15):
      media: uapi: Add IPU3 packed Y10 format
      media: ipu3-cio2: Add support for V4L2_PIX_FMT_IPU3_Y10
      media: i2c: Add acpi support to ov7251
      media: i2c: Provide ov7251_check_hwcfg()
      media: i2c: Remove per-mode frequencies from ov7251
      media: i2c: Add ov7251_pll_configure()
      media: i2c: Add support for new frequencies to ov7251
      media: i2c: Add ov7251_detect_chip()
      media: i2c: Add pm_runtime support to ov7251
      media: i2c: Remove .s_power() from ov7251
      media: ipu3-cio2: Add INT347E to cio2-bridge
      media: i2c: Extend .get_selection() for ov7251
      media: i2c: add ov7251_init_ctrls()
      media: i2c: Add hblank control to ov7251
      media: i2c: Add vblank control to ov7251 driver

Dongliang Mu (1):
      media: ov7670: remove ov7670_power_off from ov7670_remove

Fabio Estevam (1):
      media: i2c: adv7180: Add support for the test patterns

Kwanghoon Son (1):
      media: exynos4-is: Fix compile warning

Mike Pagano (1):
      media: i2c: ov2640: Depend on V4L2_ASYNC

Moses Christopher Bollavarapu (4):
      media: i2c: video-i2c: Move defines to the top of the file
      media: i2c: video-i2c: Replace constants with proper names
      media: i2c: video-i2c: Use GENMASK for masking bits
      media: i2c: ov5645: Remove unneeded of_match_ptr macro

Sakari Ailus (6):
      dt-bindings: Convert Dongwoon dw9807-vcm bindings to json-schema
      dw9807-vcm: Add "dongwoon,dw9807" compatible string
      media: Add bus type to frame descriptors
      media: Add CSI-2 bus configuration to frame descriptors
      media: Add MIPI CSI-2 28 bits per pixel raw data type
      media: Documentation: mc: Add media_device_{init,cleanup}

Tomi Valkeinen (1):
      media: ti: cal: use frame desc to get vc and dt

Xin Ji (2):
      media/v4l2-core: Add enum V4L2_FWNODE_BUS_TYPE_DPI
      dt-bindings: media: video-interfaces: Add new bus-type

Yang Yingliang (1):
      media: i2c: ov5648: fix wrong pointer passed to IS_ERR() and PTR_ERR()

 .../bindings/media/i2c/dongwoon,dw9807-vcm.txt     |   9 -
 .../bindings/media/i2c/dongwoon,dw9807-vcm.yaml    |  41 ++
 .../devicetree/bindings/media/i2c/sony,imx412.yaml |   9 +
 .../bindings/media/video-interfaces.yaml           |   1 +
 Documentation/driver-api/media/mc-core.rst         |  13 +-
 .../userspace-api/media/v4l/pixfmt-yuv-luma.rst    |  14 +-
 drivers/media/i2c/Kconfig                          |   1 +
 drivers/media/i2c/adv7180.c                        |  46 ++
 drivers/media/i2c/dw9807-vcm.c                     |   2 +
 drivers/media/i2c/imx412.c                         |  39 +-
 drivers/media/i2c/ov5645.c                         |   2 +-
 drivers/media/i2c/ov5648.c                         |   4 +-
 drivers/media/i2c/ov7251.c                         | 749 +++++++++++++++------
 drivers/media/i2c/ov7670.c                         |   1 -
 drivers/media/i2c/ov8856.c                         |  23 +-
 drivers/media/i2c/video-i2c.c                      |  61 +-
 drivers/media/pci/intel/ipu3/cio2-bridge.c         |   2 +
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c      |   5 +
 .../platform/samsung/exynos4-is/fimc-isp-video.h   |   2 +-
 drivers/media/platform/ti/cal/cal-camerarx.c       |  27 +
 drivers/media/platform/ti/cal/cal.c                |  49 +-
 drivers/media/platform/ti/cal/cal.h                |   2 +
 drivers/media/v4l2-core/v4l2-fwnode.c              |   4 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |   1 +
 include/media/mipi-csi2.h                          |   1 +
 include/media/v4l2-fwnode.h                        |   2 +
 include/media/v4l2-mediabus.h                      |   2 +
 include/media/v4l2-subdev.h                        |  36 +
 include/uapi/linux/videodev2.h                     |   3 +-
 29 files changed, 863 insertions(+), 288 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9807-vcm.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9807-vcm.yaml

-- 
Kind regards,

Sakari Ailus
