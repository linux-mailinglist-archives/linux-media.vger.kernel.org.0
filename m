Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1858936DE59
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 19:33:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241666AbhD1Rel (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 13:34:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:50490 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241617AbhD1Rel (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 13:34:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id C3210613DC;
        Wed, 28 Apr 2021 17:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619631235;
        bh=cgZ28y9PIH6S6CUiJaIgJeGlCuhp34OxoQ4Ieggjsik=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=ZKqvDGYr637ZTMNnolfmDAfJCL0M3Wz9z3onJRHTMM11euKNkzwoHY9iKjJZ+SnjT
         dVNkDP6YWuQ+avnQnbgkDEcqGjqG5RB5a3/vyGlD++WnzjI885scXlTO8huluFN6ZB
         sr/NVTRwcm7/e71uzUj7eXHdPR3zm0IJZuXHwSeIwzreYvpOmm4pxPpvyIc/nP4rxS
         gmVQtsIavqZcjshxVqoocM6sgMPxTQSYc3P54J/XcaCeO/S/h4Ly4AcG1kLpbhCa03
         EcWx5HQDhVC2p59FUcW1hzVXHVbwHOdy041vt8BvNbabS/xU+KwL7HWcWSh7gjqL1Y
         THTTfKsbxRzvQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id AAAFC60A23;
        Wed, 28 Apr 2021 17:33:55 +0000 (UTC)
Subject: Re: [GIT PULL for v5.13-rc1] media updates
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210427133934.476f22ff@coco.lan>
References: <20210427133934.476f22ff@coco.lan>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210427133934.476f22ff@coco.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.13-1
X-PR-Tracked-Commit-Id: 0b276e470a4d43e1365d3eb53c608a3d208cabd4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3aa139aa9fdc138a84243dc49dc18d9b40e1c6e4
Message-Id: <161963123563.29190.9892332769359291383.pr-tracker-bot@kernel.org>
Date:   Wed, 28 Apr 2021 17:33:55 +0000
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The pull request you sent on Tue, 27 Apr 2021 13:39:34 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.13-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3aa139aa9fdc138a84243dc49dc18d9b40e1c6e4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
