Return-Path: <linux-media+bounces-63391-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0pqWEpHgHmpRXgAAu9opvQ
	(envelope-from <linux-media+bounces-63391-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 15:54:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AAF62EBFE
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 15:54:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=OCwZMBJh;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63391-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63391-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7DB7D312D640
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 13:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2373F3E5EC4;
	Tue,  2 Jun 2026 13:38:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6873E3167
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 13:38:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780407504; cv=none; b=YfMzilFDcPxkzh+jxkZbSbzs0vMGVcCduGnGsLr7nRcC+Zff4uijwzHehavhh82B5jfI8sRUMeCLlKmwN/+XCRs9CuyQOdzDPRGoyXVi3Yz0UMghByMPe/S1luo2KDSztKacz3PV+AOMVr+euKIkJd7ziUPkcjAU7jVsULvxgSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780407504; c=relaxed/simple;
	bh=RP2dmoi9/sNjlcle+OvL+HHS9/BBtyffLJJHucX6VRI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iOhWx/F6NbWSJw0krpIWpFcem7oERQG4oAAW2SbXNxIbpr629e5su21aF6up1deXdeBsj1XmWCkuAFDQjIGnkX+1WruitTYrOmGkj8MptqjOHrcuLvEzzVnmHTARqn4DaUPop0In43ihr8vpSO/jmpIVEp1x1GjwnoOzpzbk8hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OCwZMBJh; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82FD51F00893;
	Tue,  2 Jun 2026 13:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780407503;
	bh=g9GCYtPsERYGqI6orixdTl1JVx7YhWm456JB2HRw9RQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OCwZMBJhvo4yLI4cQrEqc2CwDaD1eP8AYTKW7D+CjoExM8nDPQrlPmd/gfNOTSkp8
	 usssVclmp+02JugCy1y+6NfE6zsa7hmCpXvCRlyTEfdYB2OoaVnFkVvnJt8ulczeRh
	 ktvXc9GRF9WwfE1M/JxuoZq5bGoVLDRCyKZgaxVT2oXQ9bmhQ/oncFmfZ7067bU5/q
	 O6TrwaxdwPaqxzOnY3pGhQi4pfLqCWqi67QueJZ9nAgpjjd+ht06F9i5wEL/Mq7Y/p
	 cd/uKC4qRHYVaDCx7iaC8LKw6kcbl27DqbQ3y5BGzpK5Y8m8mBM920fuqZFHtzFHHZ
	 G+GAU24v46w0w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 02/13] media: stm32: dcmipp: make dcmipp_state &
 cmsr2 read common
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alain Volmat" <alain.volmat@foss.st.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260602-stm32-dcmipp-pixel-pipes-support-v2-2-3c76b5f93157@foss.st.com>
References: <20260602-stm32-dcmipp-pixel-pipes-support-v2-2-3c76b5f93157@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 13:38:22 +0000
Message-Id: <20260602133822.82FD51F00893@smtp.kernel.org>
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
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-63391-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,sashiko.dev:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,st.com:email,vger.kernel.org:from_smtp,smtp.kernel.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A7AAF62EBFE

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The interrupt handler `dcmipp_irq_callback` is subject to a teardo=
wn and initialization lifecycle mismatch that causes a NULL pointer derefer=
ence during probe and a Use-After-Free during removal.
--

commit 57156bb8e4502a74fba0baeca5a498fc6151d274
Author: Alain Volmat <alain.volmat@foss.st.com>

media: stm32: dcmipp: make dcmipp_state & cmsr2 read common

This commit moves the dcmipp_state enum into a common header and centralizes
the reading of the CMSR2 interrupt status register. The core interrupt
handler now reads the register and shares the value with each subdevice.

> diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b=
/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> index dd784cfcaac82..b06a4931ae951 100644
> --- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> +++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
[ ... ]
> @@ -251,10 +253,15 @@ static irqreturn_t dcmipp_irq_callback(int irq, voi=
d *arg)
>  	struct dcmipp_ent_device *ved;
>  	irqreturn_t ret =3D IRQ_HANDLED;
>  	unsigned int i;
> +	u32 cmsr2;
> +
> +	/* Centralized read of CMSR2 */
> +	cmsr2 =3D reg_read(dcmipp, DCMIPP_CMSR2);
> =20
>  	/* Call irq handler of each entities of pipeline */
>  	for (i =3D 0; i < dcmipp->pipe_cfg->num_ents; i++) {
>  		ved =3D dcmipp->entity[i];
> +		ved->cmsr2 =3D cmsr2;

[Severity: High]
This is a pre-existing issue, but does this create a risk of a NULL pointer
dereference during probe or a use-after-free during removal?

In dcmipp_probe(), devm_request_threaded_irq() is called and unmasks the IRQ
before the dcmipp->entity array is allocated via devm_kcalloc():

	ret =3D devm_request_threaded_irq(&pdev->dev, irq, dcmipp_irq_callback,
					dcmipp_irq_thread, IRQF_ONESHOT,
					dev_name(&pdev->dev), dcmipp);
	...
	dcmipp->entity =3D devm_kcalloc(&pdev->dev, dcmipp->pipe_cfg->num_ents,
				      ...);

If an interrupt fires immediately, dcmipp->entity will be NULL, causing a c=
rash
when evaluating dcmipp->entity[i].

Similarly, in dcmipp_remove(), the subdevice entities are released and their
memory freed while the devres-managed IRQ is still active:

	for (i =3D 0; i < dcmipp->pipe_cfg->num_ents; i++)
		dcmipp->pipe_cfg->ents[i].release(dcmipp->entity[i]);

If a spurious interrupt fires during or after this teardown loop, could this
assignment to ved->cmsr2 corrupt freed memory?

>  		if (ved->handler)
>  			ved->handler_ret =3D ved->handler(irq, ved);
>  		else if (ved->thread_fn)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602-stm32-dcmi=
pp-pixel-pipes-support-v2-0-3c76b5f93157@foss.st.com?part=3D2

