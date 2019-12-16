Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E1E8120849
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2019 15:16:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728083AbfLPOPW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 09:15:22 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:45827 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727807AbfLPOPW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 09:15:22 -0500
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.145]) with ESMTPA (Nemesis) id
 1N3sNa-1hhE4h2cca-00zkk5; Mon, 16 Dec 2019 15:15:15 +0100
From:   Arnd Bergmann <arnd@arndb.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        y2038@lists.linaro.org, linux-kernel@vger.kernel.org, arnd@arndb.de
Subject: [PATCH v6 0/8] y2038 safety in v4l2
Date:   Mon, 16 Dec 2019 15:14:58 +0100
Message-Id: <20191216141506.121728-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Ms8ZjxHKdb7el0sg9w88S96vO5S5zP9+tRpSPr8R5J/dO7vFpPZ
 AS6t8+xKN/Nsxen4vC5UZu5WqHJ6S09vNqkLe9MQpG5sat1Kk6St+ur3xkWteWkKtqGVlEl
 6msS5AFFbfZwyaoT3kbH79CyoZXpC2wrghlabRXR5QUG/lGKW6x44YwIGnRrsjIvMObPoeT
 2tWTE8sK02IbkHc1Wsdng==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:HNUaHH6Gr3M=:2md3i0z8AuQCc1xfksdpPu
 TjAT98IM232AuuesBd7ESvGoVoR8juBA8EzLUDaJsU+TiuwWB60tSzV5KkAntAkwxPPCpNn2S
 rBqv1bKeVG+wyW1d477lf9+q9Wmjos9vQoBywN6jO9O5D/6vReST24z8T/D5jx5MdlABJGHZg
 LR/oKF5Y/R0zV+e90dsH+Njnkd4pfOa9KAJQIcUwkxg9I3UtN4qaLJ/EJep4kDNWPeENLwmUO
 gOwpgB5r9rYJhV+zJcglnFaVzyct6bSvlCkwtCav9VeoesaWt9PWOek2RB/tSZvoDpK7z/diK
 83byu6MrlsYzQ/R2c76HMClSrNcwP+0XrZzY33/yXjWMiqTd5bbf1ZjQa6FJ292v33sH1trqB
 XTtq56nY/uw9/K5Dk0Q5yPvSU50B473QQUcPhTzMoXBpiVwWiGdA5+WN6gw0W9U0t2D8XDhwh
 h74P6GqvU4Bn9I785TAgujlcWsb8Fq3hLeYGWMmd/e4i3kolC2WH5hHStyByP8xoU0FHvMXUI
 duhnYkllrmzDqBVpP84dKgr4/5172GqjtO81DqAOzWESR7lQO3jvsFvDRJ51YPhoDeezkucvf
 2dYIOnbVKmsZLh8SynDlLtehKxf4U+j5ESQM9VX+XZQ6lSDyPYcjFDOzITTbq6SESxjuOAWuP
 fceFCJhNe+DflF8anUGEoLn9H31C7FN/DszRMpL8IHrVYrAtQmKG9svD2E61GJRlSb/uE82Oe
 dK1zoatVYd/QDK4KfRCx9301wj/xUIVs6IOZpVyVank21nDWh/0y/vE5rGQ4HcPlw4yIk7m9o
 x5gLWBIJP9znH1n043ZhROM3O2Xn740zIdpdtyVHBrgygzqmrtsMElDuBTRWu7LqrW/EV2AxZ
 JO05OKfCEy0n0+6au2ZA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I'm in the process of finishing up the last bits on y2038-unsafe
code in the kernel, this series is for v4l2, which has no problem
with overflow, but has multiple ioctls that break with user space
built against a new 32-bit libc.

I posted similar patches as part of a series back in 2015, the
new version was rewritten from scratch and I double-checked with
the old version to make sure I did not miss anything I had already
taken care of before.

Hans Verkuil worked on a different patch set in 2017, but this
also did not get to the point of being merged.

My new version contains compat-ioctl support, which the old one
did not and should be complete, but given its size likely contains
bugs. I did randconfig build tests, but no runtime test, so
careful review as well as testing would be much appreciated.

With this version, the newly added code takes care of the existing
ABI, while the existing code got moved to the 64-bit time_t
interface and is used internally. This means that testing with
existing binaries should exercise most of the modifications
and if that works and doesn't get shot down in review, we can
probably live without testing the new ABI explicitly.

I'm not entirely happy with the compat-ioctl implementation that
adds quite a bit of code duplication, but I hope this is
acceptable anyway, as a better implementation would likely
require a larger refactoring of the compat-ioctl file, while
my approach simply adds support for the additional data structure
variants.

I uploaded git branch on top of the v4l2/dvb branch to [2].

      Arnd

Changes since v5:

- Fix all bugs that Hans found during testing
- Add a comment about x32 still being broken

Changes since v4:

- Move non-public contents out of uapi header
- split out __kernel_v4l2_timeval into separate struct
- use compound initializers for v4l2_event_time32 and
  v4l2_buffer_time32 conversion
- add comment for v4l2_buffer_get_timestamp()

Changes since v3:

- This is a minor update compared to version 3 of this series,
  with bugfixes for small mistakes that I found or that were
  reported by automated build bots.


[1] https://lwn.net/Articles/657754/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/log/?h=y2038-v4l2-v6


Arnd Bergmann (8):
  media: documentation: fix video_event description
  media: v4l2: abstract timeval handling in v4l2_buffer
  media: v4l2-core: compat: ignore native command codes
  media: v4l2-core: split out data copy from video_usercopy
  media: v4l2-core: fix VIDIOC_DQEVENT for time64 ABI
  media: v4l2-core: fix v4l2_buffer handling for time64 ABI
  media: v4l2-core: fix compat VIDIOC_DQEVENT for time64 ABI
  media: v4l2-core: fix compat v4l2_buffer handling for time64 ABI

 .../media/uapi/dvb/video-get-event.rst        |   2 +-
 Documentation/media/uapi/dvb/video_types.rst  |   2 +-
 .../media/common/videobuf2/videobuf2-v4l2.c   |   4 +-
 drivers/media/pci/meye/meye.c                 |   4 +-
 drivers/media/usb/cpia2/cpia2_v4l.c           |   4 +-
 drivers/media/usb/stkwebcam/stk-webcam.c      |   2 +-
 drivers/media/usb/usbvision/usbvision-video.c |   4 +-
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c | 477 +++++++++++++++---
 drivers/media/v4l2-core/v4l2-event.c          |   5 +-
 drivers/media/v4l2-core/v4l2-ioctl.c          | 211 ++++++--
 drivers/media/v4l2-core/v4l2-subdev.c         |  26 +-
 drivers/media/v4l2-core/videobuf-core.c       |   5 +-
 include/media/v4l2-common.h                   |  21 +
 include/media/v4l2-ioctl.h                    |  55 ++
 include/trace/events/v4l2.h                   |   2 +-
 include/uapi/linux/videodev2.h                |  29 ++
 16 files changed, 718 insertions(+), 135 deletions(-)

-- 
2.20.0

