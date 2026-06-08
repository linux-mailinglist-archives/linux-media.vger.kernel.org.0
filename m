Return-Path: <linux-media+bounces-64105-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bqFkItYKJmojRgIAu9opvQ
	(envelope-from <linux-media+bounces-64105-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 02:20:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E742F651FDC
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 02:20:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=EKkRmlyj;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64105-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64105-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F2DF130073CE
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 00:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 414B217A2F6;
	Mon,  8 Jun 2026 00:20:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE504071DB
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 00:20:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780878033; cv=none; b=Pe4V5kBSwyYdVauWKqeG14HQVLVzuUEeooBc70NEvuDOp3pqyjBkJsvCzxSd+UxFwrtukU5WdR8yToJJ6u5UROG2hhP7gxhgppMAzL570dwu18nMYtYN2XDBm7uLGl9we5FYRofKSHQB1kxH7vTkD1s8unRP1QXkXQaRb9EMrmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780878033; c=relaxed/simple;
	bh=FasD4L6GGmiNWgakkUQMFgx/2yKgdpsID11t254ymeQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NUEmhO6Lu3RvG4PMfXiHg5Hty2qSlHdMT6Cyb3o8isGeM/qMkX1qJyP0/XsMGUm7wXAze6zB4m5iZx+6EAluYYBg7KDvKTul6ozLXBEMCgvqeckZo1Tf6+ru1gg4yeHL3Q1fSdlBKm+aIXT6I7zUlYeVEU3Ah9rhNVCvJjjtQf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EKkRmlyj; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 301C71F00893;
	Mon,  8 Jun 2026 00:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780878032;
	bh=fe0UwLsOAZVhOjcCWrMtHXcYQDAQ3QSO4jOyeS3jOPE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EKkRmlyjRdnFvHszlEyrDidsCLbLkWlPlW0hCG0n0X4nms+cgzP3sXsAsLhk9Px5p
	 P+vgxs0JOSskWs4O8+W4XxGc0g5FXUgQ3wviXgK/58pAdef1lB8/FonAI9D4r9XgOg
	 GzalX7Ts7RBo6PsNvTcI9ChV7ML6s3szGgLQS9NFvw7y7yjPCKk4KDrbd4F4eUF2dX
	 bAgEdtpzxBYCqhx/+idmXgghTHejRkuzBb9+N6IilqluxMPuAmPFIvdcPKtQDbj9rb
	 Mei64EcE3AAwVEq1CJ/OwikjI+XkeMeG0XpHGwv1gtDisctuQbq3NQUVoq6Kk7v/+n
	 6Wv4xn0lbRcgA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] media: qcom: iris: guard IRQ handler with runtime PM
 check
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hungyu Lin" <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260608001128.80090-1-dennylin0707@gmail.com>
References: <20260608001128.80090-1-dennylin0707@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 00:20:31 +0000
Message-Id: <20260608002032.301C71F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dennylin0707@gmail.com,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-64105-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E742F651FDC

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The threaded IRQ handler returns early without calling `enable_irq=
()` when the device is runtime suspended or runtime PM is disabled, permane=
ntly leaking the IRQ disable depth and disabling the interrupt.
--

commit 300804196935f196b366554c39d9f042b16bde60
Author: Hungyu Lin <dennylin0707@gmail.com>

media: qcom: iris: guard IRQ handler with runtime PM check

Guard hardware register access in the threaded IRQ handler with
pm_runtime_get_if_active() to avoid touching registers when suspended.

> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.c b/drivers=
/media/platform/qcom/iris/iris_hfi_common.c
> index 621c66593d88d..ab2ec1e753097 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
> @@ -100,10 +100,17 @@ irqreturn_t iris_hfi_isr(int irq, void *data)
>  irqreturn_t iris_hfi_isr_handler(int irq, void *data)
>  {
>  	struct iris_core *core =3D data;
> +	int ret;
> =20
>  	if (!core)
>  		return IRQ_NONE;
> =20
> +	if (IS_ENABLED(CONFIG_PM)) {
> +		ret =3D pm_runtime_get_if_active(core->dev);
> +		if (ret <=3D 0)
> +			return IRQ_NONE;

[Severity: High]
Does this early return leave the interrupt permanently disabled?

Looking at the top-half handler iris_hfi_isr() in this same file, it=20
unconditionally calls disable_irq_nosync(irq) before returning IRQ_WAKE_THR=
EAD.

If a suspend sequence begins between the execution of the top-half and the
threaded handler, pm_runtime_get_if_active() will return 0. The threaded
handler will then exit early here without calling enable_irq(irq).

This leaves the IRQ disable depth permanently incremented. During resume,
even if the power-on sequence calls enable_irq(), the depth never returns
to 0, leaving the hardware interrupt permanently masked and potentially cau=
sing
all future device operations to timeout.

Should this early return path also call enable_irq(irq) to balance the
disable depth?

> +	}
> +
>  	mutex_lock(&core->lock);
>  	pm_runtime_mark_last_busy(core->dev);
>  	iris_vpu_clear_interrupt(core);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608001128.8009=
0-1-dennylin0707@gmail.com?part=3D1

