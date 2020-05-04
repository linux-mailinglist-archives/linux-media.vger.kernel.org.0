Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 106AC1C3827
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 13:33:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728606AbgEDLdG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 07:33:06 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:55120 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726445AbgEDLdG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 May 2020 07:33:06 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id A203D400EF87F3558DB5;
        Mon,  4 May 2020 19:33:04 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Mon, 4 May 2020
 19:32:59 +0800
From:   Jason Yan <yanaijie@huawei.com>
To:     <eric@anholt.net>, <airlied@linux.ie>, <daniel@ffwll.ch>,
        <sumit.semwal@linaro.org>, <dri-devel@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linaro-mm-sig@lists.linaro.org>
CC:     Jason Yan <yanaijie@huawei.com>
Subject: [PATCH] drm/vc4: make vc4_queue_seqno_cb() return void
Date:   Mon, 4 May 2020 19:32:21 +0800
Message-ID: <20200504113221.40488-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

No one uses the return value of this function, so make it return void.
This fixes the following coccicheck warning:

drivers/gpu/drm/vc4/vc4_gem.c:1029:5-8: Unneeded variable: "ret". Return
"0" on line 1044

Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 drivers/gpu/drm/vc4/vc4_drv.h | 6 +++---
 drivers/gpu/drm/vc4/vc4_gem.c | 9 +++------
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 3b1f02efefbe..990b15b82e24 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -810,9 +810,9 @@ void vc4_move_job_to_render(struct drm_device *dev, struct vc4_exec_info *exec);
 int vc4_wait_for_seqno(struct drm_device *dev, uint64_t seqno,
 		       uint64_t timeout_ns, bool interruptible);
 void vc4_job_handle_completed(struct vc4_dev *vc4);
-int vc4_queue_seqno_cb(struct drm_device *dev,
-		       struct vc4_seqno_cb *cb, uint64_t seqno,
-		       void (*func)(struct vc4_seqno_cb *cb));
+void vc4_queue_seqno_cb(struct drm_device *dev,
+		        struct vc4_seqno_cb *cb, uint64_t seqno,
+		        void (*func)(struct vc4_seqno_cb *cb));
 int vc4_gem_madvise_ioctl(struct drm_device *dev, void *data,
 			  struct drm_file *file_priv);
 
diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
index e1cfc3ccd05a..fbcb4fa4e80a 100644
--- a/drivers/gpu/drm/vc4/vc4_gem.c
+++ b/drivers/gpu/drm/vc4/vc4_gem.c
@@ -1021,12 +1021,11 @@ static void vc4_seqno_cb_work(struct work_struct *work)
 	cb->func(cb);
 }
 
-int vc4_queue_seqno_cb(struct drm_device *dev,
-		       struct vc4_seqno_cb *cb, uint64_t seqno,
-		       void (*func)(struct vc4_seqno_cb *cb))
+void vc4_queue_seqno_cb(struct drm_device *dev,
+		        struct vc4_seqno_cb *cb, uint64_t seqno,
+		        void (*func)(struct vc4_seqno_cb *cb))
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	int ret = 0;
 	unsigned long irqflags;
 
 	cb->func = func;
@@ -1040,8 +1039,6 @@ int vc4_queue_seqno_cb(struct drm_device *dev,
 		schedule_work(&cb->work);
 	}
 	spin_unlock_irqrestore(&vc4->job_lock, irqflags);
-
-	return ret;
 }
 
 /* Scheduled when any job has been completed, this walks the list of
-- 
2.21.1

