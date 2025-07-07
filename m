Return-Path: <linux-media+bounces-37007-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35903AFB4E7
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 15:43:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 666A817868D
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 13:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2A402BD025;
	Mon,  7 Jul 2025 13:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PKws/67E"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC672BCF4A;
	Mon,  7 Jul 2025 13:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751895764; cv=none; b=RhMol7/g2fUDhJq8yxiZYFo3EO5Ts0RaDwM8sgOdSALqAlnxXhc+flwv02bFo94a8Qg65RH12l8+bZYFN7tkllS1bcNNu6XGidVSUgxrQi2Qz0cueGHhl1u0VJv1z6l+B7dImLownTKjzUDqaLHzv2La9c8lijnTGNr80PYBrQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751895764; c=relaxed/simple;
	bh=Q7QXEZRxCNICRO2IlbnIh26kG/g8UZeXIk3BFaIKQJk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OAzA3Hlse1nxiAAo3uRtiWfLQ5KwAYrSFICZSEGYgQoemw8onXs1affgGh5vwEiojiC7VtcE0V0+moCaj15o8sX6mEX5ASd0T+uh/X7dIOj5RG7s/5vJjJtc6LiL31heNCeOUxrHJixTNPYp/gj910Iy7Eu4XdVzf1UocG3nTNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PKws/67E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3428C4CEE3;
	Mon,  7 Jul 2025 13:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751895763;
	bh=Q7QXEZRxCNICRO2IlbnIh26kG/g8UZeXIk3BFaIKQJk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PKws/67ExSqQWUmERDOLccJ/K7eEsvAYaqK3dnWLk0pIuiP55W7JTeMv9/4iQDjCI
	 6UNn2RQ6BMLnul54rD1RL8Jv4NeigznMb0x3Azsd4QzPDnUS/6KvFPQrib6rFHn3bK
	 uW8aC7fN5CtpWYlHXbgmMio2SuZ/ryD0B98q/FUiOyG8VewJKThlo8+oPqXIuSZIWo
	 ImmfdX1w93AYC/pUUNdgLgIS3IjGKq1l0f6ENMnbOqbec16kl+DawXWL/V7OAq4nwU
	 WjDnw3kUnKNI7Omr5ZfHubOKbL5ajywtA7zA76ax3NgPVOgV4FC5paLaJEap5nXZf3
	 VjVW7cqLcnjGw==
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
Subject: [PATCH v2 3/7] drm/sched/tests: Add unit test for cancel_job()
Date: Mon,  7 Jul 2025 15:42:16 +0200
Message-ID: <20250707134221.34291-5-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707134221.34291-2-phasta@kernel.org>
References: <20250707134221.34291-2-phasta@kernel.org>
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
---
 drivers/gpu/drm/scheduler/tests/tests_basic.c | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c b/drivers/gpu/drm/scheduler/tests/tests_basic.c
index 7230057e0594..fa3da2db4893 100644
--- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
+++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
@@ -204,6 +204,48 @@ static struct kunit_suite drm_sched_basic = {
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
+	 * Check that the configured credit limit is respected.
+	 */
+
+	sched = drm_mock_sched_new(test, MAX_SCHEDULE_TIMEOUT);
+	sched->base.credit_limit = 1;
+
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
@@ -471,6 +513,7 @@ static struct kunit_suite drm_sched_credits = {
 
 kunit_test_suites(&drm_sched_basic,
 		  &drm_sched_timeout,
+		  &drm_sched_cancel,
 		  &drm_sched_priority,
 		  &drm_sched_modify_sched,
 		  &drm_sched_credits);
-- 
2.49.0


