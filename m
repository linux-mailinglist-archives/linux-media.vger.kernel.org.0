Return-Path: <linux-media+bounces-63623-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AQm8M6xDIGrYzQAAu9opvQ
	(envelope-from <linux-media+bounces-63623-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 17:09:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDF9638F80
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 17:09:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=QK0VXbBP;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63623-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63623-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EAC3C30C7942
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 14:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEA5E33B6E8;
	Wed,  3 Jun 2026 14:36:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553202609EE;
	Wed,  3 Jun 2026 14:36:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497362; cv=none; b=E19wGYvrkRs1Tmdtj9fvxcM/TaPaAU4NtdIquhFLZ9bwCb9V1j9n4WqoiTj8KuGMy0mc76f5Y6/Ck7VLFi94JgmOi58cYA/j2kspj413+SFC7MlkcR9KHgzruqHPFwJE8LBvR5F6jjJ9TUpEbysKE4vX/au/u/0Dxx8rZygIzc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497362; c=relaxed/simple;
	bh=0U3eldf/dMterVFXl5P5sZLzmqA/wLNftK0HjOdhnz4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aPK6PGm3Z4qB1zNfpI9gI2KEtxelwO7/CePiSxCBzeY24lusETsYJjE9vpv6gTpvNGNV5kCEYfuDvdoRZ4KffavAfbOulVNA9u8wlW9WGzVu92iA1UM6cCVKMH2AZGWKNlrLG4HtqdUSoJwwgD8zZSt276x9y3/7Abr538OhkI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QK0VXbBP; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87F901F00893;
	Wed,  3 Jun 2026 14:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780497361;
	bh=UUBq+ebpi/O+cUqC0L5Pm2n1+fqhn1f1mIzSLfWzxYE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QK0VXbBPiG7/6zdd+7RywZIeDOx1DxRFOJSFzCSKlfTeyMOUlxKbcn3NnbrnITuxf
	 3Gyx38ItKZCAxZG9vkfk/OiRBce/dYfGjGo6tdzksoTTLthBtnOmUA1HXqrxlVd15l
	 f1r3vLnuHA4oUF7RTfbEbDuSxmmwIppEgQ1LM3ECi4WmmaQN+oOklrevw55TgsQYzY
	 RZEqd9i8akLc8YazBxivvSsDq+scs4ZQyuZaPgBzvqwTtUc0S0jE0SxgFWV+qC4zKE
	 TR0mhHU8t965EahO/lVpG9RTvE89imuxNwMMWa5qisLVlvu2lsbMsxDIU+OO8GO8OF
	 1TNqqshzLlnKg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 04/12] media: iris: Add context bank hooks for
 platform specific initialization
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Reddy" <busanna.reddy@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260603-glymur-v7-4-afaa55d11fe0@oss.qualcomm.com>
References: <20260603-glymur-v7-4-afaa55d11fe0@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 14:36:00 +0000
Message-Id: <20260603143600.87F901F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,smtp.kernel.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email];
	TAGGED_FROM(0.00)[bounces-63623-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:busanna.reddy@oss.qualcomm.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5BDF9638F80

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Concurrent calls to `iris_core_init` can bypass hardware initializ=
ation and use uninitialized hardware.
- [High] Failure during `iris_wait_for_system_response` leaves hardware ini=
tialized and memory allocated without cleanup, leading to permanent DMA mem=
ory leaks on subsequent opens.
--

commit 378c8a359d3ed3242ace4eba3b25ac54fcc682b5
Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

    media: iris: Add context bank hooks for platform specific initialization

This patch adds initialization and de-initialization hooks for platform-spe=
cific
context bank devices. These hooks are required for the glymur platform where
Linux runs as the hypervisor and the driver must manually manage the firmwa=
re
IOMMU mapping.

> diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media=
/platform/qcom/iris/iris_core.c
> index 52bf56e517f91..89dbe9bbf6b0a 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.c
> +++ b/drivers/media/platform/qcom/iris/iris_core.c
[ ... ]
> @@ -58,10 +59,14 @@ int iris_core_init(struct iris_core *core)
> =20
>  	core->state =3D IRIS_CORE_INIT;

[Severity: High]
This is a pre-existing issue, but does setting the state to IRIS_CORE_INIT
here before initialization completes create a concurrency flaw?

If a second thread calls iris_core_init() while the first thread unlocks
core->lock and waits for the system response:

drivers/media/platform/qcom/iris/iris_core.c:iris_core_init() {
    ...
	mutex_unlock(&core->lock);

	return iris_wait_for_system_response(core);
}

The second thread would see core->state =3D=3D IRIS_CORE_INIT and return 0
immediately, bypassing hardware initialization and allowing user-space to
issue ioctls before the hardware finishes booting.

Can this cause firmware crashes or unhandled hardware states?

> =20
> -	ret =3D iris_hfi_queues_init(core);
> +	ret =3D iris_init_cb_devs(core);
>  	if (ret)
>  		goto error;
> =20
> +	ret =3D iris_hfi_queues_init(core);
> +	if (ret)
> +		goto error_deinit_cb_devs;
> +
>  	ret =3D iris_vpu_power_on(core);
>  	if (ret)
>  		goto error_queue_deinit;
[ ... ]
> @@ -94,6 +99,8 @@ int iris_core_init(struct iris_core *core)
>  	iris_vpu_power_off(core);
>  error_queue_deinit:
>  	iris_hfi_queues_deinit(core);
> +error_deinit_cb_devs:
> +	iris_deinit_cb_devs(core);
>  error:
>  	core->state =3D IRIS_CORE_DEINIT;

[Severity: High]
This isn't a bug introduced by this patch, but if
iris_wait_for_system_response() times out, it sets
core->state =3D IRIS_CORE_ERROR and returns -ETIMEDOUT. Since the VFS relea=
se
is never called on an open failure, the queues and the newly added context
bank devices remain allocated.

When a second open() attempt calls iris_core_init(), it sees the ERROR state
and jumps to the error label:

drivers/media/platform/qcom/iris/iris_core.c:iris_core_init() {
    ...
	} else if (core->state =3D=3D IRIS_CORE_ERROR) {
		ret =3D -EINVAL;
		goto error;
	}
    ...
}

At the error label, the state is simply reset to DEINIT without freeing any
previously allocated resources like queues or cb_devs. A third open() attem=
pt
will see the DEINIT state and proceed with a full initialization, allocating
new DMA memory and overwriting the old pointers.

Does this permanently leak the previously allocated resources?

>  exit:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-glymur-v7-=
0-afaa55d11fe0@oss.qualcomm.com?part=3D4

