Return-Path: <linux-media+bounces-37291-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B71FB0029F
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 14:55:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E55F21C419FD
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 12:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF8E12E5B2C;
	Thu, 10 Jul 2025 12:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zh1T5PRE"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498EE262FF3;
	Thu, 10 Jul 2025 12:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752152090; cv=none; b=tG5HqnvCu2yBmRX0t/GYdA1pvsT6FeRwAXJ7KBS6syZLZ7AXaJqT/I1MTYPvq5vbWUIA3YqX3ePwvmbLX2GfO3893nu1Wl5zKSkKNUNeSPKkN8OOuT2MEU/tsO3qfHEB4ihAA0CFMMdS8OZKCa5We+2NaJfotX35qYvWXEwf8N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752152090; c=relaxed/simple;
	bh=7XmDQ19LlrT/ee4FW7YiS+UMjRIWOrZtAU1md2emjzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fa4TMo/Q9ZWTCLNN04tPchGKnd820wEM3BqgaCNh/nTodnbcqD8IyGfz78d3G3aXSPclTfX3fpcmK+7qpU3WxQv8HcgmPY3g8c2U+YiYTG+RbjJ7O0nEo0iYOuQ05wONSvcxA49OSmlPRsAsJqdXzLA9mQkcIcKAHPxBoj1Nx1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zh1T5PRE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90ED4C4CEF5;
	Thu, 10 Jul 2025 12:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752152089;
	bh=7XmDQ19LlrT/ee4FW7YiS+UMjRIWOrZtAU1md2emjzQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zh1T5PREai1yz3rn3CBHgF13mDoKB2msCw3lhEJa8I2n20i+aVL4VRFnKoDfhNLva
	 4Pqw6ldf+HSL3yoRg3PJKd3FRJ14VyNYCeYdcvi0X+/OOqjku8kpci5bcsXjlt3POb
	 S9ruS4LGiTPhehntJ7q04fQ9uTyPGqMsvPt5NRckfhfkylJ3A5Oi/p68ZEnGf+sbtN
	 6XmaChNLKFEYb5vMLp1DQWHq960WmJOO9s87R1GIcOsQBp4b+HKQP7AOdGpkgcbU5v
	 0pvFYC7MIZiTu6D/asJjPayMpMUuLlMcarhObtcSZeV4y/jaGEsgM4E0jz0BOvSwb3
	 Tt5v6EdfH+BNQ==
From: Philipp Stanner <phasta@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthew Brost <matthew.brost@intel.com>,
	Philipp Stanner <phasta@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v4 5/8] drm/sched: Warn if pending_list is not empty
Date: Thu, 10 Jul 2025 14:54:09 +0200
Message-ID: <20250710125412.128476-7-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250710125412.128476-2-phasta@kernel.org>
References: <20250710125412.128476-2-phasta@kernel.org>
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
index a971f0c9e6e0..d94270cf8bf5 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1414,6 +1414,9 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 	sched->ready = false;
 	kfree(sched->sched_rq);
 	sched->sched_rq = NULL;
+
+	if (!list_empty(&sched->pending_list))
+		dev_warn(sched->dev, "Tearing down scheduler while jobs are pending!\n");
 }
 EXPORT_SYMBOL(drm_sched_fini);
 
-- 
2.49.0


