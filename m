Return-Path: <linux-media+bounces-4072-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A4540838B26
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 10:57:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1946BB23815
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 09:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 075A45C8F0;
	Tue, 23 Jan 2024 09:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T+c23XJB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A70F5C5F9;
	Tue, 23 Jan 2024 09:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706003821; cv=none; b=djlG4jdTizhM4Jve8gNYXEgxtH3M6uwkpsnc2/L3IVR/Gr7BUatc+ekGMNduvbPU+trZliLpBpLqLmWqA/gyWpRbTqtvtLJI0+zxT5hlfdqt6g0Bt7QVTkSbZHO6+doCCCuTkI1sa+b66H+TemepaE/7ePdg2SyJKaLCKhqNLIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706003821; c=relaxed/simple;
	bh=CUVRmUN8rHmV/GhBk7CJw/CzWN3mLROm6prQMswupno=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y/Xyx4lIa4da1SqreKnTIEw2IgkDDZLbjYVujIyiIkrMmw7xBaxObZN+Wk0iAA9xWqmKb/EkV6KxZgrarvjz8Wo/Qg1mVqlGjF5WvVSTGfC71DTgG11QAu076GZtEMmngHs5j+tBq5WmgdyW4ju9XaxCo7068flz/IjWgAgat8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T+c23XJB; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706003819; x=1737539819;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CUVRmUN8rHmV/GhBk7CJw/CzWN3mLROm6prQMswupno=;
  b=T+c23XJBLJo+kEreMZWPupoUZnh41bga8VXsYJn6yg6D1unK8wdpauZ7
   Hj5RLaF/+dvPr5+rT+V5hbniXCWNDoAUYNYRm1BxJwsW0OvUA4gZukAUp
   ksYpmRhhoEuMtuXf7uGHPZ0woOkiszRUhGWeOf8ILyYuhOwL/MCeXvbX0
   UzQl9iqk2HnXsWwiVlD50BDo8pYMCjbD6EVw3Wnfj0l/P33XLDP6y3b8G
   WOBGWdyUIhXhBjyncR+6cPnUDAYT0eWSr53HwSyZ4huM72mAPd+HsVaJx
   tHlYKwszrX+anpQcOZ9p4MN5GuWXT8Om9gTmAjK+qHGKQcPefwYQgVi1p
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="365676"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; 
   d="scan'208";a="365676"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 01:56:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; 
   d="scan'208";a="27962090"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 01:56:50 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A58D91202B6;
	Tue, 23 Jan 2024 11:56:45 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-pm@vger.kernel.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	laurent.pinchart@ideasonboard.com,
	Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH v4 1/3] pm: runtime: Simplify pm_runtime_get_if_active() usage
Date: Tue, 23 Jan 2024 11:56:42 +0200
Message-Id: <20240123095642.97303-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240123095642.97303-1-sakari.ailus@linux.intel.com>
References: <20240123095642.97303-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are two ways to opportunistically increment a device's runtime PM
usage count, calling either pm_runtime_get_if_active() or
pm_runtime_get_if_in_use(). The former has an argument to tell whether to
ignore the usage count or not, and the latter simply calls the former with
ign_usage_count set to false. The other users that want to ignore the
usage_count will have to explitly set that argument to true which is a bit
cumbersome.

To make this function more practical to use, remove the ign_usage_count
argument from the function. The main implementation is renamed as
pm_runtime_get_conditional().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Alex Elder <elder@linaro.org> # drivers/net/ipa/ipa_smp2p.c
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Takashi Iwai <tiwai@suse.de> # sound/
Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com> # drivers/accel/ivpu/
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com> # drivers/gpu/drm/i915/
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 Documentation/power/runtime_pm.rst      |  5 ++--
 drivers/accel/ivpu/ivpu_pm.c            |  2 +-
 drivers/base/power/runtime.c            |  6 ++---
 drivers/gpu/drm/i915/intel_runtime_pm.c |  2 +-
 drivers/gpu/drm/xe/xe_pm.c              |  2 +-
 drivers/media/i2c/ccs/ccs-core.c        |  2 +-
 drivers/media/i2c/ov64a40.c             |  2 +-
 drivers/media/i2c/thp7312.c             |  2 +-
 drivers/net/ipa/ipa_smp2p.c             |  2 +-
 drivers/pci/pci.c                       |  2 +-
 include/linux/pm_runtime.h              | 32 +++++++++++++++++++++----
 sound/hda/hdac_device.c                 |  2 +-
 12 files changed, 41 insertions(+), 20 deletions(-)

diff --git a/Documentation/power/runtime_pm.rst b/Documentation/power/runtime_pm.rst
index 65b86e487afe..da99379071a4 100644
--- a/Documentation/power/runtime_pm.rst
+++ b/Documentation/power/runtime_pm.rst
@@ -396,10 +396,9 @@ drivers/base/power/runtime.c and include/linux/pm_runtime.h:
       nonzero, increment the counter and return 1; otherwise return 0 without
       changing the counter
 
-  `int pm_runtime_get_if_active(struct device *dev, bool ign_usage_count);`
+  `int pm_runtime_get_if_active(struct device *dev);`
     - return -EINVAL if 'power.disable_depth' is nonzero; otherwise, if the
-      runtime PM status is RPM_ACTIVE, and either ign_usage_count is true
-      or the device's usage_count is non-zero, increment the counter and
+      runtime PM status is RPM_ACTIVE, increment the counter and
       return 1; otherwise return 0 without changing the counter
 
   `void pm_runtime_put_noidle(struct device *dev);`
diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
index 0af8864cb3b5..c6d93c7a1c58 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -292,7 +292,7 @@ int ivpu_rpm_get_if_active(struct ivpu_device *vdev)
 {
 	int ret;
 
-	ret = pm_runtime_get_if_active(vdev->drm.dev, false);
+	ret = pm_runtime_get_if_in_use(vdev->drm.dev);
 	drm_WARN_ON(&vdev->drm, ret < 0);
 
 	return ret;
diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
index 05793c9fbb84..83e0cd2a19e7 100644
--- a/drivers/base/power/runtime.c
+++ b/drivers/base/power/runtime.c
@@ -1176,7 +1176,7 @@ int __pm_runtime_resume(struct device *dev, int rpmflags)
 EXPORT_SYMBOL_GPL(__pm_runtime_resume);
 
 /**
- * pm_runtime_get_if_active - Conditionally bump up device usage counter.
+ * pm_runtime_get_conditional - Conditionally bump up device usage counter.
  * @dev: Device to handle.
  * @ign_usage_count: Whether or not to look at the current usage counter value.
  *
@@ -1197,7 +1197,7 @@ EXPORT_SYMBOL_GPL(__pm_runtime_resume);
  * The caller is responsible for decrementing the runtime PM usage counter of
  * @dev after this function has returned a positive value for it.
  */
-int pm_runtime_get_if_active(struct device *dev, bool ign_usage_count)
+int pm_runtime_get_conditional(struct device *dev, bool ign_usage_count)
 {
 	unsigned long flags;
 	int retval;
@@ -1218,7 +1218,7 @@ int pm_runtime_get_if_active(struct device *dev, bool ign_usage_count)
 
 	return retval;
 }
-EXPORT_SYMBOL_GPL(pm_runtime_get_if_active);
+EXPORT_SYMBOL_GPL(pm_runtime_get_conditional);
 
 /**
  * __pm_runtime_set_status - Set runtime PM status of a device.
diff --git a/drivers/gpu/drm/i915/intel_runtime_pm.c b/drivers/gpu/drm/i915/intel_runtime_pm.c
index 860b51b56a92..b5f8abd2a22b 100644
--- a/drivers/gpu/drm/i915/intel_runtime_pm.c
+++ b/drivers/gpu/drm/i915/intel_runtime_pm.c
@@ -246,7 +246,7 @@ static intel_wakeref_t __intel_runtime_pm_get_if_active(struct intel_runtime_pm
 		 * function, since the power state is undefined. This applies
 		 * atm to the late/early system suspend/resume handlers.
 		 */
-		if (pm_runtime_get_if_active(rpm->kdev, ignore_usecount) <= 0)
+		if (pm_runtime_get_conditional(rpm->kdev, ignore_usecount) <= 0)
 			return 0;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index b429c2876a76..dd110058bf74 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -330,7 +330,7 @@ int xe_pm_runtime_put(struct xe_device *xe)
 
 int xe_pm_runtime_get_if_active(struct xe_device *xe)
 {
-	return pm_runtime_get_if_active(xe->drm.dev, true);
+	return pm_runtime_get_if_active(xe->drm.dev);
 }
 
 void xe_pm_assert_unbounded_bridge(struct xe_device *xe)
diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index e21287d50c15..e1ae0f9fad43 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -674,7 +674,7 @@ static int ccs_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	}
 
-	pm_status = pm_runtime_get_if_active(&client->dev, true);
+	pm_status = pm_runtime_get_if_active(&client->dev);
 	if (!pm_status)
 		return 0;
 
diff --git a/drivers/media/i2c/ov64a40.c b/drivers/media/i2c/ov64a40.c
index 4fba4c2cb064..541bf74581d2 100644
--- a/drivers/media/i2c/ov64a40.c
+++ b/drivers/media/i2c/ov64a40.c
@@ -3287,7 +3287,7 @@ static int ov64a40_set_ctrl(struct v4l2_ctrl *ctrl)
 					 exp_max, 1, exp_val);
 	}
 
-	pm_status = pm_runtime_get_if_active(ov64a40->dev, true);
+	pm_status = pm_runtime_get_if_active(ov64a40->dev);
 	if (!pm_status)
 		return 0;
 
diff --git a/drivers/media/i2c/thp7312.c b/drivers/media/i2c/thp7312.c
index 2806887514dc..19bd923a7315 100644
--- a/drivers/media/i2c/thp7312.c
+++ b/drivers/media/i2c/thp7312.c
@@ -1052,7 +1052,7 @@ static int thp7312_s_ctrl(struct v4l2_ctrl *ctrl)
 	if (ctrl->flags & V4L2_CTRL_FLAG_INACTIVE)
 		return -EINVAL;
 
-	if (!pm_runtime_get_if_active(thp7312->dev, true))
+	if (!pm_runtime_get_if_active(thp7312->dev))
 		return 0;
 
 	switch (ctrl->id) {
diff --git a/drivers/net/ipa/ipa_smp2p.c b/drivers/net/ipa/ipa_smp2p.c
index 5620dc271fac..cbf3d4761ce3 100644
--- a/drivers/net/ipa/ipa_smp2p.c
+++ b/drivers/net/ipa/ipa_smp2p.c
@@ -92,7 +92,7 @@ static void ipa_smp2p_notify(struct ipa_smp2p *smp2p)
 		return;
 
 	dev = &smp2p->ipa->pdev->dev;
-	smp2p->power_on = pm_runtime_get_if_active(dev, true) > 0;
+	smp2p->power_on = pm_runtime_get_if_active(dev) > 0;
 
 	/* Signal whether the IPA power is enabled */
 	mask = BIT(smp2p->enabled_bit);
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index d8f11a078924..f8293ae71389 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -2510,7 +2510,7 @@ static void pci_pme_list_scan(struct work_struct *work)
 			 * If the device is in a low power state it
 			 * should not be polled either.
 			 */
-			pm_status = pm_runtime_get_if_active(dev, true);
+			pm_status = pm_runtime_get_if_active(dev);
 			if (!pm_status)
 				continue;
 
diff --git a/include/linux/pm_runtime.h b/include/linux/pm_runtime.h
index 7c9b35448563..a212b3008ade 100644
--- a/include/linux/pm_runtime.h
+++ b/include/linux/pm_runtime.h
@@ -72,7 +72,8 @@ extern int pm_runtime_force_resume(struct device *dev);
 extern int __pm_runtime_idle(struct device *dev, int rpmflags);
 extern int __pm_runtime_suspend(struct device *dev, int rpmflags);
 extern int __pm_runtime_resume(struct device *dev, int rpmflags);
-extern int pm_runtime_get_if_active(struct device *dev, bool ign_usage_count);
+extern int pm_runtime_get_conditional(struct device *dev,
+					bool ign_usage_count);
 extern int pm_schedule_suspend(struct device *dev, unsigned int delay);
 extern int __pm_runtime_set_status(struct device *dev, unsigned int status);
 extern int pm_runtime_barrier(struct device *dev);
@@ -94,16 +95,33 @@ extern void pm_runtime_release_supplier(struct device_link *link);
 
 extern int devm_pm_runtime_enable(struct device *dev);
 
+/**
+ * pm_runtime_get_if_active - Bump up runtime PM usage counter if the device is
+ *			      in active state
+ * @dev: Target device.
+ *
+ * Increment the runtime PM usage counter of @dev if its runtime PM status is
+ * %RPM_ACTIVE, in which case it returns 1. If the device is in a different
+ * state, 0 is returned. -EINVAL is returned if runtime PM is disabled for the
+ * device.
+ */
+static inline int pm_runtime_get_if_active(struct device *dev)
+{
+	return pm_runtime_get_conditional(dev, true);
+}
+
 /**
  * pm_runtime_get_if_in_use - Conditionally bump up runtime PM usage counter.
  * @dev: Target device.
  *
  * Increment the runtime PM usage counter of @dev if its runtime PM status is
- * %RPM_ACTIVE and its runtime PM usage counter is greater than 0.
+ * %RPM_ACTIVE and its runtime PM usage counter is greater than 0, in which case
+ * it returns 1. If the device is in a different state or its usage_count is 0,
+ * 0 is returned. -EINVAL is returned if runtime PM is disabled for the device.
  */
 static inline int pm_runtime_get_if_in_use(struct device *dev)
 {
-	return pm_runtime_get_if_active(dev, false);
+	return pm_runtime_get_conditional(dev, false);
 }
 
 /**
@@ -275,8 +293,12 @@ static inline int pm_runtime_get_if_in_use(struct device *dev)
 {
 	return -EINVAL;
 }
-static inline int pm_runtime_get_if_active(struct device *dev,
-					   bool ign_usage_count)
+static inline int pm_runtime_get_if_active(struct device *dev)
+{
+	return -EINVAL;
+}
+static inline int pm_runtime_get_conditional(struct device *dev,
+					     bool ign_usage_count)
 {
 	return -EINVAL;
 }
diff --git a/sound/hda/hdac_device.c b/sound/hda/hdac_device.c
index 7f7b67fe1b65..068c16e52dff 100644
--- a/sound/hda/hdac_device.c
+++ b/sound/hda/hdac_device.c
@@ -612,7 +612,7 @@ EXPORT_SYMBOL_GPL(snd_hdac_power_up_pm);
 int snd_hdac_keep_power_up(struct hdac_device *codec)
 {
 	if (!atomic_inc_not_zero(&codec->in_pm)) {
-		int ret = pm_runtime_get_if_active(&codec->dev, true);
+		int ret = pm_runtime_get_if_active(&codec->dev);
 		if (!ret)
 			return -1;
 		if (ret < 0)
-- 
2.39.2


