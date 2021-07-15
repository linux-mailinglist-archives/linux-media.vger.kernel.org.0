Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9DF63C9B7C
	for <lists+linux-media@lfdr.de>; Thu, 15 Jul 2021 11:25:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240873AbhGOJ14 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jul 2021 05:27:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240821AbhGOJ14 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jul 2021 05:27:56 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BCBAC06175F;
        Thu, 15 Jul 2021 02:25:02 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id p4-20020a17090a9304b029016f3020d867so3632658pjo.3;
        Thu, 15 Jul 2021 02:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=m/Lq62zQC/ZLuIP1g6AP3azBlb4BnAyoWJG0y535CEU=;
        b=J7cItZOotGPgGmmK3Y9GaDICloT+uDY53d8YNYj4g21KU/W9x3BW3SZp2xlckotbYX
         xS+BKjzuqrQ/s1SHJ3m/bJQhL/O0dXy7UOy0fZ5FohGsPPM88vNW5pGoJrGXRj9YGYvK
         PPPRm49uhRlsSF3n4iX+XRD1+WhxfjhE4SQ8aeZGw+XrmNotuDNT/yDOv6WIr2HvDhzF
         l3405DRTQX3F5HLDxthiPZd6Wq2B6JPoy80LT2dIDGn9Vohbi7iGrYt/CYKA3Lp9QuUO
         a24bkc+nhcqIrLiRARkicNlo8drKNI+ipujBuMEvz6mLV1Q8kQ7+VaFP4coYz8Se8jb2
         Hn9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=m/Lq62zQC/ZLuIP1g6AP3azBlb4BnAyoWJG0y535CEU=;
        b=CM4EKbqDTQ47lF/mQuKc2L6xsgQOcVZB9YaK4z9qNMr8qoNPPdTB48yzgrdsuDLzat
         VKaLJPQBo01StahYKJndDyUvCKhkJAmA0gnH2vCfAGCNC9HDvi9Xn1sNMfo4MqDAgR6n
         TleMVI0HNZHnJYNftp1qzDE4aZqWuCKMJSULfRTl1ycQMDVXZp5hzG7ny+3qw1MSSuJR
         TY0lkb2OwbjLmpcfCzxC4V3ZLekVVZ5vFV/yaUPp+zBF9H9NmQpdqG227EEJu7797JLK
         QhLeCh0ObawBoQ94QyGvqJWFlk9J9FQ+4nz41NV9PqCqs1izBaNFQuvfqamms0zeb/N5
         oCMw==
X-Gm-Message-State: AOAM533Yvfy1MgEnbrc/37EupDjDpyNEfmqCzRU2WM1K1TTx5srrlsKq
        SZmmWeDNQmF6dCnMe9nfss4=
X-Google-Smtp-Source: ABdhPJyPuJI9bZEcwxu44fd7Z6mp4RPeVnQZBW1wXqAe6/Wh6mLtCCZSEi5VlAoDZVLDOoyAHbtH/w==
X-Received: by 2002:a17:90a:6d63:: with SMTP id z90mr3488583pjj.177.1626341101943;
        Thu, 15 Jul 2021 02:25:01 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id 11sm6662503pge.7.2021.07.15.02.24.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Jul 2021 02:25:01 -0700 (PDT)
From:   dillon.minfei@gmail.com
To:     mchehab@kernel.org, mchehab+huawei@kernel.org,
        hverkuil-cisco@xs4all.nl, ezequiel@collabora.com, gnurou@gmail.com,
        pihsun@chromium.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org
Cc:     patrice.chotard@foss.st.com, hugues.fruchet@foss.st.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Dillon Min <dillon.minfei@gmail.com>
Subject: [PATCH v2 6/9] media: v4l2-mem2mem: add v4l2_m2m_get_unmapped_area for no-mmu platform
Date:   Thu, 15 Jul 2021 17:24:15 +0800
Message-Id: <1626341068-20253-7-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1626341068-20253-1-git-send-email-dillon.minfei@gmail.com>
References: <1626341068-20253-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dillon Min <dillon.minfei@gmail.com>

For platforms without MMU the m2m provides a helper method
v4l2_m2m_get_unmapped_area(), The mmap() routines will call
this to get a proposed address for the mapping.

More detailed information about get_unmapped_area can be found in
Documentation/nommu-mmap.txt

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
v2: fix the warrnings from checkpatch.pl --strict, thanks Hans

 drivers/media/v4l2-core/v4l2-mem2mem.c | 21 +++++++++++++++++++++
 include/media/v4l2-mem2mem.h           |  5 +++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index e7f4bf5bc8dd..e2654b422334 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -966,6 +966,27 @@ int v4l2_m2m_mmap(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 }
 EXPORT_SYMBOL(v4l2_m2m_mmap);
 
+#ifndef CONFIG_MMU
+unsigned long v4l2_m2m_get_unmapped_area(struct file *file, unsigned long addr,
+					 unsigned long len, unsigned long pgoff,
+					 unsigned long flags)
+{
+	struct v4l2_fh *fh = file->private_data;
+	unsigned long offset = pgoff << PAGE_SHIFT;
+	struct vb2_queue *vq;
+
+	if (offset < DST_QUEUE_OFF_BASE) {
+		vq = v4l2_m2m_get_src_vq(fh->m2m_ctx);
+	} else {
+		vq = v4l2_m2m_get_dst_vq(fh->m2m_ctx);
+		pgoff -= (DST_QUEUE_OFF_BASE >> PAGE_SHIFT);
+	}
+
+	return vb2_get_unmapped_area(vq, addr, len, pgoff, flags);
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_get_unmapped_area);
+#endif
+
 #if defined(CONFIG_MEDIA_CONTROLLER)
 void v4l2_m2m_unregister_media_controller(struct v4l2_m2m_dev *m2m_dev)
 {
diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
index 5a91b548ecc0..fdbd5257e020 100644
--- a/include/media/v4l2-mem2mem.h
+++ b/include/media/v4l2-mem2mem.h
@@ -495,6 +495,11 @@ __poll_t v4l2_m2m_poll(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 int v4l2_m2m_mmap(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 		  struct vm_area_struct *vma);
 
+#ifndef CONFIG_MMU
+unsigned long v4l2_m2m_get_unmapped_area(struct file *file, unsigned long addr,
+					 unsigned long len, unsigned long pgoff,
+					 unsigned long flags);
+#endif
 /**
  * v4l2_m2m_init() - initialize per-driver m2m data
  *
-- 
2.7.4

