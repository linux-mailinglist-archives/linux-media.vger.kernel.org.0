Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 234E33B36E8
	for <lists+linux-media@lfdr.de>; Thu, 24 Jun 2021 21:23:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232920AbhFXTZ3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Jun 2021 15:25:29 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:48122 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232904AbhFXTZX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Jun 2021 15:25:23 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15OJMDxC089315;
        Thu, 24 Jun 2021 14:22:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1624562533;
        bh=VZ6m16c9xuSi2HlUS5J832ZblIHytqeoFVX8bO5xugw=;
        h=From:To:CC:Subject:Date;
        b=UMU2l/X1SJCcuzYuNTneRJhfXSeqwnO2q5ccMLc+LDkigT3HwfK9JtRcg2EQBg82I
         88keoB9B/9eF+iABJBex9Bcu7VQZGbycbhhzRkDpQTeMnyXYcDZiT+pSg3g3+g1Bc0
         pTFeS6s4131iSdAANEZeE6V0J5e0x7SRm4cpCNyw=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15OJMDlS085915
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 24 Jun 2021 14:22:13 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 24
 Jun 2021 14:22:13 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 24 Jun 2021 14:22:12 -0500
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15OJM14G120548;
        Thu, 24 Jun 2021 14:22:02 -0500
From:   Pratyush Yadav <p.yadav@ti.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Arnd Bergmann <arnd@arndb.de>, Benoit Parrot <bparrot@ti.com>,
        Bert Vermeulen <bert@biot.com>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Helen Koike <helen.koike@collabora.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Martina Krasteva <martinax.krasteva@intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Mirela Rabulea <mirela.rabulea@nxp.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Pratyush Yadav <p.yadav@ti.com>, Qiushi Wu <wu000273@umn.edu>,
        Raag Jadav <raagjadav@gmail.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Zou Wei <zou_wei@huawei.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
Subject: [PATCH v3 00/11] CSI2RX support on J721E
Date:   Fri, 25 Jun 2021 00:51:49 +0530
Message-ID: <20210624192200.22559-1-p.yadav@ti.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

This series adds support for CSI2 capture on J721E. It includes some
fixes to the Cadence CSI2RX driver, adds runtime PM support to OV5640
driver, and finally adds the TI CSI2RX wrapper driver.

This series used to include the DPHY and DMA engine patches as well, but
they have been split off to facilitate easier merging. Patch 3 is
build-dependent on the DPHY series [0].

The DMA engine patch [1] can go in any order since that is only a run
time dependency. Things probably won't work without it but it will still
build fine.

Tested on TI's J721E with OV5640 sensor.

[0] https://patchwork.kernel.org/project/linux-phy/list/?series=506663&state=%2A&archive=both
[1] https://patchwork.kernel.org/project/linux-dmaengine/patch/20210624182449.31164-1-p.yadav@ti.com/

Changes in v3:
- Clean up the logic in ov5640_s_stream() a bit.
- Use pm_runtime_resume_and_get() instead of pm_runtime_get_sync().
- Rename the label error_pm to disable_pm.
- Use v4l2_get_link_freq() to calculate pixel clock.
- Move DMA related fields in struct ti_csi2rx_dma.
- Protect DMA buffer queue with a spinlock to make sure the queue buffer
  and DMA callback don't race on it.
- Track the current DMA state. It might go idle because of a lack of
  buffers. This state can be used to restart it if needed.
- Do not include the current buffer in the pending queue. It is slightly
  better modelling than leaving it at the head of the pending queue.
- Use the buffer as the callback argument, and add a reference to csi in it.
- If queueing a buffer to DMA fails, the buffer gets leaked and DMA gets
  stalled with. Instead, report the error to vb2 and queue the next
  buffer in the pending queue.
- DMA gets stalled if we run out of buffers since the callback is the
  only one that fires subsequent transfers and it is no longer being
  called. Check for that when queueing buffers and restart DMA if
  needed.
- Do not put of node until we are done using the fwnode.
- Set inital format to UYVY 640x480.
- Add compatible: contains: const: cdns,csi2rx to allow SoC specific
  compatible.
- Add more constraints for data-lanes property.

Changes in v2:
- Use phy_pm_runtime_get_sync() and phy_pm_runtime_put() before making
  calls to set PHY mode, etc. to make sure it is ready.
- Use dmaengine_get_dma_device() instead of directly accessing
  dma->device->dev.
- Do not set dst_addr_width when configuring slave DMA.
- Move to a separate subdir and rename to j721e-csi2rx.c
- Convert compatible to ti,j721e-csi2rx.
- Move to use Media Controller centric APIs.
- Improve cleanup in probe when one of the steps fails.
- Add colorspace to formats database.
- Set hw_revision on media_device.
- Move video device initialization to probe time instead of register time.
- Rename to ti,j721e-csi2rx.yaml
- Add an entry in MAINTAINERS.
- Add a description for the binding.
- Change compatible to ti,j721e-csi2rx to make it SoC specific.
- Remove description from dmas, reg, power-domains.
- Remove a limit of 2 from #address-cells and #size-cells.
- Fix add ^ to csi-bridge subnode regex.
- Make ranges mandatory.
- Add unit address in example.
- Add a reference to cdns,csi2rx in csi-bridge subnode.
- Expand the example to include the csi-bridge subnode as well.
- Re-order subject prefixes.
- Convert OV5640 to use runtime PM and drop Cadence CSI2RX s_power patch.
- Drop subdev call wrappers from cdns-csi2rx.
- Move VPE and CAL to a separate subdir.
- Rename ti-csi2rx.c to j721e-csi2rx.c

Pratyush Yadav (11):
  media: ov5640: Use runtime PM to control sensor power
  media: cadence: csi2rx: Unregister v4l2 async notifier
  media: cadence: csi2rx: Add external DPHY support
  media: cadence: csi2rx: Soft reset the streams before starting capture
  media: cadence: csi2rx: Set the STOP bit when stopping a stream
  media: cadence: csi2rx: Fix stream data configuration
  media: cadence: csi2rx: Populate subdev devnode
  media: Re-structure TI platform drivers
  media: ti: Add CSI2RX support for J721E
  media: dt-bindings: Add DT bindings for TI J721E CSI2RX driver
  media: dt-bindings: Convert Cadence CSI2RX binding to YAML

 .../devicetree/bindings/media/cdns,csi2rx.txt | 100 --
 .../bindings/media/cdns,csi2rx.yaml           | 169 +++
 .../bindings/media/ti,j721e-csi2rx.yaml       | 101 ++
 MAINTAINERS                                   |  10 +-
 drivers/media/i2c/Kconfig                     |   2 +-
 drivers/media/i2c/ov5640.c                    | 127 ++-
 drivers/media/platform/Kconfig                |  12 +
 drivers/media/platform/Makefile               |   2 +-
 drivers/media/platform/cadence/cdns-csi2rx.c  | 189 +++-
 drivers/media/platform/ti/Makefile            |   4 +
 drivers/media/platform/ti/cal/Makefile        |   3 +
 .../{ti-vpe => ti/cal}/cal-camerarx.c         |   0
 .../platform/{ti-vpe => ti/cal}/cal-video.c   |   0
 .../media/platform/{ti-vpe => ti/cal}/cal.c   |   0
 .../media/platform/{ti-vpe => ti/cal}/cal.h   |   0
 .../platform/{ti-vpe => ti/cal}/cal_regs.h    |   0
 .../media/platform/ti/j721e-csi2rx/Makefile   |   2 +
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 978 ++++++++++++++++++
 .../platform/{ti-vpe => ti/vpe}/Makefile      |   4 -
 .../media/platform/{ti-vpe => ti/vpe}/csc.c   |   0
 .../media/platform/{ti-vpe => ti/vpe}/csc.h   |   0
 .../media/platform/{ti-vpe => ti/vpe}/sc.c    |   0
 .../media/platform/{ti-vpe => ti/vpe}/sc.h    |   0
 .../platform/{ti-vpe => ti/vpe}/sc_coeff.h    |   0
 .../media/platform/{ti-vpe => ti/vpe}/vpdma.c |   0
 .../media/platform/{ti-vpe => ti/vpe}/vpdma.h |   0
 .../platform/{ti-vpe => ti/vpe}/vpdma_priv.h  |   0
 .../media/platform/{ti-vpe => ti/vpe}/vpe.c   |   0
 .../platform/{ti-vpe => ti/vpe}/vpe_regs.h    |   0
 29 files changed, 1533 insertions(+), 170 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/cdns,csi2rx.txt
 create mode 100644 Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
 create mode 100644 Documentation/devicetree/bindings/media/ti,j721e-csi2rx.yaml
 create mode 100644 drivers/media/platform/ti/Makefile
 create mode 100644 drivers/media/platform/ti/cal/Makefile
 rename drivers/media/platform/{ti-vpe => ti/cal}/cal-camerarx.c (100%)
 rename drivers/media/platform/{ti-vpe => ti/cal}/cal-video.c (100%)
 rename drivers/media/platform/{ti-vpe => ti/cal}/cal.c (100%)
 rename drivers/media/platform/{ti-vpe => ti/cal}/cal.h (100%)
 rename drivers/media/platform/{ti-vpe => ti/cal}/cal_regs.h (100%)
 create mode 100644 drivers/media/platform/ti/j721e-csi2rx/Makefile
 create mode 100644 drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
 rename drivers/media/platform/{ti-vpe => ti/vpe}/Makefile (78%)
 rename drivers/media/platform/{ti-vpe => ti/vpe}/csc.c (100%)
 rename drivers/media/platform/{ti-vpe => ti/vpe}/csc.h (100%)
 rename drivers/media/platform/{ti-vpe => ti/vpe}/sc.c (100%)
 rename drivers/media/platform/{ti-vpe => ti/vpe}/sc.h (100%)
 rename drivers/media/platform/{ti-vpe => ti/vpe}/sc_coeff.h (100%)
 rename drivers/media/platform/{ti-vpe => ti/vpe}/vpdma.c (100%)
 rename drivers/media/platform/{ti-vpe => ti/vpe}/vpdma.h (100%)
 rename drivers/media/platform/{ti-vpe => ti/vpe}/vpdma_priv.h (100%)
 rename drivers/media/platform/{ti-vpe => ti/vpe}/vpe.c (100%)
 rename drivers/media/platform/{ti-vpe => ti/vpe}/vpe_regs.h (100%)

-- 
2.30.0

