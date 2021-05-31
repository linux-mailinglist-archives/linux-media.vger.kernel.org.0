Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A22CD3959AB
	for <lists+linux-media@lfdr.de>; Mon, 31 May 2021 13:24:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231404AbhEaL00 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 May 2021 07:26:26 -0400
Received: from comms.puri.sm ([159.203.221.185]:59570 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231426AbhEaL0J (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 May 2021 07:26:09 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 02A32E2129;
        Mon, 31 May 2021 04:24:00 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id FRmpZGmW29Pq; Mon, 31 May 2021 04:23:58 -0700 (PDT)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     martin.kepplinger@puri.sm, festevam@gmail.com, krzk@kernel.org,
        laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        robh@kernel.org
Cc:     devicetree@vger.kernel.org, kernel@pengutronix.de, kernel@puri.sm,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, shawnguo@kernel.org,
        slongerbeam@gmail.com, phone-devel@vger.kernel.org
Subject: [PATCH v2 0/3] media: imx: add support for imx8mq MIPI RX
Date:   Mon, 31 May 2021 13:23:23 +0200
Message-Id: <20210531112326.90094-1-martin.kepplinger@puri.sm>
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch series adds a driver for the i.MX8MQ CSI MIPI receiver / controller.

It includes the driver, the dt-bindings and the DT addition to the SoC dtsi.

Thanks Laurent who helped a lot. I'm happy for any feedback,

                           martin

revision history
----------------
v2: (thank you, Dan and Guido)
among fixes according to v1 reviews, changes include:
* remove status property from dt-bindings example
* define a few bits in order to have less magic values
* use "imx8mq_mipi_csi_" as local function prefix
* read DT properties only during probe()
* remove dead code (log_status)
* add imx8mq_mipi_csi_release_icc()
* fix imx8mq_mipi_csi_init_icc()

v1:
https://lore.kernel.org/linux-media/20210527075407.3180744-1-martin.kepplinger@puri.sm/T/#t


Martin Kepplinger (3):
  dt-bindings: media: document the nxp,imx8mq-mipi-csi2 receiver phy and
    controller
  media: imx: add a driver for i.MX8MQ mipi csi rx phy and controller
  arm64: dts: imx8mq: add mipi csi phy and csi bridge descriptions

 .../bindings/media/nxp,imx8mq-mipi-csi2.yaml  |  162 +++
 arch/arm64/boot/dts/freescale/imx8mq.dtsi     |  102 ++
 drivers/staging/media/imx/Makefile            |    1 +
 drivers/staging/media/imx/imx8mq-mipi-csi2.c  | 1000 +++++++++++++++++
 4 files changed, 1265 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
 create mode 100644 drivers/staging/media/imx/imx8mq-mipi-csi2.c

-- 
2.30.2

