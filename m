Return-Path: <linux-media+bounces-15099-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0E29345FB
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2024 04:04:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29F801C21E30
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2024 02:04:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 116446138;
	Thu, 18 Jul 2024 02:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KcaHoHu1"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711E02868D;
	Thu, 18 Jul 2024 02:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721268245; cv=none; b=eItmtWa6mvvP++nN+kLNpWuj2JlZ+2ErrPRRuZo6lyMi4RKvDmPcl9vr9X82zhF9KMjs6xmW74mnqFV5+qIUGCLf6ZzT9pDx/3OExPnFkGt3O/qXNSq58Y9l0PkQraKGTZaPusjGQYM21zpWW+C6RcElte+Sb431yjn2Ksj+HY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721268245; c=relaxed/simple;
	bh=celzUWj3zyyvsEWZS5jRvH20ZxWVD9hVwY+V+gBb9EI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ORuF4w2HtQR5RAGV+bI5teh1C9UveQLvyL6+UsFrtXrQJx8NgN7rUGL7qTIKWfpU0WmWxf+PVJJj2zOuuZ6vtqxXxolRDHgYm9GUuonw2KDnlsbtb5AbqKuvF4Sh8/gITdjoBxlcckbfU+VCe890SXfa2HjGUaJ+bpjnHrCS5AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KcaHoHu1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EF47AC2BD10;
	Thu, 18 Jul 2024 02:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721268245;
	bh=celzUWj3zyyvsEWZS5jRvH20ZxWVD9hVwY+V+gBb9EI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=KcaHoHu1x71bTv2+sqkLoDSUCjD+TB55elIWH5qmh5iHHajXdRTNPfURpKlfMVIZt
	 c2ExVfwJcrvWct/wQvqxR47s6d8YQtP7ZOlYPZIfk8LujW+6Juld00/xjnM3lDfEXW
	 PJJ6JvdA3H08RscYpK6QUf3O7un7CacDzaidfOsE7h68Dx+ycosA+wwIGkx0MvznXQ
	 8hR/8jRtiCUP/xrH/lGH/UiU1lFA1i55e9aHSfb90OO8rwby0AnI9biMDKmG/6aM+6
	 N+sVNbqB+Um065OfpB9kniBXCceApSljwGkVxEFhDUxGt79e2VDWfvUvPDjM0r85Sm
	 gL0+CVaGzD0Cg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E6CA7C4333C;
	Thu, 18 Jul 2024 02:04:04 +0000 (UTC)
Subject: Re: [GIT PULL for v6.11-rc1] media updates
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240717104227.23de2235@foz.lan>
References: <20240717104227.23de2235@foz.lan>
X-PR-Tracked-List-Id: <linux-media.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240717104227.23de2235@foz.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v6.11-1
X-PR-Tracked-Commit-Id: 68a72104cbcf38ad16500216e213fa4eb21c4be2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b1bc554e009e3aeed7e4cfd2e717c7a34a98c683
Message-Id: <172126824493.15681.6302360398394866995.pr-tracker-bot@kernel.org>
Date: Thu, 18 Jul 2024 02:04:04 +0000
To: Mauro Carvalho Chehab <maurochehab@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 17 Jul 2024 10:42:27 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v6.11-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b1bc554e009e3aeed7e4cfd2e717c7a34a98c683

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

