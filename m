Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3ABB37E71B0
	for <lists+linux-media@lfdr.de>; Thu,  9 Nov 2023 19:49:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345013AbjKIStB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Nov 2023 13:49:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344906AbjKIStA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Nov 2023 13:49:00 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CCC3185
        for <linux-media@vger.kernel.org>; Thu,  9 Nov 2023 10:48:58 -0800 (PST)
Received: from mz550.lan (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id D3072660741F;
        Thu,  9 Nov 2023 18:48:55 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1699555736;
        bh=RCDEckBTsJZ+KR3WKmLKLM4iEJKj6nzSrRUhmi5N8Kc=;
        h=From:To:Cc:Subject:Date:From;
        b=a4sw0JbOR2lyZlT7jzbs0d/GbnLsBfe8SgmlpfFOjrq/2T8W69vykD9Srwu3yQDKg
         sUfSb62lSCmbE7vDkeg7U8FXgEruSkFNBVdjuHmZmQGRbBA5IW2rG1Xq8jXvT9oI/2
         +aziqbi0Dv19G1isU2X7Hd0oF+Bc5IVUM49oI5lkFYpj/kukqPj791eOjEQm0O2uM5
         VRF4XtER2RdSTDRobLTrHvLP8bYiug0OFXtqKXd1BsSlrfGPCdXkqPWG92iUyxjvTm
         FmSjLmdhdsJ86g5lu5FctWfXvySMRO8pW+34VRqlMSy4G0bGjDEQPI/e1ifCZ7RcP/
         z6QymXuNeO/tA==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     nicolas.dufresne@collabora.com, hverkuil-cisco@xs4all.nl,
        Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH] media: vicodec: allow en/decoder cmd w/o CAPTURE
Date:   Thu,  9 Nov 2023 10:48:38 -0800
Message-ID: <20231109184838.16893-1-deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Vicodec will ignore en/decoder commands if the CAPTURE queue is not
streaming. But this prevents CMD_STOP from being used during a dynamic
resolution change to mark the last source buffer. Since CMD_STOP is
ignored, but doesn’t fail, there is no warning that the command needs to
be resent, and CAPTURE will continue to attempt to dequeue buffers
waiting, futilely, for one with V4L2_BUF_FLAG_LAST.

Fix this problem by carrying out en/decoder commands even if CAPTURE is
not streaming.

Reported by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/media/test-drivers/vicodec/vicodec-core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
index 6f0e20df74e9..cdb38688e920 100644
--- a/drivers/media/test-drivers/vicodec/vicodec-core.c
+++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
@@ -1215,8 +1215,7 @@ static int vicodec_encoder_cmd(struct file *file, void *fh,
 	if (ret < 0)
 		return ret;
 
-	if (!vb2_is_streaming(&ctx->fh.m2m_ctx->cap_q_ctx.q) ||
-	    !vb2_is_streaming(&ctx->fh.m2m_ctx->out_q_ctx.q))
+	if (!vb2_is_streaming(&ctx->fh.m2m_ctx->out_q_ctx.q))
 		return 0;
 
 	ret = v4l2_m2m_ioctl_encoder_cmd(file, fh, ec);
@@ -1244,8 +1243,7 @@ static int vicodec_decoder_cmd(struct file *file, void *fh,
 	if (ret < 0)
 		return ret;
 
-	if (!vb2_is_streaming(&ctx->fh.m2m_ctx->cap_q_ctx.q) ||
-	    !vb2_is_streaming(&ctx->fh.m2m_ctx->out_q_ctx.q))
+	if (!vb2_is_streaming(&ctx->fh.m2m_ctx->out_q_ctx.q))
 		return 0;
 
 	ret = v4l2_m2m_ioctl_decoder_cmd(file, fh, dc);
-- 
2.41.0

