Return-Path: <linux-media+bounces-63469-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ltm0K9h0H2p6mAAAu9opvQ
	(envelope-from <linux-media+bounces-63469-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 02:27:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 244FC633324
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 02:27:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=d2mEDmDO;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63469-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63469-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3996C30258BE
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 00:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA70D223DE9;
	Wed,  3 Jun 2026 00:26:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEAB18BBAE
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 00:26:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780446417; cv=none; b=GvuokcNUshhF/zto8aB/g5yP2xvvbCo6XOlN5WjR2UfV3Dqr87PztOVF/iswAe4q4pmM2v33B+eoeqkxnwkVKuHG+fF2DBBp/2p/7P8SFxn/T46Q7/D0KSbirncAfzQt1qB6eRidVvrC9pm+KbXF2mTsLXwHMmLzW8x8iUXiFDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780446417; c=relaxed/simple;
	bh=wPe29ZcqIIa6vxYNWIHN2qtPjQy6lk7rGtLHlp2D148=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FLZPdd1eyModvkZEF2McCOgjfj90rdISX0uvsP/zgIHQmYksrZN6TlwjldQZuLM+QbZL8FhZUIZrFghKDepVS+f3izsOS6gWNT/q7RWtdA2nq6VSKUB284corlzoWOhdkB/bboWPrIwq6ZeEhVuWpXqPwOTXUBm7xd/7S78m3IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d2mEDmDO; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4729D1F00893;
	Wed,  3 Jun 2026 00:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780446416;
	bh=jy+h/sosdtYwkuWdHW3uH2xHGiU3gVppku29f+SqI8c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d2mEDmDOTaIwV25iWvWIfJS6cXi1O6jC8QZ81tsCRwmR2bkJ8iF92hRVM2jDSyJ18
	 Q6S/Ybc269rqotsU8fD0X04NPlMY+wDsYaCkuaSXq12WYTEs1u6ySL9DQghIvj32Nd
	 A2aLY/pxUA1/FScyrhlyFr8EYisbB/i9y+Ts+4NB3ZAYw4K610OV/Qp2oGz54p9PTM
	 3bajhLrwZz5sINmwFlC8zscT7EbIrwhDCdl4QhtYesP9DxwtY4iMVqKtdu93cEyk5z
	 RHyLPm+/MP9FVB0TDeZTB3KVpv3z+NfdCeEv6DITRR7GR7iROKFFiE9DA/lsxsaMBi
	 EMhoa5OJdgJlg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 5/8] media: qcom: camss: csiphy-3ph: Add Gen2 v1.1
 MIPI CSI-2 C-PHY init
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg via B4 Relay" <devnull+david.ixit.cz@kernel.org>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260603-qcom-cphy-v6-5-e50de0b557a8@ixit.cz>
References: <20260603-qcom-cphy-v6-5-e50de0b557a8@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 00:26:54 +0000
Message-Id: <20260603002655.4729D1F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-63469-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,lists.linux.dev:replyto,vger.kernel.org:from_smtp,ixit.cz:email,sashiko.dev:url,smtp.kernel.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 244FC633324

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch introduces the use of `CSIPHY_SETTLE_CNT_HIGHER_BYTE` in =
`lane_regs_sdm845_3ph`, but the driver lacks support for it in `csiphy_gen2=
_config_lanes()`, creating a brittle hidden fallback.
--

commit 58f98987d0e532a5cd22b2d977566527a7e3b7b9
Author: David Heidelberg <david@ixit.cz>

media: qcom: camss: csiphy-3ph: Add Gen2 v1.1 MIPI CSI-2 C-PHY init

Add a PHY configuration sequence for the sdm845 which uses a Qualcomm
Gen 2 version 1.1 CSI-2 PHY. The PHY can be configured as two phase or
three phase in C-PHY or D-PHY mode. This configuration supports three-phase
C-PHY mode.

> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/d=
rivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index 938c365eb352f..13d7372bd225d 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
[ ... ]
> @@ -220,6 +228,72 @@ csiphy_lane_regs lane_regs_sdm845[] =3D {
>  	{0x0664, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
>  };
> =20
> +/* GEN2 1.0 3PH */
> +/* 3 entries: 3 lanes (C-PHY) */
> +static const struct
> +csiphy_lane_regs lane_regs_sdm845_3ph[] =3D {
> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(23), 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(26), 0xa0, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(27), 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(1),  0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(3),  0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER=
_BYTE},
> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(2),  0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHE=
R_BYTE},

[Severity: Low]
Does the driver actually support writing the higher byte of the settle count
here?

Looking at csiphy_gen2_config_lanes() in this file, the switch statement
doesn't handle CSIPHY_SETTLE_CNT_HIGHER_BYTE:

		switch (r->csiphy_param_type) {
		case CSIPHY_SETTLE_CNT_LOWER_BYTE:
			val =3D settle_cnt & 0xff;
			break;
		case CSIPHY_SKEW_CAL:
			/* TODO: support application of skew from dt flag */
			continue;
		case CSIPHY_DNP_PARAMS:
			continue;
		default:
			val =3D r->reg_data;
			break;
		}

Since the case is missing, it falls through to the default case and writes
the hardcoded 0x00 value from the array instead of actively evaluating the
higher byte of the calculated settle count.

This happens to work right now because csiphy_settle_cnt_calc() returns a u=
8,
so the higher byte would always be zero anyway, but it renders the
CSIPHY_SETTLE_CNT_HIGHER_BYTE tag meaningless.

> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(5),  0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(20), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-qcom-cphy-=
v6-0-e50de0b557a8@ixit.cz?part=3D5

