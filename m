Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54C3B25C7CE
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 19:09:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728382AbgICRJS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Sep 2020 13:09:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:40802 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726025AbgICRJQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Sep 2020 13:09:16 -0400
Subject: Re: [GIT PULL for v5.9-rc4] media fixes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599152956;
        bh=P+RsvELJvNr8UTJVvX5eRzpUUExkoTW9eXLm+m9zaOk=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=RnpvY/pHjeQGaTo2j4yFmh6oLqQOpsai1Ut5aLHDkn76L83xmiKyjls6JJOFBmxU4
         xs3RZVuueTRFdtIhHlSPPXw5Qg4aKo0x8M/XFR9/PwSmiE35kTWufWUyGjNLxkHMPz
         jTcdsOC94sYxkfkupRaWILz00bKljzfUz/u4E7Io=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200903081057.78407ab4@coco.lan>
References: <20200903081057.78407ab4@coco.lan>
X-PR-Tracked-List-Id: <linux-media.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200903081057.78407ab4@coco.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.9-2
X-PR-Tracked-Commit-Id: ddecfc76979d5585847c76c4c489dcac389f86dd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0fdf68c767c08004ff3a2fc032a139bdaf7826c5
Message-Id: <159915295623.22690.8745849239871394024.pr-tracker-bot@kernel.org>
Date:   Thu, 03 Sep 2020 17:09:16 +0000
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

The pull request you sent on Thu, 3 Sep 2020 08:10:57 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.9-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0fdf68c767c08004ff3a2fc032a139bdaf7826c5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
