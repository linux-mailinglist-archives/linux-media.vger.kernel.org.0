Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADF65230BE8
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 15:58:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730281AbgG1N6r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jul 2020 09:58:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730238AbgG1N6r (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jul 2020 09:58:47 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D193DC0619D2
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2020 06:58:46 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id k20so10645394wmi.5
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2020 06:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LTjUuKu28q4AP2apkOdAzx1cK7jJDnTHDeP/9uZly44=;
        b=KqeArdqygfldyaA4gJRiGfTgCwK4wgPCAMC7uombuUYQ1buL6zCp8yoRWk5H+Vp2qt
         M36J4wt9gCrJShAOCDVpPvxoVn5Osk7fRw15JUm/WE0gwcmaIwLFFiYS3d0f5MnFSxq/
         iQOkoFGM5zyBIuGT0vXj0lazqprYYPD+oNhM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LTjUuKu28q4AP2apkOdAzx1cK7jJDnTHDeP/9uZly44=;
        b=hiQOUelubQYegYl9X2A6dCXdh9SXD3K61CWC6ZOK7+UhQeY1dHhrcvdnZz2U61S/ih
         cy3sGttOUmm3xlDFtfm2icPL33qb5QUtIXS9AoOhI0QYO5e9kVH8KhPE2F+4CWo/Jvi+
         suwckGhUabdJcoPbKYJo96MqvT0YbhnaIhXTXz6Gm9KDEbS1hm/GWx2bXOhvPtAVtnaG
         BLicQC9e+dlIffZsw2OEC67TRUYola7yK2vxnNCaL5xfwL6PUK9ATVr2QpQ2gs4/Nkfg
         SpYt95a9EBlI0aNJERF/hH1CVeNyLGhcl82AMWfIpuQwt53FazE7uB9jaWWXpcMTbOIq
         UMNA==
X-Gm-Message-State: AOAM531x86DRTHBo7v3GDV9n7ykaU6bOr5eIVmlQqbEVI/irdJICatd2
        35cT0tBd+6o4XdZs7tcLP+DMBA==
X-Google-Smtp-Source: ABdhPJzN7u/m6RCqY38cX52hSfOrqIs4C8PfjuXHcoP5UoM1XsD3zH2RZL3E9SBC/M2256p1vsiwQw==
X-Received: by 2002:a7b:c403:: with SMTP id k3mr4097843wmi.35.1595944725621;
        Tue, 28 Jul 2020 06:58:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id q6sm4505414wma.22.2020.07.28.06.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2020 06:58:44 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Dave Chinner <david@fromorbit.com>, Qian Cai <cai@lca.pw>,
        linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas_os@shipmail.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jason Gunthorpe <jgg@mellanox.com>, linux-mm@kvack.org,
        linux-rdma@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH] dma-resv: lockdep-prime address_space->i_mmap_rwsem for dma-resv
Date:   Tue, 28 Jul 2020 15:58:39 +0200
Message-Id: <20200728135839.1035515-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

GPU drivers need this in their shrinkers, to be able to throw out
mmap'ed buffers. Note that we also need dma_resv_lock in shrinkers,
but that loop is resolved by trylocking in shrinkers.

So full hierarchy is now (ignore some of the other branches we already
have primed):

mmap_read_lock -> dma_resv -> shrinkers -> i_mmap_lock_write

I hope that's not inconsistent with anything mm or fs does, adding
relevant people.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: Dave Chinner <david@fromorbit.com>
Cc: Qian Cai <cai@lca.pw>
Cc: linux-xfs@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org
Cc: Thomas Hellström (Intel) <thomas_os@shipmail.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Jason Gunthorpe <jgg@mellanox.com>
Cc: linux-mm@kvack.org
Cc: linux-rdma@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/dma-buf/dma-resv.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 0e6675ec1d11..9678162a4ac5 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -104,12 +104,14 @@ static int __init dma_resv_lockdep(void)
 	struct mm_struct *mm = mm_alloc();
 	struct ww_acquire_ctx ctx;
 	struct dma_resv obj;
+	struct address_space mapping;
 	int ret;
 
 	if (!mm)
 		return -ENOMEM;
 
 	dma_resv_init(&obj);
+	address_space_init_once(&mapping);
 
 	mmap_read_lock(mm);
 	ww_acquire_init(&ctx, &reservation_ww_class);
@@ -117,6 +119,9 @@ static int __init dma_resv_lockdep(void)
 	if (ret == -EDEADLK)
 		dma_resv_lock_slow(&obj, &ctx);
 	fs_reclaim_acquire(GFP_KERNEL);
+	/* for unmap_mapping_range on trylocked buffer objects in shrinkers */
+	i_mmap_lock_write(&mapping);
+	i_mmap_unlock_write(&mapping);
 #ifdef CONFIG_MMU_NOTIFIER
 	lock_map_acquire(&__mmu_notifier_invalidate_range_start_map);
 	__dma_fence_might_wait();
-- 
2.27.0

