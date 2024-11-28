Return-Path: <linux-media+bounces-22205-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B559DB39B
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 09:20:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1D2DB21AC6
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 08:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC72F14AD1A;
	Thu, 28 Nov 2024 08:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mg9DhkvE"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF88149DFA;
	Thu, 28 Nov 2024 08:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732782005; cv=none; b=B16k5tH0BCTmsCryGYV0RuwOrKMwIK6B5jDeAxkRntNLicBc/eZwSNxIfdCP+txbe9W+QJnHwxeVETVy67sWo1xgezngAxCLzI3e3Jq0yB+k6Gn56nIehPaXTqbB++90UrbUegAJf3+YSijZ0UyqwubQkJ2DrKOlxqeEmfU05dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732782005; c=relaxed/simple;
	bh=D1gFKb4pnqENR03OhiLXA36fwCPUpqp4eWoOiCC3oSA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dZQZY5//tP9kQ0qe26nYX89P2AihesA+ZQf5mLKM9q5gjmsYZp4N08YpFwFS2zvVdewybRUAxjpHCSfM+NWCqYkV3i+vKiKeLCH9OP7I2lFqCWMZ351WdU6MPJN54QD4VLbB3KjNE1ugqX5FKr3GwZ+esK2dupxGZ/W/E/dcMkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mg9DhkvE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF35AC4CECE;
	Thu, 28 Nov 2024 08:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732782004;
	bh=D1gFKb4pnqENR03OhiLXA36fwCPUpqp4eWoOiCC3oSA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mg9DhkvEontpEE6nlj7fBN/+XA2psMMa63lJDzXweNUZE+gQ/ph4uH4ThdLeD4rEZ
	 afc20chNO1GdD2gVa6r9pCL8yEKWuk2BjB9uhyH8GN+IA2MzgSJyyTBI8tvX0nem3E
	 zcyyLNOznh8UbGCEXo+VB40m8hPqUrZSTDEHJ54OUzomrM4NSgyp6Xnvmu9irIruSg
	 K3nyFIJ/yiV70yml86lb8aialmogYmpyAPPWsbn3a8u6boxbsnKBo4DBdUnk83OHxf
	 ho2zZfKJ04KPhegjHJIGlF1NGkW5Icc/1d1mGZwWsdd5i8uUyfLPfc8R11GFFEMGDb
	 35QtwkUjKa5FQ==
Date: Thu, 28 Nov 2024 09:19:59 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 workflows@vger.kernel.org, Hans Verkuil <hverkuil@xs4ll.nl>
Subject: Re: [PATCH] docs: media: document media multi-committers rules and
 process
Message-ID: <20241128091959.7ddeec08@foz.lan>
In-Reply-To: <e0535e20-6e97-437f-8565-53fd257c7618@xs4all.nl>
References: <6a3e19d75e504ebbf9cd9212faad12c005dfdfb8.1732541337.git.mchehab+huawei@kernel.org>
	<20241126151930.GA5493@pendragon.ideasonboard.com>
	<e0535e20-6e97-437f-8565-53fd257c7618@xs4all.nl>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Wed, 27 Nov 2024 12:59:58 +0100
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> > I find the GPG signature requirement to be borderline ridiculous. The
> > first message you're giving to committers is that you distrust them so
> > much that you want them to sign an agreement with their blood
> > (figuratively speaking). I don't think it's a very good approach to
> > community building, nor does it bring any advantage to anyone.  
> 
> I kind of agree with Laurent here. Is the media-committers mailinglist
> publicly archived somewhere? I think it is sufficient if this is posted
> to a publicly archived mailinglist. That could be linux-media, I would be
> fine with that. But media-committers would be more appropriate, but only
> if it is archived somewhere.
> 
> If we want a GPG key, what would we do with it anyway?

Every time I send pull requests upstream, I sign the PR tag with my GPG 
key:

	https://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git/tag/?h=media/v6.13-2

This is a requirement from the top maintainer. Requiring it is pretty much 
standard at the Kernel community, and wasn't anything similar "to sign with 
my blood" (using your words).

It is not just a random GPG key: it is a trusted key as stated at this patch:

	"a PGP key cross signed by other Kernel and media developers"
	 ...
	 For more details about PGP sign, please read 
	 Documentation/process/maintainer-pgp-guide.rst and
	 :ref:`kernel_org_trust_repository`."

If you see the last link, we're talking about a GPG signature inside
kernel.org web of trust.

Heh, all PRs we receive are signed with GPG keys that we trust, including
PRs from you. We need to keep doing it with the new workflow.

That reminds that there are still a gap there: the e-mail from the 
newcoming committer shall contain something like:

	"I'll be using this username to commit patches at media-committers:
	 https://gitlab.freedesktop.org/<username>"

I'll add it to the next version.

Thanks,
Mauro

