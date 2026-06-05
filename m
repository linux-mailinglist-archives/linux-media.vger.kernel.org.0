Return-Path: <linux-media+bounces-63984-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VAH0Nd5MI2qeoQEAu9opvQ
	(envelope-from <linux-media+bounces-63984-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 00:25:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC9964BA0A
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 00:25:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=aTv+Z62X;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63984-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63984-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4AA99301F9F8
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 22:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FB373AFB14;
	Fri,  5 Jun 2026 22:22:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD749256C84
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 22:22:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780698166; cv=none; b=dz4MLump8UxW1a1cI3xqKuwNZtDtkfqxXG9hscE1fjbvqIV3AB5Q6hWB+m4cFJq+ShNYwVzNatx8ZdSA85R3QW3ZKqPU0D5PgHZQxaHuneNAZF//BwxUixGXAMLgBoUUvepmbF34o7dlJ7A6gKH1NkMH6d5DKi9IpY3DwMj5Qdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780698166; c=relaxed/simple;
	bh=LjRJp4GwOMKgolPCTXJig1RUGpHU/uRPw5kDzh+KzZM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ciCKAADIGixLwiG9/Vgws+34jLhR3B16qBWS758rDdtbLrjYGtF0IIut7jA6FIh+LqTkYiVlH3Vvj9n9xpQ6QPLAWo64c1FfF8PAF1qq5oIPOP+wmNq55IohM7vtud79dBDGuo0WPC80N9/WyN8c5O8Pda+SUxDKqpt0AdlH7v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aTv+Z62X; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35A3C1F00893;
	Fri,  5 Jun 2026 22:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780698165;
	bh=Sl4IjkLMubrwtC1sv1caPU0xIFKAPeEn1aVDryHzkHY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aTv+Z62XzdSQkucmrEZeF525HpKJsjH56lx+rx9tLCpSxBYQWj1DzrDxP7snsLjRn
	 p/wBLhu/DC71kjIkNGERWCKxxg7hJtPLF9xCV82uuSoRrnl8Rz8Kr4S6M6nP0Y/qiE
	 Akpk+kjIr8QAmLH90QIm1WEluGLmgaDkNLoLmkx1XOPtJ0eUqWIWtLs3fNF2+Pz9wL
	 fr+C3BfAmxggbMv23OAYN7ftIKvBDQb2gry9rCTNC7aoAReRO7EE2s6RMlWwmjAkyS
	 qfGYj57gvesm7fQ4QJ6GAqOJs4ivwXCNyl9FixQobiC+YoByB5v3yQebLUwkJYcj42
	 fLw3C9tXwyVSw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/17] media: rockchip: rga: move power handling to
 device_run
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3ZlbiBQw7xzY2hlbA==?= <s.pueschel@pengutronix.de>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260606-spu-rga3multicore-v1-6-3ec2b15675f7@pengutronix.de>
References: <20260606-spu-rga3multicore-v1-6-3ec2b15675f7@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 22:22:44 +0000
Message-Id: <20260605222245.35A3C1F00893@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-63984-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:s.pueschel@pengutronix.de,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lists.linux.dev:replyto,vger.kernel.org:from_smtp,pengutronix.de:email,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2DC9964BA0A

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:

New issues:
- [Medium] Autosuspend is configured but never enabled, causing `pm_runtime=
_put_autosuspend()` to act like an immediate `pm_runtime_put()`.

Pre-existing issues:
- [Critical] The `rga` structure is freed by devres on device removal but a=
ccessed via V4L2 file ops later.
- [High] Missing hardware state validation in shared interrupt handler allo=
ws register access on powered-off device.
- [High] Missing IRQ synchronization during runtime suspend allows hardware=
 power-down while IRQ handler is mid-flight.
- [High] Asynchronous pm_runtime_put() is dangerously canceled by an immedi=
ate pm_runtime_disable() during module removal, leaking power.
- [High] Missing return after WARN_ON(!ctx) leads to immediate NULL pointer=
 dereference.
- [High] `dma_sync_single_for_device()` is illegally called on coherent mem=
ory.
--

commit ed159a0b6bc2e424a0e4c721a5d6723c23fc3c3e
Author: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

media: rockchip: rga: move power handling to device_run

Move the power handling to the device_run function in preparation for
enabling multiple cores. Switch to autosuspend to avoid powering down
the core when the next frame is scheduled in the next 50ms.

> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 8c03422d669cf..0eff558d7f133 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c

[ ... ]

> @@ -81,6 +89,8 @@ static irqreturn_t rga_isr(int irq, void *prv)
>  		v4l2_m2m_buf_done(src, VB2_BUF_STATE_DONE);
>  		v4l2_m2m_buf_done(dst, VB2_BUF_STATE_DONE);
>  		v4l2_m2m_job_finish(rga->m2m_dev, ctx->fh.m2m_ctx);
> +
> +		pm_runtime_put_autosuspend(rga->dev);

[Severity: Medium]
Is the idle timer being reset properly here?

It appears we are missing a call to pm_runtime_mark_last_busy() before the
put operation. Without it, the idle timer might not be reset, defeating the
intended autosuspend optimization.

[Severity: High]
This is a pre-existing issue, but I noticed the shared interrupt handler
might execute hardware operations blindly. Does rga_isr() need to verify
the device is powered on before touching hardware?

Since the device can use shared IRQs, rga_isr() can be invoked
asynchronously if another device on the same line triggers an interrupt,
even when the RGA device is suspended. Should we use
pm_runtime_get_if_active() to ensure we don't read from powered-down
registers?

[Severity: High]
This is also a pre-existing issue, but looking at rga_isr(), if ctx is NULL,
does the code fall through to a NULL pointer dereference?

rga_isr() checks for a NULL context:

WARN_ON(!ctx);
core->curr =3D NULL;
src =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);

Should there be a return statement after the WARN_ON(!ctx) to prevent
dereferencing ctx in the subsequent calls?

>  	}
> =20
>  	return IRQ_HANDLED;
> @@ -797,6 +807,7 @@ static int rga_probe(struct platform_device *pdev)
>  	if (ret)
>  		return dev_err_probe(&pdev->dev, ret, "Unable to parse OF data\n");
> =20
> +	pm_runtime_set_autosuspend_delay(rga->dev, 50);
>  	pm_runtime_enable(rga->dev);

[Severity: Medium]
Are we missing a call to pm_runtime_use_autosuspend() here?

Without enabling the autosuspend flag, the PM core might ignore the 50ms
delay, causing pm_runtime_put_autosuspend() to fall back to an immediate
suspend behavior.

[ ... ]

I also noticed a few other pre-existing issues in the driver while reviewing
this patch:

[Severity: High]
This isn't a bug introduced by this patch, but does the driver need to
synchronize IRQs during runtime suspend?

In rga_runtime_suspend(), the driver disables clocks using
clk_bulk_disable_unprepare(). Because the driver uses shared IRQs, could
the hardware be powered down while an executing rga_isr() is mid-flight on
another CPU? Should synchronize_irq() be called before shutting down the
hardware?

[Severity: High]
This is a pre-existing issue, but does device removal safely cancel pending
suspend operations?

During module removal, rga_core_remove() calls pm_runtime_disable().
Because the driver uses pm_runtime_put_autosuspend(), an asynchronous
suspend might be pending. Could this immediate disable cancel the pending
work without executing it, leaving the hardware active and leaking power?
Would using pm_runtime_put_sync() ensure the suspend completes before
removal?

[Severity: Critical]
This is a pre-existing issue, but is there a potential use-after-free
related to the rga structure lifecycle?

The rga structure is allocated using devm_kzalloc() during probe, meaning
it is freed automatically on device removal. However, if a user process
holds the video device open, the V4L2 file descriptor remains valid. When
the process later closes the file, rga_release() is called and accesses the
freed memory, for example by acquiring the mutex:

mutex_lock(&rga->mutex);

Should the allocation be tied to the v4l2_device or video_device lifecycle
instead of devres?

[Severity: High]
This is a pre-existing issue, but I noticed a potential DMA API violation in
rga_hw_start().

The command buffer is allocated as write-combined coherent memory using
dma_alloc_attrs() with DMA_ATTR_WRITE_COMBINE. Later, the driver attempts
to sync this buffer to the device:

dma_sync_single_for_device(..., ctx->cmdbuf_phy, ...);

Since the sync functions are intended for streaming DMA mappings and not
coherent allocations, could this corrupt internal state or trigger DMA API
debug warnings?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260606-spu-rga3mu=
lticore-v1-0-3ec2b15675f7@pengutronix.de?part=3D6

