Return-Path: <linux-media+bounces-45185-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B47BFA3F1
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 08:34:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 47A8C4E8A17
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 06:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAB6A2EC561;
	Wed, 22 Oct 2025 06:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rqT+dBEZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28ED0257824;
	Wed, 22 Oct 2025 06:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761114867; cv=none; b=Ac3dKSBurT8gXurcSOHRaYHCRExbZj0Y46zzWBSSf23eApF2gUfHnZPhQ/N937N3mrZJEoCbJ5CubCq/lKkckasPVKs2Lsws2TLgML4TY8gLkyDWLM5EoO4zIn/OoEeSqBOquqgZk8/ccjv0yb5Nkm+McfHYPsaCY02H5cE/Y28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761114867; c=relaxed/simple;
	bh=9L6GffcfeerIeIPNhor4pQw206J3UW0w+l+X2vVd58Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d/Bmu1p3bs9VGUGUybZ+c4fR2dWayTFDi6XZ6/yARiPOq+YbsFUsgnIldgtQp1B5cZOHlr43ZYbjJXQTs64i+5dV+LT34oytzDWbkxqxVNvVwtYXs9G99slQwVLha/6bBCNt1Z2VSmpBF2vNh8oLcqUYIvuhnR/JI27sGvc1HM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rqT+dBEZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C356C4CEE7;
	Wed, 22 Oct 2025 06:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761114866;
	bh=9L6GffcfeerIeIPNhor4pQw206J3UW0w+l+X2vVd58Y=;
	h=From:To:Cc:Subject:Date:From;
	b=rqT+dBEZS1BAr8dG7SJabEEAdUnmoXAKiBJcIwMwmCSQ25lBTLANAXSBdmO6Z0NaD
	 /oi0yCnC3gLYpt+gHLhwgwl+tzMCWJnYYeGHM00CLzX1bKdBfrScWfb3NrgiHS3lcb
	 0cEVA8ib1hLARnLLg6srznHciBxJwR+wHRpTjV2FxfY2dCT5myrjUIIc3qjAgCYChK
	 ucFO9ybs+w70nLr6aZYcMTzAOTxZ+a3+wpBNAYnN3uUGos44Gkf2BD/Rldr1x5eKro
	 BG7OG/l+o2YzVkxpNnPOLAanDNGxX5ZlCJPPYlB4uuS2lLxfAn+fCelrBdKEZzVhw1
	 g6yCSR6v7X3iA==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Philipp Stanner <phasta@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] drm/sched: Fix race in drm_sched_entity_select_rq()
Date: Wed, 22 Oct 2025 08:34:03 +0200
Message-ID: <20251022063402.87318-2-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In a past bug fix it was forgotten that entity access must be protected
by the entity lock. That's a data race and potentially UB.

Move the spin_unlock() to the appropriate position.

Cc: stable@vger.kernel.org # v5.13+
Fixes: ac4eb83ab255 ("drm/sched: select new rq even if there is only one v3")
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 5a4697f636f2..aa222166de58 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -552,10 +552,11 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
 		drm_sched_rq_remove_entity(entity->rq, entity);
 		entity->rq = rq;
 	}
-	spin_unlock(&entity->lock);
 
 	if (entity->num_sched_list == 1)
 		entity->sched_list = NULL;
+
+	spin_unlock(&entity->lock);
 }
 
 /**
-- 
2.49.0


