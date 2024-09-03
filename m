Return-Path: <linux-media+bounces-17495-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA3A96A84C
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 22:27:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B45B41F248B6
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 20:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 659E71D5CFE;
	Tue,  3 Sep 2024 20:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="ZCSHzAWj"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3220D1D58BF;
	Tue,  3 Sep 2024 20:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725395184; cv=pass; b=QcWXT3TeRjr3MB34EY0d+FP5ptagIX9QUv7WQ93+NCc20MMMjCMtvNyGHEKzu1si+I4Ppwy5sWpub17UG6R1g0fQUloMCPPzHg06q0evtrScfAP/0NAVv+PTJQzPr0ybXdwP5TJw30QiMqjjFrhuBBzCSkEJQr2ZQOiiMFxdbIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725395184; c=relaxed/simple;
	bh=YdZ2DdOrTJDFkr8c/oJaKgykzTFrzwcLpFaAYmSUZzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AbQWpLzOr1ByqPf3HXz19IhCw9geR6EfMtTmpzLwpNxzQN8zLea/Sqt3lFdLJc4akiHbdmUNdOAg/KASYSLHursxD3GIq88FJM4X2uYCf5nITckKRcv8mPHopdoYyIEYVHWt0dkK7sbjTxtEUgQEqCAUjYcDITLRVCftKwu6ea8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=ZCSHzAWj; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Delivered-To: boris.brezillon@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1725395166; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=m1K9UV8esZGKz0vKWVafBmGl2luqEoWELrJEGlqEudisxAfCH4vOvdtheEy58ruAmfhQ9t4qIv4LV+r4qV/3cjlXoz7ZHcaE8Gk/wlnu0sdALgjnyy+IpVSVNT3y7f792h36eUvL5tBJ1CfbCGb/3di4rByLqJ2IA8FEMyNqGBM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725395166; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=S4H1TvHBmLqicNFvkbMgMBC/nubwCjLcKnTiqllabKQ=; 
	b=cLTr9OeDdr6uhrQkIHj3hoyJ5JtuwJkQsJZGDekRPEGA5t3HTDGMtRcUdNLCuExCfMaDL58NC/03Ry7hA0aqsxm86O7wuWKdwos+Eh15hr6QN1wBYItnBOqLVc/sxSrlX3QlUQPbLcJeXWIZYznwEXNgSMRDHFJxvWNoVSwEHsk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725395166;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=S4H1TvHBmLqicNFvkbMgMBC/nubwCjLcKnTiqllabKQ=;
	b=ZCSHzAWjzS1zMDIDhRxAxElB6sd+6LtjInAURASYoWEvzgyjqXmYm32dFq+47zy0
	KJyORlmIxNCxzcHrW5ODBjmr1vmNrKy7TL2gtiep/GrY9aoycwadfDqitoLHXE/9+4E
	UdJStkweJy9MO6mJBXlcMpETdrl+GzecaBNoGCY8=
Received: by mx.zohomail.com with SMTPS id 1725395165743108.55172235697557;
	Tue, 3 Sep 2024 13:26:05 -0700 (PDT)
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
Subject: [PATCH v5 4/4] drm/panthor: add sysfs knob for enabling job profiling
Date: Tue,  3 Sep 2024 21:25:38 +0100
Message-ID: <20240903202541.430225-5-adrian.larumbe@collabora.com>
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

This commit introduces a DRM device sysfs attribute that lets UM control
the job accounting status in the device. The knob variable had been brought
in as part of a previous commit, but now we're able to fix it manually.

As sysfs files are part of a driver's uAPI, describe its legitimate input
values and output format in a documentation file.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 Documentation/gpu/panthor.rst         | 46 +++++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_drv.c | 39 +++++++++++++++++++++++
 2 files changed, 85 insertions(+)
 create mode 100644 Documentation/gpu/panthor.rst

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
index e18838754963..26475db96c41 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1450,6 +1450,44 @@ static void panthor_remove(struct platform_device *pdev)
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
@@ -1469,6 +1507,7 @@ static struct platform_driver panthor_driver = {
 		.name = "panthor",
 		.pm = pm_ptr(&panthor_pm_ops),
 		.of_match_table = dt_match,
+		.dev_groups = panthor_groups,
 	},
 };
 
-- 
2.46.0


