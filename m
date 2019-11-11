Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 569BBF816C
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2019 21:39:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727791AbfKKUjR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Nov 2019 15:39:17 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:41731 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726985AbfKKUiq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Nov 2019 15:38:46 -0500
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.129]) with ESMTPA (Nemesis) id
 1Ma0HM-1iQwX50ITc-00VvyS; Mon, 11 Nov 2019 21:38:39 +0100
From:   Arnd Bergmann <arnd@arndb.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-kernel@vger.kernel.org,
        y2038@lists.linaro.org, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v4 0/8] y2038 safety in v4l2
Date:   Mon, 11 Nov 2019 21:38:27 +0100
Message-Id: <20191111203835.2260382-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:HK+vSU8MWbFmRCQzio+B0y0eS2MroBevtMRKkHYLNcgGMvKpVNP
 DjDxbV2OPIUSfUhWnJfpD/v7fu/coHW+IrnMd26BhN0crudppogBxqsuXy1tKVk9gHpoKVq
 uN3R/KHD3l6kLTORAY0Fgp5CxRQU2xF69aeWCZ1h0NopBQGVKejQM4/TjFC/Ycc2zBHQ9V1
 LCod0NQsAQfBOC+zgfftA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:BBguRoDGRkc=:mONTJGjsVMTzIh4r/7ubCZ
 yyl2wzpeYy5KqUwHzC5T8x7sLDk4ONIg5T8OcH/c17sQoPiOSqx664QJ3xQ9yaezEVJgLfGXK
 1otOWfLMTMavSnBvNUKK68aYOfOvJgHZUCnFkFeIDwftoSLy1tx5SjPDeOdcnVieoLHdqxgvH
 Gdo7yoC1hvgV/r354xSMLHqLgN86H5GpY29GoyH1bMpQkDaxyE9+yCr4hRyllV5PqfnmmxyId
 +k+J82fB4l4GwxVZ3uSB+7o3LpPOo4W11RDMAjQqKQG8s3QMr6pU/kAWBM9mWP3rIMKsN8Bdx
 d62Q4pq111zJnz5TC7csU762pRqy3SC2Bm9pTGDr9vqC01LSEptsWSwWhXP37ZWLFptqD1Vlx
 UkuoeJa3y2qzXQBG+vd2ZtM1hbBKE/4WkdajLXH/0WkzNmO0nmAzBm0eb/7MCaaQ6vNNAWR02
 wWxw0IzqnuZTfpXSlwalmo49c5/EJ6+XZEnNuYXrslalrQ7KaEu8nc8MQNWryCGxqic1RZOyl
 PxqqRKfQL1VFSMzL4MBP19aFpG8rUCCiQTXwbacbZsUZmS9l7YuivTZ3nuF3nMn6OT5JOCPMT
 4IJHnmRoLTHYH6fItfWCGetdP1ctyvxF3NaorPHUX/8wkdLjnCvGwqh9qhqJdg/3CmPFMbk66
 IdPsrGesJqjF/nasfqS2timv7y3CZd70K2RVGPI2lb3nYkQw3X7g7q5NNG4qAnuJCPsDlvq0o
 2zi4dnfNqdw/8TE1zGQCnVE1aAlVq2U5HnbzVtPTZdqyo343ehpQlOScNf1S3bxC8/NzFZ4K3
 HApBi6Ksw1J7Rkvk1n9ew9CGsPIOi/iz0AyhMitrWM64+ml14/7wRKAK7zFIhMiQke1MrNZf5
 qEOJ+HkTpmmQIMT0DU/g==
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

This is a minor update compared to version 3 of this series,
with bugfixes for small mistakes that I found or that were
reported by automated build bots. I updated the tree at [2]
to this version now.

      Arnd

[1] https://lwn.net/Articles/657754/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/log/?h=y2038-v4l2

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
 drivers/media/v4l2-core/v4l2-ioctl.c          | 188 +++++--
 drivers/media/v4l2-core/v4l2-subdev.c         |  20 +-
 drivers/media/v4l2-core/videobuf-core.c       |   4 +-
 include/linux/videodev2.h                     |  17 +-
 include/trace/events/v4l2.h                   |   2 +-
 include/uapi/linux/videodev2.h                |  77 +++
 15 files changed, 669 insertions(+), 136 deletions(-)

-- 
2.20.0

See below for the changes compared to v3:

|diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
|index a13e4849df0c..3bbf47d950e0 100644
|--- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
|+++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
|@@ -500,7 +500,7 @@ struct v4l2_buffer32_time32 {
|        __u32                   bytesused;
|        __u32                   flags;
|        __u32                   field;  /* enum v4l2_field */
|-       struct compat_timeval   timestamp;
|+       struct old_timeval32    timestamp;
|        struct v4l2_timecode    timecode;
|        __u32                   sequence;
| 
|@@ -1290,7 +1290,7 @@ struct v4l2_event32_time32 {
|        } u;
|        __u32                           pending;
|        __u32                           sequence;
|-       struct compat_timespec          timestamp;
|+       struct old_timespec32           timestamp;
|        __u32                           id;
|        __u32                           reserved[8];
| };
|@@ -1482,8 +1482,8 @@ static long do_video_ioctl(struct file *file, unsigned int cmd, unsigned long ar
|        case VIDIOC_S_EXT_CTRLS32: ncmd = VIDIOC_S_EXT_CTRLS; break;
|        case VIDIOC_TRY_EXT_CTRLS32: ncmd = VIDIOC_TRY_EXT_CTRLS; break;
| #ifdef CONFIG_X86_64
|-       case VIDIOC_DQEVENT32: cmd = VIDIOC_DQEVENT; break;
|-       case VIDIOC_DQEVENT32_TIME32: cmd = VIDIOC_DQEVENT_TIME32; break;
|+       case VIDIOC_DQEVENT32: ncmd = VIDIOC_DQEVENT; break;
|+       case VIDIOC_DQEVENT32_TIME32: ncmd = VIDIOC_DQEVENT_TIME32; break;
| #endif
|        case VIDIOC_OVERLAY32: ncmd = VIDIOC_OVERLAY; break;
|        case VIDIOC_STREAMON32: ncmd = VIDIOC_STREAMON; break;
|diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
|index cd9a80960289..ad125cd4eb41 100644
|--- a/drivers/media/v4l2-core/v4l2-ioctl.c
|+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
|@@ -474,7 +474,7 @@ static void v4l_print_buffer(const void *arg, bool write_only)
|        const struct v4l2_plane *plane;
|        int i;
| 
|-       pr_cont("%02ld:%02d:%02d.%09ld index=%d, type=%s, request_fd=%d, flags=0x%08x, field=%s, sequence=%d, memory=%s",
|+       pr_cont("%02d:%02d:%02d.%09ld index=%d, type=%s, request_fd=%d, flags=0x%08x, field=%s, sequence=%d, memory=%s",
|                        (int)p->timestamp.tv_sec / 3600,
|                        ((int)p->timestamp.tv_sec / 60) % 60,
|                        ((int)p->timestamp.tv_sec % 60),
|@@ -821,7 +821,7 @@ static void v4l_print_event(const void *arg, bool write_only)
|        const struct v4l2_event *p = arg;
|        const struct v4l2_event_ctrl *c;
| 
|-       pr_cont("type=0x%x, pending=%u, sequence=%u, id=%u, timestamp=%lu.%9.9lu\n",
|+       pr_cont("type=0x%x, pending=%u, sequence=%u, id=%u, timestamp=%llu.%9.9llu\n",
|                        p->type, p->pending, p->sequence, p->id,
|                        p->timestamp.tv_sec, p->timestamp.tv_nsec);
|        switch (p->type) {
|diff --git a/include/linux/videodev2.h b/include/linux/videodev2.h
|index 481ee3013b50..4086036e37d5 100644
|--- a/include/linux/videodev2.h
|+++ b/include/linux/videodev2.h
|@@ -62,7 +62,7 @@
| static inline u64 v4l2_buffer_get_timestamp(const struct v4l2_buffer *buf)
| {
|        return buf->timestamp.tv_sec * NSEC_PER_SEC +
|-              buf->timestamp.tv_usec * NSEC_PER_USEC;
|+              (u32)buf->timestamp.tv_usec * NSEC_PER_USEC;
| }
| 
| static inline void v4l2_buffer_set_timestamp(struct v4l2_buffer *buf,
|diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
|index 4275d6e92dae..ca10828328a5 100644
|--- a/include/uapi/linux/videodev2.h
|+++ b/include/uapi/linux/videodev2.h
|@@ -1001,7 +1001,12 @@ struct v4l2_buffer {
|        /* match glibc timeval64 format */
|        struct {
|                long long       tv_sec;
|+# if defined(__sparc__) && defined(__arch64__)
|+               int             tv_usec;
|+               int             __pad;
|+# else
|                long long       tv_usec;
|+# endif
|        } timestamp;
| #else
|        struct timeval          timestamp;
|
