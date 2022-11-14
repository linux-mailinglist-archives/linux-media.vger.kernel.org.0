Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C59A86278F7
	for <lists+linux-media@lfdr.de>; Mon, 14 Nov 2022 10:26:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236189AbiKNJ0c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Nov 2022 04:26:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234295AbiKNJ0a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Nov 2022 04:26:30 -0500
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E4B1231
        for <linux-media@vger.kernel.org>; Mon, 14 Nov 2022 01:26:29 -0800 (PST)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id E02E020238
        for <linux-media@vger.kernel.org>; Mon, 14 Nov 2022 11:26:26 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1668417987;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=L87Oja/srZrQMcqSrpqNQx26v/9oc4gqZgB+CuQIl74=;
        b=jEabWunEfmIAR3ZnWULME8BmgSqULfZU+s5XTGGLJfBJt65p/cUuD7tBHvKJ72A6imBPCE
        7QJO9cfWYK0yz7dkL7ThxbaRFSSouVioCX+7i4iYRWKb1hBaMvC97HTqlfMkkP4/RMDtui
        UKvReJ87SwOY61+OnCDXezlu7kTYc4o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1668417987;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=L87Oja/srZrQMcqSrpqNQx26v/9oc4gqZgB+CuQIl74=;
        b=YnAQ38e9iiA92MWpr73Xkys81BvFPTGwqEN3XMthoqQZ3CWsg9g+5j7wbjXEGBt7Bb1Ioq
        M/adalo36DKtprjyTUaWwlmISTlI8qBLv0wDPlnG1fc9IumEG5sdk8WlW+ZtIH2IDn3N+o
        Qz9gYsO4XKu/vgRbNpX1EbIdJVURqWQ=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1668417987; a=rsa-sha256; cv=none;
        b=e7sG+OZsYgxEaQgdaUkjF2iDIvAfGfu9Iojm2oIXo9BZX7MMbFOH5uP7H+aBtS4xRVxRBU
        N5FJhCTLlzSczOSmKZ0zrgg6nncq8rSjiNAzZfNwK3Z+eaEnUpy8JGfAESkPPFhkLqv8uG
        gWcGnjKRNvdQeOm9u97K+KbhEGfpqwY=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 7DBB7634C99
        for <linux-media@vger.kernel.org>; Mon, 14 Nov 2022 11:26:26 +0200 (EET)
Date:   Mon, 14 Nov 2022 11:26:26 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.2] More camera sensor patches
Message-ID: <Y3IJwomIow2+vdMh@valkosipuli.retiisi.eu>
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

Here's another pile of camera sensor patches for 6.2.

Besides the usual fixes and cleanups, there are lots of improvements for
the ov9282, ov5645 and sun6i-csi drivers, sun6i ISP (staging) driver as
well as new compatible string for imx412 driver for imx577.

Please pull.


The following changes since commit f0c4d9fc9cc9462659728d168387191387e903cc:

  Linux 6.1-rc4 (2022-11-06 15:07:11 -0800)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.2-2-signed

for you to fetch changes up to f732359a339f517a47df4fb9e48df35c28440a0e:

  media: sun6i-csi: Add support for hooking to the isp devices (2022-11-11 12:21:36 +0200)

----------------------------------------------------------------
Andy Shevchenko (2):
      media: subdev: Replace custom implementation of device_match_fwnode()
      staging: media: tegra-video: Replace custom implementation of device_match_fwnode()

Bryan O'Donoghue (3):
      media: dt-bindings: imx412: Extend compatible strings
      media: i2c: imx412: Assign v4l2 device subname based on compat string
      media: i2c: imx412: Add new compatible strings

Dave Stevenson (16):
      media: i2c: ov9282: Remove duplication of registers
      media: i2c: ov9282: Split registers into common and mode specific
      media: i2c: ov9282: Remove format code from the mode
      media: i2c: ov9282: Remove pixel rate from mode definition
      media: i2c: ov9282: Support more than 1 mode.
      media: i2c: ov9282: Correct HTS register for configured pixel rate
      media: i2c: ov9282: Reduce vblank_min values based on testing
      media: i2c: ov9282: Add selection for CSI2 clock mode
      media: i2c: ov9282: Add the properties from fwnode
      media: i2c: ov9282: Action CID_VBLANK when set.
      media: i2c: ov9282: Add HFLIP and VFLIP support
      media: i2c: ov9282: Make V4L2_CID_HBLANK r/w
      media: i2c: ov9282: Add selection API calls for cropping info
      media: i2c: ov9282: Add support for 1280x800 and 640x400 modes
      media: i2c: ov9282: Add support for 8bit readout
      media: i2c: ov9282: Support event handlers

Lad Prabhakar (8):
      ARM: dts: imx6qdl-pico: Drop clock-names property
      ARM: dts: imx6qdl-wandboard: Drop clock-names property
      arm64: dts: renesas: aistarvision-mipi-adapter-2.1: Drop clock-names property
      media: dt-bindings: ov5645: Convert OV5645 binding to a schema
      media: i2c: ov5645: Use runtime PM
      media: i2c: ov5645: Drop empty comment
      media: i2c: ov5645: Make sure to call PM functions
      media: i2c: ov5645: Call ov5645_entity_init_cfg() before registering the subdev

Paul Kocialkowski (33):
      media: sun6i-csi: Add bridge v4l2 subdev with port management
      media: sun6i-csi: Rename sun6i_video to sun6i_csi_capture
      media: sun6i-csi: Add capture state using vsync for page flip
      media: sun6i-csi: Rework register definitions, invert misleading fields
      media: sun6i-csi: Add dimensions and format helpers to capture
      media: sun6i-csi: Implement address configuration without indirection
      media: sun6i-csi: Split stream sequences and irq code in capture
      media: sun6i-csi: Move power management to runtime pm in capture
      media: sun6i-csi: Move register configuration to capture
      media: sun6i-csi: Rework capture format management with helper
      media: sun6i-csi: Remove custom format helper and rework configure
      media: sun6i-csi: Add bridge dimensions and format helpers
      media: sun6i-csi: Get mbus code from bridge instead of storing it
      media: sun6i-csi: Tidy capture configure code
      media: sun6i-csi: Introduce bridge format structure, list and helper
      media: sun6i-csi: Introduce capture format structure, list and helper
      media: sun6i-csi: Configure registers from format tables
      media: sun6i-csi: Implement capture link validation with logic
      media: sun6i-csi: Get bridge subdev directly in capture stream ops
      media: sun6i-csi: Move hardware control to the bridge
      media: sun6i-csi: Rename the capture video device to sun6i-csi-capture
      media: sun6i-csi: Cleanup headers and includes, update copyright lines
      media: sun6i-csi: Add support for MIPI CSI-2 to the bridge code
      media: sun6i-csi: Only configure capture when streaming
      media: sun6i-csi: Add extra checks to the interrupt routine
      media: sun6i-csi: Request a shared interrupt
      MAINTAINERS: Add myself as sun6i-csi maintainer and rename/move entry
      dt-bindings: media: Add Allwinner A31 ISP bindings documentation
      dt-bindings: media: sun6i-a31-csi: Add internal output port to the ISP
      staging: media: Add support for the Allwinner A31 ISP
      MAINTAINERS: Add entry for the Allwinner A31 ISP driver
      media: sun6i-csi: Detect the availability of the ISP
      media: sun6i-csi: Add support for hooking to the isp devices

 .../bindings/media/allwinner,sun6i-a31-csi.yaml    |    4 +
 .../bindings/media/allwinner,sun6i-a31-isp.yaml    |  101 ++
 .../devicetree/bindings/media/i2c/ov5645.txt       |   54 -
 .../devicetree/bindings/media/i2c/ovti,ov5645.yaml |  104 ++
 .../devicetree/bindings/media/i2c/sony,imx412.yaml |    4 +-
 MAINTAINERS                                        |   26 +-
 arch/arm/boot/dts/imx6qdl-pico.dtsi                |    1 -
 arch/arm/boot/dts/imx6qdl-wandboard.dtsi           |    1 -
 .../dts/renesas/aistarvision-mipi-adapter-2.1.dtsi |    1 -
 drivers/media/i2c/imx412.c                         |    9 +-
 drivers/media/i2c/ov5645.c                         |  146 +--
 drivers/media/i2c/ov9282.c                         |  562 ++++++++--
 drivers/media/platform/sunxi/sun6i-csi/Makefile    |    2 +-
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c |  778 ++------------
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h |  145 +--
 .../platform/sunxi/sun6i-csi/sun6i_csi_bridge.c    |  868 +++++++++++++++
 .../platform/sunxi/sun6i-csi/sun6i_csi_bridge.h    |   69 ++
 .../platform/sunxi/sun6i-csi/sun6i_csi_capture.c   | 1102 ++++++++++++++++++++
 .../platform/sunxi/sun6i-csi/sun6i_csi_capture.h   |   89 ++
 .../media/platform/sunxi/sun6i-csi/sun6i_csi_reg.h |  362 ++++---
 .../media/platform/sunxi/sun6i-csi/sun6i_video.c   |  733 -------------
 .../media/platform/sunxi/sun6i-csi/sun6i_video.h   |   35 -
 drivers/media/v4l2-core/v4l2-subdev.c              |    2 +-
 drivers/staging/media/sunxi/Kconfig                |    1 +
 drivers/staging/media/sunxi/Makefile               |    1 +
 drivers/staging/media/sunxi/sun6i-isp/Kconfig      |   15 +
 drivers/staging/media/sunxi/sun6i-isp/Makefile     |    4 +
 drivers/staging/media/sunxi/sun6i-isp/TODO.txt     |    6 +
 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c  |  555 ++++++++++
 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.h  |   90 ++
 .../media/sunxi/sun6i-isp/sun6i_isp_capture.c      |  742 +++++++++++++
 .../media/sunxi/sun6i-isp/sun6i_isp_capture.h      |   78 ++
 .../media/sunxi/sun6i-isp/sun6i_isp_params.c       |  566 ++++++++++
 .../media/sunxi/sun6i-isp/sun6i_isp_params.h       |   52 +
 .../staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c |  577 ++++++++++
 .../staging/media/sunxi/sun6i-isp/sun6i_isp_proc.h |   66 ++
 .../staging/media/sunxi/sun6i-isp/sun6i_isp_reg.h  |  275 +++++
 .../media/sunxi/sun6i-isp/uapi/sun6i-isp-config.h  |   43 +
 drivers/staging/media/tegra-video/vi.c             |    2 +-
 39 files changed, 6259 insertions(+), 2012 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun6i-a31-isp.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov5645.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov5645.yaml
 create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
 create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h
 create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
 create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h
 delete mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
 delete mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun6i_video.h
 create mode 100644 drivers/staging/media/sunxi/sun6i-isp/Kconfig
 create mode 100644 drivers/staging/media/sunxi/sun6i-isp/Makefile
 create mode 100644 drivers/staging/media/sunxi/sun6i-isp/TODO.txt
 create mode 100644 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
 create mode 100644 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.h
 create mode 100644 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
 create mode 100644 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.h
 create mode 100644 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
 create mode 100644 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.h
 create mode 100644 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c
 create mode 100644 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.h
 create mode 100644 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_reg.h
 create mode 100644 drivers/staging/media/sunxi/sun6i-isp/uapi/sun6i-isp-config.h

-- 
Kind regards,

Sakari Ailus
