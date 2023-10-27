Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD0FD7D946D
	for <lists+linux-media@lfdr.de>; Fri, 27 Oct 2023 11:58:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345668AbjJ0J64 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Oct 2023 05:58:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345452AbjJ0J6z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Oct 2023 05:58:55 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEA8910E
        for <linux-media@vger.kernel.org>; Fri, 27 Oct 2023 02:58:52 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CDDB6BEB;
        Fri, 27 Oct 2023 11:58:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698400717;
        bh=TxZyJ8Mt8ROfs9AakjZbJV3TI5LoGBfn6pugFqDg48Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WUIEvorMMaT5PHSesgbQ/LJ+ZUdaUD6xZpUS1p5/HBI0bLslaKTcsJpAP3Wdjbrx5
         PdCOvFTEtOdOdAKKEqdWcW1IyhgdCGA08Il+LMVzj5rj4K1nc7Vs5EP2kocmnuXXU8
         Bea0EXkjYoOT0HxD+rhfIOo7HHHVtY/XC/AkQ1p8=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Michal Simek <michal.simek@amd.com>
Subject: [PATCH v1 2/9] media: xilinx: csi2rxss: Drop comment blocks for subdev op handlers
Date:   Fri, 27 Oct 2023 12:58:46 +0300
Message-ID: <20231027095853.29057-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231027095853.29057-1-laurent.pinchart@ideasonboard.com>
References: <20231027095853.29057-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The V4L2 subdev operation handlers have short documentation blocks that
merely duplicates information from the V4L2 subdev API documentation.
They offer no value, and are prone to bit-rotting as shown by the
ixcsi2rxss_set_format() documentation being incorrect. Drop them.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../media/platform/xilinx/xilinx-csi2rxss.c   | 59 -------------------
 1 file changed, 59 deletions(-)

diff --git a/drivers/media/platform/xilinx/xilinx-csi2rxss.c b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
index 3e94d4f0b623..bca8ec94ee35 100644
--- a/drivers/media/platform/xilinx/xilinx-csi2rxss.c
+++ b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
@@ -386,14 +386,6 @@ static void xcsi2rxss_log_counters(struct xcsi2rxss_state *state)
 	}
 }
 
-/**
- * xcsi2rxss_log_status - Logs the status of the CSI-2 Receiver
- * @sd: Pointer to V4L2 subdevice structure
- *
- * This function prints the current status of Xilinx MIPI CSI-2
- *
- * Return: 0 on success
- */
 static int xcsi2rxss_log_status(struct v4l2_subdev *sd)
 {
 	struct xcsi2rxss_state *xcsi2rxss = to_xcsi2rxssstate(sd);
@@ -631,16 +623,6 @@ static irqreturn_t xcsi2rxss_irq_handler(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-/**
- * xcsi2rxss_s_stream - It is used to start/stop the streaming.
- * @sd: V4L2 Sub device
- * @enable: Flag (True / False)
- *
- * This function controls the start or stop of streaming for the
- * Xilinx MIPI CSI-2 Rx Subsystem.
- *
- * Return: 0 on success, errors otherwise
- */
 static int xcsi2rxss_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct xcsi2rxss_state *xcsi2rxss = to_xcsi2rxssstate(sd);
@@ -679,16 +661,6 @@ __xcsi2rxss_get_pad_format(struct xcsi2rxss_state *xcsi2rxss,
 	}
 }
 
-/**
- * xcsi2rxss_init_cfg - Initialise the pad format config to default
- * @sd: Pointer to V4L2 Sub device structure
- * @sd_state: Pointer to sub device state structure
- *
- * This function is used to initialize the pad format with the default
- * values.
- *
- * Return: 0 on success
- */
 static int xcsi2rxss_init_cfg(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_state *sd_state)
 {
@@ -706,16 +678,6 @@ static int xcsi2rxss_init_cfg(struct v4l2_subdev *sd,
 	return 0;
 }
 
-/**
- * xcsi2rxss_get_format - Get the pad format
- * @sd: Pointer to V4L2 Sub device structure
- * @sd_state: Pointer to sub device state structure
- * @fmt: Pointer to pad level media bus format
- *
- * This function is used to get the pad format information.
- *
- * Return: 0 on success
- */
 static int xcsi2rxss_get_format(struct v4l2_subdev *sd,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_format *fmt)
@@ -731,19 +693,6 @@ static int xcsi2rxss_get_format(struct v4l2_subdev *sd,
 	return 0;
 }
 
-/**
- * xcsi2rxss_set_format - This is used to set the pad format
- * @sd: Pointer to V4L2 Sub device structure
- * @sd_state: Pointer to sub device state structure
- * @fmt: Pointer to pad level media bus format
- *
- * This function is used to set the pad format. Since the pad format is fixed
- * in hardware, it can't be modified on run time. So when a format set is
- * requested by application, all parameters except the format type is saved
- * for the pad and the original pad format is sent back to the application.
- *
- * Return: 0 on success
- */
 static int xcsi2rxss_set_format(struct v4l2_subdev *sd,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_format *fmt)
@@ -788,14 +737,6 @@ static int xcsi2rxss_set_format(struct v4l2_subdev *sd,
 	return 0;
 }
 
-/*
- * xcsi2rxss_enum_mbus_code - Handle pixel format enumeration
- * @sd: pointer to v4l2 subdev structure
- * @cfg: V4L2 subdev pad configuration
- * @code: pointer to v4l2_subdev_mbus_code_enum structure
- *
- * Return: -EINVAL or zero on success
- */
 static int xcsi2rxss_enum_mbus_code(struct v4l2_subdev *sd,
 				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_mbus_code_enum *code)
-- 
Regards,

Laurent Pinchart

