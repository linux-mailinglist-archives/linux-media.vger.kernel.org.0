Return-Path: <linux-media+bounces-12778-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D269012F3
	for <lists+linux-media@lfdr.de>; Sat,  8 Jun 2024 19:19:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC8CF1C20DAF
	for <lists+linux-media@lfdr.de>; Sat,  8 Jun 2024 17:19:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2356B18040;
	Sat,  8 Jun 2024 17:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QC9IBE2y"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8107817548;
	Sat,  8 Jun 2024 17:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717867151; cv=none; b=Fkw2AUuIoRhO319bdrpqu/RCABg0rIM+Bnf5e4DRuChK10OoPL/F74JUCxYRJt4qEITxDWpgvqDvzIuGojZyMT+pEe1wRWFcGPo15dAhdmLJRxlJebfBqGFF72juWz9xTTkTAERHTeSZ8EmHz9rmtyd/w29LbG0CMk2nYh2ingI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717867151; c=relaxed/simple;
	bh=lsL/UK808G82EXe60L5jgxbqtB9r8qqN2OCM/Z/GmNc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=S+d+oIXWyafiwooUlLzuVAhgE+PEBhR8G1hAd3IX+mdUwwxhPmY6tISb/nOZYuK/Bk9gQMQQEioGxcrp6ikDg1Rp7vGT8rVbkjDV8oI/4wYSibTHURitklPzSjqnk8oTCmwOGGVKa8yg7udg9nnQAHSvbDnvHkdZBkZYO8BlKbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QC9IBE2y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61E91C32781;
	Sat,  8 Jun 2024 17:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717867151;
	bh=lsL/UK808G82EXe60L5jgxbqtB9r8qqN2OCM/Z/GmNc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=QC9IBE2ycOyspPKbqoDHJmMy/TmdyB5u5cWVm5uT3HqQXUBEdqX2swzXQ2/IJvOPh
	 NF9CbBcb45DsgOSBJZnh6nXJs7uar/J2oa+26Zc/7EqbJFe6nY8p601I6UX3HefJ3/
	 wYooH3a2hiNvmhUw8EOSvVxbc2o6fGBJ92q5j64EPvmkthzFEfn1+XGmmF0OAsi9po
	 5VQKSTZe9kGPh2jAGmcn7j8u4jXgHdES+JMy545dKMiytoWSTXpVvok1hAX71hW/lT
	 JUnAuNDN/bEJ4DASSfyNsN/PaY4Qv4o76+hPba+aBmk4Qpv2r3qmFdhZhY60GRqvlf
	 8EUlxLIr/GX8Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 58EC8C43168;
	Sat,  8 Jun 2024 17:19:11 +0000 (UTC)
Subject: Re: [GIT PULL for v6.10-rc3] media fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240608173628.05f15fbc@coco.lan>
References: <20240608173628.05f15fbc@coco.lan>
X-PR-Tracked-List-Id: <linux-media.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240608173628.05f15fbc@coco.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v6.10-2
X-PR-Tracked-Commit-Id: ffb9072bce200a4d004006e8b40c366933cf517b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1e7ccdd3255c9d146cc077d681c56e4559f90cda
Message-Id: <171786715135.12449.10718238683179978715.pr-tracker-bot@kernel.org>
Date: Sat, 08 Jun 2024 17:19:11 +0000
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 8 Jun 2024 17:36:28 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v6.10-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1e7ccdd3255c9d146cc077d681c56e4559f90cda

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

