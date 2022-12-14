Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECA0B64D382
	for <lists+linux-media@lfdr.de>; Thu, 15 Dec 2022 00:38:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229484AbiLNXif (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Dec 2022 18:38:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbiLNXie (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Dec 2022 18:38:34 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3405A31ECC;
        Wed, 14 Dec 2022 15:38:32 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 582264D5;
        Thu, 15 Dec 2022 00:38:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671061109;
        bh=FGvXeOKlDMtcdEXSasykJvxaikk7DjxWUQGtyiheXDc=;
        h=From:To:Cc:Subject:Date:From;
        b=bwn+vh0TiP8odDCkYWNVmy/jL13TuwGENSBuekw5EgyzzC3CxuC8+cDRDPnLu4SGU
         0yPsqjMB60Xy5VWhpIYbMC8BEMAk1uwrZnc3thSveZKyQBbHVfpDWVgMu7a7QiWraz
         kDDp6sWd9vu4+2Spypt13nTzKLP7sXx2BEHzDXYI=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Thomas Nizan <tnizan@witekio.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v3 00/12] media: i2c: max9286: Small new features
Date:   Thu, 15 Dec 2022 01:38:13 +0200
Message-Id: <20221214233825.13050-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.37.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This small patch series adds a few new features to the max9286 driver:

- Support for per-port supplies (01/12 and 04/12)
- Remote I2C bus speed selection (02/12 and 09/12)
- GMSL bus width selection (03/12 and 10/12)
- Manual framesync operation (05/12)
- RAW12 support (06/12 and 07/12)

The remaining patches are small cleanups. Please see individual patches
for details.

Compared to v2, I've incorporated all review comments and rebased the
series on top of the latest media tree (with a notable conflict due to
the PoC GPIO support that has been merged in the mainline kernel). Most
of v2 has received Reviewed-by tags, only a few patches are missing
them, so I have good hopes to land this in v6.3.

Laurent Pinchart (11):
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
  media: i2c: max9286: Print power-up GMSL link configuration

Thomas Nizan (1):
  media: i2c: max9286: Add support for port regulators

 .../bindings/media/i2c/maxim,max9286.yaml     |  51 +-
 drivers/media/i2c/max9286.c                   | 465 +++++++++++++++---
 2 files changed, 430 insertions(+), 86 deletions(-)


base-commit: 3178804c64ef7c8c87a53cd5bba0b2942dd64fec
-- 
Regards,

Laurent Pinchart

