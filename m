Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE45052625F
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 14:53:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380457AbiEMMxR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 08:53:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380445AbiEMMxN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 08:53:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B494A5DE7E
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 05:53:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 52F2461FB6
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 12:53:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 088FBC34100;
        Fri, 13 May 2022 12:53:10 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Johan Fjeldtvedt <johfjeld@cisco.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 1/2] media: v4l2-tpg: add HDMI Video Guard Band test pattern
Date:   Fri, 13 May 2022 14:53:06 +0200
Message-Id: <20220513125307.3494442-2-hverkuil-cisco@xs4all.nl>
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

This inserts 4 pixels of the RGB color 0xab55ab at the left hand side of
the image. This is only done for 3 or 4 byte RGB pixel formats. The HDMI
TMDS encoding of this pixel value equals the Video Guard Band value as
defined by HDMI (see section 5.2.2.1 in the HDMI 1.3 Specification) that
preceeds the first actual pixel of a video line. If an HDMI receiver
doesn't handle this correctly, then it might keep skipping these Video
Guard Band patterns and end up with a shorter video line. So this is a
nice pattern to test with.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/common/v4l2-tpg/v4l2-tpg-core.c | 38 +++++++++++++++++++
 include/media/tpg/v4l2-tpg.h                  | 16 ++++++++
 2 files changed, 54 insertions(+)

diff --git a/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c b/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
index 7607b516a7c4..a67e1b6ea296 100644
--- a/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
+++ b/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
@@ -2402,6 +2402,44 @@ static void tpg_fill_plane_extras(const struct tpg_data *tpg,
 			((params->sav_eav_f ^ vact) << 1) |
 			(hact ^ vact ^ params->sav_eav_f);
 	}
+	if (tpg->insert_hdmi_video_guard_band) {
+		unsigned i;
+
+		switch (tpg->fourcc) {
+		case V4L2_PIX_FMT_BGR24:
+		case V4L2_PIX_FMT_RGB24:
+			for (i = 0; i < 3 * 4; i += 3) {
+				vbuf[i] = 0xab;
+				vbuf[i + 1] = 0x55;
+				vbuf[i + 2] = 0xab;
+			}
+			break;
+		case V4L2_PIX_FMT_RGB32:
+		case V4L2_PIX_FMT_ARGB32:
+		case V4L2_PIX_FMT_XRGB32:
+		case V4L2_PIX_FMT_BGRX32:
+		case V4L2_PIX_FMT_BGRA32:
+			for (i = 0; i < 4 * 4; i += 4) {
+				vbuf[i] = 0x00;
+				vbuf[i + 1] = 0xab;
+				vbuf[i + 2] = 0x55;
+				vbuf[i + 3] = 0xab;
+			}
+			break;
+		case V4L2_PIX_FMT_BGR32:
+		case V4L2_PIX_FMT_XBGR32:
+		case V4L2_PIX_FMT_ABGR32:
+		case V4L2_PIX_FMT_RGBX32:
+		case V4L2_PIX_FMT_RGBA32:
+			for (i = 0; i < 4 * 4; i += 4) {
+				vbuf[i] = 0xab;
+				vbuf[i + 1] = 0x55;
+				vbuf[i + 2] = 0xab;
+				vbuf[i + 3] = 0x00;
+			}
+			break;
+		}
+	}
 }
 
 static void tpg_fill_plane_pattern(const struct tpg_data *tpg,
diff --git a/include/media/tpg/v4l2-tpg.h b/include/media/tpg/v4l2-tpg.h
index 181dcbe777f3..a55088921d1d 100644
--- a/include/media/tpg/v4l2-tpg.h
+++ b/include/media/tpg/v4l2-tpg.h
@@ -210,6 +210,7 @@ struct tpg_data {
 	bool				show_square;
 	bool				insert_sav;
 	bool				insert_eav;
+	bool				insert_hdmi_video_guard_band;
 
 	/* Test pattern movement */
 	enum tpg_move_mode		mv_hor_mode;
@@ -591,6 +592,21 @@ static inline void tpg_s_insert_eav(struct tpg_data *tpg, bool insert_eav)
 	tpg->insert_eav = insert_eav;
 }
 
+/*
+ * This inserts 4 pixels of the RGB color 0xab55ab at the left hand side of the
+ * image. This is only done for 3 or 4 byte RGB pixel formats. This pixel value
+ * equals the Video Guard Band value as defined by HDMI (see section 5.2.2.1
+ * in the HDMI 1.3 Specification) that preceeds the first actual pixel. If the
+ * HDMI receiver doesn't handle this correctly, then it might keep skipping
+ * these Video Guard Band patterns and end up with a shorter video line. So this
+ * is a nice pattern to test with.
+ */
+static inline void tpg_s_insert_hdmi_video_guard_band(struct tpg_data *tpg,
+						      bool insert_hdmi_video_guard_band)
+{
+	tpg->insert_hdmi_video_guard_band = insert_hdmi_video_guard_band;
+}
+
 void tpg_update_mv_step(struct tpg_data *tpg);
 
 static inline void tpg_s_mv_hor_mode(struct tpg_data *tpg,
-- 
2.34.1

