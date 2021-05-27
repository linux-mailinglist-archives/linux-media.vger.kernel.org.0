Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9086C3928FB
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 09:54:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235165AbhE0H4Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 May 2021 03:56:25 -0400
Received: from comms.puri.sm ([159.203.221.185]:53418 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235054AbhE0H4Q (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 May 2021 03:56:16 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 2DF39E204A;
        Thu, 27 May 2021 00:54:42 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id loOtPd2eyV9H; Thu, 27 May 2021 00:54:41 -0700 (PDT)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        robh@kernel.org
Cc:     shawnguo@kernel.org, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, slongerbeam@gmail.com, kernel@puri.sm,
        krzk@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
        Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: [PATCH v1 0/3] media: imx: add support for imx8mq MIPI RX
Date:   Thu, 27 May 2021 09:54:04 +0200
Message-Id: <20210527075407.3180744-1-martin.kepplinger@puri.sm>
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch series adds a driver for the i.MX8MQ CSI MIPI receiver / controller.

It includes the driver, the dt-bindings and the DT addition to the SoC dtsi.

I'll send the sensor driver I'm using (that will use this code via the
imx8mq-librem5 board) later, if that's ok.

Thanks Laurent, who helped a lot. I'm happy for any feedback,

                           martin

Martin Kepplinger (3):
  dt-bindings: media: document the nxp,imx8mq-mipi-csi2 receiver phy and
    controller
  media: imx: add a driver for i.MX8MQ mipi csi rx phy and controller
  arm64: dts: imx8mq: add mipi csi phy and csi bridge descriptions

 .../bindings/media/nxp,imx8mq-mipi-csi2.yaml  |  151 +++
 arch/arm64/boot/dts/freescale/imx8mq.dtsi     |  102 ++
 drivers/staging/media/imx/Makefile            |    1 +
 drivers/staging/media/imx/imx8mq-mipi-csi2.c  | 1023 +++++++++++++++++
 4 files changed, 1277 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
 create mode 100644 drivers/staging/media/imx/imx8mq-mipi-csi2.c

-- 
2.30.2

