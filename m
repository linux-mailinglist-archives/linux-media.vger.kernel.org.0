Return-Path: <linux-media+bounces-64227-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rbOpGVr3JmqwowIAu9opvQ
	(envelope-from <linux-media+bounces-64227-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 19:09:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D6E65917B
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 19:09:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=puqo3BUS;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64227-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64227-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6A8E2300AC95
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 17:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 092953D47A9;
	Mon,  8 Jun 2026 17:09:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B26F314A65;
	Mon,  8 Jun 2026 17:09:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780938582; cv=none; b=D+kyI14CdAKTin/IP+e3ewc/EYGw5W43WOZY9qxQ+B7rQIXFyasvIzvvQ8lAVo+Hx2lL/GCIjQYQxjv3PBpQtI0yRja86SqfeBgnhUuHMGxuG0ogQqVq78mGc9Et/UeBpJfRyrIMt8Q7MscMI+c6DO3Wam9dXpi4us8z3YAR0MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780938582; c=relaxed/simple;
	bh=/rGXKMy0EKXlIJqKLJTteJmFxYyrAHYf+W3IT+/b/Ro=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=MXpV7jckkXNbiOZmBTO2MFB/ev4lAdz499AEkED2Ofg7iKaQI6L3uouSIBT93Sj17+RVs6g93LWezAZatZBEx28oDDLey2BHbkPtzs1/zuboE88+W9lyszgwaFUjauf7x9HBEFy2Y08oLiRkMRDRC6Oj9BWCmzPvMIReNZvBU+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=puqo3BUS; arc=none smtp.client-ip=213.167.242.64
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:bcf2:9325:a9bd:32b:e71])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C121AD0;
	Mon,  8 Jun 2026 19:09:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780938551;
	bh=/rGXKMy0EKXlIJqKLJTteJmFxYyrAHYf+W3IT+/b/Ro=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=puqo3BUSYOYRKpFdsuz8LXNY2kMSgY0+96QJ7xPJWEXSrDd59gqhEBAyB4A0nkmsA
	 FEp3NJ6pwheyTG9yd2biZVGqeMgNSE7mQlAHkHTUQkGlwPUUM9VdD7qO47Edp73wda
	 LzX2/91TKoGOUm+vHzvH/+2p1bq6tGbksvf1RaZY=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260608142901.3971821-3-r-donadkar@ti.com>
References: <20260608142901.3971821-1-r-donadkar@ti.com> <20260608142901.3971821-3-r-donadkar@ti.com>
Subject: Re: [PATCH 2/4] media: i2c: ds90ub960: Support multi-channel sensors
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: r-donadkar@ti.com, y-abhilashchandra@ti.com, devarsht@ti.com, vigneshr@ti.com, mchehab@kernel.org, tomi.valkeinen@ideasonboard.com, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
To: Rishikesh Donadkar <r-donadkar@ti.com>, jai.luthra@linux.dev
Date: Mon, 08 Jun 2026 22:39:33 +0530
Message-ID: <178093857326.19620.7813941348588669670@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:r-donadkar@ti.com,m:y-abhilashchandra@ti.com,m:devarsht@ti.com,m:vigneshr@ti.com,m:mchehab@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:jai.luthra@linux.dev,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64227-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,ideasonboard.com:dkim,ideasonboard.com:from_mime,ti.com:email,freya:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F3D6E65917B

Quoting Rishikesh Donadkar (2026-06-08 19:58:59)
> From: Jai Luthra <me@jailuthra.in>
>=20

It's been many years since I wrote this, so I have no idea how that email
ended up here.

Please fix it in next revision to j-luthra@ti.com like the other patch, as
.mailmap should handle redirections from it.

Thanks,
    Jai

> Before this, the deserializer would ignore the virtual channel (VC) ID
> set in the incoming CSI packets, and set the ID to the RX port number in
> the outgoing packets. This was done to support multiple single-channel
> cameras, all sending packets with the same default VC ID =3D 0.
>=20
> Now we check which (and how many) channels are under use on any incoming
> FPDLink port, and map it to available channels on the outgoing CSI port.
>=20
> Signed-off-by: Jai Luthra <me@jailuthra.in>
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>

