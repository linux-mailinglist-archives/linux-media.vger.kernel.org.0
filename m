Return-Path: <linux-media+bounces-45398-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A88A9C01D30
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 16:39:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7904F3B717C
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 14:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 080AA333430;
	Thu, 23 Oct 2025 14:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jx4Dsg5h"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F9F32D433;
	Thu, 23 Oct 2025 14:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761229845; cv=none; b=hZx36E8g0AxOut+DHNEXABFCAKePmz/p7r0Giu9olLaCeLdQOIJAgeqo0ytdO7nvFsMUj4nINuQyWHq+4+c/6tJ9r2yUrVn+sOjn7SEvLl0a96BUm/q9WpTGNHBVjlhWRGrd7xzHCgdEcP9LSPEJgaqoon1lFUSKT9rMvRHbw9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761229845; c=relaxed/simple;
	bh=KCOKaI58Dqzg6Z/GWXMTAoM3n8N68zryV6zLecW4Hg4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kE5O3ECEUVur6y/vBnt99PWUkl8OFRu7Np3y7EeaoqR1N6lZxj1ZNPtc/gYZmfZIWFim2+uenyBLX6LbeHqE6qzcYma1kRnHOsGKQEiNjd9BSdK0TTyPI1Tlae7u/GPKUu9ggltfPVGA5W4357hT02OgRVK3ekSVjP5hGHMRQFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jx4Dsg5h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73951C4CEFF;
	Thu, 23 Oct 2025 14:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761229844;
	bh=KCOKaI58Dqzg6Z/GWXMTAoM3n8N68zryV6zLecW4Hg4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jx4Dsg5h37BhCHR27HmHVAovcAiL6og0kPvboXmWRvUt18NnZBVT4eYiMCflNrSOR
	 nnzbnCrWn35VqVC6Wv61tm/SUBY291w8elnR+nzB5/KBhVSPGgbGlIF9HlqtHmzVDO
	 GpJfQW5uOnLU9IYCeiW7Y50pHZ8eqgj5PL4Wjt6i4nVOCIqZwTKIWKKLDfzEBWHACV
	 j8JCC+/1HyoS0PgWjfBkdM/SOc3/lypCPbBGqGtq27iVfd7Ae07oh5NUefDYqVrip6
	 ksOKSjyq0e2eSXCtOAuxLNuS1PjdMo9rZQvcg33CySbpyrHT/33E8lIgOP/7Wp/yMc
	 bAuSzPtaxD7oQ==
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
	linux-media@vger.kernel.org
Subject: [PATCH v2 2/4] drm/sched: Add a TODO list
Date: Thu, 23 Oct 2025 16:30:29 +0200
Message-ID: <20251023143031.149496-4-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251023143031.149496-2-phasta@kernel.org>
References: <20251023143031.149496-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DRM GPU scheduler contains a huge number of problems. These should
be documented for (new) contributors to pick up work.

Add a TODO list with an example entry.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/TODO | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 drivers/gpu/drm/scheduler/TODO

diff --git a/drivers/gpu/drm/scheduler/TODO b/drivers/gpu/drm/scheduler/TODO
new file mode 100644
index 000000000000..79044adb7d01
--- /dev/null
+++ b/drivers/gpu/drm/scheduler/TODO
@@ -0,0 +1,12 @@
+=== drm_sched TODO list ===
+
+* Example Entry
+  - Difficulty: hard
+  - Contact:
+    - Danilo Krummrich <dakr@kernel.org>
+    - Philipp Stanner <phasta@kernel.org>
+  - Description:
+    This is an example.
+  - Tasks:
+	1. Read the example entry.
+	2. Remove the entry once solved (never in this case)
-- 
2.49.0


