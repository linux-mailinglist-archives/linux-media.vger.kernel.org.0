Return-Path: <linux-media+bounces-63083-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNkEAbAzGmrQ2AgAu9opvQ
	(envelope-from <linux-media+bounces-63083-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 02:47:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A009660A50B
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 02:47:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1DD4730448CF
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 00:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 922F925DB12;
	Sat, 30 May 2026 00:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DnEAAmHN"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FA354654;
	Sat, 30 May 2026 00:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780101998; cv=none; b=iYsNit4gDwo9Z9h3/LmT3ajdg9WMdlUmqHcFsQgNCv6JNV2kEMdEEdNkvy7bZvF8pq5eghSeveTqO/myzvG2gozpZwtcLXgYOiKgYWl3IWX80VIL0qzHZCUQsVmzG1cu7h7SKW6qzkE9naI++0gDbc0H5yQ0WVFCLR8Q0Rq4PV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780101998; c=relaxed/simple;
	bh=kOmFjtpC9/R+kEeqYG//3O25433MBu8DP2Zxz8bmhig=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=S0LCZXjW+Pgo0e1sjo3dgl44VfryTJiVP0aww1z8I9ZxhztIjezdJqXjSxrqC2AGC3tikfMWaP/gSPel3KUhq4RayrdKh2nAK6DQtMUD7NMB3OEi5qvbGhBT0lEfzB3r+rxVmegvt4wbmyZ+IkDqUM4nqayNxPM7BOJr0Ve3Vd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DnEAAmHN; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5148E1F00893;
	Sat, 30 May 2026 00:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780101996;
	bh=533/3oFyYSpSGqlnSirtZGQYDafCOZ3wVqKbj6yE2UM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DnEAAmHNI59wyybljb65r2y7BmKZVB2dTbzNAbAiDzmgIf2zoFlsSp4fsZ0h4PPsa
	 dodrThktD7cgxS5OUxPbS9BkKX5/IX7chqJQJc/FVALHKQfUf8a9CcDPVIhVHFpjJW
	 nn9cH4eG/oK501mMJXHqNK6e0a10Zig3MSO1Z9qE/y0iBILYyydJGTyn1Np0Ao7UD1
	 q1H3A4let3WhwdrFAKLelFKq5x/NKVpvSuzRKeZ6VdgT+Tr7LGiAhBi1EUY8HtVEOo
	 qvxUzlWx/Y0q4BV3I+r8unMZe2P4YJeqIHNqIqSkaCtLJszSSxry5pWu4Ihki0JGFu
	 kRtwdlcZRvVcg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 07/15] remoteproc: qcom_wcnss: Switch to generic PAS
 TZ APIs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sumit Garg" <sumit.garg@kernel.org>
Cc: linux-media@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260522115936.201208-8-sumit.garg@kernel.org>
References: <20260522115936.201208-8-sumit.garg@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:46:36 +0000
Message-Id: <20260530004636.5148E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,smtp.kernel.org:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,lists.linux.dev:replyto,sashiko.dev:url];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-63083-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Queue-Id: A009660A50B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Critical] Unprotected TOCTOU access to global `ops_ptr` in generic PAS A=
PIs leads to NULL pointer dereferences and Use-After-Free.

Pre-existing issues:
- [High] Completions for start and stop are never reinitialized, allowing t=
imeout bypasses on subsequent invocations.
- [High] Missing cleanup for subdevices in probe error paths causes memory =
leaks and Use-After-Free.
- [High] Teardown order race between remote processor deletion and `qcom_ir=
is_remove` leads to Use-After-Free.
--

commit 80efe0b8dcbb3151eed7aafe4657b7e7ff7746b9
Author: Sumit Garg <sumit.garg@oss.qualcomm.com>

remoteproc: qcom_wcnss: Switch to generic PAS TZ APIs
   =20
This commit switches the qcom_wcnss client driver over to use the generic P=
AS
TZ APIs instead of the qcom_scm APIs directly. This change allows the driver
to support multiple TrustZone implementation backends.

> diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wc=
nss.c
> index 4add9037dbd5a..0dbdd18ab3dd9 100644
> --- a/drivers/remoteproc/qcom_wcnss.c
> +++ b/drivers/remoteproc/qcom_wcnss.c
[ ... ]
> @@ -257,7 +257,7 @@ static int wcnss_start(struct rproc *rproc)
>  	wcnss_indicate_nv_download(wcnss);
>  	wcnss_configure_iris(wcnss);
> =20
> -	ret =3D qcom_scm_pas_auth_and_reset(WCNSS_PAS_ID);
> +	ret =3D qcom_pas_auth_and_reset(WCNSS_PAS_ID);

[Severity: Critical]
Does this new generic API introduce an unprotected time-of-check to
time-of-use race condition?

Looking at the generic PAS framework, the global ops_ptr is checked for
NULL and subsequently dereferenced without locking or module reference
counting.

If the PAS provider module is unbound or unloaded concurrently, could
ops_ptr become NULL between the check and the dereference?

Furthermore, even if ops_ptr is not NULL during the check, could the
provider module be unloaded, causing ops_ptr->supported to point to
unmapped memory and ops_ptr->dev to be freed?

Could this lead to a use-after-free crash?

>  	if (ret) {
>  		dev_err(wcnss->dev,
>  			"failed to authenticate image and release reset\n");
> @@ -269,7 +269,7 @@ static int wcnss_start(struct rproc *rproc)
>  	if (wcnss->ready_irq > 0 && ret =3D=3D 0) {
>  		/* We have a ready_irq, but it didn't fire in time. */
>  		dev_err(wcnss->dev, "start timed out\n");
> -		qcom_scm_pas_shutdown(WCNSS_PAS_ID);
> +		qcom_pas_shutdown(WCNSS_PAS_ID);

[Severity: High]
This is a pre-existing issue, but does this timeout path properly reset the
completion for future invocations?

In wcnss_start() and wcnss_stop(), the code waits for the start_done and
stop_done completions using wait_for_completion_timeout().

If a timeout occurs, the completion's internal counter is not decremented.
If the hardware later triggers the interrupt, complete() increments the
counter.

Since reinit_completion() is never called before initiating a new operation,
will subsequent calls to wait_for_completion_timeout() return immediately
instead of waiting for the hardware, bypassing synchronization entirely?

>  		ret =3D -ETIMEDOUT;
>  		goto disable_iris;
>  	}
[ ... ]
> @@ -557,10 +557,10 @@ static int wcnss_probe(struct platform_device *pdev)
> =20
>  	data =3D of_device_get_match_data(&pdev->dev);
> =20
> -	if (!qcom_scm_is_available())
> +	if (!qcom_pas_is_available())
>  		return -EPROBE_DEFER;
> =20
> -	if (!qcom_scm_pas_supported(WCNSS_PAS_ID)) {
> +	if (!qcom_pas_supported(WCNSS_PAS_ID)) {

[Severity: High]
This is a pre-existing issue, but does wcnss_probe() fail to clean up
subdevices in its error paths?

During probe, qcom_add_sysmon_subdev() and qcom_add_smd_subdev() are called.
The sysmon subdevice allocates memory and registers global notifiers
referencing the remoteproc.

If a subsequent step in probe fails, the error path jumps to detach_pds, wh=
ich
skips calling qcom_remove_sysmon_subdev() and qcom_remove_smd_subdev().

The parent rproc object is automatically freed by devm_rproc_alloc cleanup.

Does this leave the global sysmon notifier with a dangling pointer that will
cause a use-after-free when the notifier later fires?


[Severity: High]
This is another pre-existing issue, but is there a teardown order race
between remote processor deletion and qcom_iris_remove() that can lead
to a use-after-free?

In wcnss_remove(), qcom_iris_remove() is called before rproc_del().

rproc_del() halts the remote processor and prevents new start invocations.
Because the iris object is removed first, could a concurrent sysfs operation
invoke wcnss_start()?

wcnss_start() takes iris_lock and checks if (!wcnss->iris), but wcnss->iris
is never set to NULL after allocation in probe.

Will wcnss_start() proceed to use the removed and freed wcnss->iris object?

Should rproc_del() be called first to serialize this correctly?

>  		dev_err(&pdev->dev, "PAS is not available for WCNSS\n");
>  		return -ENXIO;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522115936.2012=
08-1-sumit.garg@kernel.org?part=3D7

