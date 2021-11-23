Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A529045AEDA
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 23:05:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239554AbhKWWI2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 17:08:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:33870 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239700AbhKWWI1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 17:08:27 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id E671460F50;
        Tue, 23 Nov 2021 22:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637705118;
        bh=7v0zn67JUySx81lCE8X16F0X/D6dm+yNpg5fWOhj1KQ=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=qKhwcRjL4uCP1I2SZNjkwMNM6kJh/w9+QWCfbg839Hx7jHCSpGH4vw0yb+fjJRYJb
         IkSARCWKb1VV6CJy4gHcmJgCi5UEnMHb2iK+N4BQMhwvAM8IvSxiKSKkBnJwJELcUZ
         I16QH+wFyrSMfsViQu2H7FlLMikidz1DxLeTHqrNMb5jwX0geeh9io85ZBHiaWCY4J
         0v2n6r7W0MuindgGYH1CoNnbMTh3Pyxcb4WkDUDvFdmvUXkweho2gsMofUxHf4ECrn
         +RZtV1C90zZHowJDSkhPHhOltrCc/WyMZLw4pXbdDF/cla6LEF6vtaeAjQTV1sA4IB
         N3XfsglskkirQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id DF06D609BB;
        Tue, 23 Nov 2021 22:05:18 +0000 (UTC)
Subject: Re: [GIT PULL for v5.16-rc3] media fixes
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20211122072743.4caac49f@sal.lan>
References: <20211122072743.4caac49f@sal.lan>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20211122072743.4caac49f@sal.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.16-2
X-PR-Tracked-Commit-Id: 62456590b84965ad8d633dbd8f8c75fcf1e765d6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c7756f3a327daa53a80ebcc9d9a54c562382ddb0
Message-Id: <163770511890.14610.11406817858126938338.pr-tracker-bot@kernel.org>
Date:   Tue, 23 Nov 2021 22:05:18 +0000
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The pull request you sent on Mon, 22 Nov 2021 07:27:43 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.16-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c7756f3a327daa53a80ebcc9d9a54c562382ddb0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
