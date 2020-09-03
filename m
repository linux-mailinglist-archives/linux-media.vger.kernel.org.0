Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6242325BAE0
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 08:11:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbgICGLE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Sep 2020 02:11:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:57066 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725919AbgICGLD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Sep 2020 02:11:03 -0400
Received: from coco.lan (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 82A402071B;
        Thu,  3 Sep 2020 06:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599113461;
        bh=AoNDWiaX46RHuL3o4RWjdDlKYglSmqkLNJvG9tqeoIM=;
        h=Date:From:To:Cc:Subject:From;
        b=Je3ll81MQIYbMKkZjtOdeDzQ4VRVUExQMyts/pRqsnOR9Yg8+I8QeoaKMqjBD6lLu
         ZpnYixSBYbN0yPmhGD+m8NczG+mr9f9JRLsOaH8n2e+OU2dSljQ0LCtpR0Mcw4KVWJ
         PoNxVMIsq2eDN0ranYal4PZLe+QYCkxf6Vz4UuAo=
Date:   Thu, 3 Sep 2020 08:10:57 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v5.9-rc4] media fixes
Message-ID: <20200903081057.78407ab4@coco.lan>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Linus,

Please pull from:
  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.9-2

For:

- a compilation fix issue with ti-vpe on arm 32 bits;
- two Kconfig fixes for imx214 and max9286 drivers;
- a kernel information leak at v4l2-core on time32 compat ioctls;
- some fixes at rc core unbind logic;
- a fix at mceusb driver for it to not use GFP_ATOMIC;
- fixes at cedrus and vicodec drivers at the control handling logic;
- a fix at gpio-ir-tx to avoid disabling interruts on a spinlock.

Thanks!
Mauro

The following changes since commit d012a7190fc1fd72ed48911e77ca97ba4521bccd:

  Linux 5.9-rc2 (2020-08-23 14:08:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.9-2

for you to fetch changes up to ddecfc76979d5585847c76c4c489dcac389f86dd:

  media: mceusb: Avoid GFP_ATOMIC where it is not needed (2020-08-28 14:06:36 +0200)

----------------------------------------------------------------
media fixes for v5.9-rc4

----------------------------------------------------------------
Christophe JAILLET (1):
      media: mceusb: Avoid GFP_ATOMIC where it is not needed

Ezequiel Garcia (1):
      media: cedrus: Add missing v4l2_ctrl_request_hdl_put()

Hans Verkuil (1):
      media: vicodec: add missing v4l2_ctrl_request_hdl_put()

Jacopo Mondi (1):
      media: i2c: imx214: select V4L2_FWNODE

Laurent Pinchart (1):
      media: ti-vpe: cal: Fix compilation on 32-bit ARM

Peilin Ye (1):
      media: media/v4l2-core: Fix kernel-infoleak in video_put_user()

Sakari Ailus (1):
      media: max9286: Depend on OF_GPIO

Sean Young (3):
      media: rc: uevent sysfs file races with rc_unregister_device()
      media: rc: do not access device via sysfs after rc_unregister_device()
      media: gpio-ir-tx: spinlock is not needed to disable interrupts

 drivers/media/i2c/Kconfig                         |  4 +-
 drivers/media/platform/ti-vpe/cal.h               |  2 +-
 drivers/media/rc/gpio-ir-tx.c                     | 16 +++-----
 drivers/media/rc/mceusb.c                         |  2 +-
 drivers/media/rc/rc-main.c                        | 44 ++++++++++++--------
 drivers/media/test-drivers/vicodec/vicodec-core.c |  1 +
 drivers/media/v4l2-core/v4l2-ioctl.c              | 50 ++++++++++++-----------
 drivers/staging/media/sunxi/cedrus/cedrus.c       |  7 +++-
 8 files changed, 71 insertions(+), 55 deletions(-)

