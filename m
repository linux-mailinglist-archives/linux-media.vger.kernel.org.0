Return-Path: <linux-media+bounces-63467-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QcGPIW5vH2rBlwAAu9opvQ
	(envelope-from <linux-media+bounces-63467-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 02:03:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CF9633126
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 02:03:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=nLuTzPfn;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63467-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-63467-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B2091301A24D
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 00:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C36F286AC;
	Wed,  3 Jun 2026 00:03:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCDA1EEE6
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 00:03:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780445030; cv=none; b=DzJGMui/qX0Ziz0iUs5eulBRmiBpFQG6j993IfIOKhi8xuf7kGUWbQq1w9L5o9pXZWFJWv4pCXebHTZmJxPSOUsRo2YjnIsjjPzNcq3BVGhafMJ7WE7Jehr4gYknkM7Qa9te/mwwZO2Yejoc13Iocve3aRE587GGI4rPxMfbuog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780445030; c=relaxed/simple;
	bh=hpqBijc91rPkLhnr6Kq72k1be0gGIiIJY9CGoeet5+o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bqTp4yNioJnB2RLNp1GEMWRHgU3WFv+Cuf1dY5mrud1vSKrhI7BdKC9B4KwTyANYCoNxvWGhQ16eFlnxGQEo3TUYO3JAJPG6GedLkeoXPs4sFJsD3Pw1NOYO9R1qmxGV0px6JYkGdbrURZQAnGSwufYHoNeyL7l0W1cef2fgAsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nLuTzPfn; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 734851F00893;
	Wed,  3 Jun 2026 00:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780445029;
	bh=0eI6VTqgEnL0KWs5pBR8zD0JBe1Nc4BdQRi7oH6KeaA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nLuTzPfnH+2t/l0ZGKyIgNtwXNpcLDdPC3UQKVIkrRPut/kp5E1gW77RyuDny+JtD
	 qLh/nM8xHgfkz6BzTT8+ceXs/fUAfk7kLIJuoElJQKCgoPWFFMP2TS0uKDjLMW2k/+
	 5tWT/dLIODyLeYKxtjzigwI+QjadOg/c/o19v6eGuvF0io+PAkC7h0IGogAlrZ5V8Z
	 yIfZkfDrrccNFL2lp6J7d8u9JaNtPGbpD+oyoGUteACo6LmtSAuImP8qwa6PvgBPGu
	 c0EYN84KmeHip7Z8KHXY62X7b2WhKLg+MPFYbvIYW5vUewx1Kis9hH/oVsfnAADTBJ
	 wkgl34sCcaEbw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/8] media: qcom: camss: Prepare CSID for C-PHY
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg via B4 Relay" <devnull+david.ixit.cz@kernel.org>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260603-qcom-cphy-v6-3-e50de0b557a8@ixit.cz>
References: <20260603-qcom-cphy-v6-3-e50de0b557a8@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 00:03:48 +0000
Message-Id: <20260603000349.734851F00893@smtp.kernel.org>
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
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	URIBL_MULTI_FAIL(0.00)[ixit.cz:server fail,sashiko.dev:server fail,lists.linux.dev:server fail,vger.kernel.org:server fail,sin.lore.kernel.org:server fail,smtp.kernel.org:server fail];
	TAGGED_FROM(0.00)[bounces-63467-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:devnull+david.ixit.cz@kernel.org,m:linux-media@vger.kernel.org,m:devnull@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,david.ixit.cz];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:email,sashiko.dev:url,vger.kernel.org:from_smtp,smtp.kernel.org:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 86CF9633126

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] State leak: `csid->phy.cphy` is not explicitly reset when linkin=
g to the Test Pattern Generator (TPG), leading to stale hardware configurat=
ion.
--

commit 0af85d683a316522712652086dfff4934fe24c0c
Author: David Heidelberg <david@ixit.cz>
Subject: media: qcom: camss: Prepare CSID for C-PHY support

Inherit C-PHY information from CSIPHY, so we can configure CSID properly.
CSI2_RX_CFG0_PHY_TYPE_SEL must be set to 1, when C-PHY mode is used.

> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/med=
ia/platform/qcom/camss/camss-csid.c
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -1291,6 +1291,7 @@ static int csid_link_setup(struct media_entity *ent=
ity,
> =20
>  			lane_cfg =3D &csiphy->cfg.csi2->lane_cfg;
>  			csid->phy.lane_cnt =3D lane_cfg->num_data;
> +			csid->phy.cphy =3D (lane_cfg->phy_cfg =3D=3D V4L2_MBUS_CSI2_CPHY);

[Severity: Medium]
Does this leave stale state when linking to the Test Pattern Generator (TPG)
later?

If a C-PHY sensor is linked, csid->phy.cphy is set to true here. If that
sensor is later unlinked and the TPG is linked, the TPG link logic updates
other PHY parameters but does not reset cphy:

        if (sd->grp_id =3D=3D TPG_GRP_ID) {
                tpg =3D v4l2_get_subdevdata(sd);
                csid->phy.lane_cnt =3D tpg->res->lane_cnt;
                csid->phy.csiphy_id =3D tpg->id;
                csid->phy.lane_assign =3D csid_get_lane_assign(NULL, csid->=
phy.lane_cnt);
                csid->tpg_linked =3D true;
        }

When __csid_configure_rx() is called, it writes this leftover value into
CSI2_RX_CFG0_PHY_TYPE_SEL. Could this cause the TPG stream data to be garbl=
ed
by configuring the hardware to expect 3-phase C-PHY encoding instead of D-P=
HY?

>  			csid->phy.lane_assign =3D csid_get_lane_assign(lane_cfg, lane_cfg->nu=
m_data);
>  			csid->tpg_linked =3D false;
>  		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-qcom-cphy-=
v6-0-e50de0b557a8@ixit.cz?part=3D3

