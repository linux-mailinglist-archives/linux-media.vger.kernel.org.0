Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8EB52DA0DE
	for <lists+linux-media@lfdr.de>; Mon, 14 Dec 2020 20:53:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502801AbgLNTwN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Dec 2020 14:52:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:44232 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2502796AbgLNTwH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Dec 2020 14:52:07 -0500
Subject: Re: [GIT PULL for v5.11-rc1] media updates
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607975487;
        bh=EtT4RsJyy4qxZFqo+omxasdPx7GNeuLVlb3ymRqFKVg=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=Tg9PIDvh3pMvmuSXK3uBG5bgF9SNootcjci09WRY+zd0eP1pA+P8MLuU93m1f3ElL
         oFiBEhq3lAtaEz5nVQEX6+IgoTAFDxfGNOcJLcEwabkcGlJjhw7z6IZYhtnvgxpzOz
         iAgYQJeSjmdlf+O6Jr8nZfArALACh+2yZgT7oHz1yZv1dJAHfYrbLRj1XsrbyRrSPb
         92mVxpE4hmj2iIkXuFYRk/XnaInsigv+90xI+ICYAXpI9HyLMLM4ANWP0cvXH9ieQb
         cqbCxUG9+fWM5DEsGGb7uIkzsGEDBhD8a7IKud97d3Ugi6MXacq80n8aOGzkEuDOf3
         DxO9jTqshfAVA==
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20201214092132.63215862@coco.lan>
References: <20201214092132.63215862@coco.lan>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201214092132.63215862@coco.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.11-1
X-PR-Tracked-Commit-Id: 7ea4d23293300ca2f225595849a4fe444fb80ea4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fab0fca1da5cdc48be051715cd9787df04fdce3a
Message-Id: <160797548724.21325.11492920738092093664.pr-tracker-bot@kernel.org>
Date:   Mon, 14 Dec 2020 19:51:27 +0000
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The pull request you sent on Mon, 14 Dec 2020 09:21:32 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.11-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fab0fca1da5cdc48be051715cd9787df04fdce3a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
