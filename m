Return-Path: <linux-media+bounces-18256-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DB1978073
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 14:51:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 53994B25266
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 12:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 327DC1DC05C;
	Fri, 13 Sep 2024 12:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="EduZNAa1"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101431DA619;
	Fri, 13 Sep 2024 12:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726231786; cv=pass; b=n+BUv74WBpIAxmm0Oh2flCKUKUMb5KfkBb6/oaFoSEGuUZNLg607l9D5gmTI7/XpZpobLZqpYQ7pjN5Ehk7Jp/3EHF/yXP/laQ3966CJw4PVB8OFaslF8sUwj0lRjnVUZIk6RY6ysAhXRELw78fBlUMn7p0Uv+j+TtSoKM3iKuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726231786; c=relaxed/simple;
	bh=asAKIMloSf1nvWG/eY0Vpe2S7Uh/A8aA1LS8hR1uMGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g/ky5sjMvJaHJMgwyjlt244gYDs9jvI0/UJ1p0UW189Z20EUsm1VuFFzLbBaBo0GXVO51EommOfjeUmd4g1CszGmOihuUYoZdCwcPz6DH2lc0z9GDWqP3COXzRnXPGUKA8M0a+aF/P5TW8UhDhoEYLHgVPWXuPA0SGc16N3aO1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=EduZNAa1; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1726231767; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kX8xnFyIF0YwUcO1em0NFK76ybiqVlSfq6wBncXwLViEVzddfvh+scoFQYfnlOmS9KPhojaML/GfM/v3Mmg7T+bs6oDb13L75iQ9K/OLgxgijIU4ZW89LgRdT4KlKmWq7kvo+p3D4Tyf7C58AzjFtBXlCeuWEbklBCNwHT40yIQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1726231767; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8Zx1uYvQJHEfMq1P3R7kwkjfLptnJ4BSs6hKaoa5xIA=; 
	b=b4NrpurorTXkOnAebVNnocdMh8ecd/7wtksFt0UEv8D53gh84fePXrVv95/WF35r5kNSj49fGjNodD7bqoNJBMAV2tfNMlxpUvI0VUuWkeimY1z/uMOcYvlvUSKQ2eEc7R1EM3StkXh0tJ46KgUZEuHL2Vf1TC9rpkWdtVt+YGw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1726231767;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=8Zx1uYvQJHEfMq1P3R7kwkjfLptnJ4BSs6hKaoa5xIA=;
	b=EduZNAa19+GxhbeGdsnhnoOhDdhTGxyuu/Su24xLLIFcOWCvo5MaoW27jBhIrMdp
	S/UueQmrPz6EILOoYrv+fX6RGJdOoPaT+mZIpe+qWCRjrcZGUMn5t6SU7I+HabUbEHq
	qSVVxpIkeALwu4WmzS26mUgURzvVZXD8erfpp2es=
Received: by mx.zohomail.com with SMTPS id 1726231765207404.5400860623354;
	Fri, 13 Sep 2024 05:49:25 -0700 (PDT)
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
Subject: [PATCH v6 5/5] drm/panthor: add sysfs knob for enabling job profiling
Date: Fri, 13 Sep 2024 13:42:13 +0100
Message-ID: <20240913124857.389630-6-adrian.larumbe@collabora.com>
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

This commit introduces a DRM device sysfs attribute that lets UM control
the job accounting status in the device. The knob variable had been brought
in as part of a previous commit, but now we're able to fix it manually.

As sysfs files are part of a driver's uAPI, describe its legitimate input
values and output format in a documentation file.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 .../testing/sysfs-driver-panthor-profiling    | 10 ++++
 Documentation/gpu/panthor.rst                 | 46 +++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_drv.c         | 39 ++++++++++++++++
 3 files changed, 95 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-panthor-profiling
 create mode 100644 Documentation/gpu/panthor.rst

diff --git a/Documentation/ABI/testing/sysfs-driver-panthor-profiling b/Documentation/ABI/testing/sysfs-driver-panthor-profiling
new file mode 100644
index 000000000000..af05fccedc15
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-panthor-profiling
@@ -0,0 +1,10 @@
+What:		/sys/bus/platform/drivers/panthor/.../profiling
+Date:		September 2024
+KernelVersion:	6.11.0
+Contact:	Adrian Larumbe <adrian.larumbe@collabora.com>
+Description:
+		Bitmask to enable drm fdinfo's job profiling measurements.
+		Valid values are:
+		0: Don't enable fdinfo job profiling sources.
+		1: Enable GPU cycle measurements for running jobs.
+		2: Enable GPU timestamp sampling for running jobs.
diff --git a/Documentation/gpu/panthor.rst b/Documentation/gpu/panthor.rst
new file mode 100644
index 000000000000..cbf5c4429a2d
--- /dev/null
+++ b/Documentation/gpu/panthor.rst
@@ -0,0 +1,46 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+=========================
+ drm/Panthor CSF driver
+=========================
+
+.. _panfrost-usage-stats:
+
+Panthor DRM client usage stats implementation
+==============================================
+
+The drm/Panthor driver implements the DRM client usage stats specification as
+documented in :ref:`drm-client-usage-stats`.
+
+Example of the output showing the implemented key value pairs and entirety of
+the currently possible format options:
+
+::
+     pos:    0
+     flags:  02400002
+     mnt_id: 29
+     ino:    491
+     drm-driver:     panthor
+     drm-client-id:  10
+     drm-engine-panthor:     111110952750 ns
+     drm-cycles-panthor:     94439687187
+     drm-maxfreq-panthor:    1000000000 Hz
+     drm-curfreq-panthor:    1000000000 Hz
+     drm-total-memory:       16480 KiB
+     drm-shared-memory:      0
+     drm-active-memory:      16200 KiB
+     drm-resident-memory:    16480 KiB
+     drm-purgeable-memory:   0
+
+Possible `drm-engine-` key names are: `panthor`.
+`drm-curfreq-` values convey the current operating frequency for that engine.
+
+Users must bear in mind that engine and cycle sampling are disabled by default,
+because of power saving concerns. `fdinfo` users and benchmark applications which
+query the fdinfo file must make sure to toggle the job profiling status of the
+driver by writing into the appropriate sysfs node::
+
+    echo <N> > /sys/bus/platform/drivers/panthor/[a-f0-9]*.gpu/profiling
+
+Where `N` is a bit mask where cycle and timestamp sampling are respectively
+enabled by the first and second bits.
diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 233b265c0819..6f47d9d1d86a 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1513,6 +1513,44 @@ static void panthor_remove(struct platform_device *pdev)
 	panthor_device_unplug(ptdev);
 }
 
+static ssize_t profiling_show(struct device *dev,
+			      struct device_attribute *attr,
+			      char *buf)
+{
+	struct panthor_device *ptdev = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%d\n", ptdev->profile_mask);
+}
+
+static ssize_t profiling_store(struct device *dev,
+			       struct device_attribute *attr,
+			       const char *buf, size_t len)
+{
+	struct panthor_device *ptdev = dev_get_drvdata(dev);
+	u32 value;
+	int err;
+
+	err = kstrtou32(buf, 0, &value);
+	if (err)
+		return err;
+
+	if ((value & ~PANTHOR_DEVICE_PROFILING_ALL) != 0)
+		return -EINVAL;
+
+	ptdev->profile_mask = value;
+
+	return len;
+}
+
+static DEVICE_ATTR_RW(profiling);
+
+static struct attribute *panthor_attrs[] = {
+	&dev_attr_profiling.attr,
+	NULL,
+};
+
+ATTRIBUTE_GROUPS(panthor);
+
 static const struct of_device_id dt_match[] = {
 	{ .compatible = "rockchip,rk3588-mali" },
 	{ .compatible = "arm,mali-valhall-csf" },
@@ -1532,6 +1570,7 @@ static struct platform_driver panthor_driver = {
 		.name = "panthor",
 		.pm = pm_ptr(&panthor_pm_ops),
 		.of_match_table = dt_match,
+		.dev_groups = panthor_groups,
 	},
 };
 
-- 
2.46.0


