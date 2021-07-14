Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 275BE3C83BB
	for <lists+linux-media@lfdr.de>; Wed, 14 Jul 2021 13:20:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239238AbhGNLXJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jul 2021 07:23:09 -0400
Received: from comms.puri.sm ([159.203.221.185]:36104 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230437AbhGNLXI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jul 2021 07:23:08 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 9FB8BDFAF7;
        Wed, 14 Jul 2021 04:19:46 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id fzSRM8FsYn5l; Wed, 14 Jul 2021 04:19:45 -0700 (PDT)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     martin.kepplinger@puri.sm, festevam@gmail.com, krzk@kernel.org,
        laurent.pinchart@ideasonboard.com
Cc:     devicetree@vger.kernel.org, kernel@pengutronix.de, kernel@puri.sm,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, m.felsch@pengutronix.de,
        mchehab@kernel.org, phone-devel@vger.kernel.org, robh@kernel.org,
        shawnguo@kernel.org, slongerbeam@gmail.com
Subject: [PATCH v6 0/3] media: imx: add support for imx8mq MIPI RX
Date:   Wed, 14 Jul 2021 13:19:28 +0200
Message-Id: <20210714111931.324485-1-martin.kepplinger@puri.sm>
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

hi,

This patch series adds a driver for the i.MX8MQ CSI MIPI receiver / controller.

It includes the driver, the dt-bindings and the DT addition to the SoC dtsi.
I test it using libcamera. Thanks to Laurent who helped a lot. I'm happy for
any feedback,

                           martin

revision history
----------------
v6: (thank you Laurent and Rob)
* add reviewed-by tag to binding
* statically allocate clk_bulk_data
* fix how the hs_settle value is applied
* remove s_power calls
* remove the link_setup() callback implementation and make the link immutable
* more cleanups according to Laurents' review from v5

v5: (thank you Laurent)
* fix reset usage by using the already supported reset controller driver
* remove clko2 (totally unrelated clock / had been included by accident)
* rename pxl clock to ui
https://lore.kernel.org/linux-media/20210618095753.114557-1-martin.kepplinger@puri.sm/

v4: (thank you Rob and Marco)
* create fsl,mipi-phy-gpr custom dt property instead of confusing "phy"
* add imx8mq-specific compatibile to imx8mq.dtsi for future use
https://lore.kernel.org/linux-media/20210614121522.2944593-1-martin.kepplinger@puri.sm/

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

 .../bindings/media/nxp,imx8mq-mipi-csi2.yaml  | 173 ++++
 arch/arm64/boot/dts/freescale/imx8mq.dtsi     | 104 ++
 drivers/staging/media/imx/Makefile            |   1 +
 drivers/staging/media/imx/imx8mq-mipi-csi2.c  | 949 ++++++++++++++++++
 4 files changed, 1227 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
 create mode 100644 drivers/staging/media/imx/imx8mq-mipi-csi2.c

-- 
2.30.2

