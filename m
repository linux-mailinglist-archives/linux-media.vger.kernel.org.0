Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2E9A42B97
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 18:00:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440407AbfFLQAC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jun 2019 12:00:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:55094 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2440381AbfFLQAC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 12:00:02 -0400
Subject: Re: [GIT PULL for v5.2-rc1] media updates
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560355202;
        bh=1kX0SjKOuIugm8qKiYSM4LCHqGtJ2yMFlEstCcq37SM=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=s0bf2wtKuKOtk+E1UhbdJPrsglXmxPEy15dZbTBvBqL2OldIldrntVJyXtV7UT8Qd
         Q2/bnUvKHMdvRyJfi5dEVFU0BWksnHCI1pp/QgpKfXNPR5f4oA9HYBun1qAYn1R50h
         7hAOP/iniLe4ARe6cU8FkpoVhQlU2ui/XF/rpnpE=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190612125002.66e84492@coco.lan>
References: <20190612125002.66e84492@coco.lan>
X-PR-Tracked-List-Id: <linux-media.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190612125002.66e84492@coco.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media
 tags/media/v5.2-2
X-PR-Tracked-Commit-Id: a200c721956ca026f44416acccc8efcca41109c5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 35110e38e6c59b0db9618701d75c7c2a36f98d55
Message-Id: <156035520195.8444.11059520836448082611.pr-tracker-bot@kernel.org>
Date:   Wed, 12 Jun 2019 16:00:01 +0000
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The pull request you sent on Wed, 12 Jun 2019 12:50:02 -0300:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.2-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/35110e38e6c59b0db9618701d75c7c2a36f98d55

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
