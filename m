Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E04838ADE9
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 14:18:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240034AbhETMTF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 08:19:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233987AbhETMSy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 08:18:54 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B709CC07A838;
        Thu, 20 May 2021 04:06:00 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id cu11-20020a17090afa8bb029015d5d5d2175so5236937pjb.3;
        Thu, 20 May 2021 04:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=IO9gCXt5G5Vx6kyEErgKK+AsLPPmYTdtrOpDyDyzIfE=;
        b=BaA/UJNpsKEcjBOX6ghvwnyih8vBBnH2fgzDmx2jktPD/xKfrOBuMX+9BdaReBeo6Q
         3+wADgFOpDZJWOrJEb48CvtpVxcxerq3LOb0FiDdcBf3cF0k1z6vKM8KIslBr9ID4yKK
         +bn8BAL2ZC4idEELSHX2vuN+yXYFrK1Q5LCizjsQH4kjb2qak+kSHiK7Lth6cSHQdv+C
         HBYrwmraY/U7jMmtyYX2u+VlDQxHWV+FTDoA+mN/DqwcL5jq3aDGXAFannrTszrSP+M8
         AxxOHC2Ihv4htsbhTHTGe2hGdYcF14tHPHjlvesVoaafhD/T0guBdSlPVgo5V++QD3EY
         7vTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=IO9gCXt5G5Vx6kyEErgKK+AsLPPmYTdtrOpDyDyzIfE=;
        b=OagpEExIzmCRenm4zSuTtFa7bLnzaD01//T4NSsZPGMCd9R403FQzjJfwqT7zmnB2U
         cEC1hb7CvNTZvX2Vq1SGvfHzSFr1i2DuVan/iC017EForQ0ESvJy3kdMaV/jdGI67FOL
         rUKtZjbdGWMmsmyQKt4DpvPbNZAhpQiA20toNo8Lc9i6f1V1I8vrlYq9QpNJJGfjTd/G
         c07Osma6SuUEj8+TAxYhSrej6KgFyt5gP4OpKc2dsN8o9nh48qvKXerKPmnFhVNLU3Wz
         8KuGnExd8SrDwydPJeDTz8qxFiTP+6/inI1qjb/u0PSxOs9NbaHlmZtD8THxOlXYcpjN
         +eiQ==
X-Gm-Message-State: AOAM531gaflvdEoWAW1RR1Je/xT03wnltaSe1dRgdh983IKcGtEk0wyA
        HhEWyCLTUUKKt8DUJAjN7xQ=
X-Google-Smtp-Source: ABdhPJxD360vWD89Doeb1D5W6uK02Tt1N3UM2GmGK7odaUpIi575QvqaXGc0IElISKF9+cphuXZbRA==
X-Received: by 2002:a17:902:a70f:b029:ea:d4a8:6a84 with SMTP id w15-20020a170902a70fb02900ead4a86a84mr5271791plq.42.1621508760307;
        Thu, 20 May 2021 04:06:00 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id hk15sm5839121pjb.53.2021.05.20.04.05.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 May 2021 04:06:00 -0700 (PDT)
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
Subject: [PATCH 6/7] media: v4l2-mem2mem: add v4l2_m2m_get_unmapped_area for no-mmu platform
Date:   Thu, 20 May 2021 19:05:26 +0800
Message-Id: <1621508727-24486-7-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621508727-24486-1-git-send-email-dillon.minfei@gmail.com>
References: <1621508727-24486-1-git-send-email-dillon.minfei@gmail.com>
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
 drivers/media/v4l2-core/v4l2-mem2mem.c | 20 ++++++++++++++++++++
 include/media/v4l2-mem2mem.h           |  4 ++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index e7f4bf5bc8dd..f82a18ecab2f 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -966,6 +966,26 @@ int v4l2_m2m_mmap(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 }
 EXPORT_SYMBOL(v4l2_m2m_mmap);
 
+#ifndef CONFIG_MMU
+unsigned long v4l2_m2m_get_unmapped_area(struct file *file, unsigned long addr,
+		unsigned long len, unsigned long pgoff, unsigned long flags)
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
index 5a91b548ecc0..91269227c265 100644
--- a/include/media/v4l2-mem2mem.h
+++ b/include/media/v4l2-mem2mem.h
@@ -495,6 +495,10 @@ __poll_t v4l2_m2m_poll(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 int v4l2_m2m_mmap(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 		  struct vm_area_struct *vma);
 
+#ifndef CONFIG_MMU
+unsigned long v4l2_m2m_get_unmapped_area(struct file *file, unsigned long addr,
+		unsigned long len, unsigned long pgoff, unsigned long flags);
+#endif
 /**
  * v4l2_m2m_init() - initialize per-driver m2m data
  *
-- 
2.7.4

