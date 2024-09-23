Return-Path: <linux-media+bounces-18480-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5B6983A36
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 01:14:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFF831F229C6
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 22:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16310154BE0;
	Mon, 23 Sep 2024 22:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NOx2AiE0"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769D91514CE;
	Mon, 23 Sep 2024 22:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727130887; cv=none; b=bdiqc+TJQLS49CqUqYaKuQrbYwCjJqFpz5cTAzR8BQz0Uh81h8U/8c6gkkmbHz2Kpv221Pzv6YjYx48b+CfWuugcAOKhwfESLPxWdmdXRfoiuVsYwisZ3k20zKL7n484zfFNqy67Afx3m5AWgYyDSHHIzPGmglUJbG3eHTNOpP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727130887; c=relaxed/simple;
	bh=aibMLGCC2zV6KGulz4V39o41y33zGJUcc8E8Fb1djcE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=okwb5evqrWIqyML1YggMCQIurLhj4P80OA3B+pjQAyNEGAK4jQNgzTawGI2cn8HlVJVvIhtfhz5XP/OSScmsVrk45VECZWmnDZtHTb2HsldWjl0Z4cLUArPvhYw6EesRvF+zWwHmsab1J91gF14zD+Mi07EaYtGs2k4BVqr7NbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NOx2AiE0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 571EEC4CEC4;
	Mon, 23 Sep 2024 22:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727130887;
	bh=aibMLGCC2zV6KGulz4V39o41y33zGJUcc8E8Fb1djcE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=NOx2AiE0Y/ccmUc8l/2kwgPev8jwrPySnBSoha9gYKLf1jWrm5Qc2XvdC+Djs58o7
	 vuQIIW0tGzvmUuIfIkxkUKCrR27/RzR7N7HlJQaNh7XWujFCr1Jwvb78iXwjwBiFKY
	 mjTZpXj+pirE2gS1su2x6r43IBdqdld0eRqWYlzeS1ysNIT+E6+0dU/aRFMdnGfb6b
	 WH6iF+GWN+bOA0tAMOegxrYCVpd0OTzKrH6nk/cTk9wXHilb4My5HhLL53Q2tN+fdQ
	 MCM4rJSwuV9setEFy6QJ1OgV50kGIzeDoKJYPu3JasEUpYLSiTOWot7kN1NAWoUlsN
	 uzMJMxSjGj4vQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB2DA3809A8F;
	Mon, 23 Sep 2024 22:34:50 +0000 (UTC)
Subject: Re: [GIT PULL for v6.12-rc1] media updates
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240923125642.7aed968b@foz.lan>
References: <20240923125642.7aed968b@foz.lan>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240923125642.7aed968b@foz.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v6.12-1
X-PR-Tracked-Commit-Id: 81ee62e8d09ee3c7107d11c8bbfd64073ab601ad
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: abf2050f51fdca0fd146388f83cddd95a57a008d
Message-Id: <172713088962.3509221.1481536228444812034.pr-tracker-bot@kernel.org>
Date: Mon, 23 Sep 2024 22:34:49 +0000
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 23 Sep 2024 12:56:42 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v6.12-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/abf2050f51fdca0fd146388f83cddd95a57a008d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

