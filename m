Return-Path: <linux-media+bounces-18487-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BCC983A1E
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 01:11:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52D2B1F22DC5
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 23:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C35FF13D502;
	Mon, 23 Sep 2024 23:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="btse7QQC"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F05513BC02;
	Mon, 23 Sep 2024 23:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727132997; cv=pass; b=N9LJt41gc79N69yZgvYxRwuerPEHSNTBqdHuZxIjO/Htvhpdg/Sf8raj6ErL9OcD6vRoREl/ISTygvArwXLc1fuaNIBvSxv3xqYkPZmnJXXA2jHAbSc3JtVFXwe4AP3DawtwEu7nRnJlDN9OoWcz2YA1jsdG/ulMJLIEHJElMVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727132997; c=relaxed/simple;
	bh=csqcEbRGxR+qbScsEFYF6jvoIBHOp4pYW0X1A25C8P0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IvEX7X36kPCUWbBfidGAKwIIfdu6U3A1eJYfup7wIqd6FliJZ6i5zAzSIh7ArQiMbxswB8cILkxQu+GFo4PfskOV62Q8mniTQHKSo7H7V9bLxBz7azbV9rT/ANl4fu9tkRsFnIVN1SWuA++s22PEufPr/0N6uNI3IGyDxyrnP3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=btse7QQC; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1727132980; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GS+iR1SkcaSCFH+9NuC03xUtGa/vlMrUCTGTbCBzNh1TKvT1r4llM2GHOPkGOiP62joRjepqSJyg6g7VvfZpU3MU6TL6ECizQY1gq/Pqci8Gt0OqV1Od4+Tkq6GU6dtg6URONF+ddmcm9VoFVwAgjTF+9bSIbbGlMdTdp+FtvC8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1727132980; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=oRKUfF1LHU6wEwjP+rPHYewt32qRFId+8gsIMVQh6zA=; 
	b=FyseXmHISSZM2xblJgSPmOsLDBhbMfwnqdqeLrb9TWq7nE2YdxYSANGtM6H5+o7KO3IRb9QGMI2w1wQQT+RznGLvE8hkpnHha1CIaJbAOqjg4Lcj1x9SBPYLpEk7ZkvWvv1ThnoJX9sabiB7MpmVZxJNpaQ0xFQm1nvbyGj9hnY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1727132980;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=oRKUfF1LHU6wEwjP+rPHYewt32qRFId+8gsIMVQh6zA=;
	b=btse7QQCPZoudvtVmRfARHJt4ScZa8FfWwglPK6VB5y/mz+J7RZqeo7os/eDLZlR
	DrqNedRa6Nd5FtDGOhaFDv7XChyPDJuEhbT36zD8RBXiqs/VdZLnUpUsMmp5aeFIlpm
	n/ZwsvPxaG2NpK6wT+COIMAGiqeAI8UsUJcIOax4=
Received: by mx.zohomail.com with SMTPS id 1727132979766466.7588678173347;
	Mon, 23 Sep 2024 16:09:39 -0700 (PDT)
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
Subject: [PATCH v8 5/5] drm/panthor: add sysfs knob for enabling job profiling
Date: Tue, 24 Sep 2024 00:06:25 +0100
Message-ID: <20240923230912.2207320-6-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240923230912.2207320-1-adrian.larumbe@collabora.com>
References: <20240923230912.2207320-1-adrian.larumbe@collabora.com>
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
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
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


