Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7141F49360B
	for <lists+linux-media@lfdr.de>; Wed, 19 Jan 2022 09:14:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352244AbiASIOY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Jan 2022 03:14:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235041AbiASIOX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Jan 2022 03:14:23 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 794B5C061574
        for <linux-media@vger.kernel.org>; Wed, 19 Jan 2022 00:14:23 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id w12-20020a17090a528c00b001b276aa3aabso5645807pjh.0
        for <linux-media@vger.kernel.org>; Wed, 19 Jan 2022 00:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nq/jKaSRe1/bkQM30U4aQy+RmE3rXa2zMWjbS6Sz4No=;
        b=BasuHzcz+xsL2EYzisN5MTFI5/39w44WqD8D57AnJbipJHEtataULAmhjBn0OIV1AU
         dMRoZ8R7bu40V0220L0PiLJYIehoIFXH4cVl/SW+tHoSWgk/EX/3/0pZZY3GFSQUz8pX
         lHb+TA3+kGT5DJze04wdiLHtfBZLczseuCwjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nq/jKaSRe1/bkQM30U4aQy+RmE3rXa2zMWjbS6Sz4No=;
        b=uWKyEEp2E3guExAPMTzDzx11eMfKk2fGiWd8QGvugBs4v29EjoK6e+nJWqK/PsSP58
         LJUtpUyV6CfDusoAVKgSd32bTe7689gd9X5wcpekDPbOo3ctqTvxo7gC1bM7oLh3waVx
         j8dmLvrXYDijiuRWd5VTech2cLsQOmNT4d8Mo1ZikbL5m8NPdFTQUT5bbFsX66GWO/GT
         xOLCMrPk2m3K3zCqtwxClTbHSyQgeknNwJmZFH5zgAWoyahWBcK+efKUrnvXA/qtAAHu
         lxFsKuAtYVB761Kkpiv5fQdE24kNouvG1xlb/TH/jAS5njMa4EUaMuJ34h97QIGusZPC
         AsGg==
X-Gm-Message-State: AOAM530OAJMzqhTY2UMcakcL3hZJ3di14OsaN1yBSQGki2Xps0UFbymf
        szQaUGIax3S7b6SEYhtsulhA7Q==
X-Google-Smtp-Source: ABdhPJwhR2yLhXftLhKAUkPrMElACWDPYckLp6U6HO0QVqNgDZ/KhnxLLweIwCs6CYg8QqZwC0H2pQ==
X-Received: by 2002:a17:90b:4b47:: with SMTP id mi7mr2943908pjb.79.1642580063062;
        Wed, 19 Jan 2022 00:14:23 -0800 (PST)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:3343:314a:558d:5df7])
        by smtp.gmail.com with ESMTPSA id nl3sm5128635pjb.36.2022.01.19.00.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 00:14:22 -0800 (PST)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Christoph Hellwig <hch@lst.de>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH] media: videobuf2-dma-contig: Invalidate vmap range before DMA range
Date:   Wed, 19 Jan 2022 17:14:17 +0900
Message-Id: <20220119081417.20604-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Christoph suggests [1] that invalidating vmap range before
direct mapping range makes more sense.

[1]: https://lore.kernel.org/all/20220111085958.GA22795@lst.de/
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 .../media/common/videobuf2/videobuf2-dma-contig.c    | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index 7c4096e62173..0e3f264122af 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -132,12 +132,12 @@ static void vb2_dc_prepare(void *buf_priv)
 	if (!buf->non_coherent_mem)
 		return;
 
-	/* For both USERPTR and non-coherent MMAP */
-	dma_sync_sgtable_for_device(buf->dev, sgt, buf->dma_dir);
-
 	/* Non-coherent MMAP only */
 	if (buf->vaddr)
 		flush_kernel_vmap_range(buf->vaddr, buf->size);
+
+	/* For both USERPTR and non-coherent MMAP */
+	dma_sync_sgtable_for_device(buf->dev, sgt, buf->dma_dir);
 }
 
 static void vb2_dc_finish(void *buf_priv)
@@ -152,12 +152,12 @@ static void vb2_dc_finish(void *buf_priv)
 	if (!buf->non_coherent_mem)
 		return;
 
-	/* For both USERPTR and non-coherent MMAP */
-	dma_sync_sgtable_for_cpu(buf->dev, sgt, buf->dma_dir);
-
 	/* Non-coherent MMAP only */
 	if (buf->vaddr)
 		invalidate_kernel_vmap_range(buf->vaddr, buf->size);
+
+	/* For both USERPTR and non-coherent MMAP */
+	dma_sync_sgtable_for_cpu(buf->dev, sgt, buf->dma_dir);
 }
 
 /*********************************************/
-- 
2.34.1.703.g22d0c6ccf7-goog

