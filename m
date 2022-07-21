Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBD8957C654
	for <lists+linux-media@lfdr.de>; Thu, 21 Jul 2022 10:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbiGUIfq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jul 2022 04:35:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229724AbiGUIfp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jul 2022 04:35:45 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A9AB1180F
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 01:35:44 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8132C496;
        Thu, 21 Jul 2022 10:35:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1658392542;
        bh=1juczrtp7uT8kwr/XoH7Bty+kWRnM5gNoNzPeqcSWk8=;
        h=From:To:Cc:Subject:Date:From;
        b=GqQgU/uFfSaoPLlAwDcIGzUH0NgKAbCaYNrHG4mhka1O5uzDY90xI3BXYul7siTDz
         JZIdt856TpjvCDwY4Tf/0KV2Sq/UH++dN7Zg4/Pyxvy90DU45Q/tj8dcLq1YtfiLcD
         3CwAgV+x/E/zfrdXeZImiXKYhLx/gDeGj5U56/UU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 00/19] media: i2c: imx290: Miscellaneous improvements
Date:   Thu, 21 Jul 2022 11:35:21 +0300
Message-Id: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
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

This patch series gathers miscellaneous improvements for the imx290
driver. The most notable changes on the kernel side is patch 07/19 that
simplifies register access, and on the userspace API side patches 14/19,
15/19 and 18/19 that extend the driver with controls and selection
rectangles required by libcamera.

Laurent Pinchart (19):
  media: i2c: imx290: Use device lock for the control handler
  media: i2c: imx290: Print error code when I2C transfer fails
  media: i2c: imx290: Specify HMAX values in decimal
  media: i2c: imx290: Replace macro with explicit ARRAY_SIZE()
  media: i2c: imx290: Drop imx290_write_buffered_reg()
  media: i2c: imx290: Drop regmap cache
  media: i2c: imx290: Support variable-sized registers
  media: i2c: imx290: Correct register sizes
  media: i2c: imx290: Simplify error handling when writing registers
  media: i2c: imx290: Define more register macros
  media: i2c: imx290: Add exposure time control
  media: i2c: imx290: Fix max gain value
  media: i2c: imx290: Split control initialization to separate function
  media: i2c: imx290: Implement HBLANK and VBLANK controls
  media: i2c: imx290: Create controls for fwnode properties
  media: i2c: imx290: Move registers with fixed value to init array
  media: i2c: imx290: Factor out format retrieval to separate function
  media: i2c: imx290: Add crop selection targets support
  media: i2c: imx290: Replace GAIN control with ANALOGUE_GAIN

 drivers/media/i2c/imx290.c | 781 ++++++++++++++++++++++---------------
 1 file changed, 458 insertions(+), 323 deletions(-)

-- 
Regards,

Laurent Pinchart

