Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80FEB6DB2E7
	for <lists+linux-media@lfdr.de>; Fri,  7 Apr 2023 20:35:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231196AbjDGSfU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Apr 2023 14:35:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbjDGSfT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Apr 2023 14:35:19 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E8FDC17C
        for <linux-media@vger.kernel.org>; Fri,  7 Apr 2023 11:35:00 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkzcv-3yyyyyyyyyyyyyt-3.rev.dnainternet.fi [IPv6:2001:14ba:4505:1fdc::1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4PtRqg3tF6zyRB
        for <linux-media@vger.kernel.org>; Fri,  7 Apr 2023 21:34:55 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1680892495;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=ICPyiaKFN1gFGxL7hN4L+LYA8oCVxSv1jCVcIKPhMGc=;
        b=p07gh0i8eMyEst2dt93U1PQ8uG2yapdIdfXkC2inhMSwm8QbAeT9hzL/LFsLCNlh6u9FT/
        Gy6YLQKz3lWMQMoYZ4FxkpHZOO6+TSIp4hs7nTPdq2nVhmQjJv02Z5IjOegAx4Y7ne1cfi
        P0AW1fmVwDghXNPpPEPPEGkq98R5MSE=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1680892495; a=rsa-sha256; cv=none;
        b=TKkl8FGx+dQGsfYjxaL2qBaC59wl6NaclLCotKzUFhbo1XtX4XZsOy9gQk29wK7k5VUbYo
        olCiQT0E/7K3FJZjrAnW10M8oQKU5r0OeCc9oVjKWuz/1d3iDj/7toJcXVZhJdUWk9DtDK
        /MLODWmEnVNMIdZuMyARXPQTWufADNA=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1680892495;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=ICPyiaKFN1gFGxL7hN4L+LYA8oCVxSv1jCVcIKPhMGc=;
        b=p50cQLcq39teSsY5NdD+ZNsUqee95WaBZVF6Sz5barEFtXfhVyXYRpjH+/txATXDfLu7Yg
        GAxSJG45s39nGqZCamAA3xDmZEL7JwhQJoTacIr7ug0FSPgeCJ8MlK4osHFiP0kKXXYq66
        20tDUKEGKZV/0TXmOuf3hR5+zVPJZPQ=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 85C0C634C91
        for <linux-media@vger.kernel.org>; Fri,  7 Apr 2023 21:32:07 +0300 (EEST)
Date:   Fri, 7 Apr 2023 21:32:07 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.4] More V4L2 camera sensor patches
Message-ID: <ZDBhp9UGNJ+zjDBW@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a fairly large number of mostly camera sensor related patches. In
particular, there is rotation and flipping alignment across drivers,
improvements to ipu3-cio2 driver (more supported camera sensors),
improvements to the CCS driver amd V4L2 fwnode framework, a V4L2 async fix,
additional mode for the hi556 driver, DT binding cleanups, removing support
for old rcar-vin devices and fixes for a number of sensor drivers.

Please pull.


The following changes since commit 71937240a472ee551ac8de0e7429b9d49884a388:

  media: ov2685: Select VIDEO_V4L2_SUBDEV_API (2023-03-20 16:32:18 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.4-2.1-signed

for you to fetch changes up to 324b83208c9d5839bf6fdbaaae0cb4d2456f22a5:

  media: i2c: imx290: Add missing \n on dev_err_probe() message (2023-04-07 19:50:10 +0300)

----------------------------------------------------------------
V4L2 patches for 6.4

----------------------------------------------------------------
Alexander Stein (1):
      media: i2c: imx290: Add missing \n on dev_err_probe() message

Bingbu Cao (2):
      media: ipu3-cio2: support multiple sensors and VCMs with same HID
      media: ipu3-cio2: support more camera sensors in cio2-bridge

Christophe JAILLET (1):
      media: i2c: ov7670: Use the devm_clk_get_optional() helper

Jacopo Mondi (2):
      media: imx258: Register H/V flip controls
      media: imx258: Remove mandatory 180 degrees rotation

Jason Kim (1):
      media: mc-device: remove unnecessary __must_check

Jim Lai (1):
      media: hi556: add 2592x1444 resolution

Krzysztof Kozlowski (1):
      media: venus: drop unused opp_table field documentation

Laurent Pinchart (3):
      media: i2c: adv7604: Enable video adjustment
      media: i2c: adv7604: Fix range of hue control
      media: Accept non-subdev sinks in v4l2_create_fwnode_links_to_pad()

Luca Weiss (3):
      media: dt-bindings: media: rkisp1: complete ov2685 example
      media: dt-bindings: ov2685: convert to dtschema
      media: i2c: ov2685: Make reset gpio optional

Ricardo Ribalda (1):
      media: ov8856: Do not check for for module version

Rob Herring (2):
      media: dt-bindings: Drop unneeded quotes
      media: Use of_property_present() for testing DT property presence

Sakari Ailus (9):
      media: v4l: async: Return async sub-devices to subnotifier list
      MAINTAINERS: Assume ov8856 driver maintainership
      media: dt-bindings: ov8856: Assign maintainership to myself
      media: ccs: Align flipping behaviour with other drivers
      media: ccs: Add V4L2 controls from properties
      media: ccs: Support 16-bit sensor revision number register
      media: ccs: Apply module manufacturer hack on non-CCS devices only
      media: ccs: Differentiate SMIA and MIPI vendors in static data
      media: ccs: Document CCS static data file names

Wei Chen (1):
      media: hi846: Fix memleak in hi846_init_controls()

Wolfram Sang (3):
      media: rcar-vin: remove R-Car H3 ES1.* handling
      media: rcar-vin: csi2: remove R-Car H3 ES1.* handling
      media: renesas: fdp1: remove R-Car H3 ES1.* handling

Yang Li (1):
      media: atmel: atmel-isc: Use devm_platform_ioremap_resource()

 .../bindings/media/allwinner,sun4i-a10-ir.yaml     |   2 +-
 .../bindings/media/allwinner,sun50i-h6-vpu-g2.yaml |   4 +-
 .../bindings/media/amlogic,axg-ge2d.yaml           |   4 +-
 .../devicetree/bindings/media/amlogic,gx-vdec.yaml |   4 +-
 .../bindings/media/amlogic,meson-ir-tx.yaml        |   4 +-
 .../bindings/media/i2c/chrontel,ch7322.yaml        |   4 +-
 .../bindings/media/i2c/dongwoon,dw9768.yaml        |   6 +-
 .../bindings/media/i2c/maxim,max9286.yaml          |   2 +-
 .../devicetree/bindings/media/i2c/ov2685.txt       |  41 ------
 .../devicetree/bindings/media/i2c/ov8856.yaml      |   2 +-
 .../bindings/media/i2c/ovti,ov02a10.yaml           |   2 +-
 .../devicetree/bindings/media/i2c/ovti,ov2685.yaml | 101 +++++++++++++
 .../bindings/media/mediatek,mdp3-rdma.yaml         |   2 +-
 .../media/mediatek,vcodec-subdev-decoder.yaml      |   4 +-
 .../bindings/media/microchip,sama5d4-vdec.yaml     |   4 +-
 .../devicetree/bindings/media/nxp,imx8mq-vpu.yaml  |   4 +-
 .../bindings/media/qcom,msm8916-camss.yaml         |   4 +-
 .../bindings/media/qcom,msm8996-camss.yaml         |   4 +-
 .../bindings/media/qcom,sdm660-camss.yaml          |   4 +-
 .../bindings/media/qcom,sdm845-camss.yaml          |   4 +-
 .../bindings/media/qcom,sm8250-camss.yaml          |   4 +-
 Documentation/devicetree/bindings/media/rc.yaml    |   2 +-
 .../bindings/media/rockchip,rk3568-vepu.yaml       |   4 +-
 .../devicetree/bindings/media/rockchip-isp1.yaml   |  19 ++-
 .../devicetree/bindings/media/rockchip-vpu.yaml    |   4 +-
 .../devicetree/bindings/media/ti,cal.yaml          |   2 +-
 Documentation/driver-api/media/drivers/ccs/ccs.rst |  22 +++
 MAINTAINERS                                        |   3 +-
 drivers/media/i2c/adv7604.c                        |   5 +-
 drivers/media/i2c/ccs/ccs-core.c                   | 157 +++++++++++----------
 drivers/media/i2c/ccs/ccs.h                        |  14 --
 drivers/media/i2c/hi556.c                          | 150 +++++++++++++++++++-
 drivers/media/i2c/hi846.c                          |  11 +-
 drivers/media/i2c/imx258.c                         |  22 +--
 drivers/media/i2c/imx290.c                         |   2 +-
 drivers/media/i2c/ov2685.c                         |   2 +-
 drivers/media/i2c/ov7670.c                         |  11 +-
 drivers/media/i2c/ov8856.c                         |  40 ------
 drivers/media/mc/mc-device.c                       |   3 +-
 drivers/media/pci/intel/ipu3/cio2-bridge.c         |  23 ++-
 drivers/media/pci/intel/ipu3/cio2-bridge.h         |   3 +-
 .../media/platform/mediatek/jpeg/mtk_jpeg_core.c   |   2 +-
 .../platform/mediatek/vcodec/mtk_vcodec_dec_drv.c  |   2 +-
 .../platform/mediatek/vcodec/mtk_vcodec_enc_drv.c  |   2 +-
 drivers/media/platform/qcom/venus/core.h           |   1 -
 .../media/platform/renesas/rcar-vin/rcar-core.c    |  36 -----
 .../media/platform/renesas/rcar-vin/rcar-csi2.c    |  15 +-
 drivers/media/platform/renesas/rcar_fdp1.c         |   4 -
 drivers/media/platform/xilinx/xilinx-vtc.c         |   2 +-
 drivers/media/usb/au0828/au0828-core.c             |   9 +-
 drivers/media/v4l2-core/v4l2-async.c               |  13 +-
 drivers/media/v4l2-core/v4l2-mc.c                  |  15 +-
 .../media/deprecated/atmel/atmel-sama5d2-isc.c     |   4 +-
 .../media/deprecated/atmel/atmel-sama7g5-isc.c     |   4 +-
 include/media/media-device.h                       |   5 +-
 include/media/v4l2-mc.h                            |   8 +-
 56 files changed, 492 insertions(+), 339 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov2685.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov2685.yaml

-- 
Kind regards,

Sakari Ailus
