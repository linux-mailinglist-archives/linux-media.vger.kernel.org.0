Return-Path: <linux-media+bounces-14604-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CFF926732
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2024 19:32:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22A531C227A7
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2024 17:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD496185097;
	Wed,  3 Jul 2024 17:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mMuq6typ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26664442C;
	Wed,  3 Jul 2024 17:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720027921; cv=none; b=HzhyS/j8hc45W+AvkSYC43WQNydIV2OD9nquj8sJEuls63o+3wRtqrYihsiS8x3uqibor4Eyvu79ekaMCYW1Phme7l5jcMWSJ1NJjHrRMDsrcTWsL3rqif8T9uV3JBPuJ00AZuJDJ4O/ZvRPt1jGqkjvZwpht8BqL1G82XrfmjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720027921; c=relaxed/simple;
	bh=sYXHaX+15K59MMK0uVJfSI0yCKpmdQZEQxHcnj0FQYM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=UyLyH+B2RERoEkPNPhipAkNAGAB8rfkGIX9mOzBrpDYwZdDUJoyluj7LEJI4C4zwC5/gILvLgEHMO0PJB62ueIMfq1SFPmCS7EEUK+DjI9/nXUEMjxVJd/tt9mWxgg7gDH4GJp6ce9EhR2Y0hBDJdGu0u6O7rCJqkz/3znbqSZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mMuq6typ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 061D0C32781;
	Wed,  3 Jul 2024 17:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720027921;
	bh=sYXHaX+15K59MMK0uVJfSI0yCKpmdQZEQxHcnj0FQYM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=mMuq6typnK4D7ZDznR4MO7xdJVwD2W0c9iJ0uIgylBcpHyDj8+nYFLNsLrhMrT3f7
	 7dh4eYdI26TPSZ4uuKw70pv0jQXp/P1GZOA3uEPJvaafMvI1b528S1cQKux8QL+R4K
	 jDlH6rhNufZxPqq6BNufLTXI87nSNQa1YDSSbzEYvR2EbdamfnLdkXHBzdD7awEwDX
	 O4wUf0bipTB6CFhehlSVRrcGFhHF0vTyN409qLMYWJ+ALKUD4ksVk/1mq/MbvHXIFZ
	 71ATsbmCtwm4zFIXJP6NSPL688D9wgwmSoIF6L2KbA8XkQTick/VR+NnFiCK76eY1J
	 /YLulf8/9NIbg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E9238C43446;
	Wed,  3 Jul 2024 17:32:00 +0000 (UTC)
Subject: Re: [GIT PULL for v6.10-rc7] media fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240703082329.20b1bc37@coco.lan>
References: <20240703082329.20b1bc37@coco.lan>
X-PR-Tracked-List-Id: <linux-media.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240703082329.20b1bc37@coco.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v6.10-3
X-PR-Tracked-Commit-Id: fd404435d44b453d62afe77545b9252c2cc72c8a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4a0929b0062a6b04207a414be9be97eb22965bc1
Message-Id: <172002792094.9712.10706294622449045136.pr-tracker-bot@kernel.org>
Date: Wed, 03 Jul 2024 17:32:00 +0000
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 3 Jul 2024 08:23:29 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v6.10-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4a0929b0062a6b04207a414be9be97eb22965bc1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

