Return-Path: <linux-media+bounces-11622-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F8B8C8CF2
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 21:47:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 571131C21D0C
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 19:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41F4B12FF6D;
	Fri, 17 May 2024 19:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r5VViZNa"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA4B321D;
	Fri, 17 May 2024 19:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715975223; cv=none; b=l685Unr32+hcdPs2tV4Do+DsApfZbVYI6GhuZ7rh01uVNycMCO0LKvSwGX28ljIumsnSBrZVKic1Ps7ybaaw732tG2Sr5XhOE9YterlpiCZfX9+m0C9HjR/rxOvi+egLX5sQ529DgpaQwq4Oqs8SWTc48cJ6XNW4MPNQXP8GRlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715975223; c=relaxed/simple;
	bh=mYLlTpnTpDEmQsXltTdIx4sqlrg4Hl9xHkNM0s1fy0M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vuz3tMu4LlswA8K/eez6u+h3vfVBMqc1rvg0/N9gXLwvGKGGqJwwk7FzukM87Iy8u201yuZ3s5+CTc6j6oWiwPl5V4fzl4BmJ1DSXBm8/XyfExXddbh3aqw0rYleG/E8mwMS8X05kZcCWAzwHpYUt7nnjHxny9SfdLzCKmeakzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r5VViZNa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF0E1C32786;
	Fri, 17 May 2024 19:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715975223;
	bh=mYLlTpnTpDEmQsXltTdIx4sqlrg4Hl9xHkNM0s1fy0M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=r5VViZNaJD299/LC4zW1acI+eecf6DVZb2k60LaVJUtXAhRFScONJOjh1Oy0KYM77
	 MVag7DlaokMs8QVhqWSQDPla7+VJxpqx/3IqLiQnzm7cL6Rd8bS0iHhJP3cQ90qWxY
	 peqdt2562p+1QdYOZmu+KBRnLmr6uyhbRkoEPGcKMBDNA8TJdomNzlO1Miog25STWo
	 OBm/JWZxV16OY9VGyVsQIqzyqAIifLcnCREpKJKqIufWBOc61QdXIzuz2jvFtH8J27
	 Np87QHXo7O64KPpoy9MonvGGjtXsQPtMKEL58el5XXw8Oe94p1KoQalqo+JM3nGTwz
	 D/VRvdsRMSoRA==
Date: Fri, 17 May 2024 20:46:57 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Gustavo Padovan <gus@collabora.com>
Cc: linux-media@vger.kernel.org, "kernelci@lists.linux.dev"
 <kernelci@lists.linux.dev>, Denys Fedoryshchenko <denys.f@collabora.com>
Subject: Re: linux-media checkout failing for KernelCI
Message-ID: <20240517204657.7521cd6b@sal.lan>
In-Reply-To: <20240517195627.28887c2b@sal.lan>
References: <2b1ca3bb-c49a-ce2d-2d86-821dfa6854a4@collabora.com>
	<dba299b0-df43-00f2-f5ec-2078eb8a63e8@collabora.com>
	<20240517195627.28887c2b@sal.lan>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Fri, 17 May 2024 19:56:27 +0100
Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:

> Em Fri, 17 May 2024 09:45:53 -0400
> Gustavo Padovan <gus@collabora.com> escreveu:
> 
> > ...linuxtv-ci mailing-list rejected me for not being a member, so moving 
> > to the media list.
> > 
> > On 5/17/24 09:41, Gustavo Padovan wrote:  
> > >
> > > Hi Media maintainers,
> > >
> > > We are struggling to use the media tree, in the same way we usually 
> > > virtually all other trees in KernelCI. The following commands gives 
> > > KernelCI a fatal error.
> > >
> > > git clone 
> > > git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> > > cd linux
> > > git remote add media https://git.linuxtv.org/media_tree.git
> > > git remote update media
> > > git fetch --tags https://git.linuxtv.org/media_tree.git
> > > fatal: Couldn't find remote ref HEAD  
> 
> First of all, the best is to use, instead, media_stage.git, as this
> contains the most recent patches. You should notice, however, that
> we might need to rebase media_stage.git. That doesn't happen often,
> but if you use it for CI, just in case, be sure that it will do a
> 
> 	git reset --hard FETCH_HEAD
> 
> To avoid potential problems if a rebase is needed.
> 
> We periodically update media_tree.git as well (which never rebases),
> but the update is manual. I usually do it once per week between
> -rc1 to -rc7, by the time I handle myself pull requests.
> 
> For CI, the best is to use media_stage.git.
> 
> -
> 
> With regards to merge/fetch, please use the git protocol
> whenever possible, e. g.:
> 
> 	git://linuxtv.org/media_tree.git
> 	git://linuxtv.org/media_stage.git
> 
> you may, alternatively use:
> 
> 	https://linuxtv.org/git/media_tree.git
> 	https://linuxtv.org/git/media_stage.git
> 
> The 4 above url's are handled by git daemon.
> 
> If you use, instead:
> 
> 	https://git.linuxtv.org/media_tree.git
> 
> It will use cgit, which will try to do the right thing, but
> results may not be consistent, as the main goal for cgit is to
> provide a web visual interface (which is IMO a *lot* better than
> what git??b provides).
> 
> The problem with https is that it may require a hook during
> push time to update https references:
> 
> 	git update-server-info

I actually changed the setup today, removing the need of having
such hook, and dropping it from all repositories there. Now,
the https server (either via cgit or directly) shouldn't need it
anymore.

I suspect that the problem of having HEAD outdated/broken from time
to time should be gone now, and all 3 alternatives should work
properly.

Please let me know if you find any issues.

Regards,
Mauro

