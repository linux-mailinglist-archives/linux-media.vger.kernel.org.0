Return-Path: <linux-media+bounces-63918-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ez2qBF/SImpDeAEAu9opvQ
	(envelope-from <linux-media+bounces-63918-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 15:42:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E286489C6
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 15:42:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Yhan3UcA;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63918-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63918-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB8D0302A2D5
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 13:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60988303CAE;
	Fri,  5 Jun 2026 13:40:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C19D3090D4
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 13:40:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780666848; cv=none; b=rtdXyqvW47DK/H5QQGHUCLtAw7YpnF5T3qMh9BjIF1RQXEwjJ7PSsDj5DhYkILgi7ykNK7E0Nvga/4cmH9U7W9GOOfBjgNAHv2pip+ta1/qWvvyhIKzb9j1V6WSdFmSXcW/nuOL7+KhGvHN9cfIDa+476p5/tVhdgYFFJcDw3v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780666848; c=relaxed/simple;
	bh=LvgrAs/kLFXxLVDe+Ce4+0Cy2SO+AelWL0VKUCa0fuY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P27l8+7vLHzlviV7XwjTDNDiUB8E9Au+djPNpzCXx3OyuK9vNwvgCwqZDLTJwUaVWtMa9Vo+k1fIQnBASUH1O+CJF/j4ovuXppu6XodxERUFzX5ktUT/TaGCUkqOfJOZx8pFOZ2S3StGEysfljkwsCGKUZ4zxbtenxzICP0XkHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yhan3UcA; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 597EC1F00893;
	Fri,  5 Jun 2026 13:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780666847;
	bh=yqOmVFLZasGg85Lw9BF0RvKbNjJNh6H7peZVbX8wJrg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Yhan3UcAjTONdr250Zf4Vljbo+RIrXawwJqcw6rMHPy8ZsuaWaBCB4Pv2uusdxnrc
	 +fN17f2ZtDr+02kzWWzl7KjiVb+aCekK6nlJM+ngYzw1slkw2kGowP8ezsYQOhag8y
	 44UCzD+aulrXWEu+K80qRYcC/QkT7qcBvfrA0d0HJWCaqIh1o/7xc7gLyuI9ikVkGl
	 FySTrNdDmDx0VKq7n+vMSKz+kor6PQIUoeTfcri751Lo5h9yOWgQBYf5QwJkv1KGnL
	 g8ZwdClJKmRqwCNMNmSxh4PxO/NyC/7uovdugwIMaSg7m3uZ8xG7c41dqJU+XbdUi9
	 SgI9vBiONWwUg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 4/8] media: qcom: camss: Initialize lanes after lane
 configuration is available
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg via B4 Relay" <devnull+david.ixit.cz@kernel.org>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260605-qcom-cphy-v7-4-426c37e9008f@ixit.cz>
References: <20260605-qcom-cphy-v7-4-426c37e9008f@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 13:40:46 +0000
Message-Id: <20260605134047.597EC1F00893@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-63918-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:devnull+david.ixit.cz@kernel.org,m:linux-media@vger.kernel.org,m:devnull@kernel.org,s:lists@lfdr.de];
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
	TAGGED_RCPT(0.00)[linux-media,david.ixit.cz];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ixit.cz:email,vger.kernel.org:from_smtp,lists.linux.dev:replyto,smtp.kernel.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 66E286489C6

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Uninitialized memory read in csiphy_lanes_enable() for Gen 1 SoCs
--

commit 29ea95d7cd0cd620b740a193084b2b2f90d4327e
Author: David Heidelberg <david@ixit.cz>

media: qcom: camss: Initialize lanes after lane configuration is available

The lanes must not be initialized before the driver has access to
the lane configuration, as it depends on whether D-PHY or C-PHY mode
is in use. Move the lane initialization to csiphy_lanes_enable which is
called when the configuration structures are available.

> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/d=
rivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index fa24fc9706748..c76b9c352ea02 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -1168,6 +1168,98 @@ static void csiphy_lanes_enable(struct csiphy_devi=
ce *csiphy,
>  	u8 val;
>  	int i;
> =20
> +	switch (csiphy->camss->res->version) {
[ ... ]
> +	case CAMSS_8300:
> +	case CAMSS_8775P:
> +		if (c->phy_cfg =3D=3D V4L2_MBUS_CSI2_CPHY) {
> +			regs->lane_regs =3D NULL;
> +			regs->lane_array_size =3D 0;
> +		} else {
> +			regs->lane_regs =3D &lane_regs_sa8775p[0];
> +			regs->lane_array_size =3D ARRAY_SIZE(lane_regs_sa8775p);
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	if (!regs->lane_regs && c->phy_cfg =3D=3D V4L2_MBUS_CSI2_CPHY)

[Severity: Medium]
Since regs is allocated with devm_kmalloc() in csiphy_init() and is not
zero-initialized, could regs->lane_regs contain garbage for Gen 1 platforms
that fall through to the default case above?

Because && evaluates left-to-right, this condition evaluates !regs->lane_re=
gs
first, resulting in a read of uninitialized heap memory.

> +		WARN_ONCE(1, "Missing lane_regs definition for C-PHY!\n");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605-qcom-cphy-=
v7-0-426c37e9008f@ixit.cz?part=3D4

