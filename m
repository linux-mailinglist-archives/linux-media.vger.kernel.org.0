Return-Path: <linux-media+bounces-47760-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 92191C89FBA
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 14:21:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9C70A4E5E74
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 13:21:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DBC8329E48;
	Wed, 26 Nov 2025 13:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SlzUKnq7"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE632FFDDC;
	Wed, 26 Nov 2025 13:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764163234; cv=none; b=ZGBjY0FZlJKwI4QEkmE4d6s05LAGXgrgZcQIzJG6q8SFJPu1EbJbk9+0ISb125C7TC22EDiQ+2eeai5ZH6LhR9rNnZ+RowKam/TDuwW+xBZ06xJtEqs08l+QULGMe2MyfASwkm/2n4dxkme3mfJxNI8GK/GDSPHBYT+bodgXC3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764163234; c=relaxed/simple;
	bh=lgAu6095fUG7URUtB5h9h1pWeOKehgRUT+IfEnrX0L8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kZY3CiAb+JwJbsGBN3uksVJ9ZwoZQbH7wwud9OploVRoteKBjoY6dFXuUl9PiYt14DOSNLZuq7RBmqVSutOa03n4lRe/3e/w74ssFd38VKvZAlj7qc3fJxdfqq3z7nSeTO8KtiCXO2rpC5ukGqSYq0ocJtRkSPhLvrbsBFsINH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SlzUKnq7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06F58C113D0;
	Wed, 26 Nov 2025 13:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764163234;
	bh=lgAu6095fUG7URUtB5h9h1pWeOKehgRUT+IfEnrX0L8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SlzUKnq7+JYkCPIISBxuVSJtdfIbgnro2PHCDrhP1dJKS3DVMtUcilQacvEz/ee17
	 n/rAZbBLl1tDeiGBZMIfP903XFYmcmrpBfkc8FMNkSMAS5rh0UfG9DP0he9+bjVsGh
	 X8NmWUTmwUR3GL7sikPHs0vQ2bTo45s6VLia93pI3VaJ0ZubUQToiKczIjcBU3OYJH
	 76rPpa7YG4R/HdNwlS3tq9eBfDQfTnu4JO+iNOIJ01Ta2z0h+YCkqh/kjqfGUp2F4F
	 Hm0Zlee+s4KQs9RusVyTgY9xIZfMwbSIzZxLh5C2T1MI6nNapaHJFzmkrvgHBUK7NB
	 bgrvQM/LDGb7A==
From: Philipp Stanner <phasta@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Felix Kuehling <Felix.Kuehling@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Huang Rui <ray.huang@amd.com>,
	Matthew Auld <matthew.auld@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [PATCH 5/6] drm/ttm: Remove return check of dma_fence_signal()
Date: Wed, 26 Nov 2025 14:19:14 +0100
Message-ID: <20251126131914.149445-7-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251126131914.149445-2-phasta@kernel.org>
References: <20251126131914.149445-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The return code of dma_fence_signal() is not useful and shall be removed
from the kernel. To do so, all users must be removed.

Remove usage of dma_fence_signal()'s return code.

Suggested-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
index 1bcc67977f48..34957624910f 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
@@ -692,7 +692,8 @@ static int threaded_fence_signal(void *arg)
 
 	msleep(20);
 
-	return dma_fence_signal(fence);
+	dma_fence_signal(fence);
+	return 0;
 }
 
 static void ttm_bo_validate_move_fence_not_signaled(struct kunit *test)
-- 
2.49.0


