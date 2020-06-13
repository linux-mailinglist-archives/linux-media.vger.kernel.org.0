Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 556091F851A
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2020 22:25:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726852AbgFMUZE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 Jun 2020 16:25:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:38222 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726845AbgFMUZE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 Jun 2020 16:25:04 -0400
Subject: Re: [GIT PULL for v5.8-rc1] media updates
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592079903;
        bh=BLDwn1Xpcwl2bf+fUx4xdiG5WEMgUHANMpDykFVLjR4=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=I2n81Pdv39WU2ig+PDcICLFpOfd5PG2sN3l9S9eEiptfX0KlgmPpw/SvA7MFvUVER
         Th/FIK5E9hRuDQISVjrZsgUrI1QnbBPgyQiXgGdFiU1qOGDQv5BH7BAwva2tme8l1U
         sEJph8PTMfvPSgiMS8+PWjwPVY+ZtD1rH/UHmMBM=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200613012615.31969e39@coco.lan>
References: <20200613012615.31969e39@coco.lan>
X-PR-Tracked-List-Id: <linux-media.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200613012615.31969e39@coco.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media
 tags/media/v5.8-2
X-PR-Tracked-Commit-Id: 2630e1bb0948c3134c6f22ad275ae27cc6023532
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ac911b316336ad3d22b09e82698f0463347a5507
Message-Id: <159207990357.31508.8045695379272610944.pr-tracker-bot@kernel.org>
Date:   Sat, 13 Jun 2020 20:25:03 +0000
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

The pull request you sent on Sat, 13 Jun 2020 01:26:15 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.8-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ac911b316336ad3d22b09e82698f0463347a5507

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
