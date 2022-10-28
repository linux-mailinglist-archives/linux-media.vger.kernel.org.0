Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E78FA610C61
	for <lists+linux-media@lfdr.de>; Fri, 28 Oct 2022 10:41:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbiJ1IlS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Oct 2022 04:41:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229962AbiJ1IlQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Oct 2022 04:41:16 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A08617E232
        for <linux-media@vger.kernel.org>; Fri, 28 Oct 2022 01:41:14 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkxjnptf9d2bpn7gcmbty-3.rev.dnainternet.fi [IPv6:2001:14ba:44ce:b640:9d1d:82c5:eca2:5060])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id B1C1E1B001A3
        for <linux-media@vger.kernel.org>; Fri, 28 Oct 2022 11:41:11 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1666946471;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=e94nsUh8Z825SqgpiH/9qHz5n3cEa2HTDkrZn7cJ+bA=;
        b=sDpNN54vk314Cc3QuGkJQr7pS5qRvhieUOTNlqjathfAlB9gjOXmtAKkpfbh/ty6xedjAR
        GID/gd8CwluXzGYgoLk+gjTy6vAQzNY4yEJjMmzr8aPvrl5OpfYka84m3lhfH/NWtPwix3
        jOqAl0Ock5i/Oguz1vofhe0TFjdwrATVioLR+08FBHK3MlzbdtXTNsR7K7Hhe5EE/VsnyD
        NR7Zi6QFXMbTjtDS9W8rvRNs5O6it4SM+znbE8oT8EbsNvEGUQrjH2Jc4OnwK6N23Yzwhr
        fCzsAQx7BuYe7AOM7/9urjLsXhHaPnSbqsOe5CdRSa3wYGWq3/BhSOSoj9PNKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1666946471;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=e94nsUh8Z825SqgpiH/9qHz5n3cEa2HTDkrZn7cJ+bA=;
        b=IOdwo0LgHXN0k+Z6vCBNYdSUucaGExX5osxE2yZ793G9jecpP5il6s7KaGA+BL/pZrZuRw
        PboLoAed0fBcM/nWninRnjoa3XPRXHR0PnPK4zJMENJO/Ifkkb4ksYixnAyCw26d2fM/fc
        wy/NG4IdveS9XCwTHy1ptmPpybU732Y0v6na/YUpl5z9lU1NzzlmCyb4tIBTiNVcHo52oE
        AIK9fTIuWpC85UDSwZda7XQKBDabIikq22TgpdF3LcBR088nyZzt8gBQhPlVv70TZ6w4bV
        7I3tREPoSW2qBWEQn0NLYQcq0813XCOMGMzyG53IBIMSKAm/Pe5cw5Hmcs4ihw==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1666946471; a=rsa-sha256;
        cv=none;
        b=T5G6rDZG1Ux+il7mSoUeX6mtMp0GzbHn1lmhx/QgJJjtZIpVFx0TxrCQvJWVRNc/rzXhfS
        ox4Z/c8MY2XRisiLFD7mgJp7+R7keimg/NF0WNXJV3IwGxS8C3dP7dQezt4vVpNW3M2o0/
        wfdmdRnVNGZp7/4hdNfvrZEvTq9CjtiFev7iPAgnPz1NfX8WLmPjfXlhA1h8mfVspwuteD
        hv1dP1fAmINe5AXh8ckJgxvJ9a7KMH1POzn5Ic6FdD5emf5u+bp7MIjgCYWObqQXDmNNqn
        lGnyJo2TRO2zqxqT1Fff34b0MoPFFrVOwayY3y4WShT570dDazNAEmuZDiZ3fw==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 556DD634DAD
        for <linux-media@vger.kernel.org>; Fri, 28 Oct 2022 11:41:11 +0300 (EEST)
Date:   Fri, 28 Oct 2022 11:41:11 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.2] Camera sensor patches for 6.2
Message-ID: <Y1uVp8hHo7DYUK82@valkosipuli.retiisi.eu>
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

Here's a large pile of camera sensor patches for 6.2. In particular, there
are new drivers for OV4689, OV08x40 and ST VGXY61 sensors as well as
the TCM358746 parallel to CSI-2 bridge. There's also a lot of cleanups for
the IMX290 driver and runtime PM support for OV8856 driver. On top of that
there's a number of fixes and cleanups elsewhere, including a s_stream
wrapper for printing an error message if stremoff fails --- the caller is
returned zero as there's nothing the caller can do to fix the problem.

Please pull.


The following changes since commit 247f34f7b80357943234f93f247a1ae6b6c3a740:

  Linux 6.1-rc2 (2022-10-23 15:27:33 -0700)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.2-1-signed

for you to fetch changes up to 7336c54a562b479866d2de2abc61487a4e07b0b9:

  media: i2c: ov4689: code cleanup (2022-10-28 11:31:28 +0300)

----------------------------------------------------------------
V4L2 patches for 6.2

----------------------------------------------------------------
Benjamin Mugnier (5):
      media: v4l: Add 1X16 16-bit greyscale media bus code definition
      media: v4l: ctrls: Add a control for HDR mode
      media: dt-bindings: Add ST VGXY61 camera sensor binding
      media: Documentation: Add ST VGXY61 driver documentation
      media: i2c: Add driver for ST VGXY61 camera sensor

Hidenori Kobayashi (1):
      media: ov8856: Add runtime PM callbacks

Lad Prabhakar (1):
      media: i2c: ov5645: Drop fetching the clk reference by name

Laurent Pinchart (21):
      media: Fix documentation typos in media-entity.h
      media: dt-bindings: Convert imx290.txt to YAML
      media: i2c: imx290: Use device lock for the control handler
      media: i2c: imx290: Print error code when I2C transfer fails
      media: i2c: imx290: Replace macro with explicit ARRAY_SIZE()
      media: i2c: imx290: Drop imx290_write_buffered_reg()
      media: i2c: imx290: Drop regmap cache
      media: i2c: imx290: Specify HMAX values in decimal
      media: i2c: imx290: Support variable-sized registers
      media: i2c: imx290: Correct register sizes
      media: i2c: imx290: Simplify error handling when writing registers
      media: i2c: imx290: Define more register macros
      media: i2c: imx290: Add exposure time control
      media: i2c: imx290: Fix max gain value
      media: i2c: imx290: Split control initialization to separate function
      media: i2c: imx290: Implement HBLANK and VBLANK controls
      media: i2c: imx290: Create controls for fwnode properties
      media: i2c: imx290: Move registers with fixed value to init array
      media: i2c: imx290: Factor out format retrieval to separate function
      media: i2c: imx290: Add crop selection targets support
      media: i2c: imx290: Replace GAIN control with ANALOGUE_GAIN

Linus Walleij (3):
      media: ov2640: Drop legacy includes
      media: ov7670: Drop unused include
      media: ov9650: Drop platform data code path

Marco Felsch (4):
      phy: dphy: refactor get_default_config
      phy: dphy: add support to calculate the timing based on hs_clk_rate
      media: dt-bindings: add bindings for Toshiba TC358746
      media: tc358746: add Toshiba TC358746 Parallel to CSI-2 bridge driver

Marek Szyprowski (1):
      media: exynos4-is: don't rely on the v4l2_async_subdev internals

Maximilian Luz (1):
      ipu3-imgu: Fix NULL pointer dereference in imgu_subdev_set_selection()

Mikhail Rudenko (3):
      media: dt-bindings: i2c: document OV4689
      media: i2c: add support for OV4689
      media: i2c: ov4689: code cleanup

Rafael Mendonca (2):
      media: i2c: hi846: Fix memory leak in hi846_parse_dt()
      media: i2c: ov5648: Free V4L2 fwnode data on unbind

Ricardo Ribalda (1):
      media: i2c: ad5820: Fix error path

Sakari Ailus (3):
      media: v4l: subdev: Document s_power() callback is deprecated
      dw9768: Enable low-power probe on ACPI
      v4l: subdev: Warn if disabling streaming failed, return success

Shawn Tu (1):
      media: i2c: Add ov08x40 image sensor driver

 .../devicetree/bindings/media/i2c/imx290.txt       |   57 -
 .../devicetree/bindings/media/i2c/ovti,ov4689.yaml |  134 +
 .../devicetree/bindings/media/i2c/sony,imx290.yaml |  129 +
 .../bindings/media/i2c/st,st-vgxy61.yaml           |  113 +
 .../bindings/media/i2c/toshiba,tc358746.yaml       |  178 ++
 .../userspace-api/media/drivers/st-vgxy61.rst      |   23 +
 .../userspace-api/media/v4l/ext-ctrls-camera.rst   |    8 +
 .../userspace-api/media/v4l/subdev-formats.rst     |   37 +
 MAINTAINERS                                        |   27 +-
 drivers/media/i2c/Kconfig                          |   53 +
 drivers/media/i2c/Makefile                         |    4 +
 drivers/media/i2c/ad5820.c                         |   10 +-
 drivers/media/i2c/dw9768.c                         |   33 +-
 drivers/media/i2c/hi846.c                          |   14 +-
 drivers/media/i2c/imx290.c                         |  786 +++--
 drivers/media/i2c/ov08x40.c                        | 3327 ++++++++++++++++++++
 drivers/media/i2c/ov2640.c                         |    2 -
 drivers/media/i2c/ov4689.c                         | 1018 ++++++
 drivers/media/i2c/ov5645.c                         |    2 +-
 drivers/media/i2c/ov5648.c                         |    1 +
 drivers/media/i2c/ov7670.c                         |    1 -
 drivers/media/i2c/ov8856.c                         |   33 +-
 drivers/media/i2c/ov9650.c                         |   49 +-
 drivers/media/i2c/st-vgxy61.c                      | 1962 ++++++++++++
 drivers/media/i2c/tc358746.c                       | 1694 ++++++++++
 .../media/platform/samsung/exynos4-is/media-dev.c  |    4 +-
 drivers/media/v4l2-core/v4l2-ctrls-defs.c          |    2 +
 drivers/media/v4l2-core/v4l2-subdev.c              |   15 +
 drivers/phy/phy-core-mipi-dphy.c                   |   31 +-
 drivers/staging/media/ipu3/ipu3-v4l2.c             |   57 +-
 include/linux/phy/phy-mipi-dphy.h                  |    3 +
 include/media/i2c/ov9650.h                         |   24 -
 include/media/media-entity.h                       |    4 +-
 include/media/v4l2-subdev.h                        |   11 +-
 include/uapi/linux/media-bus-format.h              |    3 +-
 include/uapi/linux/v4l2-controls.h                 |    2 +
 36 files changed, 9327 insertions(+), 524 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/imx290.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov4689.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.yaml
 create mode 100644 Documentation/userspace-api/media/drivers/st-vgxy61.rst
 create mode 100644 drivers/media/i2c/ov08x40.c
 create mode 100644 drivers/media/i2c/ov4689.c
 create mode 100644 drivers/media/i2c/st-vgxy61.c
 create mode 100644 drivers/media/i2c/tc358746.c
 delete mode 100644 include/media/i2c/ov9650.h

-- 
Kind regards,

Sakari Ailus
