Return-Path: <linux-media+bounces-66186-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Uu5YAYLfRGrJ2QoAu9opvQ
	(envelope-from <linux-media+bounces-66186-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 11:36:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DF36EBA48
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 11:36:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=igalia.com header.s=20170329 header.b=dbi780vP;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66186-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-66186-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=igalia.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B37CE300E149
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 09:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF25A3F8ED8;
	Wed,  1 Jul 2026 09:34:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006433B52FA
	for <linux-media@vger.kernel.org>; Wed,  1 Jul 2026 09:34:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782898497; cv=none; b=Ja2ct25Fcf7iaY4yOtNegHVi+tQ4P1zbWsT8HIMaF1sXzL5K7n6wrJ/4wpb+bLxlGiTBZOgkID01/hDsy6Pqb7O4rSj2U9AjS4S1q8mj98Je3Ufkbc7mgS4CfVz8PNvTdcH1Abf1yIaJC0uda2O/PGtciwxJWpgbGTUvvYqEzDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782898497; c=relaxed/simple;
	bh=ZFL0Apd5XBnLh5UdRzNzez9OcXQm/fJMhGQRfABaCXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T5Qd/RR6e508h5tkkUxPgmiQCoH5c15X98zUVF2IOBYXJjOhoMwyeNyhMCZRpCgUlho1VlipZ52z2psEIJzs/3rFNdpQ+024XzemBcPMliKtWndf7DgCF3JN1xb+tnPFYwEBgmAbn9/7E9P+k/Ok5G2h9x7PgCItRJTtgxrE0So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=dbi780vP; arc=none smtp.client-ip=213.97.179.56
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rkkSHqFyVp2fyO4zhsA5xQzb55y8BJkjvdnC/dmJ7zc=; b=dbi780vPfR0drg5RINie+jGdE8
	mPUp0ueEEct0j7NBYL3UhDqKkYfe2YaMuIxqwEOxjArdH8Xrp0y7zU87XrjLzuGj/DmzjxtiiHJ4M
	C/aVrhTiYUY7+lVh6c1S21eH10NRgaVfDDvMC08qcBVzm2KKNgiUSORgS4Lprapx5jrVYQOZwRCOD
	c4/M7VPv7iD295rCgrQOi7LEj1iKRJmhE0yo5Qdc5MRFlfIXHBasyQFPzpSPkGCUovtKt0JfEIOg+
	9iGIAj/uPDd3O42m84Joma9507V1pkiT9KPJkMQ3bcLUZzZ3A2onS8RrsCmRURUl37SLn98eXS9kp
	UzGKhNaQ==;
Received: from [90.240.106.137] (helo=[192.168.0.116])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1werLE-007Ufe-6F; Wed, 01 Jul 2026 11:34:48 +0200
Message-ID: <65d4d6dd-a526-409e-96b7-e9a71ed47f23@igalia.com>
Date: Wed, 1 Jul 2026 10:34:47 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] drm/sched: use dma_fence_test_signaled_flag()
To: christian.koenig@amd.com, phasta@kernel.org, simona@ffwll.ch,
 sumit.semwal@linaro.org, dakr@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20260624122917.2483-1-christian.koenig@amd.com>
 <20260624122917.2483-6-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20260624122917.2483-6-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[igalia.com:-];
	TAGGED_FROM(0.00)[bounces-66186-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[tvrtko.ursulin@igalia.com,linux-media@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:phasta@kernel.org,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:dakr@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,igalia.com:email,igalia.com:mid,igalia.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 16DF36EBA48


On 24/06/2026 12:13, Christian König wrote:
> Instead of dma_fence_is_signaled_locked() use
> dma_fence_test_signaled_flag().
> 
> No functional difference the mock HW fence has no signaled callback
> anyway.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/scheduler/tests/mock_scheduler.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> index 14403a762335..82dce344bfa1 100644
> --- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> +++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> @@ -224,7 +224,7 @@ mock_sched_timedout_job(struct drm_sched_job *sched_job)
>   	}
>   
>   	spin_lock_irqsave(&sched->lock, flags);
> -	if (!dma_fence_is_signaled_locked(&job->hw_fence)) {
> +	if (!dma_fence_test_signaled_flag(&job->hw_fence)) {
>   		list_del(&job->link);
>   		job->flags |= DRM_MOCK_SCHED_JOB_TIMEDOUT;
>   		dma_fence_set_error(&job->hw_fence, -ETIMEDOUT);
> @@ -258,7 +258,7 @@ static void mock_sched_cancel_job(struct drm_sched_job *sched_job)
>   	hrtimer_cancel(&job->timer);
>   
>   	spin_lock_irqsave(&sched->lock, flags);
> -	if (!dma_fence_is_signaled_locked(&job->hw_fence)) {
> +	if (!dma_fence_test_signaled_flag(&job->hw_fence)) {
>   		list_del(&job->link);
>   		dma_fence_set_error(&job->hw_fence, -ECANCELED);
>   		dma_fence_signal_locked(&job->hw_fence);

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko


