Return-Path: <linux-media+bounces-63489-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NVbOJu7DH2qKpgAAu9opvQ
	(envelope-from <linux-media+bounces-63489-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 08:04:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B61634801
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 08:04:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=jkCQ3ucD;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63489-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63489-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 924B4301F191
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 05:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8E093F4DD3;
	Wed,  3 Jun 2026 05:58:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354FC314B8F
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 05:58:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780466314; cv=none; b=ECQujxDBoGHID7MMoilMr54tr23M/krb0sqCSNB6u3czlcdejq6cOAseonWwiLLdq4pxHHr278Fi2eRThBN045WtjzY9n+SOHzHydUeCV5hgUXEE2pEe2P92CjcYX1VVkT0vyi8M2aGsswy2/8EeGnAXsYgQH9NS7ul5Ic9UrMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780466314; c=relaxed/simple;
	bh=H3iqtrw+2BParPONBP5c8uTdS0dxVvtTQh8AgenNjbM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ldoueF2NHdyBKtSI9fWTPQTf6k6h+tLZ9XZY+ARJfPywFm2oCp473/X+bWnf4IHeErNeOHvgtFPX6o17ZLPPWL5zDTcIY3WTX9DNqhxTP20JX8vylZ4dElP9W4pgsl/w4lBP1QtTVdRATlG8/R3KrG1k2jiBOOmI6IPnTQbfd4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jkCQ3ucD; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE2B61F00893;
	Wed,  3 Jun 2026 05:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780466312;
	bh=2SQOMEGF3GxXHksa6PWY8tGoxw2JIfix2JjBEne5PIY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jkCQ3ucDPLPNVlF5+IMERBUKKv5kfVjNXv5x3s8I6IskLHjwy2Fz/1fTGPAsLa5Oz
	 NWgerg4zsQLlvXGf4dr3ChQ74+XZy0mQoX0XUB0vk3eGXsofMHon8nEBe6PyzUotjo
	 IU7Utd18Y0wv94dfifOLbQVzk7m2jO2zytSDWUwUEgsyZZF221WnMEDhlFFErMinS0
	 SIsNW2nwnHh8614Jnja6QMvFKbcTljCqSySnmRwRcqX0WDH5v98yn06bj+p78JLrdj
	 iT8qyp5C2tW+5COQjN/Y7fYpJJSj7O/niSG0XyqA3Uio+4aVEgOJYrvNe4cyg/toGA
	 hrnTZJz1nEEPw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] media: qcom: camss: vfe-17x: dispatch wm_done per
 write master
Reply-To: sashiko-reviews@lists.linux.dev
To: "Herman van Hazendonk" <github.com@herrie.org>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260603054238.562902-2-github.com@herrie.org>
References: <20260603054238.562902-2-github.com@herrie.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 05:58:32 +0000
Message-Id: <20260603055832.AE2B61F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-63489-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:github.com@herrie.org,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sashiko.dev:url,lists.linux.dev:replyto,herrie.org:email,smtp.kernel.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F1B61634801

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The VFE ISR mistakenly checks the `STATUS_1_RDI_SOF(i)` bitmask ag=
ainst the `status0` register instead of `status1`, missing actual SOF inter=
rupts and ignoring `status1` entirely.
- [High] The loop reading `VFE_BUS_IRQ_STATUS` registers is incorrectly bou=
nded by `vfe->res->line_num`, leading to out-of-bounds bus IRQ register rea=
ds and writes.
- [High] Bit collision occurs between `STATUS_0_RDI_REG_UPDATE(VFE_LINE_PIX=
)` and `STATUS_0_IMAGE_MASTER_PING_PONG(0)` as both evaluate to `BIT(8)`.
--

commit 53bcc62d295e9993945dc677a919dd6bb05592da
Author: Herman van Hazendonk <github.com@herrie.org>
Subject: media: qcom: camss: vfe-17x: dispatch wm_done per write master

This commit updates the wm_done dispatch loop to correctly use the
STATUS_0_IMAGE_MASTER_PING_PONG macro with the loop iterator. Previously,
it checked a constant BIT(9) which caused interrupts for other write
masters to be dropped and stalled their video streams.

> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-17x.c b/drivers/=
media/platform/qcom/camss/camss-vfe-17x.c
> index e5ee7e717b3bc..3ad0c3be005f3 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-17x.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
> @@ -364,7 +364,7 @@ static irqreturn_t vfe_isr(int irq, void *dev)
>  			vfe->isr_ops.comp_done(vfe, i);
> =20
>  	for (wm =3D 0; wm < MSM_VFE_IMAGE_MASTERS_NUM; wm++)
> -		if (status0 & BIT(9))

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing the ISR,
is status1 read but subsequently ignored?

In vfe_isr():

	status1 =3D readl_relaxed(vfe->base + VFE_IRQ_STATUS_1);
	...
	for (i =3D VFE_LINE_RDI0; i < vfe->res->line_num; i++)
		if (status0 & STATUS_1_RDI_SOF(i))
			vfe->isr_ops.sof(vfe, i);

The STATUS_1_RDI_SOF(i) bitmask is checked against status0 instead of
status1. Does this missed evaluation of status1 cause genuine SOF
events and critical system interrupts to be permanently ignored?


[Severity: High]
This is a pre-existing issue, but does the loop reading
VFE_BUS_IRQ_STATUS registers go out of bounds?

In vfe_isr():

	for (i =3D VFE_LINE_RDI0; i < vfe->res->line_num; i++) {
		vfe_bus_status[i] =3D readl_relaxed(vfe->base + VFE_BUS_IRQ_STATUS(i));
		writel_relaxed(vfe_bus_status[i], vfe->base + VFE_BUS_IRQ_CLEAR(i));
	}

For VFE 170 configurations where line_num can be 4, does this loop exceed
the 3 available bus IRQ status registers?

If i =3D 3, VFE_BUS_IRQ_STATUS(3) calculates to offset 0x2068
(VFE_BUS_IRQ_CLEAR_GLOBAL), and VFE_BUS_IRQ_CLEAR(3) maps back to
VFE_BUS_IRQ_STATUS(0).

Can this lead to reading the global clear register and illegally writing
its value directly into the hardware status register STATUS(0)?


[Severity: High]
This is a pre-existing issue, but could we have a bit collision between
STATUS_0_RDI_REG_UPDATE() and STATUS_0_IMAGE_MASTER_PING_PONG()?

Looking at the macro definitions:

#define		STATUS_0_RDI_REG_UPDATE(n)		BIT((n) + 5)
#define		STATUS_0_IMAGE_MASTER_PING_PONG(n)	BIT((n) + 8)

For VFE_LINE_PIX (which maps to 3), STATUS_0_RDI_REG_UPDATE(3) evaluates
to BIT(8). Concurrently, STATUS_0_IMAGE_MASTER_PING_PONG(0) also maps to
BIT(8) for Write Master 0.

When a WM0 ping-pong interrupt asserts BIT(8) in status0, does the ISR
misinterpret it as a register update for line 3 and trigger a spurious
vfe->isr_ops.reg_update(vfe, 3) call?

> +		if (status0 & STATUS_0_IMAGE_MASTER_PING_PONG(wm))
>  			if (vfe_bus_status[1] & STATUS1_WM_CLIENT_BUF_DONE(wm))
>  				vfe->isr_ops.wm_done(vfe, wm);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603054238.5629=
02-1-github.com@herrie.org?part=3D1

