Return-Path: <linux-media+bounces-25804-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A992DA2C2CC
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 13:37:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C048F188DAE5
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 12:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4CC61DFE20;
	Fri,  7 Feb 2025 12:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WXxaq+Zh"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1944733EC;
	Fri,  7 Feb 2025 12:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738931828; cv=none; b=fr1i4pVbfpzmuY4vdwXxEHxNeDDtAU0WHZZdZ/kiKgMe+9OOBXDUzLkgS4QIqv+k+0E01BTfbKAP+ePOts0sk3fhUlM8kx5Q6Vczn7wJhLj6YC6kYb62IA+ARYvdOJui1xkd0Brc/u9/0KM/d7bytzGjgitvH1xuSWZ2QtZDdKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738931828; c=relaxed/simple;
	bh=2bKyeP9zqVLSt/2JmFzcqHN0fT/i7oHIwjweK2UhX+8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JJMSmPVPa29v3k2OKdbT9/EVODjXXjn8PD//2e5j1mt5hjj9XnfBbhRkJDThKEtAwC3B+p+9+nyKM/GIGrJPvbWrWfiJ9F5Z9BDjyMMf4o2vlLFUGh2L86KlRZMT9/w7RJCZ4/D4CqUNs53XzfWDH69rEpO2N5lFC4AYkaMPSXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WXxaq+Zh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BAF0C4CED1;
	Fri,  7 Feb 2025 12:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738931827;
	bh=2bKyeP9zqVLSt/2JmFzcqHN0fT/i7oHIwjweK2UhX+8=;
	h=From:To:Cc:Subject:Date:From;
	b=WXxaq+ZhGmi7hvXDV36OvJO4i4ekNHYRQg7jepLn9lJqijd3q6UJAiumv4qIHbkdY
	 wAsQ5w90FjWC/mx7uQTvlzAZjzUJAPOvLU6tRYj2nGzKvA8CFf7owLZJ84oYxyM8AF
	 0O+oMnD0fY9q3MnuCHnXFQMRrAFi3dSkQ8t/XOQT8cAJjdNse+YZnla98xSdA6UBPU
	 pA93nCG05ZPiUKdFmIVNzPb7NnaaJNGAGozHNKkcpquyZZaDV4523IrJUpsdCo+nXH
	 3qHtJ9wLCdnTXfnWUoUcL730shutKuGnX4VFBFCLXRYm2osrlXeFNjLGNxZErQm96J
	 gi9+kDSM6YVLg==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Philipp Stanner <phasta@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH v3 0/3] drm/sched: Documentation and refcount improvements
Date: Fri,  7 Feb 2025 13:36:50 +0100
Message-ID: <20250207123652.27677-2-phasta@kernel.org>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v3:
  - timedout_job(): various docu wording improvements. (Danilo)
  - Use the term "ring" consistently. (Danilo)
  - Add fully fledged docu for enum drm_gpu_sched_stat. (Danilo)

Changes in v2:
  - Document what run_job() is allowed to return. (Tvrtko)
  - Delete confusing comment about putting the fence. (Danilo)
  - Apply Danilo's RB to patch 1.
  - Delete info about job recovery for entities in patch 3. (Danilo, me)
  - Set the term "ring" as fix term for both HW rings and FW rings. A
    ring shall always be the thingy on the CPU ;) (Danilo)
  - Many (all) other comments improvements in patch 3. (Danilo)

This is as series succeeding my previous patch [1].

I recognized that we are still referring to a non-existing function and
a deprecated one in the callback docu. We should probably also point out
the important distinction between hardware and firmware schedulers more
cleanly.

Please give me feedback, especially on the RFC comments in patch3.

(This series still fires docu-build-warnings. I want to gather feedback
on the opion questions first and will solve them in v2.)

Thank you,
Philipp

[1] https://lore.kernel.org/all/20241220124515.93169-2-phasta@kernel.org/

Philipp Stanner (3):
  drm/sched: Document run_job() refcount hazard
  drm/sched: Adjust outdated docu for run_job()
  drm/sched: Update timedout_job()'s documentation

 drivers/gpu/drm/scheduler/sched_main.c |   5 +-
 include/drm/gpu_scheduler.h            | 109 ++++++++++++++++---------
 2 files changed, 74 insertions(+), 40 deletions(-)

-- 
2.47.1


