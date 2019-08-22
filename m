Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE5139A02F
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2019 21:39:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388717AbfHVTjk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Aug 2019 15:39:40 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:59180 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726319AbfHVTjk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Aug 2019 15:39:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=pgErmpFXxq4tr/V2Zyyibb7WVocvEmJ2tAtqbs4GtSU=; b=G7KPORPNxRfa01/z5Clbh1Jhi9
        sYV6/cUV+ECUQAn+1m8j1sD5LH8HEac6DvXTcfGvCNZ19tp1bGTefiwWwOPH+xqVr9Tr/AL6ynTQ+
        GDIVY6E1k6YoYB5P6YuASdl+PGpMZR3TRA5uH0JSNPJ9sIjznzG2lVQ2SzXqoZw5VAxhS1+1H9nQh
        9BCzQ7lt4ulasgKBq5iBW5fPG9lPBaiXgpJ1mnlyZhbWaPicDartKNv4X1k0LcMC2JBylxuRjqSA8
        lsf+6vmuFoc1YCAtQkUgcb4x4Z3mg/u2csLH9/yixIRpB9bWD3Ycx6SdTqO/B238ofuXOk8YVR/v8
        gzbKS0MQ==;
Received: from [177.133.63.56] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i0svr-0002lX-LB; Thu, 22 Aug 2019 19:39:39 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1i0svo-0007IJ-Dx; Thu, 22 Aug 2019 16:39:36 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 2/7] media: vicodec: make life easier for static analyzers
Date:   Thu, 22 Aug 2019 16:39:29 -0300
Message-Id: <2d4cde2e91237af9cae10d4a1e2df4d1f4e1bce0.1566502743.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <4a411ba155eb062b6575aba0824123c840806c0b.1566502743.git.mchehab+samsung@kernel.org>
References: <4a411ba155eb062b6575aba0824123c840806c0b.1566502743.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

cppcheck incorrectly produces an error here:
	[drivers/media/platform/vicodec/vicodec-core.c:1677]: (error) Pointer addition with NULL pointer.

While this is actually a false positive, it doesn't hurt to
reorder the checks to make the code simpler, handling first
the error patch, where no color or alpha components are there.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 drivers/media/platform/vicodec/vicodec-core.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/vicodec/vicodec-core.c b/drivers/media/platform/vicodec/vicodec-core.c
index 5152f44bcc0a..0ee143ae0f6b 100644
--- a/drivers/media/platform/vicodec/vicodec-core.c
+++ b/drivers/media/platform/vicodec/vicodec-core.c
@@ -1664,19 +1664,22 @@ static int vicodec_start_streaming(struct vb2_queue *q,
 	kvfree(state->compressed_frame);
 	state->compressed_frame = new_comp_frame;
 
-	if (info->components_num >= 3) {
-		state->ref_frame.cb = state->ref_frame.luma + size;
-		state->ref_frame.cr = state->ref_frame.cb + size / chroma_div;
-	} else {
+	if (info->components_num < 3) {
 		state->ref_frame.cb = NULL;
 		state->ref_frame.cr = NULL;
+		state->ref_frame.alpha = NULL;
+		return 0;
 	}
 
+	state->ref_frame.cb = state->ref_frame.luma + size;
+	state->ref_frame.cr = state->ref_frame.cb + size / chroma_div;
+
 	if (info->components_num == 4)
 		state->ref_frame.alpha =
 			state->ref_frame.cr + size / chroma_div;
 	else
 		state->ref_frame.alpha = NULL;
+
 	return 0;
 }
 
-- 
2.21.0

