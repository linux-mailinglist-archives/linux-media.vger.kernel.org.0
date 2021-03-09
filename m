Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0DD8333202
	for <lists+linux-media@lfdr.de>; Wed, 10 Mar 2021 00:44:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232115AbhCIXnu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Mar 2021 18:43:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232142AbhCIXnV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Mar 2021 18:43:21 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEA44C06175F
        for <linux-media@vger.kernel.org>; Tue,  9 Mar 2021 15:43:20 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id r17so33013348ejy.13
        for <linux-media@vger.kernel.org>; Tue, 09 Mar 2021 15:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GsAE9rQ8/byOnL6RFD2LPTinVX5mQV+JCW61mQ0cTTQ=;
        b=ZktZICeZisdyBYhDRK6hJaM2gK5izAhJYXPmRLFGGqbadL1p3Lbdg4C2xqkGURAjQu
         bnm1Tg5faQWiTWF2WIyIkwJa1dP14JR1okSqTnYtFfydplxVIPwegxj8qfPD1Ue7PusI
         qdCVBswJlzCU362pnVirE0gUcQC1BeGobl3tI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GsAE9rQ8/byOnL6RFD2LPTinVX5mQV+JCW61mQ0cTTQ=;
        b=o7ii/t5xvOrI3mwj+tFnusrU2yMz2ABH2WMHKrPQGHt/vWVJvJAYLTvd6BTkIXpVAb
         bZKJwloohI9zQ4k8Cr0Vfh2Q/vd8m/uDhLS+vT7ZgQ0QdqnMZREqmTtMr/MC7pYxpF3b
         YLxAqcsut6AmuzPGxqOk+E+R+sfqHPKfJmlBPX3hb0VG8qGMRptq84fJLWRg9jmzBO9m
         DeBSq9EftHrSdaTMT6gLhyr+npNww/Afs2Pc8Qn9ku+J7rIb3KL3W4BJE/v0VuhsiLhB
         KyLDZdChJENAXyAfsZbJ0+oIAvpNarFiuIHniYplCh62kA1sf7KzXNjHLv6z1NGJl+8V
         ASPg==
X-Gm-Message-State: AOAM532lGUBfyB49dOGdSBxEUNik3hBVSYKzRRe95Cwn8k1FpL8jHkxG
        fzTgiEOCikga5zeM91Q0bgJZiw==
X-Google-Smtp-Source: ABdhPJxjhykxqKvpWvYUp6HbNeUMu65+sh2gFhOT0+/grLA8X/Ed9CYt6FwWNfjpo2XCj+H3e1jPjA==
X-Received: by 2002:a17:907:7692:: with SMTP id jv18mr510464ejc.475.1615333399461;
        Tue, 09 Mar 2021 15:43:19 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id l1sm5187658edt.59.2021.03.09.15.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 15:43:19 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
Subject: [PATCH] media: videobuf2: Fix integer overrun in allocation
Date:   Wed, 10 Mar 2021 00:43:17 +0100
Message-Id: <20210309234317.1021588-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The plane_length is an unsigned integer. So, if we have a size of
0xffffffff bytes we incorrectly allocate 0 bytes instead of 1 << 32.

Cc: stable@vger.kernel.org
Fixes: 7f8414594e47 ("[media] media: videobuf2: fix the length check for mmap")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/common/videobuf2/videobuf2-core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 02281d13505f..543da515c761 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -223,8 +223,10 @@ static int __vb2_buf_mem_alloc(struct vb2_buffer *vb)
 	 * NOTE: mmapped areas should be page aligned
 	 */
 	for (plane = 0; plane < vb->num_planes; ++plane) {
+		unsigned long size = vb->planes[plane].length;
+
 		/* Memops alloc requires size to be page aligned. */
-		unsigned long size = PAGE_ALIGN(vb->planes[plane].length);
+		size = PAGE_ALIGN(size);
 
 		/* Did it wrap around? */
 		if (size < vb->planes[plane].length)
-- 
2.30.1.766.gb4fecdf3b7-goog

