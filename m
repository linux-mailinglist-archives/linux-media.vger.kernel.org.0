Return-Path: <linux-media+bounces-63723-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +1WeFIbgIGof8wAAu9opvQ
	(envelope-from <linux-media+bounces-63723-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 04:18:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E6B63C743
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 04:18:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=h05Av7be;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63723-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-63723-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 713BE3008C10
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 02:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7550030C16B;
	Thu,  4 Jun 2026 02:18:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9CF30AAB8
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 02:18:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780539521; cv=none; b=NPaV2H+IDsSmJYmavwt/1ZG7phB1hFVEg0/yZ44oh83ltU2VSiHAoq6oQHVga8RgFRuCJhbR4B5bsko1f+OXexALFFZTcyi+eJ5EKzSFeaLKBojgh1x3wsSYOGuF582KYAR3dp7q+NF0e9FjSiDtPT9pkSdbmSM1YBfqirKdC1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780539521; c=relaxed/simple;
	bh=e7M/frQYux/BYxM0KFi14NRZpCflxZdX8yShMistfAI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OgcICvtMmVwqVjW5SIunh/cUPaTi90ohXDHglZ+R454hQR1WidGqdNA0HVEiTgHvGLaJN+TjZaUwxDqmhTU7VJNoSby34uE+Qe5PbvAHqob771/GdZGAAdOVcc+opKfQkrsd1WDOlkCOZv46J8EeTrk0fO2nHusgyqmCu9XjbTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h05Av7be; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC92D1F00893;
	Thu,  4 Jun 2026 02:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780539517;
	bh=CYoIDOeW7ZZFxk5tAYS+IzTXNeu7BI4h6U1hk7jpG2U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h05Av7beB5eEFLZFg3aYwlM0nTQb3cmuxPzNWEP5pOzHIVoPSh4Q1B4se/BAUnn9D
	 aySZWjiTMc3r4LGJRIZ1jp8/BS4iaCclLdzcpDIUlVO2lZg1Y5jAaB2RQbmBchHwoj
	 RioT2obRStPAWkACZcGxCeibKUiUAEUXBhurG+BtwV0sD6dL0qEJahtwyfCL06Bl0N
	 hmgB0HBID/iQf7lis9yY8XoEkwctOvfgabUjp68/g6cR0ByvxsbPDzxjeKTctkl5rv
	 f18jWkJsGQQLmNM8ezTAH82XkhZVkjkypEXOWp6VZWujOQDV3XsDo+d7hS71FFFWfT
	 DxUGBGx1pimlA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v0 2/4] media: chips-media: wave5: Set inst->std during
 default format initialization
Reply-To: sashiko-reviews@lists.linux.dev
To: Jackson.lee <jackson.lee@chipsnmedia.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260604020155.77-3-jackson.lee@chipsnmedia.com>
References: <20260604020155.77-3-jackson.lee@chipsnmedia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 02:18:36 +0000
Message-Id: <20260604021836.BC92D1F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-63723-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,lists.linux.dev:replyto,smtp.kernel.org:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,chipsnmedia.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 02E6B63C743

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Error paths in the open handlers improperly call `ida_free()` with=
 unallocated or negative IDs, corrupting the IDA state and risking instance=
 ID aliasing.
- [High] The V4L2 M2M context is leaked on error paths during instance open=
 because `v4l2_m2m_ctx_release` is never called.
- [High] The file release handler `wave5_vpu_release_device` can abort earl=
y on pending signals, permanently leaking the instance and leaving a dangli=
ng pointer.
- [High] The condition to free the device SRAM buffer is logically impossib=
le to satisfy, permanently leaking the `gen_pool` allocation for non-WAVE51=
5 chips.
- [High] `inst->state` is read and modified concurrently without any locks =
in the encoder, leading to race conditions and invalid state transitions.
- [High] Concurrent file opens race to allocate the shared device SRAM buff=
er, causing memory leaks and pointer corruption.
--

commit 4066d4d2cd1d6dd5099164b5a1d648c7737c2049
Author: Jackson Lee <jackson.lee@chipsnmedia.com>

media: chips-media: wave5: Set inst->std during default format initializati=
on

This commit fixes an issue where inst->std remains uninitialized during the
default capture format setup, causing STREAMON to fail if S_FMT hasn't been
called. It resolves this by setting inst->std via wave5_to_vpu_std() in
wave5_set_default_format() to keep the codec type consistent.

Fixes: 9707a6254a8a ("media: chips-media: wave5: Add the v4l2 layer")
Cc: stable@vger.kernel.org
Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>

> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/d=
rivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> index e6c94b6f26711..f9fcdf4c224b3 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
[ ... ]
> @@ -1770,7 +1772,7 @@ static int wave5_vpu_open_enc(struct file *filp)
>  	inst->v4l2_fh.ctrl_handler =3D v4l2_ctrl_hdl;
>  	v4l2_ctrl_handler_setup(v4l2_ctrl_hdl);
> =20
> -	wave5_set_default_format(&inst->src_fmt, &inst->dst_fmt);
> +	wave5_set_default_format(inst, &inst->src_fmt, &inst->dst_fmt);
>  	inst->conf_win.width =3D inst->dst_fmt.width;
>  	inst->conf_win.height =3D inst->dst_fmt.height;
>  	inst->colorspace =3D V4L2_COLORSPACE_REC709;

[Severity: High]
This isn't a bug introduced by this patch, but there are multiple issues on
the error paths in wave5_vpu_open_enc() jumping to cleanup_inst.

If an initialization step fails before ida_alloc() is called:

wave5-vpu-enc.c:wave5_vpu_open_enc() {
    ...
	ret =3D wave5_kfifo_alloc(inst);
	if (ret) {
		dev_err(inst->dev->dev, "failed to allocate fifo\n");
		goto cleanup_inst;
	}
    ...
cleanup_inst:
	wave5_cleanup_instance(inst, filp);
    ...
}

Does this call ida_free() with an unallocated or negative ID?

wave5-helper.c:wave5_cleanup_instance() {
    ...
	ida_free(&inst->dev->inst_ida, inst->id);
    ...
}

Since inst->id is 0-initialized, if it fails before ida_alloc(), this frees
ID 0. If another instance is using ID 0, the next open will reuse it,
causing aliasing. If ida_alloc() fails and returns a negative error code,
does this cause an out-of-bounds access?

Also, wave5_cleanup_instance() does not call v4l2_m2m_ctx_release(). Does
this permanently leak the m2m_ctx allocated earlier in wave5_vpu_open_enc()
and leave a dangling pointer?

[Severity: High]
This is a pre-existing issue, but do concurrent file opens race to allocate
the shared device SRAM buffer?

In wave5_vpu_open_enc(), wave5_vdi_allocate_sram() is called without holding
dev->dev_lock:

wave5-vpu-enc.c:wave5_vpu_open_enc() {
    ...
	wave5_vdi_allocate_sram(inst->dev);

	ret =3D mutex_lock_interruptible(&dev->dev_lock);
    ...
}

Inside wave5_vdi_allocate_sram():

wave5-vdi.c:wave5_vdi_allocate_sram() {
    ...
	if (!vpu_dev->sram_pool || vb->vaddr)
		return;

	size =3D min_t(size_t, vpu_dev->sram_size,
	             gen_pool_avail(vpu_dev->sram_pool));
	vaddr =3D gen_pool_dma_alloc(vpu_dev->sram_pool, size, &daddr);
    ...
}

If multiple processes open the device simultaneously, can they race past the
vb->vaddr check, leak the gen_pool allocation, and corrupt the shared
pointers?

[Severity: High]
This isn't a bug introduced by this patch, but can wave5_vpu_release_device=
()
abort early and leak the instance?

wave5-helper.c:wave5_vpu_release_device() {
    ...
	ret =3D mutex_lock_interruptible(&inst->dev->irq_lock);
	if (ret)
		return ret;
    ...
}

If a process is exiting due to a fatal signal, this lock acquisition will
fail and return -ERESTARTSYS. Because this is the file release handler, the
kernel will destroy the file descriptor anyway. Does this permanently leak
the instance resources and leave a dangling pointer in dev->instances?
Should this use mutex_lock() instead?

[Severity: High]
This is a pre-existing issue, but is the condition to free the device SRAM
buffer logically impossible to satisfy?

wave5-helper.c:wave5_vpu_release_device() {
    ...
	list_del_init(&inst->list);
	wave5_cleanup_instance(inst, filp);
    ...
}

wave5-helper.c:wave5_cleanup_instance() {
    ...
	if (list_is_singular(&inst->list) &&
	    inst->dev->product_code !=3D WAVE515_CODE)
		wave5_vdi_free_sram(inst->dev);
    ...
}

Because list_del_init() reinitializes inst->list as empty,
list_is_singular() will always return false. Does this permanently leak the
gen_pool allocation for non-WAVE515 chips? Should this check if
inst->dev->instances is empty instead?

[Severity: High]
This isn't a bug introduced by this patch, but is there a data race on
inst->state in the encoder?

wave5-vpu-enc.c:switch_state() {
    ...
	inst->state =3D state;
	return 0;
}

In the encoder, switch_state() directly modifies inst->state without any
locks. Ioctl threads and the V4L2 M2M worker thread can concurrently mutate
this state. Can this cause the worker thread to observe intermediate states,
leading to invalid state transitions? The decoder module seems to protect
state mutations using inst->state_spinlock.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604020155.77-1=
-jackson.lee@chipsnmedia.com?part=3D2

