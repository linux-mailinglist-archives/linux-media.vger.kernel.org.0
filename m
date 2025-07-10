Return-Path: <linux-media+bounces-37290-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B279B0029C
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 14:55:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DAB91C40866
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 12:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A5992DD5EF;
	Thu, 10 Jul 2025 12:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gJzUOiWd"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AAD25F976;
	Thu, 10 Jul 2025 12:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752152085; cv=none; b=CnvzFcspCDHu9g7DoS1trLFnMnKGBK7jl7MY1X3G/vaPpFrvTKPSfaVMRRyrVdBoPpK6kqs0dld1ASQmkQxU85AQCqAkYp7MM65W5JoVoVq0wmPeQWR6Rd+5f+El+RJAXHeM8/QPRThv+fb2KTWCsC8tA5Cgw6ZaSWyA7hUPKK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752152085; c=relaxed/simple;
	bh=i/0vpVLwuNfJONVWKkjXsF93uf5k77Dhi7/RFzvBlmA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JgeYWnHcX7gU2Bd3CLkChAezDcF3WpMan7yFUYCPk7kA4zDw2ZPOGGPI02p5O6UteCnyZkcQl2dOFBbn0459OZJ9csVkrG44M8Ovt7g/3hW972jARKyLaRYI9HBo3ezlDRKuli1aSEDYByvFJyT9+2bN4bK8vBfhmMuXUIUFOtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gJzUOiWd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFB35C4CEE3;
	Thu, 10 Jul 2025 12:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752152084;
	bh=i/0vpVLwuNfJONVWKkjXsF93uf5k77Dhi7/RFzvBlmA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gJzUOiWd8E3pBXC8cpjS4J0szEVAHNJNQpS53g+507dFZISXIX34Sx1MNwXv1ve72
	 t6IVsrauk6WVyr0fDRuHcxYI/wFNBWJ2NgT3Oy/Bp9Hzi+7u3L6ouafZ4qidq7uQXA
	 F37LeT+QX59pI7IV29y9f24Eep6L/G0KNTFHxy55YLbzH0p4UQbg9+9I0SLUOTGvbR
	 +Q3k0N/Nt+vgP/KwEiFmiodElP8bN2oKyBb6nh2vmxELY+rQpy+TG8kR+qHKQi+3ll
	 dqDtE2hCmXc4G+iCcWo1usPGL2kQAqlcTqiIQPM1A7RIO15r78JttiDbQY/YSrWp8n
	 OfDE+MUSrM6hA==
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
Subject: [PATCH v4 4/8] drm/sched/tests: Add unit test for cancel_job()
Date: Thu, 10 Jul 2025 14:54:08 +0200
Message-ID: <20250710125412.128476-6-phasta@kernel.org>
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

The scheduler unit tests now provide a new callback, cancel_job(). This
callback gets used by drm_sched_fini() for all still pending jobs to
cancel them.

Implement a new unit test to test this.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/scheduler/tests/tests_basic.c | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c b/drivers/gpu/drm/scheduler/tests/tests_basic.c
index 7230057e0594..b1ae10c6bb37 100644
--- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
+++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
@@ -204,6 +204,47 @@ static struct kunit_suite drm_sched_basic = {
 	.test_cases = drm_sched_basic_tests,
 };
 
+static void drm_sched_basic_cancel(struct kunit *test)
+{
+	struct drm_mock_sched_entity *entity;
+	struct drm_mock_scheduler *sched;
+	struct drm_mock_sched_job *job;
+	bool done;
+
+	/*
+	 * Check that drm_sched_fini() uses the cancel_job() callback to cancel
+	 * jobs that are still pending.
+	 */
+
+	sched = drm_mock_sched_new(test, MAX_SCHEDULE_TIMEOUT);
+	entity = drm_mock_sched_entity_new(test, DRM_SCHED_PRIORITY_NORMAL,
+					   sched);
+
+	job = drm_mock_sched_job_new(test, entity);
+
+	drm_mock_sched_job_submit(job);
+
+	done = drm_mock_sched_job_wait_scheduled(job, HZ);
+	KUNIT_ASSERT_TRUE(test, done);
+
+	drm_mock_sched_entity_free(entity);
+	drm_mock_sched_fini(sched);
+
+	KUNIT_ASSERT_EQ(test, job->hw_fence.error, -ECANCELED);
+}
+
+static struct kunit_case drm_sched_cancel_tests[] = {
+	KUNIT_CASE(drm_sched_basic_cancel),
+	{}
+};
+
+static struct kunit_suite drm_sched_cancel = {
+	.name = "drm_sched_basic_cancel_tests",
+	.init = drm_sched_basic_init,
+	.exit = drm_sched_basic_exit,
+	.test_cases = drm_sched_cancel_tests,
+};
+
 static void drm_sched_basic_timeout(struct kunit *test)
 {
 	struct drm_mock_scheduler *sched = test->priv;
@@ -471,6 +512,7 @@ static struct kunit_suite drm_sched_credits = {
 
 kunit_test_suites(&drm_sched_basic,
 		  &drm_sched_timeout,
+		  &drm_sched_cancel,
 		  &drm_sched_priority,
 		  &drm_sched_modify_sched,
 		  &drm_sched_credits);
-- 
2.49.0


