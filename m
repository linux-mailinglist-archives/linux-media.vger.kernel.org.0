Return-Path: <linux-media+bounces-11810-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D8D8CD14A
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 13:33:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D6051F21E23
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 11:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F28F61494AE;
	Thu, 23 May 2024 11:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="LNUJpLZP"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E839314830F;
	Thu, 23 May 2024 11:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716463973; cv=none; b=HzgyTkHTxfxyE5hO48xD0sKC8W1fRuRM+RawKZdD/ah7BHWX30TolA5kEm8POg5fSIBR+1q9cpwuwiCK4rV4cX9o8uYOXMnaTTQpUw9gtpq01FmeH4HoWXWffIm7K5UkP+CDaei7I1oOAtoffkow1XE2elLQ+c9XS4wjFCE3oeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716463973; c=relaxed/simple;
	bh=xxwOORKXpYRuv1uSmAvP8hybhQbv42S6rKt7i+RykoE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ND0mZBf5T/al5gTxw2djeUk/THEgG6q7AgZ7dKIKz8ouPuReOxUuKzh/5pm8Wqt2ve4AkWG5dtt4KbQ+9+DRQgdTK+lQuO75SQ3s1rOzT1kklYiTyLfKljOs6p8zsxRHTckdWyIk3c8Bgb5pdUBYOPuNMAD+IPh8CrHbU8necEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=LNUJpLZP; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716463970;
	bh=xxwOORKXpYRuv1uSmAvP8hybhQbv42S6rKt7i+RykoE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LNUJpLZPkFeJowEbnPonKue9SSW32Xo/8RewwMBwlI4V0Y9OKEIehgnw5uliyLMSw
	 8pIFNmXXEmGow99diw1Nxu9lpnN7/ft5I0Fiy5kGFFMXdJZaze4sGKrNgV5IkSpL0c
	 5vw8lo+iTNzUagaWT2qnWzDFL2WSl/5kd7UfRF2qUmZqn+MaL+WW63UHkc4SVbVcRF
	 QRJYroAMWzWhNesF6yWXCmtqT7ugIRNQ4RlQ/H+nqN0PTPtnWvnlW9+AcQnp1Y01Ye
	 npXQ21OcEVY/g19Kn3SXC0UTXqXTRZwyBlDT6XxTdsFk5uLKrBbucyP/lmdjVRNu5P
	 meXGFS7MV5Ebw==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: alarumbe)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A909E37821C5;
	Thu, 23 May 2024 11:32:49 +0000 (UTC)
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
Subject: [PATCH v4 3/3] drm/gem-shmem: Add import attachment warning to locked pin function
Date: Thu, 23 May 2024 12:32:19 +0100
Message-ID: <20240523113236.432585-4-adrian.larumbe@collabora.com>
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

Commit ec144244a43f ("drm/gem-shmem: Acquire reservation lock in GEM
pin/unpin callbacks") moved locking DRM object's dma reservation to
drm_gem_shmem_object_pin, and made drm_gem_shmem_pin_locked public, so we
need to make sure the non-NULL check warning is also added to the latter.

Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Fixes: a78027847226 ("drm/gem: Acquire reservation lock in drm_gem_{pin/unpin}()")
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 177773bcdbfd..ad5d9f704e15 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -233,6 +233,8 @@ int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem)
 
 	dma_resv_assert_held(shmem->base.resv);
 
+	drm_WARN_ON(shmem->base.dev, shmem->base.import_attach);
+
 	ret = drm_gem_shmem_get_pages(shmem);
 
 	return ret;
-- 
2.45.1


