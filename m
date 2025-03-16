Return-Path: <linux-media+bounces-28320-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 750F0A6373C
	for <lists+linux-media@lfdr.de>; Sun, 16 Mar 2025 20:28:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E71A816AF94
	for <lists+linux-media@lfdr.de>; Sun, 16 Mar 2025 19:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C5AB1E1DE5;
	Sun, 16 Mar 2025 19:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Am8rp1My"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B755CA32;
	Sun, 16 Mar 2025 19:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742153297; cv=none; b=M789Aw9c9utbdkO9BvKPzQersmDV4aqlgtZWgl1Ji6bxdOJ+5apP4FHU/tQOwrtmkMxp23/5l+gCYcokQysup5g7iP4ZgfdQuHHA9TeWkhh4ytrOkhKtCjZnr283q2rUtQCXE3yeWoZvrkDC6FTzojA9aMSx9lApb5d1kYI9gCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742153297; c=relaxed/simple;
	bh=MYEuvc52ypoTdXrZLTLK+J8CROcliX5acIRVCJ2unkg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=eI2TAQXg0ozjuuxG6oWDbh5rB78xbsFdmeXn5b5on1UHxrw6foOAvqkdgamjbiTE3crWV5CGt/tkLUQO/lr/hojZ82Jrt6VpXV0UQVFrB9Bw1kOJ3e/dpewLaH9ljXhz+CNFyPtYOkry6DdJDszg/+SecK9vYxMqQL/LmWpf/zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Am8rp1My; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 925FFC4CEDD;
	Sun, 16 Mar 2025 19:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742153297;
	bh=MYEuvc52ypoTdXrZLTLK+J8CROcliX5acIRVCJ2unkg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Am8rp1MyT2H/yn0CraUo4zV/VwD/y05kgJOtLRDLbfab79IQhYEnTZB5ApCoZgyIb
	 OK9aX5fv+orA/NuFd47Onspdeu51A5NYKKqNuaVNjQRcG49WP0hMd6wDem5sUCIOUs
	 0eGa5Ijvrr3rdUCvAm39QkiBXilNMWV2mPtBCxb/fSxTcnPy6Ah/TcjOZIjjuChxrE
	 +WFbLTUh/3nPjF+lVln6Fn7SptmqiLQpOw3bwqBNGjlq4Tx/oyAqhePMnFGz3GT46W
	 iBs1bo3nLiuY5NSiOFd/rqDn4wE6tZXlalFgVPDQiWrTazF3CxSUajx9Z+vXdu64v1
	 29MhpaKsenZpw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EADD5380CFF2;
	Sun, 16 Mar 2025 19:28:53 +0000 (UTC)
Subject: Re: [GIT PULL for v6.14-rc7] media fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250316093009.6e1f303c@foz.lan>
References: <20250316093009.6e1f303c@foz.lan>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250316093009.6e1f303c@foz.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v6.14-3
X-PR-Tracked-Commit-Id: d9e7c172a7f247f7ef0b151fa8c8f044b6a2a070
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d1275e99d1c4f2e70452558b8da9d0d7bdcc9e16
Message-Id: <174215333244.2863831.18344436977855270579.pr-tracker-bot@kernel.org>
Date: Sun, 16 Mar 2025 19:28:52 +0000
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 16 Mar 2025 09:30:09 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v6.14-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d1275e99d1c4f2e70452558b8da9d0d7bdcc9e16

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

