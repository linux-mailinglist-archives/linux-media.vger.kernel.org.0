Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8711528848C
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 10:01:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732864AbgJIIBH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 04:01:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732739AbgJIIAN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Oct 2020 04:00:13 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05A09C0610CF
        for <linux-media@vger.kernel.org>; Fri,  9 Oct 2020 01:00:08 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id m6so9257860wrn.0
        for <linux-media@vger.kernel.org>; Fri, 09 Oct 2020 01:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N5MezEhvq/wwBRTty0X109hZVMwHizCfP5Lc200+OeU=;
        b=X+lVFEzkJG7G1y1hQOMHpq9aH/9wMcZRASu3pf5WwWkSy+lBQfhcJFHkD+mB+HB+8B
         6q3Z/oFWS+IjpKniri9mdKD+xWh4Pb1kxxRnhtmA75fRmXM2leSVVQ9O6mzJ2s2pjdNF
         FwYvxU8GuH0ylVTYs9gfzX5C6vRDllxk8cWjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N5MezEhvq/wwBRTty0X109hZVMwHizCfP5Lc200+OeU=;
        b=ZwvOsV98/4tTXxIHSRK6Y2wAudF7xq58u8FPOihLTQtdnmKxhHYAIFtAqLZfCrlaGy
         92Yef0FbE4KmbIKtniRan9IDkS3DsZlvDKB0l/leEYpKLsNQN0btNh8UWXUKeWTqTXcy
         Cbmg256MYf1LXzI7Md34fQo5bMrWYP4SUqrEpeULO8XwoxNxjEHUESyfxg8ulFtGxZBr
         N9sWGGy6fPxcv96NJWng7kRxDqlLO4ilhaggJmCCPs2DJHY+6rU6aipdCyJ0Eq5a8sHe
         n31QmPvVlA3lwRJ8hycqXMQbdNz95vrpxrsoTu1JN/iHhfJYCYz4QQCBLnYALwoFE8vJ
         w9gA==
X-Gm-Message-State: AOAM532/IK5NfS9TNBTIBXyJIzFju5Jqco+ryshEM/JqWJeU7XC3zQHz
        COg04CJuBFkgBc/NAMgyQ+Oy8w==
X-Google-Smtp-Source: ABdhPJzMUouKiCH6SJK6dyAVSQS46IBJV9EJgv/XkHUvyqgT9BYelO/ICRgl0rBnswqZFheeRzPOMA==
X-Received: by 2002:adf:9dd1:: with SMTP id q17mr6771139wre.317.1602230406671;
        Fri, 09 Oct 2020 01:00:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id u17sm11634118wri.45.2020.10.09.01.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 01:00:05 -0700 (PDT)
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
        Michel Lespinasse <walken@google.com>
Subject: [PATCH v2 10/17] media/videbuf1|2: Mark follow_pfn usage as unsafe
Date:   Fri,  9 Oct 2020 09:59:27 +0200
Message-Id: <20201009075934.3509076-11-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
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

userptr for normal memory will keep working as-is.

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
---
 drivers/media/common/videobuf2/frame_vector.c | 2 +-
 drivers/media/v4l2-core/videobuf-dma-contig.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/common/videobuf2/frame_vector.c b/drivers/media/common/videobuf2/frame_vector.c
index 2b0b97761d15..a1b85fe9e7c1 100644
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

