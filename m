Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1359E2949E1
	for <lists+linux-media@lfdr.de>; Wed, 21 Oct 2020 10:58:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441226AbgJUI6Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Oct 2020 04:58:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502353AbgJUI5T (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Oct 2020 04:57:19 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65B82C0613D6
        for <linux-media@vger.kernel.org>; Wed, 21 Oct 2020 01:57:18 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id x7so2156112wrl.3
        for <linux-media@vger.kernel.org>; Wed, 21 Oct 2020 01:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=62xo6Yc+okj8E3g2nExt24JkphJyecIdIYx1MX/KcgQ=;
        b=K873XhCKhky8xYu7l9PH0L4vvRQ8W4kOqwGB7em4FSZU/FH2w3o/Fs6+QECyRAghOu
         8q8OodzeuuFUxMzw/vVk1/yMCBxwVGl1BeYckPl4pNsKxDrGH6PmKMHuJ2X/ASVVgbzy
         2gMkhgZs8aQVpZ+fDa84ImMGzU1FdBr7OgsW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=62xo6Yc+okj8E3g2nExt24JkphJyecIdIYx1MX/KcgQ=;
        b=E9rIIdrfsAlzjXWivgAqXplyUBZNe3CFoTi0WGXuez43yWN1R5MDTl9EuJw1UWVzEa
         uwxK4pQGeTndkq/+F0YNgbHlLM63+QotqeobH1UjPDnetZJbXIbQWKBl2DlNRRZctXui
         8DGa2pOe7rrLGHgqKdmaZBiwAQsTIAuc7Wyi++DlhPVlBQ2eMKdswfY6gtePGs9M1Sk0
         sh1y5VDJlRJhpcNd86RcTHGOsIVvdhU0tIPZUsm4QTHM1P+/OfXlAGlW0iTahXY4bzc7
         LIIjG2QIkShFOQxG119mhLt1uOipFV0jVxyZK94ORUyJ3GfNGDqcUtCtGWsZ2TdpNX5u
         py6w==
X-Gm-Message-State: AOAM530Ro9oNGWUPpUmaDLw2Uqm3dd+9tlxodIeD7JOjFDhXEvPFYHNA
        5c0PvGewpcq6WOVwSEGlaSSoeA==
X-Google-Smtp-Source: ABdhPJxBj+/fddzStMvRlNb0kPGellflBixkVVFjchw9D6JBYyFT9T4kixhMP79NqV0iv84nhiR1VA==
X-Received: by 2002:a5d:480a:: with SMTP id l10mr3285006wrq.238.1603270637190;
        Wed, 21 Oct 2020 01:57:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id q8sm2675939wro.32.2020.10.21.01.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 01:57:16 -0700 (PDT)
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
        Jan Kara <jack@suse.cz>, Pawel Osciak <pawel@osciak.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Laurent Dufour <ldufour@linux.ibm.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Daniel Jordan <daniel.m.jordan@oracle.com>,
        Michel Lespinasse <walken@google.com>,
        Daniel Vetter <daniel.vetter@ffwll.com>
Subject: [PATCH v3 10/16] media/videbuf1|2: Mark follow_pfn usage as unsafe
Date:   Wed, 21 Oct 2020 10:56:49 +0200
Message-Id: <20201021085655.1192025-11-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021085655.1192025-1-daniel.vetter@ffwll.ch>
References: <20201021085655.1192025-1-daniel.vetter@ffwll.ch>
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
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.com>
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
index 6590987c14bd..e630494da65c 100644
--- a/drivers/media/common/videobuf2/frame_vector.c
+++ b/drivers/media/common/videobuf2/frame_vector.c
@@ -69,7 +69,7 @@ int get_vaddr_frames(unsigned long start, unsigned int nr_frames,
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
2.28.0

