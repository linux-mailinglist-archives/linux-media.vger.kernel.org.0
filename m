Return-Path: <linux-media+bounces-48703-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EE1CB8DA2
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 14:03:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A4D63099A28
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 13:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B63F218AA0;
	Fri, 12 Dec 2025 13:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rj6XKTLb"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFFD2877CB;
	Fri, 12 Dec 2025 13:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765544573; cv=none; b=o06jjcvHGzX0KQpE8OOwF87ivnVcIUXCWjIO77AX1aewxADDhmiR2vcqYjjdvZhciH9UkiDiWfk9FLImWbXVbWulQQDgX+V5a+gcr7qUTN0CLAhNWR7m75WPRvBs9gIXqpBKPoCrlbt+DsHHMX23YcYQQ9tQijT7feG373NixaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765544573; c=relaxed/simple;
	bh=YEBOz3WUfoKaWSqW4r05weDnBaMaH/OmIaDjtvIjbRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jv4/3e9ifoX4jbWWnjF/5CqfCbBk8y2trZbkvlmQlQbmDz6NopE2FRiF07gPuyXsSE+qucLEm0P6Qn9Z18LJHjONj+GfOrVmVsWsqRlOJGU9vxurHKdHAa/Pf/Qj2RVY4Tj72Orik9SZKQ89JL4ka/gpNiG4baw7UQN925Zttjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rj6XKTLb; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765544572; x=1797080572;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YEBOz3WUfoKaWSqW4r05weDnBaMaH/OmIaDjtvIjbRQ=;
  b=Rj6XKTLbbqaK8hEFDTWLzOm2b1RYXPz8zUrfiRxGIOMPiZTOVAOL4vp6
   Qx3vyJhTa2tyzYIj85n/WRPCfCavNCWFUd4+0m1Y/h7+519Sa7FmwK726
   N0ST4HQ/LRPPwGGx7ahJVoWRxkwRW03c4nWP69G0S3iQ7qYV70iPl92jq
   eeHUUuK70xvko/rRlzflOTK/8mwvlbYaOXzO058rp2t2LsZFnXzXfWPTx
   CP17FgVo993EHPY9SoQJrkhQPD/aYr3bIOIZRUNvkCfcqrLHnxKnyJIK2
   q3JcMZFWxvC6Pe7ItCdHcwLyFIrNFVxkk1Y0ldNonNV4ODgZe7LLS/YJC
   g==;
X-CSE-ConnectionGUID: F2yaIUjyQBC2/LZXrf7Ihg==
X-CSE-MsgGUID: t6azn/3nQP6AZpR7qvjHgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="66539068"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="66539068"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 05:02:51 -0800
X-CSE-ConnectionGUID: kzLuCUjFTyO0KEp7jDFCGg==
X-CSE-MsgGUID: eTWyjr/ARm+BUld+22sFWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="196839214"
Received: from pl-npu-pc-kwachow.igk.intel.com ([10.91.220.239])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 05:02:48 -0800
From: Karol Wachowski <karol.wachowski@linux.intel.com>
To: David.Francis@amd.com
Cc: felix.kuehling@amd.com,
	christian.koenig@amd.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	sumit.semwal@linaro.org,
	andrzej.kacprowski@linux.intel.com,
	maciej.falkowski@linux.intel.com,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	stable@vger.kernel.org,
	Karol Wachowski <karol.wachowski@linux.intel.com>
Subject: [PATCH] drm: Fix object leak in DRM_IOCTL_GEM_CHANGE_HANDLE
Date: Fri, 12 Dec 2025 14:02:38 +0100
Message-ID: <20251212130238.472833-1-karol.wachowski@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing drm_gem_object_put() call when drm_gem_object_lookup()
successfully returns an object. This fixes a GEM object reference
leak that can prevent driver modules from unloading when using
prime buffers.

Fixes: 53096728b891 ("drm: Add DRM prime interface to reassign GEM handle")
Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
---
 drivers/gpu/drm/drm_gem.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index ca1956608261..e150bc1ce65a 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1001,7 +1001,7 @@ int drm_gem_change_handle_ioctl(struct drm_device *dev, void *data,
 {
 	struct drm_gem_change_handle *args = data;
 	struct drm_gem_object *obj;
-	int ret;
+	int ret = 0;
 
 	if (!drm_core_check_feature(dev, DRIVER_GEM))
 		return -EOPNOTSUPP;
@@ -1011,7 +1011,7 @@ int drm_gem_change_handle_ioctl(struct drm_device *dev, void *data,
 		return -ENOENT;
 
 	if (args->handle == args->new_handle)
-		return 0;
+		goto out;
 
 	mutex_lock(&file_priv->prime.lock);
 
@@ -1043,6 +1043,8 @@ int drm_gem_change_handle_ioctl(struct drm_device *dev, void *data,
 
 out_unlock:
 	mutex_unlock(&file_priv->prime.lock);
+out:
+	drm_gem_object_put(obj);
 
 	return ret;
 }
-- 
2.43.0


