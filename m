Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CDEF400534
	for <lists+linux-media@lfdr.de>; Fri,  3 Sep 2021 20:44:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350437AbhICSps (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Sep 2021 14:45:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350486AbhICSp0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Sep 2021 14:45:26 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B50FC06129E;
        Fri,  3 Sep 2021 11:44:23 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id g13-20020a17090a3c8d00b00196286963b9so150866pjc.3;
        Fri, 03 Sep 2021 11:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r+CETvrDJ/NiW27OxtGv51gkBouu3eJnLUm5MLLrZUQ=;
        b=KTadPrskdFiuj59MG/pKM9NelFlpQlW6Ax4AJH/ij48cuYH7MHYq1Z0FgjkJlqcUj2
         Mlc0jZhRcF/o/k8BVuafC/4BAykeVSNa6HRj0LyyEiWg/k8O3Awk6e922nfkz1gOJEDu
         lt9MX7N7p1p+rzwdfUNWR/nBDrPLjVoxkVCz+g0F345pGbCk4zP8TXgd1yWqUwo9L+jg
         UTfcxihqPbb1AXKuKrrxCd7NV0I5LKRGT9/eBmQuA1fd0m6B/OI34/RmbKJUfpaFS72o
         p8tno8yxvtWL7hC4O70HW2KaP3ZD43RP3vilS5fHJji78gWmXcgketju28wyVSx0GkbK
         vvrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r+CETvrDJ/NiW27OxtGv51gkBouu3eJnLUm5MLLrZUQ=;
        b=VoM0mGcF/voTFg1KoEzewG9OOZD5OTT4Lbkit1hb0PtylCV4xb6v+GbFHk3uu0elRL
         oHAsxUWRxsyWDKRxkfnvg4/ItW7mPqQXtXbLV/WvLgk09+/+ahosRYPQGIyEnJzQvzpm
         0brIWmWuBeVKxXOY9GbTfc3AQJmwLm419jjzK5HqjRMhgJRMHdqdZdM6FFOtYBoh1ejH
         HNCUc1+ox4DIgPmaiYxMaH7+NgA3EsKpeA+VubHlFFFH5KhHOWXcqszGjKpQciF4GFI3
         hCghdeuNmgsrPgPL/UN6rSzg1dMeXb09PLdYSyqTvgsvgNVRTmR7DqdXgziUQQesw1kV
         iROw==
X-Gm-Message-State: AOAM533pDgrL1xE2mQx+d1JzzHqtEaI62NAbaY748H/br/5QeXXiojPj
        kxihZNe0lu7MCFNUIk/+O44=
X-Google-Smtp-Source: ABdhPJxDlyP8n7BJJaUYl2vBFBL1icR2Xyf92lw8U2fMqmXPt8YRwfgqLSfrh+b0OmSLpxaobl3+PQ==
X-Received: by 2002:a17:90a:b785:: with SMTP id m5mr324307pjr.213.1630694662726;
        Fri, 03 Sep 2021 11:44:22 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id s15sm121202pfu.67.2021.09.03.11.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 11:44:21 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= 
        <ckoenig.leichtzumerken@gmail.com>,
        =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org (open list:SYNC FILE FRAMEWORK),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 9/9] dma-buf/sw_sync: Add fence deadline support
Date:   Fri,  3 Sep 2021 11:48:00 -0700
Message-Id: <20210903184806.1680887-10-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903184806.1680887-1-robdclark@gmail.com>
References: <20210903184806.1680887-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

This consists of simply storing the most recent deadline, and adding an
ioctl to retrieve the deadline.  This can be used in conjunction with
the SET_DEADLINE ioctl on a fence fd for testing.  Ie. create various
sw_sync fences, merge them into a fence-array, set deadline on the
fence-array and confirm that it is propagated properly to each fence.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/dma-buf/sw_sync.c    | 58 ++++++++++++++++++++++++++++++++++++
 drivers/dma-buf/sync_debug.h |  2 ++
 2 files changed, 60 insertions(+)

diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
index 348b3a9170fa..50f2638cccd3 100644
--- a/drivers/dma-buf/sw_sync.c
+++ b/drivers/dma-buf/sw_sync.c
@@ -52,12 +52,26 @@ struct sw_sync_create_fence_data {
 	__s32	fence; /* fd of new fence */
 };
 
+/**
+ * struct sw_sync_get_deadline - get the deadline of a sw_sync fence
+ * @tv_sec:	seconds elapsed since epoch (out)
+ * @tv_nsec:	nanoseconds elapsed since the time given by the tv_sec (out)
+ * @fence_fd:	the sw_sync fence fd (in)
+ */
+struct sw_sync_get_deadline {
+	__s64	tv_sec;
+	__s32	tv_nsec;
+	__s32	fence_fd;
+};
+
 #define SW_SYNC_IOC_MAGIC	'W'
 
 #define SW_SYNC_IOC_CREATE_FENCE	_IOWR(SW_SYNC_IOC_MAGIC, 0,\
 		struct sw_sync_create_fence_data)
 
 #define SW_SYNC_IOC_INC			_IOW(SW_SYNC_IOC_MAGIC, 1, __u32)
+#define SW_SYNC_GET_DEADLINE		_IOWR(SW_SYNC_IOC_MAGIC, 2, \
+		struct sw_sync_get_deadline)
 
 static const struct dma_fence_ops timeline_fence_ops;
 
@@ -171,6 +185,13 @@ static void timeline_fence_timeline_value_str(struct dma_fence *fence,
 	snprintf(str, size, "%d", parent->value);
 }
 
+static void timeline_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
+{
+	struct sync_pt *pt = dma_fence_to_sync_pt(fence);
+
+	pt->deadline = deadline;
+}
+
 static const struct dma_fence_ops timeline_fence_ops = {
 	.get_driver_name = timeline_fence_get_driver_name,
 	.get_timeline_name = timeline_fence_get_timeline_name,
@@ -179,6 +200,7 @@ static const struct dma_fence_ops timeline_fence_ops = {
 	.release = timeline_fence_release,
 	.fence_value_str = timeline_fence_value_str,
 	.timeline_value_str = timeline_fence_timeline_value_str,
+	.set_deadline = timeline_fence_set_deadline,
 };
 
 /**
@@ -387,6 +409,39 @@ static long sw_sync_ioctl_inc(struct sync_timeline *obj, unsigned long arg)
 	return 0;
 }
 
+static int sw_sync_ioctl_get_deadline(struct sync_timeline *obj, unsigned long arg)
+{
+	struct sw_sync_get_deadline data;
+	struct timespec64 ts;
+	struct dma_fence *fence;
+	struct sync_pt *pt;
+
+	if (copy_from_user(&data, (void __user *)arg, sizeof(data)))
+		return -EFAULT;
+
+	if (data.tv_sec || data.tv_nsec)
+		return -EINVAL;
+
+	fence = sync_file_get_fence(data.fence_fd);
+	if (!fence)
+		return -EINVAL;
+
+	pt = dma_fence_to_sync_pt(fence);
+	if (!pt)
+		return -EINVAL;
+
+	ts = ktime_to_timespec64(pt->deadline);
+	data.tv_sec  = ts.tv_sec;
+	data.tv_nsec = ts.tv_nsec;
+
+	dma_fence_put(fence);
+
+	if (copy_to_user((void __user *)arg, &data, sizeof(data)))
+		return -EFAULT;
+
+	return 0;
+}
+
 static long sw_sync_ioctl(struct file *file, unsigned int cmd,
 			  unsigned long arg)
 {
@@ -399,6 +454,9 @@ static long sw_sync_ioctl(struct file *file, unsigned int cmd,
 	case SW_SYNC_IOC_INC:
 		return sw_sync_ioctl_inc(obj, arg);
 
+	case SW_SYNC_GET_DEADLINE:
+		return sw_sync_ioctl_get_deadline(obj, arg);
+
 	default:
 		return -ENOTTY;
 	}
diff --git a/drivers/dma-buf/sync_debug.h b/drivers/dma-buf/sync_debug.h
index 6176e52ba2d7..2e0146d0bdbb 100644
--- a/drivers/dma-buf/sync_debug.h
+++ b/drivers/dma-buf/sync_debug.h
@@ -55,11 +55,13 @@ static inline struct sync_timeline *dma_fence_parent(struct dma_fence *fence)
  * @base: base fence object
  * @link: link on the sync timeline's list
  * @node: node in the sync timeline's tree
+ * @deadline: the most recently set fence deadline
  */
 struct sync_pt {
 	struct dma_fence base;
 	struct list_head link;
 	struct rb_node node;
+	ktime_t deadline;
 };
 
 extern const struct file_operations sw_sync_debugfs_fops;
-- 
2.31.1

