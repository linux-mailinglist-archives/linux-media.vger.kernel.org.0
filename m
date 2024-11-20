Return-Path: <linux-media+bounces-21698-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F6D9D4431
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 00:01:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 31921B242C2
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 23:01:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16F361CB512;
	Wed, 20 Nov 2024 22:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e8FOyMKi"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAA61CB33A;
	Wed, 20 Nov 2024 22:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732143371; cv=none; b=Xs7R2Pral38R4PDPJLkkwLgJ3tWrz/a7bxCx3WJQv/Gw4mSselr1lPy1qa6VJ+BFVhulloVP2pMop3TiKTir5McVpmh1sPeWib+Z56erLcTmhkHgwFYuleboHrmgmmTxsfizPZQOz83xkKL81sPOwzW7nLa/J5CKC4CiM18qhRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732143371; c=relaxed/simple;
	bh=0T3/k8Ia81Fo9B/OCdl3t2sun3bnbWaprhQ+2zGoIsQ=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=JAkp9dt2l1PoY4HDhtDIQfmPzQER8jp0yxLDChMc4qEc7YPybm2x7AmHcO7gvzGHhJp6wi/0WpbQkOFgn4mRtBMP/vV2232DakkYdh736bCz4ZJlK2Oervmps/3/5R/F/MoFgjvm98y1YIOjPxIkpBKVh5bbjiAnCKhpQHbXnRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e8FOyMKi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3E46C4CECD;
	Wed, 20 Nov 2024 22:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732143371;
	bh=0T3/k8Ia81Fo9B/OCdl3t2sun3bnbWaprhQ+2zGoIsQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=e8FOyMKiAl+d/5114nXGz0WvFn+F3MUgFXaxT6V9V/GkDnxCzgn1T6PtPjooxTtuv
	 kBjYhpkP8uw4sSq9uyDI5uq692a4Et+9tZK7BACa0mpTKE3bnuqwFs+1/zMiLNVbNp
	 54ZgId09/d/z7C4bLVcCCIDxJ96atZkowQ10PjOS34DgLfbw6dTrOgofWskTxOT5h2
	 mj/mfzEYuM7EDWb6PB/Eh9pvpxi3iCCw66i663Ltx8fmkhJ2dBTOSlJYEF/eMtLUA2
	 55rfOE62tD7gDm2WZizBV2luMyHG8qiWsLIiDekN/uZs80HJiXPe4SdX5nyn81W+Is
	 tkzORZgJsATGA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ECD383809A80;
	Wed, 20 Nov 2024 22:56:23 +0000 (UTC)
Subject: Re: [GIT PULL for v6.13-rc1] media updates
From: pr-tracker-bot@kernel.org
In-Reply-To: <20241119090407.645ee267@foz.lan>
References: <20241119090407.645ee267@foz.lan>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20241119090407.645ee267@foz.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v6.13-1
X-PR-Tracked-Commit-Id: 72ad4ff638047bbbdf3232178fea4bec1f429319
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9f5a6a1fe690a43896e0235377c7eb0b657c05a9
Message-Id: <173214338258.1377324.8142952632813352211.pr-tracker-bot@kernel.org>
Date: Wed, 20 Nov 2024 22:56:22 +0000
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 19 Nov 2024 09:04:07 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v6.13-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9f5a6a1fe690a43896e0235377c7eb0b657c05a9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

