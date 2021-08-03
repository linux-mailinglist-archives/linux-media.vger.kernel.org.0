Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7CDD3DF326
	for <lists+linux-media@lfdr.de>; Tue,  3 Aug 2021 18:49:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237269AbhHCQt4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Aug 2021 12:49:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:60910 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232300AbhHCQtz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Aug 2021 12:49:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 49C3D60F9C;
        Tue,  3 Aug 2021 16:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628009384;
        bh=I59D1WXpsTeYMRAdjFf1mymYoJTJuTvkw4/cgkIS42E=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=bKx0qhlyxUoYu6b0BlE+SIOQCz2vzBftO/oXjJCF1lWpaW/0b4y6nZj3ALoN9R/pC
         jVzhy+NbbSId0QlBEF0EqbGSC8mCw+GSxGhCyDHtIVMIcgJE0u4qHU8G0Sa++GNrvh
         kYgzitbXAYn5+tl4FeQX/iX7WUbtLruMw0h5hEbDnQYN3wkes7vXe1uloCHcbyHHEl
         N8POfMv/RePYNmC7X1WyHXRyjvBAWxYqwnlpjYJZksfqapnw4JOQ5aiioURx3/lQmw
         8TblvP1FXQOxXKqjEQhuNI+Fo/wT6b30YZz6hhXrUTUQnkCQW3SKRGO5q0LP7MUn4D
         Cvya/GH2BBUiw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 38D5260A44;
        Tue,  3 Aug 2021 16:49:44 +0000 (UTC)
Subject: Re: [GIT PULL for v5.14-rc5] media fixes
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210803111840.1127af2f@coco.lan>
References: <20210803111840.1127af2f@coco.lan>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210803111840.1127af2f@coco.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.14-2
X-PR-Tracked-Commit-Id: f1de1c7803595e937ce9b922807f499851225021
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d5ad8ec3cfb56a017de6a784835666475b4be349
Message-Id: <162800938422.17675.17977173972763765614.pr-tracker-bot@kernel.org>
Date:   Tue, 03 Aug 2021 16:49:44 +0000
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The pull request you sent on Tue, 3 Aug 2021 11:18:40 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.14-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d5ad8ec3cfb56a017de6a784835666475b4be349

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
