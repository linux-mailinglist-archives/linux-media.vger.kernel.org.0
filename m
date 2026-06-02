Return-Path: <linux-media+bounces-63441-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9qZCDj9IH2pSjgAAu9opvQ
	(envelope-from <linux-media+bounces-63441-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 23:16:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B61F6320CF
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 23:16:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="YKe/2DGX";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63441-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63441-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8BB873027973
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 21:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F95839D6E8;
	Tue,  2 Jun 2026 21:15:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CAD314D35
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 21:15:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780434952; cv=none; b=hJ5jvxdErooTbSGOg01RLdfBvYyIUtuRZlYaSTeT2q+aNKpt54nFDcUWrbgng8gj3NwPvA5A2+Qhv4DPXH/O9lgXd5aP1ZXpY7wG2jCpTVqCD7F3F8NWJfmKtGTU+I50ntHauV3NGJPEUqRZtv7zHWsPZfkd518NYsbuwACfz0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780434952; c=relaxed/simple;
	bh=AFkHQLBo9ZqjJyWa17QxyabYsOrJd5zxZTmwhedLG0Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cqfOQaIhHGafRC8H7qhxmj5szmXes/RrywbZNeD/9da5tI6qHFAldwPyUDP1kXxfW7oHc9vhi8hNL5Nr0XQ0CkDys13DPZN2aaiMytGFUp5LLPO5I30kUitfzA4CyZp2b36W4EqmfQl1sAznciggNxfKKwhYPBbZAeWBoWiw0sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YKe/2DGX; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61F1A1F00893;
	Tue,  2 Jun 2026 21:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780434951;
	bh=gRr9Fhx303Oko7viNusMknvoZ4J7tN76s/lo7mrr9yU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YKe/2DGXorBEUaPeOodfJh8tYWIHFQcJlRohTJFk9Nzhotm+H/EdC3AyhZ289wzNU
	 ylYt1JH/ZeTWfIyUYH7g6hX6BQuIpIAeF8/W+AGLzNC+p5xaX4dr/Xyi0mI+d6dtDS
	 es7Im3KvGXxzrfFrM8XJ10rMhehKhieUhGaZFvs1BSKpkp6cII5F0y/MbM0it3Gu55
	 BC+5lfPcCQ6Pq02QR8chZt2MuA+whJMVR0k77Iov/udLybHr9lqRB4wL7/mRqP6MUU
	 NF1YY0mzY/hnA+kX7x9bT//9yGCgayRzKrspme64ziwiArgSB1VNC3Ub4logeQx6nZ
	 cLMuion55ppIA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] media: iris: Fix FPS calculation and VPP FW overhead
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bod@kernel.org>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260602-fixbranch-v1-1-b8eccaad6d17@kernel.org>
References: <20260602-fixbranch-v1-1-b8eccaad6d17@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 21:15:50 +0000
Message-Id: <20260602211551.61F1A1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	TO_EXCESS_BASE64(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-63441-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,sashiko.dev:url,smtp.kernel.org:mid,lists.linux.dev:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9B61F6320CF

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] 32-bit integer overflow in `mult_frac` frequency calculation affec=
ts both 32-bit and 64-bit platforms.
- [High] Critical 32-bit integer overflow when calculating `vsp_cycles` lea=
ds to severe VPU under-clocking on 32-bit platforms.
--

commit 77f6f57aadf558885bf4697f0e3df01315999c7b
Author: Bryan O'Donoghue <bod@kernel.org>

media: iris: Fix FPS calculation and VPP FW overhead

This commit replaces the mult_frac() macro with div_u64() for calculating
vpp_cycles. This fixes a compilation issue on 32-bit systems lacking libgcc,
where 64-bit operator division would otherwise fail.

Fixes: 5c66647a5c3e ("media: iris: add FPS calculation and VPP FW overhead =
in frequency formula")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202606030132.qnBXVDkM-lkp@int=
el.com/

> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers=
/media/platform/qcom/iris/iris_vpu_common.c
> index 5a85568c5ee1c..37dbfe433a085 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -444,7 +444,7 @@ u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_=
inst *inst, size_t data_siz

[Severity: High]
This is a pre-existing issue, but can the call to mult_frac() for vpp_cycles
earlier in this function overflow on both 32-bit and 64-bit platforms?

In iris_vpu3x_vpu4x_calculate_frequency():
    vpp_cycles =3D mult_frac(mbs_per_second, caps->mb_cycles_vpp, ...);

Because mbs_per_second is a u32, the mult_frac() macro performs the internal
multiplication in 32-bit arithmetic.

For high resolutions and framerates natively supported by the driver,
mbs_per_second exceeds 21.4M. Multiplying this by caps->mb_cycles_vpp
(e.g., 200) produces a value greater than 4.29 billion, wrapping around the
maximum 32-bit unsigned limit.

Could this regression result in severely under-provisioning the hardware VPU
clock and causing encoding or decoding failures?

> =20
>  	/* 1.05 is VPP FW overhead */
>  	if (inst->fw_caps[STAGE].value =3D=3D STAGE_2)
> -		vpp_cycles +=3D mult_frac(vpp_cycles, 5, 100);
> +		vpp_cycles +=3D div_u64(vpp_cycles * 5, 100);
> =20
>  	vsp_cycles =3D fps * data_size * 8;

[Severity: High]
This is a pre-existing issue, but does this calculation overflow on 32-bit
platforms?

The variable fps is a u32, data_size is a size_t, and 8 is an int. On 32-bit
architectures, this multiplication evaluates entirely in 32-bit arithmetic
before being zero-extended and assigned to the 64-bit vsp_cycles variable.

For standard 4K 60fps encoding, an uncompressed data_size of around 12.4MB
yields 60 * 12441600 * 8 =3D 5,971,968,000, which wraps around the maximum
32-bit limit.

Since this patch explicitly addresses 32-bit systems, will this regression
cause the VSP to be severely under-clocked during common use cases on those
platforms?

>  	vsp_cycles =3D div_u64(vsp_cycles, 2);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602-fixbranch-=
v1-1-b8eccaad6d17@kernel.org?part=3D1

