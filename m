Return-Path: <linux-media+bounces-32143-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC038AB18B1
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 17:34:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24D9D4E28C7
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 15:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AA0B22F762;
	Fri,  9 May 2025 15:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="qy+pr17r"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00E01F03D5
	for <linux-media@vger.kernel.org>; Fri,  9 May 2025 15:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746804863; cv=none; b=dR6bnVXMtP9MxyKTm4GFFgdCUNLNooa+5/DIj0i1o6WNuhP8E1w1Q+rSnXq1e0WwdgUd0ciRWg3BAJnt3xe+qGWeEvTdSrhIy5/LS4Fv0KWV6Nmn0W08IkN80w1/N2funHkSGbrMDHMAqCp++L05vj3dIx3ToZFb1SyiGCBfZjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746804863; c=relaxed/simple;
	bh=DWVAU0mU3Jgr05JWFoFNY8OV1KrKe4jWUhppVTzbbrA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VN+Hmy6ny63okWpum1jo+HUn4GVIk0qVv++2aoSwsqsI0isIoNiJqH2wwLR64yD+OyAKHjVXghw3+QtprtTspbHh89Y2/5YY7Z02os+O1lkVSuHtBPWGxaSpZ9MS5VcLW+utLlnq2EPlXMGjwnbUKjRfdwLSd3coeAAK0gg8Zf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=qy+pr17r; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=r8Pjg2msokWYcuhupUxz/k2tjiv/iKmS3Yjcj/950W0=; b=qy+pr17roTkKORBXq71WVY/uIa
	/J5NbEt2JQlr5+7KnNRvTsRciVSLTV+hsj2g9IduxKtvjI1VkWvgQUz4kw4JrKA71uT3DV+z8L7u3
	yKcoayoLIXSUewXs5ot+vi7rvUT35HgaEMYgw/xcocvy3UnzhDJLdyQMqI0No9ZFS7kIlUMFeI/5s
	ATFrCAubycNhj1hhpzCZHvjjzDUZhB+VlXmxIK5YxI+LFSjXNmVnonWDS0pg+NJ9obBZU9HE8bFtq
	K2nSYB5bVjjM0UjCZruZWWKhppwDm8qPK47G5sx5spHhE3hX4i10TONhOe5+mhE7wvm0iFUha/Dx8
	teybWipg==;
Received: from [81.79.92.254] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uDPfJ-005oEr-Mp; Fri, 09 May 2025 17:34:10 +0200
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
Subject: [RFC v2 05/13] dma-fence: Add helpers for accessing driver and timeline name
Date: Fri,  9 May 2025 16:33:44 +0100
Message-ID: <20250509153352.7187-6-tvrtko.ursulin@igalia.com>
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

Add some helpers in order to enable preventing dma-fence users accessing
the implementation details directly.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 include/linux/dma-fence.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 5bafd0a5f1f1..c814a86087f8 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -387,6 +387,16 @@ bool dma_fence_remove_callback(struct dma_fence *fence,
 			       struct dma_fence_cb *cb);
 void dma_fence_enable_sw_signaling(struct dma_fence *fence);
 
+static inline const char *dma_fence_driver_name(struct dma_fence *fence)
+{
+	return fence->ops->get_driver_name(fence);
+}
+
+static inline const char *dma_fence_timeline_name(struct dma_fence *fence)
+{
+	return fence->ops->get_timeline_name(fence);
+}
+
 /**
  * dma_fence_is_signaled_locked - Return an indication if the fence
  *                                is signaled yet.
-- 
2.48.0


