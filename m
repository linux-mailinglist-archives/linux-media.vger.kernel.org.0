Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2561C21968
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2019 15:53:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728575AbfEQNxu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 May 2019 09:53:50 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:9545 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728103AbfEQNxu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 May 2019 09:53:50 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cdebcf20000>; Fri, 17 May 2019 06:53:54 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 17 May 2019 06:53:48 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 17 May 2019 06:53:48 -0700
Received: from HQMAIL106.nvidia.com (172.18.146.12) by HQMAIL106.nvidia.com
 (172.18.146.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 17 May
 2019 13:53:48 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL106.nvidia.com
 (172.18.146.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 17 May 2019 13:53:48 +0000
Received: from sumitg-l4t.nvidia.com (Not Verified[10.24.42.162]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cdebce90002>; Fri, 17 May 2019 06:53:48 -0700
From:   Sumit Gupta <sumitg@nvidia.com>
To:     <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <sakari.ailus@linux.intel.com>, <paul.kocialkowski@bootlin.com>,
        <tfiga@chromium.org>, <keiichiw@chromium.org>, <bbasu@nvidia.com>,
        <sumitg@nvidia.com>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [Patch V4] v4l2-core: fix use-after-free error
Date:   Fri, 17 May 2019 19:23:42 +0530
Message-ID: <1558101222-31561-1-git-send-email-sumitg@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1558101234; bh=stfFbiMFaMOGKxRkfm3KN5/YWTVTdNcxBzqgLT72XC4=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=U4OqajLcdejMgiOT6Aqn6upoK/NND13QD6QluTj8Nar5FnL4dcBW2vC66Ou04tXyx
         7+NHOIZT+islWazgEWSx9bMKrCZU2ywZGqTzw8eb8lmN9rLZUlDvpGgvmNLLTcd53f
         kO8XY+sQ0EZU3l7gE4v4HAhFPTPDAV5k6ETG6Fd22LRQpNnvgDPggM8pfW6Q37hTWk
         Aai7bOgc7hEt3i5H/ZPDGLmSBazeXLXzFqO6TbAoeJutP3g3LJ25G8S3acwqVM2zmg
         9yFgK9twsp6ZXVDQn68AHJGNvIRcJPhOUyASJvZJctv96nA2AJRyl4Mu4Vh8XON52k
         7RMkapz7B9bPA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: sumitg <sumitg@nvidia.com>

Fixing use-after-free within __v4l2_ctrl_handler_setup().
Memory is being freed with kfree(new_ref) for duplicate
control reference entry but ctrl->cluster pointer is still
referring to freed duplicate entry resulting in error on
access. Change done to update cluster pointer only when new
control reference is added.

 ==================================================================
 BUG: KASAN: use-after-free in __v4l2_ctrl_handler_setup+0x388/0x428
 Read of size 8 at addr ffffffc324e78618 by task systemd-udevd/312

 Allocated by task 312:

 Freed by task 312:

 The buggy address belongs to the object at ffffffc324e78600
  which belongs to the cache kmalloc-64 of size 64
 The buggy address is located 24 bytes inside of
  64-byte region [ffffffc324e78600, ffffffc324e78640)
 The buggy address belongs to the page:
 page:ffffffbf0c939e00 count:1 mapcount:0 mapping:
					(null) index:0xffffffc324e78f80
 flags: 0x4000000000000100(slab)
 raw: 4000000000000100 0000000000000000 ffffffc324e78f80 000000018020001a
 raw: 0000000000000000 0000000100000001 ffffffc37040fb80 0000000000000000
 page dumped because: kasan: bad access detected

 Memory state around the buggy address:
  ffffffc324e78500: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
  ffffffc324e78580: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
 >ffffffc324e78600: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
                             ^
  ffffffc324e78680: 00 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc
  ffffffc324e78700: 00 00 00 00 00 fc fc fc fc fc fc fc fc fc fc fc
 ==================================================================

Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
---

v4:
* update ctrl->cluster only when new control reference is added.

v3:
* update ctrl->cluster only when new control reference is added.
* add new ctrl to handler only if the cluster points to an entry.

v2:
* update ctrl->cluster only when new control reference is added.
* check ctrl->ncontrols to avoid illegal access when cluster has zero controls.

 drivers/media/v4l2-core/v4l2-ctrls.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 5e3806f..956522c 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -2154,15 +2154,6 @@ static int handler_new_ref(struct v4l2_ctrl_handler *hdl,
 	if (size_extra_req)
 		new_ref->p_req.p = &new_ref[1];
 
-	if (ctrl->handler == hdl) {
-		/* By default each control starts in a cluster of its own.
-		   new_ref->ctrl is basically a cluster array with one
-		   element, so that's perfect to use as the cluster pointer.
-		   But only do this for the handler that owns the control. */
-		ctrl->cluster = &new_ref->ctrl;
-		ctrl->ncontrols = 1;
-	}
-
 	INIT_LIST_HEAD(&new_ref->node);
 
 	mutex_lock(hdl->lock);
@@ -2195,6 +2186,15 @@ static int handler_new_ref(struct v4l2_ctrl_handler *hdl,
 	hdl->buckets[bucket] = new_ref;
 	if (ctrl_ref)
 		*ctrl_ref = new_ref;
+	if (ctrl->handler == hdl) {
+		/* By default each control starts in a cluster of its own.
+		 * new_ref->ctrl is basically a cluster array with one
+		 * element, so that's perfect to use as the cluster pointer.
+		 * But only do this for the handler that owns the control.
+		 */
+		ctrl->cluster = &new_ref->ctrl;
+		ctrl->ncontrols = 1;
+	}
 
 unlock:
 	mutex_unlock(hdl->lock);
-- 
2.7.4

