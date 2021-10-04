Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C781421484
	for <lists+linux-media@lfdr.de>; Mon,  4 Oct 2021 18:56:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237741AbhJDQ5r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Oct 2021 12:57:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:58340 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237718AbhJDQ5p (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 Oct 2021 12:57:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 83BD7613D5;
        Mon,  4 Oct 2021 16:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633366556;
        bh=t2FGgy/ZmUcae32+QHqHrM+MJ8eOfljtdVyackkRL6k=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=aMNgWq6sVIckArpn1lQ9YOcXn5gAChBF8I+s2HY81nvV+JOM/SKBSygOCJXzNJ8kI
         bpVHfU/q0L0ohcwnrjKxdCYJIA/UMiD9CQDRfe4TD4mGESO/XIqeCAHoB+WJPKgjjn
         uZ0br3mulMKIlMXOYDKxpB/lNWtCNC6rrz7EJ2aWm3Mx+kAc1gLXjr1/CudeoWBAi3
         cNL/E8tMrJTbM3zVkWQbya6YeVckYa2cB1oWfsrPHOmV6Yfs46DFqzvb2Hn2bprgmu
         rxJnCW2GG2qX8nOfkOtgvCMj3o1r5w8Vmi7jasiwKS20jOXlS8KnwTjjizPeduBWad
         KuieimdtEKVlA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 7BD8C60971;
        Mon,  4 Oct 2021 16:55:56 +0000 (UTC)
Subject: Re: [GIT PULL for v5.15-rc5] media fixes
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20211004175922.39809118@coco.lan>
References: <20211004175922.39809118@coco.lan>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20211004175922.39809118@coco.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.15-3
X-PR-Tracked-Commit-Id: 206704a1fe0bcaaa036d3e90358bb168fac8bea1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 84b3e42564accd94c2680e3ba42717c32c8b5fc4
Message-Id: <163336655650.28831.1943845365861034110.pr-tracker-bot@kernel.org>
Date:   Mon, 04 Oct 2021 16:55:56 +0000
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The pull request you sent on Mon, 4 Oct 2021 17:59:22 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.15-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/84b3e42564accd94c2680e3ba42717c32c8b5fc4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
