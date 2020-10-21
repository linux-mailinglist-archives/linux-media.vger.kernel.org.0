Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC59C2949DE
	for <lists+linux-media@lfdr.de>; Wed, 21 Oct 2020 10:58:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441221AbgJUI6Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Oct 2020 04:58:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502362AbgJUI5U (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Oct 2020 04:57:20 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3179C0613DF
        for <linux-media@vger.kernel.org>; Wed, 21 Oct 2020 01:57:19 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id k18so899906wmj.5
        for <linux-media@vger.kernel.org>; Wed, 21 Oct 2020 01:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8pur25W5Shkh1hHfFCpksS7ceNn2PKF9z82vTsiLN4c=;
        b=Ijq3ip5+wV7cd7njUb6RsVnXV8g8Owp5iMrdu9TyvAk5qDDhPeT5XCXN2ALGJhsrbp
         P5zOBKKXwRlNfH4L8OnR7mPoL971Mg4a7xN8q3N/PXmFtuMp/lDcW0snMDX7TnNSFxlk
         g5M5E6R5TEskXfmkH4sQcqsHcoV8Z7W9kahWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8pur25W5Shkh1hHfFCpksS7ceNn2PKF9z82vTsiLN4c=;
        b=B3vYHQIHrMW2H53+3MEG6zAXf9hJOxMmRvn5X2nttmG7vYZNdymxL4X8Sx5W++eMkB
         aM+H7BROmn7eTwyCHnCvVLOXqOlyS5eKKEvJZNJYrZJOg71V4sVgAn+aK1bXohFunhqJ
         aXQu0i8yuI4bzVmsVdOAh7tgupRcmQlbMIgSM1bLDG9dFCtXJUDj+k/8um8JubfQoFj9
         QGZdWxvMG7XtB6vlAQPJhSVPBdhG0LeKo/YTIEJs3AS+uU9u7/Ke0m6rK9UZLaimqB+T
         5GA9IBjdlDwMzRywilDf/k50g3R1HAZ7WQxHJbCSayOOOFOCPS+2cdad2Tucrd0XCa3B
         4Deg==
X-Gm-Message-State: AOAM533bqhD1yuZ5uIsGKnO484y4ZzgO6hUsVLtuoNTo4Tbdyjw7o21F
        tYv3xrwguvizAIeOR4VDbbrP5g==
X-Google-Smtp-Source: ABdhPJzNaFnr3EWeDP7k0cF2AHbtycSZcq0l7yhT5Nq82x3yeqTKgKPKUR9qmyptj9g+y8CFHwWMGg==
X-Received: by 2002:a1c:2c02:: with SMTP id s2mr2512532wms.66.1603270638556;
        Wed, 21 Oct 2020 01:57:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id q8sm2675939wro.32.2020.10.21.01.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 01:57:17 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     kvm@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        linux-s390@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Alex Williamson <alex.williamson@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Daniel Vetter <daniel.vetter@ffwll.com>
Subject: [PATCH v3 11/16] vfio/type1: Mark follow_pfn as unsafe
Date:   Wed, 21 Oct 2020 10:56:50 +0200
Message-Id: <20201021085655.1192025-12-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021085655.1192025-1-daniel.vetter@ffwll.ch>
References: <20201021085655.1192025-1-daniel.vetter@ffwll.ch>
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
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.com>
---
 drivers/vfio/vfio_iommu_type1.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index 5fbf0c1f7433..a4d53f3d0a35 100644
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
2.28.0

