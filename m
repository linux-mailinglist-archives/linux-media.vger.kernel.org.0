Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37030F1F35
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2019 20:48:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732453AbfKFTr6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Nov 2019 14:47:58 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:58913 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731976AbfKFTrn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Nov 2019 14:47:43 -0500
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.145]) with ESMTPA (Nemesis) id
 1M3DBb-1iVTXf3dEb-003eWL; Wed, 06 Nov 2019 20:47:26 +0100
From:   Arnd Bergmann <arnd@arndb.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        y2038@lists.linaro.org,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Daniel Mentz <danielmentz@google.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v3 0/8] RFC/RFT: y2038 safety in v4l2
Date:   Wed,  6 Nov 2019 20:47:07 +0100
Message-Id: <20191106194715.2238044-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+vWrhOyDf1rK7zPT+Nqi3EyEjrvOlVpwPmaOKEHA2K93JbxDkA3
 KuQXQJhfI3aHpxR0wN7reYHUFVzQ3c51t7aZljQ/Ad6uj2VwZG3YnI29dc9ATKEpb7wOgP9
 Wp48lJyl7nAPDH4Axcw9TDSrkZUvr3elWxw39AGc30Szik0SkLU7/LCcPE337SyLbvVrjrX
 e38ZQPCOV5jRiybZdWLQg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:7jAeiGy7qg0=:RGa7UcxH0Lvi4pcVms0swx
 yxroFzCpAYRAZf30wJpvpwSzAyo3qK+pvW2CxIrLyDpt42/7EFLkS3yhyroPg2JnOQeVUyn1q
 4nl7XSsRIwiUYeq80fTi2nTbS4k//PK0t7VRT1lGf7D2lQ9aAjRYWM+CSAsEXcejLvkNfgkli
 FCYUl+ZlKl3Y5RA+p8ADDQK0+2IPP4E03N5vCOk/vJp/qH7yj0/lIEDVPqcYLnYxpaSxEj+Bs
 yBqWROGFzZQFzHevBtyeAfyewA0mTtiU5hQbVrX49+Qy2CTqAM9ZHlmVtC4vZlkpS3wtR0q4b
 PUfza5eHkFo3XNtDU2HJN1g60St+u+4eiEb+0Nr+Mi8ldM3VDvKZUWRq4SK6tGT1pVegcJ0KE
 nkxLFVXoaBWl5UdFkIhLOTGb2nW+6kZ33lai9zWXebVUy9sjeZ2PD61kMqUmis3+NPO8w1KP2
 iTLLYTtVUxooc8p3e/Q2S2B+Jg5WMWkH8eQ5uGpd2U2V6VAd8FSipt2EpNOnwBOlwOuWdD8nW
 8/2j0Broy8yExSyOLhweOh2CyaM6lZpuoyS1BQtEY9R2tjPZoB8ZkIRrdiTEPWEBDT+MFGts8
 LdGfHmtClpd58drTWSdfeqkeYHIO3xYPToyS9b6LktHbPtu3AG29RtzZbFVnNda8zA6Y/9isr
 SnIin42iw+IU6IbI87ZKpm/AF+zKkf+0iQEIUqkUbge6HkeUMukqTAPuRgaGoOtVj+wYUJHaN
 qpCFv/EQtZCGJzFtNH3NHKI9AwWBFj0brhPUbV82ctBFq1H0EIjUhIE0hatFolokVc9tPmsMh
 5B4idfe6eo3OsBxJiwhDqk4W+gqlnnJCgOTYBYsWNo2fG1YFT49+P7HNDBzZh3/m7OHMuEExN
 hOxxcv2SAw6wtHypIKcA==
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

The patches apply cleanly on either v5.4-rc4 or the media-tree
master branch. I uploaded a copy to [2] for easier testing.

      Arnd

[1] https://lwn.net/Articles/657754/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/log/?h=y2038-v4l2

Arnd Bergmann (8):
  media: documentation: fix video_event description
  media: v4l2: abstract timeval handling in v4l2_buffer
  media: v4l2-core: ignore native command codes
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
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c | 464 +++++++++++++++---
 drivers/media/v4l2-core/v4l2-event.c          |   5 +-
 drivers/media/v4l2-core/v4l2-ioctl.c          | 186 +++++--
 drivers/media/v4l2-core/v4l2-subdev.c         |  20 +-
 drivers/media/v4l2-core/videobuf-core.c       |   4 +-
 include/linux/videodev2.h                     |  17 +-
 include/trace/events/v4l2.h                   |   2 +-
 include/uapi/linux/videodev2.h                |  72 +++
 15 files changed, 660 insertions(+), 132 deletions(-)

-- 
2.20.0

