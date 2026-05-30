Return-Path: <linux-media+bounces-63148-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLETCwgzG2qqAAkAu9opvQ
	(envelope-from <linux-media+bounces-63148-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 20:57:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AAC612D1E
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 20:57:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1B343033F86
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 18:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8E27242D67;
	Sat, 30 May 2026 18:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B1RGXnUo"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391A81D63E4
	for <linux-media@vger.kernel.org>; Sat, 30 May 2026 18:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780166991; cv=none; b=uAxUdw2NzzLTRzQqubmET9xPmMDZgVrefIZR7ql360GsABS4IeUjQRfmljJYLV6JEdveNdrwO3dFVq85QfrCwqn+0Ky6j4+vT26oMBA/slCUze8rVxN+auUc9DQAJAONRBpoZ89P1eQ95tWkra3K56RFI4W0FFd0q+bPsTQZ6R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780166991; c=relaxed/simple;
	bh=4HGzWH3eYdvzPWBRkxAB+CQsPs7s9sDREb4PVPPmA44=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jvcOnKtmc2JzonhZ5uAAfNvEIquHgQc6JeLxftbjm5iDaimMmEkdLFfW8LCVJgvDQF3CziqFwYskEikhjFHh5VqGOOJ5jOydgOrUU/Tk9kbkQCxmIo5O6+c+0f8SrKjD9Pd39s/WCd+9uDgPqcainFT9G3newWbShKv9FiiI8PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B1RGXnUo; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E8571F00898;
	Sat, 30 May 2026 18:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780166990;
	bh=pg4OBm/UHh+7fflnrcjyUzAFqWRnHOb7i1lltJfil80=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=B1RGXnUoi6qfPIYqYikjQvWhLndsu5DLsvVLVVzhdQVFS3ydiflC3MSuqLKTHfJmU
	 RFbwIMo1HyexeSiT3zDHfoIwFwWysRH5oU2wSDzVdOnhu6wKFLT+4CJKHBNaNlVTri
	 TuX5BA207741Vfot8fuc/mDe3KV6vQ0twtuL1nrN4+ynbJjyjnAoeX9lrfIVB+MzAE
	 Kyx+9RYa/xWs2wvtJNh+vcqJbz2Yj5eR0RJjR3gXNjDIY9rYyTAPqwLWeBaLgTNPh0
	 2VCsvHBJRVHGFUCiUa5Py83zL2NfMdNgTq/CxfXB8IPsex3D8+/9ZRTRrl68+3b1Gx
	 +Uohz7APzvU7g==
Date: Sat, 30 May 2026 20:49:45 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Derek Barbosa <debarbos@redhat.com>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, Steven
 Rostedt <rostedt@goodmis.org>, users@kernel.org, Linux Media Mailing List
 <linux-media@vger.kernel.org>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <20260530204945.22ac92c6@foz.lan>
In-Reply-To: <20260530200017.0fe7f685@foz.lan>
References: <20260530103004.6fe2ffa7@foz.lan>
	<7E971C76-0568-43EF-9EE7-C8DB78C45CA1@linux.dev>
	<20260530200017.0fe7f685@foz.lan>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63148-lists,linux-media=lfdr.de,huawei];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxtv.org:url,linux.dev:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: C6AAC612D1E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 30 May 2026 20:00:17 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> On Sat, 30 May 2026 08:57:13 -0700
> Roman Gushchin <roman.gushchin@linux.dev> wrote:
> 
> > Hi Mauro!
> > 
> > My understanding is that some subsystems might be interested in having patchwork integration 
> > without Sashiko sending reviews over the email. Most notable, net. Also mptcp.  
> 
> Well, you can use my scripts to do such integration
> (https://github.com/mchehab/pw_tools).

Btw, I'm running my script here, making it use kernel.org. On some
patches that are c/c to media, I can update status with my user,
as I'm marked as maintainer there, like on those:

	https://patchwork.kernel.org/project/linux-media/patch/20251220192210.399423-1-szymonwilczek@gmx.com/
	https://patchwork.kernel.org/project/linux-media/patch/bf19e526-3327-46a5-8ecd-4baaadef5bcf@I-love.SAKURA.ne.jp/

but on others, it fails:

	ERROR: 14589154: sashiko failed to set 'warning': 403 Client Error: Forbidden for url: https://patchwork.kernel.org/api/patches/14589154/checks/

In total, it was able to update 160 patches. At the media instance,
~230 patches were updated using the same maildir directory.

Looking on this patch, for instance:
	https://patchwork.kernel.org/project/linux-media/patch/20260530143541.229628-3-phasta@kernel.org/
	https://patchwork.linuxtv.org/project/linux-media/patch/20260530143541.229628-3-phasta@kernel.org/

(patch is actually for Rust, but it was c/c to linux-media,
so it appears at linux-media project)

and on this:
	https://patchwork.kernel.org/project/linux-media/patch/20260530094326.11892-2-linux.amoon@gmail.com/
	https://patchwork.linuxtv.org/project/linux-media/patch/20260530094326.11892-2-linux.amoon@gmail.com/

(patch is actually for linux-media, but was c/c to other
mailing lists as well)

Both were updated on linuxtv.org (as there's just one Kernel project
there), but they were not updated at kernel.org. What I *suspect* is
that patches which are copied to multiple e-mails are problematic.

Thanks,
Mauro

