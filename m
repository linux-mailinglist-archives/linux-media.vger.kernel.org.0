Return-Path: <linux-media+bounces-17493-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC8F96A848
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 22:26:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 104C51C20E3E
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 20:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FCF51D58A7;
	Tue,  3 Sep 2024 20:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="gyCFKi3X"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17C81D5897;
	Tue,  3 Sep 2024 20:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725395180; cv=pass; b=lGrOdzHdAtiR4F1VJ/N99WIFO10s0a++Rr2HXb5VEyNgPnc21C2pHgJF37yRYHbF5BgkbCjD80BgJSyqdi2D2LzsT3dgqGAzWURGqLeNhdXyzNY55acgvKIfXTiQh1fsX68A5zrPB3be6YqvELyY4n5L10oMLp8aFgQoYxYcvxg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725395180; c=relaxed/simple;
	bh=Fm3yf2Fi9CYnTTkfNrN4BIanGwQZqGTpdIPeSOgzU+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mH1BX6BK0kkvGjZyqWztu3xDBExEqQ6sVBeVSF6J1YWfu32EDhpYpVBIP3sBaqiv3FGYbupOK/gY7LbRToxoWHLUm6Rg4mrb7XAqU93MxmO7YVjMjBW78kuplEz981jTwfUqkmd/jmHMBu4GPtqUADE4u+Vty7f7bz8XILRrfiQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=gyCFKi3X; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Delivered-To: boris.brezillon@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1725395160; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=M/s+g08UUl/LWh4sC4Z6WvnBdBMSSMwtIIFbLtPVCOt5KiMQIbd/06fzrjOEY6PlF864BRdLwcpX8nnUKz3JPKHHvUHB2RGZMAwKVXrWfNz+rMz8U9MwNGPvlGmlHRVbWVA6NZrybus0jPXLJB2UFgwNkcop3LaxUeivHtzygLc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725395160; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=0hK5IstV5Rak8f/N8IrRoF6nKtzqAKTvRVsx38XrqAs=; 
	b=UxKbhzU21vfUPmsgyAN1FJVaOnwqJoymesv8bQcwKUQls2hWF1+oZx7YjazzmpjuLsII5dj2VXb5LRU4AR+yUvoC5uUOxto6YMcUK+H8wyPOliCPvcCbsDASiP2any3JjY7v1Kmr+1ajhMxanv9BOZvjBzf90ngQGtLmqWU1OSA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725395160;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=0hK5IstV5Rak8f/N8IrRoF6nKtzqAKTvRVsx38XrqAs=;
	b=gyCFKi3X5gft20rQ1tns+ufBt7iTdh/GJovBr13qOAK1mAQCNl8rj0CQednJiNn4
	nDMoTWMXQQpGPSau0RXM9eD80II5AzILJmypBUJprp8taQiE0iQrcA0op9qIZGiU7pK
	fQuRHO+yu43zKBm5sE0Xgana+/KONI3vqtRnJ5xU=
Received: by mx.zohomail.com with SMTPS id 1725395159718851.3382164517398;
	Tue, 3 Sep 2024 13:25:59 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: kernel@collabora.com,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH v5 2/4] drm/panthor: add DRM fdinfo support
Date: Tue,  3 Sep 2024 21:25:36 +0100
Message-ID: <20240903202541.430225-3-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240903202541.430225-1-adrian.larumbe@collabora.com>
References: <20240903202541.430225-1-adrian.larumbe@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drawing from the FW-calculated values in the previous commit, we can
increase the numbers for an open file by collecting them from finished jobs
when updating their group synchronisation objects.

Display of fdinfo key-value pairs is governed by a flag that is by default
disabled in the present commit, and supporting manual toggle of it will be
the matter of a later commit.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_devfreq.c | 18 ++++++++-
 drivers/gpu/drm/panthor/panthor_device.h  | 14 +++++++
 drivers/gpu/drm/panthor/panthor_drv.c     | 35 ++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_sched.c   | 45 +++++++++++++++++++++++
 4 files changed, 111 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
index c6d3c327cc24..9d0f891b9b53 100644
--- a/drivers/gpu/drm/panthor/panthor_devfreq.c
+++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
@@ -62,14 +62,20 @@ static void panthor_devfreq_update_utilization(struct panthor_devfreq *pdevfreq)
 static int panthor_devfreq_target(struct device *dev, unsigned long *freq,
 				  u32 flags)
 {
+	struct panthor_device *ptdev = dev_get_drvdata(dev);
 	struct dev_pm_opp *opp;
+	int err;
 
 	opp = devfreq_recommended_opp(dev, freq, flags);
 	if (IS_ERR(opp))
 		return PTR_ERR(opp);
 	dev_pm_opp_put(opp);
 
-	return dev_pm_opp_set_rate(dev, *freq);
+	err = dev_pm_opp_set_rate(dev, *freq);
+	if (!err)
+		ptdev->current_frequency = *freq;
+
+	return err;
 }
 
 static void panthor_devfreq_reset(struct panthor_devfreq *pdevfreq)
@@ -130,6 +136,7 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
 	struct panthor_devfreq *pdevfreq;
 	struct dev_pm_opp *opp;
 	unsigned long cur_freq;
+	unsigned long freq = ULONG_MAX;
 	int ret;
 
 	pdevfreq = drmm_kzalloc(&ptdev->base, sizeof(*ptdev->devfreq), GFP_KERNEL);
@@ -161,6 +168,7 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
 		return PTR_ERR(opp);
 
 	panthor_devfreq_profile.initial_freq = cur_freq;
+	ptdev->current_frequency = cur_freq;
 
 	/* Regulator coupling only takes care of synchronizing/balancing voltage
 	 * updates, but the coupled regulator needs to be enabled manually.
@@ -204,6 +212,14 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
 
 	dev_pm_opp_put(opp);
 
+	/* Find the fastest defined rate  */
+	opp = dev_pm_opp_find_freq_floor(dev, &freq);
+	if (IS_ERR(opp))
+		return PTR_ERR(opp);
+	ptdev->fast_rate = freq;
+
+	dev_pm_opp_put(opp);
+
 	/*
 	 * Setup default thresholds for the simple_ondemand governor.
 	 * The values are chosen based on experiments.
diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index a48e30d0af30..0e68f5a70d20 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -184,6 +184,17 @@ struct panthor_device {
 
 	/** @profile_mask: User-set profiling flags for job accounting. */
 	u32 profile_mask;
+
+	/** @current_frequency: Device clock frequency at present. Set by DVFS*/
+	unsigned long current_frequency;
+
+	/** @fast_rate: Maximum device clock frequency. Set by DVFS */
+	unsigned long fast_rate;
+};
+
+struct panthor_gpu_usage {
+	u64 time;
+	u64 cycles;
 };
 
 /**
@@ -198,6 +209,9 @@ struct panthor_file {
 
 	/** @groups: Scheduling group pool attached to this file. */
 	struct panthor_group_pool *groups;
+
+	/** @stats: cycle and timestamp measures for job execution. */
+	struct panthor_gpu_usage stats;
 };
 
 int panthor_device_init(struct panthor_device *ptdev);
diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index b5e7b919f241..e18838754963 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -3,12 +3,17 @@
 /* Copyright 2019 Linaro, Ltd., Rob Herring <robh@kernel.org> */
 /* Copyright 2019 Collabora ltd. */
 
+#ifdef CONFIG_ARM_ARCH_TIMER
+#include <asm/arch_timer.h>
+#endif
+
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/of_platform.h>
 #include <linux/pagemap.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/time64.h>
 
 #include <drm/drm_debugfs.h>
 #include <drm/drm_drv.h>
@@ -1351,6 +1356,34 @@ static int panthor_mmap(struct file *filp, struct vm_area_struct *vma)
 	return ret;
 }
 
+static void panthor_gpu_show_fdinfo(struct panthor_device *ptdev,
+				    struct panthor_file *pfile,
+				    struct drm_printer *p)
+{
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
@@ -1360,6 +1393,7 @@ static const struct file_operations panthor_drm_driver_fops = {
 	.read = drm_read,
 	.llseek = noop_llseek,
 	.mmap = panthor_mmap,
+	.show_fdinfo = drm_show_fdinfo,
 };
 
 #ifdef CONFIG_DEBUG_FS
@@ -1378,6 +1412,7 @@ static const struct drm_driver panthor_drm_driver = {
 			   DRIVER_SYNCOBJ_TIMELINE | DRIVER_GEM_GPUVA,
 	.open = panthor_open,
 	.postclose = panthor_postclose,
+	.show_fdinfo = panthor_show_fdinfo,
 	.ioctls = panthor_drm_driver_ioctls,
 	.num_ioctls = ARRAY_SIZE(panthor_drm_driver_ioctls),
 	.fops = &panthor_drm_driver_fops,
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index b087648bf59a..e69ab5175ae8 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -619,6 +619,18 @@ struct panthor_group {
 	 */
 	struct panthor_kernel_bo *syncobjs;
 
+	/** @fdinfo: Per-file total cycle and timestamp values reference. */
+	struct {
+		/** @data: Pointer to actual per-file sample data. */
+		struct panthor_gpu_usage *data;
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
 
@@ -886,6 +898,8 @@ static void group_release_work(struct work_struct *work)
 						   release_work);
 	u32 i;
 
+	mutex_destroy(&group->fdinfo.lock);
+
 	for (i = 0; i < group->queue_count; i++)
 		group_free_queue(group, group->queues[i]);
 
@@ -2808,6 +2822,28 @@ void panthor_sched_post_reset(struct panthor_device *ptdev, bool reset_failed)
 	}
 }
 
+static void update_fdinfo_stats(struct panthor_job *job)
+{
+	struct panthor_group *group = job->group;
+	struct panthor_queue *queue = group->queues[job->queue_idx];
+	struct panthor_gpu_usage *fdinfo;
+	struct panthor_job_profiling_data *times;
+
+	times = (struct panthor_job_profiling_data *)
+		((unsigned long) queue->profiling_info.slots->kmap +
+		 (job->profiling_slot * sizeof(struct panthor_job_profiling_data)));
+
+	mutex_lock(&group->fdinfo.lock);
+	if ((group->fdinfo.data)) {
+		fdinfo = group->fdinfo.data;
+		if (job->profile_mask & PANTHOR_DEVICE_PROFILING_CYCLES)
+			fdinfo->cycles += times->cycles.after - times->cycles.before;
+		if (job->profile_mask & PANTHOR_DEVICE_PROFILING_TIMESTAMP)
+			fdinfo->time += times->time.after - times->time.before;
+	}
+	mutex_unlock(&group->fdinfo.lock);
+}
+
 static void group_sync_upd_work(struct work_struct *work)
 {
 	struct panthor_group *group =
@@ -2840,6 +2876,8 @@ static void group_sync_upd_work(struct work_struct *work)
 	dma_fence_end_signalling(cookie);
 
 	list_for_each_entry_safe(job, job_tmp, &done_jobs, node) {
+		if (job->profile_mask)
+			update_fdinfo_stats(job);
 		list_del_init(&job->node);
 		panthor_job_put(&job->base);
 	}
@@ -3430,6 +3468,9 @@ int panthor_group_create(struct panthor_file *pfile,
 	}
 	mutex_unlock(&sched->reset.lock);
 
+	group->fdinfo.data = &pfile->stats;
+	mutex_init(&group->fdinfo.lock);
+
 	return gid;
 
 err_put_group:
@@ -3469,6 +3510,10 @@ int panthor_group_destroy(struct panthor_file *pfile, u32 group_handle)
 	mutex_unlock(&sched->lock);
 	mutex_unlock(&sched->reset.lock);
 
+	mutex_lock(&group->fdinfo.lock);
+	group->fdinfo.data = NULL;
+	mutex_unlock(&group->fdinfo.lock);
+
 	group_put(group);
 	return 0;
 }
-- 
2.46.0


