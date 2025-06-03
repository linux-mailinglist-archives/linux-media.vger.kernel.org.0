Return-Path: <linux-media+bounces-33980-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D488ACC314
	for <lists+linux-media@lfdr.de>; Tue,  3 Jun 2025 11:32:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D272F3A5131
	for <lists+linux-media@lfdr.de>; Tue,  3 Jun 2025 09:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1836028135F;
	Tue,  3 Jun 2025 09:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h3OdthMY"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C4B1F583D;
	Tue,  3 Jun 2025 09:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748943116; cv=none; b=QZRWUvDi+Ydaf3rIEzWHdeMzeZM/i+QsrYuBNyeOc99XGydFhWznRKcAydcLJ/Bk7SxJ38LALNsRQSevBBkNijtnHKJafPCOgTRVitBDLLVEq4ezBG8C7ERXSUOK92cZztSEleAnm483D7Kt9gBwHlq/snbOwlC2RVlclZL674o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748943116; c=relaxed/simple;
	bh=NeI11bo1EpvzZ96f+dx/8BGkkc1I9vz5CC22goQdva4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TmyY/rvTfong+EsPg3z8WAHzpesS4tS+/vETuuLZ0TqkUKWkDC4PcKz4rxECodW8BofMdMbjN+J7nxk6P1QO9P6+m6rgi0es3Gt6fswYHVlD7y87JEeHXiqGu6Homb7WPqgz9WQMIF3kkVJVV794UVQvmjBnYLlEf+fPDuuNj0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h3OdthMY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAA01C4CEED;
	Tue,  3 Jun 2025 09:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748943115;
	bh=NeI11bo1EpvzZ96f+dx/8BGkkc1I9vz5CC22goQdva4=;
	h=From:To:Cc:Subject:Date:From;
	b=h3OdthMYGcN65/9QIDtIr68la5NKp/xISlIPDjcRADB4wcBcYrMurYTauqIL6pYns
	 KfvfgGNsxWv9Ju/0R7JPEWM05zIin43eIol6obEUp5R8B2CPuPPoBLzADHSAxLVL5P
	 Q7SHVC5BOe8MRnsPLSPdcmSA0950HI4Plkj5j9891hI3wn5bfPzLeU9Ktle3dTz9Xm
	 ZHAMrNS6jvA/hVti4bU2AUZ5+K9pKZp0CZfgnCeww9pU7kUWVSoTVqC5cLp+rQe3QU
	 C6iSfeVdHPG00ReajIphii6S9cPj/npVzE4GE0FEuh/dkUBuc5bpm5hoJSCgMfgViI
	 bPbolon0JprqA==
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
Subject: [RFC PATCH 0/6] drm/sched: Avoid memory leaks by canceling job-by-job
Date: Tue,  3 Jun 2025 11:31:25 +0200
Message-ID: <20250603093130.100159-2-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An alternative version to [1], based on Tvrtko's suggestion from [2].

I tested this for Nouveau. Works.

I'm having, however, bigger problems properly porting the unit tests and
have seen various explosions. In the process I noticed that some things
in the unit tests aren't right and a bit of a larger rework will be
necessary (for example, the timedout job callback must signal the
timedout fence, remove it from the list and so on).

Anyways. Please comment on the general idea.

@Tvrtko: As briefly brainstormed about on IRC, if you'd be willing to
take care of the unit tests patch, I could remove that one (and,
maaaaybe, the warning print patch) from the series and we could merge
this RFC's successor version %N once it's ready. What do you think?

P.

[1] https://lore.kernel.org/dri-devel/20250522082742.148191-2-phasta@kernel.org/
[2] https://lore.kernel.org/dri-devel/20250418113211.69956-1-tvrtko.ursulin@igalia.com/

Philipp Stanner (6):
  drm/sched: Avoid memory leaks with cancel_job() callback
  drm/sched/tests: Implement cancel_job()
  drm/sched: Warn if pending list is not empty
  drm/nouveau: Make fence container helper usable driver-wide
  drm/nouveau: Add new callback for scheduler teardown
  drm/nouveau: Remove waitque for sched teardown

 drivers/gpu/drm/nouveau/nouveau_fence.c       | 35 +++++----
 drivers/gpu/drm/nouveau/nouveau_fence.h       |  7 ++
 drivers/gpu/drm/nouveau/nouveau_sched.c       | 35 +++++----
 drivers/gpu/drm/nouveau/nouveau_sched.h       |  9 +--
 drivers/gpu/drm/nouveau/nouveau_uvmm.c        |  8 +--
 drivers/gpu/drm/scheduler/sched_main.c        | 37 ++++++----
 .../gpu/drm/scheduler/tests/mock_scheduler.c  | 71 +++++++------------
 drivers/gpu/drm/scheduler/tests/sched_tests.h |  4 +-
 include/drm/gpu_scheduler.h                   |  9 +++
 9 files changed, 115 insertions(+), 100 deletions(-)

-- 
2.49.0


