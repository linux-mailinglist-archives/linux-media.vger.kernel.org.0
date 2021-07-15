Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 618663C9BB4
	for <lists+linux-media@lfdr.de>; Thu, 15 Jul 2021 11:27:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241079AbhGOJ2l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jul 2021 05:28:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236202AbhGOJ2j (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jul 2021 05:28:39 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26F6DC061760;
        Thu, 15 Jul 2021 02:25:47 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id 62so5477286pgf.1;
        Thu, 15 Jul 2021 02:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=m/Lq62zQC/ZLuIP1g6AP3azBlb4BnAyoWJG0y535CEU=;
        b=vB8qWgvszPrVov8dYj++hZ2fJhc4aqqN0FIeK3DUvRUtROJ3VgqvE830dgeKBC0Bwu
         TSrgVf2w77p69NsuDjWaxXZnlHaB4yRny1PKlaCDJ+n85Rt5z70tSE81AMV6eevARIF8
         KQ1h6l89bZKSUOE+wPcZB58SVikjE6qMOWba57l9uzPBKQyFs57IXnhCa8klKFfrxK5z
         yP7rDmjMwp+1vmk3PG4n6H5nHnUX0t5L1fLfBnA6TVGD3vOa/Djr567QLl8paFbM+iqW
         DMwMXQDTHTs1kGsg0woaBR3q0xUwA/j91oayQDrrBaojJ7NzYI6cM7h/730Yjc+59kww
         P6DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=m/Lq62zQC/ZLuIP1g6AP3azBlb4BnAyoWJG0y535CEU=;
        b=sZMa6+ZdBovTxR4jUpGJO8XnFhZ7OaZZInQMEvieqSuz8VxvVk6rLOVZi/IokC6Bjk
         7UTvEjpWyjKVtFTmm7tOz1wvZWgwMLuGsqYvO4lub0qkmuElzpHxrWChi+2SydiRsEyA
         Sol3jqd8uPwcgVEfnkGAWsGLVptdlRCEuTt3Y6Q7nFivBKGkNOg39UK+rE2ZBUJDpCmH
         +vWm8W5dBadn9Ub8hyivh7mlFwiVVcTq+d6nlO/4h7RlQObHLWOMGHQaQyYwDV1UwPp5
         9h/d+5HoD16OdszCJAE0FgWzbxg7wo8n4RgLpdveMTXso9AR/2gD5TlRc646AcnSl/Xl
         pS8w==
X-Gm-Message-State: AOAM530nfHV2iG4hXi6/7mx3RQ2GgnEsVHk/RYAxnN0sCEh7Wfb4yCBW
        +jH65E0YMxK8GCqMnJb9Uyw=
X-Google-Smtp-Source: ABdhPJzu45VGLxWM4fORPzTRwfpeV4fv13X1p6VBNpeHKocOwsluXxeGLD4lvtI1wJvBI6bZNohAPg==
X-Received: by 2002:a05:6a00:158e:b029:32b:9de5:a198 with SMTP id u14-20020a056a00158eb029032b9de5a198mr3741860pfk.3.1626341146759;
        Thu, 15 Jul 2021 02:25:46 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id 11sm6662503pge.7.2021.07.15.02.25.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Jul 2021 02:25:46 -0700 (PDT)
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
Date:   Thu, 15 Jul 2021 17:24:25 +0800
Message-Id: <1626341068-20253-17-git-send-email-dillon.minfei@gmail.com>
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

