Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CE8B6987D3
	for <lists+linux-media@lfdr.de>; Wed, 15 Feb 2023 23:30:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbjBOWaL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Feb 2023 17:30:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229705AbjBOWaK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Feb 2023 17:30:10 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5071715545;
        Wed, 15 Feb 2023 14:30:07 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ECC34383;
        Wed, 15 Feb 2023 23:30:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676500205;
        bh=wuX1VZt0T858LjbZibYjh+vwfA2kQppU1KSaFN5knas=;
        h=From:To:Cc:Subject:Date:From;
        b=tO0adn+bBg5xGaoBSPqH82mU3mr9fOg8gJnoicwYhYe2QMWTe0DesyQINgrDcPj2B
         sAurAjSnxDIIroWAHnQ37J1yssjUpf2udaKPwcetQs1Jh2cRePy76XncmgFg9iwYQR
         7HiKIWPsZ2RNalaglxFiA1HJhi3NE6jlay2kggAE=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
Subject: [PATCH v3 00/15] media: i2c: imx290: Mono support, minor fixes, alternate INCK, and more controls
Date:   Thu, 16 Feb 2023 00:29:48 +0200
Message-Id: <20230215223003.30170-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
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

This patch series combines the "[PATCH v2 0/2] Add support for mono
version of Sony IMX290 sensor" ([1]) and "[PATCH v2 00/13] imx290: Minor
fixes, support for alternate INCK, and more ctrls" ([2]) previously
submitted by Dave into a single series.

As promised in my review of v2 of both series, I have tested the changes
with my IMX327 camera sensor, connected to the i.MX8MP ISP, with
libcamera. I haven't noticed any regression (but, full disclaimer, I
haven't tested all the newly features). I think we're thus good to go.

This version handles all review comments from v2, resulting in the
following changes:

- Deprecate the sony,imx290 compatible
- Update the DT example to use the new sony,imx290lqr compatible
- Drop unneeded pointer cast
- Don't move imx290_of_match table
- Fix typos

The code has also been rebased on top of the latest media master branch,
with rebase conflicts and rebase-induced compilation breakages fixed.

The patches are available from

git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git next/media/sensors/imx290

[1] https://lore.kernel.org/linux-media/20230203191644.947643-1-dave.stevenson@raspberrypi.com
[2] https://lore.kernel.org/linux-media/20230203191811.947697-1-dave.stevenson@raspberrypi.com

Dave Stevenson (15):
  media: dt-bindings: media: i2c: Add mono version to IMX290 bindings
  media: i2c: imx290: Add support for the mono sensor variant
  media: i2c: imx290: Match kernel coding style on whitespace
  media: i2c: imx290: Set the colorspace fields in the format
  media: i2c: imx290: Add V4L2_SUBDEV_FL_HAS_EVENTS and subscribe hooks
  media: i2c: imx290: Fix the pixel rate at 148.5Mpix/s
  media: i2c: imx290: Support 60fps in 2 lane operation
  media: i2c: imx290: Use CSI timings as per datasheet
  media: i2c: imx290: Convert V4L2_CID_HBLANK to read/write
  media: i2c: imx290: Convert V4L2_CID_VBLANK to read/write
  media: i2c: imx290: VMAX is mode dependent
  media: i2c: imx290: Remove duplicated write to IMX290_CTRL_07
  media: i2c: imx290: Add support for 74.25MHz external clock
  media: i2c: imx290: Add support for H & V Flips
  media: i2c: imx290: Add the error code to logs in start_streaming

 .../bindings/media/i2c/sony,imx290.yaml       |  24 +-
 drivers/media/i2c/imx290.c                    | 537 ++++++++++++++----
 2 files changed, 442 insertions(+), 119 deletions(-)


base-commit: 83e0f265aa8d0e37cc8e15d318b64da0ec03ff41
-- 
Regards,

Laurent Pinchart

