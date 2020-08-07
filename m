Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32A4823E926
	for <lists+linux-media@lfdr.de>; Fri,  7 Aug 2020 10:37:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727829AbgHGIgd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Aug 2020 04:36:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726511AbgHGIga (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Aug 2020 04:36:30 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDDE1C061574;
        Fri,  7 Aug 2020 01:36:29 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id l6so1036452qkc.6;
        Fri, 07 Aug 2020 01:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IYN7AynLXZAkrS6tmtd16cHkXNySIHUYTJRiIaQJpDY=;
        b=J+PAB7BFnuJcEvJOUOFwvZKOrQv2tDwpvVuibbxXgYkLeqAYcC7mRNuFKNYW336tTY
         1JVNsLYgnqHxCq16+3i3HedQ8OwR/G4xbgQ2YPUzuVEeK5UGEL0MM32fQDtl1b2mYhlz
         3HCev5eSMUcM7yqxzA4L16IZPvM+txe4RNEDyDaXKucm9SGBz82QsczJp4dXBBny81d+
         xe/SeXGYEYUMF7h9Y3Y7IiK0FbY26W0B0OB3v2560UodIfx/BmozYGfBtf/QwiNTUnvS
         SAbKxNrkq8RLFHQJBy3a7fqae4BdfSL3+2pXXORyp5+d0GgetUKT6/vbMksnmJePba8E
         RaiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IYN7AynLXZAkrS6tmtd16cHkXNySIHUYTJRiIaQJpDY=;
        b=UpLUxT8f2n+IAqZvYZuWTD/HgCcZu0OX2TSKK5uN6fmKRwLMzsWXI1oDibcoau2wy/
         AXDKrgRHOGowSYQAYCa0bWvlSmhlQ2XC8sqv4qHNKYAnaPJhWEsD4vbY/TSmVV0iQqml
         Wgj6SBgWjsJgbeLNegcVYJkpGlT12r7nc7XL/odU6OBMyf5nTTel2bEvm3wwp3Y/5HF0
         KIw2PeVWa69JwrMYoYh2Aq3T/5eKEZQA0XpPXKduBXVI8MonpBbaWqQJwpz1Xi2Gt/zI
         BMNCwhm0v/tIUHOKEkyV6XU5T49GmrbPaaRy8Z3rm9gOmnmQVKXdJmTHru9/WmPamI4W
         SrUQ==
X-Gm-Message-State: AOAM530AIg+ixNg3+A7xPIHJ0Dqli2Unt/ZTmupnEx6pqY5eA5ltO9Ow
        SHSa/xZLvEacNjkYZiMgV+YAtilcqa2bNA==
X-Google-Smtp-Source: ABdhPJy82zmYuwBL7KQLpSLzdgP/wyy1vhF4Xnz4DYiXdnAZ3uXeGMNuMMlcIAO0/h9sv0gwnxqWaQ==
X-Received: by 2002:a37:5dc6:: with SMTP id r189mr12169409qkb.364.1596789389099;
        Fri, 07 Aug 2020 01:36:29 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
        by smtp.gmail.com with ESMTPSA id c42sm7846728qte.5.2020.08.07.01.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 01:36:28 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     skhan@linuxfoundation.org,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 06/20] media: mtk-vcodec: mtk_vcodec_dec.c: fix comparison to bool
Date:   Fri,  7 Aug 2020 05:35:33 -0300
Message-Id: <20200807083548.204360-6-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Fix the following coccinelle reports:

drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c:197:14-35:
WARNING: Comparison to bool

drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c:198:7-29:
WARNING: Comparison to bool

drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c:451:12-19:
WARNING: Comparison to bool

drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c:1159:6-15:
WARNING: Comparison to bool

By replacing (cond == true) with (cond) and (cond == false) with
(!cond)

Found using - Coccinelle (http://coccinelle.lip6.fr)

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index 0f3e710aed4e..dd4f6747a381 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -194,8 +194,7 @@ static struct vb2_buffer *get_free_buffer(struct mtk_vcodec_ctx *ctx)
 				vb->vb2_buf.index,
 				dstbuf->queued_in_vb2);
 			v4l2_m2m_buf_queue(ctx->m2m_ctx, vb);
-		} else if ((dstbuf->queued_in_vb2 == false) &&
-			   (dstbuf->queued_in_v4l2 == true)) {
+		} else if (!dstbuf->queued_in_vb2 && dstbuf->queued_in_v4l2) {
 			/*
 			 * If buffer in v4l2 driver but not in vb2 queue yet,
 			 * and we get this buffer from free_list, it means
@@ -448,7 +447,7 @@ static void mtk_vdec_worker(struct work_struct *work)
 			mutex_unlock(&ctx->lock);
 		}
 		v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
-	} else if (res_chg == false) {
+	} else if (!res_chg) {
 		/*
 		 * we only return src buffer with VB2_BUF_STATE_DONE
 		 * when decode success without resolution change
@@ -1156,7 +1155,7 @@ static void vb2ops_vdec_buf_queue(struct vb2_buffer *vb)
 		buf = container_of(vb2_v4l2, struct mtk_video_dec_buf,
 				   m2m_buf.vb);
 		mutex_lock(&ctx->lock);
-		if (buf->used == false) {
+		if (!buf->used) {
 			v4l2_m2m_buf_queue(ctx->m2m_ctx, vb2_v4l2);
 			buf->queued_in_vb2 = true;
 			buf->queued_in_v4l2 = true;
-- 
2.28.0

