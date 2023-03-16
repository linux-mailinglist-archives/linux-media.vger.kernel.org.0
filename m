Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEC8C6BD122
	for <lists+linux-media@lfdr.de>; Thu, 16 Mar 2023 14:43:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbjCPNnk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Mar 2023 09:43:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbjCPNnj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Mar 2023 09:43:39 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87FF7113F9
        for <linux-media@vger.kernel.org>; Thu, 16 Mar 2023 06:43:36 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4PcpPd5Fmcz49Q6j
        for <linux-media@vger.kernel.org>; Thu, 16 Mar 2023 15:43:33 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1678974213;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=6g1WHSf/0Q1moWtdZi5EiFirdEBokAI7BTJwhTUhBUY=;
        b=rbowrygjC34LB3A/F/y0JmIl3rLWK2lww1p57OWlQ2lLYZ2k370XRUDNrjw4QDcsIeWnD3
        5Y7onqTpAd2l3Fbq9d/ZhUMccB9KocuzIrkdOND5LkVBBJLxLuf96r9oNs+IiHkjdgOwna
        43b48rJs5l0elnNGsakrINI6PaTmBrcXJk+4A47dbp+QI0lpQCGa8JKxrf8vT0ejDnuBgu
        VsJtw/Nuw88WwbsRkACh91e14BaOBrp0RkZsBJUvnkOGLJwjjm/pyxo2ipxf5I7UsnDAAn
        CVCVWw+hF0u+iRffpBoNUEgQ9+2760l24d9l6upW6AnoZFuRGYnRmV7n3yKSoQ==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1678974213; a=rsa-sha256;
        cv=none;
        b=i5olDL/JGVYnYnd4dZyWmqU+orkSwK2P9JaaH01RPUMlbn1fwnkKr0nEYnaLJy4MAfGxZO
        ZZ7V14wng4Ze8Jzfr36vuSRkDf8Qwt6k5BBjbaBEn2jaOWv3tHMu+0a/rR/Ovs1bS6j/DB
        0kZv/Kb1kP/mr4r2rsk03FWi1T8COSOahSutjvy/WxSkBJpu0evIFS/rZ4KZyjE35hzjS1
        KCDCa76cv2fFJw4IYadyJf/6k8i6hrsJNEyCUJSPL4ZHMhhEmAfkgseih/EU7VvihvYV2G
        D3wU+nV81WEty5MA9rWbmszjlx6Skbzd3p4Qz8qyMK45sxrtfhIdJFYHHh5a/A==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1678974213;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=6g1WHSf/0Q1moWtdZi5EiFirdEBokAI7BTJwhTUhBUY=;
        b=k7YTF+P2du/W7vFVr38BltLuwUkL9tB9u+35rtN8KfxPmjFz9jHadmliDrrTDVPfIjih7Z
        tohgRcEk+tGaENUtPpfwR9dzKM+kY8fNKhcpvV6HbSU3Xu1i6EB/eHtyHyX9yn/T1YOlX7
        9fZDFskMozG26wpH4ByK58nPDCtSQ7ot9h+rd3rsPL/4NP2XsBJD28bkg/wZ7skkVNVgga
        mWoK8oZwAM1N+iSNAzjOowPG/O6o5o6kar2otAQhr2uUceyDPoAmAPDdpVAl06GgbKPQqF
        yqCjSoWCPviAha0F5aSH6hvdG6To6YJhVaIYj2uQXTCvAzEGdpk2D2jukNFiQg==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id B93C0634C91
        for <linux-media@vger.kernel.org>; Thu, 16 Mar 2023 15:42:22 +0200 (EET)
Date:   Thu, 16 Mar 2023 15:42:22 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL v2 FOR 6.4] Camera sensor, V4L2 documentation and DT
 binding patches
Message-ID: <ZBMcvvKKukZE0/GN@valkosipuli.retiisi.eu>
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

Here's a big bunch of mostly camera sensor related patches to 6.4. In
particular, there are DT binding text to YAML conversion, support for
IMX327 sensor (IMX290 driver), lots of improvements and fixes to the IMX290
driver, documentation improvements, streams kernel API improvements and
lots of fixes and improvements to a number of other sensor drivers.

since v1:

- Add a fix for ov2685 Kconfig issue.

Please pull.


The following changes since commit eeac8ede17557680855031c6f305ece2378af326:

  Linux 6.3-rc2 (2023-03-12 16:36:44 -0700)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.4-1.1-signed

for you to fetch changes up to bcec1cd9a7913a41ef09262500cd354486c4a032:

  ov2685: Select VIDEO_V4L2_SUBDEV_API (2023-03-16 12:21:49 +0200)

----------------------------------------------------------------
V4L2 patches for 6.4

----------------------------------------------------------------
Alexander Stein (2):
      media: dt-bindings: media: i2c: Add imx327 version to IMX327 bindings
      media: i2c: imx290: Add support for imx327 variant

Andy Shevchenko (2):
      media: i2c: imx290: Make use of get_unaligned_le24(), put_unaligned_le24()
      media: i2c: imx290: Use device_property_read_u32() directly

Arec Kao (1):
      media: ov13b10: Support device probe in non-zero ACPI D state

Benjamin Mugnier (4):
      media: i2c: st-vgxy61: Remove duplicate default mode set on probe
      media: i2c: st-vgxy61: Move 'detect' call to 'power_on'
      media: i2c: st-vgxy61: Fix control flow error on probe
      media: i2c: st-vgxy61: Use VGXY61_NB_POLARITIES instead of hardcoded value in tx_from_ep

Bingbu Cao (1):
      media: ov13b10: remove streaming mode set from reg_list

Dave Stevenson (15):
      media: dt-bindings: media: i2c: Add mono version to IMX290 bindings
      media: i2c: imx290: Add support for the mono sensor variant
      media: i2c: imx290: Match kernel coding style on whitespace
      media: i2c: imx290: Set the colorspace fields in the format
      media: i2c: imx290: Add V4L2_SUBDEV_FL_HAS_EVENTS and subscribe hooks
      media: i2c: imx290: Fix the pixel rate at 148.5Mpix/s
      media: i2c: imx290: Support 60fps in 2 lane operation
      media: i2c: imx290: Use CSI timings as per datasheet
      media: i2c: imx290: Convert V4L2_CID_HBLANK to read/write
      media: i2c: imx290: Convert V4L2_CID_VBLANK to read/write
      media: i2c: imx290: VMAX is mode dependent
      media: i2c: imx290: Remove duplicated write to IMX290_CTRL_07
      media: i2c: imx290: Add support for 74.25MHz external clock
      media: i2c: imx290: Add support for H & V Flips
      media: i2c: imx290: Add the error code to logs in start_streaming

Dorota Czaplejewicz (2):
      doc/media api: Try to make enum usage clearer
      media api: Try to make enum usage clearer

Jacopo Mondi (2):
      media: i2c: ov5647: Use bus-locked i2c_transfer()
      media: i2c: ov5670: Properly handle !CONFIG_HAVE_CLK

Krzysztof Kozlowski (20):
      media: dt-bindings: silabs,si470x: Convert to DT schema
      media: dt-bindings: samsung-fimc: drop simple-bus
      media: samsung: exynos4-is: do not require pinctrl
      media: samsung: exynos4-is: drop simple-bus from compatibles
      media: dt-bindings: i2c: samsung,s5k6a3: convert to dtschema
      media: dt-bindings: i2c: samsung,s5k5baf: convert to dtschema
      media: dt-bindings: samsung,exynos4210-csis: convert to dtschema
      media: dt-bindings: samsung,exynos4212-fimc-lite: convert to dtschema
      media: dt-bindings: samsung,exynos4212-is: convert to dtschema
      media: dt-bindings: samsung,fimc: convert to dtschema
      media: dt-bindings: samsung,s5c73m3: convert to dtschema
      media: dt-bindings: st,stm32-cec: drop obsolete file
      media: dt-bindings: qcom,venus: cleanup
      media: dt-bindings: qcom,venus: split common properties
      media: dt-bindings: qcom,msm8996-venus: document interconnects
      media: dt-bindings: qcom,sc7180-venus: document OPP table
      media: dt-bindings: qcom,sc7280-venus: document OPP table
      media: dt-bindings: qcom,sdm845-venus-v2: document OPP table
      media: dt-bindings: qcom,sm8250-venus: document OPP table
      media: dt-bindings: qcom,venus: document firmware-name

Laurent Pinchart (2):
      media: i2c: imx296: Use v4l2_subdev_get_fmt()
      media: max9286: Free control handler

Luca Weiss (5):
      media: i2c: ov5670: Use dev_err_probe in probe function
      media: i2c: ov5670: Support single-lane operation
      media: i2c: ov2685: Add print for power on write failed
      media: i2c: ov2685: Add controls from fwnode
      media: i2c: ov2685: Add .get_selection() support

Miaoqian Lin (1):
      media: v4l2-ctrls: Fix doc for v4l2_ctrl_request_hdl_find

Neil Armstrong (1):
      dt-bindings: media: convert meson-ir.txt to dt-schema

Paul Elder (1):
      docs: media: v4l: uapi: Fix field type for SUBDEV_ENUM_FRAME_SIZE

Robert Mader (1):
      media: i2c: imx258: Parse and register properties

Sakari Ailus (1):
      ov2685: Select VIDEO_V4L2_SUBDEV_API

Shravan Chippa (4):
      media: i2c: imx334: replace __v4l2_ctrl_s_ctrl to __v4l2_ctrl_modify_range
      media: i2c: imx334: add missing reset values for mode 3840x2160_regs[]
      media: i2c: imx334: support lower bandwidth mode
      dt-bindings: media: i2c: imx334 add new link_freq

Tomi Valkeinen (3):
      media: subdev: Use 'shall' instead of 'may' in route validation
      media: subdev: Split V4L2_SUBDEV_ROUTING_NO_STREAM_MIX
      media: subdev: Add V4L2_SUBDEV_ROUTING_NO_MULTIPLEXING

Valentine Barshak (1):
      media: i2c: ov5647: Add test pattern control

 .../bindings/media/amlogic,meson6-ir.yaml          |  47 ++
 .../devicetree/bindings/media/exynos-fimc-lite.txt |  16 -
 .../devicetree/bindings/media/exynos4-fimc-is.txt  |  50 --
 .../bindings/media/i2c/samsung,s5k5baf.yaml        | 101 ++++
 .../bindings/media/i2c/samsung,s5k6a3.yaml         |  98 ++++
 .../devicetree/bindings/media/i2c/sony,imx290.yaml |  25 +-
 .../devicetree/bindings/media/i2c/sony,imx334.yaml |   2 +-
 .../devicetree/bindings/media/meson-ir.txt         |  20 -
 .../bindings/media/qcom,msm8916-venus.yaml         |  86 +--
 .../bindings/media/qcom,msm8996-venus.yaml         | 146 +++--
 .../bindings/media/qcom,sc7180-venus.yaml          |  97 ++--
 .../bindings/media/qcom,sc7280-venus.yaml          | 132 ++---
 .../bindings/media/qcom,sdm660-venus.yaml          | 144 ++---
 .../bindings/media/qcom,sdm845-venus-v2.yaml       | 108 ++--
 .../bindings/media/qcom,sdm845-venus.yaml          | 104 ++--
 .../bindings/media/qcom,sm8250-venus.yaml          | 122 ++---
 .../bindings/media/qcom,venus-common.yaml          |  73 +++
 .../bindings/media/samsung,exynos4210-csis.yaml    | 170 ++++++
 .../bindings/media/samsung,exynos4210-fimc.yaml    | 152 ++++++
 .../bindings/media/samsung,exynos4212-fimc-is.yaml | 220 ++++++++
 .../media/samsung,exynos4212-fimc-lite.yaml        |  63 +++
 .../devicetree/bindings/media/samsung,fimc.yaml    | 279 ++++++++++
 .../devicetree/bindings/media/samsung,s5c73m3.yaml | 165 ++++++
 .../devicetree/bindings/media/samsung-fimc.txt     | 209 --------
 .../bindings/media/samsung-mipi-csis.txt           |  81 ---
 .../devicetree/bindings/media/samsung-s5c73m3.txt  |  97 ----
 .../devicetree/bindings/media/samsung-s5k5baf.txt  |  58 --
 .../devicetree/bindings/media/samsung-s5k6a3.txt   |  33 --
 Documentation/devicetree/bindings/media/si470x.txt |  26 -
 .../devicetree/bindings/media/silabs,si470x.yaml   |  48 ++
 .../devicetree/bindings/media/st,stm32-cec.yaml    |  53 --
 .../media/v4l/vidioc-subdev-enum-frame-size.rst    |  44 +-
 .../media/v4l/vidioc-subdev-enum-mbus-code.rst     |  39 +-
 MAINTAINERS                                        |   7 +
 drivers/media/i2c/Kconfig                          |   1 +
 drivers/media/i2c/imx258.c                         |  13 +-
 drivers/media/i2c/imx290.c                         | 594 +++++++++++++++++----
 drivers/media/i2c/imx296.c                         |  11 +-
 drivers/media/i2c/imx334.c                         | 322 ++++++++++-
 drivers/media/i2c/max9286.c                        |   1 +
 drivers/media/i2c/ov13b10.c                        |  75 ++-
 drivers/media/i2c/ov2685.c                         |  78 ++-
 drivers/media/i2c/ov5647.c                         |  56 +-
 drivers/media/i2c/ov5670.c                         | 114 ++--
 drivers/media/i2c/st-vgxy61.c                      |  23 +-
 .../media/platform/samsung/exynos4-is/media-dev.c  |  10 +-
 drivers/media/v4l2-core/v4l2-subdev.c              |  45 +-
 include/media/v4l2-ctrls.h                         |   2 +-
 include/media/v4l2-subdev.h                        |  32 +-
 49 files changed, 2984 insertions(+), 1508 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/exynos-fimc-lite.txt
 delete mode 100644 Documentation/devicetree/bindings/media/exynos4-fimc-is.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k5baf.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k6a3.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/meson-ir.txt
 create mode 100644 Documentation/devicetree/bindings/media/qcom,venus-common.yaml
 create mode 100644 Documentation/devicetree/bindings/media/samsung,exynos4210-csis.yaml
 create mode 100644 Documentation/devicetree/bindings/media/samsung,exynos4210-fimc.yaml
 create mode 100644 Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-is.yaml
 create mode 100644 Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-lite.yaml
 create mode 100644 Documentation/devicetree/bindings/media/samsung,fimc.yaml
 create mode 100644 Documentation/devicetree/bindings/media/samsung,s5c73m3.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/samsung-fimc.txt
 delete mode 100644 Documentation/devicetree/bindings/media/samsung-mipi-csis.txt
 delete mode 100644 Documentation/devicetree/bindings/media/samsung-s5c73m3.txt
 delete mode 100644 Documentation/devicetree/bindings/media/samsung-s5k5baf.txt
 delete mode 100644 Documentation/devicetree/bindings/media/samsung-s5k6a3.txt
 delete mode 100644 Documentation/devicetree/bindings/media/si470x.txt
 create mode 100644 Documentation/devicetree/bindings/media/silabs,si470x.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/st,stm32-cec.yaml

-- 
Kind regards,

Sakari Ailus
