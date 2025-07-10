Return-Path: <linux-media+bounces-37325-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E48B00624
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:13:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2ED935C360D
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 15:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 338DC27466D;
	Thu, 10 Jul 2025 15:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="seWBBlm9"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EE214A60F;
	Thu, 10 Jul 2025 15:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752160330; cv=none; b=nUMKPV+3yf8yehtFbpuX5g8QAGYnwSiN4NXwOwD6Zu4wSrVeYI6lTZ8NGc0iUgcjkgHkpd+7ErwQN3FTdZTov7xhJjNQD6GYSoB6vGJXVNyaMSzysktnWFviDGjK9cT0mGaNUiH8yVBgPuMtcehv2IBtTsxlI1DF5oKvdvc24DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752160330; c=relaxed/simple;
	bh=8a6CBOKhPIyH24xt7AaX6qplNBfoOrI4hf0FBujJDRw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lb3Msna42/k9qPvSk6XjQSKC5mKLZ7AUWQtsIZAUGxtfPOqxntA3oyRa5SmHxsC6UW9AMVTBV0s6VtBxK63ug5EGUfJ5WOYCOL28UFrEOVwIr03SNbjvtqZU/GT9dnOJ6OJCY8PCfcxSv4WCWB+OEhXgiQEmks1PxUEtCOK82PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=seWBBlm9; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4bdJGr6fcCz9t3p;
	Thu, 10 Jul 2025 17:12:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1752160325; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8a6CBOKhPIyH24xt7AaX6qplNBfoOrI4hf0FBujJDRw=;
	b=seWBBlm9HM/1XHghbgmmDne+xfaEPW/l2j5x0R8cfMi8T57g7nxCyH4cqJhlEa/+Zlvcul
	eCobsslJoDrTn200xlNSccbSrkB83lZFfh8IVc4Nckq5Sr4bErNGC3HA4887PPZTzWZYSe
	SHlpLKwOneUezNU7NHmTv9qfBp45OBZclmfJ6/GpnSJ8c8YK4otGSGjJZRBK/Fcr5QiJN1
	V4GIPXF16cq4n0d3l2EWqNv8QIawIRtc0j6av5hZAqwSw/15uW9Oe2atuKnFkDFakXfH4Z
	Jjzpy+iikc0986YoinAoUMndgaQdG+6TbLtqWcFAgpYi1l0sh5pHB0SXpXoaiA==
Message-ID: <18f514ef3a61c877bc80f403db67a2106f4bdd44.camel@mailbox.org>
Subject: Re: [PATCH v4 0/8] drm/sched: Fix memory leaks with cancel_job()
 callback
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Philipp Stanner <phasta@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
  David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matthew
 Brost <matthew.brost@intel.com>,  Christian =?ISO-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>,  Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Date: Thu, 10 Jul 2025 17:11:58 +0200
In-Reply-To: <20250710125412.128476-2-phasta@kernel.org>
References: <20250710125412.128476-2-phasta@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 5c40c1a7c2a9a3dbc09
X-MBO-RS-META: 1nps9qp9r8sikmsso7bmcbxeyzd9bro1

On Thu, 2025-07-10 at 14:54 +0200, Philipp Stanner wrote:
> Changes in v4:
> =C2=A0 - Change dev_err() to dev_warn() in pending_list emptyness check.
>=20
> Changes in v3:
> =C2=A0 - Remove forgotten copy-past artifacts. (Tvrtko)
> =C2=A0 - Remove forgotten done_list struct member. (Tvrtko)
> =C2=A0 - Slightly adjust commit message of patch 7.
> =C2=A0 - Add RBs. (Maira, Danilo, Tvrtko)
>=20
> Changes in v2:
> =C2=A0 - Add new unit test to test cancel_job()'s behavior. (Tvrtko)
> =C2=A0 - Add RB from Ma=C3=ADra
>=20
> Changes since the RFC:
> =C2=A0 - Rename helper function for drm_sched_fini(). (Tvrtko)
> =C2=A0 - Add Link to Tvrtko's RFC patch to patch 1.
>=20
>=20
> Since a long time, drm_sched_fini() can leak jobs that are still in
> drm_sched.pending_list.
>=20
> This series solves the leaks in a backwards-compatible manner by
> adding
> a new, optional callback. If that callback is implemented, the
> scheduler
> uses it to cancel all jobs from pending_list and then frees them.
>=20
> Philipp Stanner (8):
> =C2=A0 drm/panfrost: Fix scheduler workqueue bug
> =C2=A0 drm/sched: Avoid memory leaks with cancel_job() callback
> =C2=A0 drm/sched/tests: Implement cancel_job() callback
> =C2=A0 drm/sched/tests: Add unit test for cancel_job()
> =C2=A0 drm/sched: Warn if pending_list is not empty
> =C2=A0 drm/nouveau: Make fence container helper usable driver-wide
> =C2=A0 drm/nouveau: Add new callback for scheduler teardown
> =C2=A0 drm/nouveau: Remove waitque for sched teardown
>=20
> =C2=A0drivers/gpu/drm/nouveau/nouveau_fence.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 35 ++++++----
> =C2=A0drivers/gpu/drm/nouveau/nouveau_fence.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 7 ++
> =C2=A0drivers/gpu/drm/nouveau/nouveau_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 35 ++++++----
> =C2=A0drivers/gpu/drm/nouveau/nouveau_sched.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 9 +--
> =C2=A0drivers/gpu/drm/nouveau/nouveau_uvmm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 8 +--
> =C2=A0drivers/gpu/drm/panfrost/panfrost_job.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 37 ++++++----
> =C2=A0.../gpu/drm/scheduler/tests/mock_scheduler.c=C2=A0 | 68 +++++++----=
------
> --
> =C2=A0drivers/gpu/drm/scheduler/tests/sched_tests.h |=C2=A0 1 -
> =C2=A0drivers/gpu/drm/scheduler/tests/tests_basic.c | 42 ++++++++++++
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 18 =
+++++
> =C2=A011 files changed, 167 insertions(+), 95 deletions(-)
>=20


Pushed to drm-misc-next, with an RB from Tvrtko I had forgot, and
without the misplaced panfrost patch.

Thanks guys. Good to see that we finally solved this issue. Had been
around for quite some time. We celebrate that with a beer or sth at XDC
:)


P.


