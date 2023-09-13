Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5948A79EA2C
	for <lists+linux-media@lfdr.de>; Wed, 13 Sep 2023 15:56:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241070AbjIMN4b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Sep 2023 09:56:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239563AbjIMN4a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Sep 2023 09:56:30 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D448919B1
        for <linux-media@vger.kernel.org>; Wed, 13 Sep 2023 06:56:26 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD01172E;
        Wed, 13 Sep 2023 15:54:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694613293;
        bh=tb0zqX3KRPH465GWucNsTG0tgirjN9FvkBCE90rXznc=;
        h=From:To:Cc:Subject:Date:From;
        b=XN/YW4h7VISWmN36A2quoezy3M46xifk1IzKQFtxrNlR5LopuKIcex+BwYKz38ERV
         mpLWnucwlNR+PVVH9BwvrRaNJWbIloJYR6jApNBxNRZGcbXrJNmwBt4Yo+uGwdCKMx
         j16FaQipcFhBcpsM7J12U7fnHHDiw4IWeStSa+JU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v3 00/20] media: i2c: imx219: Miscellaneous cleanups and improvements
Date:   Wed, 13 Sep 2023 16:56:18 +0300
Message-ID: <20230913135638.26277-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This patch series is a collection of miscellaneous cleanups and
improvements to the imx219 driver.

Most notably, the series starts with converting the driver to the new
CCI helpers ([1]) in 01/20. Unlike the IMX290, IMX296, IMX297 and IMX327
that have little-endian register values, this sensor adheres to the CCI
specification, so the conversion was possible. It caused a regression
that I had a bit of trouble tracking though, which showed that merging
conversion to the CCI helpers without testing would be dangerous.

Patch 05/20 fixes what I believe is an issue with the test pattern
generator configuration in 640x480 mode, and should be the only
functional change in the series.

For details about other patches, please see their individual commit
logs.

The series is based on v6.6-rc1, with two additional fixes for the
imx219 driver (posted in [2]) that should make it to v6.6, while the 20
patches here are v6.7 material.

The changes have been tested on a Raspberry Pi 4, with all the modes
supproted by the driver.

[1] https://lore.kernel.org/linux-media/20230627125109.52354-1-hdegoede@redhat.com/
[2] https://lore.kernel.org/linux-media/20230831135747.23148-1-laurent.pinchart@ideasonboard.com

Laurent Pinchart (20):
  media: i2c: imx219: Convert to CCI register access helpers
  media: i2c: imx219: Drop unused macros
  media: i2c: imx219: Replace register addresses with macros
  media: i2c: imx219: Drop IMX219_REG_CSI_LANE_MODE from common regs
    array
  media: i2c: imx219: Fix test pattern window for 640x480 mode
  media: i2c: imx219: Set mode registers programmatically
  media: i2c: imx219: Merge format and binning setting functions
  media: i2c: imx219: Initialize ycbcr_enc
  media: i2c: imx219: Use active crop rectangle to configure registers
  media: i2c: imx219: Infer binning settings from format and crop
  media: i2c: imx219: Access height from active format in
    imx219_set_ctrl
  media: i2c: imx219: Don't store the current mode in the imx219
    structure
  media: i2c: imx219: Drop IMX219_VTS_* macros
  media: i2c: imx219: Group functions by purpose
  media: i2c: imx219: Drop system suspend/resume operations
  media: i2c: imx219: Implement .init_cfg() using .set_fmt()
  media: i2c: imx219: Separate horizontal and vertical binning
  media: i2c: imx219: Calculate crop rectangle dynamically
  media: i2c: imx219: Name all subdev state variables 'state'
  media: i2c: imx219: Move variables to inner scope

 drivers/media/i2c/Kconfig  |    1 +
 drivers/media/i2c/imx219.c | 1511 +++++++++++++++---------------------
 2 files changed, 643 insertions(+), 869 deletions(-)


base-commit: a00aeff52d77a2f592b0fe40a64c50712fa1cbb9
-- 
Regards,

Laurent Pinchart

