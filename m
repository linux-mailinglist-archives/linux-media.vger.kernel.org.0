Return-Path: <linux-media+bounces-11621-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB9B8C8C5F
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 20:56:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5607A1C21AEA
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 18:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A708313E046;
	Fri, 17 May 2024 18:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YSVKfq2a"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9A513D8B4;
	Fri, 17 May 2024 18:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715972198; cv=none; b=eQWsQvIvBKJY5Zpxur0IRsc0YdHM/YojwO+fRIXokNDiaxOgV6dHeDhiKnnHcr1MGQzhs/TpY00KO7t1iDZCw/3VeJP3w/A+uTaBrJTbxoeUpGXKjrT+N6Sg2ONs8kKx+wwl9UxKzxj1RZS4JrT5HjVYiAmVjy9EMTi88dC2YMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715972198; c=relaxed/simple;
	bh=sB7roDNFwrWuBjjxkCt65nsjHT/FjuUm4AL71SGBeOw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iOMXqNadhEYX+X8nZzndAIsRnrR0Qc+af1/mN2glWxjRMA5CaqR90Odt/HblVO9Un/5W0nnAtU8O/VgJYRzKp+Ey+x8WwCgSMxbKkNgTNLpJAbjl7oIhdIyBnTrZmIaJ3rhWgGArHOtrgwKXaGrrnv1nEKCG5lArCvMHeFNRmpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YSVKfq2a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31E5BC2BD10;
	Fri, 17 May 2024 18:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715972197;
	bh=sB7roDNFwrWuBjjxkCt65nsjHT/FjuUm4AL71SGBeOw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YSVKfq2a++HPllEBpfQWZRV+AEo5Di6eGd5QmQqSFbTPMGWDj+fEI4QQpwWBVhVR2
	 6HHMdpVjcBds6K4tP1b7WaW6JNaSTTDNbUlYDlWAthY8A5ncWP8sqTi5iuZSMAbvtA
	 2DwcyrQe9Tb8Nb6+OLSFhsRmjQUEHn5eGYnB6DWJ8IQyo5MlFcfUltTxF8VfMmOJjV
	 PDvpbkg5awGCH4D7iXm4XA18miHu71K9Pnisy2ZBhg0+8PnNhMw9cve9HiHp4lVbFM
	 tpuZi4JiGr/WXw4wCsPQEgsnp+ezFu41eAxcNHkh3LcSFFP3A7LbBobiPGW1furc9v
	 32qCkgRPS27iw==
Date: Fri, 17 May 2024 19:56:27 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Gustavo Padovan <gus@collabora.com>
Cc: linux-media@vger.kernel.org, "kernelci@lists.linux.dev"
 <kernelci@lists.linux.dev>, Denys Fedoryshchenko <denys.f@collabora.com>
Subject: Re: linux-media checkout failing for KernelCI
Message-ID: <20240517195627.28887c2b@sal.lan>
In-Reply-To: <dba299b0-df43-00f2-f5ec-2078eb8a63e8@collabora.com>
References: <2b1ca3bb-c49a-ce2d-2d86-821dfa6854a4@collabora.com>
	<dba299b0-df43-00f2-f5ec-2078eb8a63e8@collabora.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Fri, 17 May 2024 09:45:53 -0400
Gustavo Padovan <gus@collabora.com> escreveu:

> ...linuxtv-ci mailing-list rejected me for not being a member, so moving 
> to the media list.
> 
> On 5/17/24 09:41, Gustavo Padovan wrote:
> >
> > Hi Media maintainers,
> >
> > We are struggling to use the media tree, in the same way we usually 
> > virtually all other trees in KernelCI. The following commands gives 
> > KernelCI a fatal error.
> >
> > git clone 
> > git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> > cd linux
> > git remote add media https://git.linuxtv.org/media_tree.git
> > git remote update media
> > git fetch --tags https://git.linuxtv.org/media_tree.git
> > fatal: Couldn't find remote ref HEAD

First of all, the best is to use, instead, media_stage.git, as this
contains the most recent patches. You should notice, however, that
we might need to rebase media_stage.git. That doesn't happen often,
but if you use it for CI, just in case, be sure that it will do a

	git reset --hard FETCH_HEAD

To avoid potential problems if a rebase is needed.

We periodically update media_tree.git as well (which never rebases),
but the update is manual. I usually do it once per week between
-rc1 to -rc7, by the time I handle myself pull requests.

For CI, the best is to use media_stage.git.

-

With regards to merge/fetch, please use the git protocol
whenever possible, e. g.:

	git://linuxtv.org/media_tree.git
	git://linuxtv.org/media_stage.git

you may, alternatively use:

	https://linuxtv.org/git/media_tree.git
	https://linuxtv.org/git/media_stage.git

The 4 above url's are handled by git daemon.

If you use, instead:

	https://git.linuxtv.org/media_tree.git

It will use cgit, which will try to do the right thing, but
results may not be consistent, as the main goal for cgit is to
provide a web visual interface (which is IMO a *lot* better than
what git??b provides).

The problem with https is that it may require a hook during
push time to update https references:

	git update-server-info

Currently, we have such hook enabled for media_tree.git and
media_stage.git. I'm not sure if this is still required for
cgit and git-daemon, though.

If one could test it, that would be nice.

We may migrate some day from git-daemon/cgit to something more modern,
like gitlab, but I'd like to keep a patch-based view like the one
provided by cgit, as IMO showing the Kernel tree by default doesn't
really help for our needs: showing the basis of the Kernel tree as
the initial view means nothing, as one can't tell if new patches were
added or not just looking into it.

> > We are in the process of enabling a lot of testing for media using 
> > fluster/gst and the ChromeOS Tast PlatformDecoder tests. I am not a 
> > git behavior expert, so we want to start this thread to discuss 
> > possible solutions as the media tree is for some reason deviating from 
> > some tacit standard.
> >
> > Thoughts?
> >
> > Best,
> >
> > - Gus
> >  
> 

