Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D53F74DD9A2
	for <lists+linux-media@lfdr.de>; Fri, 18 Mar 2022 13:19:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236217AbiCRMUT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Mar 2022 08:20:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236205AbiCRMUS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Mar 2022 08:20:18 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9042D27CE22
        for <linux-media@vger.kernel.org>; Fri, 18 Mar 2022 05:18:58 -0700 (PDT)
Received: from perceval.ideasonboard.com (unknown [103.251.226.137])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 89FF32E0;
        Fri, 18 Mar 2022 13:18:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647605937;
        bh=KL5CdfOC2RG04Pu4/WxP5EEpFjg78Szq5z3IWkizIO8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EdUxAYbn8078d0aSyDrE7ewXsl0nuJ5LrvbDj+QRGKxXcmjP9l+dIYdbS4T/v+54p
         pAonq9VrdjWPuBk3Nji6QF24honHZCn5VrKbEtfR3wjFwxVhHBFsOZqrzdbPQORxB8
         Kz2/CkC1QzMgr9qg++LrEhhX/7p0S2LdMjknvVFI=
From:   Umang Jain <umang.jain@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     bingbu.cao@intel.com, sakari.ailus@linux.intel.com,
        libcamera-devel@lists.libcamera.org,
        Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 2/2] media: staging/intel-ipu3: Cleanup dummy buffers via helper
Date:   Fri, 18 Mar 2022 17:48:26 +0530
Message-Id: <20220318121826.877187-3-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220318121826.877187-1-umang.jain@ideasonboard.com>
References: <20220318121826.877187-1-umang.jain@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use an existing helper imgu_video_nodes_exit() on imgu-video-node
initialization failure path to cleanup dummy buffers.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 drivers/staging/media/ipu3/ipu3.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3.c b/drivers/staging/media/ipu3/ipu3.c
index 8e1e9e46e604..0c453b37f8c4 100644
--- a/drivers/staging/media/ipu3/ipu3.c
+++ b/drivers/staging/media/ipu3/ipu3.c
@@ -440,6 +440,16 @@ int imgu_s_stream(struct imgu_device *imgu, int enable)
 	return r;
 }
 
+static void imgu_video_nodes_exit(struct imgu_device *imgu)
+{
+	int i;
+
+	for (i = 0; i < IMGU_MAX_PIPE_NUM; i++)
+		imgu_dummybufs_cleanup(imgu, i);
+
+	imgu_v4l2_unregister(imgu);
+}
+
 static int imgu_video_nodes_init(struct imgu_device *imgu)
 {
 	struct v4l2_pix_format_mplane *fmts[IPU3_CSS_QUEUES] = { NULL };
@@ -489,24 +499,11 @@ static int imgu_video_nodes_init(struct imgu_device *imgu)
 	return 0;
 
 out_cleanup:
-	for (j = 0; j < IMGU_MAX_PIPE_NUM; j++)
-		imgu_dummybufs_cleanup(imgu, j);
-
-	imgu_v4l2_unregister(imgu);
+	imgu_video_nodes_exit(imgu);
 
 	return r;
 }
 
-static void imgu_video_nodes_exit(struct imgu_device *imgu)
-{
-	int i;
-
-	for (i = 0; i < IMGU_MAX_PIPE_NUM; i++)
-		imgu_dummybufs_cleanup(imgu, i);
-
-	imgu_v4l2_unregister(imgu);
-}
-
 /**************** PCI interface ****************/
 
 static irqreturn_t imgu_isr_threaded(int irq, void *imgu_ptr)
-- 
2.31.1

