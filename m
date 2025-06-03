Return-Path: <linux-media+bounces-33983-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 561DEACC326
	for <lists+linux-media@lfdr.de>; Tue,  3 Jun 2025 11:33:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 859BB3A5B69
	for <lists+linux-media@lfdr.de>; Tue,  3 Jun 2025 09:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F38C7283FE2;
	Tue,  3 Jun 2025 09:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qkaF9EiV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE71283FD0;
	Tue,  3 Jun 2025 09:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748943129; cv=none; b=E65F0DPDhbF9V5GCABS/92Yaw5OulxZbaPd11rHqoxhFWZZ7oGeFfMu+cIsTKoORVLwOE5y6OtMQwM5AFTJS5SXNqTr8L5AhzfV8egyM3iHl88qzQGFeOHudQ2RUfVCcX+UUBe1hmjycmgt8if/62d55ufAvHAQa1wFHceXMVwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748943129; c=relaxed/simple;
	bh=2LsldMn9KbjhN49aH+7l3APjDKUmx0ZfcTTrHA+Kjes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GhGkvqM9n4NORlSF32UH5oWh/NZ8yyyqNEJ0PfmcCsQowpTqOQJJuVmyUDw+0EzTp4xXaAlx6y+DIctxM/LY7t6e1tzDjsIegtgbGoiFBa65cXGKbEQUAjW93gKSJOADkKmeMe0cfZ0H+4nNpvCsL/02ir37bXz4/Lj631v7SMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qkaF9EiV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6E96C4CEED;
	Tue,  3 Jun 2025 09:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748943128;
	bh=2LsldMn9KbjhN49aH+7l3APjDKUmx0ZfcTTrHA+Kjes=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qkaF9EiV6GWLI8NT9yoEwaqhYjdwiQv17ZoLGjUrmIgS2NI3SGkIgcjX9af/fJDEy
	 lVuo6ROARw63m/QTrInG3dQs4KpUIFbmuseNf0GbV4LdzS0pYUzKkY4KiB9B+KMaVc
	 uNPSdfeqGg8aiWrgzdnLaohJRgbRDUxX7Mx4Cp3nMVl/qZcGIQaKPVJTFxQsiDwJg3
	 R92bY9NhhZar3KRK1GnXmP6KU7tjzDAc734CjVusaGya5JlgPr1GyIQznf6I8OOD7h
	 YbQistnA/7KGn5NuHaSrsgRXBQD/dd4oS6VYwZ3AkG21aZ1bWntlOSrxauKCQA2bZC
	 D2eE3ieD1pArQ==
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
Subject: [RFC PATCH 3/6] drm/sched: Warn if pending list is not empty
Date: Tue,  3 Jun 2025 11:31:28 +0200
Message-ID: <20250603093130.100159-5-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250603093130.100159-2-phasta@kernel.org>
References: <20250603093130.100159-2-phasta@kernel.org>
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
index 3f14f1e151fa..df12d5aaa1af 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1414,6 +1414,9 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
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


