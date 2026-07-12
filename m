Return-Path: <linux-media+bounces-67390-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1sAuI3p4U2rubAMAu9opvQ
	(envelope-from <linux-media+bounces-67390-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 13:20:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB587447D0
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 13:20:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ritovision.com header.s=zmail header.b=P25iAD99;
	dmarc=pass (policy=reject) header.from=ritovision.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67390-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67390-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9BA82302571E
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 11:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C376C3A4267;
	Sun, 12 Jul 2026 11:20:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FAF24336D;
	Sun, 12 Jul 2026 11:20:08 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783855210; cv=pass; b=lnP7g6rLvUFyO3oHl7vNHUXTlarJYSoAEykSc+3tkL7bfXMvGwzbi99qzWZiHX12KTOA9fXPv3TyUJOF75arXfNjmW9I/NJBUT5dzjXlzgKMgk1CYzHmcot4u8xMtsYVY3Rw5lBLSWnKku1dhJnCJX4MbCpYxxcm8F7mURQB5UE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783855210; c=relaxed/simple;
	bh=czHN4mzH8v7HuuPxICj5uvc3lTRI5qw330MjxLOLEYU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=L54YLaw6kB4mS05yi8/pOO+Y4f6phONdFnXyU/jmYNX/Xrpx+5spekm4w4BQSunzFn7nMZ2qPoIj+s+FxGIkVFnHAPgX1LDIkIfgj8hSBrfmYN/7Bl0FXZ/r+QMLTmdU2SNXZwq+EzvVpKzNFqqBQnq31P4QQ5Z3ydEvapSb7I0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=P25iAD99; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal: i=1; a=rsa-sha256; t=1783855203; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=d0Zwk4omcLtVCdc345Pg3+CWDq7SLZtI3Wrc6kzkNbhzk3vaxCMEpCQQN2JR4AdkjiETXMlPg4Wr5nvwwVMErhVxbeU71pXlVmZaOdxYSgjGUfL92mX44HKYnp3r4nyWK5j86qUQnaC6kACCk7+iJAUPtg3ZPAMcFx94CcKPnQ8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1783855203; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=czHN4mzH8v7HuuPxICj5uvc3lTRI5qw330MjxLOLEYU=; 
	b=MoyUoE4N85kk9EALlU1fZ+Ocj6BCv7FmLl/IGPdR6dJyVBu9dLmnky1pa5b616HmcZX8eJjyVZRMIsRC0jwJIgFboWQdrEwwYXYBCAKj7TQq4CpQzX2DKxVPSevdBs4sq8si/rB6dWAGfoii+PHx9LDTg03/giKh2YV7l+zjoKU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783855203;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Subject:Subject:Cc:Cc:From:From:To:To:References:In-Reply-To:Reply-To;
	bh=czHN4mzH8v7HuuPxICj5uvc3lTRI5qw330MjxLOLEYU=;
	b=P25iAD99dYjxX+0d3rtiVVrTmoOx0kGZ9v/bShuBMiCt0hd9cfiBzNcbiX1PP+ei
	e4r3ueYZSXS7QIbG4upDcLuTS4VT5zrQBqxpef9hJWIh/qKkKpRof+HfJ5BONLdlQ08
	QRIp5dwqeiWcYUQ+S377EpI37i7agZ6ggXHa1e+Q=
Received: by mx.zohomail.com with SMTPS id 1783855201176945.8781942050364;
	Sun, 12 Jul 2026 04:20:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 12 Jul 2026 07:19:57 -0400
Message-Id: <DJWJW4K4MAFK.2RJI3ENU1NQYE@ritovision.com>
Subject: Re: Bad wrapping in some tables
Cc: "Rito Rhymes" <rito@ritovision.com>, "Jonathan Corbet" <corbet@lwn.net>,
 "Daniel Lundberg Pedersen" <dlp@qtec.com>, <linux-doc@vger.kernel.org>,
 <linux-media@vger.kernel.org>
From: "Rito Rhymes" <rito@ritovision.com>
To: "Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>, "Hans Verkuil"
 <hverkuil+cisco@kernel.org>
X-Mailer: aerc 0.21.0
References: <c542aaf7-6a40-4730-8bd6-208c9fe932d5@qtec.com>
 <87pl0yr9ah.fsf@trenco.lwn.net> <DJUP0UXLLHJ0.3P121A982R9TP@ritovision.com>
 <7fcac682-60e3-4e1d-b26b-5b23f8035a91@kernel.org>
 <20260710104220.2b165f2d@foz.lan>
In-Reply-To: <20260710104220.2b165f2d@foz.lan>
X-ZohoMailClient: External
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[ritovision.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[ritovision.com:s=zmail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67390-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[rito@ritovision.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rito@ritovision.com,m:corbet@lwn.net,m:dlp@qtec.com,m:linux-doc@vger.kernel.org,m:linux-media@vger.kernel.org,m:mchehab+huawei@kernel.org,m:hverkuil+cisco@kernel.org,m:mchehab@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rito@ritovision.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ritovision.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-media,huawei,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,ritovision.com:from_mime,ritovision.com:dkim,ritovision.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DFB587447D0

> Breaking up literals is more important on PDF output, if one wants to
> print the documentation.

Could you clarify what you mean by PDF output here? Are you referring to
printing the HTML page through the browser, or to the PDF generated by
the Sphinx build process?

Are there any known problems or constraints we should account for
printing? I assume you may mean that long unbroken literals can make
tables wider than the printable page and hide outer columns, that and
horizontal scroll overflow in general may be clipped when printing,
making wrapping preferable for that output.

That makes sense for print, but it is not necessarily the preferable
behavior for navigating the normal HTML page, where contained horizontal
scroll overflow can preserve the page and table structure. I do not
think the print constraint should override the primary HTML
presentation.

I would like to account for both. If this concerns browser printing, we
may be able to apply the necessary wrapping selectively through
`@media print`.

Rito

