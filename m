Return-Path: <linux-media+bounces-64215-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ye1ZMBP1JmoCowIAu9opvQ
	(envelope-from <linux-media+bounces-64215-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 19:00:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 079FC659056
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 19:00:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=HHCorarU;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64215-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64215-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CBC1C352047E
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 15:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF0823F54B6;
	Mon,  8 Jun 2026 15:20:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8063EFFA2
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 15:20:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780932009; cv=none; b=l+4z+nBlSREelbFY24asHRaMwXf/+P+c9c1XPnj1PULI2ljWzTTgap4F1V8sSAu2OEqIDWFOYgQDKklmATcnNX5u2ymAxA2II18Undy3y4RvznjGVRQkuiRq1MA+3dfrO5SBByaHbmo1C9mjnhPTnZNXsz/yzss1x7yu/wXTREs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780932009; c=relaxed/simple;
	bh=kt4X5Lww8bfhJ/ElB+i2bbubRi5pwj9rxbcba0/0he8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZJ4eQxxlwqH/Fu7TZ3LXFe7OX5ZeBbPchAbRA+9Bj3brpCAzaysomzNL0uYqAm80hpzd7XcRFgke4lA6b0tjMubBUO2/M5tHk8JKzAtBZn5KqKNVaq5Qh7gaPLCVoLB4SsvgCdVredjReNBqmRoo841MadssLuYboitb1Q736xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HHCorarU; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02E9D1F00893;
	Mon,  8 Jun 2026 15:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780932008;
	bh=I2y+ro//gfNb8wx05oJlBQShPFJh4j+ML9rC0QOOR8I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HHCorarU0BvVn2oVmJTd0yZD7cly05+CQCKEeRykQHEENKitkvWi5jQi2Qg8EviP6
	 Zl/Rb69BabBrRqqgG/Po1v5HNtxgwiSWhuhvy6AF3sRj6Q1A94X1k8iQxKVgK6RhA2
	 I/v56lHs20FiR/MyBgqrkpe/vgvFlKxQ2GxFpqF3KnrpyL1kEfbew0zuGFumurIRJI
	 lId8lRSbTF5aah2Ob9kTlp4d4W2st/7B5HA53qeNVKtST7NcRX8sl70oxOiOe9Qg4s
	 LyquJNC2HxOvf0jhOR5RXLo6mAcwPicQ/t3iqbRoxXzdqWuip7um9fIsChCkF1QtW9
	 WWRa6NRIxCfrg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] media: i2c: ds90ub960: Fix VC mapping when ports
 skipped
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rishikesh Donadkar" <r-donadkar@ti.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260608142901.3971821-4-r-donadkar@ti.com>
References: <20260608142901.3971821-4-r-donadkar@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 15:20:07 +0000
Message-Id: <20260608152008.02E9D1F00893@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-64215-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:r-donadkar@ti.com,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,lists.linux.dev:replyto,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sashiko.dev:url,smtp.kernel.org:mid,linux.dev:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 079FC659056

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Medium] The UB9702 virtual channel mapping calculation silently truncate=
s configuration bits due to a `u8` type bound, causing `get_frame_desc` to =
misreport hardware routing.

Pre-existing issues:
- [Critical] Missing validation for unconnected ports causes a deterministi=
c NULL pointer dereference in routing and stream operations.
- [High] Missing error propagation in `ub960_get_vc_maps` silently ignores =
exhausted virtual channels and frame descriptor retrieval failures.
- [High] Unconditional virtual channel allocation across all connected port=
s creates a resource exhaustion vulnerability for active streams.
--

commit fac1e32c32034fd62f0d9b20d9d05ddc0c4a9d7b
Author: Jai Luthra <jai.luthra@linux.dev>

media: i2c: ds90ub960: Fix VC mapping when ports skipped

Currently the for loop that maps virtual channels from RX to TX ports
terminates at the first unconnected RX port.

Fix that by instead continuing to scan the remaining ports.

> diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
> index 506b436fe50c6..d1597659639f5 100644
> --- a/drivers/media/i2c/ds90ub960.c
> +++ b/drivers/media/i2c/ds90ub960.c
> @@ -3488,15 +3488,16 @@ static void ub960_get_vc_maps(struct ub960_data *=
priv, u8 *vc_map)
>  	struct device *dev =3D &priv->client->dev;
>  	u8 nport, available_vc =3D 0;
> =20
> -	for (nport =3D 0;
> -	     nport < priv->hw_data->num_rxports && priv->rxports[nport];
> -	     ++nport) {
> +	for (nport =3D 0; nport < priv->hw_data->num_rxports; ++nport) {

[Severity: High]
This is a pre-existing issue, but does this unconditional loop unnecessarily
exhaust virtual channels?

In ub960_get_vc_maps(), the driver iterates through all physically connected
RX ports and allocates unique virtual channels. This allocation ignores the
V4L2 active routing table. As a result, inactive sensors on earlier ports
will needlessly consume the limited VC slots, potentially starving active
sensors on later ports and causing streaming to fail unnecessarily.

>  		struct v4l2_mbus_frame_desc source_fd;
>  		bool used_vc[UB960_MAX_VC] =3D {false};
>  		u8 vc, cur_vc =3D available_vc;
>  		int j, ret;
>  		u8 map;
> =20
> +		if (!priv->rxports[nport])
> +			continue;
> +

[Severity: Critical]
This is a pre-existing issue, but is there a missing validation for
unconnected ports elsewhere that could cause a NULL pointer dereference?

While ub960_get_vc_maps() correctly skips unconnected ports here, other
functions like ub960_get_frame_desc() and ub960_disable_streams() iterate
over the active routing table and blindly dereference priv->rxports[nport]:

drivers/media/i2c/ds90ub960.c:ub960_get_frame_desc() {
    ...
    ret =3D v4l2_subdev_call(priv->rxports[nport]->source.sd, pad,
                           get_frame_desc,
                           priv->rxports[nport]->source.pad,
                           &source_fd);
    ...
}

If userspace uses VIDIOC_SUBDEV_S_ROUTING to create an active route
involving an unconnected sink pad, could calling VIDIOC_SUBDEV_G_FRAME_DESC
or disabling the pipeline trigger a kernel panic?

[Severity: High]
This is a pre-existing issue, but does missing error propagation here lead
to silent stream collisions?

If the available virtual channels are exhausted (cur_vc > UB960_MAX_VC) or
if get_frame_desc() fails, ub960_get_vc_maps() merely logs an error and uses
continue to proceed to the next port. Since the function returns void, the
caller ub960_configure_ports_for_streaming() cannot detect the failure.

For the failed port, the vc_map array remains zero-initialized. Could the
caller then blindly program 0 into the hardware's VC mapping register,
inadvertently mapping all streams for that port to output VC 0 and causing
data corruption across ports?

[Severity: Medium]
It appears a subsequent commit introduces an issue here. Does the UB9702
virtual channel mapping calculation silently truncate configuration bits?

In ub960_get_vc_maps(), the map variable is defined as a u8. For the UB9702
chip, the driver shifts cur_vc by 4 * vc:

    map &=3D ~(0x0f << (4 * vc));
    map |=3D (cur_vc << (4 * vc));

If a sensor uses VC 2 or 3, the shift values are 8 and 12. Since map is an
8-bit integer, wouldn't these bits overflow the type bounds and be truncated
to 0?

When ub960_get_frame_desc() is subsequently called to report the routing, it
computes (vc_map[nport] >> (4 * vc)) & 0x0f. Since the value was truncated,
shifting right by 8 yields 0. Could this discrepancy cause the driver to
falsely report to the V4L2 core that streams on VC 2/3 are mapped to output
VC 0, potentially triggering spurious link validation failures?

>  		ret =3D v4l2_subdev_call(priv->rxports[nport]->source.sd, pad,
>  				       get_frame_desc,
>  				       priv->rxports[nport]->source.pad,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608142901.3971=
821-1-r-donadkar@ti.com?part=3D3

