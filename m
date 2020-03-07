Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9DCB17CF90
	for <lists+linux-media@lfdr.de>; Sat,  7 Mar 2020 19:05:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726174AbgCGSFD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Mar 2020 13:05:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:45292 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726109AbgCGSFD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 7 Mar 2020 13:05:03 -0500
Subject: Re: [GIT PULL for v5.6-rc5] media fixes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583604303;
        bh=vvwwDdpv3nQtkvCvrDwLlLXQNOT4fNpEXD3e8CffGhE=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=JCKd37e/PuJ4JM0T1mg9Xdn+OLNVWU44+TW87FpUDa0dzmbXTzl2DTZ1V1jAvkvsc
         IlD1apJf77Pnh1U2TwrHxCAFLeRBu/25/YVTjqdr7f/ngg88yvSuf7CsSSFPly9tsW
         7gaDZPVWrXZ650+ANkTY/6mpQtZhIZcat33/QWp4=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200307153554.1411ffb3@coco.lan>
References: <20200307153554.1411ffb3@coco.lan>
X-PR-Tracked-List-Id: <linux-media.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200307153554.1411ffb3@coco.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media
 tags/media/v5.6-2
X-PR-Tracked-Commit-Id: d171c45da874e3858a83e6377e00280a507fe2f2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6f784a3179dce0d3e9ab5413766e2fd9631d3521
Message-Id: <158360430317.32058.8081754568219392801.pr-tracker-bot@kernel.org>
Date:   Sat, 07 Mar 2020 18:05:03 +0000
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

The pull request you sent on Sat, 7 Mar 2020 15:35:54 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.6-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6f784a3179dce0d3e9ab5413766e2fd9631d3521

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
