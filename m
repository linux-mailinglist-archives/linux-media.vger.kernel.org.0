Return-Path: <linux-media+bounces-37008-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEBFAFB4E8
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 15:43:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7B4A47AE994
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 13:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AE562BD590;
	Mon,  7 Jul 2025 13:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sKaWRNw6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DF72BD58F;
	Mon,  7 Jul 2025 13:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751895768; cv=none; b=hL5iziVIMIj6ldqIkgtbhhEIu5Q3dGxe9ceX4gh7ptTpkYPHDHdP2C26GkOojBLK8p+BRQMwD6MFzErtNF4Lzg+h8fbSikLoxm0iFNdR3EuMWc61feFpAKsosY82KeJhjVSzSntyQTDjMugg7mYaxP3ZLQ2mru2yuZ7a8Q7YRh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751895768; c=relaxed/simple;
	bh=UQqJCi3q3248PmPaymeTCZH4g0d/zd1eLvZ5EVok/aw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kSJVb4WVdNYDl16A2+bZgRvLsKvpCS5eiXeCvNHD6T6BJT120Ud5boqG/TUYeJGNYnoZ3PuKOW049f+5r9YGZPDLQl1w4FB7uruHxNRaU81JfSj1VQ9MtnteTXREHGZthI1MCW/Vto5wedTMaWMjy/6nuP2ysr4dA5bsFpTHgW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sKaWRNw6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CE9AC4CEF4;
	Mon,  7 Jul 2025 13:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751895768;
	bh=UQqJCi3q3248PmPaymeTCZH4g0d/zd1eLvZ5EVok/aw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sKaWRNw6rzetS4hgXXzsihe0ACF22tZm2IJXFpvG5XItP0bHQJTC2obbzQMYHd3me
	 XYMlaPiCZdaaOsdoMVInJSQuMggkxzcU9/XL1vhfIZ47c9z8QIbMt2DyOrC2yOq+bL
	 7dpBu1pFR27MUxJR5C9/PogpOphu6U+dYqpa0eRZ/HLvICpiSi+H36hbPfgXnZCTCR
	 vB3IS3ceH4NKjQKqQdt4I2NLP9LPGxPc43x8E5n/h1I8w7mngG24TkqjJtLkCasyOT
	 BbmbKOgVObQc4KbXmRzi3poIjr+EcgOQwh+Mi+X1UhPOb/kKivMG2XuiTjuNeqXvs5
	 aQyDFs4mrgOWA==
From: Philipp Stanner <phasta@kernel.org>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthew Brost <matthew.brost@intel.com>,
	Philipp Stanner <phasta@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v2 4/7] drm/sched: Warn if pending list is not empty
Date: Mon,  7 Jul 2025 15:42:17 +0200
Message-ID: <20250707134221.34291-6-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707134221.34291-2-phasta@kernel.org>
References: <20250707134221.34291-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

drm_sched_fini() can leak jobs under certain circumstances.

Warn if that happens.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 1239954f5f7c..dadf1a22ddf6 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1415,6 +1415,9 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 	sched->ready = false;
 	kfree(sched->sched_rq);
 	sched->sched_rq = NULL;
+
+	if (!list_empty(&sched->pending_list))
+		dev_err(sched->dev, "Tearing down scheduler while jobs are pending!\n");
 }
 EXPORT_SYMBOL(drm_sched_fini);
 
-- 
2.49.0


