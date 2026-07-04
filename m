Return-Path: <linux-media+bounces-66567-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FNyVH+aNSGrirQAAu9opvQ
	(envelope-from <linux-media+bounces-66567-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 04 Jul 2026 06:36:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 974C07069FA
	for <lists+linux-media@lfdr.de>; Sat, 04 Jul 2026 06:36:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=oyDreyBI;
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66567-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66567-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56031300D155
	for <lists+linux-media@lfdr.de>; Sat,  4 Jul 2026 04:36:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02A833859EC;
	Sat,  4 Jul 2026 04:36:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8657D386571
	for <linux-media@vger.kernel.org>; Sat,  4 Jul 2026 04:36:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783139805; cv=none; b=nNOrJ+33pjmzOU0fo0A83EUWzO+0Gjmgeew746kmLLwKh7yZIdKtfTh8M77Q6pE0nIf4UpV29IqDR3Co5E2anhOeiKhYiARQmMW5gcfm0ltes2htdBFuOTu2/UeujgJADY5hHrRyeumrnjZliGE4Yh0ZybNFa8mDwp0/5zMhIS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783139805; c=relaxed/simple;
	bh=jVPt16f3fCOIpCJExzAuHIVzHfwoIsSFGogfasDmczM=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=DE+0kjFs/yyaCdj6NiJIqx7gLKXVZTTXTqU2o0xzDYtmyiDjzRddgyo0ESltjij8wcQOA9dfBuRgAxG8qHDTO//OizDSvThXfgKBKyvYBHftn9e7DHjYw5PRu3VHtlyD9BB80MHx3THVi2z02yJfHK82Lb5gVVK3i53np+IGqIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oyDreyBI; arc=none smtp.client-ip=213.167.242.64
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 359623A2;
	Sat,  4 Jul 2026 06:35:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783139748;
	bh=jVPt16f3fCOIpCJExzAuHIVzHfwoIsSFGogfasDmczM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=oyDreyBIhFQ/EwDN6/XadS6bYRduac1H+P7HX5sUOZKBVeOg+AdjUGHJ2oyyFPNLb
	 oLXzxh6OC9s+EKVfOIeHRpw1n9XF5WqObxx/RBCLfjIqiYtdT11Iq/r2SUwIptLkX4
	 RTAj8GgzPSnX0Ix2EI7Zqx6pfwBCs9tgo8qBvKdc=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <akgoiXheHnjrDtqW@kekkonen.localdomain>
References: <20260703152451.1743132-1-antti.laakso@linux.intel.com> <2dd5cef71eb1ce5c246e64105ebd0d5cd593a0e0.camel@ndufresne.ca> <akgoiXheHnjrDtqW@kekkonen.localdomain>
Subject: Re: [PATCH 00/41] media: ipu6: Add support for ipu7 hardware
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Antti Laakso <antti.laakso@linux.intel.com>, linux-media@vger.kernel.org, mchehab@kernel.org, daxing.li@intel.com, ong.hock.yu@intel.com
To: Nicolas Dufresne <nicolas@ndufresne.ca>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Sat, 04 Jul 2026 05:36:31 +0100
Message-ID: <178313979158.459445.3804729958099737941@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66567-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[kieran.bingham@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:antti.laakso@linux.intel.com,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:daxing.li@intel.com,m:ong.hock.yu@intel.com,m:nicolas@ndufresne.ca,m:sakari.ailus@linux.intel.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kieran.bingham@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,ping.linuxembedded.co.uk:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 974C07069FA

Quoting Sakari Ailus (2026-07-03 22:24:25)
> Hi Nicolas,
>=20
> On Fri, Jul 03, 2026 at 12:17:17PM -0400, Nicolas Dufresne wrote:
> > Hi,
> >=20
> > Le vendredi 03 juillet 2026 =EF=BF=BD 18:24 +0300, Antti Laakso a =EF=
=BF=BDcrit=EF=BF=BD:
> > > Hello,
> > >=20
> > > The 7th Gen Intel Imaging Processing Unit is a PCI device including
> > > input system and processing system. This set adds support for ISYS
> > > in IPU7.
> > >=20
> > > At this point only IPU7 is supported, not 7.5.
> >=20
> > Is this implementation replacing the staging driver in
> > ./drivers/staging/media/ipu7 ? Can you outline the plan ? Compare this
>=20
> That's correct: there's no longer need for the staging driver once the ip=
u6
> driver has support for both IPU7 and IPU7.5.

Only out of curiousity, but if this is generalising IPU6 to support 7
and 7.5, is there a chance this could help IPU4 users which I understand
is also firmware based?

--
Kieran



>=20
> > implementation against the other one ? Or perhaps its just a different =
component
> > of the camera?
>=20
> --=20
> Kind regards,
>=20
> Sakari Ailus

