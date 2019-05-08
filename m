Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDAF417FD7
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2019 20:35:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728819AbfEHSaD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 May 2019 14:30:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:57964 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727949AbfEHSaD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 8 May 2019 14:30:03 -0400
Subject: Re: [GIT PULL for v5.2-rc1] media updates
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557340202;
        bh=ce72i7I1sf4py8Vd+i1EY++R/vuNBInMPCLdGth8jiI=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=tF23ACNpazUiEcJfUDtEPGseNqlcH4Y355xuq53o1upKdhVULpRJZx9GUzhFjBJsZ
         t9ss2cRfi/KTe3QymnksVBStnM1kCiXAvOX7iQt0EtyUIaN5jlwmTVZxet5Nm3KiN1
         1UYqG9Qn4pYMhGfqUr6RDv4JvZKJGu3NaBSO+7lg=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190508144509.1cc8c7d5@coco.lan>
References: <20190508144509.1cc8c7d5@coco.lan>
X-PR-Tracked-List-Id: <linux-media.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190508144509.1cc8c7d5@coco.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media
 tags/media/v5.1-2
X-PR-Tracked-Commit-Id: 0d672fffb447aa1699d76fdacd90dc31eeb66d97
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e7a1414f9dc3498c4c35b9ca266d539e8bccab53
Message-Id: <155734020263.8790.11824833939954842946.pr-tracker-bot@kernel.org>
Date:   Wed, 08 May 2019 18:30:02 +0000
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The pull request you sent on Wed, 8 May 2019 14:45:56 -0300:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.1-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e7a1414f9dc3498c4c35b9ca266d539e8bccab53

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
