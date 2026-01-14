Return-Path: <linux-media+bounces-50724-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A3BD2104E
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 20:24:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2BBA3300C623
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 19:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1C78346E4C;
	Wed, 14 Jan 2026 19:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uabjth2s"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3300D346AC6;
	Wed, 14 Jan 2026 19:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768418670; cv=none; b=l2taAbPR9S1xC6d2cbLw5db+uqEIrhLoYIaPSF7iYtmC6I1GfsePnmhwqkpML59lpXQnH+QYkO7iycGrswOYRt3pNh5eZVeiFzj87yUq6359exgJapG7vWDEOJ6rOEFWOfYQQo99iT81vA5Vaeqaf3od3C4nj+D5gUcLS00tM+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768418670; c=relaxed/simple;
	bh=16m6OGEkzOjnm2bqobWqe3Ist2tjgZMzekkJVXD7Kvs=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=RelkIiLVBpcn1ezyJ5QAn5ju39iCCLKtTagLKfYdO7NIYkFXtWMifpvt0gd5QRHYVLrgklRZs4kbMMgqLR1HFkhtQqJbw/AZBBkSeOQdquQkocFO9coGhxwwrWUq5z9a+tg0NngYCXShjYZutrTOHjey+/+YqAdFgpHd8xZbh8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uabjth2s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16044C4CEF7;
	Wed, 14 Jan 2026 19:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768418670;
	bh=16m6OGEkzOjnm2bqobWqe3Ist2tjgZMzekkJVXD7Kvs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=uabjth2sOPnmSyUQf2oAHqDe5WUWNaoWX4sR7JItGz/DUKab0oeO8Dc/HQTO8HMiX
	 zRUiBLwbpjFrALAqcsipgSk6rCVTrNfwyvXOiDCNrD4KQ1VZt9UuLojyAx2G9ki9cL
	 QS+odqcofZjj7glF/W3Z79kGxTsHdFiX/uqJbLNLhCxwi50Xq2sc9+jhEy2aWd3vCC
	 4Oggcon6XEt3SizMI5h3xhBq1ZAO+3opOptfwfYLQpxMXc+nSoXVnnyYJSAcZcQHHI
	 1htQYkWZqm0Lm9vwzn8ZxcLE9Z0CdpKWffJav2q2pGAC7uOy/oVzP6w3NH7tOt+aDP
	 WxvdNEclH9Zqg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F2C853809A2A;
	Wed, 14 Jan 2026 19:21:03 +0000 (UTC)
Subject: Re: [GIT PULL for v6.19-rc6] media fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260114162034.0455f17b@foz.lan>
References: <20260114162034.0455f17b@foz.lan>
X-PR-Tracked-List-Id: <linux-media.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260114162034.0455f17b@foz.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git tags/media/v6.19-3
X-PR-Tracked-Commit-Id: 69d6c6fc79eb3a8309691250a3b0a9c1870c1f83
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d19954ee63b2211fcc14175d6cb07cbc040980d5
Message-Id: <176841846259.3293754.14809951986673173288.pr-tracker-bot@kernel.org>
Date: Wed, 14 Jan 2026 19:21:02 +0000
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 14 Jan 2026 16:20:34 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git tags/media/v6.19-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d19954ee63b2211fcc14175d6cb07cbc040980d5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

