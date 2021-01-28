Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8B01307DD0
	for <lists+linux-media@lfdr.de>; Thu, 28 Jan 2021 19:24:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231506AbhA1SWj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jan 2021 13:22:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:39188 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231905AbhA1SUT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jan 2021 13:20:19 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 8E06664E29;
        Thu, 28 Jan 2021 18:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611857815;
        bh=PDAovuOfP0s9+G0HFvE3PG9oQTQx00nDQVtwtDtqDSo=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=mcRKiIl9YptSkyx0PMdcdFs7wvw+3fI2wHQaotiWPCMsNtdcBBCrcJwlp6GtkpRbm
         6EpiYT2F9iBC0TMoHX4C2bP/cMMBss6SmSGfwQOIXUhURWBZ7BHbaMHsjlYWkRk6QP
         vZaan9iAZ+ySD295P98GdZZPacr2pCHNCOw6ORK0ax4pfE8c50wn8Ns7tK0Mnem+xX
         5xZ0oZrHa0qsT5wRoUTDNd6owEU8tQT2rbtFStJIHUgj5J29CsGZn3+Z0m2ng6K4uM
         MFNQbVREHE+ePBqksS3wYh7NLiKhNXxNqf3VA/VEQF2Djz43r9mFu6g2RL/lIrIERm
         fzm08Wp6xIHVQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 8773160077;
        Thu, 28 Jan 2021 18:16:55 +0000 (UTC)
Subject: Re: [GIT PULL for v5.11-rc6] media fixes
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210128112738.67242607@coco.lan>
References: <20210128112738.67242607@coco.lan>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210128112738.67242607@coco.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.11-2
X-PR-Tracked-Commit-Id: e081863ab48d9b2eee9e899cbd05752a2a30308d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fc856f1df788dc9ad13f154167ae0b442e167950
Message-Id: <161185781554.19532.6836191648682896864.pr-tracker-bot@kernel.org>
Date:   Thu, 28 Jan 2021 18:16:55 +0000
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The pull request you sent on Thu, 28 Jan 2021 11:27:38 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.11-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fc856f1df788dc9ad13f154167ae0b442e167950

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
