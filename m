Return-Path: <linux-media+bounces-66310-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id m9hSJtMWRmp4JgsAu9opvQ
	(envelope-from <linux-media+bounces-66310-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 09:44:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D026F44F7
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 09:44:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=DEv0uzJA;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66310-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-66310-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 81FFA3033039
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 07:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24C033932CA;
	Thu,  2 Jul 2026 07:29:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD813914FA
	for <linux-media@vger.kernel.org>; Thu,  2 Jul 2026 07:29:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977373; cv=none; b=LlFa0f+G5n/WnGdhEYBUhg3M6IiiKvMaWKs0xMZZmaAXH9232iwUkmZUSO4zGwt4Bg+KrKiJpSV5EsVK1vnLJr0hzbUNrexyh2H2ck6ZGXa6CiovF0i9aEywzMz5xGG+PMbwZuNJwzb12Z4nkBUsb6YE6pK6O66VzOGGK3SmrPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977373; c=relaxed/simple;
	bh=SgaO9X871uQjQwRySMbWfB+yK9b5NwFbN4nlFWxv7SA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MM69zvI7fvJtUsOf4WnAIsgNJzh3nfEfx71Pqhcs/coIoOKONMvnunCif33qj6il6vIcApqvz2BYDwkHOL6gfrStUZ3Fer1lqp7jR89gEFX/j3iMtOEB56ayqM6HKoBmF6tiWDYV7HxR4iLpCAY2jmQrn//3Nf9ojCveOgSFopA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=DEv0uzJA; arc=none smtp.client-ip=80.241.56.152
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4grT6J0t5Fz9tFL;
	Thu,  2 Jul 2026 09:29:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782977368; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vBbebS2OwZPm7sHgbFW0Ki3IJSy/62qddr5vkTOY9Ws=;
	b=DEv0uzJASpK4GLQb5gKGSCeK8F+W1LrM6iCTDHS7JCnely+GbspAIX9Fu2hAz8FzMCQ2JW
	zd7D9WappJBc7Q6aZQBudT4En1k9yGaGADIult6h4PwCOEgQZk+02wwi1Xb33RhUo2no/p
	IAEAQlaSflUDGGugEG/LoOETP5qmKBoxU/H+zC/jMYH+sHAqmSJyLD601nN6601dwt57L7
	ygKH8dtA3wBVQzXXAM1IwoeVxY11085iAzYlfX0pXty1LyoNmKhcVJ/UEJ/hUh/gN4eNsd
	GP8df10TbufimC0KfqsAhscNxITE+w3tipUUXBHIG2K7TDbxgyEB9P22//tqLw==
Message-ID: <d1e82acdaa6b63b2e0b11d91ce244f0554f71a27.camel@mailbox.org>
Subject: Re: [PATCH 05/10] drm/sched: use dma_fence_test_signaled_flag()
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: christian.koenig@amd.com, phasta@kernel.org, simona@ffwll.ch, 
	sumit.semwal@linaro.org, tvrtko.ursulin@igalia.com, dakr@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org
Date: Thu, 02 Jul 2026 09:29:22 +0200
In-Reply-To: <20260624122917.2483-6-christian.koenig@amd.com>
References: <20260624122917.2483-1-christian.koenig@amd.com>
	 <20260624122917.2483-6-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: e9ede8f42704973847b
X-MBO-RS-META: bq4oxfcwzw3fj9ysqp93ycjj1sczxe41
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66310-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:phasta@kernel.org,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:tvrtko.ursulin@igalia.com,m:dakr@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[mailbox.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-media];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RWL_MAILSPIKE_POSSIBLE(0.00)[104.64.211.4:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mailbox.org:dkim,mailbox.org:mid,mailbox.org:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 71D026F44F7

On Wed, 2026-06-24 at 13:13 +0200, Christian K=C3=B6nig wrote:
> Instead of dma_fence_is_signaled_locked() use
> dma_fence_test_signaled_flag().
>=20
> No functional difference the mock HW fence has no signaled callback
> anyway.
>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Fine by me, but the commit message needs to be tuned up a bit, see my
other comment on this series :)


P.

> ---
> =C2=A0drivers/gpu/drm/scheduler/tests/mock_scheduler.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c b/drivers/g=
pu/drm/scheduler/tests/mock_scheduler.c
> index 14403a762335..82dce344bfa1 100644
> --- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> +++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> @@ -224,7 +224,7 @@ mock_sched_timedout_job(struct drm_sched_job *sched_j=
ob)
> =C2=A0	}
> =C2=A0
> =C2=A0	spin_lock_irqsave(&sched->lock, flags);
> -	if (!dma_fence_is_signaled_locked(&job->hw_fence)) {
> +	if (!dma_fence_test_signaled_flag(&job->hw_fence)) {
> =C2=A0		list_del(&job->link);
> =C2=A0		job->flags |=3D DRM_MOCK_SCHED_JOB_TIMEDOUT;
> =C2=A0		dma_fence_set_error(&job->hw_fence, -ETIMEDOUT);
> @@ -258,7 +258,7 @@ static void mock_sched_cancel_job(struct drm_sched_jo=
b *sched_job)
> =C2=A0	hrtimer_cancel(&job->timer);
> =C2=A0
> =C2=A0	spin_lock_irqsave(&sched->lock, flags);
> -	if (!dma_fence_is_signaled_locked(&job->hw_fence)) {
> +	if (!dma_fence_test_signaled_flag(&job->hw_fence)) {
> =C2=A0		list_del(&job->link);
> =C2=A0		dma_fence_set_error(&job->hw_fence, -ECANCELED);
> =C2=A0		dma_fence_signal_locked(&job->hw_fence);

