Return-Path: <linux-media+bounces-54503-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMo7HkNjqGlauQAAu9opvQ
	(envelope-from <linux-media+bounces-54503-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 17:52:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3D0204A18
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 17:52:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A477A3036073
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2026 16:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95B25371D0D;
	Wed,  4 Mar 2026 16:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gs5gClc/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0730B30CDAB;
	Wed,  4 Mar 2026 16:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772642857; cv=none; b=rYiCVnqrtekryMFBRNmqy6kD7kCLP0t73lTXXez68Ojth3r0p6Gx7OLO8Ex1H18e0X+xvXYHvwS7RRePyw7NtS+U1s8jTVb2kBzkeEHUEmUjjy7lb5hU3PnQROUeZ+I2aEZTzUwC6Tc2rorr+BPnfz0Z47p1M4TrVZ9xrN9m464=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772642857; c=relaxed/simple;
	bh=Y3XVsKQqE21JqD2Us/+p/wm5Uy09YFoFQkLR7l3Fkn0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=N2OzcqPIysBm4dVmaazkVh18e+XuDlNLU7i07SLFdp5ePOA7tMKYX32+AIkAgvdKkNqmZEvuj/SH5nLHtda0jHBT3UwJc583nmwo19YmCMYmB5aMuVSdGVo7g1UXgT1ecekXZy+QFT2JrsHlsKRaDKe97+QRL9Po6nJOlP1ilnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gs5gClc/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE76EC4CEF7;
	Wed,  4 Mar 2026 16:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772642856;
	bh=Y3XVsKQqE21JqD2Us/+p/wm5Uy09YFoFQkLR7l3Fkn0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Gs5gClc/ygOvU0aCp/rIadI5FosRZuHc4RbDhDUdJChsNxxqVKBsDOp6K2wvd1c4N
	 SI7IKgCTRpW75OREBljdAuPNLx/K5ul0xZX9elxQWGBt9+UNedHvr/3I9K71ocZKi3
	 q/sRRbDfkrU2HU9E5IGf6nFe/Ow/xDNvYIHWnSmg/9H5fs/47+JMbwN8mQ6zr3Bu65
	 wszHYuCDhQsHb8EBK1hvGPXdbPIeTOb79De3fo+D26oZsqHRztdxgW6NdUEsiZNL2h
	 xlJokqImqhfPwQTz+KYZtiAmUQwpAKeKhXoMRgDROJZ8LnSo8KtPxwCuL+3X1ONhcA
	 VJa/vI6fPOoiw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA0663808200;
	Wed,  4 Mar 2026 16:47:38 +0000 (UTC)
Subject: Re: [GIT PULL for v7.0-rc3] media fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260304101737.198de4d0@foz.lan>
References: <20260304101737.198de4d0@foz.lan>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260304101737.198de4d0@foz.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v7.0-3
X-PR-Tracked-Commit-Id: 24d87712727a5017ad142d63940589a36cd25647
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4053c47680da0a03a8df66735904d5b92db6a144
Message-Id: <177264285723.2299690.13541842768133121741.pr-tracker-bot@kernel.org>
Date: Wed, 04 Mar 2026 16:47:37 +0000
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: CE3D0204A18
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54503-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

The pull request you sent on Wed, 4 Mar 2026 10:17:37 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v7.0-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4053c47680da0a03a8df66735904d5b92db6a144

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

