Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D481F88037
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2019 18:35:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437097AbfHIQfC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Aug 2019 12:35:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:50546 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726516AbfHIQfC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Aug 2019 12:35:02 -0400
Subject: Re: [GIT PULL for v5.3-rc4] media fixes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565368501;
        bh=fcr/iQNAZKpTtkt/hTq+CZ7aYyrm6waFfTWt9mt4fJI=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=nZmzLNVXlkEA3HYQUiOjX1OjheCZyPjxu7roe2OLPD6KqrbYg20lMeOewYIvBT58E
         CN+avF9V7YJ/emDfWJIdGuqOW6rI13MXWmWwn0pKI5Jh8jItATlcCOj2D2HGCQjNac
         MssjpIzfSM0yVdmvyEWpjyEdaUzwNfPfxZ1wZNsw=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190808123943.1551193d@coco.lan>
References: <20190808123943.1551193d@coco.lan>
X-PR-Tracked-List-Id: <linux-media.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190808123943.1551193d@coco.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media
 media/v5.3-2
X-PR-Tracked-Commit-Id: 92f5b0313e37e2b37aaf8f0bb75b6c50eafb5808
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6c02b6300fec062405ed0215e8ed1ed2b690da55
Message-Id: <156536850166.6429.12711568322533011086.pr-tracker-bot@kernel.org>
Date:   Fri, 09 Aug 2019 16:35:01 +0000
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

The pull request you sent on Thu, 8 Aug 2019 12:39:43 -0300:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media media/v5.3-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6c02b6300fec062405ed0215e8ed1ed2b690da55

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
