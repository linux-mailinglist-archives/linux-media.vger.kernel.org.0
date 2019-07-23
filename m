Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7602A71E52
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2019 20:00:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391423AbfGWR7y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jul 2019 13:59:54 -0400
Received: from mail-qt1-f202.google.com ([209.85.160.202]:43747 "EHLO
        mail-qt1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391424AbfGWR7x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jul 2019 13:59:53 -0400
Received: by mail-qt1-f202.google.com with SMTP id o11so30551054qtq.10
        for <linux-media@vger.kernel.org>; Tue, 23 Jul 2019 10:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=bykoKqk+RfxIttYDE7/GdnEkPwV+NEF/LkGgW6aheBM=;
        b=t2L6A3co0IUcO5jJEupAYqmfSwA1Pmfl3+ZcIn/5Q85mp2WLmhw1iqLCswQ9as3aOF
         a0D+pYMEhkdmm+KSqXmSiU/lD0Pz3h6uvkPAeVEHs1IFoAwnv5BA1YbF3d7nwG6M8iRR
         Z5NEOhmfG5y3nopQ695DATYQQfXAIYJG7yd7F+lB9VoEza1F669VXhs6jrCa2pvOvN6l
         r1p+w7pUdDXihW/3CqVYzRnheU9A6fqtUiCr4NASapwor3nhJC+/jeMNYPGIPNIFjoFu
         E4g9GrA8tUOQtGrCF4JaEQ7hr5aZJYBDV43aYbaG/BPoNEA3mTX8DLrogiBkcDNJOYJ5
         rrBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=bykoKqk+RfxIttYDE7/GdnEkPwV+NEF/LkGgW6aheBM=;
        b=hKp3Rcskokh+ZZcTYWlmiw4iNyXbB5gKX5gBBp0Yf0q5xTqMNzUxul1BPSR07j/91+
         l1z8henGt+cN1L26ZX7y5db76ZHdcteOkmrWHAVR/1ki1GKF8/K+hvfLC7wqswvQTuQd
         7JBgcf/Og0kD+ddBVbvunC77qk0Zz9UaEMaDpYwL4y3De1/lAOJLvMOykTxKnEWFYWTR
         uz72gCfsPcIT3XrYuQ/ZuRFHvkjvFT04Zafrc2oumNCtCMjyc2/g5Rca24LZtWj3uXrk
         lkzpi21WpE3km3donGwL0lAPAMWtYO1JkGnHIuk/sVePoTsIFUyK3Juinkrw484WJlI3
         +bYw==
X-Gm-Message-State: APjAAAVaA0phw1wDAvqY5l1kzLs7xMrylrS16l7+x5P6/M39zdWP4O8h
        wG6HXzzkBv3dJIPqSiOqiz5VhE/VlkzknAKG
X-Google-Smtp-Source: APXvYqzy6KvMjkfI7Gkvl5k12zd++ICAyNUe8J8soJHrycJkzCW148ZA79khH20QvBebUrjeGJ/TSw9Gqxxo1fEA
X-Received: by 2002:ac8:7251:: with SMTP id l17mr54199388qtp.277.1563904791730;
 Tue, 23 Jul 2019 10:59:51 -0700 (PDT)
Date:   Tue, 23 Jul 2019 19:58:51 +0200
In-Reply-To: <cover.1563904656.git.andreyknvl@google.com>
Message-Id: <87422b4d72116a975896f2b19b00f38acbd28f33.1563904656.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1563904656.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
Subject: [PATCH v19 14/15] vfio/type1: untag user pointers in vaddr_get_pfn
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
        Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch is a part of a series that extends kernel ABI to allow to pass
tagged user pointers (with the top byte set to something else other than
0x00) as syscall arguments.

vaddr_get_pfn() uses provided user pointers for vma lookups, which can
only by done with untagged pointers.

Untag user pointers in this function.

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 drivers/vfio/vfio_iommu_type1.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index 054391f30fa8..67a24b4d0fa4 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -368,6 +368,8 @@ static int vaddr_get_pfn(struct mm_struct *mm, unsigned long vaddr,
 
 	down_read(&mm->mmap_sem);
 
+	vaddr = untagged_addr(vaddr);
+
 	vma = find_vma_intersection(mm, vaddr, vaddr + 1);
 
 	if (vma && vma->vm_flags & VM_PFNMAP) {
-- 
2.22.0.709.g102302147b-goog

