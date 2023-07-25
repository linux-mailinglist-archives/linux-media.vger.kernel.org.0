Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7F82761124
	for <lists+linux-media@lfdr.de>; Tue, 25 Jul 2023 12:45:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231802AbjGYKph (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jul 2023 06:45:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjGYKpg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jul 2023 06:45:36 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2E2110CC
        for <linux-media@vger.kernel.org>; Tue, 25 Jul 2023 03:45:33 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkzdf0gkyyyyyyyyyyyyt-3.rev.dnainternet.fi [IPv6:2001:14ba:4506:4f15::1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4R9DFj6rGSzyRB
        for <linux-media@vger.kernel.org>; Tue, 25 Jul 2023 13:45:28 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1690281930;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=uiCND8nqp7NRqKwMrvqdrrdm882GKpIzRUhYAIa+Wko=;
        b=RPYjQhd4O46Udd4oUx+2XbjJPRUcBy5kIuRFFQlk3kkqVeYWSYyN94aAQ0O1YF1UXjDtid
        1z2gniz9rbb+w85xKBVt3ikSWuZuEHT+dBkL7QWFW8xMi1mg0G68y1FjDnwqmBZXT7hKf+
        jIgMCPZ/EHkLBHsnbCw2UPjZadrYAvQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1690281930;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=uiCND8nqp7NRqKwMrvqdrrdm882GKpIzRUhYAIa+Wko=;
        b=OAZKb87jA5pZI1FEj17d/FxR+5DjAKgyGqSRgLChkYO6N6vaSXQRXLRr+yC+EPy47wanzQ
        TArAF8/rOs+Fc8sM5QQRPAWYbets5/6DLU/ASSSjxIa0kGVcnkr7AHOEQtYSpaeaQ2bu+P
        goRm/c3fX+LuiyRdJcKoQQpzeFd4dSs=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1690281930; a=rsa-sha256; cv=none;
        b=m2cj/kcdhN2amtAmFjUDIeHa5szfuCAP4l9VcuGlCGbFMejlPbUUZuoowORKmEYQjQfwya
        JK8nibuvc4jl9XAvrrVeTh1XB7pEN+nnjJfAnEJ7wkIT2Joe3G7Ir16MjQTumlHF7SzGjB
        iko8A7hl7h/PcPnwRoZr8XbNNyYiFtc=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id E9CC2634C23
        for <linux-media@vger.kernel.org>; Tue, 25 Jul 2023 13:45:27 +0300 (EEST)
Date:   Tue, 25 Jul 2023 10:45:27 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.6] Separate V4L2 async sub-devices from connections
Message-ID: <ZL+nx1/qYE2FggwD@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

This set reworks V4L2 async framework by separating async sub-devices from
connections, allowing binding a sub-device with multiple asynchronous
connections. Consequently, it also allows both i.MX6 and adv748x drivers to
work with the same kernel.

Please pull.


The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/async-multi-v6-signed

for you to fetch changes up to a74b4f6c47473d28603b6a95d7f27038e7b8d256:

  media: Documentation: v4l: Document sub-device notifiers (2023-07-24 00:02:48 +0300)

----------------------------------------------------------------
V4L2 async sub-devices and connections for 6.6

----------------------------------------------------------------
Jacopo Mondi (1):
      media: v4l: async: Drop v4l2_async_nf_parse_fwnode_endpoints()

Sakari Ailus (37):
      media: v4l: fwnode: Remove unneeded forward declaration
      media: atmel-isi: Remote unneeeded forward declaration
      media: xilinx-vipp: Clean up bound async notifier callback
      media: omap3isp: Move link creation to bound callback
      media: Documentation: v4l: Fix async notifier registration example
      media: Documentation: v4l: Add section titles for async
      media: Documentation: v4l: Fix async sensor subdev helper documentation
      media: Documentation: v4l: Document missing async subdev function
      media: Documentation: v4l: Document v4l2_async_nf_cleanup
      media: v4l: async: Add some debug prints
      media: v4l: async: Clean up testing for duplicate async subdevs
      media: v4l: async: Don't check whether asd is NULL in validity check
      media: v4l: async: Make V4L2 async match information a struct
      media: v4l: async: Rename V4L2_ASYNC_MATCH_ macros, add TYPE_
      media: v4l: async: Only pass match information for async subdev validation
      media: v4l: async: Clean up list heads and entries
      media: v4l: async: Simplify async sub-device fwnode matching
      media: v4l: async: Rename v4l2_async_subdev as v4l2_async_connection
      media: v4l: async: Clean up error handling in v4l2_async_match_notify
      media: v4l: async: Drop duplicate handling when adding connections
      media: v4l: async: Rework internal lists
      media: v4l: async: Obtain async connection based on sub-device
      media: v4l: async: Allow multiple connections between entities
      media: v4l: async: Drop unneeded list entry initialisation
      media: v4l: async: Try more connections
      media: v4l: async: Support fwnode endpoint list matching for subdevs
      media: adv748x: Return to endpoint matching
      media: pxa_camera: Fix probe error handling
      media: pxa_camera: Register V4L2 device early
      media: marvell: cafe: Register V4L2 device earlier
      media: am437x-vpfe: Register V4L2 device early
      media: omap3isp: Initialise V4L2 async notifier later
      media: xilinx-vipp: Init async notifier after registering V4L2 device
      media: davinci: Init async notifier after registering V4L2 device
      media: qcom: Initialise V4L2 async notifier later
      media: v4l: async: Set v4l2_device and subdev in async notifier init
      media: Documentation: v4l: Document sub-device notifiers

 Documentation/driver-api/media/v4l2-subdev.rst     | 110 ++--
 drivers/media/i2c/adv748x/adv748x-csi2.c           |  13 +-
 drivers/media/i2c/max9286.c                        |  27 +-
 drivers/media/i2c/rdacm20.c                        |  16 +-
 drivers/media/i2c/rdacm21.c                        |  15 +-
 drivers/media/i2c/st-mipid02.c                     |  12 +-
 drivers/media/i2c/tc358746.c                       |  15 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c      |  14 +-
 drivers/media/platform/atmel/atmel-isi.c           |  12 +-
 drivers/media/platform/atmel/atmel-isi.h           |   2 -
 drivers/media/platform/cadence/cdns-csi2rx.c       |  10 +-
 drivers/media/platform/intel/pxa_camera.c          |  77 +--
 drivers/media/platform/marvell/cafe-driver.c       |  18 +-
 drivers/media/platform/marvell/mcam-core.c         |  15 +-
 drivers/media/platform/marvell/mmp-driver.c        |   6 +-
 .../media/platform/microchip/microchip-csi2dc.c    |  11 +-
 .../media/platform/microchip/microchip-isc-base.c  |   4 +-
 drivers/media/platform/microchip/microchip-isc.h   |   2 +-
 .../platform/microchip/microchip-sama5d2-isc.c     |   9 +-
 .../platform/microchip/microchip-sama7g5-isc.c     |   9 +-
 drivers/media/platform/nxp/imx-mipi-csis.c         |  17 +-
 drivers/media/platform/nxp/imx7-media-csi.c        |  10 +-
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    |  12 +-
 drivers/media/platform/qcom/camss/camss.c          |  26 +-
 drivers/media/platform/qcom/camss/camss.h          |   2 +-
 drivers/media/platform/renesas/rcar-isp.c          |  12 +-
 .../media/platform/renesas/rcar-vin/rcar-core.c    |  52 +-
 .../media/platform/renesas/rcar-vin/rcar-csi2.c    |  20 +-
 drivers/media/platform/renesas/rcar-vin/rcar-vin.h |  10 +-
 drivers/media/platform/renesas/rcar_drif.c         |  12 +-
 drivers/media/platform/renesas/renesas-ceu.c       |  10 +-
 .../media/platform/renesas/rzg2l-cru/rzg2l-core.c  |  14 +-
 .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h   |   2 +-
 .../media/platform/renesas/rzg2l-cru/rzg2l-csi2.c  |  12 +-
 .../media/platform/rockchip/rkisp1/rkisp1-common.h |   2 +-
 .../media/platform/rockchip/rkisp1/rkisp1-csi.c    |   7 +-
 .../media/platform/rockchip/rkisp1/rkisp1-dev.c    |  12 +-
 .../media/platform/rockchip/rkisp1/rkisp1-isp.c    |   8 +-
 .../media/platform/samsung/exynos4-is/media-dev.c  |  11 +-
 .../media/platform/samsung/exynos4-is/media-dev.h  |   2 +-
 drivers/media/platform/st/stm32/stm32-dcmi.c       |  12 +-
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c |  10 +-
 .../platform/sunxi/sun6i-csi/sun6i_csi_bridge.c    |  12 +-
 .../platform/sunxi/sun6i-csi/sun6i_csi_bridge.h    |   2 +-
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c        |  10 +-
 .../sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c    |  10 +-
 drivers/media/platform/ti/am437x/am437x-vpfe.c     |  36 +-
 drivers/media/platform/ti/am437x/am437x-vpfe.h     |   2 +-
 drivers/media/platform/ti/cal/cal.c                |  10 +-
 drivers/media/platform/ti/davinci/vpif_capture.c   |  35 +-
 drivers/media/platform/ti/omap3isp/isp.c           |  55 +-
 drivers/media/platform/ti/omap3isp/isp.h           |  15 +-
 drivers/media/platform/ti/omap3isp/ispccdc.c       |  13 +-
 drivers/media/platform/ti/omap3isp/ispccp2.c       |   2 +
 drivers/media/platform/ti/omap3isp/ispcsi2.c       |   2 +
 drivers/media/platform/ti/omap3isp/ispcsiphy.c     |  15 +-
 drivers/media/platform/video-mux.c                 |  10 +-
 drivers/media/platform/xilinx/xilinx-vipp.c        |  55 +-
 drivers/media/v4l2-core/v4l2-async.c               | 689 +++++++++++----------
 drivers/media/v4l2-core/v4l2-fwnode.c              | 109 +---
 drivers/media/v4l2-core/v4l2-subdev.c              |  13 +
 .../media/atomisp/pci/atomisp_csi2_bridge.c        |   8 +-
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c   |   2 +-
 .../media/deprecated/atmel/atmel-isc-base.c        |   4 +-
 drivers/staging/media/deprecated/atmel/atmel-isc.h |   2 +-
 .../media/deprecated/atmel/atmel-sama5d2-isc.c     |   9 +-
 .../media/deprecated/atmel/atmel-sama7g5-isc.c     |   9 +-
 drivers/staging/media/imx/imx-media-csi.c          |  10 +-
 drivers/staging/media/imx/imx-media-dev-common.c   |   6 +-
 drivers/staging/media/imx/imx-media-dev.c          |   2 +-
 drivers/staging/media/imx/imx-media-of.c           |   4 +-
 drivers/staging/media/imx/imx6-mipi-csi2.c         |  12 +-
 drivers/staging/media/imx/imx8mq-mipi-csi2.c       |  10 +-
 .../staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c |   6 +-
 .../staging/media/sunxi/sun6i-isp/sun6i_isp_proc.h |   2 +-
 drivers/staging/media/tegra-video/vi.c             |  21 +-
 include/media/davinci/vpif_types.h                 |   2 +-
 include/media/v4l2-async.h                         | 238 +++----
 include/media/v4l2-fwnode.h                        |  70 ---
 include/media/v4l2-subdev.h                        |  19 +-
 80 files changed, 1059 insertions(+), 1144 deletions(-)

-- 
Sakari Ailus
