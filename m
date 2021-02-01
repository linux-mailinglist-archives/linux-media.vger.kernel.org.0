Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA66130B052
	for <lists+linux-media@lfdr.de>; Mon,  1 Feb 2021 20:27:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbhBAT0O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Feb 2021 14:26:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:46462 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229567AbhBAT0N (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Feb 2021 14:26:13 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id B406564EAC;
        Mon,  1 Feb 2021 19:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612207532;
        bh=VBZMRXKUZsfHfRcpaf5VTalO1WVt69Z6lr60zCJMymA=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=MjI+R8Njc0x7RYcWdTTnPZhP9Ym7tvlb9sq2ohChRjYaFVzzqjbbpu5jwhAOv2BJ9
         7L4YvoHbNm7vFq/PfgLiQE0fysHf/dnwZcwtvldFOS9GDUZZ7TOvAEgVDCeuVIu3/b
         wpRVFp9ts0imXwm1T7ShvSFxa9HWGtNo1k20mRxrKYP0Ikx10W2GUaDf9mL6ZHR7cT
         cZDP1QpbV9oLdmJR1SCp8Embcl2giLyXzXadxmcody/ojmT681JokQxf/D7FV0C6v/
         QGT/nbKgb4npghCACS177TkMMA5aKTnInnJYXPseAEj++/k5Ut6Khl0OsvXxqHbL3+
         ZN3xCBRaceCBw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id A6F9C609D0;
        Mon,  1 Feb 2021 19:25:32 +0000 (UTC)
Subject: Re: [GIT PULL for v5.11-rc7] media fixes
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210201165609.21443571@coco.lan>
References: <20210201165609.21443571@coco.lan>
X-PR-Tracked-List-Id: <linux-media.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210201165609.21443571@coco.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.11-3
X-PR-Tracked-Commit-Id: ef357e02b6c420dc2d668ebf3165838c77358acd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 88bb507a74ea7d75fa49edd421eaa710a7d80598
Message-Id: <161220753261.14170.17715091054379190692.pr-tracker-bot@kernel.org>
Date:   Mon, 01 Feb 2021 19:25:32 +0000
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The pull request you sent on Mon, 1 Feb 2021 16:56:09 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.11-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/88bb507a74ea7d75fa49edd421eaa710a7d80598

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
