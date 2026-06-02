Return-Path: <linux-media+bounces-63389-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rpNcEMzdHmrQWgAAu9opvQ
	(envelope-from <linux-media+bounces-63389-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 15:42:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A539962E979
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 15:42:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=md5A4LBC;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63389-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63389-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EB93D30A4C96
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 13:32:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 697033EB801;
	Tue,  2 Jun 2026 13:31:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA9D3E9C1C
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 13:31:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780407071; cv=none; b=k5XGYFu8X7YvAFJhZ7iFoMj/Fb43mCGZ773k+oOmfsVfsMQ6gcpG4lFSqOhya9RLm2CX2FywLNWprOziZRPpLb7S76cjmplNJAh+5BHYB9aega3lCNDEHiL9V8xz7VqEF6wNAHT5wGNFYCzBxgDvpWOrP+UW2InD/CqWmmKQpKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780407071; c=relaxed/simple;
	bh=PwNifnJFD3WTAiDmtN3u+ThSgBQW5LlghqGk47r6To4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UKq6sYGPr4L2YUoxS57SyySPoZIiDcDf6Pn4i2uq3rskcQvA7A8WakcGyZ6rRu4FdurcsvbbsOkobZsZRi0w8y7XOFAno//n4QoGnMMys0608Q0wxsbBd9GFjUJ3KYEHpG6UtPVdw0lFNq4Mrud6tmscoo6F4EBThQPCjdxNAEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=md5A4LBC; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E0041F00899;
	Tue,  2 Jun 2026 13:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780407070;
	bh=8e9Dg8VKkrBPbpQGqBAsf/GLgPG94D1P+/BFFuG9YzQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=md5A4LBCdkun8bTvY7NqPW1Wi9pWgkJeuTIb11EbKo0YNMmyb/mw02kdeaI1kDW/u
	 EVjKxjBvsEgSyqIE/KPdZHYjSkUXRbKp8wqRbeVAFgmgukVWEKWjQyKgYNTrHGRM/a
	 R2LRThK+KWfiAMMYSIiTZJaGTwIPW2pz4bygvuVsD8N5ZkIdeypSc50F1ApcqtdZXn
	 PICKXFMHZ1sBVn9mHU9kF8KMU/3d5CGbnUqnW8/nPrPNHcTeaUf1YxeMCisUuh8Zyr
	 9YKH38yTpWCc1SCnU3OZpydG3ffwZkbRFknhmG7XXhwuQoSsWypFUSI60dj5A+s/L1
	 ae7fKk6qMZ/mA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 03/13] media: stm32: dcmipp: bytecap: protect CMIER
 register access
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alain Volmat" <alain.volmat@foss.st.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260602-stm32-dcmipp-pixel-pipes-support-v2-3-3c76b5f93157@foss.st.com>
References: <20260602-stm32-dcmipp-pixel-pipes-support-v2-3-3c76b5f93157@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 13:31:10 +0000
Message-Id: <20260602133110.7E0041F00899@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-63389-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:alain.volmat@foss.st.com,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
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
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,lists.linux.dev:replyto,sashiko.dev:url,vger.kernel.org:from_smtp,smtp.kernel.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A539962E979

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Kernel heap Use-After-Free on `vcap->vdev.v4l2_dev->lock` in `dcmi=
pp_bytecap_stop_streaming()` due to lifetime mismatch.

Pre-existing issues:
- [High] Use-After-Free during device unbind because hardware interrupt rem=
ains active after devm-allocated memory is freed.
- [High] Missing synchronization with the IRQ thread in `stop_streaming` le=
ads to Use-After-Free and unclocked register access (external abort).
--

commit def9653367321582625d53db751e4abad7f35c94
Author: Alain Volmat <alain.volmat@foss.st.com>

media: stm32: dcmipp: bytecap: protect CMIER register access

This patch adds a spinlock to protect the CMIER register from concurrent
access by utilizing the existing lock in the v4l2_device structure.

> diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.=
c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
> index 990bbaaf4bda1..dac7338dd9819 100644
> --- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
> +++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
[ ... ]
> @@ -492,7 +494,9 @@ static void dcmipp_bytecap_stop_streaming(struct vb2_=
queue *vq)
>  	media_pipeline_stop(vcap->vdev.entity.pads);
> =20
>  	/* Disable interruptions */
> +	spin_lock(&vcap->vdev.v4l2_dev->lock);

[Severity: High]
If a user closes the file descriptor after the device has been unbound,
does this dereference freed memory?

The parent dcmipp structure (which embeds v4l2_dev) is allocated with
devm_kzalloc() and freed by devres when the driver is unbound. However,
the vcap structure is refcounted by the V4L2 video device and remains
alive as long as the file descriptor is open.

When the file descriptor is eventually closed, dcmipp_bytecap_stop_streamin=
g()
is invoked and attempts to acquire this lock inside the already-freed
v4l2_dev memory.

>  	reg_clear(vcap, DCMIPP_CMIER, DCMIPP_CMIER_P0ALL);
> +	spin_unlock(&vcap->vdev.v4l2_dev->lock);
> =20
>  	/* Stop capture */
>  	reg_clear(vcap, DCMIPP_P0FCTCR, DCMIPP_P0FCTCR_CPTREQ);

[Severity: High]
This is a pre-existing issue, but is it possible for the IRQ thread to
race with dcmipp_bytecap_stop_streaming() since there is no call to
synchronize_irq() before tearing down the capture state?

If the threaded IRQ handler runs after this function sets
vcap->state =3D DCMIPP_STOPPED, it would observe the stopped state
and proceed to swap(vcap->active, vcap->next).

Because stop_streaming() doesn't clear vcap->next, a buffer that was
already returned to userspace could be swapped into vcap->active. The
IRQ thread would then call dcmipp_bytecap_set_next_frame_or_stop(),
which accesses the freed buffer's memory.

Additionally, since pm_runtime_put() is called during teardown, the
device clocks might be disabled, causing the subsequent register access
in the IRQ thread to trigger a synchronous external abort.

[Severity: High]
This isn't a bug introduced by this patch, but does the driver have an
allocation order issue during probe that leads to a use-after-free
during unbind?

The driver registers its interrupt handler via devm_request_threaded_irq()
before allocating the dcmipp->entity array via devm_kcalloc().

During device unbind, devres frees resources in reverse order. This means
dcmipp->entity is freed before the IRQ is disabled. If a hardware
interrupt fires during this window, dcmipp_irq_callback() will traverse
the freed dcmipp->entity array:

drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c:dcmipp_irq_callb=
ack() {
    ...
    for (i =3D 0; i < dcmipp->num_ents; i++) {
        ved =3D dcmipp->entity[i];
        ...
    }
}

Could this reliably crash the system during hot-unplug or driver unbind?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602-stm32-dcmi=
pp-pixel-pipes-support-v2-0-3c76b5f93157@foss.st.com?part=3D3

