Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFB9D2D6620
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 20:16:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389170AbgLJTP3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 14:15:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:40506 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393360AbgLJTMw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 14:12:52 -0500
Subject: Re: [GIT PULL for v5.10] media fixes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607627531;
        bh=wETY/OrT64hjywCq01muu7aGkyTdKyv2NH19E/75MoQ=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=IZ5rioBG1uMOH4uf/u/srsIoOCCfO9DLyXszFxkwVG5xwPdcDNzLCr/ad69MlGb4B
         WX/7K5MtY5XIiPy2CKiFEsZ5L3D+GLVdp+hhrFkBWt2YHjs6r8boeLxC004IzzhT+Z
         vaJprrCzXqYBQXcwV6E1fsVLXV7Otw2iHIvezYIvtksiSd3t6NCKyjmVYJ53o5mzTj
         /9aaKPxWSyoe6DbgeXNY1xuFYj66hc5wy5xwkvtMy7T3QQjZnaHxzNkSHFojJD9Us4
         HkTAducIAEYsHKR75rSyBjAPpDjtjjm/Ej/81f67DZMYUcBJoC4cN6zMFFS+schqG3
         Pn1OeMz5uZH1g==
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20201210121818.2d5c0353@coco.lan>
References: <20201210121818.2d5c0353@coco.lan>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201210121818.2d5c0353@coco.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.10-4
X-PR-Tracked-Commit-Id: 3d1387b3b8f6cc1ccdbb5f0d7af24df02f4baef9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 40201575b731db6bde55c2f0daa930bbd9cfcb13
Message-Id: <160762753171.17187.12408678384075366074.pr-tracker-bot@kernel.org>
Date:   Thu, 10 Dec 2020 19:12:11 +0000
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The pull request you sent on Thu, 10 Dec 2020 12:18:18 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.10-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/40201575b731db6bde55c2f0daa930bbd9cfcb13

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
