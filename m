Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0E602C6D91
	for <lists+linux-media@lfdr.de>; Sat, 28 Nov 2020 00:20:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731432AbgK0XQ3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Nov 2020 18:16:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:39210 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731477AbgK0UF4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Nov 2020 15:05:56 -0500
Subject: Re: [GIT PULL for v5.10-rc6] vidtv driver fixes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606507556;
        bh=ZstlwIhuv5LJnnZQYGk/vR14JjuP/gzlwMo/2jMPr/4=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=gqVW2yIelgx706mqyRKYMN02leeufVUsVbtI2oj1W88Jk7WfV7nyZ92kHU+2alrcC
         3lwj3yLsOgqzcuSAPjUEEPD9IUUfbwaYZrIuwR/k1dxeOA3UUcIkfTeF27LOF9u8La
         zOlTs6x8PLN9Tmua41YyCBjLhW342YxS2pnBYWDE=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20201127134100.101be34e@coco.lan>
References: <20201127134100.101be34e@coco.lan>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201127134100.101be34e@coco.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.10-3
X-PR-Tracked-Commit-Id: 44f28934af141149959c4e6495bb60c1903bda32
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f594139d68ccdd64fe9c546b17189b298fa7ecd3
Message-Id: <160650755640.29509.3078438466389596455.pr-tracker-bot@kernel.org>
Date:   Fri, 27 Nov 2020 20:05:56 +0000
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The pull request you sent on Fri, 27 Nov 2020 13:41:00 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.10-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f594139d68ccdd64fe9c546b17189b298fa7ecd3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
