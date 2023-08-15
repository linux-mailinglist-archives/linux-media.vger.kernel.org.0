Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DD9177D1B8
	for <lists+linux-media@lfdr.de>; Tue, 15 Aug 2023 20:25:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239077AbjHOSYj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Aug 2023 14:24:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239060AbjHOSY2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Aug 2023 14:24:28 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB0A819AF
        for <linux-media@vger.kernel.org>; Tue, 15 Aug 2023 11:24:26 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3309F9CE;
        Tue, 15 Aug 2023 20:23:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1692123792;
        bh=nWLQqX4FvQyfmMkIdc6BRtTEK8ZhvhXMYKEcJv/uXiU=;
        h=From:To:Cc:Subject:Date:From;
        b=pUpjvLs4x+mBfv1Gv3ascnMl2GgN4DrYYFzr22+GAjKge8tvYtbP/rFxNYmfY7AE4
         FWB++NyrpwgqB/Zd3Yog8b09OAHoTdyp+nPIwiOYpWIicn4ecGftfJRo5hkZJ0OlQN
         ryU5pO6paCHV00W7ELHff9NTo2dUy0Y157tYgIX8=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v1 00/12] media: i2c: imx219: Miscellaneous cleanups and improvements
Date:   Tue, 15 Aug 2023 21:24:19 +0300
Message-ID: <20230815182431.18409-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This patch series is a collection of miscellaneous cleanups and
improvements to the imx219 driver.

Most notably, the series starts with converting the driver to the new
CCI helpers ([1]) in 01/12. Unlike the IMX290, IMX296, IMX297 and IMX327
that have little-endian register values, this sensor adheres to the CCI
specification, so the conversion was possible. It caused a regression
that I had a bit of trouble tracking though, which showed that merging
conversion to the CCI helpers without testing would be dangerous.

Patch 04/12 fixes what I believe is an issue with the test pattern
generator configuration in 640x480 mode, and should be the only
functional change in the series.

For details about other patches, please see their individual commit
logs.

The series depends on two fixes for the imx219 driver ([2]) that should
make it to v6.6, while the 12 patches here are v6.7 material.

The changes have been tested on a Raspberry Pi 4, with all the modes
supproted by the driver.

[1] https://lore.kernel.org/linux-media/20230627125109.52354-1-hdegoede@redhat.com/
[2] https://lore.kernel.org/linux-media/20230814193435.24158-1-laurent.pinchart@ideasonboard.com

Laurent Pinchart (12):
  media: i2c: imx219: Convert to CCI register access helpers
  media: i2c: imx219: Drop unused macros
  media: i2c: imx219: Replace register addresses with macros
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

 drivers/media/i2c/Kconfig  |   1 +
 drivers/media/i2c/imx219.c | 668 +++++++++++++------------------------
 2 files changed, 241 insertions(+), 428 deletions(-)

-- 
Regards,

Laurent Pinchart

