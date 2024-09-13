Return-Path: <linux-media+bounces-18255-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1D3978070
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 14:51:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 982771C21BC5
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 12:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0417E1DA61D;
	Fri, 13 Sep 2024 12:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="SISPdPx5"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A511DB95B;
	Fri, 13 Sep 2024 12:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726231785; cv=pass; b=l24tbfnf8RZICt83/oNgSk+oD7uLf8E34rluNhAoaBDwqWUrxQqE7kfdvicMQMiXsrvZScmNSYCXZMByFYqEGvSOL2IJ3jI3DrUaucOVIAeIyfn7CWrWTNFVB9daR5XiiotM1rahn9WDQ7ZNYrYU9256YN4OKzaFKrzOSKITOr4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726231785; c=relaxed/simple;
	bh=tIFpVNDyc21xlXr9AysvdU3FO0rHAQ10Nyj/l2kixHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NmMAiChpQSCKwOq3nnOWPcMAiTUELMZcYalhCYFjF4VeWuAFKveb/3DpcIbC5G2+PIbsRCDS5OZnyWj9TuFQ7r0ENWoStwJav33IoeIPePLDWx7JoXYE19isw6fZM6MuaDuZE2XyFhVH6ZjH3MOK2HoyKrmTfL8XBFsHxX1ek5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=SISPdPx5; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1726231763; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MFRy6oPt60THSxZqoXkpgQIt0kzTke7b3KapYqJcJ7Rt+Hkmi/nfNfdqeA5fcp2YOPXA8FAoC3kEvSBcz4VYXqzq1x7yY68TVe/uxSUOcR0CDbK9ijuPEOiZqnTMpxcgliJOuShMP300IaB9yjfR7+/Y57hQ5htcVaEyj2BSXfM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1726231763; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=h+CEnwN7RG4Q8rPu3tiFv71mEVaf/Ddp1giVyFfwYDU=; 
	b=RaMj6IphDftaehrPqU6HarBI62+NOfC8iyxujnCA92W4dmMq+wIsDdA84Z6p7NbrAiinZzRUMM8SLoYMnSrd6/ZY/PgI43Hx2peykxiB9O6EWsssqQ0MXtQfo6E/1UxwTB2UWyEuyVW4SoSTp+4D0uqVZiOp2+IdM/xqpVPNkaE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1726231763;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=h+CEnwN7RG4Q8rPu3tiFv71mEVaf/Ddp1giVyFfwYDU=;
	b=SISPdPx5iWHJHCWGyRBsHODTQCDKS25EsBynY8d+eQ9RuzQ/J/rlOLyqX9vgJP/s
	h+pHNXOrBSN41LHH0VY7NanIiO2MLBorhRKUXEmw1oRhWAycbD/U8cQtJB+CKLX2+PT
	DUlupkYX4RX0r/L5UavtQOlS2nonfGrA1uThd8yU=
Received: by mx.zohomail.com with SMTPS id 17262317623101004.3058460531499;
	Fri, 13 Sep 2024 05:49:22 -0700 (PDT)
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
Subject: [PATCH v6 4/5] drm/panthor: enable fdinfo for memory stats
Date: Fri, 13 Sep 2024 13:42:12 +0100
Message-ID: <20240913124857.389630-5-adrian.larumbe@collabora.com>
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

Implement drm object's status callback.

Also, we consider a PRIME imported BO to be resident if its matching
dma_buf has an open attachment, which means its backing storage had already
been allocated.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_gem.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index 38f560864879..c60b599665d8 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -145,6 +145,17 @@ panthor_gem_prime_export(struct drm_gem_object *obj, int flags)
 	return drm_gem_prime_export(obj, flags);
 }
 
+static enum drm_gem_object_status panthor_gem_status(struct drm_gem_object *obj)
+{
+	struct panthor_gem_object *bo = to_panthor_bo(obj);
+	enum drm_gem_object_status res = 0;
+
+	if (bo->base.base.import_attach || bo->base.pages)
+		res |= DRM_GEM_OBJECT_RESIDENT;
+
+	return res;
+}
+
 static const struct drm_gem_object_funcs panthor_gem_funcs = {
 	.free = panthor_gem_free_object,
 	.print_info = drm_gem_shmem_object_print_info,
@@ -154,6 +165,7 @@ static const struct drm_gem_object_funcs panthor_gem_funcs = {
 	.vmap = drm_gem_shmem_object_vmap,
 	.vunmap = drm_gem_shmem_object_vunmap,
 	.mmap = panthor_gem_mmap,
+	.status = panthor_gem_status,
 	.export = panthor_gem_prime_export,
 	.vm_ops = &drm_gem_shmem_vm_ops,
 };
-- 
2.46.0


