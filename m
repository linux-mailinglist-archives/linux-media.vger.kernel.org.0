Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7B4C65EDBF
	for <lists+linux-media@lfdr.de>; Thu,  5 Jan 2023 14:48:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233714AbjAENsM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Jan 2023 08:48:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233616AbjAENrq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Jan 2023 08:47:46 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D49B4D4AD
        for <linux-media@vger.kernel.org>; Thu,  5 Jan 2023 05:47:33 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1pDQai-0003Ql-07; Thu, 05 Jan 2023 14:47:32 +0100
Received: from [2a0a:edc0:0:900:1d::48] (helo=litschi)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mtr@pengutronix.de>)
        id 1pDQag-0040LM-86; Thu, 05 Jan 2023 14:47:30 +0100
Received: from mtr by litschi with local (Exim 4.94.2)
        (envelope-from <mtr@pengutronix.de>)
        id 1pDQaf-000FV7-2O; Thu, 05 Jan 2023 14:47:29 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fabio Estevam <festevam@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH 0/8] media: imx-pxp: add support for i.MX7D
Date:   Thu,  5 Jan 2023 14:47:21 +0100
Message-Id: <20230105134729.59542-1-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series adds support for the PXP found on the i.MX7D to the imx-pxp
driver.

The PXP on the i.MX7D has a few differences compared to the one on the
i.MX6ULL. Especially, it has more processing blocks and slightly different
multiplexers to route the data between the blocks. Therefore, the driver must
configure a different data path depending on the platform.

While the PXP has a version register, the reported version is the same on the
i.MX6ULL and the i.MX7D. Therefore, we cannot use the version register to
change the driver behavior, but have to use the device tree compatible. The
driver still prints the found version to the log to help bringing up the PXP
on further platforms.

The patches are inspired by some earlier patches [0] by Laurent to add PXP
support to the i.MX7d. Compared to the earlier patches, these patches add
different behavior depending on the platform. Furthermore, the patches disable
only the LUT block, but keep the rotator block enabled, as it may now be
configured via the V4L2 rotate control.

Patch 1 converts the dt-binding to yaml.

Patches 2 to 5 cleanup and refactor the driver in preparation of handling
different PXP versions.

Patches 6 and 7 add the handling of different platforms and the i.MX7d
specific configuration.

Patch 8 adds the device tree node for the PXP to the i.MX7d device tree.

Michael

[0] https://lore.kernel.org/linux-media/20200510223100.11641-1-laurent.pinchart@ideasonboard.com/

Michael Tretter (8):
  media: dt-bindings: media: fsl-pxp: convert to yaml
  media: imx-pxp: detect PXP version
  media: imx-pxp: extract helper function to setup data path
  media: imx-pxp: explicitly disable unused blocks
  media: imx-pxp: disable LUT block
  media: imx-pxp: make data_path_ctrl0 platform dependent
  media: imx-pxp: add support for i.MX7D
  ARM: dts: imx7d: add node for PXP

 .../bindings/media/fsl,imx6ull-pxp.yaml       |  62 ++++++++
 .../devicetree/bindings/media/fsl-pxp.txt     |  26 ---
 arch/arm/boot/dts/imx7d.dtsi                  |   9 ++
 drivers/media/platform/nxp/imx-pxp.c          | 148 +++++++++++++++---
 4 files changed, 197 insertions(+), 48 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/fsl,imx6ull-pxp.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/fsl-pxp.txt

-- 
2.30.2

