Return-Path: <linux-media+bounces-63468-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id txUTHYtyH2oTmAAAu9opvQ
	(envelope-from <linux-media+bounces-63468-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 02:17:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBF9633245
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 02:17:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="FQkn/9VC";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63468-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63468-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 822E1308888D
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 00:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 123FC1474CC;
	Wed,  3 Jun 2026 00:13:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900B07E105
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 00:13:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780445632; cv=none; b=KElFwX6MUt6QNgGczqAcb3NBzn4NXEQaYjxVbGWvIfLaGrAdjDduPPJbdBRYI0wfEIzOpJVYUVrHvtYOD+dceixT9/VmHsXq/FJTZjVGpUbfXc2yyWmVHSG+3bPgSgBMTKLsgVexvQOzaAHtFFqhuuhR2pfcAh6heeSFo+E1ipc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780445632; c=relaxed/simple;
	bh=Ij5AlUn3kLgLzPJL40KNFQuV8/HGTi46/4jD2ciUm7U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Zaxx55il8mKgNGqxhyOeBraBPL22eKcOpyK6KfmMLtOMEHex+xd+Xp5qYg6xFzlpFwn3yVR4bUpx/PzA29/6Gd2Ck25CYneV2DcSCrjgUh9a823Fz2GunxUHb9hXQHjxb3G5kPY8YG8ufUB3gDu+MzZb2k6evybhXhI1v3iDSSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FQkn/9VC; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 126A91F00893;
	Wed,  3 Jun 2026 00:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780445631;
	bh=vgHGYbC+22EDodcb7j+X9k/BVwtZ0R8aLGYD27P8pYE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FQkn/9VC6ZtGvDYiTgPVCdq1RqT7h1t3Rt0ML/BuMo2VWiEqHY1VtCUI1Y86Deqhd
	 dl/Tu/TGpqT7Wt6lK1y+eO4vgj0pk7HJxhcqrAEHT8iO3Z92te+p7VAsgEodhFggsR
	 eoHXZ3M2IvtWO+YMR6+z7+IxY3weCjsLG0K92rhvIpPzvizmwsu2CW7+L4J9FxcmTz
	 QAKTDxq7SPUIlOD7QkGagjMgxTRUUA/9Px9EWY32JVX0p86lQLCmPfSPpipfID7nzq
	 xrhirBojGarkp2an74Mg95jI8hS6SjL4y+EuMrhx1Vlc2mzwN5tIE3NHps5oLMmpWs
	 0FNM4BnBqQzzg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/8] media: qcom: camss: Initialize lanes after lane
 configuration is available
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg via B4 Relay" <devnull+david.ixit.cz@kernel.org>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260603-qcom-cphy-v6-4-e50de0b557a8@ixit.cz>
References: <20260603-qcom-cphy-v6-4-e50de0b557a8@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 00:13:50 +0000
Message-Id: <20260603001351.126A91F00893@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-63468-lists,linux-media=lfdr.de];
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
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,david.ixit.cz];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lists.linux.dev:replyto,vger.kernel.org:from_smtp,sashiko.dev:url,ixit.cz:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BCBF9633245

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch introduces an unconditional read of uninitialized heap=
 memory (`regs->lane_regs`) for Gen1 platforms in `csiphy_lanes_enable()`.
--

commit 55583036179e2bfc17906697e5da8e0e61d94891
Author: David Heidelberg <david@ixit.cz>

media: qcom: camss: Initialize lanes after lane configuration is available

This commit delays lane initialization until after the lane configuration
is available, as it depends on whether D-PHY or C-PHY mode is in use. It
moves the lane initialization switch statement into csiphy_lanes_enable().

> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/d=
rivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index 15876eb973718..938c365eb352f 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -1168,6 +1168,98 @@ static void csiphy_lanes_enable(struct csiphy_devi=
ce *csiphy,
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
Will this evaluate uninitialized heap memory for Gen1 platforms?

Looking at csiphy_init(), regs is allocated using devm_kmalloc(), which
does not zero-initialize memory:

drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c:csiphy_init() {
    ...
	regs =3D devm_kmalloc(dev, sizeof(*regs), GFP_KERNEL);
	if (!regs)
		return -ENOMEM;

	csiphy->regs =3D regs;
    ...
}

For platforms that fall through to the default case in the switch block
above, regs->lane_regs remains uninitialized when it is subsequently
evaluated here. Could this regression lead to undefined behavior and
potential false positives or negatives for the C-PHY warning?

> +		WARN_ONCE(1, "Missing lane_regs definition for C-PHY!\n");
> +
>  	settle_cnt =3D csiphy_settle_cnt_calc(link_freq, csiphy->timer_clk_rate=
);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-qcom-cphy-=
v6-0-e50de0b557a8@ixit.cz?part=3D4

