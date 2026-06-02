Return-Path: <linux-media+bounces-63466-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tiXpGu1tH2p9lwAAu9opvQ
	(envelope-from <linux-media+bounces-63466-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 01:57:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B764C633079
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 01:57:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=d+KCoeuS;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63466-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63466-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 576FF307256E
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 23:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5CD53C5848;
	Tue,  2 Jun 2026 23:55:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6503F3A6EFC
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 23:55:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780444554; cv=none; b=J7sm3xicQJxaHQTGSjyvztXQrparEvfUDAOoWS5/AwFwPAkEqbRysYqaYb/2vouDWyH4UHcgyzLv/Mbylrye5lCMpMVSjCooioTLfdpT7HQZ8Fq5XMM9erkZeYfIz+iS3lkUvLNDCXzMfdzLQxsK9jPN/Qrgk6PW484NRVcRM3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780444554; c=relaxed/simple;
	bh=cx1wwkJHaiyuG0zqyzybmL+DdBn0Jf+DAZUr23T8RHU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Or7vceWllB5t7qTUQL+SUzTq1sM8DswN1MNnV2Z9qvIeQdT8f31J2rylGefLgV2Gq9xL68t119V/7Y+AxgkymM2bqN72Z5/0tBQ1ouoG+JOQFciyHksZC4W8lracDWKvyel++hlZCtAj5ekHYcSu6l8qRFFyqrLOq03d7G3HZAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d+KCoeuS; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D754D1F00898;
	Tue,  2 Jun 2026 23:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780444553;
	bh=vywfHMu44m9J25EjEBm3pVVRbULIJo61/ybuiK5CVo4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d+KCoeuSMrTBsDTOLn3sMexj/L1NdS433iAGdrmGOq7AsHG/81Tp8wHnEyQB7aRFx
	 GlRnC78nzQ2yPrp16E14HnUEqWo0KzvNjv2WAgBbTq0BWgUphwQ8gmMtkD473Q8MZw
	 2ncQEu4Auw3ibNt6Ik7yWMhCyCSU+x+NvHWClcvnhnIsRwL4mNP2QdjnbnStKhG0Lm
	 gJySt6sGzJm739lL34Mo25kemKIUpQyPE0ucCO7F4daqgcosqbGdx8gc57847AlRgS
	 URmtp5n0yg8fl0MtDH9mnC//kTDosJBRQapK4Kt+pmmNmLBCbHuIjnWHDsL6my8kck
	 BuJEyPCMRKSkA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/8] media: qcom: camss: csiphy-3ph: Use odd bits for
 configuring C-PHY lanes
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg via B4 Relay" <devnull+david.ixit.cz@kernel.org>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260603-qcom-cphy-v6-2-e50de0b557a8@ixit.cz>
References: <20260603-qcom-cphy-v6-2-e50de0b557a8@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 23:55:52 +0000
Message-Id: <20260602235552.D754D1F00898@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-63466-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,sashiko.dev:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ixit.cz:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B764C633079

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch claims to allow returning a failure for unrecognized b=
us configurations, but silently ignores the error and proceeds with hardwar=
e configuration.
--

commit 0f031c8a889a78fead270238000243029f1f3462
Author: David Heidelberg <david@ixit.cz>

media: qcom: camss: csiphy-3ph: Use odd bits for configuring C-PHY lanes

This commit adds C-PHY support by using odd bits for configuration instead
of even bits. It also mentions allowing failures for unrecognized
configurations.

> Since there can be unrecognized configuration allow returning failure.

[Severity: Medium]
The commit message mentions allowing returning failure for unrecognized
configurations, but does the implementation actually propagate any errors
back to the caller?

> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/d=
rivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index dac8d2ecf7995..15876eb973718 100644
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
> =20
> -	lane_mask =3D CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
> +	switch (lane_cfg->phy_cfg) {
> +	case V4L2_MBUS_CSI2_CPHY:
> +		for (int i =3D 0; i < lane_cfg->num_data; i++)
> +			lane_mask |=3D BIT(lane_cfg->data[i].pos + 1);
> +		break;
> +	case V4L2_MBUS_CSI2_DPHY:
> +		lane_mask =3D CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
> =20
> -	for (i =3D 0; i < lane_cfg->num_data; i++)
> -		lane_mask |=3D 1 << lane_cfg->data[i].pos;
> +		for (int i =3D 0; i < lane_cfg->num_data; i++)
> +			lane_mask |=3D BIT(lane_cfg->data[i].pos);
> +		break;
> +	default:
> +		break;
> +	}
> =20
>  	return lane_mask;
>  }

[Severity: Medium]
If the configuration is unrecognized, csiphy_get_lane_mask() returns 0.
Since the caller treats 0 as a valid u8 mask, how does it detect the
unrecognized configuration failure mentioned in the commit message?

[ ... ]

> @@ -1160,9 +1170,22 @@ static void csiphy_lanes_enable(struct csiphy_devi=
ce *csiphy,
> =20
>  	settle_cnt =3D csiphy_settle_cnt_calc(link_freq, csiphy->timer_clk_rate=
);
> =20
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
> =20
>  	writel_relaxed(val, csiphy->base +
>  		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 5));

[Severity: Medium]
Here csiphy_lanes_enable() prints a warning but proceeds to configure the
hardware registers with val =3D 0.

Since the return type of csiphy_lanes_enable() is void, the caller
csiphy_stream_on() can't check for failure, and ultimately returns 0
(success) to V4L2:

drivers/media/platform/qcom/camss/camss-csiphy.c:csiphy_stream_on() {
    ...
    csiphy->res->hw_ops->lanes_enable(csiphy, cfg, link_freq, lane_mask);

    return 0;
}

Should csiphy_lanes_enable() be updated to return an int so we can abort
and return an error like -EINVAL?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-qcom-cphy-=
v6-0-e50de0b557a8@ixit.cz?part=3D2

