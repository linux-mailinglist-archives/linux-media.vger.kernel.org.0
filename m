Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8129442592
	for <lists+linux-media@lfdr.de>; Tue,  2 Nov 2021 03:20:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229458AbhKBCWm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 22:22:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:37820 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229970AbhKBCWj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Nov 2021 22:22:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 40F2360F24;
        Tue,  2 Nov 2021 02:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635819605;
        bh=lxzgJBAqLH2Jd+y2P3ZotgHm0zEVnVBrrz36bCLtcYo=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=HK0NvRJqgUTVbS2ePFSjbKGA4BxQ2httddDHNnlTnxVJ/f2RmK0bra6BvvGq/tTdO
         ch7yU4c2rN/Y/7j9CryBAsOBc2gytGj7PTPkO9gCP0W9T7EH8NJCGWpLa1SZxHkfDA
         saHb13NwlS4CkezJ6bdxOoR3Z1wkkv829AmQJbWLdW8B8K9YVRU2B+bMrJqVFgh5rm
         5ZbUCMypvtadzXyNz7SY7l/JYs8T94nbD7s5yisj5vlnO6wjRagwQm0OqIhX3JeKER
         PsaN8irQiCrVMowpdxrM6hjBDzcz062OG3TC3lsHddmPg5uUrtja1H8qBbGr4RXdsJ
         uM6mMh8Be5z3A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 31B7C60A90;
        Tue,  2 Nov 2021 02:20:05 +0000 (UTC)
Subject: Re: [GIT PULL for v5.16-rc1] media updates
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20211101085616.023abb03@sal.lan>
References: <20211101085616.023abb03@sal.lan>
X-PR-Tracked-List-Id: <linux-media.vger.kernel.org>
X-PR-Tracked-Message-Id: <20211101085616.023abb03@sal.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.16-1
X-PR-Tracked-Commit-Id: 57c3b9f55ba875a6f6295fa59f0bdc0a01c544f8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 73d21a3579818aa0e39de207474a39ca35c7d8cb
Message-Id: <163581960518.22843.19463459879137606.pr-tracker-bot@kernel.org>
Date:   Tue, 02 Nov 2021 02:20:05 +0000
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The pull request you sent on Mon, 1 Nov 2021 08:56:16 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.16-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/73d21a3579818aa0e39de207474a39ca35c7d8cb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
