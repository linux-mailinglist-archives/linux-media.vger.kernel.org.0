Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80885634A12
	for <lists+linux-media@lfdr.de>; Tue, 22 Nov 2022 23:35:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235174AbiKVWdM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Nov 2022 17:33:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234850AbiKVWdK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Nov 2022 17:33:10 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BED929340
        for <linux-media@vger.kernel.org>; Tue, 22 Nov 2022 14:33:08 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5F14C1180;
        Tue, 22 Nov 2022 23:33:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669156386;
        bh=fBlm4x1yGckrH7aLAoOXMhpo0e+6xKhp4SvukZL4zwU=;
        h=From:To:Cc:Subject:Date:From;
        b=hfl2T+eUa23Kg8wfyqKU+ihwjRoPm1i/eamr5UBW54Svij06r8on3TBNSvS4dLA+L
         D9o5qfCx/1CFOQVpu6AJrcsvyjZ/J8xcxPaDwljFugHuTTJhWLWZZ12vvCxQO1DG75
         Wvjoj7A3oAj4kxfKQymHisH7GBYpvD7nPgoVOVDM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH v1 00/15] media: i2c: imx290: Miscellaneous improvements
Date:   Wed, 23 Nov 2022 00:32:35 +0200
Message-Id: <20221122223250.21233-1-laurent.pinchart@ideasonboard.com>
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

This patch series contains miscellaneous cleanups and improvements for
the imx290 driver. The most notable changes are usage of the V4L2 subdev
active state (11/15) and runtime PM autosuspend (13/15). Please see
invididual patches for details.

Laurent Pinchart (15):
  media: i2c: imx290: Group functions in sections
  media: i2c: imx290: Factor out subdev init and cleanup to functions
  media: i2c: imx290: Factor out control update code to a function
  media: i2c: imx290: Access link_freq_index directly
  media: i2c: imx290: Pass format and mode to imx290_calc_pixel_rate()
  media: i2c: imx290: Compute pixel rate and blanking in one place
  media: i2c: imx290: Factor out black level setting to a function
  media: i2c: imx290: Factor out DT parsing to separate function
  media: i2c: imx290: Use dev_err_probe()
  media: i2c: imx290: Factor out clock initialization to separate
    function
  media: i2c: imx290: Use V4L2 subdev active state
  media: i2c: imx290: Rename, extend and expand usage of imx290_pixfmt
  media: i2c: imx290: Use runtime PM autosuspend
  media: i2c: imx290: Configure data lanes at start time
  media: i2c: imx290: Simplify imx290_set_data_lanes()

 drivers/media/i2c/imx290.c | 1007 +++++++++++++++++++-----------------
 1 file changed, 523 insertions(+), 484 deletions(-)

-- 
Regards,

Laurent Pinchart

