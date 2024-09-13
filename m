Return-Path: <linux-media+bounces-18254-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFEC97806D
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 14:50:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 893691C217DD
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 12:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B34F51DB923;
	Fri, 13 Sep 2024 12:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="ZDel0Ip6"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B071DB54C;
	Fri, 13 Sep 2024 12:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726231779; cv=pass; b=FmxYvBgt/RtZpYIm9UdTBqYFwhfzQ92wuXty/HePx2XWHJDvEGSJfUDVm7LXpEwJX7vxBx0D7+FljMxSYFIcFuS0V8jly/Nul2+/t92VQ4RYIbpbzJvBut2Vk9Z8Cmea2oe7kZz1bHRKOS9ZB6FLuKjLDEcD2Yj0VeBI9tIpBgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726231779; c=relaxed/simple;
	bh=JdrVn6yA7tFS+Rzkp34M+WnMVYy13uJnwi539CgN3N4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IrFxBLEPaOhCJ8vrLavRjQirOQUuwO7bwkrMAirmQ155KKs6l/cEGvS3enRLxk+3SlBgOW3E64820efMofn6Yio9w5xnQwH6V/JfQxKYfft8ItCRCQ7W/vc1v+qfLgvCKnF0xMjIJh5Dp8pUrYkfn4kNyaeAwdEuUdloFXKDL98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=ZDel0Ip6; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1726231761; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Hkut/kQ4RMrItpjx5NBhkUbMjLTaQGv5GoGjr+FE+O5vNaMBE1SKe/nmLltmftRE5WqgHBHOTZSb7eS2T52piQcRa0ZMVy2M0pz5HLcPe/nxqNI+HYA39PiYwE9BiaHWqV4TPvmz5t9/O/iC1z1mICuHWofR8hekGn1hzFR80po=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1726231761; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yOac6qUxMbWR/YO0jAVVZTBjc9gLRvQRzzXmrU4q+QI=; 
	b=ZOqD5qxgtLW+169mkdDsiZlVC4ROn+LC3q9QeWtEjnZZa9jAV6Siqic6xgxuYW75j+WfTcT25hUyQUBfcoDr/gxXe8oQKair8lisL0YoP7xhno9REacGJ6VwGqYJUkPPxce3jbaoEB+UxZVl8d/FtQ+Kxg9GmCoXC2tVALyDBC4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1726231761;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=yOac6qUxMbWR/YO0jAVVZTBjc9gLRvQRzzXmrU4q+QI=;
	b=ZDel0Ip6HXI2VuCQC/51kXP5yWczq2q5ke4vLawqh7B9QL1Dp+E7JMqUbYxoJIy1
	dUwsbsVFADMKl8AmCOa7yJVqv3+tAo+0mQVHz+CxQaJdcMqvYuGRiiDn6FX4wEgVeWC
	jTZhrPO6T13jPFnyKyOGvbL2wellQ+oXzpZTtUyA=
Received: by mx.zohomail.com with SMTPS id 1726231759222815.3323371020737;
	Fri, 13 Sep 2024 05:49:19 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: kernel@collabora.com,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH v6 3/5] drm/panthor: add DRM fdinfo support
Date: Fri, 13 Sep 2024 13:42:11 +0100
Message-ID: <20240913124857.389630-4-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240913124857.389630-1-adrian.larumbe@collabora.com>
References: <20240913124857.389630-1-adrian.larumbe@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drawing from the FW-calculated values in a previous commit, we can increase
the numbers for an open file by collecting them from finished jobs when
updating their group synchronisation objects.

Display of fdinfo key-value pairs is governed by a bitmask that is by
default unset in the present commit, and supporting manual toggle of it
will be the matter of a later commit.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_device.h |  8 ++++
 drivers/gpu/drm/panthor/panthor_drv.c    | 34 ++++++++++++++
 drivers/gpu/drm/panthor/panthor_sched.c  | 56 ++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_sched.h  |  2 +
 4 files changed, 100 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index 2109905813e8..0e68f5a70d20 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -192,6 +192,11 @@ struct panthor_device {
 	unsigned long fast_rate;
 };
 
+struct panthor_gpu_usage {
+	u64 time;
+	u64 cycles;
+};
+
 /**
  * struct panthor_file - Panthor file
  */
@@ -204,6 +209,9 @@ struct panthor_file {
 
 	/** @groups: Scheduling group pool attached to this file. */
 	struct panthor_group_pool *groups;
+
+	/** @stats: cycle and timestamp measures for job execution. */
+	struct panthor_gpu_usage stats;
 };
 
 int panthor_device_init(struct panthor_device *ptdev);
diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 0caf9e9a8c45..233b265c0819 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -13,6 +13,7 @@
 #include <linux/pagemap.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/time64.h>
 
 #include <drm/drm_auth.h>
 #include <drm/drm_debugfs.h>
@@ -1414,6 +1415,37 @@ static int panthor_mmap(struct file *filp, struct vm_area_struct *vma)
 	return ret;
 }
 
+static void panthor_gpu_show_fdinfo(struct panthor_device *ptdev,
+				    struct panthor_file *pfile,
+				    struct drm_printer *p)
+{
+	if (ptdev->profile_mask & PANTHOR_DEVICE_PROFILING_ALL)
+		panthor_fdinfo_gather_group_samples(pfile);
+
+	if (ptdev->profile_mask & PANTHOR_DEVICE_PROFILING_TIMESTAMP) {
+#ifdef CONFIG_ARM_ARCH_TIMER
+		drm_printf(p, "drm-engine-panthor:\t%llu ns\n",
+			   DIV_ROUND_UP_ULL((pfile->stats.time * NSEC_PER_SEC),
+					    arch_timer_get_cntfrq()));
+#endif
+	}
+	if (ptdev->profile_mask & PANTHOR_DEVICE_PROFILING_CYCLES)
+		drm_printf(p, "drm-cycles-panthor:\t%llu\n", pfile->stats.cycles);
+
+	drm_printf(p, "drm-maxfreq-panthor:\t%lu Hz\n", ptdev->fast_rate);
+	drm_printf(p, "drm-curfreq-panthor:\t%lu Hz\n", ptdev->current_frequency);
+}
+
+static void panthor_show_fdinfo(struct drm_printer *p, struct drm_file *file)
+{
+	struct drm_device *dev = file->minor->dev;
+	struct panthor_device *ptdev = container_of(dev, struct panthor_device, base);
+
+	panthor_gpu_show_fdinfo(ptdev, file->driver_priv, p);
+
+	drm_show_memory_stats(p, file);
+}
+
 static const struct file_operations panthor_drm_driver_fops = {
 	.open = drm_open,
 	.release = drm_release,
@@ -1423,6 +1455,7 @@ static const struct file_operations panthor_drm_driver_fops = {
 	.read = drm_read,
 	.llseek = noop_llseek,
 	.mmap = panthor_mmap,
+	.show_fdinfo = drm_show_fdinfo,
 };
 
 #ifdef CONFIG_DEBUG_FS
@@ -1442,6 +1475,7 @@ static const struct drm_driver panthor_drm_driver = {
 			   DRIVER_SYNCOBJ_TIMELINE | DRIVER_GEM_GPUVA,
 	.open = panthor_open,
 	.postclose = panthor_postclose,
+	.show_fdinfo = panthor_show_fdinfo,
 	.ioctls = panthor_drm_driver_ioctls,
 	.num_ioctls = ARRAY_SIZE(panthor_drm_driver_ioctls),
 	.fops = &panthor_drm_driver_fops,
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index bcba52558f1e..d822bf9b59fa 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -619,6 +619,18 @@ struct panthor_group {
 	 */
 	struct panthor_kernel_bo *syncobjs;
 
+	/** @fdinfo: Per-file total cycle and timestamp values reference. */
+	struct {
+		/** @data: Total sampled values for jobs in queues from this group. */
+		struct panthor_gpu_usage data;
+
+		/**
+		 * @lock: Mutex to govern concurrent access from drm file's fdinfo callback
+		 * and job post-completion processing function
+		 */
+		struct mutex lock;
+	} fdinfo;
+
 	/** @state: Group state. */
 	enum panthor_group_state state;
 
@@ -889,6 +901,8 @@ static void group_release_work(struct work_struct *work)
 						   release_work);
 	u32 i;
 
+	mutex_destroy(&group->fdinfo.lock);
+
 	for (i = 0; i < group->queue_count; i++)
 		group_free_queue(group, group->queues[i]);
 
@@ -2811,6 +2825,44 @@ void panthor_sched_post_reset(struct panthor_device *ptdev, bool reset_failed)
 	}
 }
 
+static void update_fdinfo_stats(struct panthor_job *job)
+{
+	struct panthor_group *group = job->group;
+	struct panthor_queue *queue = group->queues[job->queue_idx];
+	struct panthor_gpu_usage *fdinfo = &group->fdinfo.data;
+	struct panthor_job_profiling_data *times;
+
+	times = (struct panthor_job_profiling_data *)
+		((unsigned long) queue->profiling.slots->kmap +
+		 (job->profiling.slot * sizeof(struct panthor_job_profiling_data)));
+
+	mutex_lock(&group->fdinfo.lock);
+	if (job->profiling.mask & PANTHOR_DEVICE_PROFILING_CYCLES)
+		fdinfo->cycles += times->cycles.after - times->cycles.before;
+	if (job->profiling.mask & PANTHOR_DEVICE_PROFILING_TIMESTAMP)
+		fdinfo->time += times->time.after - times->time.before;
+	mutex_unlock(&group->fdinfo.lock);
+}
+
+void panthor_fdinfo_gather_group_samples(struct panthor_file *pfile)
+{
+	struct panthor_group_pool *gpool = pfile->groups;
+	struct panthor_group *group;
+	unsigned long i;
+
+	if (IS_ERR_OR_NULL(gpool))
+		return;
+
+	xa_for_each(&gpool->xa, i, group) {
+		mutex_lock(&group->fdinfo.lock);
+		pfile->stats.cycles += group->fdinfo.data.cycles;
+		pfile->stats.time += group->fdinfo.data.time;
+		group->fdinfo.data.cycles = 0;
+		group->fdinfo.data.time = 0;
+		mutex_unlock(&group->fdinfo.lock);
+	}
+}
+
 static void group_sync_upd_work(struct work_struct *work)
 {
 	struct panthor_group *group =
@@ -2843,6 +2895,8 @@ static void group_sync_upd_work(struct work_struct *work)
 	dma_fence_end_signalling(cookie);
 
 	list_for_each_entry_safe(job, job_tmp, &done_jobs, node) {
+		if (job->profiling.mask)
+			update_fdinfo_stats(job);
 		list_del_init(&job->node);
 		panthor_job_put(&job->base);
 	}
@@ -3440,6 +3494,8 @@ int panthor_group_create(struct panthor_file *pfile,
 	}
 	mutex_unlock(&sched->reset.lock);
 
+	mutex_init(&group->fdinfo.lock);
+
 	return gid;
 
 err_put_group:
diff --git a/drivers/gpu/drm/panthor/panthor_sched.h b/drivers/gpu/drm/panthor/panthor_sched.h
index 3a30d2328b30..5ae6b4bde7c5 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.h
+++ b/drivers/gpu/drm/panthor/panthor_sched.h
@@ -47,4 +47,6 @@ void panthor_sched_resume(struct panthor_device *ptdev);
 void panthor_sched_report_mmu_fault(struct panthor_device *ptdev);
 void panthor_sched_report_fw_events(struct panthor_device *ptdev, u32 events);
 
+void panthor_fdinfo_gather_group_samples(struct panthor_file *pfile);
+
 #endif
-- 
2.46.0


