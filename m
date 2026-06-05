Return-Path: <linux-media+bounces-63908-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TNWlDobPImrVdwEAu9opvQ
	(envelope-from <linux-media+bounces-63908-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 15:30:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 378266488A9
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 15:30:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ZHKcXO3G;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63908-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-63908-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5EDD130055C9
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 13:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 035041EBFE0;
	Fri,  5 Jun 2026 13:30:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF7140E8EC
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 13:30:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780666236; cv=none; b=qkeB+DtM2ctYE6StFniMMHkeD7jE33j2ZFNFJxtedwffx0+rhGkPEfoMIXPk9MLjUXRBtj65y0QBsfDB6tPs/A7Zu7uf3n6EQam6GcRwOvFa/hL1f204VZ4vVabW0l6Phj2ESsUTGXa/FNAyl/jXLtOEIOwtaelvZLh2q9ixjTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780666236; c=relaxed/simple;
	bh=ujGokoz1aOpKIyYOCgRd4NH4I1kHRbo92XVd2t6X0Fw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aUytBbbJf+5yZ6buZBW1iXGINsArXF+ODMlVPo2JlelkRF2q6BpQcSatAsilTZ+tAvn4OBD8Er6KiwbVLBPeY0zTYMZjzZEw31QtANRDcudcpDENOBFl38v1lzpgu5xV2Qr5PEkcFUTYzAgZcw9C5dYFEmk2c9swu8+rm+iAYAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZHKcXO3G; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1273F1F00893;
	Fri,  5 Jun 2026 13:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780666235;
	bh=Lue4TA2r/hBzzyGhrJWVUxEsy0tYtPVoVgjK8cBr0Cc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZHKcXO3GrjvSsFuEjw4/LKTjaDd/hYBJhXG+eHJDL6YyQkSubPL9xDgKspFnxvsN7
	 Q+MNPzK3v39ErX+NKMoTbnf2tbwRq53NV6Z80E85tA6RShRD1elxQ7cX0F8ItsN1tM
	 p55AMsKHfYKoO3zM+XntmMCzws47dTtU9D0JGqzZON2EV2NF/96fYvjtsZrmjnnPxf
	 lzycM11xVCb5PYrEbZrkTHHGgQhkPRNEmvdBr/Wcplw87alfbSxPK91UFtI0dtwXIj
	 ul5uLFqMh2jqDGUHTSrDXg1RyBdMeVXMRTwuWKTfQk+tDIzPRy3doCm/ciMDy/k2lN
	 268kBN1+rwjRw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/8] media: qcom: camss: csiphy-3ph: Use odd bits for
 configuring C-PHY lanes
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg via B4 Relay" <devnull+david.ixit.cz@kernel.org>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260605-qcom-cphy-v7-2-426c37e9008f@ixit.cz>
References: <20260605-qcom-cphy-v7-2-426c37e9008f@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 13:30:34 +0000
Message-Id: <20260605133035.1273F1F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-63908-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,smtp.kernel.org:mid,lists.linux.dev:replyto,ixit.cz:email,vger.kernel.org:from_smtp,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 378266488A9

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Commit message claims to return failure but code does not implem=
ent error propagation.
--

commit da5484f83dd0e6203bd1f47a4299fe8d0bb8c433
Author: David Heidelberg <david@ixit.cz>

media: qcom: camss: csiphy-3ph: Use odd bits for configuring C-PHY lanes

This commit adds support for C-PHY lane configuration by utilizing odd
bits instead of the even bits used for D-PHY mode. It updates the lane
mask calculation and enablement routines for C-PHY hardware requirements.

> Since there can be unrecognized configuration allow returning failure.

[Severity: Medium]
The commit message explicitly states "allow returning failure" for
unrecognized configurations, but does the code actually implement this?

Looking at csiphy_get_lane_mask() and csiphy_lanes_enable(), the code does
not appear to propagate any errors. Could the commit message be updated
to reflect the use of warnings, or should the functions be changed to return
an error code?

> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/d=
rivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index dac8d2ecf7995..fa24fc9706748 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
[ ... ]
> @@ -1113,13 +1114,22 @@ static void csiphy_gen2_config_lanes(struct csiph=
y_device *csiphy,
> =20
>  static u8 csiphy_get_lane_mask(struct csiphy_lanes_cfg *lane_cfg)
>  {
> -	u8 lane_mask;
> -	int i;
> +	u8 lane_mask =3D 0;
> +	u8 offset =3D 0;
> =20
> -	lane_mask =3D CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
> +	switch (lane_cfg->phy_cfg) {
> +	case V4L2_MBUS_CSI2_CPHY:
> +		offset =3D 1;
> +		break;
> +	case V4L2_MBUS_CSI2_DPHY:
> +		lane_mask =3D CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
> +		break;
> +	default:
> +		break;
> +	}

[Severity: Medium]
In csiphy_get_lane_mask(), the default case silently falls through and
returns 0. Is this intended to be treated as a failure condition?

[ ... ]
> @@ -1160,9 +1170,22 @@ static void csiphy_lanes_enable(struct csiphy_devi=
ce *csiphy,
[ ... ]
> -	val =3D CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
> -	for (i =3D 0; i < c->num_data; i++)
> -		val |=3D BIT(c->data[i].pos * 2);
> +	val =3D 0;
> +
> +	switch (c->phy_cfg) {
> +	case V4L2_MBUS_CSI2_CPHY:
> +		for (i =3D 0; i < c->num_data; i++)
> +			val |=3D BIT((c->data[i].pos * 2) + 1);
> +		break;
> +	case V4L2_MBUS_CSI2_DPHY:
> +		val =3D CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
> +
> +		for (i =3D 0; i < c->num_data; i++)
> +			val |=3D BIT(c->data[i].pos * 2);
> +		break;
> +	default:
> +		WARN_ONCE(1, "Unsupported bus type %d!\n", c->phy_cfg);
> +	}

[Severity: Medium]
Similarly, since csiphy_lanes_enable() has a void return type, the caller
has no way to detect this failure. While misconfiguration might be
prevented earlier during device tree parsing, does this function need to be
updated to actually return the failure mentioned in the commit message?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605-qcom-cphy-=
v7-0-426c37e9008f@ixit.cz?part=3D2

