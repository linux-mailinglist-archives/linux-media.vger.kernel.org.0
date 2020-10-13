Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0870D28D398
	for <lists+linux-media@lfdr.de>; Tue, 13 Oct 2020 20:24:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728376AbgJMSYH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Oct 2020 14:24:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:42776 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728299AbgJMSYG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Oct 2020 14:24:06 -0400
Subject: Re: [GIT PULL for v5.10-rc1] media updates
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602613446;
        bh=AcPO3cCvxT/5NUJyOxGGCNZ4tbbcPy55OPsij4ID/nE=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=vUP/8Ozf9y9C/kalrPKC+Tyd0VuIq0rhfBSCSjcchN4A1gZbSIjm0iy1fRoRLDEz/
         VM9hW5Yl7ULUWAQKnt4MK0BYe3EjECfetQ1U7S+Iatix3+o3LCnLrVDTfAr8frd98D
         O3IZSX+qFFGsurJ81FvZiL12jJQ+QOk1cdK6bCF0=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20201012134139.0d58f5d7@coco.lan>
References: <20201012134139.0d58f5d7@coco.lan>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201012134139.0d58f5d7@coco.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.10-1
X-PR-Tracked-Commit-Id: c386e0797d26a32e354daf4480c5d40165db66a1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fd5c32d80884268a381ed0e67cccef0b3d37750b
Message-Id: <160261344620.11865.15025987582449100316.pr-tracker-bot@kernel.org>
Date:   Tue, 13 Oct 2020 18:24:06 +0000
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The pull request you sent on Mon, 12 Oct 2020 13:41:39 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.10-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fd5c32d80884268a381ed0e67cccef0b3d37750b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
