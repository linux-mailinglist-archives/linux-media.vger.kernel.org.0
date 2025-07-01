Return-Path: <linux-media+bounces-36433-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D30AEFA72
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 15:27:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65C39447AAB
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 13:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 094EB2798F8;
	Tue,  1 Jul 2025 13:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sqnHL9rN"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62523277815;
	Tue,  1 Jul 2025 13:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751376155; cv=none; b=LohH8rvf1DQAdoDDUloXf+FFCPqCjNueXjN1Pfbf0ipGz4Wr4JxcmvibPp9QNTqgS9e8Gb8hLid+z/7MqBNCyU0Cv4CyCzqzIpmJH+lilGGLEa4bP5etndXGLcVL+gf2OQkqXX9T4j7ajF/OinND088Dc7YRVTzd+ZkbrTd5A78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751376155; c=relaxed/simple;
	bh=UQqJCi3q3248PmPaymeTCZH4g0d/zd1eLvZ5EVok/aw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BPouD0lT2HXa8ttPYMAizlp4HpgL6kod6Mk7qVr7yB6g+tIqM8DIjGy+/AsrnFXGFiUKAVukxZSLpyu3yoFoPbvkRs4CxZWHI4Me3QCUGutMF3uAFCJe+xT5bWiJMc2idwpP6mOvXcDOlEBBuP5SuLjADWFRuT909nYT3mVu7L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sqnHL9rN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BFD2C4CEEB;
	Tue,  1 Jul 2025 13:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751376155;
	bh=UQqJCi3q3248PmPaymeTCZH4g0d/zd1eLvZ5EVok/aw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sqnHL9rNGJIULEfv+ov8QJAKVBlfWHtnbfJJKdxR8w9K0IMVAaDDb/HjDEtFeKP9O
	 +0uQIP1+62oxaOD4Q8LqimhTdMBOuDeRSS/7speS5pbDJZtFCrpj9mEYAvs3vYMF8d
	 KKa6FSqdTAmH2YlfCdGkoFEnC+yI/PeQpkGVVft3mkVpF5aFSBeYqMxQBSHDn6EUJn
	 KJrQCq1K0EBFAvK1FX/CRz9LGYe3iNBxulNGlyLYhEE7NZRD8Q287qFUt4/LsXxQ4I
	 uQqPVdZkL6pcyiEN0P8nSOqeJL+6Y2mYUJONi6IVc/+f/KE+R4mZKSMsnFp1EiE4/b
	 VZe7mgzLvyV1w==
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
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 3/6] drm/sched: Warn if pending list is not empty
Date: Tue,  1 Jul 2025 15:21:41 +0200
Message-ID: <20250701132142.76899-6-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250701132142.76899-3-phasta@kernel.org>
References: <20250701132142.76899-3-phasta@kernel.org>
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


