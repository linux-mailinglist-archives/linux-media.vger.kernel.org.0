Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3222B10A1CB
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2019 17:18:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728728AbfKZQSk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Nov 2019 11:18:40 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:33573 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728146AbfKZQSk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Nov 2019 11:18:40 -0500
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.145]) with ESMTPA (Nemesis) id
 1N6LMN-1hkrRY2dUf-016cSA; Tue, 26 Nov 2019 17:18:33 +0100
From:   Arnd Bergmann <arnd@arndb.de>
To:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     y2038@lists.linaro.org, linux-kernel@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v5 0/8] y2038 safety in v4l2
Date:   Tue, 26 Nov 2019 17:18:16 +0100
Message-Id: <20191126161824.337724-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:KT9LBiKgC1VMou4wVMLeOPZOAr0fBKC7dja4kMF5KzxecFIk/Oq
 PVv6TlCkah1zDAbbznnAGazr70gnLuIuD+RjbGmRGFiLdC5OAbOKQrbpARMfBxRE3jsZw2w
 7PtQbgN5rP1yjkMGshYRhxUeZN5epiosE71h6OqdxV+WLxwUA0G5CO/cOykOFdZObifvqct
 3XQgAF3e0vZCD8CaSLeJw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ahhvd/oc2yE=:SkbadSIJ83oP7J+D6Pzf46
 1jJ5wtWlM72SKhLS/PE17pHJ6/3zvaTpQ0ApywCxIFKrTFojqC1/3MM719moSQADNjVFXR6/O
 d/7JeZlfPfcRstijxPfAPL1efayX9AgNGZ1JeqRIzNy9P+iZYs9DHvSWgQpdOVHQIg57DkUWM
 xtITWpk8aIfnsODsOYs9HBbIh/PkP4jh9GHQNDMg46tWa8t55PJr0EOaDBvAK5Tk7ezAUOWzf
 wzp5xeYO7pAlZDVSJ1//k2S69SSKBt2Wm3WCz+ruH8c6FeykeaPB9DgqYHMHR1zRcL+MynwLA
 XW5INgBt2ZCnnwNTVhSk8JhvKpACCdT1RIGDwIKtzANqnbEXdON2/cIUawzxJWLH7d09J37HN
 n0v6fxVijtk650pjWjV+k86HIt4xdtWh//9/3eSdoPLGOhpA5l5/lcMOe9lT+IeJQ01IeFETA
 QE8M/g0onOEhcIKIAoxNg7FcHs7FUaxJRqhEmZMHZdZcCSdwR6JMsj7bxmntCytg15If6uCEN
 +u2uHID7zPWfC/Gqonhl9rt3VsNu2QPZhqapx4XZq9ZteeUNNe7EAdeQVCsJjm6fSymHsMxbo
 ojaHRaIZED5wFgZMl6utgeQIHEJcDukxHBo885jyCLXoch/EyMz5gRFG4Rl1TfHQ32dsB29Mo
 qmerZ2EN7PGp2jZY8USkwViiiOxIhce0OJwctPRmy4Yq7NsOlnE5deFzz69tNNjRROpL2fzwW
 j270CES3LRmgbalRmn+U05xKQV546nd84VcPC4+PM9PuSv2TFyV9mrmoino8T21nN9579U6bd
 ESiMC6GzWl27eSt8zsxKcA0gGzLmLpS+dZxoX5QHQyMylWy9MmOKcxwM5s9t+5KtyX7R6YgJJ
 87KdWyvqO/OHXxfRhjqg==
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
[2] https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/log/?h=y2038-v4l2-v5

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
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c | 470 +++++++++++++++---
 drivers/media/v4l2-core/v4l2-event.c          |   5 +-
 drivers/media/v4l2-core/v4l2-ioctl.c          | 209 ++++++--
 drivers/media/v4l2-core/v4l2-subdev.c         |  26 +-
 drivers/media/v4l2-core/videobuf-core.c       |   5 +-
 include/media/v4l2-common.h                   |  21 +
 include/media/v4l2-ioctl.h                    |  55 ++
 include/trace/events/v4l2.h                   |   2 +-
 include/uapi/linux/videodev2.h                |  29 ++
 16 files changed, 709 insertions(+), 135 deletions(-)

-- 
2.20.0

