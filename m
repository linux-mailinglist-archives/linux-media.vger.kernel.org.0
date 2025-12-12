Return-Path: <linux-media+bounces-48705-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA9DCB8E3F
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 14:22:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2ED7308E165
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 13:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC12522E3E9;
	Fri, 12 Dec 2025 13:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oCP7H1vy"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F463221264;
	Fri, 12 Dec 2025 13:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765545672; cv=none; b=OZorhtW4IOE/V0XC/mAQpKPrL96XavSRMioZaEiQvGM5GvcZKbZN/8ke3iTAkYQ6tdFasgWb8XnCX/fytkTZIt8H6SdAiWJnZicYoIlCnO1cuNkHU7vgbYsoSGyIVmK7MBCZyCGWYzDZXKRCnX+sIhkxYwtb4D060tLp7Wyg6tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765545672; c=relaxed/simple;
	bh=Xw4J35AXVe0tIkMKb4FDDQucWVWj6fFu2dpxmn3jH6M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eNkbYcFrBGUmzJHvY4WbCWM3ZMFhCX4GXlfHXTDpqOsLfkgtfSOEKgF1OzlhSv2+ShUg6zDMafC4yNhny6OxOjXRlN+xbN5zbCYcWP6jpCRav03vHWWlbjjur17IKYzGSHdbJuUNArnS0sgBR4QZn4J1NfozBMWqgR3MiMu2ykU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oCP7H1vy; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765545670; x=1797081670;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Xw4J35AXVe0tIkMKb4FDDQucWVWj6fFu2dpxmn3jH6M=;
  b=oCP7H1vyCRD8Tt5hf5xM+gpsQJ2Dts+ThO3Qz/6XLSALWRMr4lwZ8Nmx
   DPmMyLkg6cdpelf4HCE+RA/3q0rK+wpUMJ0qP+EnbiQ1gxYHgJ/Ml7t6p
   FDYtcRk18GvOvSr19pIpCNaKRbf2MCxRwAR5pa47XfiiKcS5ILezPP6+2
   J/qGFlsEtkbumEbhoYGhCd4n/xepkMZvEdrjkLzvr/oOddYKn8tEhvo60
   fH39t2UDBfCg4tVEuzmq9a8ijjHuPNlGjqt8WYCRJuwt8RPhYYRYWUhLX
   ZB5uM7BL98e7PFYyT/hiIB+m9Hj32DVGB9ABAOR+1Pat4G5lvKpbnAzSi
   Q==;
X-CSE-ConnectionGUID: D2G7dM6FQ9e79R18Y+1uYw==
X-CSE-MsgGUID: 2ZE2+m3NSFSDXPX/PrXJNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67431198"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="67431198"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 05:21:10 -0800
X-CSE-ConnectionGUID: 1HmC4w25RVOQZLSEfMTe6A==
X-CSE-MsgGUID: gWX8bhMzTvedXw/eKlj1pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="196695487"
Received: from pl-npu-pc-kwachow.igk.intel.com ([10.91.220.239])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 05:21:06 -0800
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
Subject: [PATCH v2] drm: Fix object leak in DRM_IOCTL_GEM_CHANGE_HANDLE
Date: Fri, 12 Dec 2025 14:20:52 +0100
Message-ID: <20251212132052.474096-1-karol.wachowski@linux.intel.com>
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
Changes between v1 and v2:
 - move setting ret value under if branch as suggested in review
 - add Cc: stable 6.18+
---
 drivers/gpu/drm/drm_gem.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index ca1956608261..bcc08a6aebf8 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1010,8 +1010,10 @@ int drm_gem_change_handle_ioctl(struct drm_device *dev, void *data,
 	if (!obj)
 		return -ENOENT;
 
-	if (args->handle == args->new_handle)
-		return 0;
+	if (args->handle == args->new_handle) {
+		ret = 0;
+		goto out;
+	}
 
 	mutex_lock(&file_priv->prime.lock);
 
@@ -1043,6 +1045,8 @@ int drm_gem_change_handle_ioctl(struct drm_device *dev, void *data,
 
 out_unlock:
 	mutex_unlock(&file_priv->prime.lock);
+out:
+	drm_gem_object_put(obj);
 
 	return ret;
 }
-- 
2.43.0


