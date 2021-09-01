Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A7473FE141
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 19:39:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344721AbhIARkO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 13:40:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:39074 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245390AbhIARkF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Sep 2021 13:40:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id C15BB6101B;
        Wed,  1 Sep 2021 17:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630517948;
        bh=nSohzaiG1ChUPwc4Y2kHM8jk6O9DZ8nBLdH8HgbRBac=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=NvtvqrSggcbB9JFAbElo5PAmKqpNUE2yZ/q1xo9zFh8l1/lmoe8PUgyobQUyfwKyT
         nxmvWXgmIh8dn+KSv52nESYDMC4MmgivH2tpP/RuZSQli6eY3Gc9ZtdlfyUkXy1+fq
         VhkAd2PKCYrSndhBV+mKKaPf0IVTHHuOwqYEU5GO95v1DCAjIL7r1ZdYSuSxEh/fLQ
         ZYfbkqzOXWsI16P775J8AJg+Yob6M3BWxj3vfmo3+I/FxcTmJBvwkHJYPeyBoYljro
         kQyTJMNnpZzC6Fo7P7zNjrQE9+WmhA6OJm8v8bkOtfW8bKyzVKGCIDrz9JCt2kUhlE
         fPsvSrXLI3KPQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id B75DD6098E;
        Wed,  1 Sep 2021 17:39:08 +0000 (UTC)
Subject: Re: [GIT PULL for v5.15-rc1] media updates
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210901094428.441b12c5@coco.lan>
References: <20210901094428.441b12c5@coco.lan>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210901094428.441b12c5@coco.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.15-1
X-PR-Tracked-Commit-Id: 9c3a0f285248899dfa81585bc5d5bc9ebdb8fead
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 835d31d319d9c8c4eb6cac074643360ba0ecab10
Message-Id: <163051794874.15355.5028945702046472160.pr-tracker-bot@kernel.org>
Date:   Wed, 01 Sep 2021 17:39:08 +0000
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The pull request you sent on Wed, 1 Sep 2021 09:44:28 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.15-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/835d31d319d9c8c4eb6cac074643360ba0ecab10

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
