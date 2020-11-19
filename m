Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AB922B9559
	for <lists+linux-media@lfdr.de>; Thu, 19 Nov 2020 15:52:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728406AbgKSOnn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Nov 2020 09:43:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728275AbgKSOmH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Nov 2020 09:42:07 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0EE5C0617A7
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2020 06:42:06 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id a65so6981590wme.1
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2020 06:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BPpebch13YhiVnp0IIh0dviRE5BWGvg35r91rkcoUQ8=;
        b=ELbdBqB1EG22+DBZ236+jEYDLfaFG6cJxXjlIUTtjFkWJvA2aVBEoWS6IWrzxkmMsM
         CKByNISsBPBMATDUKMI7TEyj+1CLhDXRFwJA6/fSlSU1BhAJ2SWX+N/6DB9tHtFqLkw5
         FshKvlR41ZRkC2VvtrUC1WkZ8BWFL13fuLpBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BPpebch13YhiVnp0IIh0dviRE5BWGvg35r91rkcoUQ8=;
        b=WPKbmwvvHkOthl7T7SQPK0haJhako1+11TVNvbmno7b7JmkPQLSTVcoAMAWwVA/7/o
         xe3AXoA/8a2A7XHf7ZBsAKDt+c12X7OPMfSkK4KXlH5NYV+/IUThmkWfe+O4986e0Ms7
         GeTedfMGB6S+xgt17WSIMskkxg3ibkGeAF/v4LeDd/dVbkVt9+o4f1axSmjLb+MAnRJd
         mXFowWzwnryRF15/69W1Dr7D04fVEtKmdPfjq5PFdVMgTT31tUC9oTAoZYMIaHhjprsV
         cUArig5G5p+c/EZiwzJwewnNIRPncOHfpeJ96UUAlYMSdwgGylyRLwNhy5MqwWi7O9/V
         k2zQ==
X-Gm-Message-State: AOAM533o5KI2vcz8h6YSDbwJg9tiZL9uicpOIDHCSdVeupcCqBhQyfG2
        BVSuIiY69ZNDwuH+oQJ+ER8+/g==
X-Google-Smtp-Source: ABdhPJzMPF18M0N+DMnBEmqMSs9nBuEKzZXNbWRMjp078DW1AZEBSH3uKLChga62boFb4JqdftRhGA==
X-Received: by 2002:a1c:1c3:: with SMTP id 186mr4901772wmb.39.1605796925671;
        Thu, 19 Nov 2020 06:42:05 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id x63sm51292wmb.48.2020.11.19.06.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 06:42:04 -0800 (PST)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     kvm@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Tomasz Figa <tfiga@chromium.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>, Pawel Osciak <pawel@osciak.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Laurent Dufour <ldufour@linux.ibm.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Daniel Jordan <daniel.m.jordan@oracle.com>,
        Michel Lespinasse <walken@google.com>
Subject: [PATCH v6 09/17] media/videbuf1|2: Mark follow_pfn usage as unsafe
Date:   Thu, 19 Nov 2020 15:41:38 +0100
Message-Id: <20201119144146.1045202-10-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201119144146.1045202-1-daniel.vetter@ffwll.ch>
References: <20201119144146.1045202-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The media model assumes that buffers are all preallocated, so that
when a media pipeline is running we never miss a deadline because the
buffers aren't allocated or available.

This means we cannot fix the v4l follow_pfn usage through
mmu_notifier, without breaking how this all works. The only real fix
is to deprecate userptr support for VM_IO | VM_PFNMAP mappings and
tell everyone to cut over to dma-buf memory sharing for zerocopy.

userptr for normal memory will keep working as-is, this only affects
the zerocopy userptr usage enabled in 50ac952d2263 ("[media]
videobuf2-dma-sg: Support io userptr operations on io memory").

Acked-by: Tomasz Figa <tfiga@chromium.org>
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
Cc: Pawel Osciak <pawel@osciak.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Tomasz Figa <tfiga@chromium.org>
Cc: Laurent Dufour <ldufour@linux.ibm.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Daniel Jordan <daniel.m.jordan@oracle.com>
Cc: Michel Lespinasse <walken@google.com>
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
--
v3:
- Reference the commit that enabled the zerocopy userptr use case to
  make it abundandtly clear that this patch only affects that, and not
  normal memory userptr. The old commit message already explained that
  normal memory userptr is unaffected, but I guess that was not clear
  enough.
---
 drivers/media/common/videobuf2/frame_vector.c | 2 +-
 drivers/media/v4l2-core/videobuf-dma-contig.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/common/videobuf2/frame_vector.c b/drivers/media/common/videobuf2/frame_vector.c
index a0e65481a201..1a82ec13ea00 100644
--- a/drivers/media/common/videobuf2/frame_vector.c
+++ b/drivers/media/common/videobuf2/frame_vector.c
@@ -70,7 +70,7 @@ int get_vaddr_frames(unsigned long start, unsigned int nr_frames,
 			break;
 
 		while (ret < nr_frames && start + PAGE_SIZE <= vma->vm_end) {
-			err = follow_pfn(vma, start, &nums[ret]);
+			err = unsafe_follow_pfn(vma, start, &nums[ret]);
 			if (err) {
 				if (ret == 0)
 					ret = err;
diff --git a/drivers/media/v4l2-core/videobuf-dma-contig.c b/drivers/media/v4l2-core/videobuf-dma-contig.c
index 52312ce2ba05..821c4a76ab96 100644
--- a/drivers/media/v4l2-core/videobuf-dma-contig.c
+++ b/drivers/media/v4l2-core/videobuf-dma-contig.c
@@ -183,7 +183,7 @@ static int videobuf_dma_contig_user_get(struct videobuf_dma_contig_memory *mem,
 	user_address = untagged_baddr;
 
 	while (pages_done < (mem->size >> PAGE_SHIFT)) {
-		ret = follow_pfn(vma, user_address, &this_pfn);
+		ret = unsafe_follow_pfn(vma, user_address, &this_pfn);
 		if (ret)
 			break;
 
-- 
2.29.2

