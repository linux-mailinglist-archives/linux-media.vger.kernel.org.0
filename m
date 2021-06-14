Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B3703A6151
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 12:44:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233843AbhFNKqN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 06:46:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:50316 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233563AbhFNKnz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 06:43:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 123DF613FF;
        Mon, 14 Jun 2021 10:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623666967;
        bh=JPZ5zj3IxD3FR5sU3ObVpGn5WX3fiepB/VsQBEhqAYk=;
        h=From:To:Cc:Subject:Date:From;
        b=Xizi1Cfi7uzc+y8ytgZAVcH2DMxZ4vsuIfZG43hqDIPabjS6HSXVyDvBVXXg6wzHv
         O2YOuGTurGxte+isxXYsj4j8348mQ3xmVJDyJIGwfLZijHFFMjej9MtZsBAJe9R2kL
         88dHpVPUS110dDyHuJ0FYLd17haxpSmjGF+73n7tnfAxMcO0KMDk/EygWpR/5irOAM
         rjkrbKjrB+g3jFuym8dvBZLFYKtK0XT4oJEuR9vkEOci2GCLv2B8f8w0loGw//z8O8
         kCN3BFVgRq245aaToXfsUpB9exojN64K7k057UyZuyIXQOQfDCoi3jpyS8HjzKWiaQ
         OQphDq5rokEdg==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        Liu Shixin <liushixin2@huawei.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH v3 0/7] media: v4l2: compat ioctl fixes
Date:   Mon, 14 Jun 2021 12:34:01 +0200
Message-Id: <20210614103409.3154127-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

There was a report from Syzbot a while ago that I tried fixed earlier,
but my fix did not get picked up because of a merge conflict with
another patch I had in my tree.

I finally managed to take a close enough look at the merge conflict
to figure out that the subdev driver handling for VIDIOC_DQEVENT_TIME32
was wrong in all combinations of the patches and just needs to be
removed. In the process I also came across a couple of other issues,
so the series has now grown to seven patches.

I have done randconfig build testing and found no compile time issues,
but the driver specific patches have not been tested so far.

        Arnd

Link: https://patchwork.linuxtv.org/project/linux-media/patch/20210318134334.2933141-1-arnd@kernel.org/
Link: https://patchwork.linuxtv.org/project/linux-media/list/?series=5655

Arnd Bergmann (8):
  media: v4l2-core: ignore native time32 ioctls on 64-bit
  media: v4l2-core: explicitly clear ioctl input data
  media: v4l2-core: fix whitespace damage in video_get_user()
  media: subdev: remove VIDIOC_DQEVENT_TIME32 handling
  media: v4l2-core: return -ENODEV from ioctl when not registered
  media: atomisp: remove compat_ioctl32 code
  media: subdev: fix compat_ioctl32
  media: subdev: disallow ioctl for saa6588/davinci

 drivers/media/i2c/adv7842.c                   |    3 +
 drivers/media/i2c/saa6588.c                   |    4 +-
 drivers/media/pci/bt8xx/bttv-driver.c         |    6 +-
 drivers/media/pci/saa7134/saa7134-video.c     |    6 +-
 drivers/media/platform/davinci/vpbe_display.c |    2 +-
 drivers/media/platform/davinci/vpbe_venc.c    |    6 +-
 drivers/media/radio/si4713/si4713.c           |    3 +
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c |    3 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   32 +-
 drivers/media/v4l2-core/v4l2-subdev.c         |   43 +-
 drivers/staging/media/atomisp/Makefile        |    1 -
 drivers/staging/media/atomisp/TODO            |    5 +
 .../atomisp/pci/atomisp_compat_ioctl32.c      | 1202 -----------------
 .../staging/media/atomisp/pci/atomisp_fops.c  |    8 +-
 include/media/v4l2-subdev.h                   |    7 +-
 15 files changed, 66 insertions(+), 1265 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c

-- 
2.29.2

Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Eduardo Valentin <edubezval@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Cc: Liu Shixin <liushixin2@huawei.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: linux-staging@lists.linux.dev


