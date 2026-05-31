Return-Path: <linux-media+bounces-63165-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id DHgjDl/RG2ryGQkAu9opvQ
	(envelope-from <linux-media+bounces-63165-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 08:12:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84437614AD3
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 08:12:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B6B1F302C0DD
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 06:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32356332EC5;
	Sun, 31 May 2026 06:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WGMR/Hbk"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DB926299
	for <linux-media@vger.kernel.org>; Sun, 31 May 2026 06:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780207956; cv=none; b=S/+5b/xbcFMgU3Y23XV0A9b5JyBfm/KIWVKuxZL7zv/Fou/4oCebFavaVZSY7+g5mfY/F20tFXy2dI9L9MJm7Bcs1NcB11nGhnGYHsTFOp1QZ+bckJSOEER1L+I+xaofjRSznfnyNRLcBy5g8IewAZkUDOP9hbrZrbpmG34ebFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780207956; c=relaxed/simple;
	bh=h7NFuhBjPG0kFEbpPQEquUWFwqjJNPpcPtZOce+SCmU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TLBONghPnxUhAnoWqmcsrFWkcuHjSxDXviiRXzWYkGeQbsv64tmNQTU3/NMtwPUfhhu9dsfjahnrrKWuLzOiil/DyTsQVynh+v8PVC4M8qf96EOEYZMCxUwp+zIgJopVLCYrGdoYMkmd9fMCw5rZGqO8yykreevrNe/xay/N/eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WGMR/Hbk; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28BC11F00893;
	Sun, 31 May 2026 06:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780207955;
	bh=Y0YJCwSMezzC/EzLkSsyiB7t7je8Ig71izUW/l/hDPY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WGMR/Hbk9iwpU+BYf34k2hE/tRGTk0uWVMRaiQ1jXng2wlrshjei/Nfc5m9cjCx0D
	 Uh8ucALiGNNjOGBM1QLbdmo9i5it0/VpRDZsvB4F4spBwSwPeCfv1qOgShtT2FEE/J
	 p6WL3KxkcI8S6XbvTNgocgRBJajs7ekFULvAoQajTk1T7h0ubiGhxEzumzDvSj56Tf
	 h/NsY5xxInZJE32cbiFxotn/NVbWbrIRB+tAx49m0BHmu2a8fTcc67NI15pvx8k2NV
	 RZ3pn3R32QQwJ4sERfLsobE6tSQb0NecrIviqdhy/+yLs+J1b9SoJQ6YX/c5mKuPTb
	 10rSmV7jALrXw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/7] media: qcom: iris: fix state-change debug log
 printing stale value
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Reddy" <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260531-iris-code-improvement-v3-2-4c699c3dd719@oss.qualcomm.com>
References: <20260531-iris-code-improvement-v3-2-4c699c3dd719@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 31 May 2026 06:12:34 +0000
Message-Id: <20260531061235.28BC11F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-63165-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,sashiko.dev:url,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 84437614AD3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Use-After-Free in asynchronous hardware event handling racing =
with instance closure.
- [High] Data Race / Concurrency issue masking fatal `IRIS_INST_ERROR` syst=
em states.
--

commit 9d947dd08bc15973583337310a745c1b38494f2a
Author: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

media: qcom: iris: fix state-change debug log printing stale value

The state-change debug log in iris_inst_change_state() always prints the
same value for the old and new state, rendering it useless for debugging.
This happens because the state is updated before the log is emitted.

> diff --git a/drivers/media/platform/qcom/iris/iris_state.c b/drivers/medi=
a/platform/qcom/iris/iris_state.c
> index d14472414750d..e991f34916ec6 100644
> --- a/drivers/media/platform/qcom/iris/iris_state.c
> +++ b/drivers/media/platform/qcom/iris/iris_state.c
> @@ -60,9 +60,9 @@ int iris_inst_change_state(struct iris_inst *inst,
>  		return -EINVAL;
> =20
>  change_state:
> -	inst->state =3D request_state;
>  	dev_dbg(inst->core->dev, "state changed from %x to %x\n",
>  		inst->state, request_state);
> +	inst->state =3D request_state;

[Severity: High]
This is a pre-existing issue, but does moving the dev_dbg() call increase
the race window where an asynchronously set IRIS_INST_ERROR could be
overwritten?

iris_inst_change_state() is called by normal ioctls and state transitions
holding only inst->lock. However, iris_hfi_gen1_sys_event_notify() handles
fatal system errors by iterating through all instances and calling
iris_inst_change_state(instance, IRIS_INST_ERROR) while holding only
core->lock, not inst->lock.

Because these paths rely on different locks, they can execute concurrently.
If the system error handler sets inst->state =3D IRIS_INST_ERROR while a
concurrent normal transition is delayed inside dev_dbg(), the normal
transition will overwrite the fatal error state when it resumes. Will this
mask the hardware failure and allow the kernel to interact with a crashed
VPU?

> =20
>  	return 0;
>  }

[Severity: Critical]
This is a pre-existing issue, but is there a use-after-free when handling
asynchronous hardware events while an instance is being closed?

In drivers/media/platform/qcom/iris/iris_utils.c:iris_get_instance(), the
instance is fetched using core->lock and returned without acquiring a
reference count.=20

In handlers like iris_hfi_gen1_handle_response(), the caller receives this
unreferenced pointer and attempts to acquire the mutex:

    inst =3D iris_get_instance(core, pkt->shdr.session_id);
    ...
    mutex_lock(&inst->lock);

Concurrently, closing the file descriptor invokes iris_close(), which holds
inst->lock, removes the instance under core->lock, unlocks inst->lock, and
unconditionally frees the memory with kfree(inst).

If iris_get_instance() returns the pointer just before it is removed from
the list, the response handler will block on mutex_lock(&inst->lock). Once
iris_close() drops the lock and frees the instance, the response handler
wakes up and dereferences freed memory. Can this be triggered by a user
calling close() while the VPU is actively sending asynchronous events?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260531-iris-code-=
improvement-v3-0-4c699c3dd719@oss.qualcomm.com?part=3D2

