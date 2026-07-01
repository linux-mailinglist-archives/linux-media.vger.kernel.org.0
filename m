Return-Path: <linux-media+bounces-66158-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PtvwG4e6RGqmzgoAu9opvQ
	(envelope-from <linux-media+bounces-66158-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 08:58:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B08376EA5FE
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 08:58:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=B1nGUBN1;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66158-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66158-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A41FB30A2BB6
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 06:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEF153B2FDD;
	Wed,  1 Jul 2026 06:53:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78C43AEB2D;
	Wed,  1 Jul 2026 06:53:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782888805; cv=none; b=Rd/yhk2Sr9EMPeyE77IgfDIR8Z58uK1YklG03pBTfWbQUqNDRCbW8smPdCwXB8yzNkAxlVLyvHch6BIxzRqPfVFIDqp5WMCm50//Ux1RaQ9hjoWDiTPcOudRPE0LkYwXXAgTxIPP9X7aa4/xsDxgf0RsHoUSkpmnkyEEB2vdUfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782888805; c=relaxed/simple;
	bh=iEAyt3hGrC/IcQubu2WGO1+ewpfyh9SvZ+gYalh2mNk=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=kR8O8mTtlFeETLVrJh3k0B3Rh10qYXlU2132wXRVlTAFZO6JJM0dCxwzSngE6j0DCef9D81RX0WuySLHWI9YoZnpkBaseniE+sC54QlFyFrfwcNcxt/EHCCcL46qIIx9PflHYJVi7NYhR/d9DhEkOZnUfCFPXJrARceQwvqPLII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=B1nGUBN1; arc=none smtp.client-ip=213.167.242.64
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:8a87:d565:effa:ccf8:a720])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C01CC1E48;
	Wed,  1 Jul 2026 08:52:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782888751;
	bh=iEAyt3hGrC/IcQubu2WGO1+ewpfyh9SvZ+gYalh2mNk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=B1nGUBN197lQ45bqr/0onPIvMX+/GDNanio1fMNPSxzj/EvT3BfilY5oC8XeMs1QU
	 Ohzuq5Ycww6lpL/6OBv+SyAzVHf1/Do6NdRfuWxFt1ChPjyGgL75zXOG2s2x2kBD98
	 tP5GlfgqESeGcVArApBahzPuLUzih7Cammoi5wfM=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CACak8wPuBaGCBbBrpoPQ5ftQRtqwijvN_VJoRGs7FzYBGck-iA@mail.gmail.com>
References: <20260625160228.59672-1-tharitt97@gmail.com> <178246824177.1799417.1678746966574660598@freya> <CACak8wPuBaGCBbBrpoPQ5ftQRtqwijvN_VJoRGs7FzYBGck-iA@mail.gmail.com>
Subject: Re: [PATCH] media: imx219: fix test pattern ordering and add patterns
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
To: Tharit Tangkijwanichakul <tharitt97@gmail.com>
Date: Wed, 01 Jul 2026 12:23:10 +0530
Message-ID: <178288879026.1799417.14880182647984884282@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-66158-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dave.stevenson@raspberrypi.com,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:skhan@linuxfoundation.org,m:linux-kernel-mentees@lists.linux.dev,m:tharitt97@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B08376EA5FE

Hi Tharit,

Quoting Tharit Tangkijwanichakul (2026-06-26 18:08:20)
> Hi Jai,
>=20
> Thanks for the review
>=20
> > Do you have a strong reason to switch this to the datasheet values?
>=20
> I must say there is no strong reason. I'm totally new here and come from
> the perspective of someone studying how to write a camera sensor driver.
> The datasheet says that writing 0x1 to reg 0x0601 will set the mode to so=
lid
> color test pattern. So it is "natural" to expect that I should set
> test_pattern=3D1 to do so via v4l2-ctl.
>=20
> > I ask because this might break what userspace applications expect
> > (libcamera) and also automated capture tests (that compare md5sums of t=
he
> > test pattern) in vendor board-farms.
>=20
> This was totally oblivious to me when I made the change.
> I agree with you on this point. Breaking userspace does not sound like
> a good idea.
>=20
> I'm open to making a v3 patch and only introduce new test patterns to
> the driver.
>=20

Yes please do so.

Thanks,
    Jai

> Best,
> Tharit

