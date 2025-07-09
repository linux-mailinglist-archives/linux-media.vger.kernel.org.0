Return-Path: <linux-media+bounces-37195-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7C5AFE85E
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 13:54:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A7561C81115
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 11:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACADE2DCF6E;
	Wed,  9 Jul 2025 11:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p9vmiO0w"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150042DC34D;
	Wed,  9 Jul 2025 11:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752062021; cv=none; b=lw2FL/C3jf+QupvEydjAw6acSOX666NSBL4wB/+0i0sD/qCGKb/GF30QEokHgfBozhosKKO3kcKvTHek4uTQ2i4zjCRRAu2Ypt6lMuv0ZQLEsKpalqJyPzTTWjgIvtpRnRL+UvU9w0MC2XjR7hwf25rclZI/vdzmdiU4/w0umVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752062021; c=relaxed/simple;
	bh=Jr45GDaF+42wl4BEFdHS/S6QGGlCSlKcGecFU5CGZvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NcYrtg38I2tLv2Ph7+wye5X49/2BzB3v/j2Q3VgBYUM+KM0GDzf5XLHoJU0w7PmJQoiQSu5p52IjP5LdEmEpPXs1/t/1E0dqRw/XNbFdx8achjH+QwoPgRkCUDSACLdaac88bkEFH2Q8TAQ4NYHGSMn/vPczNvV42uX+TG3Kr7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p9vmiO0w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3875C4CEEF;
	Wed,  9 Jul 2025 11:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752062020;
	bh=Jr45GDaF+42wl4BEFdHS/S6QGGlCSlKcGecFU5CGZvo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p9vmiO0wJGy+be/TMUQ/D2XXdl/jmSvqoVU39tj/aVdyp06EAhivoC75sjpqg+XTM
	 pI7O8kCdTiEACr4GdnrvuJ9zwC2A77BJqVOdJnxkQ7OytBTlBd9MEOXlcwmghk1iGg
	 zEVxT7GizIyW3TI9pmROs7+CHOAkYfckYkFUPMfpnDkDPFXM+aoUbor6WVKdELYvJI
	 jWVYYHkUeHYQ4mkYcS7fHURDki+nZkvdI3IubfzNs+dhFrBJB5aazdB4EnDkiIU1zb
	 bjI4IzyQSqEVWuIGm7I0e5NjkrwmYikbFhbvlkPYl8KUIV4ZeO5ZzF7Ax/HWVgOHzV
	 SIrkeYMymZAfA==
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
Subject: [PATCH v3 4/7] drm/sched: Warn if pending_list is not empty
Date: Wed,  9 Jul 2025 13:52:54 +0200
Message-ID: <20250709115257.106370-6-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250709115257.106370-2-phasta@kernel.org>
References: <20250709115257.106370-2-phasta@kernel.org>
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
index a971f0c9e6e0..93cb74c0ccf8 100644
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


