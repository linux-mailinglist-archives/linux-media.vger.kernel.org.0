Return-Path: <linux-media+bounces-67678-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kbJcNNaBV2pNTgAAu9opvQ
	(envelope-from <linux-media+bounces-67678-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 14:49:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F319275E56F
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 14:49:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=hansenpartnership.com header.s=20151216 header.b="FKA2/goc";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67678-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67678-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=hansenpartnership.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8CADA30166FF
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 12:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F356E477E32;
	Wed, 15 Jul 2026 12:43:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from lamorak.hansenpartnership.com (lamorak.hansenpartnership.com [198.37.111.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2BD41DDF2
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 12:42:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119383; cv=none; b=dUumM38H+OF1AQlnMfC246o5aT1cgtrYE5xp1wmTeSmziAPR8Yur/twwx4SwhhomAY7mtzg1xrbcAcIRMxB8+O4i2THSPTjOYnsuOed+raxlqO61H7uMMM5KHo3rcPZqF3r4kxhGOuKv5BVKD57prxUtfQ0bWgB3u9AWQ3gTfuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119383; c=relaxed/simple;
	bh=Wktn0t60DmP/XWWTtwrr7ElxboBf4c6LxMeYSe10ack=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MMuHwoFgTYIFjocCys/4Qy/qRmH2HyauFzYHccy0ShjylyWhHS3qV5R0WVg1W2D+sBrzhp7hSlnb7xdFg35ZsetibzGf1Q8ftYx6tECJMAJYpGMVmDeQ5DuYfIj2lo0s8OuM1eHJuz4FOT+hOzqMgHc0KgNYjP4rgfMt7AJBjq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=HansenPartnership.com; spf=pass smtp.mailfrom=HansenPartnership.com; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=FKA2/goc; arc=none smtp.client-ip=198.37.111.173
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1784119375;
	bh=Wktn0t60DmP/XWWTtwrr7ElxboBf4c6LxMeYSe10ack=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=FKA2/goc5JRXd2ARNR7xpJlktDrXXAcH09st95+s30mM3NiOh8nK9fdX5boQB+Ujm
	 +8gnkfSzUq7fqsNsAjnvYPk2Ox/jI1DQz2gCfJFaC7J7UkGBBUFr0jBNO2hbUPurfz
	 +uV5gYa6Kf3P98wN+kA26hLMATxVlzfi9x7PndlA=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4300:d341::8c71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lamorak.hansenpartnership.com (Postfix) with ESMTPSA id 9627A1C00F6;
	Wed, 15 Jul 2026 08:42:55 -0400 (EDT)
Message-ID: <460bb8002edc009194dcc0ad68a0538e5df6bfb5.camel@HansenPartnership.com>
Subject: Re: Linking Patchwork with Sashiko?
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Theodore Tso
	 <tytso@mit.edu>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Roman Gushchin	
 <roman.gushchin@linux.dev>, Derek Barbosa <debarbos@redhat.com>, Matthieu
 Baerts <matttbe@kernel.org>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, Steven
 Rostedt <rostedt@goodmis.org>, users@kernel.org, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Stephen Finucane <stephenfin@redhat.com>
Date: Wed, 15 Jul 2026 08:42:54 -0400
In-Reply-To: <20260715091349.2094a0ec@foz.lan>
References: <20260607195656.02788791@foz.lan>
		<akQlPSNfGEllNVhe@debarbos-thinkpadt14gen5.rmtusma.csb>
		<20260710074528.5a6e4457@foz.lan>	<20260710083845.23c753ca@foz.lan>
		<87wlv2jq4t.fsf@linux.dev>	<20260713095538.3d5e86f1@foz.lan>
		<20260713094120.GD1127719@killaraus.ideasonboard.com>
		<20260713220427.582b28bf@foz.lan>	<7ia4mrvtrxjl.fsf@castle.c.googlers.com>
		<20260715005909.GF1656185@killaraus.ideasonboard.com>
		<alcBvuIMEGSjAD1R@mit.edu> <20260715091349.2094a0ec@foz.lan>
Autocrypt: addr=James.Bottomley@HansenPartnership.com;
 keydata=mQENBE58FlABCADPM714lRLxGmba4JFjkocqpj1/6/Cx+IXezcS22azZetzCXDpm2MfNE
 lecY3qkFjfnoffQiw5rrOO0/oRSATOh8+2fmJ6el7naRbDuh+i8lVESfdlkoqX57H5R8h/UTIp6gn
 1mpNlxjQv6QSZbl551zQ1nmkSVRbA5TbEp4br5GZeJ58esmYDCBwxuFTsSsdzbOBNthLcudWpJZHU
 RfMc0ew24By1nldL9F37AktNcCipKpC2U0NtGlJjYPNSVXrCd1izxKmO7te7BLP+7B4DNj1VRnaf8
 X9+VIApCi/l4Kdx+ZR3aLTqSuNsIMmXUJ3T8JRl+ag7kby/KBp+0OpotABEBAAG0N0phbWVzIEJvd
 HRvbWxleSA8SmFtZXMuQm90dG9tbGV5QEhhbnNlblBhcnRuZXJzaGlwLmNvbT6JAVgEEwEIAEICGw
 MGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAhkBFiEE1WBuc8i0YnG+rZrfgUrkfCFIVNYFAml2ZBI
 FCS3GUMIACgkQgUrkfCFIVNZKjQf/deRzlXZClKxTC/Ee2yEPqqS7mm/INUA49KdQQ5oIhSxkUBy0
 9J4qjMIo5F8ZFkFTqikBqeL35LKu7O7rn8WETfX8Bxvos3HUsl3jHo34DES4MUFIpoQPgtiLRGwLb
 K0cVCAArR2u2qj4ABmTRrs1I1kvdjEw6gatOuXtEe/j5O2fvfzTq9GBr0Q3n2IAsFXi4hLlx6VPE8
 tyWUZ8BWJKtih3JAeUiXFvASL3McV0rV9RnU0VbjEQEhSE7PMYhWpnDC9AyBb0lXJllQRvC3NSkUB
 8KVQgNNxRPss0WE/nBoZ4dFA42jTyzTz8lNylxZoAWV7WJb3QxVg4oCodRVrxxrQhSmFtZXMgQm90
 dG9tbGV5IDxqZWpiQGtlcm5lbC5vcmc+iQFVBBMBCAA/AhsDBgsJCAcDAgYVCAIJCgsEFgIDAQIeA
 QIXgBYhBNVgbnPItGJxvq2a34FK5HwhSFTWBQJgS5mYBQkbNYS9AAoJEIFK5HwhSFTWBpwIAL5Bk3
 5FB34U6iHmDzzgdCbxLTs43T/YQyJpcGIvopBvnI/fDY8oSG6Df64/O6B+1R+A8TDp6ZG5ysUWnCC
 6GuIaEHemBYkitMPglR6+sGCMQY7O0mlsPvdssvKK1KI9Bno4VU6ogaF2qVzefSqg1Djmf/DcsxWP
 rI/jdJ8FB5AYR2rjIdDFc+zRdAJuavo1/anyY2wgpFh/3R8IOYAEfWV9nGgYkf9+tA4EIn1sxE0I3
 L5oW2N3mbyRrkzuBwO8ztMCwqEPk7moWzhokcZqMXiAIahaZdkashJC+s2X2RZSGCy+g+pvY5NN4B
 BVG5XwLgVBqbHMTcxE0fbmPqz+q6O0LEphbWVzIEJvdHRvbWxleSA8amVqYkBoYW5zZW5wYXJ0bmV
 yc2hpcC5jb20+iQFXBBMBCABBFiEE1WBuc8i0YnG+rZrfgUrkfCFIVNYFAmODZ5ACGwMFCRs1hL0F
 CwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQgUrkfCFIVNZu0Af/TzvL2/NdgAcw9uN3x60H8
 jc4QUq14VpxcFEFEMpcj1morkX/G93V+56HBBaXZj+yK8PhxIA/SIz+sU7C/0YvKuvzakP8ZX/7WJ
 e32SOUtjfr/VTaqjIBzNj6OxLvZpmNbBw7s6DwhhNpHOWqJ/1ml+PtDRDV71IB58yVqQjp1xlNKVl
 ZppcJ5908EJzsFnRIVjiQiDSKoppqB2BCibBbrWcln7CiWMyOC/cco6SIn6twH+f7+aivJ3xGcOE2
 a9gBKF5rNi9TBoX9oyPmshv/TDmnohsVrH7AYXlGYfZTk15SWEiROh1QX8/uD9wl/gcIv5EDUpT/F
 L2jzOsA5663bw==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	SUBJECT_ENDS_QUESTION(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[hansenpartnership.com,quarantine];
	R_DKIM_ALLOW(-0.20)[hansenpartnership.com:s=20151216];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67678-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab+huawei@kernel.org,m:tytso@mit.edu,m:laurent.pinchart@ideasonboard.com,m:roman.gushchin@linux.dev,m:debarbos@redhat.com,m:matttbe@kernel.org,m:konstantin@linuxfoundation.org,m:jgg@ziepe.ca,m:rostedt@goodmis.org,m:users@kernel.org,m:linux-media@vger.kernel.org,m:stephenfin@redhat.com,m:mchehab@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[James.Bottomley@HansenPartnership.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[James.Bottomley@HansenPartnership.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[hansenpartnership.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F319275E56F
X-Rspamd-Action: no action

On Wed, 2026-07-15 at 09:13 +0200, Mauro Carvalho Chehab wrote:
> On Tue, 14 Jul 2026 23:54:43 -0400
> "Theodore Tso" <tytso@mit.edu> wrote:
>=20
> > On Wed, Jul 15, 2026 at 03:59:09AM -0500, Laurent Pinchart wrote:
> > > I believe we should follow the first two recommendations of the
> > > Software Freedom Conservancy on using LLM-backed generative AI
> > > systems for FOSS contributions ([1]).
> > >=20
> > > [1]
> > > https://sfconservancy.org/llm-gen-ai/llm-backed-generative-ai-recomme=
ndations.html
> > > =C2=A0
> >=20
> > It's not clear to me that the SFC document is particularly
> > applicable for the use of LLM's beyond the use case of generating
> > code which is contributed to FOSS projects.
>=20
> Agreed: the document there is about AI-generated code ("Generative
> AI"), not about patch review.

In a narrow construction, possibly.  But broadly it seems to be a
charter for the rights of people to ignore AI absolutely and how they
should interact with people who use it: that does have applicability to
AI reviews.

> > Things get a lot more complicated when we're considering the use of
> > LLM's to (a) review code, (b) automate the analysis of a bug report
> > or stack trace, or (c) automate backporting a patch to LTS kernel.
> >=20
> > Consider the first recommendation, "The FOSS community should
> > support, not just tolerate, those who outright reject LLM-gen-AI
> > systems."=C2=A0 If someone rejects LLM-gen-AI systems, and the LTS
> > kernel contains patches which are automated backported, and they
> > object, are we bound to forswear the use of automated backport
> > technologies?
> >=20
> > What if someone reports a bug with a kernel stack trace, and
> > someone uses an LLM agent to analyze their bug report and find a
> > fix.=C2=A0 What does it mean to "support somone who outright rejects th=
e
> > use of LLM-gen-AI systems" in that case?

I think it's simpler than that: The contributor doesn't get to approve
the tools the maintainer uses to assess and apply patches.  If there's
AI in there and the contributor is an AI luddite, then the patch
doesn't get applied (i.e. your right to ignore AI stops when it
infringes others' right to use it).

Regards,

James

