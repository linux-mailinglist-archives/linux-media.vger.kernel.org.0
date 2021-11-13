Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7731244F1C8
	for <lists+linux-media@lfdr.de>; Sat, 13 Nov 2021 07:22:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230482AbhKMGZV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 Nov 2021 01:25:21 -0500
Received: from lucky1.263xmail.com ([211.157.147.135]:40622 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbhKMGZU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 Nov 2021 01:25:20 -0500
Received: from localhost (unknown [192.168.167.130])
        by lucky1.263xmail.com (Postfix) with ESMTP id C7C38B3BB5;
        Sat, 13 Nov 2021 14:22:24 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P7913T140599548167936S1636784543589160_;
        Sat, 13 Nov 2021 14:22:24 +0800 (CST)
X-IP-DOMAINF: 1
X-RL-SENDER: jay.xu@rock-chips.com
X-SENDER: xjq@rock-chips.com
X-LOGIN-NAME: jay.xu@rock-chips.com
X-FST-TO: sumit.semwal@linaro.org
X-RCPT-COUNT: 11
X-LOCAL-RCPT-COUNT: 1
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-UNIQUE-TAG: <db56d0e485e7f0271e42729d371dca79>
X-System-Flag: 0
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     sumit.semwal@linaro.org, christian.koenig@amd.com
Cc:     pekka.paalanen@collabora.com, daniel.vetter@ffwll.ch,
        jason@jlekstrand.net, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH] dma-buf: add DMA_BUF_IOCTL_SYNC_PARTIAL support
Date:   Sat, 13 Nov 2021 14:22:22 +0800
Message-Id: <20211113062222.3743909-1-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add DMA_BUF_IOCTL_SYNC_PARTIAL support for user to sync dma-buf with
offset and len.

Change-Id: I03d2d2e10e48d32aa83c31abade57e0931e1be49
Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
 drivers/dma-buf/dma-buf.c    | 42 ++++++++++++++++++++++++++++++++++++
 include/uapi/linux/dma-buf.h |  8 +++++++
 2 files changed, 50 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index d9948d58b3f4..78f37f7c3462 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -392,6 +392,7 @@ static long dma_buf_ioctl(struct file *file,
 {
 	struct dma_buf *dmabuf;
 	struct dma_buf_sync sync;
+	struct dma_buf_sync_partial sync_p;
 	enum dma_data_direction direction;
 	int ret;
 
@@ -430,6 +431,47 @@ static long dma_buf_ioctl(struct file *file,
 	case DMA_BUF_SET_NAME_B:
 		return dma_buf_set_name(dmabuf, (const char __user *)arg);
 
+	case DMA_BUF_IOCTL_SYNC_PARTIAL:
+		if (copy_from_user(&sync_p, (void __user *) arg, sizeof(sync_p)))
+			return -EFAULT;
+
+		if (sync_p.len == 0)
+			return 0;
+
+		if ((sync_p.offset % cache_line_size()) || (sync_p.len % cache_line_size()))
+			return -EINVAL;
+
+		if (sync_p.len > dmabuf->size || sync_p.offset > dmabuf->size - sync_p.len)
+			return -EINVAL;
+
+		if (sync_p.flags & ~DMA_BUF_SYNC_VALID_FLAGS_MASK)
+			return -EINVAL;
+
+		switch (sync_p.flags & DMA_BUF_SYNC_RW) {
+		case DMA_BUF_SYNC_READ:
+			direction = DMA_FROM_DEVICE;
+			break;
+		case DMA_BUF_SYNC_WRITE:
+			direction = DMA_TO_DEVICE;
+			break;
+		case DMA_BUF_SYNC_RW:
+			direction = DMA_BIDIRECTIONAL;
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		if (sync_p.flags & DMA_BUF_SYNC_END)
+			ret = dma_buf_end_cpu_access_partial(dmabuf, direction,
+							     sync_p.offset,
+							     sync_p.len);
+		else
+			ret = dma_buf_begin_cpu_access_partial(dmabuf, direction,
+							       sync_p.offset,
+							       sync_p.len);
+
+		return ret;
+
 	default:
 		return -ENOTTY;
 	}
diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
index 7f30393b92c3..6236c644624d 100644
--- a/include/uapi/linux/dma-buf.h
+++ b/include/uapi/linux/dma-buf.h
@@ -47,4 +47,12 @@ struct dma_buf_sync {
 #define DMA_BUF_SET_NAME_A	_IOW(DMA_BUF_BASE, 1, u32)
 #define DMA_BUF_SET_NAME_B	_IOW(DMA_BUF_BASE, 1, u64)
 
+struct dma_buf_sync_partial {
+	__u64 flags;
+	__u32 offset;
+	__u32 len;
+};
+
+#define DMA_BUF_IOCTL_SYNC_PARTIAL	_IOW(DMA_BUF_BASE, 2, struct dma_buf_sync_partial)
+
 #endif
-- 
2.25.1



