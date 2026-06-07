Return-Path: <linux-media+bounces-64062-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fUiWCVexJWoxKgIAu9opvQ
	(envelope-from <linux-media+bounces-64062-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 19:58:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E79C65123F
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 19:58:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=MaT5RYUU;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64062-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64062-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 791B93011BDB
	for <lists+linux-media@lfdr.de>; Sun,  7 Jun 2026 17:57:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EE50313539;
	Sun,  7 Jun 2026 17:57:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33C11F91E3
	for <linux-media@vger.kernel.org>; Sun,  7 Jun 2026 17:57:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780855021; cv=none; b=hid4PrnbdthWpvBYQbaEYeu+x3i53EEJ2j/fjzLqjxIdfGf3d7U5ByFgjB6J032PnoUc9IIy9edv5I6+Uu3UL4iEvNNl63zBPy0CYW+UmEOZGXEu3a2AcbMWpO9qQv771E2N0zYguLNk9FFRW7y7KFXKVkw4z7Hvaz3bRa+Xtcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780855021; c=relaxed/simple;
	bh=Xe07v6ng5JB0tmb+CVG/wro87x5cejNiBTpe5r84luc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jJJekAsAadN/6I5IIE9UjwiyaZm+q2171gQpxTdTcRb9u23iOLbrOWTH/D3i00Rh2E8uPzgXnv1INp9rYPqwkYyuVEbyN1ui7PyifQJgvmEBV6EhQoyXJ6j4Pvh/nTlaDWj1aI/GE9hu3XZQBh6LjeeYgAV6+MHS0Dsi9UDiShc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MaT5RYUU; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D21081F00898;
	Sun,  7 Jun 2026 17:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780855020;
	bh=eaJzPG7BhypdGMIGsiQCDpVnLpyHkpTrhJafPcPbZmA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=MaT5RYUUb38qjt13TDK8+jBtd+CRI1xxJf+qv6ogXCs7foqYvFfm7JAqtX7smqacz
	 G7f+6KXUAw9lV+hzrWkCrJp07Bq/pTS/pqp3sdebjoz/OIJSHiuQvmIW8SbjMsUAv0
	 Sw6po7/vM2BGuL+j8kg2p1C5jQ2RXplCBRqBnNyH90nIbRjpTbqjALSXMOWvwbv+BG
	 h88SyBT44rV6CTuvuTRqtP1XJdBvBbRa+JXRkLnc9q5NVILOIijN2nFlDnhQ0+8KEJ
	 MqyQ3opwzPI1VW6rw9sXzuk9toSIzHjTk7XZYAWvXBibcClak906NeeN3IggjmP12l
	 EelGMmQDeO5nA==
Date: Sun, 7 Jun 2026 19:56:56 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Matthieu Baerts <matttbe@kernel.org>
Cc: Derek Barbosa <debarbos@redhat.com>, Roman Gushchin
 <roman.gushchin@linux.dev>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, Steven
 Rostedt <rostedt@goodmis.org>, users@kernel.org, Linux Media Mailing List
 <linux-media@vger.kernel.org>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <20260607195656.02788791@foz.lan>
In-Reply-To: <20260604085201.177ad537@foz.lan>
References: <20260530103004.6fe2ffa7@foz.lan>
	<7E971C76-0568-43EF-9EE7-C8DB78C45CA1@linux.dev>
	<20260530200017.0fe7f685@foz.lan>
	<20260530204945.22ac92c6@foz.lan>
	<20260530205351.19847fc8@foz.lan>
	<ah7dpsLKd0Jf1Ir0@debarbos-thinkpadt14gen5.rmtusma.csb>
	<7ia4tsrkn1k4.fsf@castle.c.googlers.com>
	<20260602223936.27def657@foz.lan>
	<b9f7ca3a-fa72-4a8e-94bd-9991a0882f10@kernel.org>
	<20260604085201.177ad537@foz.lan>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64062-lists,linux-media=lfdr.de,huawei];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:matttbe@kernel.org,m:debarbos@redhat.com,m:roman.gushchin@linux.dev,m:konstantin@linuxfoundation.org,m:jgg@ziepe.ca,m:rostedt@goodmis.org,m:users@kernel.org,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxtv.org:url,linux.dev:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5E79C65123F

On Thu, 4 Jun 2026 08:52:01 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> On Wed, 3 Jun 2026 09:50:06 +1000
> Matthieu Baerts <matttbe@kernel.org> wrote:
> 
> > Hi Mauro, Derek, Roman,
> > 
> > On 03/06/2026 06:39, Mauro Carvalho Chehab wrote:  
> > > On Tue, 02 Jun 2026 20:13:15 +0000
> > > Roman Gushchin <roman.gushchin@linux.dev> wrote:    
> > >> Derek Barbosa <debarbos@redhat.com> writes:    
> > >>> On Sat, May 30, 2026 at 08:53:51PM +0200, Mauro Carvalho Chehab wrote:      
> > 
> > (...)
> >   
> > >>> - pw_tools is a workaround solution to get/set status on patchwork via bot-mail
> > >>>   parsing. pw tokens also have broad permission scope.
> > >>>
> > >>> which that leaves us with two "methods" of integration:
> > >>>
> > >>> 1. The Sashiko daemon calls the pw_tools script directly to update the status.
> > >>> 2. Sashiko sends a single-per-patch-email with parseable "status" to a mailing
> > >>> list, where some running daemon will pickup the mail.      
> > >>
> > >> This feels a bit hacky.    
> > > 
> > > The alternative that would be acceptable, at least on media, is if 
> > > one would add support on patchwork to have a separate permission just
> > > for checks update.    
> > 
> > Indeed. It looks like there is an old feature request about that:
> > 
> >   https://github.com/getpatchwork/patchwork/issues/14
> > 
> > Linked to Mauro's email from Dec 2015 :)  
> 
> If it is OK to have a global CI permission, I think this patch
> would do the trick (currently untested):

Added both global and per-project permissions to add CI checks:

	https://github.com/getpatchwork/patchwork/pull/653

Tested on a docker container created on the top of current
upstream, with the database imported from linuxtv.org and
migrated to the new permissions model.

Regards,
Mauro

Thanks,
Mauro

