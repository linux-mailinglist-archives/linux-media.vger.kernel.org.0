Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E3D5669369
	for <lists+linux-media@lfdr.de>; Fri, 13 Jan 2023 10:57:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233026AbjAMJ5T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Jan 2023 04:57:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240722AbjAMJ45 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Jan 2023 04:56:57 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BC5663F62
        for <linux-media@vger.kernel.org>; Fri, 13 Jan 2023 01:54:12 -0800 (PST)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <m.tretter@pengutronix.de>)
        id 1pGGlG-0003cp-3C; Fri, 13 Jan 2023 10:54:10 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v2 00/16] media: imx-pxp: add support for i.MX7D
Date:   Fri, 13 Jan 2023 10:54:07 +0100
Message-Id: <20230112-imx-pxp-v2-0-e2281da1db55@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD8qwWMC/y3NQQqDMBCF4avIrDt0kiCKVyldJHGsszAJSZGAe
 PfG4vLnffAOKJyFC0zdAZl3KRJDC/3owK82fBhlbg2atCGlNMpWMdWENBii0Rk/9gM07WxhdNkG
 v17+G5P4542vPWVepP6fXu/z/AEXfxSkeQAAAA==
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Michael Tretter <m.tretter@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fabio Estevam <festevam@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.11.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is v2 of the series to add support for the PXP found on the i.MX7D to the
imx-pxp driver.

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

In v2, I included Laurent's patch series [1], which was based on this series
anyway and added regmap support.

Patch 1 converts the dt-binding to yaml.

Patches 2 to 5 cleanup and refactor the driver in preparation of handling
different PXP versions.

Patches 6 and 7 add the handling of different platforms and the i.MX7d
specific configuration.

Patch 8 adds the device tree node for the PXP to the i.MX7d device tree.

Patches 9 to 15 are the cleanup and enhancement patches to add media
controller support, implement enum_framesizes, and add pxp_read/pxp_write
helpers.

Patch 16 adds regmap support to the driver.

Michael

[0] https://lore.kernel.org/linux-media/20200510223100.11641-1-laurent.pinchart@ideasonboard.com/
[1] https://lore.kernel.org/linux-media/20230112172507.30579-1-laurent.pinchart@ideasonboard.com

---

Changelog

v2:

- fix device tree binding
- reduce log level of PXP version to debug
- drop fallback for missing pdata
- add cleanup and enhancement patches to series
- convert driver to regmap

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
To: linux-media@vger.kernel.org
To: devicetree@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: kernel@pengutronix.de
Cc: linux-imx@nxp.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: Michael Tretter <m.tretter@pengutronix.de>

---
Laurent Pinchart (7):
      media: imx-pxp: Sort headers alphabetically
      media: imx-pxp: Don't set bus_info manually in .querycap()
      media: imx-pxp: Add media controller support
      media: imx-pxp: Pass pixel format value to find_format()
      media: imx-pxp: Implement frame size enumeration
      media: imx-pxp: Introduce pxp_read() and pxp_write() wrappers
      media: imx-pxp: Use non-threaded IRQ

Michael Tretter (9):
      dt-bindings: media: fsl-pxp: convert to yaml
      media: imx-pxp: detect PXP version
      media: imx-pxp: extract helper function to setup data path
      media: imx-pxp: explicitly disable unused blocks
      media: imx-pxp: disable LUT block
      media: imx-pxp: make data_path_ctrl0 platform dependent
      media: imx-pxp: add support for i.MX7D
      ARM: dts: imx7d: add node for PXP
      media: imx-pxp: convert to regmap

 .../devicetree/bindings/media/fsl,imx6ull-pxp.yaml |  82 +++++
 .../devicetree/bindings/media/fsl-pxp.txt          |  26 --
 arch/arm/boot/dts/imx7d.dtsi                       |   9 +
 drivers/media/platform/nxp/imx-pxp.c               | 359 +++++++++++++++------
 4 files changed, 355 insertions(+), 121 deletions(-)
---
base-commit: b7bfaa761d760e72a969d116517eaa12e404c262
change-id: 20230112-imx-pxp-073008b3c857

Best regards,
-- 
Michael Tretter <m.tretter@pengutronix.de>
