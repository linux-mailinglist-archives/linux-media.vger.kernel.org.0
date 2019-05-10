Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22E67195E9
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2019 02:00:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726931AbfEJAAp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 May 2019 20:00:45 -0400
Received: from mail-vk1-f202.google.com ([209.85.221.202]:51130 "EHLO
        mail-vk1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726928AbfEJAAo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 May 2019 20:00:44 -0400
Received: by mail-vk1-f202.google.com with SMTP id k78so1675030vkk.17
        for <linux-media@vger.kernel.org>; Thu, 09 May 2019 17:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=qD8P7476YfiQtjv1E6lcuRrJ6WjHMdxq7Sq+F+HQQEQ=;
        b=IaPLSmzKORGLubRZrX1/p4t4QHdGUfNfnAEmoGdLAHRQoPsbSW6uDDBJOb9f3LXHek
         sk+DwsYhcfhq+7j7K45imBSSCNuSDwLYpIRvzQc8+Nu5EJrX/tI4imfG8SYqs9ghzmuM
         EWqHxg0TO7vL6iRBOVhbxCQr9Frq6HSfIio/r8BFcFG3YqICHmpbYug5nLJyKSSuIZnm
         4z9JtbJZ6F/gyewF5ZKdOLsVPObowxwUPTH8fP2+Jab1Q4XT5XJSoLn509G7HlSfKNux
         OQ1pHDC1iRC+lLM1SfCg3g+mij6MB0TAg6QuSwiXXC4ZX3CoHijLVAdRnvhmiGsvI+j4
         5Aow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=qD8P7476YfiQtjv1E6lcuRrJ6WjHMdxq7Sq+F+HQQEQ=;
        b=AvzuC+r3kZLZCSN36hPvvoPipIyF0tex4SllPCl/QOOmIa2EGudE6FMqKpeekweP53
         J4uSrmShye839vnhOsWsV0z+RFshnx3L2JyBzekQNlTNGO3l3S6XPz15VAmtkL+NZzDG
         b8PAgwcxtVwrONlJml1RzS+hPGVbwBc00pFzj46tIqINJCHFwsgRiS80BGc1YGFoUnSk
         6sDfhJplM91yOASQ2uT8RrXeC8WxRjex6+L1ErZzaGxcNxS3GP07jv+tYRhjkwbIqlxR
         bafXZy7nBxTRYMb9McMrnlnjYXW4z1y2TrM5zQ2Z4PbPRbeVwFAsmI+xPnjWLO/K5TzG
         Vu/w==
X-Gm-Message-State: APjAAAWBa3Mt87z3KXvFB95CiLygMzsEIXBWhy3Y6KAOcZR9Uz2g/l6R
        abqXAVugmO80Mf/2ZapPf6MD0uYB+Q==
X-Google-Smtp-Source: APXvYqyQxj4h5EKFqbJwstNLfU5pFLcxwQyE6tubj5ad3UX+SHoN3VqGEtU8yaujXV/3yBwO0e+/NOKcuw==
X-Received: by 2002:a67:79ca:: with SMTP id u193mr3938693vsc.20.1557446442991;
 Thu, 09 May 2019 17:00:42 -0700 (PDT)
Date:   Thu,  9 May 2019 17:00:32 -0700
In-Reply-To: <20190510000032.40749-1-fengc@google.com>
Message-Id: <20190510000032.40749-4-fengc@google.com>
Mime-Version: 1.0
References: <20190510000032.40749-1-fengc@google.com>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
Subject: [dma-buf v3 3/3] dma-buf: add show_fdinfo handler
From:   Chenbo Feng <fengc@google.com>
To:     linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>, erickreyes@google.com,
        kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Greg Hackmann <ghackmann@google.com>

The show_fdinfo handler exports the same information available through
debugfs on a per-buffer basis.

Signed-off-by: Greg Hackmann <ghackmann@google.com>
Signed-off-by: Chenbo Feng <fengc@google.com>
---
 drivers/dma-buf/dma-buf.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index c1da5f9ce44d..c4efc272fc34 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -381,6 +381,20 @@ static long dma_buf_ioctl(struct file *file,
 	}
 }
 
+static void dma_buf_show_fdinfo(struct seq_file *m, struct file *file)
+{
+	struct dma_buf *dmabuf = file->private_data;
+
+	seq_printf(m, "size:\t%zu\n", dmabuf->size);
+	/* Don't count the temporary reference taken inside procfs seq_show */
+	seq_printf(m, "count:\t%ld\n", file_count(dmabuf->file) - 1);
+	seq_printf(m, "exp_name:\t%s\n", dmabuf->exp_name);
+	mutex_lock(&dmabuf->lock);
+	if (dmabuf->name)
+		seq_printf(m, "name:\t%s\n", dmabuf->name);
+	mutex_unlock(&dmabuf->lock);
+}
+
 static const struct file_operations dma_buf_fops = {
 	.release	= dma_buf_release,
 	.mmap		= dma_buf_mmap_internal,
@@ -390,6 +404,7 @@ static const struct file_operations dma_buf_fops = {
 #ifdef CONFIG_COMPAT
 	.compat_ioctl	= dma_buf_ioctl,
 #endif
+	.show_fdinfo	= dma_buf_show_fdinfo,
 };
 
 /*
-- 
2.21.0.1020.gf2820cf01a-goog

