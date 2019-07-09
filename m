Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8F1D63A8A
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2019 20:06:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727317AbfGISFD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Jul 2019 14:05:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:36180 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727305AbfGISFD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Jul 2019 14:05:03 -0400
Subject: Re: [GIT PULL for v5.3-rc1] media updates
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562695502;
        bh=tQLIkCVsL/J5QqNbdtb5HHhnVyuLo2ONICaIVpCZ1LE=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=lNUx5ElQxidJzgtme7oyS3OcJFt/yi19y1gXDFzOBO8/woy32nhGOWaySBtjFPKXH
         UMgau/fWLllIiMsI3Ejel6Z27dNbfxB4KqvRUl5Ttvvwx4A+fPzuNqzfiDOJ2Lxzan
         egmLDAV+wVClwyy9biDf3N2JvPYlzM9r6sBkbE+A=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190709081735.3d642186@coco.lan>
References: <20190709081735.3d642186@coco.lan>
X-PR-Tracked-List-Id: <linux-media.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190709081735.3d642186@coco.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media
 tags/media/v5.3-1
X-PR-Tracked-Commit-Id: f81cbfc4f82a75ca0a2dc181a9c93b88f0e6509d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ed63b9c873601ca113da5c7b1745e3946493e9f3
Message-Id: <156269550241.14383.417129534534296641.pr-tracker-bot@kernel.org>
Date:   Tue, 09 Jul 2019 18:05:02 +0000
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

The pull request you sent on Tue, 9 Jul 2019 08:17:35 -0300:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.3-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ed63b9c873601ca113da5c7b1745e3946493e9f3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
