Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 019F9430F8C
	for <lists+linux-media@lfdr.de>; Mon, 18 Oct 2021 07:05:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230022AbhJRFHn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Oct 2021 01:07:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230024AbhJRFHd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Oct 2021 01:07:33 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0CD7C061770;
        Sun, 17 Oct 2021 22:05:20 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id qe4-20020a17090b4f8400b0019f663cfcd1so13634898pjb.1;
        Sun, 17 Oct 2021 22:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/KgrHMBG00+hza4vEi3Sk5N+IhB5EN8dqeg+sPQiG6I=;
        b=pzPqaClK6ufzAvRjvqqGVvNodlH+jFduWTq3rrLMyo1Yfv9N+HKZnyTtipSk7tEnu7
         7p/L4vQDzml6066nVC1pkb2uKk+317ERWxHfeVRE3DYWOeM7NlbcQAp0HI9WsgL0x8JK
         eMJ5taQ82xnJsE/jVfvyazB4R8Fjuo88XvQNExTyh8GynNjUtXkX/805ZTPrbjwvltTB
         upDOsxhJQ/SjMKt0eX/sPtR5hNH5XL78mxVAHRYKFgBsEx8IaMTPVVl9HFmsPpkdXwlA
         q2xFIvP0gLA3tr8fGGL4H6ZnhzRQJ/ggz1K3ESxP2nPaHCiZiVXhIx52nkRnmc8nBg7D
         9TIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/KgrHMBG00+hza4vEi3Sk5N+IhB5EN8dqeg+sPQiG6I=;
        b=eFEJyZyswX3OFXRl1DzB79szVxYf/y9qL5F3J+P91x2Q+57okCW3salkcxFBrCEq8I
         REl9JrgNRpWzx2aA3HAQPWQs/Or/z7hgaXSkmK5ThHDaCZIYzF5oUKqVTWBcRgp4Kw1R
         1rjS59HwVR1vyampr1wM5mlpWUzBaQgE4UDvmlmOZMNf6phyuLR2HG/yWfCaNlHxgQP+
         44D2jsbBylbdGKBeCNc62VpSlHz1nlYEuWd6fFxVc+ANwSF+4K0+WjCOpw8F+csiVOlw
         G1w2ybwf9+O4wRYItmgNLHG3yrTfjzthSWUVWOvJRh1hFS2nGUeMs6amnHlPucRrmi/P
         hyZw==
X-Gm-Message-State: AOAM5307MQCvu12RCgq9X8PO8MLt1Qepf+6aFHUhPweu8a+/80tIfc5T
        /Y2f7gga+/6DbhvOlcNp9+0=
X-Google-Smtp-Source: ABdhPJz/mImGiCkwikDmckDe5cBvFzhIYC2QZquvZMhrF13R4qnXEjlRrntbc5i8TeX5qn5A1bcf0A==
X-Received: by 2002:a17:902:e353:b0:13f:3276:a9d8 with SMTP id p19-20020a170902e35300b0013f3276a9d8mr25215762plc.81.1634533520585;
        Sun, 17 Oct 2021 22:05:20 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id c205sm11416625pfc.43.2021.10.17.22.05.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 17 Oct 2021 22:05:20 -0700 (PDT)
From:   dillon.minfei@gmail.com
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
        devicetree@vger.kernel.org, Dillon Min <dillon.minfei@gmail.com>
Subject: [PATCH v5 05/10] media: v4l2-mem2mem: add v4l2_m2m_get_unmapped_area for no-mmu platform
Date:   Mon, 18 Oct 2021 13:04:43 +0800
Message-Id: <1634533488-25334-6-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634533488-25334-1-git-send-email-dillon.minfei@gmail.com>
References: <1634533488-25334-1-git-send-email-dillon.minfei@gmail.com>
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
v5: no change.

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

