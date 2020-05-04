Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 345781C44D0
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 20:10:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732257AbgEDSKX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 14:10:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:35428 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729762AbgEDSFe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 May 2020 14:05:34 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 04E9B206B8;
        Mon,  4 May 2020 18:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588615533;
        bh=N4i6e4VsODP2CW1mwqCEy5GnptRmE9Pa1G3YDTPyGAc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=f4u+y8YJ9bX6d9WDqeSG8tux7Z6MY/7mhKV4Xma6DF6w6Hoqha4LrWtw3BIHK0f2m
         gSu/upXVb33+DAcfh2gbhWGF6TZa7Ld6DFa+WELlbtihVrapIiv4I9ChZ7tBVtWheB
         sscq8YBJ3uqvm2DK5TvONKhIKRQ2QAZWk/SOJvZM=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
        Chenbo Feng <fengc@google.com>,
        Greg Hackmann <ghackmann@google.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        minchan@kernel.org, surenb@google.com, jenhaochen@google.com,
        Martin Liu <liumartin@google.com>,
        Daniel Vetter <daniel.vetter@intel.com>
Subject: [PATCH 5.6 02/73] dma-buf: Fix SET_NAME ioctl uapi
Date:   Mon,  4 May 2020 19:57:05 +0200
Message-Id: <20200504165502.155875888@linuxfoundation.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200504165501.781878940@linuxfoundation.org>
References: <20200504165501.781878940@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Daniel Vetter <daniel.vetter@intel.com>

commit a5bff92eaac45bdf6221badf9505c26792fdf99e upstream.

The uapi is the same on 32 and 64 bit, but the number isn't. Everyone
who botched this please re-read:

https://www.kernel.org/doc/html/v5.4-preprc-cpu/ioctl/botching-up-ioctls.html

Also, the type argument for the ioctl macros is for the type the void
__user *arg pointer points at, which in this case would be the
variable-sized char[] of a 0 terminated string. So this was botched in
more than just the usual ways.

Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Chenbo Feng <fengc@google.com>
Cc: Greg Hackmann <ghackmann@google.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: minchan@kernel.org
Cc: surenb@google.com
Cc: jenhaochen@google.com
Cc: Martin Liu <liumartin@google.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Tested-by: Martin Liu <liumartin@google.com>
Reviewed-by: Martin Liu <liumartin@google.com>
Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
  [sumits: updated some checkpatch fixes, corrected author email]
Link: https://patchwork.freedesktop.org/patch/msgid/20200407133002.3486387-1-daniel.vetter@ffwll.ch
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 drivers/dma-buf/dma-buf.c    |    3 ++-
 include/uapi/linux/dma-buf.h |    6 ++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -388,7 +388,8 @@ static long dma_buf_ioctl(struct file *f
 
 		return ret;
 
-	case DMA_BUF_SET_NAME:
+	case DMA_BUF_SET_NAME_A:
+	case DMA_BUF_SET_NAME_B:
 		return dma_buf_set_name(dmabuf, (const char __user *)arg);
 
 	default:
--- a/include/uapi/linux/dma-buf.h
+++ b/include/uapi/linux/dma-buf.h
@@ -39,6 +39,12 @@ struct dma_buf_sync {
 
 #define DMA_BUF_BASE		'b'
 #define DMA_BUF_IOCTL_SYNC	_IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
+
+/* 32/64bitness of this uapi was botched in android, there's no difference
+ * between them in actual uapi, they're just different numbers.
+ */
 #define DMA_BUF_SET_NAME	_IOW(DMA_BUF_BASE, 1, const char *)
+#define DMA_BUF_SET_NAME_A	_IOW(DMA_BUF_BASE, 1, u32)
+#define DMA_BUF_SET_NAME_B	_IOW(DMA_BUF_BASE, 1, u64)
 
 #endif


