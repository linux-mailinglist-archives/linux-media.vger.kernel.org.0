Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A7843DDFF0
	for <lists+linux-media@lfdr.de>; Mon,  2 Aug 2021 21:23:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229612AbhHBTXp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Aug 2021 15:23:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbhHBTXp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Aug 2021 15:23:45 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FB32C06175F
        for <linux-media@vger.kernel.org>; Mon,  2 Aug 2021 12:23:35 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (89-27-100-251.bb.dnainternet.fi [89.27.100.251])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 92F2A1B0004C
        for <linux-media@vger.kernel.org>; Mon,  2 Aug 2021 22:23:31 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1627932211;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=bKF99BcppKJMrgtVfFYI/i5XPL5L2+BhxQc06BCFudM=;
        b=nmlTM3jimOcGm86Zrdj0tkLsKX4KICaP+lphPbG4wru0Yba/VlOZzMh+kGQUQKPDRtV0mR
        OBUYueVOwoYWI9w/P6+r9ney8fievV+0fQYo/dmxoLgqqbNoJmhdewF6AdndWijXK1iqjH
        noroagS1gVFOLwflyehh8xSReGyFko2ibvm7Wxnp0gZVZ9Z1m21yGqzMYoSDR/VAEAH2+0
        lw8LQYPQIbtkgMksU6CDaHCOi0APfemf+6hkt6/t/UCDHprVZfZn7yeO85vhIPFmHoOEez
        ue4RsCNylfhXPjnZlO0zEDbX+2DjP4YyWW+Kl5qvTOuYS6gpBZYOGjWPiy2C/Q==
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 34D6E634C87
        for <linux-media@vger.kernel.org>; Mon,  2 Aug 2021 22:22:25 +0300 (EEST)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.eu)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1mAdWx-0002VJ-Mt
        for linux-media@vger.kernel.org; Mon, 02 Aug 2021 22:23:19 +0300
Date:   Mon, 2 Aug 2021 22:23:19 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for 5.15] rcar improvements, V4L2 async notifier and
 mt9p031 patches
Message-ID: <20210802192319.GL3@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1627932211;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=bKF99BcppKJMrgtVfFYI/i5XPL5L2+BhxQc06BCFudM=;
        b=pDp7yOWcbmUM2dAzc/T4TmeheaBKdJvLgFikLJlH4C62uMw1WdOAJ2urE5xCdsHPv6Bpy2
        qh/tNPGm1mEZs0cqtT5EEyOsW0hQv/x+aQtaMlBVl2WYFEe+YfcvcRtt84qDJCiKeF4gru
        HK0irpquTDBP7O3PphE2iXVeYWPEH+INVr8PA8p5pMRqXjKfWkCYEUoWsh0T0Xgx160zuv
        rJpXgmNZjII/Z4ukOf2br/y42z8Z5j6lKRHLuokvcQKDv58o09qreSrC1HO0cKno52b1yN
        jdCHXEb3jJNUA9tBZFXVp9RiNw3rjFqfG2VEKGROGlR6UEMuR5p/Xiyfb85wjw==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1627932211; a=rsa-sha256;
        cv=none;
        b=D9B9BKkdZ+wZFEXdaBV6WHQn0MwrZkM22fwpwWokLCpBnTIud0PZ65fKyu3Y+RmjEBHIRB
        T7tepfZolgnTnhzO+0CQEFzPmOA06HJQiENeFOuKK48QP3fnaMEayhLQAgnQiHzwuEuI7S
        vVEgV5rZBQAI4uUIRT6lUts1S/CbUb1Lrfx3iA0PdN5a0V7v2EC1EcRFzoZL2cNN4O9AT8
        mya8S4a/2+hxWrP95pKV+Wok1hlMBuydguA8Z9P5RTmO8VP/FlndVKp8LfNkYVbQPJzOIR
        f25x2vJNkVP8JAfdYBC2e8FCB0Vis6Bq5Kw98DT6k8VeXoUnqZ6tTb7bjzaJXA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

I've rebased the set on media-stage and addressed the rcar-vin warning in
the notifier rename patch (it's v3.3 on the list, the subject is "v4l:
async: Rename async nf functions, clean up long lines". As of v2, this also
includes i.MX8 changes.

Additionally there are a bunch of mt9p031 patches. There are a few warnings
of not using BIT() macros in them but they're fixed later on in the set
when all instances in the driver get fixed.

Please pull.


The following changes since commit e76897000f906567ec94864c65a81931c39d6789:

  media: venus: venc: add support for V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM control (2021-08-02 09:26:38 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.15-2.1-signed

for you to fetch changes up to 4be23fd439dcfc6fbd9b2a6c5f5b8628b91fa4d8:

  media: dt-bindings: mt9p031: Add missing required properties (2021-08-02 21:38:24 +0300)

----------------------------------------------------------------
V4L2 patches for 5.15

----------------------------------------------------------------
Christian Hemp (1):
      media: mt9p031: Make pixel clock polarity configurable by DT

Dirk Bender (1):
      media: mt9p031: Fix corrupted frame after restarting stream

Enrico Scholz (1):
      media: mt9p031: Read back the real clock rate

Niklas Söderlund (15):
      media: dt-bindings: media: renesas,csi2: Add r8a779a0 support
      rcar-csi2: Add r8a779a0 support
      rcar-vin: Refactor controls creation for video device
      rcar-vin: Fix error paths for rvin_mc_init()
      rcar-vin: Improve async notifier cleanup paths
      rcar-vin: Improve reuse of parallel notifier
      rcar-vin: Rename array storing subdevice information
      rcar-vin: Move group async notifier
      rcar-vin: Extend group notifier DT parser to work with any port
      rcar-vin: Create a callback to setup media links
      rcar-vin: Specify media device ops at group creation time
      rcar-vin: Move and rename CSI-2 link notifications
      rcar-vin: Add r8a779a0 support
      media: rcar-vin: Remove explicit device availability check
      media: v4l2-fwnode: Simplify v4l2_async_nf_parse_fwnode_endpoints()

Sakari Ailus (1):
      v4l: async: Rename async nf functions, clean up long lines

Stefan Riedmueller (3):
      media: mt9p031: Use BIT macro
      media: dt-bindings: mt9p031: Convert bindings to yaml
      media: dt-bindings: mt9p031: Add missing required properties

 .../bindings/media/i2c/aptina,mt9p031.yaml         |  108 ++
 .../devicetree/bindings/media/i2c/mt9p031.txt      |   40 -
 .../devicetree/bindings/media/renesas,csi2.yaml    |    1 +
 Documentation/driver-api/media/v4l2-subdev.rst     |   14 +-
 MAINTAINERS                                        |    1 +
 drivers/media/i2c/Kconfig                          |    1 +
 drivers/media/i2c/max9286.c                        |   17 +-
 drivers/media/i2c/mt9p031.c                        |   80 +-
 drivers/media/i2c/st-mipid02.c                     |   22 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c      |   17 +-
 drivers/media/platform/am437x/am437x-vpfe.c        |   19 +-
 drivers/media/platform/atmel/atmel-isc-base.c      |    4 +-
 drivers/media/platform/atmel/atmel-isi.c           |   17 +-
 drivers/media/platform/atmel/atmel-sama5d2-isc.c   |   15 +-
 drivers/media/platform/atmel/atmel-sama7g5-isc.c   |   15 +-
 drivers/media/platform/cadence/cdns-csi2rx.c       |   14 +-
 drivers/media/platform/davinci/vpif_capture.c      |   21 +-
 drivers/media/platform/exynos4-is/media-dev.c      |   20 +-
 drivers/media/platform/marvell-ccic/cafe-driver.c  |    9 +-
 drivers/media/platform/marvell-ccic/mcam-core.c    |   10 +-
 drivers/media/platform/marvell-ccic/mmp-driver.c   |    6 +-
 drivers/media/platform/omap3isp/isp.c              |   21 +-
 drivers/media/platform/pxa_camera.c                |   26 +-
 drivers/media/platform/qcom/camss/camss.c          |   18 +-
 drivers/media/platform/rcar-vin/rcar-core.c        | 1077 +++++++++++---------
 drivers/media/platform/rcar-vin/rcar-csi2.c        |  210 +++-
 drivers/media/platform/rcar-vin/rcar-dma.c         |   22 +-
 drivers/media/platform/rcar-vin/rcar-vin.h         |   25 +-
 drivers/media/platform/rcar_drif.c                 |   14 +-
 drivers/media/platform/renesas-ceu.c               |   29 +-
 .../media/platform/rockchip/rkisp1/rkisp1-dev.c    |   17 +-
 drivers/media/platform/stm32/stm32-dcmi.c          |   18 +-
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c |   12 +-
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c |   19 +-
 drivers/media/platform/ti-vpe/cal.c                |   16 +-
 drivers/media/platform/video-mux.c                 |   17 +-
 drivers/media/platform/xilinx/xilinx-vipp.c        |   17 +-
 drivers/media/v4l2-core/v4l2-async.c               |  168 ++-
 drivers/media/v4l2-core/v4l2-fwnode.c              |   83 +-
 drivers/staging/media/imx/imx-media-csi.c          |   17 +-
 drivers/staging/media/imx/imx-media-dev-common.c   |    7 +-
 drivers/staging/media/imx/imx-media-dev.c          |    6 +-
 drivers/staging/media/imx/imx-media-of.c           |    6 +-
 drivers/staging/media/imx/imx6-mipi-csi2.c         |   17 +-
 drivers/staging/media/imx/imx7-media-csi.c         |   24 +-
 drivers/staging/media/imx/imx7-mipi-csis.c         |   16 +-
 drivers/staging/media/imx/imx8mq-mipi-csi2.c       |   16 +-
 drivers/staging/media/tegra-video/vi.c             |   17 +-
 include/media/i2c/mt9p031.h                        |    1 +
 include/media/v4l2-async.h                         |  105 +-
 include/media/v4l2-fwnode.h                        |   12 +-
 51 files changed, 1451 insertions(+), 1053 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/aptina,mt9p031.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/mt9p031.txt

-- 
Kind regards,

Sakari Ailus
