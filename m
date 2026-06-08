Return-Path: <linux-media+bounces-64160-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qwW5F/6FJmo8YAIAu9opvQ
	(envelope-from <linux-media+bounces-64160-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 11:06:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA436545FC
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 11:06:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="ADNrHD/o";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64160-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64160-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DA0C7304DACF
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 08:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 739AB3B14B2;
	Mon,  8 Jun 2026 08:50:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DD73B14A1
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 08:50:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780908644; cv=none; b=g3Xe8jtEFzRYWh9hSxpHt/WFX/HBm3j5g6Q18AkiG6QRDyf9OSye/B/a03tcAKKNh8iNwvbIZmpuJFh4sWWYdx01KO8rEu6L1Bh8vWhqdP7kC8nI6xe0a7g4YkUgDC6Ilk6uXPQRRbTz/E6U51O2oIo9BrfbH7avqS+TEsjHCQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780908644; c=relaxed/simple;
	bh=+43Y9DUb5IA7S9cRQ7DPq7d1CswQr6rsS5nQ4LMa1xw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c80Pk7tdYRqaTV5MFKDS5vcyDgwE6Gri44I2xJACjPxqtxW9yP7ACcym0QVeBLfit/PffrDTP+pG2/AuoBW091a6B6o7KY043/cx9jdGMICj2S04bZM5FP/bmnGl5NirbW+nRzOYBmIIipo/6J2p1ITs5Qjrsllp38eWq9X46dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ADNrHD/o; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 688141F00893;
	Mon,  8 Jun 2026 08:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780908643;
	bh=BJF0y6xWfvpmDUzHhswGd2EIqoyTRaj3U3VOes97wCE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ADNrHD/o+jHirE7w1H6ltfNFUqLzxkeLiIyZ1ox6cBpqzfFSvQcg/KNPqDCTJypDx
	 uk6RUvOns/x7kWSlze87TbwUnVXH6er9JNjG/i21s4PaZ7h3dUq01E/bpjVnKZOqUQ
	 fJwcJl3HZABmcpkK4PVSZL+PX7W1sLPNcv3Bzfzcd9mpdVg4z9uSGuPci2aKzQWjr5
	 eqd2k2r3P51m5tzh+G6zzefWtz5n2eReGI9pFFHdwOjFF8lME6pBTza81Ltge5aRrV
	 KneXyOriH3YWnpz/t/C6fTsYOE32N6IIrNLK7T/5qI/sNXmSnpF4TP5wze4I5yMpdI
	 exCaPQ4rEDpZw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] accel/rocket: Fix dma_fence reference leak on error
 paths in rocket_job_run()
Reply-To: sashiko-reviews@lists.linux.dev
To: ZhaoJinming <zhaojinming@uniontech.com>
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
In-Reply-To: <20260608083824.775261-1-zhaojinming@uniontech.com>
References: <20260608083824.775261-1-zhaojinming@uniontech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 08:50:43 +0000
Message-Id: <20260608085043.688141F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-64160-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zhaojinming@uniontech.com,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,smtp.kernel.org:mid,lists.linux.dev:replyto,uniontech.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8AA436545FC

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The `pm_runtime_get_sync()` error path fails to decrement the runt=
ime PM usage counter, permanently leaking the reference.
- [High] Returning an unsignaled dma_fence instead of an error pointer on j=
ob submission failure triggers a kernel WARN.
--

commit f0df2d483139ad216e9d43923cbf9543a8f4e81c
Author: ZhaoJinming <zhaojinming@uniontech.com>

accel/rocket: Fix dma_fence reference leak on error paths in rocket_job_run=
()

In rocket_job_run(), after creating a fence at line 305 and taking an
extra reference for job->done_fence at line 311 via dma_fence_get(),
two error paths fail to release that extra reference before returning.

> diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/roc=
ket_job.c
> index 2f1861f960ccb..fc10703534e37 100644
> --- a/drivers/accel/rocket/rocket_job.c
> +++ b/drivers/accel/rocket/rocket_job.c
> @@ -311,12 +311,19 @@ static struct dma_fence *rocket_job_run(struct drm_=
sched_job *sched_job)
>  	job->done_fence =3D dma_fence_get(fence);
> =20
>  	ret =3D pm_runtime_get_sync(core->dev);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		dma_fence_put(job->done_fence);
> +		job->done_fence =3D NULL;

[Severity: High]
This is a pre-existing issue, but does this error path permanently leak the
runtime PM usage counter?=20

pm_runtime_get_sync() increments the device's usage counter before attempti=
ng
to resume the device. If the resume fails, it returns a negative error code
but the usage counter remains incremented.=20

Without explicitly dropping this usage counter (e.g., using
pm_runtime_put_noidle()), could repeated failures prevent the NPU from ever
suspending again?

>  		return fence;

[Severity: High]
This is also a pre-existing issue, but will returning the valid, unsignaled
fence instead of ERR_PTR(ret) trigger a kernel WARN?

Since the hardware wasn't submitted, the fence refcount immediately hits 0
after the DRM scheduler drops its initial reference. dma_fence_release()
detects pending callbacks on an unsignaled fence and triggers a loud kernel
WARN(1, "Fence ... released with pending signals!\n"), forcibly signaling it
with -EDEADLK.

Should this path destroy the fence and return ERR_PTR(ret) so the scheduler
cleanly aborts the job?

> +	}
> =20
>  	ret =3D iommu_attach_group(job->domain->domain, core->iommu_group);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		pm_runtime_put(core->dev);
> +		dma_fence_put(job->done_fence);
> +		job->done_fence =3D NULL;
>  		return fence;

[Severity: High]
This is a pre-existing issue, but similar to the above, does returning the
unsignaled fence here instead of ERR_PTR(ret) cause the same DRM scheduler
WARN when the fence is released?

> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608083824.7752=
61-1-zhaojinming@uniontech.com?part=3D1

