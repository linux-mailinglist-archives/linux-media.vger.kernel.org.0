Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21A29419FD9
	for <lists+linux-media@lfdr.de>; Mon, 27 Sep 2021 22:12:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236881AbhI0UNv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Sep 2021 16:13:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:32768 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236816AbhI0UNu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Sep 2021 16:13:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id B3D1460FED;
        Mon, 27 Sep 2021 20:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632773532;
        bh=tK8NxqHfIxDkFaAlObP2QjAXlASJ9DzcyvI/YrF5nIA=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=OR+NHJ9jScWIIb4SIPtVzrK+of7AlovyX/hRr7Uamht05krD28InRCC8j2b6uuFMb
         xrzT3SBXw1hzSwKkvtHcaYgOkFCTW1EyMWqNc2+p69MdH1mAUGzbcUfeq4jk2Pu8Hb
         VLrYccpKsOJJfFBK21MJGlW+87evD6QCfinKp5zyIGpxnTaZ9WW1xr2xC2469B9eKF
         zcu5nJUNr4fMoxka6io905jNbi9EgVt+6WeYRdoDYn3OYlkuy9qI4AD+WnBlDLhNgh
         MZVJgo7gJ03NvPhszS8Ttqmf7lvnaCg1UKZHBlT5teM70zlsOGdHV6xkB4oaDb8cIW
         lRZPqmPjkyjcw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 9E60460A3E;
        Mon, 27 Sep 2021 20:12:12 +0000 (UTC)
Subject: Re: [GIT PULL for v5.15-rc4] media fixes
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210927105350.31f688c7@coco.lan>
References: <20210927105350.31f688c7@coco.lan>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210927105350.31f688c7@coco.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.15-2
X-PR-Tracked-Commit-Id: f0c15b360fb65ee39849afe987c16eb3d0175d0d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e6609f2c07de03b948fd6c37c5eb4ade3a6d785c
Message-Id: <163277353259.24862.9642718105704301626.pr-tracker-bot@kernel.org>
Date:   Mon, 27 Sep 2021 20:12:12 +0000
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The pull request you sent on Mon, 27 Sep 2021 10:53:50 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.15-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e6609f2c07de03b948fd6c37c5eb4ade3a6d785c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
