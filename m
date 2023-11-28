Return-Path: <linux-media+bounces-1181-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFC67FAF81
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 02:27:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A46F1281B71
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 01:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 895C31848;
	Tue, 28 Nov 2023 01:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dyy1imTO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F937E9
	for <linux-media@vger.kernel.org>; Tue, 28 Nov 2023 01:26:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 51EFCC433C7;
	Tue, 28 Nov 2023 01:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701134817;
	bh=304OXdRp3q77PbuDSglYezsNDo3afMy2fuAaYHSgFIU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=dyy1imTO+Qo374XYNns7SMw+1yrw8plCJY11CrJsTr9SLP0P3nRe+NoTJkGBfhbkh
	 GK+gYj8Ff7+t863IkTftbHLdM0buKAXo+JzgO2rIPHOpQxfL9Zvo0M802RrZhattup
	 25LIg331+A/IGyVMVZjrbhuHLh6EOhm7AS/bGVawa/72GOBg2UE5dwW8SbPTaduNyM
	 9ATcZfIisUKNrmRK1qAit0oHplwccnma9mKnb6UtwhmJiwNZN98qmFarJZv0PC5miC
	 mMqMw0AEVgg+WPaQMj5jNFM5DKGhzam3siYV8si7S9rHF0/A1/AuLrKODD8DM0uXCg
	 Q41YIFyB6NYUA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 38013E00090;
	Tue, 28 Nov 2023 01:26:57 +0000 (UTC)
Subject: Re: [GIT PULL for v6.7-rc3] media fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <20231127181013.7fdc3484@coco.lan>
References: <20231127181013.7fdc3484@coco.lan>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20231127181013.7fdc3484@coco.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v6.7-2
X-PR-Tracked-Commit-Id: 32138be394e5d32c095a413949e6ab4875b2aec0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d095b18f3e22257ab5fb0d1eae76bf1c0f5260f8
Message-Id: <170113481721.2219.11433428833454711228.pr-tracker-bot@kernel.org>
Date: Tue, 28 Nov 2023 01:26:57 +0000
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 27 Nov 2023 18:10:13 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v6.7-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d095b18f3e22257ab5fb0d1eae76bf1c0f5260f8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

