Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7743C1A0E5E
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 15:30:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728643AbgDGNaK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 09:30:10 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55551 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728482AbgDGNaK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Apr 2020 09:30:10 -0400
Received: by mail-wm1-f65.google.com with SMTP id e26so1737702wmk.5
        for <linux-media@vger.kernel.org>; Tue, 07 Apr 2020 06:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UOi57oHr5s/5E0FnEyTsvZU+8lzzIWA8Vs7n3i5sOy8=;
        b=lqs5NYs1YiLhL8UYGIe9i385jAjKdLyTNCC0mcSp8NXYVc3B3fKruAFL7KGE5997nk
         AU0NOF6D1n0vf9dPE/x6VuROP+Kk/iTWwRUXo7Z7h38U6gNJLzwFX7IHoiTG1s18TFcw
         z0AOpuGJ1dDsRgYdXKmlWbNw4BQQf3H5w4pXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UOi57oHr5s/5E0FnEyTsvZU+8lzzIWA8Vs7n3i5sOy8=;
        b=Savz2g7kFkvq3mZvrpZUczumudlMfp6Gz3djdoUiqpPnt5fwxYLMWR/jzCh3qTphfD
         1RlAtLVNTwkt2zNHBtwhFpuJHWlhCZHAj3WUAZ+61zHmdN+tg60Csp2fpgnMKkZ1bD8a
         hFoJtsoSl8me9Ui5tvqsv+ieh1Y2vPMk/wJDxEUSHTQ/LiEFaDQR+EhWauYHCyIZxK4x
         wnea+52rEHTcJkPZPwxfXuhnpkCrjYP73ksCFOHOo2HQNsmMU4ZNLLJCEyzKftHw0ou2
         hMyOOvFKrLZa0OvRaM0kncPfbTLS8rrG6PtWvgLr0zh6b6sUSqXWPy8EaTYLFiVYBbMF
         +04A==
X-Gm-Message-State: AGi0PuY101KU93eHNTstP2YgBTgCYXRwD04JNTnSLE/fNeM+MtQFPULX
        J+b3RVxcDVkzuam34086Xhh+zw==
X-Google-Smtp-Source: APiQypLvHOdwXjsCrF5+Tv9IInpboZOwQ/KzmNwLIRILJMk/8AWfgULjQ2vlsEce0SADJExSiixc9g==
X-Received: by 2002:a1c:e1c1:: with SMTP id y184mr2451445wmg.143.1586266207750;
        Tue, 07 Apr 2020 06:30:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id j11sm2446877wmi.33.2020.04.07.06.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 06:30:07 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Chenbo Feng <fengc@google.com>,
        Greg Hackmann <ghackmann@google.com>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        minchan@kernel.org, surenb@google.com, jenhaochen@google.com,
        Martin Liu <liumartin@google.com>,
        Daniel Vetter <daniel.vetter@intel.com>
Subject: [PATCH] dma-buf: Fix SET_NAME ioctl uapi
Date:   Tue,  7 Apr 2020 15:30:02 +0200
Message-Id: <20200407133002.3486387-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The uapi is the same on 32 and 64 bit, but the number isnt. Everyone
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
---
 drivers/dma-buf/dma-buf.c    | 3 ++-
 include/uapi/linux/dma-buf.h | 4 ++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 570c923023e6..1d923b8e4c59 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -388,7 +388,8 @@ static long dma_buf_ioctl(struct file *file,
 
 		return ret;
 
-	case DMA_BUF_SET_NAME:
+	case DMA_BUF_SET_NAME_A:
+	case DMA_BUF_SET_NAME_B:
 		return dma_buf_set_name(dmabuf, (const char __user *)arg);
 
 	default:
diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
index dbc7092e04b5..21dfac815dc0 100644
--- a/include/uapi/linux/dma-buf.h
+++ b/include/uapi/linux/dma-buf.h
@@ -39,6 +39,10 @@ struct dma_buf_sync {
 
 #define DMA_BUF_BASE		'b'
 #define DMA_BUF_IOCTL_SYNC	_IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
+/* 32/64bitness of this uapi was botched in android, there's no difference
+ * between them in actual uapi, they're just different numbers. */
 #define DMA_BUF_SET_NAME	_IOW(DMA_BUF_BASE, 1, const char *)
+#define DMA_BUF_SET_NAME_A	_IOW(DMA_BUF_BASE, 1, u32)
+#define DMA_BUF_SET_NAME_B	_IOW(DMA_BUF_BASE, 1, u64)
 
 #endif
-- 
2.25.1

