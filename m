Return-Path: <linux-media+bounces-60577-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IP6ZLisc+2nSWgMAu9opvQ
	(envelope-from <linux-media+bounces-60577-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 12:47:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F2F4D977E
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 12:47:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DE9DE3012CB2
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 10:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 877D2421A0C;
	Wed,  6 May 2026 10:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="QhqfmTaP"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A344218BD;
	Wed,  6 May 2026 10:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778064403; cv=pass; b=eWdKBttRIE9zMZDW4HcvwGUR8KnIwNc8UtEtors9dx7BaKCHapKP6crk3PmVVxIgr5VeCGdgYNBTK3/qC09EyZEw0XpnqNNsozQP6slFdsjFVliDMwpDxLCAAeznQu3IjSxI4HC8qVH6C3h4SHhX3A2QZRGDCqLRtgFJdSFRcw8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778064403; c=relaxed/simple;
	bh=/NoSZTu0bz7MhVzEJGZziO9zDn4PJq5WX5oiu+aJ3po=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DPzHR7ojRTfmge6ALFbYh2g9vXP3GEJhP2accb1SHTSykpsxAQL/DQXxZnlMAQzLj7CMQVRtBxgEJgzE+w362tDsXhIy0KvSCCKCl/3p4DBLeaxY9PFS4DVWy4iU0RbKp8GUz8HRPeW+yyiBUKgnC3bCvxEOveb4/+DdKhlmWPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=QhqfmTaP; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1778064389; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=D6FvrL7zivCavhxW8V2B+snCL/+ZyPrMVjOuZTJ5+vuT5yLGKlMTwva55lG5KxCbQQq9glD0auJwFpSMsMrQx3HwOa57ksvTBCR80HT5APctDxjLB6BUGyEo5KKMs1JwxvCoDXHGbMlzdc9XUX+1F2DugRUQDIGokBr8GbDx73A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1778064389; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vwfdhxDnYiWIt6VTFU0ct626I1R9RrLO+rBMwge8DiU=; 
	b=hfCoArjp6Ukm2x/5P78YSbMfuiGxPt4M60o2+Ta9bEvu3gr+pxbH7hdj+VQDzevvf7ONGijqZl3kGRiXFUYTI9+uQPrw5Lg1O5JBT1YjnYeCeJMOrDcxI1dCpHK5wzRNq5Dz50uTw4FgkBmk3RQBhW+BjWdNhuGVG7r2O7CqH6E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1778064389;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=vwfdhxDnYiWIt6VTFU0ct626I1R9RrLO+rBMwge8DiU=;
	b=QhqfmTaPibZSRPSq2JTdt8BPbfh2ZtO9l0qmBkLgG7wLpO8pELsGDi8q86/rNFWM
	IpcmWF7QuenR0odLEn/EA+Fw6M6l3QhaJGh8ev0yL16rPY++8RpOCv5IaMnIiIqYdey
	LiVbvgBRYhn9RUi1xiEx81f6I0Xf6I5sRocHgkI4=
Received: by mx.zohomail.com with SMTPS id 177806438704319.20442345053607;
	Wed, 6 May 2026 03:46:27 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 06 May 2026 12:45:59 +0200
Subject: [PATCH 4/4] drm/panthor: Add explicit memory claim sysfs knob
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-panthor-explicit-reclaim-v1-4-44f82ac147ce@collabora.com>
References: <20260506-panthor-explicit-reclaim-v1-0-44f82ac147ce@collabora.com>
In-Reply-To: <20260506-panthor-explicit-reclaim-v1-0-44f82ac147ce@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: 42F2F4D977E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[collabora.com,arm.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60577-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.frattaroli@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:email,collabora.com:dkim,collabora.com:mid]

For deployments of systems with very tight memory and a system resource
manager process that can make well-founded decisions on trade-offs, a
way to tell panthor that all of a process' swapped-out GPU memory should
be swapped back in without touching every page manually is of interest.

Make it possible to do this by adding a new sysfs file, called
"mem_claim". Writing a TGID to it will cause panthor to search through
all panthor_files associated with that process, and bring all its
buffers back from swap.

Doing this requires the writer to have the CAP_SYS_RESOURCE capability,
even when operating on themselves.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 Documentation/ABI/testing/sysfs-driver-panthor-mem | 17 ++++++++++++++
 drivers/gpu/drm/panthor/panthor_drv.c              | 26 ++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_mmu.c              | 25 +++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_mmu.h              |  1 +
 4 files changed, 69 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-driver-panthor-mem b/Documentation/ABI/testing/sysfs-driver-panthor-mem
index 6639394abed2..41e2c18f641d 100644
--- a/Documentation/ABI/testing/sysfs-driver-panthor-mem
+++ b/Documentation/ABI/testing/sysfs-driver-panthor-mem
@@ -15,3 +15,20 @@ Description:
 		* -EPERM: insufficient permissions to run a reclaim on given TGID
 		* -EINTR: interrupted by signal
 		* -ESRCH: given TGID is not using panthor, and might not exist at all
+
+What:		/sys/bus/platform/drivers/panthor/.../mem_claim
+Date:		May 2026
+Contact:	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
+Description:
+		(WO) Writing to this file will cause GPU memory for all panthor GPU
+		contexts associated with the TGID that's written to it to be brought
+		back from swap. The write completes when the operation has finished.
+
+		The writing process requires the CAP_SYS_RESOURCE capability.
+
+		Possible error codes:
+		* -ERANGE: given TGID is too large/small for the TGID type.
+		* -EINVAL: given TGID could not be parsed.
+		* -EPERM: insufficient permissions
+		* -EINTR: interrupted by signal
+		* -ESRCH: given TGID is not using panthor, and might not exist at all
diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 7d19b8785ea3..fb2172b0439c 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1924,9 +1924,35 @@ static ssize_t mem_reclaim_store(struct device *dev,
 
 static DEVICE_ATTR_WO(mem_reclaim);
 
+static ssize_t mem_claim_store(struct device *dev, struct device_attribute *attr,
+			       const char *buf, size_t len)
+{
+	struct panthor_device *ptdev = dev_get_drvdata(dev);
+	pid_t tgid;
+	int ret;
+
+	ret = kstrtoint(buf, 0, &tgid);
+	if (ret)
+		return ret;
+
+	if (!capable(CAP_SYS_RESOURCE))
+		return -EPERM;
+
+	ret = panthor_run_on_pfiles_of_tgid(ptdev, tgid, panthor_mmu_force_claim);
+	if (ret < 0)
+		return ret;
+	else if (!ret)
+		return -ESRCH;
+
+	return len;
+}
+
+static DEVICE_ATTR_WO(mem_claim);
+
 static struct attribute *panthor_attrs[] = {
 	&dev_attr_profiling.attr,
 	&dev_attr_mem_reclaim.attr,
+	&dev_attr_mem_claim.attr,
 	NULL,
 };
 
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index e185787f5657..7130ba4a24da 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -3232,6 +3232,31 @@ void panthor_mmu_force_reclaim(struct panthor_file *pfile)
 		freed, freed_sz, nr_to_scan, remaining);
 }
 
+/**
+ * panthor_mmu_force_claim - Swap in all VMs associated with a file
+ * @pfile: pointer to the &struct panthor_file whose memory to swap in
+ *
+ * Attempt to get all GPU memory of @pfile swapped back in.
+ */
+void panthor_mmu_force_claim(struct panthor_file *pfile)
+{
+	struct panthor_vm *vm;
+	unsigned long i;
+	int ret;
+
+	xa_for_each(&pfile->vms->xa, i, vm) {
+		struct dma_resv *resv = drm_gpuvm_resv(&vm->base);
+
+		dma_resv_lock(resv, NULL);
+		ret = drm_gpuvm_validate(&vm->base, NULL);
+		if (ret)
+			drm_dbg(&vm->ptdev->base, "drm_gpuvm_validate failed: %pe\n",
+				ERR_PTR(ret));
+
+		dma_resv_unlock(resv);
+	}
+}
+
 /**
  * panthor_mmu_unplug() - Unplug the MMU logic
  * @ptdev: Device.
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.h b/drivers/gpu/drm/panthor/panthor_mmu.h
index 34adca4b4e95..460f83eb22a9 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.h
+++ b/drivers/gpu/drm/panthor/panthor_mmu.h
@@ -25,6 +25,7 @@ void panthor_mmu_post_reset(struct panthor_device *ptdev);
 void panthor_mmu_suspend(struct panthor_device *ptdev);
 void panthor_mmu_resume(struct panthor_device *ptdev);
 void panthor_mmu_force_reclaim(struct panthor_file *pfile);
+void panthor_mmu_force_claim(struct panthor_file *pfile);
 
 int panthor_vm_map_bo_range(struct panthor_vm *vm, struct panthor_gem_object *bo,
 			    u64 offset, u64 size, u64 va, u32 flags);

-- 
2.54.0


