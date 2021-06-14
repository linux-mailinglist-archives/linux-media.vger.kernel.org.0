Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B4E13A6657
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 14:16:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233278AbhFNMSS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 08:18:18 -0400
Received: from comms.puri.sm ([159.203.221.185]:56530 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232559AbhFNMSS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 08:18:18 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 639BCE145C;
        Mon, 14 Jun 2021 05:15:45 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id GxXrigckZaEu; Mon, 14 Jun 2021 05:15:44 -0700 (PDT)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     martin.kepplinger@puri.sm, laurent.pinchart@ideasonboard.com
Cc:     devicetree@vger.kernel.org, festevam@gmail.com,
        kernel@pengutronix.de, kernel@puri.sm, krzk@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mchehab@kernel.org,
        phone-devel@vger.kernel.org, robh@kernel.org, shawnguo@kernel.org,
        slongerbeam@gmail.com, m.felsch@pengutronix.de
Subject: [PATCH v4 0/3] media: imx: add support for imx8mq MIPI RX
Date:   Mon, 14 Jun 2021 14:15:19 +0200
Message-Id: <20210614121522.2944593-1-martin.kepplinger@puri.sm>
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

hi,

This patch series adds a driver for the i.MX8MQ CSI MIPI receiver / controller.

It includes the driver, the dt-bindings and the DT addition to the SoC dtsi.

This is the vendor driver I'm basing the hardware-side of the driver on:
https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/media/platform/imx8/mxc-mipi-csi2_yav.c?h=imx_5.4.70_2.3.0

Thanks Laurent who helped a lot. I'm happy for any feedback,

                           martin

revision history
----------------
v4: (thank you Rob and Marco)
* create fsl,mipi-phy-gpr custom dt property instead of confusing "phy"
* add imx8mq-specific compatibile to imx8mq.dtsi for future use

v3: (thank you, Rob and Laurent)
among minor other things according to v2 review, changes include:
* better describe the clocks
* rename DT property "phy-reset" to "reset" and "phy-gpr" to "phy"
https://lore.kernel.org/linux-media/20210608104128.1616028-1-martin.kepplinger@puri.sm/T/#t

v2: (thank you, Dan and Guido)
among fixes according to v1 reviews, changes include:
* remove status property from dt-bindings example
* define a few bits in order to have less magic values
* use "imx8mq_mipi_csi_" as local function prefix
* read DT properties only during probe()
* remove dead code (log_status)
* add imx8mq_mipi_csi_release_icc()
* fix imx8mq_mipi_csi_init_icc()
https://lore.kernel.org/linux-media/20210531112326.90094-1-martin.kepplinger@puri.sm/

v1:
https://lore.kernel.org/linux-media/20210527075407.3180744-1-martin.kepplinger@puri.sm/T/#t

Martin Kepplinger (3):
  dt-bindings: media: document the nxp,imx8mq-mipi-csi2 receiver phy and
    controller
  media: imx: add a driver for i.MX8MQ mipi csi rx phy and controller
  arm64: dts: imx8mq: add mipi csi phy and csi bridge descriptions

 .../bindings/media/nxp,imx8mq-mipi-csi2.yaml  | 171 +++
 arch/arm64/boot/dts/freescale/imx8mq.dtsi     | 102 ++
 drivers/staging/media/imx/Makefile            |   1 +
 drivers/staging/media/imx/imx8mq-mipi-csi2.c  | 994 ++++++++++++++++++
 4 files changed, 1268 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
 create mode 100644 drivers/staging/media/imx/imx8mq-mipi-csi2.c

-- 
2.30.2

