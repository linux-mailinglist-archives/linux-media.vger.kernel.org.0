Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0C2B43ACDE
	for <lists+linux-media@lfdr.de>; Tue, 26 Oct 2021 09:12:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234309AbhJZHOo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Oct 2021 03:14:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234746AbhJZHOZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Oct 2021 03:14:25 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A87BC061348;
        Tue, 26 Oct 2021 00:12:02 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id 75so13258009pga.3;
        Tue, 26 Oct 2021 00:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=dxEoE3z3QyUF2/I3A7I9pyjQJbuepmY3kvNx8IZRwGg=;
        b=CmYoQgZTvVIPPzJ6zq3Z+6T3ttzskepfKoJmie5YHSHo1EIgCPN5WWc5Pe7SrNvjZh
         pL9L6hwzUHWtejlW1+Hw3S5hRq7inotQQhYo8Wl9X7OohBCSyD4/LLTN6QXT6jfiuq5E
         HoF6Iba+nHlEfh66Vo9yclfH0A3zvaCylQaAWnfS1LfeHf9SI2qEqRXB+ZM9WrmasQsz
         ryE5SYt4b6hLc8l2OIpRlZ6Yc/nwGQs8RDhlH2orO7MrHV/bXKCSKNoAbgQPBDr+AbUQ
         +SuVQdeW0ghsbt6Y6Ih9mN9S3ozEgS4NIUb+q570VtrqndR2Rg/Gkfr95KCaDHQA9rx0
         cy+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=dxEoE3z3QyUF2/I3A7I9pyjQJbuepmY3kvNx8IZRwGg=;
        b=jjmvp0PwkgjVmEtIsg4L04K1sglZ8KrKmIy0hWtYJyQojNR4CLwpjTweQZyOkw9bCf
         COarNF2OoC7oe93VgtEwySlovWs7aPLzeYx3JKhVUjiVHlVoW8H56ug/J3qh132AwhBQ
         n+A8iqCP2yYvRHt6BmcAKOBTKicdQqdx8ss7MGLWr/CHvurxtytx0AVUDcRXf1iMYu2A
         GI2+5PKk5+vvKtMNrs1YotyPfqYFKEYBzsdWaSEB9R5CT9i5Vd3xqDAsB4QG1ZwMdQzP
         tXQHw8haOhPPbeC4XZ46o7iZHf45I5+5j2tmrvhWMlfkNV2lKRGjx/OCTzlMJMO80fAd
         AUYw==
X-Gm-Message-State: AOAM5333xBIDDEQMVj/o0lRVHNlCjpwBJotPnTa+e8iWXmwUinQFiMIC
        TJBHq3W3tKMM9108rnPMRto=
X-Google-Smtp-Source: ABdhPJxl+nO2g7yQI971iTkXUajKfvqScKWHJ40sy8+37DVb/q4vd7Ytk8NPpyCTRi+OClxNXDttXA==
X-Received: by 2002:aa7:914f:0:b0:44d:6f5e:f11a with SMTP id 15-20020aa7914f000000b0044d6f5ef11amr23157212pfi.10.1635232321984;
        Tue, 26 Oct 2021 00:12:01 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id l11sm23243367pjg.22.2021.10.26.00.11.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Oct 2021 00:12:01 -0700 (PDT)
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
        devicetree@vger.kernel.org, lkp@intel.com, kbuild-all@lists.01.org,
        llvm@lists.linux.dev
Subject: [PATCH v7 06/10] media: videobuf2: Fix the size printk format
Date:   Tue, 26 Oct 2021 15:11:18 +0800
Message-Id: <1635232282-3992-7-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635232282-3992-1-git-send-email-dillon.minfei@gmail.com>
References: <1635232282-3992-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since the type of parameter size is unsigned long,
it should printk by %lu, instead of %ld, fix it.

Fixes: 7952be9b6ece ("media: drivers/media/common/videobuf2: rename from videobuf")

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
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

