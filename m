Return-Path: <linux-media+bounces-63821-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RPvCB/KPIWq/IwEAu9opvQ
	(envelope-from <linux-media+bounces-63821-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 16:47:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8645064104C
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 16:47:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=b50KMpPk;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63821-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63821-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F4213123F43
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 14:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 128E047DFB5;
	Thu,  4 Jun 2026 14:38:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C59C29CE9;
	Thu,  4 Jun 2026 14:38:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780583912; cv=none; b=VZ5zxBqvdmaiXWWmDkuo3c8eHeci9EPeiY9IQ670oLIP9fyeyj2KChDNMKJ6iR0jKIoOaUbY3U6ZD0WX5UF3Qz/Rz3Ntlc0hTRyBiYg3hhhpagWYPhngP6P7E/zzvXIdbnAF4FoE00RpI0oJCspXAhU9TB8fEo8n92N2rigOxbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780583912; c=relaxed/simple;
	bh=l8SZCQlufwkNmMTNS/NTPn7mBB2pWN2AmiJeO267xSQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MJCoG0AwrlrCFvI4u3Rl6kwVrfX5ouNDHuiHTmzwW8S5d/CqP2LvZjKV+cbm0X1SnrW6DojwirEjFGfmuZf+d6m6Jc58geseIT/q5OBIoMlrTUNpj/HBFcTPbXWBZa3A5GAAY5FLtZxBXeJMcTtQjUVHvSTgvgB7pDNK/SKflKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b50KMpPk; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0C041F00893;
	Thu,  4 Jun 2026 14:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780583911;
	bh=jvposAUUs7cpSN+Fz4BJ/jcjANKZM+i0EUusf2VqnAc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b50KMpPkGDOTbiIvCwmQRjhhJMgdWP/wAcOBjTM1VeHqSu/WZjhtnhK8cKBScqdYR
	 TlgAdNAhszP/QlkbvUQeSPBH2y4Ibj/PG4uo0P585WqN7g8qJo9EarurYCnTZLp0RZ
	 i15kew4pNOTZxpwQc6d0ld6zEfCIQM/ZIRfUG/4wHW1AVcM/6D9RvRdZiibrc513HF
	 EjU2vZWzYWiCTmMw6sQV/QPrFZWekh4x8iASEfDo7rR1nd/waF26e00hW8n+Ht4IuU
	 w2IonbJOyGnlaFBUMCDnwWj83bang9y4mb3rU1ygUcLZoJw4v8TMUIGFUc8+8zTHjo
	 ydTttcqhB2xHA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 17/22] media: i2c: maxim-serdes: add MAX96724 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan via B4 Relay" <devnull+dumitru.ceclan.analog.com@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, linux-media@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260604-gmsl2-3_serdes-v13-17-9d8a4919983b@analog.com>
References: <20260604-gmsl2-3_serdes-v13-17-9d8a4919983b@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 14:38:30 +0000
Message-Id: <20260604143830.C0C041F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,smtp.kernel.org:mid,sashiko.dev:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TAGGED_FROM(0.00)[bounces-63821-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:devnull+dumitru.ceclan.analog.com@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-media@vger.kernel.org,m:robh@kernel.org,m:devnull@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dumitru.ceclan.analog.com,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8645064104C

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] max96724_phy_id() unconditionally aliases disabled PHY 1 to hardwa=
re PHY 0, causing TPG routing to corrupt active video on MAX96712.
--

commit 7c9381a0fe7a58d01cf134ab630461bdeb994484
Author: Cosmin Tanislav <demonsingur@gmail.com>

media: i2c: maxim-serdes: add MAX96724 driver

Add a new MAX96724 driver that also supports MAX96712, MAX96724F
and MAX96724R, integrating it with the common deserializer framework.

> diff --git a/drivers/media/i2c/maxim-serdes/max96724.c b/drivers/media/i2=
c/maxim-serdes/max96724.c
> new file mode 100644
> index 0000000000000..7fc51254e1ef4
> --- /dev/null
> +++ b/drivers/media/i2c/maxim-serdes/max96724.c
[ ... ]
> +static unsigned int max96724_phy_id(struct max_des *des, struct max_des_=
phy *phy)
> +{
> +	unsigned int num_hw_data_lanes =3D max_des_phy_hw_data_lanes(des, phy);
> +
> +	/* PHY 1 is the master PHY when combining PHY 0 and PHY 1. */
> +	if (phy->index =3D=3D 0 && num_hw_data_lanes =3D=3D 4)
> +		return 1;
> +
> +	if (phy->index =3D=3D 1 && !des->phys[1].enabled)
> +		return 0;

[Severity: High]
Could this unconditional aliasing of disabled PHY 1 to hardware PHY 0 cause
test pattern generator (TPG) routing to corrupt active video on MAX96712?

If PHY 0 is operating in a standard 2-lane configuration and actively
streaming real video, and PHY 1 is disabled, this returns 0 without
verifying if PHY 0 is actually configured in a 4-lane mode.

On MAX96712, set_pipe_phy is not supported. When the TPG is enabled, dummy
remaps are set up for unused pipes to discard the globally injected TPG dat=
a,
routing them to an unused PHY (e.g., PHY 1). If max96724_set_pipe_remap()
evaluates the hardware ID for this unused PHY using max96724_phy_id(), it
gets hardware ID 0 instead of 1.

Will this cause the hardware to route the unmapped TPG data directly into
PHY 0 and corrupt the active video output stream?

> +
> +	return phy->index;
> +}
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604-gmsl2-3_se=
rdes-v13-0-9d8a4919983b@analog.com?part=3D17

