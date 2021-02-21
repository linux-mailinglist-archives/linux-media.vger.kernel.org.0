Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 122C9320E62
	for <lists+linux-media@lfdr.de>; Sun, 21 Feb 2021 23:54:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231873AbhBUWxm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Feb 2021 17:53:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:53804 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231865AbhBUWxl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Feb 2021 17:53:41 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 3A52164DEC;
        Sun, 21 Feb 2021 22:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613947980;
        bh=CGADNtHbhBDuUr0477Sp2L8mirxsm6/naw33uCHrX64=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=bp8Dd+lpHY9i2x/o39qQTcvbd5Y4EF5dWMrkqWvJ6zigDCrk+pya8Jml9BFIpJcOo
         xvcR7pXPvM1Yb9rxWDfAvXlwoZPHCQ/RjNhqp7z20ESk5j93QITTZRL8gxlLVft0n2
         LTa5emMISgU7EAe5ID7AM8LJ+8p0A4TlTbOWm5Dc+MKnpQLQs0cm1fJDew/7vM4aEF
         1FSMJgFDReWgbn3arYrdUueDDZGEvPs5YlnyS3MumemEWzrufuZhGYcTG0Chp39aY3
         nGHrYXsQUf/iPm1O8m/LEwTkbOIvZNOlx/xiOtzAzMqBRHiuQsRcL/SsVLn5rb7HjT
         No8FQA8d3AA5g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 1C9AD60192;
        Sun, 21 Feb 2021 22:53:00 +0000 (UTC)
Subject: Re: [GIT PULL for v5.12-rc1] media updates
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210217154040.46145543@coco.lan>
References: <20210217154040.46145543@coco.lan>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210217154040.46145543@coco.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.12-1
X-PR-Tracked-Commit-Id: 8f202f8e9ff38e29694a4bc0a519b4e03c1726ee
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: de1617578849acab8e16c9ffdce39b91fb50639d
Message-Id: <161394798005.6686.9170511149935724108.pr-tracker-bot@kernel.org>
Date:   Sun, 21 Feb 2021 22:53:00 +0000
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The pull request you sent on Wed, 17 Feb 2021 15:40:40 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.12-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/de1617578849acab8e16c9ffdce39b91fb50639d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
