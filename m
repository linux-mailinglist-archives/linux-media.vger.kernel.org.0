Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19C583D2C68
	for <lists+linux-media@lfdr.de>; Thu, 22 Jul 2021 21:08:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230253AbhGVS1Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jul 2021 14:27:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230153AbhGVS1Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jul 2021 14:27:24 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76689C061757
        for <linux-media@vger.kernel.org>; Thu, 22 Jul 2021 12:07:58 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id l11-20020a056902072bb029055ab4873f4cso8520929ybt.22
        for <linux-media@vger.kernel.org>; Thu, 22 Jul 2021 12:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=Y+4Q1LkGSotu1XfmzHQ6ryO/eeqhw4mJ1FyIbndgjZg=;
        b=TqWxnT/Z73qrMHnDvvmdUmHFCBG2MowDGm9qbSkEGL5dCyrUWFCjRlmaCwPnwOV+vE
         felNomI4J14yW6cG4cK8/fe5EmLr6cUafKEfxaLZtrN+y4CuWRbV/1MgW8Oe6G1oUXYe
         U5/snPPITJfuRauEaIlN2IvmysFsXc4W/reebG3h71BcT4s14CNHFwziy8vhd3JaNZVt
         vSNZwIv97aznzS4Lk6SBEfxWNAH0IGp4XobMfkNcfnErx0N0/srvH32mvyN9DTsAGx3Z
         FmvNLWsFRkpdPxysCstLgzcENMdmM//CzmYiJbMaBjzRUoMw5jvq0sqmc91ET7vecjor
         H7cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=Y+4Q1LkGSotu1XfmzHQ6ryO/eeqhw4mJ1FyIbndgjZg=;
        b=fsIqMpyfRw9DNmealSzOToN0pgjwHcFmgbXZapwLa+HQ/xSYMPfctZl5TmtWg1/jQS
         grnIV7vTYqd5gXl/IatGEGA75ED+SpAvf7K2mKUn2ucbRlEwGDVvj+25Emp1l4Jt/+RY
         Wiw1NIBNWQuj5koItJiSF0aJJcwTQUNRRQef2gFOos3hUJaIGIh5Z4L63YjwSvQ1jtre
         pbzrM3uAQrPFffyDye0qjeW1GyjL6mu8b7b+LX+3rz1nGcrLAXfhalvZDtvY6/OqYqkp
         sB+/ZeoH14NVG1wX+OdHo+sqtlwd4UfRCRIAob51Bb2V51+6c1gIQfBF23bzfZeheNLn
         mXGw==
X-Gm-Message-State: AOAM532n2brK8AtnEAzMLmyVzZiZS/PVlrI4x+p1vdIv4lvIP8ztGMKP
        BtJUkBpjlQaY8ALXJcHJp64VeKK83Hk=
X-Google-Smtp-Source: ABdhPJyN1TtBAly+n7sAFHUMK7tG6nh3fqZuhlgbAzUczufLDXVA9cjmsxqDsLqVj7oNjCMvjWh3qW/7kdU=
X-Received: from hridya.mtv.corp.google.com ([2620:15c:211:200:233e:4a37:d5d6:55d7])
 (user=hridya job=sendgmr) by 2002:a25:2589:: with SMTP id l131mr1337963ybl.451.1626980877695;
 Thu, 22 Jul 2021 12:07:57 -0700 (PDT)
Date:   Thu, 22 Jul 2021 12:07:46 -0700
Message-Id: <20210722190747.1986614-1-hridya@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.432.gabb21c7263-goog
Subject: [PATCH] dma-buf: heaps: Set allocation limit for system heap
From:   Hridya Valsaraju <hridya@google.com>
To:     Sumit Semwal <sumit.semwal@linaro.org>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@redhat.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        John Stultz <john.stultz@linaro.org>,
        "=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Cc:     kernel-team@android.com, gregkh@linuxfoundation.org,
        Hridya Valsaraju <hridya@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch limits the size of total memory that can be requested in a
single allocation from the system heap. This would prevent a
buggy/malicious client from depleting system memory by requesting for an
extremely large allocation which might destabilize the system.

The limit is set to half the size of the device's total RAM which is the
same as what was set by the deprecated ION system heap.

Signed-off-by: Hridya Valsaraju <hridya@google.com>
---
 drivers/dma-buf/heaps/system_heap.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index b7fbce66bcc0..099f5a8304b4 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -371,6 +371,12 @@ static struct dma_buf *system_heap_do_allocate(struct dma_heap *heap,
 	struct page *page, *tmp_page;
 	int i, ret = -ENOMEM;
 
+	if (len / PAGE_SIZE > totalram_pages() / 2) {
+		pr_err("pid %d requested too large an allocation(size %lu) from system heap\n",
+		       current->pid, len);
+		return ERR_PTR(ret);
+	}
+
 	buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
 	if (!buffer)
 		return ERR_PTR(-ENOMEM);
-- 
2.32.0.432.gabb21c7263-goog

