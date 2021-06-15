Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35C2B3A7AF9
	for <lists+linux-media@lfdr.de>; Tue, 15 Jun 2021 11:42:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231325AbhFOJpB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Jun 2021 05:45:01 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:40251 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231265AbhFOJpA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Jun 2021 05:45:00 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id t5atlaZMYhg8Zt5axlNoIk; Tue, 15 Jun 2021 11:42:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1623750175; bh=vexNKenPvbybrYSSL1Z4j4D5mLVel05108BCPo2Z1dY=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Iy2fsd2lrchndrFkogvIqgt982xLoiBjMUy4ThX5u3NbEzEFktWJFs8R+aF1Soce9
         3BFDpBx7NF3no/nan3Ir9rDmB2Nh7u5g+caBftuqGOyuRSZ669oswRQZyQaRTafvyq
         O+VZ/9ll+AuDj15RB2io4/KhVHJ8IF7qFRyvgb71mvwyFp972m75BpIShzMp3nEBOH
         xyvaq1cItT5BBE6WPWmbAtFnymuKov43FXmW1+0q46SZdDUFV5HNssr8V6EI16JTQ/
         vrYyPBBqNjs8ShoSx5jhYgeJLvZLZupiQuABnshLC+vKhKQ9UdIn7ae9J+GsISKfl1
         uTaZHew5bGkJA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.14] v2: media: v4l2: compat ioctl fixes
Message-ID: <a3498b63-50aa-8dea-2197-faeeeccbd532@xs4all.nl>
Date:   Tue, 15 Jun 2021 11:42:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfHD2A/26IDPuPLfiTtYb0ihUu7K/eaHrXcLvQe+uI8H1M+OGtHn7gcobI9mKSNENI+PM9UcE7qONni/TPp3sYDzvrG5p58/+XEftky1PW6tSyePU2Wxk
 K8iSVeeKQ46Ygj2qSvpgDOg5AghjEse9thEzFjY32HypDh30gMkymDbLz2Zj3MKdjYh/rBSwegBUFJ8HsxqkIvdX1wqw8kKTX683Z3AqDCOTixJ8bg3gqg6U
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

compat ioctl fixes.

Tested with the test-media script for the various configurations, both
on x86_64 and i686.

Changes since v1:

- Added tags from Laurent
- Dropped patch 7/8 as that needs to be reworked a bit
- Updated commit log for patch 4.

Regards,

	Hans

The following changes since commit 45040f675041956ad763f9ef139ecee3647aa8bb:

  media: hantro: IMX8M: add variant for G2/HEVC codec (2021-06-08 16:13:53 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.14k

for you to fetch changes up to f2172e5bda0664b95a099c2faa0203b500f4956f:

  media: subdev: disallow ioctl for saa6588/davinci (2021-06-15 11:40:13 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Arnd Bergmann (7):
      media: v4l2-core: ignore native time32 ioctls on 64-bit
      media: v4l2-core: explicitly clear ioctl input data
      media: v4l2-core: fix whitespace damage in video_get_user()
      media: subdev: remove VIDIOC_DQEVENT_TIME32 handling
      media: v4l2-core: return -ENODEV from ioctl when not registered
      media: atomisp: remove compat_ioctl32 code
      media: subdev: disallow ioctl for saa6588/davinci

 drivers/media/i2c/saa6588.c                                |    4 +-
 drivers/media/pci/bt8xx/bttv-driver.c                      |    6 +-
 drivers/media/pci/saa7134/saa7134-video.c                  |    6 +-
 drivers/media/platform/davinci/vpbe_display.c              |    2 +-
 drivers/media/platform/davinci/vpbe_venc.c                 |    6 +-
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c              |    3 +
 drivers/media/v4l2-core/v4l2-ioctl.c                       |   38 +-
 drivers/media/v4l2-core/v4l2-subdev.c                      |   24 -
 drivers/staging/media/atomisp/Makefile                     |    1 -
 drivers/staging/media/atomisp/TODO                         |    5 +
 drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c | 1202 ------------------------------------------
 drivers/staging/media/atomisp/pci/atomisp_fops.c           |    8 +-
 include/media/v4l2-subdev.h                                |    4 +
 13 files changed, 46 insertions(+), 1263 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c
