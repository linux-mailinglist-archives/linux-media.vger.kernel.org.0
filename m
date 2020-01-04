Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E5D21303EE
	for <lists+linux-media@lfdr.de>; Sat,  4 Jan 2020 20:00:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726180AbgADTAD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 4 Jan 2020 14:00:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:49404 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726118AbgADTAD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 4 Jan 2020 14:00:03 -0500
Subject: Re: [GIT PULL for v5.5-rc5] media fixes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578164403;
        bh=5Ws4LssZ9+dp5uM3CdhpTdbhB2ITIkm912g4N/yIQS0=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=uh/Taa+vLTnz7PbdrPEcTlSl4/NX3wRYu27px1Vk4hX6QjJcCM+ttUAXAW1Mll3L0
         rsZggeDwL3nkffDLyXn7msealL+/EXrIEzrAWi3JeqC2yi3l2jhqrNghirweqhF1/I
         cEsxEfmKyqbAuuxzu4cUNRrbPuvxS7aw/AUnWpks=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200104085420.5fe6a671@kernel.org>
References: <20200104085420.5fe6a671@kernel.org>
X-PR-Tracked-List-Id: <linux-media.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200104085420.5fe6a671@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media
 tags/media/v5.5-3
X-PR-Tracked-Commit-Id: ce644cf3fa06504c2c71ab1b794160d54aaccbc0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 50978df311d85ebf7e6c46e02745315e1ce63d32
Message-Id: <157816440294.3477.6322579530661211686.pr-tracker-bot@kernel.org>
Date:   Sat, 04 Jan 2020 19:00:02 +0000
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

The pull request you sent on Sat, 4 Jan 2020 08:54:20 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.5-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/50978df311d85ebf7e6c46e02745315e1ce63d32

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
