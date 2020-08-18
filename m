Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDCC62487C7
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 16:37:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726917AbgHROh3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 10:37:29 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:60459 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726145AbgHROhX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 10:37:23 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 82jnkV8V2uuXO82jpkcevN; Tue, 18 Aug 2020 16:37:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1597761441; bh=irTPz7VAgrPkVcy8x74VB4PbDNhcURoddb11tRSn5bk=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=oL8xZ3ukMOngATrBvAtRGAjDTaCy9zpWUofH7TKTuEBNdOMSPD91jJsFwJHZ6KLSH
         ee11OTGg2+gAU74KdlmeNzXDBjhBSfmWMVM4mG7K96jkw33J9TUB8hwPK1b81VL28/
         riB38oV8fai/13EyucxF+Ql3Rn5Y+7Lsc/khIQsshdjHV8ETxnvjx1eOQ9nZHeimBO
         Y59zT+19OX5TTUlRkK60QPuuzxM2//V6PEnNXAa1qKYe2zZpno3rhydJgSWG+lRsUL
         VJ8l3noDsDFX8aYqhhHAR5toMWFbBAXwUSqui91O7u2OE0AxlI5o5oM9Ceiyd92L65
         NUqSVYzfV3wNg==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 02/12] vivid: add read-only int32 control
Date:   Tue, 18 Aug 2020 16:37:09 +0200
Message-Id: <20200818143719.102128-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200818143719.102128-1-hverkuil-cisco@xs4all.nl>
References: <20200818143719.102128-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfCuwSrPvT4fumm6uq5Q5WMyOX6OnYFqvqUTKnnAc42oTX5UrWuzWMQXEHZ0Xwab3bjAqBvapkeMtcnah8py0+THUdibAVA3JlkwbJKBA3FfrJVRuZCf9
 MutHBxYoEallZtP/q0OB2XnCJYFdu6h4EqCQrwiCWra8okfqXdZAkac5bbCbmkYM4fe4xJG4EgawT0xEbOL5+hT3oI9SgWjgRVgJ29iPievIqXhZJd6d629a
 vLCVQBuRiPUnJBSOtzjJGfW8g2/2zvya2zTX+mLp3FNEr3SVaCewyR1Wov6ClyHz5BVDVJeeN6e+zXNlMbcW5xoP9uhUmaOfWpjS5OYLoWNoNuaLH/wbAw26
 Wji31XDc
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This read-only int32 control is used to test read-only controls in
combination with requests. It is set by the driver to the buffer sequence
counter module 256.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/test-drivers/vivid/vivid-core.h       |  1 +
 drivers/media/test-drivers/vivid/vivid-ctrls.c      | 13 +++++++++++++
 .../media/test-drivers/vivid/vivid-kthread-cap.c    | 10 ++++++----
 3 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-core.h b/drivers/media/test-drivers/vivid/vivid-core.h
index 99e69b8f770f..058a12c6890e 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.h
+++ b/drivers/media/test-drivers/vivid/vivid-core.h
@@ -230,6 +230,7 @@ struct vivid_dev {
 	struct v4l2_ctrl		*string;
 	struct v4l2_ctrl		*bitmask;
 	struct v4l2_ctrl		*int_menu;
+	struct v4l2_ctrl		*ro_int32;
 	struct v4l2_ctrl		*test_pattern;
 	struct v4l2_ctrl		*colorspace;
 	struct v4l2_ctrl		*rgb_range_cap;
diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c b/drivers/media/test-drivers/vivid/vivid-ctrls.c
index 334130568dcb..f16910ceaa77 100644
--- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
+++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
@@ -33,6 +33,7 @@
 #define VIVID_CID_U16_MATRIX		(VIVID_CID_CUSTOM_BASE + 9)
 #define VIVID_CID_U8_4D_ARRAY		(VIVID_CID_CUSTOM_BASE + 10)
 #define VIVID_CID_AREA			(VIVID_CID_CUSTOM_BASE + 11)
+#define VIVID_CID_RO_INTEGER		(VIVID_CID_CUSTOM_BASE + 12)
 
 #define VIVID_CID_VIVID_BASE		(0x00f00000 | 0xf000)
 #define VIVID_CID_VIVID_CLASS		(0x00f00000 | 1)
@@ -280,6 +281,17 @@ static const struct v4l2_ctrl_config vivid_ctrl_area = {
 	.p_def.p_const = &area,
 };
 
+static const struct v4l2_ctrl_config vivid_ctrl_ro_int32 = {
+	.ops = &vivid_user_gen_ctrl_ops,
+	.id = VIVID_CID_RO_INTEGER,
+	.name = "Read-Only Integer 32 Bits",
+	.type = V4L2_CTRL_TYPE_INTEGER,
+	.flags = V4L2_CTRL_FLAG_READ_ONLY,
+	.min = 0,
+	.max = 255,
+	.step = 1,
+};
+
 /* Framebuffer Controls */
 
 static int vivid_fb_s_ctrl(struct v4l2_ctrl *ctrl)
@@ -1590,6 +1602,7 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
 	dev->string = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_string, NULL);
 	dev->bitmask = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_bitmask, NULL);
 	dev->int_menu = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_int_menu, NULL);
+	dev->ro_int32 = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_ro_int32, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_area, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_array, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u16_matrix, NULL);
diff --git a/drivers/media/test-drivers/vivid/vivid-kthread-cap.c b/drivers/media/test-drivers/vivid/vivid-kthread-cap.c
index 01a9d671b947..cf7f62bfcf2f 100644
--- a/drivers/media/test-drivers/vivid/vivid-kthread-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-kthread-cap.c
@@ -426,6 +426,7 @@ static void vivid_fillbuff(struct vivid_dev *dev, struct vivid_buffer *buf)
 		is_loop = true;
 
 	buf->vb.sequence = dev->vid_cap_seq_count;
+	v4l2_ctrl_s_ctrl(dev->ro_int32, buf->vb.sequence & 0xff);
 	if (dev->field_cap == V4L2_FIELD_ALTERNATE) {
 		/*
 		 * 60 Hz standards start with the bottom field, 50 Hz standards
@@ -515,10 +516,11 @@ static void vivid_fillbuff(struct vivid_dev *dev, struct vivid_buffer *buf)
 		mutex_unlock(dev->ctrl_hdl_user_aud.lock);
 		tpg_gen_text(tpg, basep, line++ * line_height, 16, str);
 		mutex_lock(dev->ctrl_hdl_user_gen.lock);
-		snprintf(str, sizeof(str), " int32 %d, int64 %lld, bitmask %08x ",
-			dev->int32->cur.val,
-			*dev->int64->p_cur.p_s64,
-			dev->bitmask->cur.val);
+		snprintf(str, sizeof(str), " int32 %d, ro_int32 %d, int64 %lld, bitmask %08x ",
+			 dev->int32->cur.val,
+			 dev->ro_int32->cur.val,
+			 *dev->int64->p_cur.p_s64,
+			 dev->bitmask->cur.val);
 		tpg_gen_text(tpg, basep, line++ * line_height, 16, str);
 		snprintf(str, sizeof(str), " boolean %d, menu %s, string \"%s\" ",
 			dev->boolean->cur.val,
-- 
2.27.0

