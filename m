Return-Path: <linux-media+bounces-67614-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BkqnNqkEV2pbEQEAu9opvQ
	(envelope-from <linux-media+bounces-67614-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 05:55:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 732F175A617
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 05:55:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mit.edu header.s=outgoing header.b=g8YgpTyp;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67614-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-67614-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=mit.edu;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 87B0B3021755
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 03:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E243938D688;
	Wed, 15 Jul 2026 03:55:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5951A42BC31
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 03:55:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784087715; cv=none; b=Gh+STV/mLtSFjOMLvmf0fL5eVmPwZj4dADL3YaC2GlZ7YSiBrPJh0laD6MfSTSbVh0KcjHSnERcd7ddJnXsxWqkAXB3FtZCkLGY2+Cia4PUtILr7dOMJTrhwyD83v/CKpZFzPhLWD+/l7mr3+gAlqwHiTQ2fkzzh1KdAlMU+OYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784087715; c=relaxed/simple;
	bh=8GjgzIXl4pxPDDGr4ttSd3nXDn1BDzymua78QqTJ1mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lZ9uPZIpNXpV/c+FEtW3wpTzCy3PxmFdN0pPqf5YwCziWU+NF9gtt7JhWK1zlv025qR7Kvhu1MjHD8ybKKIldGS2PRshnzF1+UZiCUgGDNuhG6LgM1Q1jNAvXfsksAbMyk/lOjoazJfKGVmQqvQrBnL5nzntEK9wUFhBdtp5410=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=g8YgpTyp; arc=none smtp.client-ip=18.9.28.11
Received: from macsyma.thunk.org ([151.240.45.93])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 66F3shI3019517
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 23:54:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1784087690; bh=1uaDmlH3VcSYOBfyuK/hv85WYrfR4T7ZoGOuOKs2I8Q=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=g8YgpTypcybUB8iapIzS/rKXRFaKWqGaGqkLPSjXiFNzMvJi9x5FG8DSwMCq8+dO/
	 F3wfqTW1Iu6MUHNS4Ptx8CbzqCw04zMk6aTWqrdoq9ey1iIfLmyOfpCKaOA5ex088c
	 jLBcH2y3LmWbqsX1K6zxr/IDWWh6trP+PYFQ8UW0eU7+0BRX4DODFAgVuFeZ5ztS2P
	 vvvzJdtITaKaWE62CY3JRJdKb3be7iraFN8T2fVk8T2Kv0d8wiXGNLFvJ68j0zNqHI
	 dFwHe87fDSL1/rPpnUsiCzfIMYuoruZlU5StpF7o3+TVjEwUKW7nTjGLM1+L5Q3fLV
	 iXO6iQfQJdMkg==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id 425D0A211F6; Tue, 14 Jul 2026 23:54:43 -0400 (EDT)
Date: Tue, 14 Jul 2026 23:54:43 -0400
From: "Theodore Tso" <tytso@mit.edu>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Derek Barbosa <debarbos@redhat.com>,
        Matthieu Baerts <matttbe@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Jason Gunthorpe <jgg@ziepe.ca>, Steven Rostedt <rostedt@goodmis.org>,
        users@kernel.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Stephen Finucane <stephenfin@redhat.com>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <alcBvuIMEGSjAD1R@mit.edu>
References: <20260607195656.02788791@foz.lan>
 <akQlPSNfGEllNVhe@debarbos-thinkpadt14gen5.rmtusma.csb>
 <20260710074528.5a6e4457@foz.lan>
 <20260710083845.23c753ca@foz.lan>
 <87wlv2jq4t.fsf@linux.dev>
 <20260713095538.3d5e86f1@foz.lan>
 <20260713094120.GD1127719@killaraus.ideasonboard.com>
 <20260713220427.582b28bf@foz.lan>
 <7ia4mrvtrxjl.fsf@castle.c.googlers.com>
 <20260715005909.GF1656185@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715005909.GF1656185@killaraus.ideasonboard.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[mit.edu,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[mit.edu:s=outgoing];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67614-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:roman.gushchin@linux.dev,m:mchehab+huawei@kernel.org,m:debarbos@redhat.com,m:matttbe@kernel.org,m:konstantin@linuxfoundation.org,m:jgg@ziepe.ca,m:rostedt@goodmis.org,m:users@kernel.org,m:linux-media@vger.kernel.org,m:stephenfin@redhat.com,m:mchehab@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[mit.edu:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tytso@mit.edu,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tytso@mit.edu,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,sfconservancy.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 732F175A617

On Wed, Jul 15, 2026 at 03:59:09AM -0500, Laurent Pinchart wrote:
> I believe we should
> follow the first two recommendations of the Software Freedom Conservancy
> on using LLM-backed generative AI systems for FOSS contributions ([1]).
> 
> [1] https://sfconservancy.org/llm-gen-ai/llm-backed-generative-ai-recommendations.html

It's not clear to me that the SFC document is particularly applicable
for the use of LLM's beyond the use case of generating code which is
contributed to FOSS projects.

Things get a lot more complicated when we're considering the use of
LLM's to (a) review code, (b) automate the analysis of a bug report or
stack trace, or (c) automate backporting a patch to LTS kernel.

Consider the first recommendation, "The FOSS community should support,
not just tolerate, those who outright reject LLM-gen-AI systems."  If
someone rejects LLM-gen-AI systems, and the LTS kernel contains
patches which are automated backported, and they object, are we bound
to forswear the use of automated backport technologies?

What if someone reports a bug with a kernel stack trace, and someone
uses an LLM agent to analyze their bug report and find a fix.  What
does it mean to "support somone who outright rejects the use of
LLM-gen-AI systems" in that case?

> I expect maintainers who want to act on sashiko reviews to triage and
> verify them first before bothering authors

As a maintainer, I don't believe I should be forced to rephrase a
Sashiko report just because a patch author "outright rejects" LLM's.
For that matter, I don't believe I'm obliged to accept patches from
someone who forces me to do extra work because they refuse to look at
Sashiko reviews....

How do we balance the needs and time of maintainers with patch
authors?  I don't think it's obvious that we *MUST* bend over
backwards to oblige the needs of all patch authors.

Regards,

						- Ted

