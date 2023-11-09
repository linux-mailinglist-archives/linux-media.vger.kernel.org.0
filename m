Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64B917E7218
	for <lists+linux-media@lfdr.de>; Thu,  9 Nov 2023 20:16:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229838AbjKITQ7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Nov 2023 14:16:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbjKITQ7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Nov 2023 14:16:59 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF13A3C11
        for <linux-media@vger.kernel.org>; Thu,  9 Nov 2023 11:16:56 -0800 (PST)
Received: from mz550.lan (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 6B760660741F;
        Thu,  9 Nov 2023 19:16:54 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1699557415;
        bh=dofLS0gFGOBVu+WKJmcrmo80Yvh+fogrDGkImFHAEy4=;
        h=From:To:Cc:Subject:Date:From;
        b=dowxBczRZD4cwcYgf5fxEUEK9zoNwZ1bkHwiuDWeH/tOVEulPznnR+6q3MGXVzfR7
         ZH443zGzR4g7FPAi7mdw4xgLVZHrlFAKk1uUysSP1S3tPVYN89WLOaH+K/X0zS64Tb
         FEbBgqb8Bxhx2epcqlz5kMH1zEM8gIU/o/PSv2SDIgqs+/KLosiIo4Z3kHwA2VvwTC
         w5gUgyAibuDZBcQqyW/SWgD2u4bnIalGWLmYftjlKFK3x977Id3xp9tpHETTSE+QuM
         sH3nqiF6ahcK9WR61zWftVSR1z3I+/vQgWMyprEhg25j596/RGX+sumKPJ4hkdfPHz
         t/hBodCAZ3wKg==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl,
        Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH] media: v4l2-mem2mem.h: fix typo in comment
Date:   Thu,  9 Nov 2023 11:16:43 -0800
Message-ID: <20231109191643.28562-1-deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The comment describing the function v4l2_m2m_last_src_buf() says that this
function returns the last destination buffer when it actually returns the
last source buffer. Fix the comment so that it is accurate.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 include/media/v4l2-mem2mem.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
index d6c8eb2b5201..1e4cb65236a3 100644
--- a/include/media/v4l2-mem2mem.h
+++ b/include/media/v4l2-mem2mem.h
@@ -661,7 +661,7 @@ v4l2_m2m_next_dst_buf(struct v4l2_m2m_ctx *m2m_ctx)
 struct vb2_v4l2_buffer *v4l2_m2m_last_buf(struct v4l2_m2m_queue_ctx *q_ctx);
 
 /**
- * v4l2_m2m_last_src_buf() - return last destination buffer from the list of
+ * v4l2_m2m_last_src_buf() - return last source buffer from the list of
  * ready buffers
  *
  * @m2m_ctx: m2m context assigned to the instance given by struct &v4l2_m2m_ctx
-- 
2.41.0

