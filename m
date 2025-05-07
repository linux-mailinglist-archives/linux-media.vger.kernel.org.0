Return-Path: <linux-media+bounces-31976-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 12729AAE283
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 16:20:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70EC99C6B1B
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 14:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D63628C5D9;
	Wed,  7 May 2025 14:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UElt6Ea5"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5050288CB3;
	Wed,  7 May 2025 14:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746626634; cv=none; b=W7LrVhe0haTZkCK3FiyoePGpwaIESi7kfpezEJb6bDTQZ/At3XiZGsvMUBhoTqC9bV5lFCLunebDtBo88VgdTaiuwD+N3ActWXEFsdtnBKY4OYNpI/DomBTbW5LmBpgzEkpE0JzT/maYzfbtnmRM5vbbgvzTJi/MgwK33290fPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746626634; c=relaxed/simple;
	bh=6XsXebDpsjazR5speYQbXEo86c9N1sKVIft3y+kCwcw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=btiFEr4LIy6tmc1ZOb68+K4JHaDISqSeOLrOev/eDmCWmK5EoWxfNUX24mtP6qW9XEpbtynJoRicu6T5zNPo//YOhAn/oKCL4fcx5Hx6dfyEOkt/koI60eQuh80uz6LqymhgwP9wXiTENXf164BpvnoFISAidLgqgZ//L5TRBUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UElt6Ea5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2519AC4CEE2;
	Wed,  7 May 2025 14:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746626634;
	bh=6XsXebDpsjazR5speYQbXEo86c9N1sKVIft3y+kCwcw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=UElt6Ea5TW7faS7nCyrqstUNmxhW/Zl++JkdPSCwUj8jxQKuAza274lxYRot0TFNN
	 oZRxjtJxHOKuMse9Egd9tN5WSc6ZjMscDk+Hqjwwq6oFurKd/IgUzl44msOeuOT6m5
	 AuWRm/Gkzphg+SWO1ZS7DET0+8WE/fRdtQh8XlygxMjTNzoQcv/VJILg+p0JBMa7ku
	 +QIYzZ1vdjoDUyBMFvgbXhcYCO64PF4Ulagyqw3CRS/6/FJcvXywdgI9BNt/bMictT
	 W1lXN4RiNjB27wXqVtzSooSiguF1JmIwzpIOVM1hfxDwA3x2ZBxjubSCLDNh7g/qaF
	 3pbeda8qUDj9A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3416B380AA70;
	Wed,  7 May 2025 14:04:34 +0000 (UTC)
Subject: Re: [GIT PULL for v6.15-rc6] media fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250507110246.1cf54e65@foz.lan>
References: <20250507110246.1cf54e65@foz.lan>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250507110246.1cf54e65@foz.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v6.15-2
X-PR-Tracked-Commit-Id: d51adf038ebe59b592005166209b70218b1da849
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 707df3375124b51048233625a7e1c801e8c8a7fd
Message-Id: <174662667294.2242128.1591227197624092477.pr-tracker-bot@kernel.org>
Date: Wed, 07 May 2025 14:04:32 +0000
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 7 May 2025 11:02:46 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v6.15-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/707df3375124b51048233625a7e1c801e8c8a7fd

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

