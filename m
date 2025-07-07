Return-Path: <linux-media+bounces-37032-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B58AFB728
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 17:21:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03F1617DB97
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 15:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EC332E266E;
	Mon,  7 Jul 2025 15:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="Hhtprq5E"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16622D9785;
	Mon,  7 Jul 2025 15:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751901662; cv=none; b=YrjI3Oh78jMSNv8tWhPEP4dXmle99vY3K5u5mLefBKSrRV1m6/omI7kgnWWkHS4UqYfMgvm94NJ2lhP3ahjLOGtRanfVs3TS4wfZOwJVZf3Mne6rhb7hBEr0vJFvzZUA5dJeD2VClXV8AuO9HOLdsbwZDEcOAxIBjUiylBKdjR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751901662; c=relaxed/simple;
	bh=MMDzTIwflD/c7ViaPINS1dRraANKxnV5iV4Y9/FiAnM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=moW4g6XH4KDSmoTIm3uiCmAmajjIpGPBaBMvd8NVgVKwxQtMS5pgBqbhi/Wx6s6IOH/UyZP1MCOv3EIedxo4Ok+MFPhVLWTZIzruJUi0YY4OTMy0EPcpGB96N96OekSRu83At9ttDd53PKbrljJuA5MeJU5LYl4oRQwdA4DMuqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=Hhtprq5E; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Zq2+ThBa+lAaOI5QZ1x0KzDEfrFEgq2eWz6RBj1v4QA=; b=Hhtprq5EbhIkcc473r6XI9FsIt
	HPcAgrYA2Xhl9aRlTYSrPcW5cn0+koJvrV7aIWpDBxzSEUcavfOdvUiMIsOYZZh+qlq4e5qEUM14A
	19h6waJK7mSkuNbH8PaPbQB9LpHZrqXpAkIEwxW+YSs37lR6LPWQqJ9I1ffA+Qkky56dsxFVago2S
	P8iceOHi56MH9KiHUSX9rMxsvgtMnScTyclY1DwxeeEOu7M9lZT2dhkZyC6BQQqWmuJovlZuyasfv
	AV2lESv+GF/JqcRn+LGiojiVinT0Bace7NC4JIG5xBtgi++YgmEyGS293I2JkTXVStHBERw64ZDDc
	sziUIqWQ==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uYndu-00DbQm-Id; Mon, 07 Jul 2025 17:20:30 +0200
Message-ID: <d4323b23-e977-4ea9-892a-78e11a2e98a9@igalia.com>
Date: Mon, 7 Jul 2025 16:20:28 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] drm/sched/tests: Add unit test for cancel_job()
To: Philipp Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20250707134221.34291-2-phasta@kernel.org>
 <20250707134221.34291-5-phasta@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250707134221.34291-5-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 07/07/2025 14:42, Philipp Stanner wrote:
> The scheduler unit tests now provide a new callback, cancel_job(). This
> callback gets used by drm_sched_fini() for all still pending jobs to
> cancel them.
> 
> Implement a new unit test to test this.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>   drivers/gpu/drm/scheduler/tests/tests_basic.c | 43 +++++++++++++++++++
>   1 file changed, 43 insertions(+)
> 
> diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c b/drivers/gpu/drm/scheduler/tests/tests_basic.c
> index 7230057e0594..fa3da2db4893 100644
> --- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
> +++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
> @@ -204,6 +204,48 @@ static struct kunit_suite drm_sched_basic = {
>   	.test_cases = drm_sched_basic_tests,
>   };
>   
> +static void drm_sched_basic_cancel(struct kunit *test)
> +{
> +	struct drm_mock_sched_entity *entity;
> +	struct drm_mock_scheduler *sched;
> +	struct drm_mock_sched_job *job;
> +	bool done;
> +
> +	/*
> +	 * Check that the configured credit limit is respected.
> +	 */

Copy & paste mishap.

> +
> +	sched = drm_mock_sched_new(test, MAX_SCHEDULE_TIMEOUT);
> +	sched->base.credit_limit = 1;

Ditto.

> +
> +	entity = drm_mock_sched_entity_new(test, DRM_SCHED_PRIORITY_NORMAL,
> +					   sched);
> +
> +	job = drm_mock_sched_job_new(test, entity);
> +
> +	drm_mock_sched_job_submit(job);
> +
> +	done = drm_mock_sched_job_wait_scheduled(job, HZ);
> +	KUNIT_ASSERT_TRUE(test, done);
> +
> +	drm_mock_sched_entity_free(entity);
> +	drm_mock_sched_fini(sched);
> +
> +	KUNIT_ASSERT_EQ(test, job->hw_fence.error, -ECANCELED);
> +}
> +
> +static struct kunit_case drm_sched_cancel_tests[] = {
> +	KUNIT_CASE(drm_sched_basic_cancel),
> +	{}
> +};
> +
> +static struct kunit_suite drm_sched_cancel = {
> +	.name = "drm_sched_basic_cancel_tests",
> +	.init = drm_sched_basic_init,
> +	.exit = drm_sched_basic_exit,
> +	.test_cases = drm_sched_cancel_tests,
> +};
> +
>   static void drm_sched_basic_timeout(struct kunit *test)
>   {
>   	struct drm_mock_scheduler *sched = test->priv;
> @@ -471,6 +513,7 @@ static struct kunit_suite drm_sched_credits = {
>   
>   kunit_test_suites(&drm_sched_basic,
>   		  &drm_sched_timeout,
> +		  &drm_sched_cancel,
>   		  &drm_sched_priority,
>   		  &drm_sched_modify_sched,
>   		  &drm_sched_credits);

The rest looks good. With the comment fixed and credit limit setting 
removed:

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko


