Return-Path: <linux-media+bounces-63713-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2h3kHrjOIGpd8AAAu9opvQ
	(envelope-from <linux-media+bounces-63713-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 03:02:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF78063C21B
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 03:02:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Ww3oGgjv;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63713-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63713-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3511030547CB
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 00:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F05E21CFEF;
	Thu,  4 Jun 2026 00:56:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDAA212566
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 00:56:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780534581; cv=none; b=rOim/FgtFbqbalXGoYtkDoaCnvRdi8eMv0w8VmUIufjjpSR9CYoZTEhUUIBl5oxATaLNjzKimEVe5+vU9u/GGRG72nQbfxS0THH+QRK46QCWozL+A6mvWYVAkCJpRS0Et/jW2HJ/2yayyJyhXQ0f+zuL5pTQ2/EXD4lZIQqQkF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780534581; c=relaxed/simple;
	bh=dgu/Go9VojZcG3ACDworIyWnXe/HVpBU7GVPWKRdxFQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SeTVkA1+h0KvAtp74v1Kh1zDa3J7TMMiN6pSsuCm6Kw4O55JCDYhxtqsCkoUhXggNLT+xDtEFbCGghR2JwpC8wW/iwyuiw78rQmzFrOMn2NDomxDowr2a431cXzFUiF6iPZZ68wL+lk0XtxT/+Y8mLuRxR6LMWDWUZ5QfwIogrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ww3oGgjv; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 136841F00898;
	Thu,  4 Jun 2026 00:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780534580;
	bh=6figlbj/PtGWJxENLV4h9GR/5hJzdWN+a6/sGE7myw4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ww3oGgjvx9hZkNvE4K+sg54eEufuGNvS+GmJc4jNNvdxx8DUhfhbTN0Lv2dxrlMzz
	 9GuUnjwZ+i9SkvUVcb4NfUGK6PxJO156ezfEuHWr+Qg9jvUU0QSstVtSqt3azLeGO3
	 BQ1Jj1hXzHw3DqK5ek02sCKGtQpuL2MpHCaAz5e1Ou74uwZCADXP5ZVlJZXAbt1uTh
	 Q99ic6kPVUuJRfOAg0xTVDrmDy2dLmm2yZLnwbGg9a6QZhKb30oUCSB3Wg6bqMBu/L
	 aWJSEK5kn5ZiP6eCpl0w6L9U1yVkm3zmpF5hYlk69tRscg0uxJvT9O8MqPI5URweuj
	 E/TEefWKSfLbA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] media: qcom: iris: fix runtime PM reference leaks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hungyu Lin" <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260604004404.34797-1-dennylin0707@gmail.com>
References: <20260604004404.34797-1-dennylin0707@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 00:56:19 +0000
Message-Id: <20260604005620.136841F00898@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dennylin0707@gmail.com,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-63713-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,smtp.kernel.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CF78063C21B

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Resource leak (maximum performance state vote) on PM resume error =
path.
- [High] Unconditional execution of pm_runtime_put_sync() after pm_runtime_=
resume_and_get() failure causes PM usage counter underflow.
--

commit 6abf56207cd4930a9c5add5c9255347bc4ca7e5a
Author: Hungyu Lin <dennylin0707@gmail.com>

media: qcom: iris: fix runtime PM reference leaks

Use pm_runtime_resume_and_get() in iris_enable_power_domains()
to avoid leaking a runtime PM usage count on failure.

Also ensure pm_runtime_put_sync() is always called in
iris_disable_power_domains(), even when iris_opp_set_rate()
fails, so runtime PM references remain balanced.

> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/=
media/platform/qcom/iris/iris_resources.c
> index 773f6548370a2..f5e3341e14309 100644
> --- a/drivers/media/platform/qcom/iris/iris_resources.c
> +++ b/drivers/media/platform/qcom/iris/iris_resources.c
> @@ -78,11 +78,11 @@ int iris_enable_power_domains(struct iris_core *core,=
 struct device *pd_dev)
>  	if (ret)
>  		return ret;
> =20
> -	ret =3D pm_runtime_get_sync(pd_dev);
> -	if (ret < 0)
> +	ret =3D pm_runtime_resume_and_get(pd_dev);
> +	if (ret)
>  		return ret;

[Severity: High]
This isn't a bug introduced by this patch, but does this leak the maximum
performance state vote?

In iris_enable_power_domains(), iris_opp_set_rate() is called just before
this snippet to request the maximum operating performance point. If the
subsequent call to pm_runtime_resume_and_get() fails here, we return the
error code without unwinding the OPP rate vote.

Could this leave the hardware permanently voting for maximum voltage and
frequency?

> =20
> -	return ret;
> +	return 0;
>  }

[Severity: High]
This is a pre-existing issue, but I noticed a potential problem in other
files regarding the PM usage counter underflowing when
pm_runtime_resume_and_get() fails.

In iris_core_deinit():

drivers/media/platform/qcom/iris/iris_core.c:iris_core_deinit() {
    ...
    pm_runtime_resume_and_get(core->dev);

    mutex_lock(&core->lock);
    ...
    pm_runtime_put_sync(core->dev);
    ...
}

And similarly in iris_hfi_queue_cmd_write():

drivers/media/platform/qcom/iris/iris_hfi_queue.c:iris_hfi_queue_cmd_write(=
) {
    ...
exit:
    pm_runtime_put_sync(core->dev);

    return ret;
}

Since pm_runtime_resume_and_get() automatically drops the PM usage count
internally if it fails, executing pm_runtime_put_sync() unconditionally
afterwards drops the count a second time.

Is it possible this drops the counter below its baseline and causes the
device to prematurely suspend while in use by other threads?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604004404.3479=
7-1-dennylin0707@gmail.com?part=3D1

