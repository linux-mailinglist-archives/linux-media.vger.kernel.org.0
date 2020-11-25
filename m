Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E81D72C47D3
	for <lists+linux-media@lfdr.de>; Wed, 25 Nov 2020 19:40:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733153AbgKYSjm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Nov 2020 13:39:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:56544 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730571AbgKYSjm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Nov 2020 13:39:42 -0500
Subject: Re: [GIT PULL for v5.10-rc6] media fixes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606329581;
        bh=MAGPxntnMU/EKtTTl2U3O4bwuxRu4TSyUH0s0ZBsBXw=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=mMJziSQeDt2Yn3DsutHy5o9ZMDKZu5UedRgq+Lmvkgjv0/F0orb985wJZSB3m4fT1
         ZUVo55F9KP+9s3fciIYyf6p0XObOnBvGAipWERFKGY9pA3eGNG7IpAvSziPAAfoD7Y
         6uOkvBhni3WxnjAWX6maJ+Vr/Db7r80hyIkWi+WQ=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20201125090758.131b3448@coco.lan>
References: <20201125090758.131b3448@coco.lan>
X-PR-Tracked-List-Id: <linux-media.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201125090758.131b3448@coco.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.10-2
X-PR-Tracked-Commit-Id: 9215f6bb4705ffe205885411394732bfc439dee0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fa02fcd94b0c8dff6cc65714510cf25ad194b90d
Message-Id: <160632958133.10461.9796798412159908529.pr-tracker-bot@kernel.org>
Date:   Wed, 25 Nov 2020 18:39:41 +0000
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The pull request you sent on Wed, 25 Nov 2020 09:07:58 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.10-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fa02fcd94b0c8dff6cc65714510cf25ad194b90d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
