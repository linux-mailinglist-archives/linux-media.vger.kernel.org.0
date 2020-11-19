Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6FFD2B9554
	for <lists+linux-media@lfdr.de>; Thu, 19 Nov 2020 15:52:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728424AbgKSOn0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Nov 2020 09:43:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728285AbgKSOmK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Nov 2020 09:42:10 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38168C061A4A
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2020 06:42:08 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id c9so7419277wml.5
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2020 06:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r9CpIi9VXsG+zuZeNFc6wtzpnBA/KWk/gpfUTZT1Zjk=;
        b=lhtA9EHTSs14S/lWfBd1cIy0B+1WAFjZ2wwrxe0xfxaPFoO4tE/BV8FsM/+QBdNKSb
         qaDof6bo+sV1dmoR3pr9L3cROFnjeyDX7YUhLjLaTr5vvJuZGC/AQ8qhGDGYOPWuK2ES
         DXV+m9I+q0gCIequCxlA9xJnLLr4u+Z/5Mgjs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r9CpIi9VXsG+zuZeNFc6wtzpnBA/KWk/gpfUTZT1Zjk=;
        b=f3N88gA6sqZ+8eyLQ9d15L8NkAn9hnq5BZd5kOzzmfylc/BUjHNkTp2etdSM1j/1z9
         9zTZHLypmKaPDTo5wSQWpHLvxHWAz3Ykwuwx2bWFizVDm9BC/ut34wbVtlIw0c+J50Wf
         Hy/EPeVnuoh9aG8uL52LcJ/u8WXjMKeTOsHcJV2XmD9BqcKlcXScxqnyFe8JfCNg/FiZ
         5KuwGhs2oPjojkyHc4YTbSpZlhWoa3NnmA9GwmIybrzLMDdfARtFc9wLp+JzDzrxnQmR
         DI1vDlWt2xkC+wd/MIbyVXY1JSeyce+ARHFFtGdz4jgYpxVbMHkVpB4S3K8ET6hhmtjC
         UmdA==
X-Gm-Message-State: AOAM5329PsKZBZMIIH8nNWHgV0e+PqMwRzrhYp4UvvR3Om2Rg80oCjMZ
        LEBWevQUPiOjXFbYnyF5XGAI/w==
X-Google-Smtp-Source: ABdhPJwmTNYcq6djsIakV7SIgJh96B+fhnfkl7M76m7WAG1RYZMmoYFSDpdjObIHYtpegBgvRnmxPg==
X-Received: by 2002:a05:600c:288:: with SMTP id 8mr4943834wmk.106.1605796926931;
        Thu, 19 Nov 2020 06:42:06 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id x63sm51292wmb.48.2020.11.19.06.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 06:42:06 -0800 (PST)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     kvm@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Alex Williamson <alex.williamson@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v6 10/17] vfio/type1: Mark follow_pfn as unsafe
Date:   Thu, 19 Nov 2020 15:41:39 +0100
Message-Id: <20201119144146.1045202-11-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201119144146.1045202-1-daniel.vetter@ffwll.ch>
References: <20201119144146.1045202-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The code seems to stuff these pfns into iommu pts (or something like
that, I didn't follow), but there's no mmu_notifier to ensure that
access is synchronized with pte updates.

Hence mark these as unsafe. This means that with
CONFIG_STRICT_FOLLOW_PFN, these will be rejected.

Real fix is to wire up an mmu_notifier ... somehow. Probably means any
invalidate is a fatal fault for this vfio device, but then this
shouldn't ever happen if userspace is reasonable.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Kees Cook <keescook@chromium.org>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Jérôme Glisse <jglisse@redhat.com>
Cc: Jan Kara <jack@suse.cz>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: linux-mm@kvack.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: kvm@vger.kernel.org
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/vfio/vfio_iommu_type1.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index 67e827638995..10170723bb58 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -421,7 +421,7 @@ static int follow_fault_pfn(struct vm_area_struct *vma, struct mm_struct *mm,
 {
 	int ret;
 
-	ret = follow_pfn(vma, vaddr, pfn);
+	ret = unsafe_follow_pfn(vma, vaddr, pfn);
 	if (ret) {
 		bool unlocked = false;
 
@@ -435,7 +435,7 @@ static int follow_fault_pfn(struct vm_area_struct *vma, struct mm_struct *mm,
 		if (ret)
 			return ret;
 
-		ret = follow_pfn(vma, vaddr, pfn);
+		ret = unsafe_follow_pfn(vma, vaddr, pfn);
 	}
 
 	return ret;
-- 
2.29.2

