Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D80A13AB3D
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2020 14:41:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728820AbgANNl0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jan 2020 08:41:26 -0500
Received: from mail-pl1-f202.google.com ([209.85.214.202]:44557 "EHLO
        mail-pl1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726106AbgANNl0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jan 2020 08:41:26 -0500
Received: by mail-pl1-f202.google.com with SMTP id h8so5131425plr.11
        for <linux-media@vger.kernel.org>; Tue, 14 Jan 2020 05:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=d+VdQ2mgKVufPtzjAPQVlGG6NNayGmHdnWPr+cE7Zlg=;
        b=vxydxJ9xqFxpwBc2+UwfYvzeeJpgLwd/1r3pppsJwIBl+STg3q0/MMmyu1axqmnaru
         xm1giynSu1419J1y6kfH0IL7f14D7iMnLFgrdvN+uW/rFSqIUTfQAJDX1TX/hOqcTFk2
         /N/tVvCsqfdw3ynNPIdX6QiaX/K3m0u4q5S1gZD4BZHVw0bNyLZAxfxEPRMSodC14qHM
         gwe4snUrF2jaul+wVyR65CvZh8lJtSp3kvPq8aenqxz5Y7ME575tTVtSPalakIOnqUFa
         OvhOat5LFFF83Ushb6mvW3v5Pf/9ysaOK6jgFLm8UQ06wvVXwtxrVSps2GRn2YfUIpal
         3iKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=d+VdQ2mgKVufPtzjAPQVlGG6NNayGmHdnWPr+cE7Zlg=;
        b=QUI8+NeJcWUMV6HP6KzN1+VfbdJuwV3Hs2ZcwUlXRG/gyrZEYH5uhilKL5UchZZQzd
         Bv6a9b27aZFEIFylzeA/oG8lvPsP/u73bOJbwqBaXpRKFtQA4ogMnb1tHNDQX79Zyj8P
         6I7r9Dq2ZKj6TqIXW1vX87Uy4VLQM17SVcgtBCJUpSVq0Yb/8StTptuE/41ANgtdlm9h
         1YCCRyVlsiq3XYAu2eeRjBLzhkR2iaQj0uZZdgFAAYEGSUZy1fqPi6fSoyw29uN9tUyF
         dKnmhkYthsTr2skH9ivETuCNkowj08A07CBFfVqulpHq3QEQJJ6DTpTwqPEiLJjDHmnr
         cWDQ==
X-Gm-Message-State: APjAAAWLK7Jb8430vCEtWKmkuTth+cSW2M8mq1SJoNaX8qezRpB0SdMY
        0SIKVYFtuIO5ljsONK0fPrPaItW6kTpIzLE=
X-Google-Smtp-Source: APXvYqxPytptLgvCOeDIY8GJeYREKZybdYA2zNzqFDpmj8uJG4bTWCrOZJ7jIuAoqRo47+i8Apc/fTaIZr2pw90=
X-Received: by 2002:a63:9d85:: with SMTP id i127mr25739436pgd.186.1579009285567;
 Tue, 14 Jan 2020 05:41:25 -0800 (PST)
Date:   Tue, 14 Jan 2020 21:41:01 +0800
Message-Id: <20200114134101.159194-1-liumartin@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
Subject: [PATCH] dma-buf: support 32bit DMA_BUF_SET_NAME ioctl
From:   Martin Liu <liumartin@google.com>
To:     sumit.semwal@linaro.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        liumartin@google.com, jenhaochen@google.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This commit adds SET_NAME ioctl coversion to
support 32 bit ioctl.

Signed-off-by: Martin Liu <liumartin@google.com>
---
 drivers/dma-buf/dma-buf.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index ce41cd9b758a..a73048b34843 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -25,6 +25,7 @@
 #include <linux/mm.h>
 #include <linux/mount.h>
 #include <linux/pseudo_fs.h>
+#include <linux/compat.h>
 
 #include <uapi/linux/dma-buf.h>
 #include <uapi/linux/magic.h>
@@ -409,13 +410,32 @@ static void dma_buf_show_fdinfo(struct seq_file *m, struct file *file)
 	dma_resv_unlock(dmabuf->resv);
 }
 
+#ifdef CONFIG_COMPAT
+static long dma_buf_ioctl_compat(struct file *file, unsigned int cmd,
+				 unsigned long arg)
+{
+	switch (_IOC_NR(cmd)) {
+	case _IOC_NR(DMA_BUF_SET_NAME):
+		/* Fix up pointer size*/
+		if (_IOC_SIZE(cmd) == sizeof(compat_uptr_t)) {
+			cmd &= ~IOCSIZE_MASK;
+			cmd |= sizeof(void *) << IOCSIZE_SHIFT;
+		}
+		break;
+	}
+	return dma_buf_ioctl(file, cmd, (unsigned long)compat_ptr(arg));
+}
+#endif
+
 static const struct file_operations dma_buf_fops = {
 	.release	= dma_buf_release,
 	.mmap		= dma_buf_mmap_internal,
 	.llseek		= dma_buf_llseek,
 	.poll		= dma_buf_poll,
 	.unlocked_ioctl	= dma_buf_ioctl,
-	.compat_ioctl	= compat_ptr_ioctl,
+#ifdef CONFIG_COMPAT
+	.compat_ioctl	= dma_buf_ioctl_compat,
+#endif
 	.show_fdinfo	= dma_buf_show_fdinfo,
 };
 
-- 
2.25.0.rc1.283.g88dfdc4193-goog

