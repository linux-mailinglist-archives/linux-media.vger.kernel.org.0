Return-Path: <linux-media+bounces-63725-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6X5dGnHhIGpO8wAAu9opvQ
	(envelope-from <linux-media+bounces-63725-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 04:22:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA3A63C798
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 04:22:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Z78Fwe3f;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63725-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63725-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4AA893040FA8
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 02:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B526232B115;
	Thu,  4 Jun 2026 02:19:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6295E31985C
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 02:19:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780539577; cv=none; b=QGNgVENLFFoobvkEDtXXOoU92n6EarXMYzaxMNOVIBB/dC5RvpBVnn6HTGdbMrEMP4B3Ho8pqDQBfFkVrTqcQZ7YPjSFxnp7EePCLPMlSddEfiFO+lVLOXIQBBanupMvMqzp0Lc/YLHzwCxrzMONu1liTETmKfgrHn5qYBhftxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780539577; c=relaxed/simple;
	bh=2f62fyJPSEYwyAslCBSNeRIiBrSaz6Nr0vc5jYIS9YU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cOQlFIdPVtoXzCiPlEJAF9o7aPHokOCxZOIozuG1nAXygqY3XdZwTJXj4LBjWUisUP/3ZcDjyOUOVzfBFjO/UJuIWq/DwJ70eLJbbUIvOZNHgt0ZgVxD0Mq0A7A+fPeLEdmNvhKPKIJhRyS46HXCxN15S3PQkC9HR88D4cd5EQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z78Fwe3f; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEA181F00893;
	Thu,  4 Jun 2026 02:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780539574;
	bh=wjfWRJQuBPrcwSRLmV5v19kkqDkZILloeXK65S+iR/4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z78Fwe3fBERh0JzkC9JDqVLFU3XUXFgZq33ed2Th/SuQLkZzn0mDGZvchaWAWnU6e
	 TAHtnx5MMM/RaaDIHwrTzyOKMY3ub2+qY946n/MkJYwSO6xCgHCjkS328eWh/V6Vqm
	 4aRRykEPhNY/C0DOtmXJpA3s58WQr2INocBtOogOsbmwjCvWZMnvKa/ObIxU9k+DFS
	 2PHBLyNzICPNfW5t/VyASTjCEzyvSxcoZl4xhkZyyH/NbBuDS7kRPu3351gfgzMsOE
	 sFjOlHrwrbIkq7ycb0uU6kHaDgssSqblkO2mO/BVvp2utFsN8QfaQBGloUCZN8OwEl
	 M/gFAA7p/OdPQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v0 4/4] media: chips-media: wave5: Add interrupt timeout
 while stop_streaming
Reply-To: sashiko-reviews@lists.linux.dev
To: Jackson.lee <jackson.lee@chipsnmedia.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260604020155.77-5-jackson.lee@chipsnmedia.com>
References: <20260604020155.77-5-jackson.lee@chipsnmedia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 02:19:33 +0000
Message-Id: <20260604021933.CEA181F00893@smtp.kernel.org>
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
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-63725-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jackson.lee@chipsnmedia.com,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,lists.linux.dev:replyto,smtp.kernel.org:mid,chipsnmedia.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BDA3A63C798

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [Critical] The newly added `wave5_vpu_wait_interrupt()` call in `wave5_vp=
u_dec_stop_streaming()` waits on a completion that is never signaled for pi=
cture decodes, leading to an unconditional 300ms stall, premature abort, an=
d severe DMA Use-After-Free memory corruption.
- [High] Multiple concurrent threads waiting on the shared `inst->irq_done`=
 completion can steal wakeups and cause a severe hang in the v4l2 m2m workq=
ueue.

Pre-existing issues:
- [High] `wave5_vpu_wait_interrupt()` in `wave5_vpu_enc_stop_streaming()` s=
uffers from a guaranteed timeout due to waiting on an unsignaled completion=
, causing an unconditional 60-second delay.
- [High] Ignoring the return value of `pm_runtime_resume_and_get()` leads t=
o hardware register access while suspended and usage count underflow.
- [High] Failing to re-initialize the `irq_done` completion on timeout caus=
es spurious wakeups and state machine corruption in subsequent operations.
--

commit 127f8c1856489ec0f52be02b9a57dc3b14051e6d
Author: Jackson Lee <jackson.lee@chipsnmedia.com>
Subject: media: chips-media: wave5: Add interrupt timeout while stop_stream=
ing

This patch adds a timeout based on interrupt status in the stop_streaming l=
oop
before calling get_result. If no further interrupts are received, the loop
exits to prevent infinite loops during stream termination.

> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/d=
rivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> index b7fa19ea2aacb..52ff1ac82e7bf 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> @@ -1543,6 +1543,7 @@ static void wave5_vpu_dec_stop_streaming(struct vb2=
_queue *q)
>  	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, q->type);
>  	pm_runtime_resume_and_get(inst->dev->dev);

[Severity: High]
This isn't a bug introduced by this patch, but does ignoring the return val=
ue
of pm_runtime_resume_and_get() lead to hardware access while suspended?

If the hardware resume fails, proceeding to execute wave5_vpu_dec_give_comm=
and()
and wave5_vpu_dec_get_output_info() will access powered-off hardware regist=
ers,
which could lead to crashes.

Additionally, pm_runtime_put_autosuspend() is called unconditionally at the=
 end
of wave5_vpu_dec_stop_streaming(). If the initial resume failed, wouldn't t=
his
unmatched put operation underflow the usage counter and corrupt the power
management state?

>  	inst->empty_queue =3D true;
> +
>  	while (check_cmd) {
>  		struct queue_status_info q_status;
>  		struct dec_output_info dec_output_info;
> @@ -1554,6 +1555,10 @@ static void wave5_vpu_dec_stop_streaming(struct vb=
2_queue *q)
>  			q_status.report_queue_count =3D=3D 0)
>  			break;
> =20
> +		if (q_status.instance_queue_count > 0 &&
> +		    wave5_vpu_wait_interrupt(inst, VPU_DEC_STOP_TIMEOUT) < 0)

[Severity: Critical]
Does this wait_for_completion actually get signaled for picture decodes?

Looking at wave5_vpu_handle_irq() in wave5-vpu.c, complete(&inst->irq_done)=
 is
only called for sequence initialization (INT_WAVE5_INIT_SEQ) and parameter =
sets.

For standard picture decoding (INT_WAVE5_DEC_PIC), the handler only queues a
kfifo entry to wake a worker thread and explicitly omits signaling the
completion:

if (irq_reason & BIT(INT_WAVE5_DEC_PIC) ||
    irq_reason & BIT(INT_WAVE5_ENC_PIC)) {
    ...
    val =3D BIT(INT_WAVE5_DEC_PIC);
    kfifo_in(&inst->irq_status, &val, sizeof(int));
}

Since the completion is omitted for DEC_PIC, won't this wait unconditionally
block for the full 300ms timeout, return -ETIMEDOUT, and break the loop ear=
ly?

If the loop breaks prematurely, the driver unconditionally proceeds to
streamoff_capture(), which returns destination buffers to userspace while t=
he
hardware is still actively decoding. When the delayed VPU DMA completes, co=
uld
it overwrite the freed memory and cause a DMA use-after-free?

[Severity: High]
Can this concurrent wait cause wakeups to be stolen from the m2m workqueue?

Because stop_streaming runs in ioctl context, it can execute concurrently w=
ith
wave5_vpu_dec_device_run() in the m2m workqueue. If the device run queue is
executing initialize_sequence(), both threads will block on the exact same
inst->irq_done completion.

Completions use WQ_FLAG_EXCLUSIVE, so a call to complete() wakes exactly one
thread. If stop_streaming is awoken, it will consume the completion and call
reinit_completion(). Could this leave initialize_sequence() permanently asl=
eep
until its 60-second timeout expires?

> +			break;
> +
>  		if (wave5_vpu_dec_get_output_info(inst, &dec_output_info))
>  			dev_dbg(inst->dev->dev, "there is no output info\n");
>  	}

Looking at the surrounding timeout handling and encoder teardown code, there
are related pre-existing issues:

[Severity: High]
This isn't a bug introduced by this patch, but does wave5_vpu_wait_interrup=
t()
properly clean up the completion state on timeout?

drivers/media/platform/chips-media/wave5/wave5-vpu.c:wave5_vpu_wait_interru=
pt() {
    ret =3D wait_for_completion_timeout(&inst->irq_done,
                                      msecs_to_jiffies(timeout));
    if (!ret)
        return -ETIMEDOUT;

    reinit_completion(&inst->irq_done);
    return 0;
}

If wait_for_completion_timeout() times out, it returns -ETIMEDOUT and skips
calling reinit_completion().

If the hardware eventually finishes and fires an interrupt, the handler will
call complete(&inst->irq_done). Wouldn't the next operation on this instance
(such as a retried INIT_SEQ) immediately consume this stale completion,
prematurely read unready hardware registers, and cause desynchronization?

[Severity: High]
This isn't a bug introduced by this patch, but does the encoder suffer from=
 a
similar unconditional timeout issue?

In drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c,
wave5_vpu_enc_stop_streaming() has this same timeout pattern:

    if (wave5_vpu_wait_interrupt(inst, VPU_ENC_TIMEOUT) < 0)
        break;

Since inst->irq_done is never signaled for INT_WAVE5_ENC_PIC interrupts, wo=
n't
this always block for the full 60-second VPU_ENC_TIMEOUT whenever the report
queue is not empty, causing a massive delay before prematurely aborting?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604020155.77-1=
-jackson.lee@chipsnmedia.com?part=3D4

