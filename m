Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9790F753FD
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2019 18:28:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388917AbfGYQ2L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jul 2019 12:28:11 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:40624 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387616AbfGYQ2L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jul 2019 12:28:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=1gWwLmhXudB5qYQlPaZcy9XmhEJ6Zg7DZFm5yjBwFjg=; b=tdnwLjtLToaDClIoTMEJw2nUs
        WjuIT5jJJjR8JDywu5M4lZesIy9+hwZr/NKDnjFqA7M0P+Zjxq1KZB1LRyejTZ8SCCJett67MNzBG
        K6pjWcy2gp2m4gVOcFIKayAG9jVRy+2iRqEdNR+8zOERorkiLZ3OFIhQjMvPwsgLtxw0i+7X4ycFq
        F0e8OGEgKWR7/saDT9Mc3s8+jaykcZx33DOSBXofdLZEcfUoh4MUrcortdbDPMaUct6qLtZhDwJun
        2pBksaqdq7fcn1l2kbtFuzfWUEma0rgSgpmsFhI/JLancADirslXD4kL+cciPRrEYRzfE92PHM373
        vOd+MBmrg==;
Received: from [179.95.31.157] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hqgb9-0004Lx-Gx; Thu, 25 Jul 2019 16:28:07 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hqgb7-0000oR-6y; Thu, 25 Jul 2019 12:28:05 -0400
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        ZhiChao Yu <zhichao.yu@rock-chips.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Jeffy Chen <jeffy.chen@rock-chips.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Hariprasad Kelam <hariprasad.kelam@gmail.com>,
        devel@driverdev.osuosl.org
Subject: [PATCH] media: staging: hantro: avoid future namespace collisions
Date:   Thu, 25 Jul 2019 12:28:04 -0400
Message-Id: <620428820d0d76de5b29314457a3b27c0634b4f2.1564072060.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rename:
	vp8_dec_mc_filter -> hantro_vp8_dec_mc_filter

As other drivers may end implementing something with the same
name.

So, prepend driver's name here, in order to make symbol namespace
cleaner.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 drivers/staging/media/hantro/hantro_g1_vp8_dec.c     | 5 +++--
 drivers/staging/media/hantro/hantro_hw.h             | 2 +-
 drivers/staging/media/hantro/hantro_vp8.c            | 2 +-
 drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c | 2 +-
 4 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_g1_vp8_dec.c b/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
index 181e2f76d8cb..6d99c2be01cf 100644
--- a/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
@@ -342,11 +342,12 @@ static void cfg_tap(struct hantro_ctx *ctx,
 		return; /* Tap filter not used. */
 
 	for (i = 0; i < 8; i++) {
-		val = (vp8_dec_mc_filter[i][0] << 2) | vp8_dec_mc_filter[i][5];
+		val = (hantro_vp8_dec_mc_filter[i][0] << 2) |
+		       hantro_vp8_dec_mc_filter[i][5];
 
 		for (j = 0; j < 4; j++)
 			hantro_reg_write(vpu, &vp8_dec_pred_bc_tap[i][j],
-					 vp8_dec_mc_filter[i][j + 1]);
+					 hantro_vp8_dec_mc_filter[i][j + 1]);
 
 		switch (i) {
 		case 2:
diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index e86c84fbfe1a..2b8029674a75 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -95,7 +95,7 @@ extern const struct hantro_variant rk3399_vpu_variant;
 extern const struct hantro_variant rk3328_vpu_variant;
 extern const struct hantro_variant rk3288_vpu_variant;
 
-extern const u32 vp8_dec_mc_filter[8][6];
+extern const u32 hantro_vp8_dec_mc_filter[8][6];
 
 void hantro_watchdog(struct work_struct *work);
 void hantro_run(struct hantro_ctx *ctx);
diff --git a/drivers/staging/media/hantro/hantro_vp8.c b/drivers/staging/media/hantro/hantro_vp8.c
index cd01661cac21..0e02d147b189 100644
--- a/drivers/staging/media/hantro/hantro_vp8.c
+++ b/drivers/staging/media/hantro/hantro_vp8.c
@@ -35,7 +35,7 @@ struct vp8_prob_tbl_packed {
  * filter taps taken to 7-bit precision,
  * reference RFC6386#Page-16, filters[8][6]
  */
-const u32 vp8_dec_mc_filter[8][6] = {
+const u32 hantro_vp8_dec_mc_filter[8][6] = {
 	{ 0, 0, 128, 0, 0, 0 },
 	{ 0, -6, 123, 12, -1, 0 },
 	{ 2, -11, 108, 36, -8, 1 },
diff --git a/drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c b/drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c
index c5e9f8befe9c..f17e32620b08 100644
--- a/drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c
+++ b/drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c
@@ -439,7 +439,7 @@ static void cfg_tap(struct hantro_ctx *ctx,
 			if (vp8_dec_pred_bc_tap[i][j].base != 0)
 				hantro_reg_write(vpu,
 						 &vp8_dec_pred_bc_tap[i][j],
-						 vp8_dec_mc_filter[i][j]);
+						 hantro_vp8_dec_mc_filter[i][j]);
 		}
 	}
 }
-- 
2.21.0

