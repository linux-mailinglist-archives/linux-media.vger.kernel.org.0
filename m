Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A6B92AC3FC
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 19:38:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730332AbgKISiK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 13:38:10 -0500
Received: from 82-65-109-163.subs.proxad.net ([82.65.109.163]:40208 "EHLO
        luna.linkmauve.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730098AbgKISiI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 13:38:08 -0500
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
        id 61835F41536; Sun,  8 Nov 2020 21:20:32 +0100 (CET)
From:   Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
To:     linux-media@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
Subject: [PATCH 1/2] media: uapi: Expose probability lengths as defines
Date:   Sun,  8 Nov 2020 21:20:20 +0100
Message-Id: <20201108202021.4187-1-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

These values will be used by various drivers implementing the VP8
stateless API.

This had been suggested by Ezequiel Garcia for the Cedrus VP8 driver.

Signed-off-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
---
 include/media/vp8-ctrls.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/media/vp8-ctrls.h b/include/media/vp8-ctrls.h
index 53cba826e482..a920493361dc 100644
--- a/include/media/vp8-ctrls.h
+++ b/include/media/vp8-ctrls.h
@@ -53,11 +53,13 @@ struct v4l2_vp8_quantization_header {
 	__u16 padding;
 };
 
+#define V4L2_VP8_COEFF_PROB_CNT 11
+#define V4L2_VP8_MV_PROB_CNT 19
 struct v4l2_vp8_entropy_header {
-	__u8 coeff_probs[4][8][3][11];
+	__u8 coeff_probs[4][8][3][V4L2_VP8_COEFF_PROB_CNT];
 	__u8 y_mode_probs[4];
 	__u8 uv_mode_probs[3];
-	__u8 mv_probs[2][19];
+	__u8 mv_probs[2][V4L2_VP8_MV_PROB_CNT];
 	__u8 padding[3];
 };
 
-- 
2.29.2

