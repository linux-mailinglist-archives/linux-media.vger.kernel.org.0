Return-Path: <linux-media+bounces-63428-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vBGtFB8sH2qOiQAAu9opvQ
	(envelope-from <linux-media+bounces-63428-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 21:16:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98449631579
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 21:16:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=BbWncQVM;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63428-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63428-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 95FDE301A723
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 19:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBE883A4F46;
	Tue,  2 Jun 2026 19:09:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD6639A07E
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 19:09:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780427384; cv=none; b=cPwelJ/GSpGij+4AeGUB8D/0cyLoINInHPTrIibLohLn7393iXSRCVDNUAqGGZNupbzlugQGROAm3n62urBYVCflUY0OMac0KF/swoIeQUClYGRefp8FFCo3GPs1uhaOmAOGkLGXK9dytxt9wTDtbYsukG0TwzTlEZVMQwvZ1R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780427384; c=relaxed/simple;
	bh=CGx2abGkrbCzlbLZqguf0DBbCNSsgkSP7qDlJnZIsh8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ih3DN75yqrtYdY8ERIob00skNH241CdUwoaplKnfpoeBLH1ykIo3QiAhXjvi5l65ytAX6ZJ+Acd8fiSbzY6MLBIGorVMEBs9gKNn7izADx+uyiZFGSGIzSvv6dFt/yXRIvyuBLXhxTTC/mtiYuDb7diape0wxrpivqOVcdjMmRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BbWncQVM; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B01E1F00893;
	Tue,  2 Jun 2026 19:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780427383;
	bh=Ys70sVJsBV4jYcuR8/K3tglT7tFbB4f5TZjUC+08Ps4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BbWncQVMJLx+IbugByA2U3OzssUFUI0T8SChkLmq7VmuDurajXtC8sjnhNv712UPh
	 7iFMTk0CbP4mRsWqfy3ibpnctpac1bxOACb54Wel3Ii4C+uwCgK5S9rOJt1CljHd6u
	 FbOqlfCJwDru/NEkUFCg6ytFnaYyvjGLD7tpjvyzXuBACZ5RNoEOFR3Ara62UteclC
	 FjKriyQyuMH5WKZCCT0fvBlRbV1mKuFbAzKcTmE5yMkOHEO9WTDbTUlmSVU64fsEbY
	 aL3IjksJ7zFSCZ9jSH82KoIaj2U0kZzfyT6sKEq1rwLBhR/BnD4NpTi6ddUgiX7Z/3
	 0F2niNM0mMAoQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] media: mali-c55: fix dropped last AEC histogram zone
 weight
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Carlier" <devnexen@gmail.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260602185305.30759-1-devnexen@gmail.com>
References: <20260602185305.30759-1-devnexen@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 19:09:42 +0000
Message-Id: <20260602190943.1B01E1F00893@smtp.kernel.org>
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
	FORGED_RECIPIENTS(0.00)[m:devnexen@gmail.com,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-63428-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lists.linux.dev:replyto,smtp.kernel.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 98449631579

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] Endianness bug places the last AEC histogram zone weight in the =
wrong hardware register byte on big-endian architectures.

Pre-existing issues:
- [High] Casting the unaligned `zone_weights` byte array to `u32 *` causes =
undefined behavior and alignment faults.
--

commit 731a31e43f59014f133f6c66b9d8861ce15cfc76
Author: David Carlier <devnexen@gmail.com>

media: mali-c55: fix dropped last AEC histogram zone weight

The 15x15 AEC histogram metering grid has 225 per-zone weights, packed
by userspace as a u8 array. The driver writes the first 56 registers
(zones 0 through 223) in a loop, then handles the final register on its
own to keep static analysers from flagging the array access.

> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/driv=
ers/media/platform/arm/mali-c55/mali-c55-params.c
> index de0e9d898db7b..33e2232ec8f5b 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> @@ -212,6 +212,7 @@ mali_c55_params_aexp_hist_weights(struct mali_c55 *ma=
li_c55,

[ ... ]

>  	for (unsigned int i =3D 0; i < 56; i++) {
>  		val =3D ((u32 *)params->zone_weights)[i]
>  			    & MALI_C55_AEXP_HIST_ZONE_WEIGHT_MASK;

[Severity: High]
This isn't a bug introduced by this patch, but could this cast in
mali_c55_params_aexp_hist_weights() in
drivers/media/platform/arm/mali-c55/mali-c55-params.c trigger an alignment
fault on strict architectures?

The zone_weights array is located at offset 10 within struct
mali_c55_params_aexp_weights. Because the configuration block resides at a
4-byte aligned offset within the V4L2 buffer, the zone_weights array starts
at an address that is only 2-byte aligned.

Casting this unaligned pointer to a 32-bit pointer and dereferencing it
inside the loop triggers undefined behavior in C. On strict architectures
like ARM with SCTLR.A enabled, or when auto-vectorized by the compiler,
this can trigger kernel alignment faults.

Because userspace controls the V4L2 configuration buffer, can an
unprivileged user use this to trigger a kernel oops and cause a local denial
of service?

>  		addr =3D base + MALI_C55_AEXP_HIST_ZONE_WEIGHTS_OFFSET + (4 * i);
> =20
>  		mali_c55_ctx_write(mali_c55, addr, val);
>  	}
> =20
>  	val =3D params->zone_weights[MALI_C55_MAX_ZONES - 1];
>  	addr =3D base + MALI_C55_AEXP_HIST_ZONE_WEIGHTS_OFFSET + (4 * 56);
> +	mali_c55_ctx_write(mali_c55, addr, val & MALI_C55_AEXP_HIST_ZONE_WEIGHT=
_MASK);

[Severity: Medium]
Is there an endianness issue on big-endian platforms when extracting this
weight as an 8-bit value and implicitly zero-extending it to a 32-bit
integer in mali_c55_params_aexp_hist_weights()?

The original loop processes 4 weights at a time by reading them as a 32-bit
integer and writing that to the memory-backed ctx->registers array. This
preserves the byte stream natively on both architectures.

However, extracting the final 225th weight as an 8-bit value zero-extends
it to a 32-bit integer like 0x0000000E. On big-endian systems, storing this
32-bit value natively places the numeric value at the highest byte address
of the 32-bit word (byte offset 3).

When memcpy_toio() flushes this to the device, will the hardware receive
the weight in the 4th byte of the register instead of the 1st byte (offset =
0)
as it expects, silently corrupting the auto-exposure metering weight?

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602185305.3075=
9-1-devnexen@gmail.com?part=3D1

