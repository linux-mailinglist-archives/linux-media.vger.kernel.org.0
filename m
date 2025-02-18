Return-Path: <linux-media+bounces-26270-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 145EFA39A27
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 12:14:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11FDE164E1B
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 11:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F41C023C392;
	Tue, 18 Feb 2025 11:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NL6X4IBC"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD0A22DFBD;
	Tue, 18 Feb 2025 11:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739877186; cv=none; b=TTGpRRrrFjSmQPDt/xso5+g/0Lvnyat+2/k5i0SafRQeqMaVTQoc/gh1bhKqgqEDFjHcbq0BCLMkTTlreZPgxCeOBBjfbP/7+ZoCTuiddZhPKxlx9NJGgabrqDb2PePGIokIClPX3kJ5QC68EsKwFADuEGu6s03D850sB9ROBe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739877186; c=relaxed/simple;
	bh=Lvi6FQ89TE/loV59Xko0QSZp0LU8OQ2GNhpZE13oz6w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QAraktTrLSVZn1DjyZGjHZMCHqRf15bFN2mcE8qQQ3UWt3/89AA8KdwO6GydSIEFr2/q9OLy18Ur4JME5UMwx9Zi9gGtswgACubWGfv6Nxv/Y8pBDpdki5GTLuRIJyazR/Vt4m4vhMfN7ZLnS5mnXTdqcY/xrtgPFGImVnJDQ+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NL6X4IBC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70944C4CEE2;
	Tue, 18 Feb 2025 11:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739877185;
	bh=Lvi6FQ89TE/loV59Xko0QSZp0LU8OQ2GNhpZE13oz6w=;
	h=From:To:Cc:Subject:Date:From;
	b=NL6X4IBC36NR3Gupnzzer+nn7zCmkBXuVn9tAO/ylk0BI8m2incSSD2Mm0lx1CIyN
	 P8Ye6XWOKuDElNt4wpY4jO0wF8wctoiBtj3UHMP3daU80I7oSbpPpp8fbViUwqilho
	 /ai4gL3GoMSzaO/H/LdgsQBUBRN+En3ys37UuBCdJGAHACBByF1QxJBwkAIC77fqyG
	 JyqqRAYSJ7i3L5xch49KV7PVZHVggr9GBNXBh5fXAlbXCe8FU+hImwcwfjUr110rOV
	 XIAVm8a9WFbPrq5KMvDCfUqYs53m8TmiYXwE1KhIqnB1bST4isHSC6bI+KeNPEuWaU
	 opVe6Ph7oNv7Q==
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
Subject: [PATCH v4 0/3] drm/sched: Documentation and refcount improvements
Date: Tue, 18 Feb 2025 12:12:44 +0100
Message-ID: <20250218111246.108266-2-phasta@kernel.org>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v4:
  - Remove mention of vague "dma_fence rules" in timedout_job() again
    since I couldn't get input on what those rules precisely are.
  - Address a forgotten TODO. (Me)
  - Reposition "Return:" statements to make them congruent with the
    official kernel style. (Tvrtko)
  - Change formatting a bit because of crazy make htmldocs errors. (Me)

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
 include/drm/gpu_scheduler.h            | 106 +++++++++++++++++--------
 2 files changed, 73 insertions(+), 38 deletions(-)

-- 
2.47.1


