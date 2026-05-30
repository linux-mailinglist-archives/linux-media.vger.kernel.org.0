Return-Path: <linux-media+bounces-63092-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMnEEJ00Gmp+2AgAu9opvQ
	(envelope-from <linux-media+bounces-63092-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 02:51:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D145E60A730
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 02:51:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 46E2F30EF663
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 00:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A84C054654;
	Sat, 30 May 2026 00:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SeXxKFhD"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AF624DD17;
	Sat, 30 May 2026 00:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780102004; cv=none; b=gTQhECvnJxkOG475Jpsn5CTIsB+jgpqmmnEtrgUsQ74iirAy2aNc2T8/NOC/Y8z/ZC9+A5Am7Zk+fX4lvYdelbXCzkhOj+kIwNVY4966kfRtBmYIGuLKoWvkVcSxMqmYwgjpVSshAbU4YshNSR6EGQld94bRLibc4mSTcC8hZAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780102004; c=relaxed/simple;
	bh=sCV2DHwhFdkiiiRA7HJNPeW1eSC+qpVOJKlBzMntA0s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qW5/rKDNmRjnOYTBZ4HKcAMJM3HVunZmMV+P0l6WQ1/T7NdUG3mD7y0yMNxe2QS2yWsr5X5sHhpuCMCbucItFpwijTV1ofsOjuhmxncPudfkb1jN/Z021hO8nXd7MAFTFwMwdex12EomXQO5x3/tr3L/M/E5l6lMLIBhj0HaIxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SeXxKFhD; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B9861F00899;
	Sat, 30 May 2026 00:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780102002;
	bh=KhROBa3nVsOBfkGzH0cmF0wstosAaOoimdaardAAbcE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SeXxKFhD3HbwZ2VH13u+LyfIbXDw72q3DeJBUnsdHSlpx0RWnYqktySq0emaS5gKf
	 98FjiZb7/TYgHLfGeWJ7A1LnEvT6rN/WYbGx4BKmX2KCS2AhrYKEG8fM5/lTcSsWiS
	 wg8hIYNre6BQAR+OW6XRGN06wmGVZJuS8n+5qGXDw57BqFZio+kCWHWvEToaFxVsWA
	 oQeUPwpDoPcDCAmnz+s8ZCuGHkS9B4LzkhGkfbdt0R5go01E6LQOkBdFBXr3iZdQ7x
	 W3ZI/5o8Xejr6hwhAkwRJ6KzkcRx5OO5ffpiRJ0WFo743lqNtaEPR1GgkXbAAyAACz
	 WH5fozfLGMfvA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 12/15] net: ipa: Switch to generic PAS TZ APIs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sumit Garg" <sumit.garg@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-media@vger.kernel.org
In-Reply-To: <20260522115936.201208-13-sumit.garg@kernel.org>
References: <20260522115936.201208-13-sumit.garg@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:46:42 +0000
Message-Id: <20260530004642.7B9861F00899@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,sashiko.dev:url,lists.linux.dev:replyto,qualcomm.com:email];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-63092-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: D145E60A730
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Switching to the generic PAS TZ API introduces Time-Of-Check to Ti=
me-Of-Use (TOCTOU) races and potential NULL pointer dereferences or Use-Aft=
er-Free vulnerabilities due to lack of synchronization in the generic PAS s=
ubsystem.

Pre-existing issues:
- [High] An integer overflow vulnerability in the MDT firmware segment boun=
dary check allows a maliciously crafted firmware file to cause a heap buffe=
r overflow.
--

commit f6c9cf680dc7b363a71ec6ed34880a3cb8222b90
Author: Sumit Garg <sumit.garg@oss.qualcomm.com>
net: ipa: Switch to generic PAS TZ APIs

This commit switches the ipa client driver over to generic PAS TZ APIs. It
allows support for multiple TZ implementation backends by replacing direct
qcom scm calls with generic pas service calls.

> diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
> --- a/drivers/net/ipa/ipa_main.c
> +++ b/drivers/net/ipa/ipa_main.c
> @@ -624,10 +624,13 @@ static int ipa_firmware_load(struct device *dev)
[ ... ]
>  	ret =3D qcom_mdt_load(dev, fw, path, IPA_PAS_ID, virt, phys, size, NULL=
);

[Severity: High]
This is a pre-existing issue, but is there an integer overflow risk in the
underlying firmware loader being called here?

When calling into the mdt loading routines, the boundary check in
qcom_mdt_load_no_init() evaluates:

if (offset < 0 || offset + phdr->p_memsz > mem_size)

On 32-bit architectures, since offset is ssize_t and phdr->p_memsz is u32,
could a maliciously crafted firmware file cause offset + phdr->p_memsz to
wrap around to 0?

This might bypass the check and cause a subsequent memset to write out of
bounds before the firmware is authenticated.

> -	if (ret)
> +	if (ret) {
>  		dev_err(dev, "error %d loading \"%s\"\n", ret, path);
> -	else if ((ret =3D qcom_scm_pas_auth_and_reset(IPA_PAS_ID)))
> -		dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
> +	} else {
> +		ret =3D qcom_pas_auth_and_reset(IPA_PAS_ID);

[Severity: High]
Does switching to qcom_pas_auth_and_reset() introduce a race condition
during backend module unload?

Looking at the implementation of qcom_pas_auth_and_reset(), it checks
ops_ptr and then dereferences it:

drivers/firmware/qcom/qcom_pas.c:qcom_pas_auth_and_reset() {
    if (!ops_ptr)
        return -ENODEV;

    return ops_ptr->auth_and_reset(ops_ptr->dev, pas_id);
}

If the backend module is unregistered concurrently, could ops_ptr become
null between the check and the use, leading to a null pointer dereference?

Is there any synchronization preventing the backend from disappearing while
it is being used?

> +		if (ret)
> +			dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
> +	}
> =20
>  	memunmap(virt);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522115936.2012=
08-1-sumit.garg@kernel.org?part=3D12

