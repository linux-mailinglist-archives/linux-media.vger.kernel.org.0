Return-Path: <linux-media+bounces-16356-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB7D953959
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2024 19:45:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05EEC282806
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2024 17:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B226413A268;
	Thu, 15 Aug 2024 17:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SH+k7gP9"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B1A5A7AA;
	Thu, 15 Aug 2024 17:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723743746; cv=none; b=sImeT24HHjB1IBKGacK5O9wkEexIlIki8W4ni5hgsoTPMiaPF7lSpuSnFWb9AKufG9oQTYpPucDt8OJHJQ5FvsK5O4HU8sCXqukgNnpWzMNkXtM0cwJMQFrvwbR4VKQ0/Qw8yOEUjFumw5wzw57T3o+Hj1Cr8FThJlPqkGa1jMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723743746; c=relaxed/simple;
	bh=UcQoz6i5kBlxXyfu9fb9C/t261IO3hTflxI0/+E5Z4k=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Ck0XVhck30pDxgvfcWSau36GWFZ9ZliuEM1cb/bcNVqpvQpBiNJIsfDjejajwMXYmewwdaJLwss3/ZqDygoZChTYN44L9G7i1F7I5pXlNZycijFs76cF1I6FFgxGL91V1G+CtEthAh58R+XTsDAwNvMOX7u/FRiiF1UOP3xvn5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SH+k7gP9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFEBCC32786;
	Thu, 15 Aug 2024 17:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723743746;
	bh=UcQoz6i5kBlxXyfu9fb9C/t261IO3hTflxI0/+E5Z4k=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=SH+k7gP9cOpDK+ZQnbMmtKBLTFKP2UWijiSPSM9z8CDtburgyMMIH2gOehjUm4klJ
	 5gU52naAoqYSEr2ki8uI0HH9gbk1pKRoJaujwI0ARev22U+CAdGuZVzdMwNLfK3N3C
	 NwNHsy3z3UmOt/SEvi1DdWNDdfH+l3vzY7RzCsi9YZzNrKQT/8rFHNEnqZFsH39ZZM
	 Sb0Ar3JNjaBmE+kfqxaFkvlEtZwZjj3SKjxHImzTwk/AkXnzWgBAZWjJu/HKCm/8VD
	 zvFUrmQcIVlxu9DWjxogxfbaTQcFwcdocornWs14UaSmqDC/QnRrFd1dXIU/g4pEuo
	 UgVeT6t0CbEdw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 714D3382327A;
	Thu, 15 Aug 2024 17:42:26 +0000 (UTC)
Subject: Re: [GIT PULL for v6.11-rc4] media fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240815170235.0ab77b44@foz.lan>
References: <20240815170235.0ab77b44@foz.lan>
X-PR-Tracked-List-Id: <linux-media.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240815170235.0ab77b44@foz.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v6.11-3
X-PR-Tracked-Commit-Id: 63de936b513f7a9ce559194d3269ac291f4f4662
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 20573d8e1c2801d6f0cc08d26003248fd118962b
Message-Id: <172374374500.2961867.3872919815048134773.pr-tracker-bot@kernel.org>
Date: Thu, 15 Aug 2024 17:42:25 +0000
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 15 Aug 2024 17:02:35 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v6.11-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/20573d8e1c2801d6f0cc08d26003248fd118962b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

