Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEB6A7ACA7F
	for <lists+linux-media@lfdr.de>; Sun, 24 Sep 2023 17:33:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229593AbjIXPdI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Sep 2023 11:33:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjIXPdH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Sep 2023 11:33:07 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4E00C2
        for <linux-media@vger.kernel.org>; Sun, 24 Sep 2023 08:32:59 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F4BF842;
        Sun, 24 Sep 2023 17:31:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695569478;
        bh=/0oAKEv8YlmUYXMmA/XORJPqsxReBpyA9zrB7KxoCKU=;
        h=From:To:Cc:Subject:Date:From;
        b=dVwIZLOHFGc0IyAHk4opWtSHEgPV4mP/9z/2/t2sFswszNkOQ7M3BVa+T6GCFyidz
         6i5Y8rsHs/CewoVT1BsNa3wVx6aeZ/pjiGqwuzuSSrw+NSJ6DeoqWNf+RN0K4v8Q72
         J5659jLY6FFb3LKL0rjSoZYqoZLVn93EhQQCkDao=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v4 00/20] media: i2c: imx219: Miscellaneous cleanups and improvements
Date:   Sun, 24 Sep 2023 18:32:49 +0300
Message-ID: <20230924153309.12423-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
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
logs. Compared to v3, patch 15/20 has been added, and the series has
been rebased on top of a merge of Sakari's sensors pull request for v6.7
and a v6.6 fixes branch that will appear in v6.6-rc3. This was necessary
as both of those branches contain imx219 changes that conflict with this
series. As a result of the rebase, patch 15/20 from v3 got dropped.

The changes have been tested on a Raspberry Pi 4, with all the modes
supproted by the driver.

[1] https://lore.kernel.org/linux-media/20230627125109.52354-1-hdegoede@redhat.com/

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
  media: i2c: imx219: Remove unneeded goto
  media: i2c: imx219: Implement .init_cfg() using .set_fmt()
  media: i2c: imx219: Separate horizontal and vertical binning
  media: i2c: imx219: Calculate crop rectangle dynamically
  media: i2c: imx219: Name all subdev state variables 'state'
  media: i2c: imx219: Move variables to inner scope

 drivers/media/i2c/Kconfig  |    1 +
 drivers/media/i2c/imx219.c | 1467 ++++++++++++++++--------------------
 2 files changed, 643 insertions(+), 825 deletions(-)


base-commit: 76d7b38d896f7bc6c65c4bd053df060f3f3dcb90
-- 
Regards,

Laurent Pinchart

