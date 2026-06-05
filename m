Return-Path: <linux-media+bounces-63990-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 16x/COhNI2pBogEAu9opvQ
	(envelope-from <linux-media+bounces-63990-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 00:30:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4441664BA3F
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 00:29:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=gonKA8Gg;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63990-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63990-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD5A23021B3A
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 22:26:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F1883C65FE;
	Fri,  5 Jun 2026 22:26:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C4F3C2796
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 22:26:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780698386; cv=none; b=mxV1SeQanET0yXdQTBsDgUKv2ak9MJbvwZaL/LFseT2r0vimBBnBBrSgIZbliGxS2a1sUHP0R8xfBMWEoOfM0zVk03/FvjLtgfcy5ZJk5vVmf71GHh+BMV4WoIkffqW1AulujaW6/RyPvF7ilEwNakLfZus2tRtHmaktPZxTUV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780698386; c=relaxed/simple;
	bh=h2GMTKqTQFp27x4hu27gxe9sCW/q3yD0UYGwiNKwZqQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SXhpmrr9O3wLkx0xpJy/e1Wn9DgU/MoSmleVg43vmVXC3e6ybrTHRSWFt7G3qZzn39vWZa/Mzzcss2yrpr4vkqG2SNgI3NSXrba4/rcXMsIEcO6LMF/JIkgmL0FiK3d9utLVVwoun9cdAepPW5NfEJz4mNo78wxaandMQAOmqIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gonKA8Gg; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 690F01F00893;
	Fri,  5 Jun 2026 22:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780698385;
	bh=PT7VBgtsNWuoeDPqp6P1v6FHnm7MoE3pEC51P30Ti6g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gonKA8Ggi9Ssi5qEnQGYFruA80pETZXluW0Up+QvUCiH0otHCI5W3Mn44mxgRoo5s
	 57RxfJY8GNMiskoyXPQuT5NdPWY0SSC1jBEPiH34cfJSCzsiyHd8MPoEzjKgv6rSNe
	 Qy7oICSnXKyUS6fa4XyfVk8Bty2oHiHav+8mHYTFXu+f4YHQFrYetxoofbUl9yqSmp
	 9HF6Q6pHvUJ7xdHpioVkRvpdBp1upwr0wf+uc8fSAqeluKX5049RwUTzH8dAKcna8m
	 SlR0w5/PIgPKJM4HrqKtPw9BiFk7n0pwmGN6mHpTIpixoyBS4gsA/K7OSRPMjj87c3
	 9VTeqvhsJmzSg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 17/17] iommu/rockchip: disable fetch dte time limit
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3ZlbiBQw7xzY2hlbA==?= <s.pueschel@pengutronix.de>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260606-spu-rga3multicore-v1-17-3ec2b15675f7@pengutronix.de>
References: <20260606-spu-rga3multicore-v1-17-3ec2b15675f7@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 22:26:25 +0000
Message-Id: <20260605222625.690F01F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-63990-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lists.linux.dev:replyto,smtp.kernel.org:mid,vger.kernel.org:from_smtp,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4441664BA3F

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unconditional application of a hardware workaround to all Rockchip=
 IOMMU versions.
--

commit 927dc2f6e4d804f46fcc9640f9c6e784b79d0d3b
Author: Simon Xue <xxm@rock-chips.com>

iommu/rockchip: disable fetch dte time limit

This commit sets bit 31 of the AUTO_GATING IOMMU register to 1 to fix an
issue where the IOMMU blocks after fetching DTE consecutively four times.
It squashes two vendor commits covering RV1126, RK3568, and RK3588 hardware.

> diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iomm=
u.c
> index 0013cf196c573..87ae036d64145 100644
> --- a/drivers/iommu/rockchip-iommu.c
> +++ b/drivers/iommu/rockchip-iommu.c

[ ... ]

> @@ -948,6 +951,11 @@ static int rk_iommu_enable(struct rk_iommu *iommu)
>  			       rk_ops->mk_dtentries(rk_domain->dt_dma));
>  		rk_iommu_base_command(iommu->bases[i], RK_MMU_CMD_ZAP_CACHE);
>  		rk_iommu_write(iommu->bases[i], RK_MMU_INT_MASK, RK_MMU_IRQ_MASK);
> +
> +		/* Workaround for iommu blocked, BIT(31) default to 1 */
> +		auto_gate =3D rk_iommu_read(iommu->bases[i], RK_MMU_AUTO_GATING);
> +		auto_gate |=3D DISABLE_FETCH_DTE_TIME_LIMIT;
> +		rk_iommu_write(iommu->bases[i], RK_MMU_AUTO_GATING, auto_gate);
>  	}

[Severity: High]
The commit message indicates that this issue affects new IOMMU versions
(specifically RV1126, RK3568, and RK3588) and mentions that older versions
do not have this bug.

Does this code apply the workaround unconditionally to all hardware versions
managed by the driver?

If the RK_MMU_AUTO_GATING register is unimplemented, reserved, or has a
different meaning on legacy v1 silicon (such as RK3288 or RK3399), could
reading and writing it trigger an asynchronous bus error or corrupt
undocumented hardware state?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260606-spu-rga3mu=
lticore-v1-0-3ec2b15675f7@pengutronix.de?part=3D17

