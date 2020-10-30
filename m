Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 892882A0BDA
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 17:55:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727057AbgJ3Qzk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 12:55:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:60664 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726902AbgJ3Qzk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 12:55:40 -0400
Received: from localhost.localdomain (HSI-KBW-46-223-126-90.hsi.kabel-badenwuerttemberg.de [46.223.126.90])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EAED22075E;
        Fri, 30 Oct 2020 16:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604076939;
        bh=fbJgu8N7+CMSMQRM8erno00wsX4J3XXENIBb3YPbau0=;
        h=From:To:Cc:Subject:Date:From;
        b=OqsxjyUI4MwsxQaC/VueYp64UA6qK4/iak5n48lhLhiUwFMRdxIIdlxRsrZmVyI45
         LrEn4tkYYvU4bx0FCDLIpx5dCrGTVG/hnBWB/StkiARo9z1NctpsRb2ddBoif92UhP
         9ooGWGIEYkgPbrfMTfgoZelouTiVpYhYb1qWv06Y=
From:   Arnd Bergmann <arnd@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org,
        mchehab@kernel.org, hch@lst.de, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/8] media: v4l2: simplify compat ioctl handling
Date:   Fri, 30 Oct 2020 17:55:21 +0100
Message-Id: <20201030165529.1255175-1-arnd@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

I have a series to remove all uses of compat_alloc_user_space() and
copy_in_user() from the kernel, this is the part of it that involves
the v4l2 compat code.

The resulting code is significantly shorter and arguably more readable,
but I have not done any testing beyond compilation on it, so at the
minimum this first needs to pass the test suite for both native and
compat users space.

The first version had a number of bugs that Hans Verkuil managed to
fix, I have now rebased my series on top of linux-5.10-rc1 and included
his bugfixes.

This series and the remaining changes for removing compat_alloc_user_space
are available for further testing in

https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git compat-alloc-user-space-4

     Arnd

Arnd Bergmann (8):
  media: v4l2: prepare compat-ioctl rework
  media: v4l2: remove unneeded compat ioctl handlers
  media: v4l2: move v4l2_ext_controls conversion
  media: v4l2: move compat handling for v4l2_buffer
  media: v4l2: allocate v4l2_clip objects early
  media: v4l2: convert v4l2_format compat ioctls
  media: v4l2: remaining compat handlers
  media: v4l2: remove remaining compat_ioctl

 drivers/media/common/saa7146/saa7146_video.c  |    6 +-
 drivers/media/pci/bt8xx/bttv-driver.c         |    8 +-
 drivers/media/pci/saa7134/saa7134-video.c     |   19 +-
 .../media/test-drivers/vivid/vivid-vid-cap.c  |   18 +-
 .../media/test-drivers/vivid/vivid-vid-out.c  |   18 +-
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c | 1773 ++++++-----------
 drivers/media/v4l2-core/v4l2-ioctl.c          |  182 +-
 include/media/v4l2-ioctl.h                    |   11 +
 include/uapi/linux/videodev2.h                |    2 +-
 9 files changed, 760 insertions(+), 1277 deletions(-)

Cc: linux-media@vger.kernel.org
Cc: mchehab@kernel.org
Cc: hverkuil@xs4all.nl
Cc: hch@lst.de
Cc: linux-kernel@vger.kernel.org

-- 
2.27.0

