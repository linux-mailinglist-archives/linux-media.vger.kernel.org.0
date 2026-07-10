Return-Path: <linux-media+bounces-67231-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id roINFsKXUGqg2AIAu9opvQ
	(envelope-from <linux-media+bounces-67231-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 08:57:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A4031737DE0
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 08:57:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ritovision.com header.s=zmail header.b="Ephot/+q";
	dmarc=pass (policy=reject) header.from=ritovision.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67231-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67231-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 864DB300FC6E
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 06:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 015B23A48C2;
	Fri, 10 Jul 2026 06:56:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C892E7394;
	Fri, 10 Jul 2026 06:56:06 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783666568; cv=pass; b=J7feD6XmHHErN/jkycwTF1u6xZ231H1d2yuvqfCz56TB1llcVEL31o74pdsahaM/Z6Vm5bLXc1fjQbxPv5unIlVxbtyZuE7XD6ozIu18kcLgCak5qoIG78r77BH5PDYZz2IHYZsBfUyRzw/EOyTs5Y21IZZmAuJYFfAa9KKnl1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783666568; c=relaxed/simple;
	bh=r/opBB8wIG3CFxEGoHyKh/g+ewFUpmZQc066nt+iQs0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=atJqRTKLnVeQhgBBZDxIjbu842bAJDAFWccviVXTmSEL0PfEvzJwObnwoxmiCn5CBAaL2GFphvb50HphDRGyuf4E6Dag1fTUs4/o6uOmsS0tO7+FYL8cMs4WwW+f7Ryymd1NinAbP3/K/tipQ0GFHWtRT4ZwXQUoY3/CMAxr2hI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=Ephot/+q; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal: i=1; a=rsa-sha256; t=1783666560; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=A1pHUasYDjrEz89nsEjGQef9bSKZs6vF/fjq6JoKiZeU23/cBORLjXc/t8b2Cs3ppx1IFqg9ajvNtVg7Mopuy8ENKuxVs2oHChLFc3ADMFCEEoL2qtlzSA40r6jd90PKAqOTircD7J2zrTpM72YCtHxcYBQ3o9tpWGsAEAzuuqU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1783666560; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=r/opBB8wIG3CFxEGoHyKh/g+ewFUpmZQc066nt+iQs0=; 
	b=Y9NSt3HBkyVU+Htn71iDfNaZkrRf1uxDs8sdgVH+YxV92MTP4nK+3faerloHOMCHagOdyzA+58FbOA068KkzSvaVVhWX9nn2QvcipKrgMxnQxzF+jwINZFOBj1H7T6okfgeuku1nbIV19VdHWn7xjK5H4fQ+eyPW7hUPPFwQkzI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783666559;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Subject:Subject:From:From:To:To:References:In-Reply-To:Reply-To:Cc;
	bh=r/opBB8wIG3CFxEGoHyKh/g+ewFUpmZQc066nt+iQs0=;
	b=Ephot/+q4+X0IktZKt1ePWV4j8WH5D+wbF03e30lPjBt3ysbwefh1TJoD8C2bjUK
	BwSbpxzIaB0Ev60yfEMAUsu2Wl3qfNVt0YlDD+G6qLVH8SYejwmIz5rTKnB6I1rjzYW
	/KG9Me8lF2lFzjLfmXoU3xhTBfreKkGWqisqSP9w=
Received: by mx.zohomail.com with SMTPS id 1783666557281928.9950819909093;
	Thu, 9 Jul 2026 23:55:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Jul 2026 02:55:54 -0400
Message-Id: <DJUP0UXLLHJ0.3P121A982R9TP@ritovision.com>
Subject: Re: Bad wrapping in some tables
From: "Rito Rhymes" <rito@ritovision.com>
To: "Jonathan Corbet" <corbet@lwn.net>, "Daniel Lundberg Pedersen"
 <dlp@qtec.com>, <linux-doc@vger.kernel.org>, <linux-media@vger.kernel.org>,
 "Rito Rhymes" <rito@ritovision.com>
X-Mailer: aerc 0.21.0
References: <c542aaf7-6a40-4730-8bd6-208c9fe932d5@qtec.com>
 <87pl0yr9ah.fsf@trenco.lwn.net>
In-Reply-To: <87pl0yr9ah.fsf@trenco.lwn.net>
X-ZohoMailClient: External
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[ritovision.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[ritovision.com:s=zmail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:dlp@qtec.com,m:linux-doc@vger.kernel.org,m:linux-media@vger.kernel.org,m:rito@ritovision.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rito@ritovision.com,linux-media@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-67231-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rito@ritovision.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ritovision.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A4031737DE0

I just got caught up to speed, reviewing the links, the regression, the
prior state and other relevant context.

Daniel, thanks for pointing out the regression. As Jon said, it's
always good to inform the author of the patch, and I'd have been happy
to discuss and test out solutions with you.

> That overflow-wrap line is the problem. The patch was trying to
> improve overflow from some literal blocks, but it does seem that the
> cure is worse than the disease.

> This change causes truly unreadable breaking of literal strings in a
> number of settings.

Can anyone provide any examples of issues happening outside of tables?

If not, that suggests the fix is working fine except inside tables,
which means a targeted fix for tables is possible.

The intention of the fix is that inline literals in regular text bodies
that have a generally defined (max) width will respect that width and
not exceed it and cause overflow. It's serving that purpose and is a
sensible default behavior because it is often used like text in text
bodies and surrounded by other text, thus we make it also behave like
text.

I don't believe a reversion is the right answer, for two reasons.

Reason 1:

Reverting the fix restores the issues outside the tables it previously
fixed, and fixes some of the tables, but makes others just as
unreadable.

In the second example Daniel provided, there is a two column table
spanning the full width of the page on mobile viewport sizes without
overflowing. The left column is inline literals only, the right column
is regular text.

After my fix:
https://www.kernel.org/doc/html/v7.1/process/debugging/kgdb.html#run-time-p=
arameter-kgdbreboot

The left column of inline literals wraps down into vertical text and is
unreadable, because the column has no minimum width and expects the
contents to set the width, but it wraps immediately. That's a problem.
The right column text is readable, though it does some wrapping for a
few words.

Before the fix:
https://www.kernel.org/doc/html/v7.0/process/debugging/kgdb.html#run-time-p=
arameter-kgdbreboot

The issue is as bad or worse. The left column is fully readable and
spans literals as far as needed, but it's crushing the right column and
forcing that into vertical text (maybe 2-3 characters wide), making
that column unreadable.

What's worse, unreadable vertical text as inline literals or as regular
text? Regular text is worse because it's meant to be descriptive, but
having either one is unacceptable.

Reason 2: the real culprit here is this:

Table mobile responsiveness in general in the Linux kernel
documentation is systemically pathological.

Many if not most of the tables on smaller screens overflow page width
and break the page margins. And this page is another example of
pathological table behavior where the table doesn't overflow and
break the page margins, it respects the page margin width, but
instead makes the content inside unreadable as vertical text, either
from the string literal wrapping or from the text wrapping. Neither
my current fix nor the reverted state resolves that issue.

The best solution:
Make targeted changes to the tables to make them fundamentally behave
better on smaller screen sizes.

I began this effort with:
[PATCH v3] docs: wrap generated tables to contain small-screen overflow

Jon hadn't followed up after testing out the fix with CSS and my
explaining why the wrapper was the better approach, because it prevented
regressions. That fix is a start, but more would need to be done.

If Daniel is willing to help test out table fixes and provide examples
of regressions, and if Jon has the bandwidth to review my patch
submissions to improve the tables, I am willing to tackle this systemic
issue, which will result in this issue being resolved as well.

Rito

