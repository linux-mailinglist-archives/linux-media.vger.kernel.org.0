Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2A7642D715
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 12:26:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230357AbhJNK2Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Oct 2021 06:28:16 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:39604 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230313AbhJNK2C (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Oct 2021 06:28:02 -0400
X-UUID: 1a8d7129b1744671aff135bc3ae3ebfa-20211014
X-UUID: 1a8d7129b1744671aff135bc3ae3ebfa-20211014
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
        (envelope-from <guangming.cao@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 95578546; Thu, 14 Oct 2021 18:25:55 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 14 Oct 2021 18:25:54 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 14 Oct 2021 18:25:53 +0800
From:   <guangming.cao@mediatek.com>
To:     <christian.koenig@amd.com>, <sumit.semwal@linaro.org>
CC:     <dri-devel@lists.freedesktop.org>, <guangming.cao@mediatek.com>,
        <linaro-mm-sig@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
        <rdunlap@infradead.org>, <wsd_upstream@mediatek.com>,
        Guangming Cao <Guangming.Cao@mediatek.com>
Subject: [PATCH v3] dma-buf: remove restriction of IOCTL:DMA_BUF_SET_NAME
Date:   Thu, 14 Oct 2021 18:25:51 +0800
Message-ID: <20211014102551.54983-1-guangming.cao@mediatek.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211012084109.176542-1-guangming.cao@mediatek.com>
References: <20211012084109.176542-1-guangming.cao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Guangming Cao <Guangming.Cao@mediatek.com>

In this patch(https://patchwork.freedesktop.org/patch/310349),
it add a new IOCTL to support dma-buf user to set debug name.

But it also added a limitation of this IOCTL, it needs the
attachments of dmabuf should be empty, otherwise it will fail.

For the original series, the idea was that allowing name change
mid-use could confuse the users about the dma-buf.
However, the rest of the series also makes sure each dma-buf have a unique
inode(https://patchwork.freedesktop.org/patch/310387/), and any accounting
should probably use that, without relying on the name as much.

So, removing this restriction will let dma-buf userspace users to use it
more comfortably and without any side effect.

Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>
---
 drivers/dma-buf/dma-buf.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 511fe0d217a0..5fbb3a2068a3 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -325,10 +325,8 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
 
 /**
  * dma_buf_set_name - Set a name to a specific dma_buf to track the usage.
- * The name of the dma-buf buffer can only be set when the dma-buf is not
- * attached to any devices. It could theoritically support changing the
- * name of the dma-buf if the same piece of memory is used for multiple
- * purpose between different devices.
+ * It could support changing the name of the dma-buf if the same
+ * piece of memory is used for multiple purpose between different devices.
  *
  * @dmabuf: [in]     dmabuf buffer that will be renamed.
  * @buf:    [in]     A piece of userspace memory that contains the name of
@@ -341,25 +339,16 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
 static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
 {
 	char *name = strndup_user(buf, DMA_BUF_NAME_LEN);
-	long ret = 0;
 
 	if (IS_ERR(name))
 		return PTR_ERR(name);
 
-	dma_resv_lock(dmabuf->resv, NULL);
-	if (!list_empty(&dmabuf->attachments)) {
-		ret = -EBUSY;
-		kfree(name);
-		goto out_unlock;
-	}
 	spin_lock(&dmabuf->name_lock);
 	kfree(dmabuf->name);
 	dmabuf->name = name;
 	spin_unlock(&dmabuf->name_lock);
 
-out_unlock:
-	dma_resv_unlock(dmabuf->resv);
-	return ret;
+	return 0;
 }
 
 static long dma_buf_ioctl(struct file *file,
-- 
2.17.1

