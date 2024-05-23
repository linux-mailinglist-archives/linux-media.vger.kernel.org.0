Return-Path: <linux-media+bounces-11807-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 286B58CD141
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 13:32:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7B6628339B
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 11:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15BAB1487C3;
	Thu, 23 May 2024 11:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="taQOIum8"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8DCBA2F;
	Thu, 23 May 2024 11:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716463971; cv=none; b=aa0c2N2Lv401BVUUn1BQlDipTu8cR+udo43y2kst6LDZzkFkpSrdQzfREe/slCisamF7mravx+2K8deZ0Bl8Q2kG26Z0HMFDQfdpoiFxLGOJtxLyNPjSYkJpqaromzOxw7Hu9lUjjErfDQD1jQYp+2ggKHU1ejh5D1m+Q1DoM+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716463971; c=relaxed/simple;
	bh=P8iZRYjzf5V/CwUg/tRStLzmlTzFHauJjmXv3MkDoCs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BeoXKKE8JcvqlYHHhZF/u81cIH6Q3uEY6PWyJtq6GEARHIYu4t7XdawaLgFcvVZBTMsPefIFbOUGqwiF3mKDvZxlejRXWUeIJ8UNkK+ozgpW3MxyeF6QpPB0I9BW/aYUqZdX0DCccXXZ8Mjsnkl1SOKqYvGr7qEH8Ob1Zv6qDKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=taQOIum8; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716463967;
	bh=P8iZRYjzf5V/CwUg/tRStLzmlTzFHauJjmXv3MkDoCs=;
	h=From:To:Cc:Subject:Date:From;
	b=taQOIum8Twjkoi5IyV7Vq6dIRtnTd0nMeQutsIHIpCrhgEovTWViWuRgANmci3jCB
	 PEwcy/7mdF08aneb6cv2asq1wSUWj1sPFbpVzyBv2dz1II6dk+BOkoTQoKHE5E9qlN
	 CVVY0K/22QLDrWIDOgd7cusZ82eq3ibKrWtkErq1XH6+EhfieMIZpy8KL1qCErajy2
	 R+gGSM160e6U3pqG+rqWTc7uxM5+kz4iBozc9Qp0KAZjj0uHihJdOSmO80farKXArM
	 nlQc1cjSdZfaXS4ZCqWFz19SkM7WWuc4Ek1RKJZ5PZExYe/A3+NwWt3bu9xvcqjR0n
	 wG2ToueKf7JpA==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: alarumbe)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1925537821B8;
	Thu, 23 May 2024 11:32:47 +0000 (UTC)
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
Subject: [PATCH v4 0/3] drm: Fix dma_resv deadlock at drm object pin time
Date: Thu, 23 May 2024 12:32:16 +0100
Message-ID: <20240523113236.432585-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is v4 of https://lore.kernel.org/lkml/20240521181817.097af5e1@collabora.com/T/

The goal of this patch series is fixing a deadlock upon locking the dma reservation
of a DRM gem object when pinning it, at a prime import operation.

Changelog:
v3:
 - Split driver fixes into separate commits for Panfrost and Lima
 - Make drivers call drm_gem_shmem_pin_locked instead of drm_gem_shmem_object_pin
 - Improved commit message for first patch to explain why dma resv locking in the 
 pin callback is no longer necessary.
v2:
 - Removed comment explaining reason why an already-locked
pin function replaced the locked variant inside Panfrost's
object pin callback.
 - Moved already-assigned attachment warning into generic
already-locked gem object pin function


Adrián Larumbe (3):
  drm/panfrost: Fix dma_resv deadlock at drm object pin time
  drm/lima: Fix dma_resv deadlock at drm object pin time
  drm/gem-shmem: Add import attachment warning to locked pin function

 drivers/gpu/drm/drm_gem_shmem_helper.c  | 2 ++
 drivers/gpu/drm/lima/lima_gem.c         | 2 +-
 drivers/gpu/drm/panfrost/panfrost_gem.c | 2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)


base-commit: 7acacca1b157fcb258cfd781603425f73bc7370b
-- 
2.45.1


