Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAFB566C2E5
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 15:56:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232771AbjAPO4U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 09:56:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232373AbjAPOz4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 09:55:56 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B1D9241D6
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 06:44:55 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9E283AD5;
        Mon, 16 Jan 2023 15:44:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673880293;
        bh=KXIehFNye96owD7YbN2/J9GGH3q37VLWaZYnGUkvtTQ=;
        h=From:To:Cc:Subject:Date:From;
        b=tFdXfbqKdHOOueFrbqxP/WYfIoGI6TenkzbiRwE17iVPqibpMHajHtZq8A+bLxeeT
         /AzZTLxE+229Um9cE597sYfIi45mzhjMC9poSC89y4W4kGSKVVYqP/OvZzPucDNGnE
         lHakjjhFf+nYVJFkR6WEMJbDjuRRk9SYdb95nlEw=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v3 00/17] media: i2c: imx290: Miscellaneous improvements
Date:   Mon, 16 Jan 2023 16:44:37 +0200
Message-Id: <20230116144454.1012-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.38.2
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
active state (11/17) and runtime PM autosuspend (13/17). Please see
invididual patches for details.

Laurent Pinchart (17):
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
  media: i2c: imx290: Initialize runtime PM before subdev
  media: i2c: imx290: Configure data lanes at start time
  media: i2c: imx290: Simplify imx290_set_data_lanes()
  media: i2c: imx290: Handle error from imx290_set_data_lanes()

 drivers/media/i2c/imx290.c | 1123 +++++++++++++++++++-----------------
 1 file changed, 600 insertions(+), 523 deletions(-)


base-commit: b7bfaa761d760e72a969d116517eaa12e404c262
-- 
Regards,

Laurent Pinchart

