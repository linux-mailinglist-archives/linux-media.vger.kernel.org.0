Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F43F6EEB08
	for <lists+linux-media@lfdr.de>; Wed, 26 Apr 2023 01:40:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236999AbjDYXk2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Apr 2023 19:40:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236573AbjDYXkU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Apr 2023 19:40:20 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D58E18E90;
        Tue, 25 Apr 2023 16:40:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3F94B63226;
        Tue, 25 Apr 2023 23:40:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0F44FC4339B;
        Tue, 25 Apr 2023 23:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682466005;
        bh=yDwXuW5UgMa9Q0v9GNn7yhV1yv+JJ89sxNBAP1VA4fg=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=Sg7sq14JifVJA3KcA5QRdxDAryb/DNkKXoKCnEIOCDG7klAfkDvXFNyDS8VHuV5fM
         iiEgvz2p2/xYVZFh5k7nCNLpdx48E9gZgOSMrO1K4LwZT87wPQaQlDiffFqprXJYwa
         KTmrnhpOpkHJSXZj3OUJcSrPWVpQr/X5ZP8aEM9JlKuXE+IIeHm0N4z4nQXHmDdXVP
         WRIgHYk6Hb8/BaCvfoXr4KWqm2JVsujOlwr0IBdDMD434pSGn8YVT3ThiYyA0oP443
         3uhlbUexGBPop61j5jP4k7eDT8GHlCrORpj3CH6HAVsEOLVCJ6LYbVIbumeSdeDNpg
         PB9MRZiKx7tzg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EBDC4E5FFC9;
        Tue, 25 Apr 2023 23:40:04 +0000 (UTC)
Subject: Re: [GIT PULL for v6.4-rc1] media updates
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20230425084238.5033de10@sal.lan>
References: <20230425084238.5033de10@sal.lan>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20230425084238.5033de10@sal.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v6.4-1
X-PR-Tracked-Commit-Id: 73b41dc51fbeffa4a216b20193274cfe92b5d95b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4ea956963f4fca59050a22fcc65f00a85d586e63
Message-Id: <168246600496.4872.6324170451111459189.pr-tracker-bot@kernel.org>
Date:   Tue, 25 Apr 2023 23:40:04 +0000
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The pull request you sent on Tue, 25 Apr 2023 08:42:45 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v6.4-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4ea956963f4fca59050a22fcc65f00a85d586e63

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
