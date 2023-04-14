Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C914C6E2215
	for <lists+linux-media@lfdr.de>; Fri, 14 Apr 2023 13:28:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230230AbjDNL2D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Apr 2023 07:28:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230036AbjDNL2B (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Apr 2023 07:28:01 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1E7010F2
        for <linux-media@vger.kernel.org>; Fri, 14 Apr 2023 04:27:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B62D06470C
        for <linux-media@vger.kernel.org>; Fri, 14 Apr 2023 11:27:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FB24C433A0;
        Fri, 14 Apr 2023 11:27:57 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv3 13/18] media: common: saa7146: allow S_STD(G_STD)
Date:   Fri, 14 Apr 2023 13:27:37 +0200
Message-Id: <20230414112742.27749-14-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230414112742.27749-1-hverkuil-cisco@xs4all.nl>
References: <20230414112742.27749-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the requested TV standard is identical to the current
TV standard, then return 0, even when the vb2 queues are
busy.

This fixes a V4L2 compliance issue.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/common/saa7146/saa7146_video.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/media/common/saa7146/saa7146_video.c b/drivers/media/common/saa7146/saa7146_video.c
index 65045f7aa28d..aa1e55c5df71 100644
--- a/drivers/media/common/saa7146/saa7146_video.c
+++ b/drivers/media/common/saa7146/saa7146_video.c
@@ -463,14 +463,19 @@ static int vidioc_s_std(struct file *file, void *fh, v4l2_std_id id)
 
 	DEB_EE("VIDIOC_S_STD\n");
 
+	for (i = 0; i < dev->ext_vv_data->num_stds; i++)
+		if (id & dev->ext_vv_data->stds[i].id)
+			break;
+
+	if (i != dev->ext_vv_data->num_stds &&
+	    vv->standard == &dev->ext_vv_data->stds[i])
+		return 0;
+
 	if (vb2_is_busy(&vv->video_dmaq.q) || vb2_is_busy(&vv->vbi_dmaq.q)) {
 		DEB_D("cannot change video standard while streaming capture is active\n");
 		return -EBUSY;
 	}
 
-	for (i = 0; i < dev->ext_vv_data->num_stds; i++)
-		if (id & dev->ext_vv_data->stds[i].id)
-			break;
 	if (i != dev->ext_vv_data->num_stds) {
 		vv->standard = &dev->ext_vv_data->stds[i];
 		if (NULL != dev->ext_vv_data->std_callback)
-- 
2.39.2

