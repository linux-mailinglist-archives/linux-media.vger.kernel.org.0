Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3E2E430FA1
	for <lists+linux-media@lfdr.de>; Mon, 18 Oct 2021 07:06:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230323AbhJRFH5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Oct 2021 01:07:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230165AbhJRFHg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Oct 2021 01:07:36 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9E19C061745;
        Sun, 17 Oct 2021 22:05:25 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id kk10so11397651pjb.1;
        Sun, 17 Oct 2021 22:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=29PDo+p3EfHpq27CPeMSdLjX2BQJx7Ug0wrORCRfK58=;
        b=WJYWfuPh+OajY6dsQk2+VLx1e7YWW1RyMbR/5byyZ+B/b5kzYKUECdrcefwao9KBAx
         KTU5w4TA691xtWhZCeKRbQyEn+XrHUqnUmzLnoctTfZOlO5a8A92PXlvR7vq+fw14a9y
         gxHv/j7lePr/OmX2X1OjAyCu2XeYpu8OUEMC3Lv9iou+eAm9Ih1p4a1qtc+7dZTomVQB
         FJdgVUQp8McDmnKY69rW7OKEkq3rT4vyIppfPe9M51VKw8KI9qjC3AER6k821Xsbhwjg
         uWyrn8UPwqDn4Rh5xQQVC3LMz+01O40VUN6sYPEmVUP/A850w4+AF0PWTz39Erz9PeLe
         k0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=29PDo+p3EfHpq27CPeMSdLjX2BQJx7Ug0wrORCRfK58=;
        b=tEnDyBqJpK6rE7AYZ8fT300+RLrqCkX7Gw4XfTSk7ju44UQjAo7ZYCubd+c/znrEJB
         MFrOPn6z0iQJkk6xCYyedE0KEFXBQIPx1yeLuuhT02HSY9795IRdLc/swlrdvVZVyfhS
         NCmuFQ1sr9ZtLKFdCKrenLDyA3WcbW0BmT+DXCxFzY4J7VZWZYoj++bBsuAKwIPTUljT
         I/eWIRMffX/wIeNXtlQJ9ch78V5Ziis8R5ZeIRqLiG/yD36s6vR3lEsm6jtJ4V4SqZVh
         r1keDjC1TToq48WX8fyhl5iEtK/0Ofg4m1rgFqYHbcNIzyKG1WR7Xg9e0andl3BCZ1yX
         gnbA==
X-Gm-Message-State: AOAM532Vg607ZAMgb0EuxagJlUakjp7vZ2eCOuEUbZhz9OgtuxAKbVZV
        Mtf4GbtvTC+XnPPsTcKNkcg=
X-Google-Smtp-Source: ABdhPJzQ00mI5AcAKN07GqU2OI5fsgC7XyeknXIjjUsm/1r60g9CUJFoAmlN+s/52us+I1GjFqtQcA==
X-Received: by 2002:a17:90a:6782:: with SMTP id o2mr45230800pjj.165.1634533525461;
        Sun, 17 Oct 2021 22:05:25 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id c205sm11416625pfc.43.2021.10.17.22.05.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 17 Oct 2021 22:05:25 -0700 (PDT)
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
Subject: [PATCH v5 06/10] media: videobuf2: Fix the size printk format
Date:   Mon, 18 Oct 2021 13:04:44 +0800
Message-Id: <1634533488-25334-7-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634533488-25334-1-git-send-email-dillon.minfei@gmail.com>
References: <1634533488-25334-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dillon Min <dillon.minfei@gmail.com>

Since the type of parameter size is unsigned long,
it should printk by %lu, instead of %ld, fix it.

Fixes: 7952be9b6ece ("media: drivers/media/common/videobuf2: rename from videobuf")
Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
 drivers/media/common/videobuf2/videobuf2-dma-contig.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index b052a4e36961..28b917e03929 100644
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
@@ -298,7 +298,7 @@ static int vb2_dc_mmap(void *buf_priv, struct vm_area_struct *vma)
 
 	vma->vm_ops->open(vma);
 
-	pr_debug("%s: mapped dma addr 0x%08lx at 0x%08lx, size %ld\n",
+	pr_debug("%s: mapped dma addr 0x%08lx at 0x%08lx, size %lu\n",
 		 __func__, (unsigned long)buf->dma_addr, vma->vm_start,
 		 buf->size);
 
-- 
2.7.4

