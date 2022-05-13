Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C748D52625C
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 14:53:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380455AbiEMMxS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 08:53:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380448AbiEMMxP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 08:53:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E24715E163
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 05:53:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7D62661FD1
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 12:53:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DDB9C34114;
        Fri, 13 May 2022 12:53:12 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Johan Fjeldtvedt <johfjeld@cisco.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 2/2] media: vivid: add HDMI Video Guard Band control
Date:   Fri, 13 May 2022 14:53:07 +0200
Message-Id: <20220513125307.3494442-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220513125307.3494442-1-hverkuil-cisco@xs4all.nl>
References: <20220513125307.3494442-1-hverkuil-cisco@xs4all.nl>
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

Add a vivid control to insert the HDMI Video Guard Band in the
image.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/test-drivers/vivid/vivid-ctrls.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c b/drivers/media/test-drivers/vivid/vivid-ctrls.c
index e7516dc1227b..7ff8fdfda28e 100644
--- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
+++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
@@ -46,6 +46,7 @@
 #define VIVID_CID_INSERT_SAV		(VIVID_CID_VIVID_BASE + 6)
 #define VIVID_CID_INSERT_EAV		(VIVID_CID_VIVID_BASE + 7)
 #define VIVID_CID_VBI_CAP_INTERLACED	(VIVID_CID_VIVID_BASE + 8)
+#define VIVID_CID_INSERT_HDMI_VIDEO_GUARD_BAND (VIVID_CID_VIVID_BASE + 9)
 
 #define VIVID_CID_HFLIP			(VIVID_CID_VIVID_BASE + 20)
 #define VIVID_CID_VFLIP			(VIVID_CID_VIVID_BASE + 21)
@@ -474,6 +475,9 @@ static int vivid_vid_cap_s_ctrl(struct v4l2_ctrl *ctrl)
 	case VIVID_CID_INSERT_EAV:
 		tpg_s_insert_eav(&dev->tpg, ctrl->val);
 		break;
+	case VIVID_CID_INSERT_HDMI_VIDEO_GUARD_BAND:
+		tpg_s_insert_hdmi_video_guard_band(&dev->tpg, ctrl->val);
+		break;
 	case VIVID_CID_HFLIP:
 		dev->sensor_hflip = ctrl->val;
 		tpg_s_hflip(&dev->tpg, dev->sensor_hflip ^ dev->hflip);
@@ -660,6 +664,15 @@ static const struct v4l2_ctrl_config vivid_ctrl_insert_eav = {
 	.step = 1,
 };
 
+static const struct v4l2_ctrl_config vivid_ctrl_insert_hdmi_video_guard_band = {
+	.ops = &vivid_vid_cap_ctrl_ops,
+	.id = VIVID_CID_INSERT_HDMI_VIDEO_GUARD_BAND,
+	.name = "Insert Video Guard Band",
+	.type = V4L2_CTRL_TYPE_BOOLEAN,
+	.max = 1,
+	.step = 1,
+};
+
 static const struct v4l2_ctrl_config vivid_ctrl_hflip = {
 	.ops = &vivid_vid_cap_ctrl_ops,
 	.id = VIVID_CID_HFLIP,
@@ -1638,6 +1651,7 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
 		v4l2_ctrl_new_custom(hdl_vid_cap, &vivid_ctrl_vflip, NULL);
 		v4l2_ctrl_new_custom(hdl_vid_cap, &vivid_ctrl_insert_sav, NULL);
 		v4l2_ctrl_new_custom(hdl_vid_cap, &vivid_ctrl_insert_eav, NULL);
+		v4l2_ctrl_new_custom(hdl_vid_cap, &vivid_ctrl_insert_hdmi_video_guard_band, NULL);
 		v4l2_ctrl_new_custom(hdl_vid_cap, &vivid_ctrl_reduced_fps, NULL);
 		if (show_ccs_cap) {
 			dev->ctrl_has_crop_cap = v4l2_ctrl_new_custom(hdl_vid_cap,
-- 
2.34.1

