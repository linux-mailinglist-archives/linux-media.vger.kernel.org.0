Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5332F337D16
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 19:59:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230039AbhCKS64 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 13:58:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:38234 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230150AbhCKS63 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 13:58:29 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 8193064FDD;
        Thu, 11 Mar 2021 18:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615489108;
        bh=ZrLRqUQVoLnUXxFJmQdlU7XTa7W2Je9Yu2kwxIicEkE=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=K7/HI8fUM2W4mF9ur6a2IgOfFFpj9Kibd2919ZCUU/7rWJtwHQ2mKyKLNgTOEyOHm
         HgUjQOnNwf3KjlisyKWYPPrNc6HgmoZnq48XjAnu+001eR1W+Uf0Ii/tvXccVrT+O3
         K4WRw19kxItxdn45RsOGBQkjVhRQN2v8DimOAqcDb2fPme9H7HMFvI9tQZic0hUj+T
         RVAcQPwfmu+07bsfsIYhX2EmYXEv1YCjNKLRZQD9NUtGh98h3wQlhzVfN1Dlr93GEH
         lVAFhL3iKyCWcGXlQfe39XWR5ss6mNCVKxESwdm8eJUyJQO3ttinvOZXFYYO82K68d
         X4pHjEHBxBcfQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 61383609CD;
        Thu, 11 Mar 2021 18:58:28 +0000 (UTC)
Subject: Re: Re: [GIT PULL for v5.12-rc3] media fixes
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210311114508.21f48415@coco.lan>
References: <20210311114508.21f48415@coco.lan>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210311114508.21f48415@coco.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.12-2
X-PR-Tracked-Commit-Id: 2025a48cfd92d541c5ee47deee97f8a46d00c4ac
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 28806e4d9b97865b450d72156e9ad229f2067f0b
Message-Id: <161548910833.14335.5542221036743447418.pr-tracker-bot@kernel.org>
Date:   Thu, 11 Mar 2021 18:58:28 +0000
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The pull request you sent on Thu, 11 Mar 2021 11:45:08 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.12-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/28806e4d9b97865b450d72156e9ad229f2067f0b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
