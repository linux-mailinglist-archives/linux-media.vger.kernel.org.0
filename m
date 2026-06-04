Return-Path: <linux-media+bounces-63735-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ENkxKzIBIWpp+QAAu9opvQ
	(envelope-from <linux-media+bounces-63735-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 06:38:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1977C63CD6F
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 06:38:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=a6+4YcwY;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63735-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63735-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0619E302EAA0
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 04:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2179A3BA248;
	Thu,  4 Jun 2026 04:38:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AA3380FEA
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 04:38:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780547887; cv=none; b=i86ijLqsZqv73AKH1h2jIk7KFczcM0bZt29HvcgH3DCMb1ahoGRo7TiOx4JxwOSwc0ClBAjBP44dwnVeIFjZeDa7HnOHS9hM/WcZoPmhHe+GEO9RUJSW8K0K4jECivvoV90QaBFwjSE4DC4ANmOC/4hJ1Vn7kt5Tt93e7L0D+Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780547887; c=relaxed/simple;
	bh=Vk3KBoetC6/ZBfZ4nYj5LrVGnaFP2gpo+DKwhiFFHIg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KXCUUQO27wdhOZODN6Gt5M0ZWwfr1MMdRPFOR8UzMyD0FR8dHmnAvpFl7FUEAqfFl5wU/7NPj56pkn+jx1fyoQr7K6TPHsnb2CczC5exHJhVXcysnSb6OhNElwPQksFi9YP1NhaXSCDu//0yfOyoHoHoVPGiS+alBfGlljYemGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a6+4YcwY; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46BC51F00893;
	Thu,  4 Jun 2026 04:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780547886;
	bh=U2PHUE8iIMGkEI8omXSNHfc4r4Olr7/tKDYnRd+FRKc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a6+4YcwY+qDyBsQGZ1yQliM3mjbl72b2Rp6GAa/fdSUz9aszkN6R2jhIKevvs9lGD
	 2/FvO9FS8PElp0axK3CAHI4UFgCwtyaq1DxKK9K/WIJy+u7HF7rJX7n277hS6sdn0W
	 7ulV6A3Pu5pDrXA2AFHjfWFkCx/jTOy/E6GahAu4/MrqANpD8GL6Yq3xMKVFIPInMA
	 yOu7olTs/oJk6/Jam+NxWs8FwimLI2aGUcOsCtpxaEyl9w6rWKyd8RW3Si52xnYA6o
	 vSeqR5OMzDTyfCEYIKkW3G/FXoA6+4PGF8kc9ry+tVPl4FHtVBxDgYLV8NKGY9TM9m
	 3g89GNNt3PcfA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] media: qcom: iris: handle runtime PM resume failure in
 core deinit
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hungyu Lin" <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260604042804.40899-1-dennylin0707@gmail.com>
References: <20260604042804.40899-1-dennylin0707@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 04:38:05 +0000
Message-Id: <20260604043806.46BC51F00893@smtp.kernel.org>
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
	FORGED_RECIPIENTS(0.00)[m:dennylin0707@gmail.com,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-63735-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,smtp.kernel.org:mid,lists.linux.dev:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1977C63CD6F

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Returning early when pm_runtime_resume_and_get() fails skips criti=
cal software teardown, leading to DMA memory leaks, TrustZone resource leak=
s, and state machine corruption.
--

commit 8dfed661c7987b309b6408296f5d14cf1983d0aa
Author: Hungyu Lin <dennylin0707@gmail.com>

media: qcom: iris: handle runtime PM resume failure in core deinit

This commit adds a return value check for pm_runtime_resume_and_get() in
iris_core_deinit(). If the runtime PM resume fails, it returns early to
avoid accessing hardware resources and prevent unbalanced runtime PM
references.

> diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media=
/platform/qcom/iris/iris_core.c
> index e6141012cd3dd..a1a95ef353e57 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.c
> +++ b/drivers/media/platform/qcom/iris/iris_core.c
> @@ -12,7 +12,11 @@
> =20
>  void iris_core_deinit(struct iris_core *core)
>  {
> -	pm_runtime_resume_and_get(core->dev);
> +	int ret;
> +
> +	ret =3D pm_runtime_resume_and_get(core->dev);
> +	if (ret)
> +		return;

[Severity: High]
Does returning early here when pm_runtime_resume_and_get() fails skip criti=
cal
software teardown?

If the early return is taken in iris_core_deinit() in
drivers/media/platform/qcom/iris/iris_core.c, the function bypasses
iris_hfi_queues_deinit(), which appears to leak the DMA memory allocated
for the interface queues. It also skips iris_fw_unload(), potentially leavi=
ng
the PAS in an authenticated state in TrustZone.

Finally, the early return fails to transition core->state to IRIS_CORE_DEIN=
IT.
During error recovery, if the state is left as IRIS_CORE_ERROR, could this
cause the subsequent iris_core_init() to fail instantly with -EINVAL,
permanently breaking the device state machine until a driver reload?

> =20
>  	mutex_lock(&core->lock);
>  	if (core->state !=3D IRIS_CORE_DEINIT) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604042804.4089=
9-1-dennylin0707@gmail.com?part=3D1

