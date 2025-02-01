Return-Path: <linux-media+bounces-25521-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EB8A24BBE
	for <lists+linux-media@lfdr.de>; Sat,  1 Feb 2025 21:08:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22FB43A65A7
	for <lists+linux-media@lfdr.de>; Sat,  1 Feb 2025 20:08:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 208C61CBE94;
	Sat,  1 Feb 2025 20:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZlPTVxVK"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5AF7DA84;
	Sat,  1 Feb 2025 20:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738440483; cv=none; b=cxE5mZR2Pui8JOoiY3WetgLv6SK8VRHOmILxJcLdAPOhRFyG+QKepzKh3KIocsSJMoVWEfzov+bD3APdp4bKnCDk7++jUA8z94g4o3tb0cuTS7DqhZd9ziAxqdUTEG7RyL4DZa1MVfxaXKkuAaX50QVZpODYIpO7J6BchrPavqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738440483; c=relaxed/simple;
	bh=N4CBAg2YHULQMbmvvKurqoVxaRy305PJ3/uLL6gB9cE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=IuELdphpvGf1h55FwdbbQa38YrnjxNTxv8MxjyDOILviBRWBGaswbgEg5xR4AyJcaeK92kDv8fNAUUlyNcutQCiQyVw6xhaSvemS+L6tpJTsuLv6jJji+pKfpOsnZE6rF0+mc4kpe4gpdZY5ZWgBvg9Z8vYdUUCqgiMdV/5OmGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZlPTVxVK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57EA2C4CED3;
	Sat,  1 Feb 2025 20:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738440483;
	bh=N4CBAg2YHULQMbmvvKurqoVxaRy305PJ3/uLL6gB9cE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ZlPTVxVKzf3+HpiWsypfNFJATqtJ1sybEDm7LUAUYSNq7BeTQecx7yZ+sMB9tbHbH
	 ji8XMxiIN9NRZnnJ1+8BRHfZM6NpuG4lj24ezQb7AQYtvYHdvKreKI2fq0twFUtJrS
	 xXKqpFRe9LHrzw+rU/U6nEsSLHDLOKTwVZdjZCZ5mVC+7NzU8z5CG23GYB2r+jyWOe
	 niDTvnP0vTUxLzuLpivAOrfIDvB56wdZ9W6aBKV3Xi66iiAKw+qDstv6bDkoy6MOJx
	 XB803+vQq0Xqw8vvYsBse2Rn3cDt2Juzqdoil3tejoK1GJC1MZh8pmVdV/JnQpagLC
	 oGyJhNwq8LVGw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 36298380AA68;
	Sat,  1 Feb 2025 20:08:31 +0000 (UTC)
Subject: Re: [GIT PULL for v6.14] media updates
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250201085710.6a709c01@foz.lan>
References: <20250201085710.6a709c01@foz.lan>
X-PR-Tracked-List-Id: <linux-media.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250201085710.6a709c01@foz.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v6.14-2
X-PR-Tracked-Commit-Id: 8004d635f27bbccaa5c083c50d4d5302a6ffa00e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c6fe03a3f92efdaecff085591fcd18cac9850855
Message-Id: <173844050955.1982916.1943275785075784407.pr-tracker-bot@kernel.org>
Date: Sat, 01 Feb 2025 20:08:29 +0000
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 1 Feb 2025 08:57:10 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v6.14-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c6fe03a3f92efdaecff085591fcd18cac9850855

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

