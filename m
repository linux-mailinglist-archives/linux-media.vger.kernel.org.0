Return-Path: <linux-media+bounces-3658-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6BE82C7F8
	for <lists+linux-media@lfdr.de>; Sat, 13 Jan 2024 00:26:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65FB91F211E3
	for <lists+linux-media@lfdr.de>; Fri, 12 Jan 2024 23:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 839401B29B;
	Fri, 12 Jan 2024 23:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qA/kQpCo"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEC71A5B3;
	Fri, 12 Jan 2024 23:25:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 67777C43394;
	Fri, 12 Jan 2024 23:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705101944;
	bh=gQhzNADGkH7AHeVofN2P0uvbF/kkE65Vrgk1xi5IKoI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=qA/kQpCovXiyNrZkJcRrIWEd8mRslafLr4iHha9D7mV9rH3//+PKteQYgFbdj/HP4
	 iMMk2h6LDEPRky8HxzcpMpabIJ7oy5zdRmZFUclY88YUpLkmfx9JSJgiYvZ+GRomqv
	 T+4StPUgthwPC24Co3Y4lCWy9QuFoIAsNuuu48/lFZZZlgvn7bXISnHC8sRdbvMkuR
	 YlgEDevgAWT3pcU6qyl/kVIEX8DsSUHlraMoUenKyTWVfQ/6MpNiGSMN5+t+Pjrzt4
	 xD8puErokVZ9EahYZFt2SVxa0R8V6OuFpM5ck7cmQ9UXGRGD78Wn6BwdGjY+2M0SXi
	 HM4ynoK0rNZ3Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4F77FD8C96D;
	Fri, 12 Jan 2024 23:25:44 +0000 (UTC)
Subject: Re: [GIT PULL for v6.8-rc1] media updates
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240112135026.41496764@coco.lan>
References: <20240112135026.41496764@coco.lan>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240112135026.41496764@coco.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v6.8-2
X-PR-Tracked-Commit-Id: 60a031b64984ad4a219a13b0fe912746b586bb9b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 61da593f4458f25c59f65cfd9ba1bda570db5db7
Message-Id: <170510194432.16457.12622172493138026199.pr-tracker-bot@kernel.org>
Date: Fri, 12 Jan 2024 23:25:44 +0000
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 12 Jan 2024 13:50:26 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v6.8-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/61da593f4458f25c59f65cfd9ba1bda570db5db7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

