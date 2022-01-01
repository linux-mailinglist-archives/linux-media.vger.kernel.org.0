Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48D4E482824
	for <lists+linux-media@lfdr.de>; Sat,  1 Jan 2022 19:28:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232636AbiAAS2R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Jan 2022 13:28:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230011AbiAAS2Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Jan 2022 13:28:16 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2F8AC061574;
        Sat,  1 Jan 2022 10:28:15 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F2C9DEE;
        Sat,  1 Jan 2022 19:28:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1641061692;
        bh=6mmbplHu3d18tLrZ1TQrfl08usIgDR9QS+aKtCvUTK0=;
        h=From:To:Cc:Subject:Date:From;
        b=F6Ig6KHHAhxnttXLdmo+e40KNpS4jM394SAH3BzNqlgOcn+tBxrqFg9JqW09hAKep
         zUq7cpsfA7hRAo+VP8yoeh/A1bY24y/6TZpxlwgkHQ+qqLqhr3Z1CG2tFlwnL9Zg6V
         qIVfuL8ZFJLzFvDtC2KEk1aLIKVqRhB/IxAcjcxA=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Thomas Nizan <tnizan@witekio.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v2 00/11] media: i2c: max9286: Small new features
Date:   Sat,  1 Jan 2022 20:27:55 +0200
Message-Id: <20220101182806.19311-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This small patch series adds a few new features to the max9286 driver:

- Support for per-port supplies (01/11 and 04/11)
- Remote I2C bus speed selection (02/11 and 09/11)
- GMSL bus width selection (03/11 and 10/11)
- Manual framesync operation (05/11)
- RAW12 support (06/11 and 07/11)

The remaining patches are small cleanups. Please see individual patches
for details.

I'm in two minds about the bus width selection. It would be possible to
query the information from the connected serializers at runtime, using
for instance the .g_mbus_config() subdev operation. On the other hand,
there's *lots* of GMSL-specific bus configuration options, which would
require a rework of .g_mbus_config() to pass a bus-specific structure.
We would then end up having many configuration parameters not specific
to video there (such as the I2C speed for instance). Furthermore, while
some parameters may be different between cameras (high-immunity mode,
for instance, can be configured per port), many need to be identical on
all ports. I'm not sure yet what the best way to address that without an
overcomplicated implementation would be (one option would be to get the
parameters from the first camera and simply ignore conflicting values
reported by other cameras). Thoughts are welcome.

Could someone with RDACM20 cameras test the series ? I'm a bit worried
about patch 11/11 in particular, there's a small risk of regression.

Laurent Pinchart (10):
  dt-bindings: media: i2c: max9286: Add support for per-port supplies
  dt-bindings: media: i2c: max9286: Add property to select I2C speed
  dt-bindings: media: i2c: max9286: Add property to select bus width
  media: i2c: max9286: Support manual framesync operation
  media: i2c: max9286: Rename MAX9286_DATATYPE_RAW11 to RAW12
  media: i2c: max9286: Support 12-bit raw bayer formats
  media: i2c: max9286: Define macros for all bits of register 0x15
  media: i2c: max9286: Configure remote I2C speed from device tree
  media: i2c: max9286: Configure bus width from device tree
  media: i2c: max9286: Select HS as data enable signal

Thomas Nizan (1):
  media: i2c: max9286: Add support for port regulators

 .../bindings/media/i2c/maxim,max9286.yaml     |  28 +-
 drivers/media/i2c/max9286.c                   | 425 +++++++++++++++---
 2 files changed, 387 insertions(+), 66 deletions(-)


base-commit: 68b9bcc8a534cd11fe55f8bc82f948aae7d81b3c
-- 
Regards,

Laurent Pinchart

