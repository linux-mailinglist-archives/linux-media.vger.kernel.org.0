Return-Path: <linux-media+bounces-63149-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LOrKwIzG2qqAAkAu9opvQ
	(envelope-from <linux-media+bounces-63149-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 20:57:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C553612D0E
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 20:57:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BAA0430B05D4
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 18:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 872F7258CE7;
	Sat, 30 May 2026 18:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="obzFsrex"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0022E7390
	for <linux-media@vger.kernel.org>; Sat, 30 May 2026 18:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780167238; cv=none; b=NvCsXjhs2s5bSaEtPyb67yE82yCYTdq+h5464LqkTxHSC807YciYPjjOqVjMp4zJh/7m454vCXEV38bHW4UXXXB73lC8/dF2CMlweQiSj0xgveR1oCEnG9nJvwcIJ9VFN9ya85btQnho/5koQ+yiwR6AGTmGGSc0vLXJdEKZz34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780167238; c=relaxed/simple;
	bh=aBGVkvVpSiDwQKofTIlzjnuIatSTwvk/1Eo1gtHEoAU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eIx9XAKCKqSqq9tt1HgXLYLuWr/kqbfpg7Vmy6A3aElwMOIKVDDV11hU6tEjTOtTU2d3P9ybHNic9ZNHbF6yg/LU65sn1M8N+xIOL7nY1d+rxpt4+BtEVC2dBjQZwlFRDPZbdXKw6dOjDhobVuiYq/XZcmGym98c+3Dezr4oc/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=obzFsrex; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3BFA1F00893;
	Sat, 30 May 2026 18:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780167235;
	bh=LOw/ovsIOrPVmyIodLFjUOvMIwEZdzeLhNmRtXKRX3U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=obzFsrexEaSIioDy503KM7DQitStSyAD+gPpT4CtbdUAih9o0XMAxTHOU4OBDK6ED
	 3JRBfdyRdTGn+ZXowenVsPrpNVsCY6GA8w09I4LzZh/dHNiEvVYCD98l6imX8VX6/M
	 ByRbbXVhYBq2wcdD4ydMLMPTax6YUCJFV7HEGKEuwWtUv09eE+nN4CPOzku9WEMXhP
	 sfSMcE6loVK1QHf07MnbYE113UJ6UPyL6vQFkPPa/incHtQ4rZHuJJ5XcsWQOoh89w
	 hWJSaPFPMY50s1SM4ZkcP4ct0/6gQ3wVOYRXx91dc5iwK4py4uN8e2QVJhVN1QbKiX
	 +00pWxzEpyXkw==
Date: Sat, 30 May 2026 20:53:51 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Derek Barbosa <debarbos@redhat.com>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, Steven
 Rostedt <rostedt@goodmis.org>, users@kernel.org, Linux Media Mailing List
 <linux-media@vger.kernel.org>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <20260530205351.19847fc8@foz.lan>
In-Reply-To: <20260530204945.22ac92c6@foz.lan>
References: <20260530103004.6fe2ffa7@foz.lan>
	<7E971C76-0568-43EF-9EE7-C8DB78C45CA1@linux.dev>
	<20260530200017.0fe7f685@foz.lan>
	<20260530204945.22ac92c6@foz.lan>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63149-lists,linux-media=lfdr.de,huawei];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linuxtv.org:url]
X-Rspamd-Queue-Id: 2C553612D0E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 30 May 2026 20:49:45 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> On Sat, 30 May 2026 20:00:17 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > On Sat, 30 May 2026 08:57:13 -0700
> > Roman Gushchin <roman.gushchin@linux.dev> wrote:
> >   
> > > Hi Mauro!
> > > 
> > > My understanding is that some subsystems might be interested in having patchwork integration 
> > > without Sashiko sending reviews over the email. Most notable, net. Also mptcp.    
> > 
> > Well, you can use my scripts to do such integration
> > (https://github.com/mchehab/pw_tools).  
> 
> Btw, I'm running my script here, making it use kernel.org. On some
> patches that are c/c to media, I can update status with my user,
> as I'm marked as maintainer there, like on those:
> 
> 	https://patchwork.kernel.org/project/linux-media/patch/20251220192210.399423-1-szymonwilczek@gmx.com/
> 	https://patchwork.kernel.org/project/linux-media/patch/bf19e526-3327-46a5-8ecd-4baaadef5bcf@I-love.SAKURA.ne.jp/
> 
> but on others, it fails:
> 
> 	ERROR: 14589154: sashiko failed to set 'warning': 403 Client Error: Forbidden for url: https://patchwork.kernel.org/api/patches/14589154/checks/
> 
> In total, it was able to update 160 patches. At the media instance,
> ~230 patches were updated using the same maildir directory.
> 
> Looking on this patch, for instance:
> 	https://patchwork.kernel.org/project/linux-media/patch/20260530143541.229628-3-phasta@kernel.org/
> 	https://patchwork.linuxtv.org/project/linux-media/patch/20260530143541.229628-3-phasta@kernel.org/
> 
> (patch is actually for Rust, but it was c/c to linux-media,
> so it appears at linux-media project)
> 
> and on this:
> 	https://patchwork.kernel.org/project/linux-media/patch/20260530094326.11892-2-linux.amoon@gmail.com/
> 	https://patchwork.linuxtv.org/project/linux-media/patch/20260530094326.11892-2-linux.amoon@gmail.com/
> 
> (patch is actually for linux-media, but was c/c to other
> mailing lists as well)
> 
> Both were updated on linuxtv.org (as there's just one Kernel project
> there), but they were not updated at kernel.org. What I *suspect* is
> that patches which are copied to multiple e-mails are problematic.

In time: problematic in the sense that the first project that
picked it is likely the patch "owner": the token will require
maintainership on such project.

In practice it would mean that the token used on patchwork instances
with multiple Kernel projects may need maintainers permission on all
such projects, as otherwise patchwork update will fail.

Thanks,
Mauro

