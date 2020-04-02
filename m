Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF7EF19C95A
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2020 21:04:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389857AbgDBTEa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Apr 2020 15:04:30 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46064 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387819AbgDBTEa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Apr 2020 15:04:30 -0400
Received: from localhost.localdomain (unknown [IPv6:2a02:810a:1140:6758:20a2:167a:3b62:26be])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 5D81C295BD9;
        Thu,  2 Apr 2020 20:04:28 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        laurent.pinchart@ideasonboard.com,
        linux-rockchip@lists.infradead.org
Subject: [PATCH v2 3/5] media: staging: rkisp1: cap: support uv swap only for semiplanar formats
Date:   Thu,  2 Apr 2020 21:04:17 +0200
Message-Id: <20200402190419.15155-4-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200402190419.15155-1-dafna.hirschfeld@collabora.com>
References: <20200402190419.15155-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The register RKISP1_CIF_MI_XTD_FORMAT_CTRL is relevant only
for semiplanar formats, therefore the uv swap can be supported
through this register only for semiplanar formats.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Acked-by: Helen Koike <helen.koike@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-capture.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
index 84a3cf565106..fa2849209433 100644
--- a/drivers/staging/media/rkisp1/rkisp1-capture.c
+++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
@@ -37,6 +37,10 @@
 
 #define RKISP1_MIN_BUFFERS_NEEDED 3
 
+#define RKISP1_IS_SEMI_PLANAR(write_format)				\
+	(((write_format) == RKISP1_MI_CTRL_MP_WRITE_YUV_SPLA) ||	\
+	 ((write_format) == RKISP1_MI_CTRL_SP_WRITE_SPLA))
+
 enum rkisp1_plane {
 	RKISP1_PLANE_Y	= 0,
 	RKISP1_PLANE_CB	= 1,
@@ -429,7 +433,8 @@ static void rkisp1_mp_config(struct rkisp1_capture *cap)
 		     cap->config->mi.cr_size_init);
 
 	rkisp1_irq_frame_end_enable(cap);
-	if (cap->pix.cfg->uv_swap) {
+	if (RKISP1_IS_SEMI_PLANAR(cap->pix.cfg->write_format) &&
+	    cap->pix.cfg->uv_swap) {
 		reg = rkisp1_read(rkisp1, RKISP1_CIF_MI_XTD_FORMAT_CTRL);
 
 		reg = reg | RKISP1_CIF_MI_XTD_FMT_CTRL_MP_CB_CR_SWAP;
@@ -466,7 +471,8 @@ static void rkisp1_sp_config(struct rkisp1_capture *cap)
 	rkisp1_write(rkisp1, cap->sp_y_stride, RKISP1_CIF_MI_SP_Y_LLENGTH);
 
 	rkisp1_irq_frame_end_enable(cap);
-	if (cap->pix.cfg->uv_swap) {
+	if (RKISP1_IS_SEMI_PLANAR(cap->pix.cfg->write_format) &&
+	    cap->pix.cfg->uv_swap) {
 		u32 reg = rkisp1_read(rkisp1, RKISP1_CIF_MI_XTD_FORMAT_CTRL);
 
 		reg = reg | RKISP1_CIF_MI_XTD_FMT_CTRL_SP_CB_CR_SWAP;
-- 
2.17.1

