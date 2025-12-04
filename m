Return-Path: <linux-media+bounces-48248-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3687CA510A
	for <lists+linux-media@lfdr.de>; Thu, 04 Dec 2025 20:07:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02DA731B63B7
	for <lists+linux-media@lfdr.de>; Thu,  4 Dec 2025 19:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AAB134250E;
	Thu,  4 Dec 2025 17:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IZp7Pcyt"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F089E34029C;
	Thu,  4 Dec 2025 17:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764869630; cv=none; b=LnC3Mm4+TfycceqWmZgVbpzGWZuHbozvD/nnLOZql7Ai+dbQfw3saRRTIsVJmOEI4dnTCtMVXIQ5VzxgIFELJRv0Qf9xtK1xPNkojfMmPBkmBORQ1Wdkhbqet2oA2aDbz6QdiwPQQLTfyFsBVpfNZ18MwNEsE9nOtFmuswVbxrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764869630; c=relaxed/simple;
	bh=AUFXJ9wxjogbeodiCZhoJLjXmFXl//RUeceqnFNKeUk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=En2xcIxfYRygBmMMbW6bEoz35JiytyUULKCnvPzYr6OxcXuSdUOI8xC3bgL56Vo76m0/1/4rD74W6G8a3kkKxc8aPMl6d4Vnb+xeZ9YiJIdOFLz4mH2l70GOm1LfNgq6bpt7NPRmkl0pHTCKD4I1mpQyXk+iNwvL554cjJ5LWT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IZp7Pcyt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 886D9C4CEFB;
	Thu,  4 Dec 2025 17:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764869629;
	bh=AUFXJ9wxjogbeodiCZhoJLjXmFXl//RUeceqnFNKeUk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=IZp7PcytMWt0XmLZJ7+a9HV+47iJji3LWYXH4DIQ8uGqjc8fxGtyLo3lED1eLKtgG
	 H1PxI5k4mT3XOIMAJndvjetvmuPsK83k01kQGC1a0in7a23+QINcfgHiSdi/QnSWsp
	 FvJ4+WmnkASuM94w+B2SXY5YwL8lUkTPfzcoL9XZ+hihG4ot9Sri/Ju+29pR3rjCUT
	 ZWDGcWNKXcN0dSL1wOHfSMDvhekfUaq0NKjHdV0RB5vFkhUfYtIAVIDt8tN+Mt0iGL
	 4LFATCSwVrnFHyTOJmztjLW8PI53p4w5cz/lmnbTa3Duvzg955Uoov0p7NbMqqTkcl
	 sT0xAHeDx24qA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F2DCD3AA9ABF;
	Thu,  4 Dec 2025 17:30:48 +0000 (UTC)
Subject: Re: [GIT PULL for v6.19] media updates
From: pr-tracker-bot@kernel.org
In-Reply-To: <20251201104226.2120e916@foz.lan>
References: <20251201104226.2120e916@foz.lan>
X-PR-Tracked-List-Id: <linux-media.vger.kernel.org>
X-PR-Tracked-Message-Id: <20251201104226.2120e916@foz.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v6.19-1
X-PR-Tracked-Commit-Id: 1f2353f5a1af995efbf7bea44341aa0d03460b28
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d7aa60d966461ca6114dc348e97889dc8850ff7f
Message-Id: <176486944782.869337.16749389767565129361.pr-tracker-bot@kernel.org>
Date: Thu, 04 Dec 2025 17:30:47 +0000
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 1 Dec 2025 10:42:26 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v6.19-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d7aa60d966461ca6114dc348e97889dc8850ff7f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

