Return-Path: <linux-media+bounces-11809-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 151FB8CD148
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 13:33:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A7C21C21550
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 11:33:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A71514884D;
	Thu, 23 May 2024 11:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GDELOgMH"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6069413E3F2;
	Thu, 23 May 2024 11:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716463972; cv=none; b=kzkVOfDpkB9vt01dnD2fGOBG2lkaixi+OXOqY1V+fxZ29qsFqULj39Um4ayUVMEYbNKVhl56tG9WAEnK5AYetrOLZaH3nBtL1XrlaNQ1b3OokxcURAoQ9dFVCuqfxqCoan4Igu9BSre7gs9ccmK2O0YiiRPbhoIhgl8jrTI9u1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716463972; c=relaxed/simple;
	bh=15Ht+l9+EOGuqFC/0CeadvzXopOVjXhks3pRPKtgKio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LJJRTtt+7QLePIHq6IQoKnIAweko09aomp2Kh80Os2dRMwkmVcB0ixPUfAiVQZQiaNPtAdkcsEVpNEUPPpXTHCnvBZatKq9MNokXRK8X1L1wXihI/nH3ru2rAcIU6ibvhY82Xte/up2pf+1ry/c7SVCVRvtj3ZzjhYihM42TtMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GDELOgMH; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716463969;
	bh=15Ht+l9+EOGuqFC/0CeadvzXopOVjXhks3pRPKtgKio=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GDELOgMHXjO1A3trk3dCPadzusoGvdmhgUTU/OqvtCktVeBeW1P7klGIngmIoOo/N
	 nF2I7ZobogyVcirQOc76/Mu3HxTz5++xNdsKquylcBTU/2WGcyUfurrhhOwp6GIQYR
	 t/UBTcuklaFxfiDKglidCEZKi28y+dXbzsO0oLLLNLNnz6NMPbVk9yR3NQLipoCw8B
	 hDkwg6ewWpBb0UN388ck+syjCxq0Uw20s1YZm2o1oz8G6us/fKQXItRhWICtpH74+a
	 2uyNiQySg2rKl/j1RUAXX3MQyWdYCNRKkyqlokEiYp9/QROKcf3aJq3k2RkFpF9qVh
	 u54ZpLl5o0bQg==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: alarumbe)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id CE03C37821BB;
	Thu, 23 May 2024 11:32:48 +0000 (UTC)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Zack Rusin <zack.rusin@broadcom.com>
Cc: kernel@collabora.com,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH v4 2/3] drm/lima: Fix dma_resv deadlock at drm object pin time
Date: Thu, 23 May 2024 12:32:18 +0100
Message-ID: <20240523113236.432585-3-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240523113236.432585-1-adrian.larumbe@collabora.com>
References: <20240523113236.432585-1-adrian.larumbe@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit a78027847226 ("drm/gem: Acquire reservation lock in
drm_gem_{pin/unpin}()") moved locking the DRM object's dma reservation to
drm_gem_pin(), but Lima's pin callback kept calling drm_gem_shmem_pin,
which also tries to lock the same dma_resv, leading to a double lock
situation.

As was already done for Panfrost in the previous commit, fix it by
replacing drm_gem_shmem_pin() with its locked variant.

Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>
Fixes: a78027847226 ("drm/gem: Acquire reservation lock in drm_gem_{pin/unpin}()")
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/lima/lima_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
index 7ea244d876ca..9bb997dbb4b9 100644
--- a/drivers/gpu/drm/lima/lima_gem.c
+++ b/drivers/gpu/drm/lima/lima_gem.c
@@ -185,7 +185,7 @@ static int lima_gem_pin(struct drm_gem_object *obj)
 	if (bo->heap_size)
 		return -EINVAL;
 
-	return drm_gem_shmem_pin(&bo->base);
+	return drm_gem_shmem_pin_locked(&bo->base);
 }
 
 static int lima_gem_vmap(struct drm_gem_object *obj, struct iosys_map *map)
-- 
2.45.1


