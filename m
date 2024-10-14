Return-Path: <linux-media+bounces-19633-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3CF99DA3D
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 01:40:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE53A283D0E
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 23:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83AD91DAC97;
	Mon, 14 Oct 2024 23:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="k8FYe19t"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777961D9A7E;
	Mon, 14 Oct 2024 23:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728949143; cv=pass; b=oQnqpxFIuFwCVbwJo+suSugmLFC54EpbbGBkhYjthRfLF36X6PEqeaN3Ok+KqWcCglmB2ll4mmBneI///FC0rwYlA2/NxB/xfCsHbHoeb+PMTFPAIpEyOjOXYjyEzsbFekbZlYOxCsa+pQ5vF3sxz+k0jinLFGrxoKGCfYSkU2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728949143; c=relaxed/simple;
	bh=DAVwNBoWB5puyBcadu/tEp5EWEZjWbq780G0YxYfTYw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TQ8THwtBGXqo0w/2fktRW2AggffOC17dj6kGGwGQ1wzjPiPooAq1ekTVkE5tiVCZEF+yWjtBQR9Q+K9NRjDfnOKggqXXQTgXxXnUZI9RO3F2mfAa5h4K5VsjGSerPQweSLryXViivwVFiZ/ULnhVR8Ia1sWP34LGAk1Wa8nICHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=k8FYe19t; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1728949122; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Trc2Idtro993SdRiJRRsUWAruhN7ksIL40EcnC6SDLrSpXBqDVOeorjuq2bG1I7FDfKiaxdpHUsy535a5f3dDtd3NX4j6xhEn2pjj7iW52ahmk1fD6l5qRzH8yOxjYWfc/HLr+nzESWBKb6R6otmTh4iNsxgTQb6VJgFvEJUXh8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728949122; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mCtIoUK67xJwWEiLaC1u8aGeTl4l8YjZQ3chLiNR3Jk=; 
	b=eoeQYuz+/MLbddeSpUJvWELHMBc8o/owJoyIElRyWZyP3q8fRGeq8vo9BRz15vqZcN/kWELrGR8dQQ6k1J7kaW/NocYiBAKHeYSNS5TZytnP2Y3qpfxb66LpP8zNj2nUbl+8efxm0rAfH2uCOrko5aYMvO+XSuRc7uOYNnqGRKA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728949122;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=mCtIoUK67xJwWEiLaC1u8aGeTl4l8YjZQ3chLiNR3Jk=;
	b=k8FYe19tXvTaMmdqF2Cm7Vc1qG3gHI1JOzT2F69SJlhaZZg2uR6JiB2Ag7YpqnIU
	n7m+2evjCR2d+IWsX65RZnZ2EYeoKmuC8m1P9abWRkREPGVgfxLDkKEv0T3MlAYabR+
	SNa62h98ReFoe2t26sELg9HFj1keh72dfL8mR9ng=
Received: by mx.zohomail.com with SMTPS id 1728949121244283.00947506086504;
	Mon, 14 Oct 2024 16:38:41 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: kernel@collabora.com,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 9/9] drm/panfrost: Explicitly clean up panfrost fence
Date: Tue, 15 Oct 2024 00:31:44 +0100
Message-ID: <20241014233758.994861-9-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241014233758.994861-1-adrian.larumbe@collabora.com>
References: <20241014233758.994861-1-adrian.larumbe@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Doesn't make any functional difference because generic dma_fence is the
first panfrost_fence structure member, but I guess it doesn't hurt either.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_job.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 5d83c6a148ec..fa219f719bdc 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -85,9 +85,15 @@ static const char *panfrost_fence_get_timeline_name(struct dma_fence *fence)
 	}
 }
 
+static void panfrost_fence_release(struct dma_fence *fence)
+{
+	kfree(to_panfrost_fence(fence));
+}
+
 static const struct dma_fence_ops panfrost_fence_ops = {
 	.get_driver_name = panfrost_fence_get_driver_name,
 	.get_timeline_name = panfrost_fence_get_timeline_name,
+	.release = panfrost_fence_release,
 };
 
 static struct dma_fence *panfrost_fence_create(struct panfrost_device *pfdev, int js_num)
-- 
2.46.2


