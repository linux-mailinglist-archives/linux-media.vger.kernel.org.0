Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 063C2100282
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2019 11:36:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726627AbfKRKgD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Nov 2019 05:36:03 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36594 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbfKRKgC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Nov 2019 05:36:02 -0500
Received: by mail-wr1-f65.google.com with SMTP id r10so18803480wrx.3
        for <linux-media@vger.kernel.org>; Mon, 18 Nov 2019 02:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6Ra81SF/gAF1NOlsK25mQDZVt7/1R+jY1Ddov0yZk/I=;
        b=jUmU2Pm/rpn34cHxfy/mRTbtXOvG/rx3QBiW/JW6ZrTKA7eyHzhVLN00yIxfjH6RaD
         Jk1Q0TAoW9w0rHaaoGdl2yKZ5lVsS3c2zqF51xDaOKYnlr6y5NEd0jhTP1FYkSRmZnH2
         oLIgt8fS3WN4DKSKvUp8t8vFTe8Q0zNBNct7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6Ra81SF/gAF1NOlsK25mQDZVt7/1R+jY1Ddov0yZk/I=;
        b=Mb/atvxTm2Whnp2MfWmSlIwGMy+/ED7iScaFoDSdGZkzTAlm9T5zlom9XurGdtd5HJ
         BD/y2g7qpNRuTqr7WCoJc1Vn+y0XJkil5i1f00DXbiHfHv9FwqnlkIdggN3HdCKcrbfu
         3hGnD8VkHeha2Igr7Sz8UhMhEMLzxRhTO2jagfAtnWgx71Y1tB2COzCUklTIqP71nnQO
         JICFCt8P7w/r2VTPiEbI07IuWT9wpPWZCBerF3rDp4XpFn/wtdInUCoMUZnVBBLw/DYa
         HCOKARzKcByY1WY4Hd+VWqLwNo3PfcjAYcaz7W3HX/hoO2x7XJG7lLZoiZMH/9N2mo8T
         g8bg==
X-Gm-Message-State: APjAAAVU5mW8HfxW/4ZBqj3g1PFeHaiC/U6Py6NFey5SsTCMW9AHzdwv
        LEw06Rj3ktYKUdE+SmoyrAk20A==
X-Google-Smtp-Source: APXvYqw29riHGoWMhCfeUGpT8JpzsyL2a/U5QhM8PPUltRaVH+y5YSQ78vFp9V+DsJILGfZcCnEWvA==
X-Received: by 2002:a5d:484f:: with SMTP id n15mr11213479wrs.112.1574073360548;
        Mon, 18 Nov 2019 02:36:00 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id j2sm22749200wrt.61.2019.11.18.02.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 02:36:00 -0800 (PST)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 15/15] dma-buf: Remove kernel map/unmap hooks
Date:   Mon, 18 Nov 2019 11:35:36 +0100
Message-Id: <20191118103536.17675-16-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
References: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

All implementations are gone now.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
---
 include/linux/dma-buf.h | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 7feb9c3805ae..abf5459a5b9d 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -249,31 +249,6 @@ struct dma_buf_ops {
 	 */
 	int (*mmap)(struct dma_buf *, struct vm_area_struct *vma);
 
-	/**
-	 * @map:
-	 *
-	 * Maps a page from the buffer into kernel address space. The page is
-	 * specified by offset into the buffer in PAGE_SIZE units.
-	 *
-	 * This callback is optional.
-	 *
-	 * Returns:
-	 *
-	 * Virtual address pointer where requested page can be accessed. NULL
-	 * on error or when this function is unimplemented by the exporter.
-	 */
-	void *(*map)(struct dma_buf *, unsigned long);
-
-	/**
-	 * @unmap:
-	 *
-	 * Unmaps a page from the buffer. Page offset and address pointer should
-	 * be the same as the one passed to and returned by matching call to map.
-	 *
-	 * This callback is optional.
-	 */
-	void (*unmap)(struct dma_buf *, unsigned long, void *);
-
 	void *(*vmap)(struct dma_buf *);
 	void (*vunmap)(struct dma_buf *, void *vaddr);
 };
-- 
2.24.0

