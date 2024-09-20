Return-Path: <linux-media+bounces-18427-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB5697DAE0
	for <lists+linux-media@lfdr.de>; Sat, 21 Sep 2024 01:46:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 212C41F22512
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2024 23:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91CE318E025;
	Fri, 20 Sep 2024 23:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="V9Sy7vz/"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54749824A3;
	Fri, 20 Sep 2024 23:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726875946; cv=pass; b=Vkm5XLeUjx8rRwj2HN9nKlq8J8SvJlsZBww3yNrXxJ5molLX2fElXD5ripV8sioLvQiTr3Ib2XqRNetInF9DA+2Z5EuAA/D2mqcGgrGh0NNSRKlf6qjkb9efyeHejowp+9A1WmzGzmkX4tC5S/sedc/IE0XCUhCx2agaDWfw7vI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726875946; c=relaxed/simple;
	bh=asAKIMloSf1nvWG/eY0Vpe2S7Uh/A8aA1LS8hR1uMGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=utdbrUAs9Dt461Fctqf9iSkf7XSO/JSinJe5SWy6dlH+DUbwSJnDToI+wCSnhfMG6/ggxKDz5WlGhaaAS6fWkUVMBa/6hPNxLjQXtYPq6oJ5VFdLCxsf8FFNTpbXFPW8HgL88D41zqbdXxTnvBcpSCMlmQUf5U0YXnaguEKiNbo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=V9Sy7vz/; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1726875915; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=e1/dIbEpuSrXisdOEYATHgPvOB2njN/mAyc4hX/e2Cd9hE+CoqRmuwCTRlRGdB0HGlqMW2qfFQmTFu8UIPwhDJfVRd/+i8nkdKfiqv7OZPrbGyc+9zT6wa0tNDgRkNC+A2Oh+zr8DCIh5X44mFiNOh5D+ubrGnqHeNWmj2gYcCY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1726875915; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8Zx1uYvQJHEfMq1P3R7kwkjfLptnJ4BSs6hKaoa5xIA=; 
	b=nhMXCZPOd5oZw7JVkE9hkmImcDxqUtuapi+R2y4rfcnuID28KGcxuSTgDiG0aJBWehu3K0Odj9PVKse5Xg1efUwfJdxgnL1u09p1mIVwkoCfeyQuxOVNTadh/cHmY3Brl034HZCfqkC9b2VjZmucbv3XOVscEA5aojY7ykaUBjY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1726875915;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=8Zx1uYvQJHEfMq1P3R7kwkjfLptnJ4BSs6hKaoa5xIA=;
	b=V9Sy7vz/cA+J6VE1GZ8zZytHWoJDFtsQSojMrFXUIE32mR4TtGZ8LzFdMXYt4e1W
	lcEshI1TSqmkeSwREGWoDXU1fsW4xdElqLZI4fsbdi6aN7FntA5DVgTqOdKm4jYYwYf
	Cv1VHZ2eQVNSr8iKO0tlk7fvosov+AnIp9Xbh27o=
Received: by mx.zohomail.com with SMTPS id 1726875913122877.4178254379121;
	Fri, 20 Sep 2024 16:45:13 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= Boris Brezillon <"adrian.larumbe@collabora.comboris.brezillon"@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: kernel@collabora.com,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH v7 5/5] drm/panthor: add sysfs knob for enabling job profiling
Date: Sat, 21 Sep 2024 00:43:44 +0100
Message-ID: <20240920234436.207563-6-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240920234436.207563-1-adrian.larumbe@collabora.com>
References: <20240920234436.207563-1-adrian.larumbe@collabora.com>
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


