Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3E823A3642
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 23:44:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230374AbhFJVqs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 17:46:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:53862 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229941AbhFJVqs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 17:46:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C5305613CA;
        Thu, 10 Jun 2021 21:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623361491;
        bh=ZWd349hON24nbsKTW/zSfU0MgSTsBzl5Ei1e0dljQpc=;
        h=From:To:Cc:Subject:Date:From;
        b=XrdweSX5RuIhdapW4UDwutKy6U8reEUNfOVi/K8VoNtI3fANRcna+OwGH7p34Nyrw
         NaVpVIUt8XQcjci2sXuS9wh0dKC0IeqZNPV3eYIjesCmGhHWGhaFmSvgPUISHlu0V4
         auCaJDracLWjsVIzeo0l/a2sHqw9ramXcR8iMPOSOwmBIOnBRB5i3jjaL9IuFRb8HJ
         WdrsiBw4VWUp3nmahYkWApbvgkLWRaTMT+L0FR/7ZwvOP2vW7sBNb8JYSNb4zbcbC3
         v2y/GTQOjJz12hs/VPZh659Se9MXW9BLOaD+Gv81UBMISwY6cnjJ2tWhkWwyktPbFy
         U5iJcO7e51QLA==
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
Subject: [PATCH v2 0/7] media: v4l2: compat ioctl fixes
Date:   Thu, 10 Jun 2021 23:42:58 +0200
Message-Id: <20210610214305.4170835-1-arnd@kernel.org>
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

Arnd Bergmann (7):
  media: v4l2-core: ignore native time32 ioctls on 64-bit
  media: v4l2-core: explicitly clear ioctl input data
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
 drivers/media/v4l2-core/v4l2-ioctl.c          |   57 +-
 drivers/media/v4l2-core/v4l2-subdev.c         |   43 +-
 drivers/staging/media/atomisp/Makefile        |    1 -
 drivers/staging/media/atomisp/TODO            |    5 +
 .../atomisp/pci/atomisp_compat_ioctl32.c      | 1202 -----------------
 .../staging/media/atomisp/pci/atomisp_fops.c  |    8 +-
 include/media/v4l2-subdev.h                   |    7 +-
 15 files changed, 81 insertions(+), 1275 deletions(-)
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


