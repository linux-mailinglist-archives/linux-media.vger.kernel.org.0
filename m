Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9890A30D04F
	for <lists+linux-media@lfdr.de>; Wed,  3 Feb 2021 01:33:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232457AbhBCAcV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 19:32:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232329AbhBCAcT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Feb 2021 19:32:19 -0500
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE00EC0613ED
        for <linux-media@vger.kernel.org>; Tue,  2 Feb 2021 16:31:38 -0800 (PST)
Received: by mail-qt1-x849.google.com with SMTP id v65so13332004qtd.0
        for <linux-media@vger.kernel.org>; Tue, 02 Feb 2021 16:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=5KtTzd9k+c9bS2Y/wk34+i/vvyNbysJG7UZJv8N2Wp4=;
        b=oNXRZrunpy+nJxCNVG2DVespyvOU6v+/PBcSm/lmaxwIlZyPY+Y+aGI83iN/QE12TQ
         /9B5j+GzglaY+R0ZfttfhxpqWqSdb8Mhk5fb+2BB6mUU3pAKYZ4YkOotTy5PPFko52Yw
         DjiUxnZm5/e875fNSMeJZUpfPmcgyFUAHmh7OGgzKQMnmFkSDTyR+23aDUO7XbQpLyJ/
         ODLwOmX6057PVKLp4hTX/hoK0O+U8lfiVVL2hxkockdBfgWJvRtI34i+fdKn9nJsjv6I
         DrqX9S8rzdrQ6xlTKqKv6sGUpn32curAQw3IMOe9YcnA/sGJg2xlAFdtgblXQs264SLf
         TFKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=5KtTzd9k+c9bS2Y/wk34+i/vvyNbysJG7UZJv8N2Wp4=;
        b=toea45MkEbnnAGNeAY0zbLpy9oZ8rTcs6e+SbczCiBPmznwkiv0ix8oTqPAES/ggRC
         wR63Z8CF8Kt17eWMEe9dVate+C98ANljdE0em2E2/pc3TUzB/T8F0vOJBSDn31TAHrtK
         56nS9hdfyrmwPxYL+p0xr60e9uUhl4gZXP/Db+7zLBRIiMstcwvJhxBBs4sxVP/yWaZY
         a6F8mha6OwhWABlQbRtWIFIuSexdh5dIJxJMKMMpBc6M/FRSY4txLgjJtgW5ckJcB/ti
         QVNxjnAATN/DfiMrJwZ/N3mnlONhjO94wxPkyf/JlxyI0WBndA/pk6eAYKSKCtnYO5j6
         E0SA==
X-Gm-Message-State: AOAM532ZUW41CKlettel8DQgd2jM9hqdsa2rpFyshHkffSYQIt1UShMM
        2qutlANTwXITaHF9JlRaplYfBQekmG8=
X-Google-Smtp-Source: ABdhPJwlIrpFiCM10hcfIL1xRHkC2ka4Rp5OqMsb623obcfa1dzEsxG62HhtetSAvxKOVvEOcxKdtwB6Ytc=
Sender: "surenb via sendgmr" <surenb@surenb1.mtv.corp.google.com>
X-Received: from surenb1.mtv.corp.google.com ([2620:15c:211:200:9194:cd6:1ec:3e2d])
 (user=surenb job=sendgmr) by 2002:a0c:8365:: with SMTP id j92mr418503qva.19.1612312297983;
 Tue, 02 Feb 2021 16:31:37 -0800 (PST)
Date:   Tue,  2 Feb 2021 16:31:34 -0800
In-Reply-To: <20210203003134.2422308-1-surenb@google.com>
Message-Id: <20210203003134.2422308-2-surenb@google.com>
Mime-Version: 1.0
References: <20210203003134.2422308-1-surenb@google.com>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
Subject: [PATCH v2 2/2] dma-buf: heaps: Map system heap pages as managed by
 linux vm
From:   Suren Baghdasaryan <surenb@google.com>
To:     sumit.semwal@linaro.org
Cc:     akpm@linux-foundation.org, hch@infradead.org, lmark@codeaurora.org,
        labbott@redhat.com, Brian.Starkey@arm.com, john.stultz@linaro.org,
        christian.koenig@amd.com, cgoldswo@codeaurora.org,
        orjan.eide@arm.com, robin.murphy@arm.com, jajones@nvidia.com,
        minchan@kernel.org, hridya@google.com, sspatil@google.com,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, kernel-team@android.com,
        surenb@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently system heap maps its buffers with VM_PFNMAP flag using
remap_pfn_range. This results in such buffers not being accounted
for in PSS calculations because vm treats this memory as having no
page structs. Without page structs there are no counters representing
how many processes are mapping a page and therefore PSS calculation
is impossible.
Historically, ION driver used to map its buffers as VM_PFNMAP areas
due to memory carveouts that did not have page structs [1]. That
is not the case anymore and it seems there was desire to move away
from remap_pfn_range [2].
Dmabuf system heap design inherits this ION behavior and maps its
pages using remap_pfn_range even though allocated pages are backed
by page structs.
Replace remap_pfn_range with vm_insert_page, following Laura's suggestion
in [1]. This would allow correct PSS calculation for dmabufs.

[1] https://driverdev-devel.linuxdriverproject.narkive.com/v0fJGpaD/using-ion-memory-for-direct-io
[2] http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/2018-October/127519.html
(sorry, could not find lore links for these discussions)

Suggested-by: Laura Abbott <labbott@kernel.org>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
v1 posted at: https://lore.kernel.org/patchwork/patch/1372409/

changes in v2:
- removed VM_PFNMAP clearing part of the patch, per Minchan and Christoph
- created prerequisite patch to replace BUG_ON with WARN_ON_ONCE, per Christoph

 drivers/dma-buf/heaps/system_heap.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 17e0e9a68baf..4983f18cc2ce 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -203,8 +203,7 @@ static int system_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
 	for_each_sgtable_page(table, &piter, vma->vm_pgoff) {
 		struct page *page = sg_page_iter_page(&piter);
 
-		ret = remap_pfn_range(vma, addr, page_to_pfn(page), PAGE_SIZE,
-				      vma->vm_page_prot);
+		ret = vm_insert_page(vma, addr, page);
 		if (ret)
 			return ret;
 		addr += PAGE_SIZE;
-- 
2.30.0.365.g02bc693789-goog

