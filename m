Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D3072864EE
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 18:46:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728667AbgJGQpE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 12:45:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728157AbgJGQom (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 12:44:42 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6766AC0613D5
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 09:44:41 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id l11so3060283wmh.2
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2020 09:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tumapzZxvtArZNF04352kaumd5zWdbY4K/o9+R8ZPiU=;
        b=ZCR6epNGq4y9pMu5KQprul9p0e5pbHRNVWh8gfzFX5t78d6KExLodPu0cge87TbHQ7
         IFCUDLlXaw9OhMaO8M6ZionCebVY74YdmCbAxhY4ZzIXmKSQNldnw8FEWkuV3IgYHDwi
         4BgN7dseD1BVSXWfbIbpwPFDfQHHYpunWAI44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tumapzZxvtArZNF04352kaumd5zWdbY4K/o9+R8ZPiU=;
        b=nzJmBcfO83PE9vCQvugOZUU1zxtMCTcGhRMjfGeKL0XmHCuEk2YyV4ey3CleEjougM
         6ih0G9b/qyh2IFJuH1l0vXA2guHAXNahxFjhRKyy02o1BV1wTQtGkvrJK9vkmjBK3Xj8
         0kZQZav0PxJVuqgFrFtR0D7KWhbn/bolhunTzfo6QfDISkAtpOKXnnuZSV7b+/czYCgy
         KN9lFTLKhsT4vXaYbT9iJSbVra1gq1kRLrfA3bmbpTf9RxzNa4btNlKMUM4un+tEXSBy
         be1wytkwNkstZ0x4JZ6ecB4Ht+2i16SRwBAYxOUNsWLJoHyoLvrZyz6b4E+u55j7VZ8D
         WgWA==
X-Gm-Message-State: AOAM533pDscq5P+LnsgZep837AiPHWFni20/vf1sXTFZjzEt3jC5VM4h
        j+py9Y3Kdlr6Wcf0gN7FW2fhrw==
X-Google-Smtp-Source: ABdhPJzV4N2gLoUB2iCJL2idqYl1jr0gD0FniH6eb95jw+Xbq6j8k/dKxJZkk3IRomSCwD32oRnJ8Q==
X-Received: by 2002:a1c:a7cc:: with SMTP id q195mr4218149wme.8.1602089080062;
        Wed, 07 Oct 2020 09:44:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id z191sm3332280wme.40.2020.10.07.09.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 09:44:39 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     kvm@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        linux-s390@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Pawel Osciak <pawel@osciak.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Dan Williams <dan.j.williams@intel.com>
Subject: [PATCH 05/13] mm/frame-vector: Use FOLL_LONGTERM
Date:   Wed,  7 Oct 2020 18:44:18 +0200
Message-Id: <20201007164426.1812530-6-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
References: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is used by media/videbuf2 for persistent dma mappings, not just
for a single dma operation and then freed again, so needs
FOLL_LONGTERM.

Unfortunately current pup_locked doesn't support FOLL_LONGTERM due to
locking issues. Rework the code to pull the pup path out from the
mmap_sem critical section as suggested by Jason.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Pawel Osciak <pawel@osciak.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Tomasz Figa <tfiga@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Jérôme Glisse <jglisse@redhat.com>
Cc: Jan Kara <jack@suse.cz>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: linux-mm@kvack.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-media@vger.kernel.org
---
 mm/frame_vector.c | 36 +++++++++++-------------------------
 1 file changed, 11 insertions(+), 25 deletions(-)

diff --git a/mm/frame_vector.c b/mm/frame_vector.c
index 10f82d5643b6..39db520a51dc 100644
--- a/mm/frame_vector.c
+++ b/mm/frame_vector.c
@@ -38,7 +38,6 @@ int get_vaddr_frames(unsigned long start, unsigned int nr_frames,
 	struct vm_area_struct *vma;
 	int ret = 0;
 	int err;
-	int locked;
 
 	if (nr_frames == 0)
 		return 0;
@@ -48,35 +47,22 @@ int get_vaddr_frames(unsigned long start, unsigned int nr_frames,
 
 	start = untagged_addr(start);
 
+	ret = pin_user_pages_fast(start, nr_frames,
+				  FOLL_FORCE | FOLL_WRITE | FOLL_LONGTERM,
+				  (struct page **)(vec->ptrs));
+	if (ret > 0) {
+		vec->got_ref = true;
+		vec->is_pfns = false;
+		goto out_unlocked;
+	}
+
 	mmap_read_lock(mm);
-	locked = 1;
 	vma = find_vma_intersection(mm, start, start + 1);
 	if (!vma) {
 		ret = -EFAULT;
 		goto out;
 	}
 
-	/*
-	 * While get_vaddr_frames() could be used for transient (kernel
-	 * controlled lifetime) pinning of memory pages all current
-	 * users establish long term (userspace controlled lifetime)
-	 * page pinning. Treat get_vaddr_frames() like
-	 * get_user_pages_longterm() and disallow it for filesystem-dax
-	 * mappings.
-	 */
-	if (vma_is_fsdax(vma)) {
-		ret = -EOPNOTSUPP;
-		goto out;
-	}
-
-	if (!(vma->vm_flags & (VM_IO | VM_PFNMAP))) {
-		vec->got_ref = true;
-		vec->is_pfns = false;
-		ret = pin_user_pages_locked(start, nr_frames,
-			gup_flags, (struct page **)(vec->ptrs), &locked);
-		goto out;
-	}
-
 	vec->got_ref = false;
 	vec->is_pfns = true;
 	do {
@@ -101,8 +87,8 @@ int get_vaddr_frames(unsigned long start, unsigned int nr_frames,
 		vma = find_vma_intersection(mm, start, start + 1);
 	} while (vma && vma->vm_flags & (VM_IO | VM_PFNMAP));
 out:
-	if (locked)
-		mmap_read_unlock(mm);
+	mmap_read_unlock(mm);
+out_unlocked:
 	if (!ret)
 		ret = -EFAULT;
 	if (ret > 0)
-- 
2.28.0

