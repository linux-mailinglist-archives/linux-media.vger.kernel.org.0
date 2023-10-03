Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0060C7B7477
	for <lists+linux-media@lfdr.de>; Wed,  4 Oct 2023 01:04:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232659AbjJCXEn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Oct 2023 19:04:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232593AbjJCXEk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Oct 2023 19:04:40 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F21A9AF
        for <linux-media@vger.kernel.org>; Tue,  3 Oct 2023 16:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696374276; x=1727910276;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=b/EAFviwjIkhRcjWTQN1BVxZ/F71IF9ah+TklmixhFU=;
  b=MzMWWvJYQ0u5oDchZsDo6DPOSB1lwcA4tfjWEiQ9xngz0s9PeoKPQ/vO
   pzvY7eXeDNg9cHgRSpRq1lb/MdEoMW0o9kQySDwKobn8MOv58dmCK6g1p
   NJywh3HppzLme+ETtSbKpYFFOu9Ym6qOt3WpLpIpf7+ZjzRAPoJyuRlxx
   jer0FEABSbmSAz+CBuSkSB4eFX8T5CUFa1Ol4dq/IL5thO9YvG034kvmf
   Izfodhvc67g6GAsg7Th+JWNSUlfQ9x3/zRsRYJn5fcqxkGmZm+FoJinhB
   b/m1uZ8tspP8J2HcvXyFTyjt4FkbpT6impmfIos5q2AjIVsyjxfRYn4SQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="381867101"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; 
   d="scan'208";a="381867101"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 16:04:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="816881366"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; 
   d="scan'208";a="816881366"
Received: from adelynhu-mobl1.gar.corp.intel.com (HELO intel.com) ([10.214.161.181])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 16:04:30 -0700
From:   Andi Shyti <andi.shyti@linux.intel.com>
To:     Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     linux-media@vger.kernel.org,
        dri-devel <dri-devel@lists.freedesktop.org>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        Chris Wilson <chris.p.wilson@linux.intel.com>,
        Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH] dma-buf: Deny copy-on-writes mmaps
Date:   Wed,  4 Oct 2023 01:03:32 +0200
Message-Id: <20231003230332.513051-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Chris Wilson <chris.p.wilson@linux.intel.com>

Enforce that an mmap of a dmabuf is always using MAP_SHARED so that all
access (both read and writes) using the device memory and not a local
copy-on-write page in system memory.

Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/dma-buf/dma-buf.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 21916bba77d5..1ec297241842 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -25,6 +25,7 @@
 #include <linux/poll.h>
 #include <linux/dma-resv.h>
 #include <linux/mm.h>
+#include <linux/mman.h>
 #include <linux/mount.h>
 #include <linux/pseudo_fs.h>
 
@@ -128,6 +129,19 @@ static struct file_system_type dma_buf_fs_type = {
 	.kill_sb = kill_anon_super,
 };
 
+static unsigned long
+dma_buf_get_unmapped_area(struct file *file,
+			  unsigned long addr,
+			  unsigned long len,
+			  unsigned long pgoff,
+			  unsigned long flags)
+{
+	if ((flags & MAP_TYPE) == MAP_PRIVATE)
+		return -EINVAL;
+
+	return current->mm->get_unmapped_area(file, addr, len, pgoff, flags);
+}
+
 static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
 {
 	struct dma_buf *dmabuf;
@@ -508,6 +522,7 @@ static void dma_buf_show_fdinfo(struct seq_file *m, struct file *file)
 
 static const struct file_operations dma_buf_fops = {
 	.release	= dma_buf_file_release,
+	.get_unmapped_area = dma_buf_get_unmapped_area,
 	.mmap		= dma_buf_mmap_internal,
 	.llseek		= dma_buf_llseek,
 	.poll		= dma_buf_poll,
-- 
2.40.1

