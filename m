Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 397073B6B65
	for <lists+linux-media@lfdr.de>; Tue, 29 Jun 2021 01:37:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234315AbhF1XjL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Jun 2021 19:39:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:47542 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234000AbhF1XjD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Jun 2021 19:39:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 454B761CBA;
        Mon, 28 Jun 2021 23:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624923393;
        bh=fTm/Ga16sxM06tMxxo7k/qsWdRUI4Rfg5V2tGr+4Hfc=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=hznhwHisCeZYoBFolAkYpGaY+/rFL3o2ew2srW6/UX3/oUQcDdQMMSOYHlm7c5aAM
         pjfR30oniZeaAsdUiGK8Kei0XLYaAI7OpbSXCkF90aH5PuBTpXeKA5fJ4KfUbskbyt
         Q0k/zX1SYh7sY4P27OApVMKd1INHNx6m8NqFvw2QAtgrHvxcC+8wcXVnNvui+tT9zh
         jfQGwvWPNuxtn8hiYAOcA/UMWLjF6/xrwI3QFZE8tEm+FfKErfV/OFSnm9p/Phx8jx
         MHNsH5Ls0atJ6OInhO+GhBHlCwXhg+UfuJg0LQoqNRJdB4kJk0tgNq2qae46skeK7g
         JaEfoboQzCbuQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 3E78360A3A;
        Mon, 28 Jun 2021 23:36:33 +0000 (UTC)
Subject: Re: [GIT PULL for v5.14-rc1] media updates
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210628153005.1416aadf@coco.lan>
References: <20210628153005.1416aadf@coco.lan>
X-PR-Tracked-List-Id: <linux-media.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210628153005.1416aadf@coco.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.14-1
X-PR-Tracked-Commit-Id: 61c6f04a988e420a1fc5e8e81cf9aebf142a7bd6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 31e798fd6f0ff0acdc49c1a358b581730936a09a
Message-Id: <162492339324.13806.16569462944224079268.pr-tracker-bot@kernel.org>
Date:   Mon, 28 Jun 2021 23:36:33 +0000
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The pull request you sent on Mon, 28 Jun 2021 15:30:05 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.14-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/31e798fd6f0ff0acdc49c1a358b581730936a09a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
