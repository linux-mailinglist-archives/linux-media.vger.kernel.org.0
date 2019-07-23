Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB6F471E4C
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2019 20:00:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391405AbfGWR7s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jul 2019 13:59:48 -0400
Received: from mail-yb1-f202.google.com ([209.85.219.202]:35297 "EHLO
        mail-yb1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391398AbfGWR7q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jul 2019 13:59:46 -0400
Received: by mail-yb1-f202.google.com with SMTP id w6so34010746ybo.2
        for <linux-media@vger.kernel.org>; Tue, 23 Jul 2019 10:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=HpinGwuxMTqrT/lGIW6pacs7O2cDdG9/5Ty+RZAfASg=;
        b=ce/6WmN6TyK+cE8ZhsNWx985tcmb8TsBUG67QVHPvfluZ/ESLePB0+Iu2kpzcDEd4Q
         YbgyS6kgeVvVFCMr/LAOnm0UHsRKQhmlp8Muf9Haj3921fIO1R3W8RTR8Ay/3UNeJg77
         3oj3IZF7aFzplHspAYys2RygkkcmZ5oyq8CPcTBqzS7rp1MfCHQ9R/Uyt21zik3yW2ex
         viSYi5ZHeqKSa6InOONOnbkuTpjEw9pZIBEPGTBapLOkb92OQ042RHOMLo5PTXbS7p7j
         huNarTmfeFDbiHSfiNnedUTa6Tx9rh0fc8dZU+mkH0hxVq24fx81n5unKjL7cIn91yBU
         G6/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=HpinGwuxMTqrT/lGIW6pacs7O2cDdG9/5Ty+RZAfASg=;
        b=NsR57aJK/MrhnxS2R4NFmS6M6/UUo8gC4ot1BuzGVmczQUq2egdIFSYhuG7SHHo2jl
         mHhQXd8BMAbwBhkBbTUCfY56klyXOHsgyk9EDjd4nOt4gYuWLL/EihBsBnaXb2SDmGr7
         lSIvOwsOJRd8btM/i0x/Z5TFSSW5rdNWg9eL80OdBsQk9j3vy1Mn3vrIOfveTBu+Vozr
         cW5UJtL2Z9iXyl/ukCx8UYEBXjxF1BcbB62iK15Pt3LtZqftfK8nRBnvkhgvgA2VMlTV
         /OBVeEHUyMvjRIqOFpYlZQt2Rw1brltB/bS0hI/TFMjyVatiA9OGgy1Gx5fvaVbk9l2d
         uvOA==
X-Gm-Message-State: APjAAAX6Q8vEcuDsajaRzD2kg1xrHmLQ6ekNBAun6rErrvxdEzJdTYoS
        Wq2YP/mu0BWg59ukJJgi5Djm/WR+T5WBzDSE
X-Google-Smtp-Source: APXvYqzHKD7+vuBXgJcq/Tk4Un/3kb/bP9xO8IxzyxfANBAOcEtBJXWYvzpx9hfbGP7jrgSdMTzC7LW89o7yIBsc
X-Received: by 2002:a81:7854:: with SMTP id t81mr13003915ywc.2.1563904785456;
 Tue, 23 Jul 2019 10:59:45 -0700 (PDT)
Date:   Tue, 23 Jul 2019 19:58:49 +0200
In-Reply-To: <cover.1563904656.git.andreyknvl@google.com>
Message-Id: <100436d5f8e4349a78f27b0bbb27e4801fcb946b.1563904656.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1563904656.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
Subject: [PATCH v19 12/15] media/v4l2-core: untag user pointers in videobuf_dma_contig_user_get
From:   Andrey Konovalov <andreyknvl@google.com>
To:     linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
        linux-media@vger.kernel.org, kvm@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kees Cook <keescook@chromium.org>,
        Yishai Hadas <yishaih@mellanox.com>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        Alexander Deucher <Alexander.Deucher@amd.com>,
        Christian Koenig <Christian.Koenig@amd.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Alex Williamson <alex.williamson@redhat.com>,
        Leon Romanovsky <leon@kernel.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Dave Martin <Dave.Martin@arm.com>,
        Khalid Aziz <khalid.aziz@oracle.com>, enh <enh@google.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Christoph Hellwig <hch@infradead.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Kevin Brodsky <kevin.brodsky@arm.com>,
        Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch is a part of a series that extends kernel ABI to allow to pass
tagged user pointers (with the top byte set to something else other than
0x00) as syscall arguments.

videobuf_dma_contig_user_get() uses provided user pointers for vma
lookups, which can only by done with untagged pointers.

Untag the pointers in this function.

Reviewed-by: Khalid Aziz <khalid.aziz@oracle.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
Acked-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 drivers/media/v4l2-core/videobuf-dma-contig.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/videobuf-dma-contig.c b/drivers/media/v4l2-core/videobuf-dma-contig.c
index 76b4ac7b1678..aeb2f497c683 100644
--- a/drivers/media/v4l2-core/videobuf-dma-contig.c
+++ b/drivers/media/v4l2-core/videobuf-dma-contig.c
@@ -157,6 +157,7 @@ static void videobuf_dma_contig_user_put(struct videobuf_dma_contig_memory *mem)
 static int videobuf_dma_contig_user_get(struct videobuf_dma_contig_memory *mem,
 					struct videobuf_buffer *vb)
 {
+	unsigned long untagged_baddr = untagged_addr(vb->baddr);
 	struct mm_struct *mm = current->mm;
 	struct vm_area_struct *vma;
 	unsigned long prev_pfn, this_pfn;
@@ -164,22 +165,22 @@ static int videobuf_dma_contig_user_get(struct videobuf_dma_contig_memory *mem,
 	unsigned int offset;
 	int ret;
 
-	offset = vb->baddr & ~PAGE_MASK;
+	offset = untagged_baddr & ~PAGE_MASK;
 	mem->size = PAGE_ALIGN(vb->size + offset);
 	ret = -EINVAL;
 
 	down_read(&mm->mmap_sem);
 
-	vma = find_vma(mm, vb->baddr);
+	vma = find_vma(mm, untagged_baddr);
 	if (!vma)
 		goto out_up;
 
-	if ((vb->baddr + mem->size) > vma->vm_end)
+	if ((untagged_baddr + mem->size) > vma->vm_end)
 		goto out_up;
 
 	pages_done = 0;
 	prev_pfn = 0; /* kill warning */
-	user_address = vb->baddr;
+	user_address = untagged_baddr;
 
 	while (pages_done < (mem->size >> PAGE_SHIFT)) {
 		ret = follow_pfn(vma, user_address, &this_pfn);
-- 
2.22.0.709.g102302147b-goog

