Return-Path: <linux-media+bounces-41201-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9632AB38883
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 19:24:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5138B3AA416
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 17:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EEC22D73BB;
	Wed, 27 Aug 2025 17:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h4kt2AVS"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A472D2386;
	Wed, 27 Aug 2025 17:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756315456; cv=none; b=GvFcVQj88Gb9dNKTSBaaQBOstR3SvCPUXXrn67oJXJpICHIPPo/onRtA9hY6E8m05itXIQK4BcLRc4oBKBVO/huPc7PEG6nS/QxtXtQn+RCPdPVLBKqLqoGVAYZq9vvi7OfHVIKTdN4gqPJU2uDu2J5fJCxc9y3MyELLdmdV/QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756315456; c=relaxed/simple;
	bh=TAyh4MeB7znA2ziTl6hgFkn0e0AT5eLo0+Xk1nz8pY8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=agNrQHKECM7WwnXABo7xatCdkRkqSuAQU5HYbK3aLTRNgNHsZyxVJ7YapB6FaBrBn5u2tsFDDJEnP6p5GROiZuHPYTFvn449KjwkH6sOPJcjmUo72XLsBYYARpmhT3Tfz31USUmndoUqIzIJVIekPNbH4nPXBQz6jvIlIwUVr3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h4kt2AVS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99B52C4CEEB;
	Wed, 27 Aug 2025 17:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756315456;
	bh=TAyh4MeB7znA2ziTl6hgFkn0e0AT5eLo0+Xk1nz8pY8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=h4kt2AVSurdAkeQK6rt4mfD2DTTUq09wkBkouyDizaNmDGVOd5MxvuLgLAbIs9jEK
	 0tRIsaIAzk/w+xhloUjU3ECpoZphiXOrpGQt8X7LbaMy6rG6/9DcoZxzotkfaOSwqa
	 aaN0cuRqTnHX6kwKDsjklkkVp3vN25hP3XesvooSbrDy0xSec/d6uE+pCZdsVZ4pkx
	 BesptcEP1snGhU0fuEKXQ1NrZ7OmxKU8mzcJChSA751Kl0SxEMrGvnoXV75DGyBqpM
	 TWZUiMDi8wooTv6q8GL0qTWi3b6sjU7sfV8e1fnIpJikGABCbTuQVwBSh1qyMMaE79
	 i2xlx7GD9EdOw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33DB1383BF76;
	Wed, 27 Aug 2025 17:24:25 +0000 (UTC)
Subject: Re: [GIT PULL for v6.17-rc4] media fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250827105749.32f7cc29@foz.lan>
References: <20250827105749.32f7cc29@foz.lan>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250827105749.32f7cc29@foz.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v6.17-2
X-PR-Tracked-Commit-Id: 6f6fbd9a0c5a75eee0618c1499cf73cc770b3f52
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 518b21ba139cefa2ee7f9fcf516fdc6743e8db68
Message-Id: <175631546378.782678.13817975298306925119.pr-tracker-bot@kernel.org>
Date: Wed, 27 Aug 2025 17:24:23 +0000
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 27 Aug 2025 10:57:49 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v6.17-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/518b21ba139cefa2ee7f9fcf516fdc6743e8db68

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

