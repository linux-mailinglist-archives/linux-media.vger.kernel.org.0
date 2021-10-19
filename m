Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE135433163
	for <lists+linux-media@lfdr.de>; Tue, 19 Oct 2021 10:44:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234132AbhJSIqO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Oct 2021 04:46:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234853AbhJSIqL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Oct 2021 04:46:11 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FC99C061769;
        Tue, 19 Oct 2021 01:43:59 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id c4so11653134pgv.11;
        Tue, 19 Oct 2021 01:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=bzatNTKpIv4BlIffEmGaVOIbeC0H54OClaqsGTk2+Zw=;
        b=qk7Y6aaMUw7p1AOJxfTf2XvqG/q3sA/j53YkVdm8QLrdckbgaUezhy/mMlukXg90zo
         MZV5oN4Aaxku9fKZllIPnAuQ6NNK405v/+g/WgeZxy+chQlTrKLjwhulejmmdmRlIR7K
         2hJEF85Zno0QNPzYP8m02Q1tuQlVtxAtw4hH/t9FE2/TbPftRREs41NVFkfbEE9CxSGf
         dEHCi8BNUNF1ahlouuwBqL6YnmYOEPuZCBvB7HI9U/ZiRMUWdaLw5Eu2Go9GUrnSzIvR
         fiJn1CwBWTsflWGR95/gRCKBHKYkQ2c6UOUUg89AlKQR/1tWPlmc2nhxxzsUgjtY3kB8
         nQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=bzatNTKpIv4BlIffEmGaVOIbeC0H54OClaqsGTk2+Zw=;
        b=pthIo55+KZBa9qmC3iabEwfu/xx6AWvEX9ICQ8Y4J5q2XnWXLRLD7ZYz/iSl8k962i
         g5aO61w8OOIozSip4bbCnBtUODPHKv8kXoNIFH8X7OCYDJ7MH96gCiVZjDklUk3/l9o7
         d3UkWyj1kJLzXxOSQdQ0r9CSeqUjZQ49Nd2STLo3HerjV2ACcZnts+6WIpZx7QdcHmmy
         nBbwiddSkOTSnueK7O7RsLp2AZczjKZBpoJDa1V3/+ED7oG8a2bodybUjsM38hs/ZuSd
         voQEp3lfRFMVEFSxNwx61Ub5RiXgMUTKAYyCufFinWHC9/EWebrFROo8qUs6ah/kuOzY
         4qHQ==
X-Gm-Message-State: AOAM533mdkfvdiZLQS2X5g0wWFzYQjZ05rpIotEcWLJk3wO97qo2+DYI
        0KJdjLEJOt8nf/76j9PiSC0=
X-Google-Smtp-Source: ABdhPJz+zYTYXbwfcmo91WNsXUpc7Oih0DAr+aAgVCIyj8vNlImqLPgcmEXprlJD34M6ApWH0IUUCA==
X-Received: by 2002:a63:5b09:: with SMTP id p9mr27544244pgb.321.1634633038976;
        Tue, 19 Oct 2021 01:43:58 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id c11sm1824716pji.38.2021.10.19.01.43.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Oct 2021 01:43:58 -0700 (PDT)
From:   Dillon Min <dillon.minfei@gmail.com>
To:     mchehab@kernel.org, mchehab+huawei@kernel.org,
        hverkuil-cisco@xs4all.nl, ezequiel@collabora.com, gnurou@gmail.com,
        pihsun@chromium.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org, gabriel.fernandez@st.com,
        gabriel.fernandez@foss.st.com
Cc:     patrice.chotard@foss.st.com, hugues.fruchet@foss.st.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v6 06/10] media: videobuf2: Fix the size printk format
Date:   Tue, 19 Oct 2021 16:43:19 +0800
Message-Id: <1634633003-18132-7-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634633003-18132-1-git-send-email-dillon.minfei@gmail.com>
References: <1634633003-18132-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since the type of parameter size is unsigned long,
it should printk by %lu, instead of %ld, fix it.

Fixes: 7952be9b6ece ("media: drivers/media/common/videobuf2: rename from videobuf")

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
v6: no change.

 drivers/media/common/videobuf2/videobuf2-dma-contig.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index b052a4e36961..7cd6648ccd26 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -257,7 +257,7 @@ static void *vb2_dc_alloc(struct vb2_buffer *vb,
 		ret = vb2_dc_alloc_coherent(buf);
 
 	if (ret) {
-		dev_err(dev, "dma alloc of size %ld failed\n", size);
+		dev_err(dev, "dma alloc of size %lu failed\n", size);
 		kfree(buf);
 		return ERR_PTR(-ENOMEM);
 	}
@@ -298,9 +298,9 @@ static int vb2_dc_mmap(void *buf_priv, struct vm_area_struct *vma)
 
 	vma->vm_ops->open(vma);
 
-	pr_debug("%s: mapped dma addr 0x%08lx at 0x%08lx, size %ld\n",
-		__func__, (unsigned long)buf->dma_addr, vma->vm_start,
-		buf->size);
+	pr_debug("%s: mapped dma addr 0x%08lx at 0x%08lx, size %lu\n",
+		 __func__, (unsigned long)buf->dma_addr, vma->vm_start,
+		 buf->size);
 
 	return 0;
 }
-- 
2.7.4

