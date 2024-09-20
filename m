Return-Path: <linux-media+bounces-18429-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D945F97DAE4
	for <lists+linux-media@lfdr.de>; Sat, 21 Sep 2024 01:46:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A041B28483E
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2024 23:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E04918DF66;
	Fri, 20 Sep 2024 23:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="ffIKs4bh"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0613918E058;
	Fri, 20 Sep 2024 23:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726875949; cv=pass; b=nVaHOGfA8A272QVKxpzX/s5HBpL1tLwOehsnaCL1L+l7+K16RDBAVnLCgGjowXsT6A0+AyBDZ4HBvFnpv1IiB08dN7g6/3wA+ru+AZPBZnX4tQx26IwIgx2Asf+is2Q2dYw1x3hY/x9fg6oUvmUqPyBWHkueSZDYkhPRJheTE68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726875949; c=relaxed/simple;
	bh=tIFpVNDyc21xlXr9AysvdU3FO0rHAQ10Nyj/l2kixHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O4jTLXKdec9lPOdikfc9PJFkbzQP1FGBxA83OThjRa5bwes5omwKQgi3rLFTPn9Dr4kn2oCazuSjCgPvxYpgVa8U4vFNQbEPCyNI59Mb1AJ9Zxc+WqJcgQnre6IEW9wNT+rGtUrwCiNRSOMEwpB2ZCf2Oq/2Wicf/9e/11JOZVE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=ffIKs4bh; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1726875911; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dePRqgU8TFCq66r00PgPqQwV9t2v/GWcjcZJKgDDFPMedvCQuzATRz5PdsfPkD9mT/qA0S+As5NsBzkY7FEK1iiEYXlf02ihvholTEqd4t/m9GN6j3TqJoYpHFO3JhTuiDDPXW9aDp8NIQSZ2SMQ2bmlUoBiAXeeVOJQEcpZoEA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1726875911; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=h+CEnwN7RG4Q8rPu3tiFv71mEVaf/Ddp1giVyFfwYDU=; 
	b=OTzDQ5/36HNmpap/917MXM57/6oerrwY7Bk9cwBn0WoxnvmDuYJAbpO66Y4Pr9iq0098776bON3Cl0BqvCScZwLQcRw+Fu8HIMl2SSeuV2GFn4SDflxDFiHvUok16wsbKCqS8R+yN3RGkYl9241SuzUbFjR0QXogbFe/WYBuDAM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1726875911;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=h+CEnwN7RG4Q8rPu3tiFv71mEVaf/Ddp1giVyFfwYDU=;
	b=ffIKs4bh/glu1ixk3vdqGBc3zQ3UX/zZ/FuBLOZm1ZQsDmzaekCt9B56BYQ34hLW
	lTz5Li9jwLXwvorak6+4aXmp3a4NaQKFjUotIqkmRSxoXscYAfGEGQefRMoRbhGoM8r
	m2e0k6byGC55kgCfveNEJ9iq5NORrlkq4qQ2xdAs=
Received: by mx.zohomail.com with SMTPS id 1726875910098460.9540402794174;
	Fri, 20 Sep 2024 16:45:10 -0700 (PDT)
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
	linaro-mm-sig@lists.linaro.org,
	Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v7 4/5] drm/panthor: enable fdinfo for memory stats
Date: Sat, 21 Sep 2024 00:43:43 +0100
Message-ID: <20240920234436.207563-5-adrian.larumbe@collabora.com>
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


