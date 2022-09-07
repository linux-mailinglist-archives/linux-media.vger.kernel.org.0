Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B3575AFC44
	for <lists+linux-media@lfdr.de>; Wed,  7 Sep 2022 08:17:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbiIGGRC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Sep 2022 02:17:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbiIGGRA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Sep 2022 02:17:00 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8557F94ECE
        for <linux-media@vger.kernel.org>; Tue,  6 Sep 2022 23:16:59 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkwl20tj04snw15cjtflt-3.rev.dnainternet.fi [IPv6:2001:14ba:4493:6f40:fec3:d72a:e447:8113])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 620F11B00330
        for <linux-media@vger.kernel.org>; Wed,  7 Sep 2022 09:16:56 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1662531416;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=jMpdaSxiT55iVf9594CsH86JhIm3DDu98Q+xD9w6Suw=;
        b=BsKzB3RaJC/5UTKvEaCcsayD5KwuijiISS/DHw1sFIwg0iHE5bQxs0DfjNiZDFE2FHj0rN
        ABHVGQO7bKeTPBZ4OTgLnrAgb7bepmdT7gY3U29Ca4qzd2uW4VUIbSR+r7OGkSklq265Ce
        lmBEiLo/H38ITNrnrqTKATB4uV7W2lijPdFnT9yefupfPui9ZYcpCg24rv5rEIgPE7bbZ7
        hfyomAK+Q1jtuDGDXF35aNF4Xky3/TlGoHhcQJ49B2PpZDWnB0+pWaZr3IHIYsXJU3VipQ
        /QUyWlus+lTUP5RPXBBV/c8Nr6sU0g+PHV6W7ngUFI6wJbrJLbdIjP8vw8KSAw==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 553B7634C91
        for <linux-media@vger.kernel.org>; Wed,  7 Sep 2022 09:16:53 +0300 (EEST)
Date:   Wed, 7 Sep 2022 09:16:53 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.1] V4L2 camera patches
Message-ID: <Yxg3VXLv49tgYqsD@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1662531416; a=rsa-sha256;
        cv=none;
        b=T6Vzwyrw2PKRvezBEvWuKEsJW69iLcmF/YUmUdDLXyNgTl61cHBFoCZVFwpRZo93zqAJI3
        8x5qiHhTrZ3QOBv8wGyhxB8wg2Z5+OPZ2tpED48V+cWBJUbY6DkYMfHst+/LLnG+W83Vml
        2kLpNYRiuSNdwUN/cqjrbKIo6YStauLDLHstgVM9gukjQ2zpBnSEKEDLfUbB7I+FiyB1/Q
        DLrRy4spLhW31QO/x1cM7oTEFv1gkxlHdK6aQvc4TGscXaG+qfVbFK5mZtKwQKw0JodY6L
        poLvP0Y7hVDQZBWqIK8E/q7kOOiOlwQBKeauwCdc1GtPu5HBf7i0SIKcnq2IPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1662531416;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=jMpdaSxiT55iVf9594CsH86JhIm3DDu98Q+xD9w6Suw=;
        b=e6RMuqh5BEowCn0SLkHlXWlWllhzT5rxFnJa++hAhgZbScUOXt5xC1/BGIVq4Ik9nOV0e3
        IKri7hF+tSrnke+sjAwTJ8bvvmeMQ87Yv/YSDE2N2J+YIGMLS72gU+moSeed7XSuyXe/5c
        wsmA0ktARNBCjNOUcIU4z2iG5OxmWUTIpOtwfvNlTvxLD8v2iNPouMe+LyEQUKJ+WbLeA8
        sVcGDZVH6oStrxBCZ/U2KFza00eKJ8/ZEwFNFxIWHdcGb2ery1V+ooNNRdEXjkN3QWyTmc
        KQsx4aoqHEuJPN3zfNModvpE6f2wwGt6Jlb0hAKmypI9O79Y1Mbupn0Ru739Qg==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a big bunch of patches for Linux 6.1. It includes a number of fixes
and improvements here and there. It also begins merging the streams
patchset by Tomi (16 first patches) of which the rest needs more review
(but not necessarily too many changes).

Please pull.


The following changes since commit 61890ccaefaff89f5babd2c8412fd222c3f5fe38:

  media: platform: mtk-mdp3: add MediaTek MDP3 driver (2022-08-30 16:25:51 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.1-1-signed

for you to fetch changes up to ceec7a7d80918aad1fcbd4a4744baf74c70526e8:

  dt-bindings: media: samsung,exynos5250-gsc: convert to dtschema (2022-09-06 10:11:38 +0300)

----------------------------------------------------------------
V4L2 patches for 6.1

----------------------------------------------------------------
Alexander Stein (1):
      media: v4l2: Fix v4l2_i2c_subdev_set_name function documentation

Christophe JAILLET (1):
      media: ov8865: Fix an error handling path in ov8865_probe()

Jacopo Mondi (1):
      media: mc: entity: Add iterator helper for entity pads

Jean-Michel Hautbois (1):
      media: staging: ipu3-imgu: Fix BNR wb gain documentation

Krzysztof Kozlowski (2):
      media: dt-bindings: dongwoon,dw9714: convert to dtschema
      dt-bindings: media: samsung,exynos5250-gsc: convert to dtschema

Laurent Pinchart (4):
      media: mc: entity: Merge media_entity_enum_init and __media_entity_enum_init
      media: mc: entity: Move media_entity_get_fwnode_pad() out of graph walk section
      media: mc: entity: Add media_entity_pipeline() to access the media pipeline
      media: mc: entity: Rewrite media_pipeline_start()

Paul Elder (1):
      media: ov5640: Use runtime PM

Sakari Ailus (6):
      ar0521: Remove redundant variable ret
      ipu3-imgu: Fix NULL pointer dereference in active selection access
      v4l: subdev: Fail graciously when getting try data for NULL state
      ar0521: Fix return value check in writing initial registers
      sun6i-mipi-csi2: Depend on PHY_SUN6I_MIPI_DPHY
      media: Remove incorrect comment from struct v4l2_fwnode_endpoint

Slark Xiao (1):
      media: i2c: mt9v111: Fix typo 'the the' in comment

Tomi Valkeinen (11):
      media: Documentation: mc: add definitions for stream and pipeline
      media: media-entity.h: add include for min()
      media: subdev: increase V4L2_FRAME_DESC_ENTRY_MAX to 8
      media: mc: entity: Rename streaming_count -> start_count
      media: v4l2-dev: Add videodev wrappers for media pipelines
      media: drivers: use video device pipeline start/stop
      media: drivers: use video_device_pipeline()
      media: mc: entity: add alloc variant of pipeline_start
      media: drivers: use video_device_pipeline_alloc_start()
      media: mc: entity: Add has_pad_interdep entity operation
      media: mc: convert pipeline funcs to take media_pad

Yang Yingliang (1):
      media: ar0521: fix error return code in ar0521_power_on()

 .../devicetree/bindings/media/exynos5-gsc.txt      |  38 --
 .../bindings/media/i2c/dongwoon,dw9714.txt         |   9 -
 .../bindings/media/i2c/dongwoon,dw9714.yaml        |  47 ++
 .../bindings/media/samsung,exynos5250-gsc.yaml     | 109 ++++
 Documentation/driver-api/media/mc-core.rst         |  19 +-
 MAINTAINERS                                        |   2 +-
 drivers/media/i2c/ar0521.c                         |  11 +-
 drivers/media/i2c/mt9v111.c                        |   2 +-
 drivers/media/i2c/ov5640.c                         | 123 ++--
 drivers/media/i2c/ov8865.c                         |  10 +-
 drivers/media/mc/mc-device.c                       |  13 +-
 drivers/media/mc/mc-entity.c                       | 648 +++++++++++++++++----
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c      |   6 +-
 drivers/media/platform/qcom/camss/camss-video.c    |   6 +-
 .../media/platform/renesas/rcar-vin/rcar-core.c    |   5 +-
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c |  18 +-
 drivers/media/platform/renesas/vsp1/vsp1_video.c   |   6 +-
 .../platform/rockchip/rkisp1/rkisp1-capture.c      |  14 +-
 .../platform/samsung/exynos4-is/fimc-capture.c     |   9 +-
 .../platform/samsung/exynos4-is/fimc-isp-video.c   |   9 +-
 .../media/platform/samsung/exynos4-is/fimc-lite.c  |   9 +-
 .../platform/samsung/s3c-camif/camif-capture.c     |   6 +-
 drivers/media/platform/st/stm32/stm32-dcmi.c       |   6 +-
 drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c |   6 +-
 .../media/platform/sunxi/sun6i-csi/sun6i_video.c   |   6 +-
 .../media/platform/sunxi/sun6i-mipi-csi2/Kconfig   |   2 +-
 drivers/media/platform/ti/cal/cal-video.c          |   6 +-
 drivers/media/platform/ti/cal/cal.h                |   1 -
 drivers/media/platform/ti/omap3isp/isp.c           |   4 +-
 drivers/media/platform/ti/omap3isp/ispvideo.c      |   9 +-
 drivers/media/platform/ti/omap3isp/ispvideo.h      |  11 +-
 drivers/media/platform/xilinx/xilinx-dma.c         |  11 +-
 drivers/media/platform/xilinx/xilinx-dma.h         |   9 +-
 drivers/media/test-drivers/vimc/vimc-capture.c     |   7 +-
 drivers/media/usb/au0828/au0828-core.c             |   8 +-
 drivers/media/v4l2-core/v4l2-dev.c                 |  72 +++
 drivers/staging/media/imx/imx-media-utils.c        |   8 +-
 drivers/staging/media/imx/imx7-media-csi.c         |   6 +-
 .../staging/media/ipu3/include/uapi/intel-ipu3.h   |   7 +-
 drivers/staging/media/ipu3/ipu3-v4l2.c             |  37 +-
 drivers/staging/media/omap4iss/iss.c               |   4 +-
 drivers/staging/media/omap4iss/iss_video.c         |   9 +-
 drivers/staging/media/omap4iss/iss_video.h         |  11 +-
 drivers/staging/media/tegra-video/tegra210.c       |   6 +-
 include/media/media-device.h                       |  15 -
 include/media/media-entity.h                       | 169 +++++-
 include/media/v4l2-common.h                        |   3 +-
 include/media/v4l2-dev.h                           | 102 ++++
 include/media/v4l2-fwnode.h                        |   4 -
 include/media/v4l2-subdev.h                        |  12 +-
 50 files changed, 1253 insertions(+), 417 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/exynos5-gsc.txt
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.yaml
 create mode 100644 Documentation/devicetree/bindings/media/samsung,exynos5250-gsc.yaml

-- 
Sakari Ailus
