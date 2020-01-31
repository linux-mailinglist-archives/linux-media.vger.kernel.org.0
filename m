Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2965A14F511
	for <lists+linux-media@lfdr.de>; Sat,  1 Feb 2020 00:10:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727391AbgAaXKE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Jan 2020 18:10:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:46214 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727388AbgAaXKE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Jan 2020 18:10:04 -0500
Subject: Re: [GIT PULL for v5.6-rc1] media updates
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580512204;
        bh=/4lGO12f5eXg1wUlViSfevjuU3JmcgJpY4vIImfZNG8=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=0bVRPlipS1E4vCcBCcV8PtPYgWRzx+FD7bbOvFT5ZIXBVPYdprbKjU4vSeTuwvble
         KKwtxAz/S2BXImIgYrexMf6YAJWN3d3JXOWz72t82A58yAcUEs4lYokDLLo6AwkguX
         QACXRPTF/h53dMlO9jM0uBo7WdRN9zLMsp6eenO0=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200131164922.7b105df7@kernel.org>
References: <20200131164922.7b105df7@kernel.org>
X-PR-Tracked-List-Id: <linux-media.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200131164922.7b105df7@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media
 tags/media/v5.6-1
X-PR-Tracked-Commit-Id: 1697d98124819aab09b86602978bd4f50e101e2d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 846de71bedefb530461ee70ec82f7c810ef14e59
Message-Id: <158051220392.10603.11381217102247578315.pr-tracker-bot@kernel.org>
Date:   Fri, 31 Jan 2020 23:10:03 +0000
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The pull request you sent on Fri, 31 Jan 2020 16:49:22 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.6-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/846de71bedefb530461ee70ec82f7c810ef14e59

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
