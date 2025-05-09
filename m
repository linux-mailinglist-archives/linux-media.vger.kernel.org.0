Return-Path: <linux-media+bounces-32150-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AE3AB18C5
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 17:34:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2C2C189CC79
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 15:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6589622D4CE;
	Fri,  9 May 2025 15:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="gsz/VDaw"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D5F22E3FD
	for <linux-media@vger.kernel.org>; Fri,  9 May 2025 15:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746804865; cv=none; b=cpzh533UhgKJVzkIitSDSttx7QPzG88EekI44wGYXhZ62gTGrlof9/WEnXks/zNxfj4dswy5q+3cvcUuGGVc14eIxU03lUVhUiUL0KT/tEogASM8ZsUYNwVFSAh8j2+z5sJP1oinyQgfpNnsEaG4lzZKFSnZ/bvj1DnKa94cw28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746804865; c=relaxed/simple;
	bh=+b+5nPVleOWBxZEaZNNZLGaxOyj4PjjLKCo4euzIi6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R9MUFwNouiKz+to39jffMiGtlgVVIFKm6agjeD5BK2je5qq+NkLBnk1eA17229pBgXGki4K8TosQmF67THc2ogk0b5C6kzft41IlqM8cbvMOuaJPRC5oOBVvxpPJ4u480+Uyg0xDAcda0Zp9KTUqHigtI9j4L14yYEZnVzPoSgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=gsz/VDaw; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ObiI1Tsci1Wqsl/cJJndA3Qz3YuyNsUysn45CqaBFc0=; b=gsz/VDawIcGFhh9+4gvqZ2RTSC
	YybIagPa24ZKbNDSgRsietRRz7tn16pHpNx2EfKuK8upx//zn1ER0VTsmUPbsKyrJXYWOUI6orn0Q
	2Z5ySw0w6bAVVcUUcMWNSTOeqrZ9aTGrTVa8hceaspg4+tx05F7fARchcqCUk8OcXnejqIsO7IQDp
	hPgTtu6JzfBTJf51EejPXiWF25ZmrTjCxH2y9cG7WUhsHXL6GPSvzXBbLdPKmX/HsoEifMUNyJloj
	unIoLHb7zi27dMQIfRElvKUm0fk5Ac70AC4Hxzx0mwljZJFpNz5TtPhWxXs/pxkSgHZ1LExvro/wz
	13jeqohQ==;
Received: from [81.79.92.254] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uDPfM-005oFL-2z; Fri, 09 May 2025 17:34:12 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	amd-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [RFC v2 08/13] drm/amdgpu: Use dma-fence driver and timeline name helpers
Date: Fri,  9 May 2025 16:33:47 +0100
Message-ID: <20250509153352.7187-9-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250509153352.7187-1-tvrtko.ursulin@igalia.com>
References: <20250509153352.7187-1-tvrtko.ursulin@igalia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Access the dma-fence internals via the previously added helpers.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
index 11dd2e0f7979..8e5bf179a6c8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
@@ -33,7 +33,7 @@
 #define TRACE_INCLUDE_FILE amdgpu_trace
 
 #define AMDGPU_JOB_GET_TIMELINE_NAME(job) \
-	 job->base.s_fence->finished.ops->get_timeline_name(&job->base.s_fence->finished)
+	 dma_fence_timeline_name(&job->base.s_fence->finished)
 
 TRACE_EVENT(amdgpu_device_rreg,
 	    TP_PROTO(unsigned did, uint32_t reg, uint32_t value),
-- 
2.48.0


