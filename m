Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C79B61209CE
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2019 16:37:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728286AbfLPPh3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 10:37:29 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:42993 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728234AbfLPPh3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 10:37:29 -0500
Received: from [IPv6:2001:983:e9a7:1:319d:6a65:b2d0:e9e9]
 ([IPv6:2001:983:e9a7:1:319d:6a65:b2d0:e9e9])
        by smtp-cloud9.xs4all.net with ESMTPA
        id gsR3i0rvIGyJwgsR4i8Jux; Mon, 16 Dec 2019 16:37:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1576510647; bh=gtdS5UOT8c4Yjl2uuM8f04Ct7MToS3O6I26eVwciy8w=;
        h=From:Subject:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=qfEFrHlBSrNMLVpoy3fIdjgiscUvr7tHUmhXSuXZK24SZzseQiRiqZJdT2b0/9sNl
         Xm9P6CJ7htY2dAy6UlY6JClq3yrkJFrBiPMHsTam8h9Jmol5Pi4Vwd1ZjuD8fkGoBA
         dWpgNopbf3qUC9s7XFM/nvC0HkWQv9rkmSMHSLemRO6WRRXgYJDEk4h53VJTNdx7mW
         ZP62H4Hetlx5mKe+CMDYq1Eq94UsoyozyTtUmPjGittLLiqDPyLQcE+743YD99Sivf
         qCOOYOZKDuUVU5ThN1MQR7Y1fg7V9AOdRcGu/+zq07g8qpEVDKY9HF2ZCQ8TlcDQnn
         dyw8IJOfzAjBw==
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.6] y2038 safety in v4l2
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>
Message-ID: <362c4787-e114-1b90-66e2-f9a1cbafe567@xs4all.nl>
Date:   Mon, 16 Dec 2019 16:37:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNfmlpi+KU+o1aO5LPfhKU8TFJoqT6Mu41vyN//K/Pmso/yiWlP9WpKgdlO4thXmptvjf4f1lVqLR+Dh+GBG9wPRmv9Th7w8HIZMYiovZTtY1f+XUlrl
 jgXRGsQXF2B5hPO/3P+LkBDIpuMiEGsZx/Xtz+Lpm13Ins+6GSCMReCzxEGVSD+uy8aXlDpdOOCMhWt2rG9hsC7VyNqaj7o2HIslBOfNlIJTN+GvUGoBX4aR
 Y3bXRd3mupEW8WqUekhNeNnQZWTijJxo/LtBmzxp3630He5g0eSZne5v4eNvvbvd
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

This series makes the V4L2 API y2038 safe. Many thanks to Arnd for working on
this!

I have tested this using the test-media script and v4l2-ctl/v4l2-compliance
binaries compiled for x86_64, i686, i686 with 64-bit time_t under both a
64 bit kernel (so the compat-ioctl32 code is called) and a native 32 bit
kernel (to make sure both the 32 and 64-bit time_t versions are handled
correctly).

Regards,

	Hans

The following changes since commit 0885acd77eb4644fd88f6d9f41e433f4ee9bc37a:

  media: vivid: support multiplanar touch devices (2019-12-16 13:24:16 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-y2038

for you to fetch changes up to 416f076ff267d2208d4e09767080558cc619dd9c:

  media: v4l2-core: fix compat v4l2_buffer handling for time64 ABI (2019-12-16 15:27:20 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Arnd Bergmann (8):
      media: documentation: fix video_event description
      media: v4l2: abstract timeval handling in v4l2_buffer
      media: v4l2-core: compat: ignore native command codes
      media: v4l2-core: split out data copy from video_usercopy
      media: v4l2-core: fix VIDIOC_DQEVENT for time64 ABI
      media: v4l2-core: fix v4l2_buffer handling for time64 ABI
      media: v4l2-core: fix compat VIDIOC_DQEVENT for time64 ABI
      media: v4l2-core: fix compat v4l2_buffer handling for time64 ABI

 Documentation/media/uapi/dvb/video-get-event.rst |   2 +-
 Documentation/media/uapi/dvb/video_types.rst     |   2 +-
 drivers/media/common/videobuf2/videobuf2-v4l2.c  |   4 +-
 drivers/media/pci/meye/meye.c                    |   4 +-
 drivers/media/usb/cpia2/cpia2_v4l.c              |   4 +-
 drivers/media/usb/stkwebcam/stk-webcam.c         |   2 +-
 drivers/media/usb/usbvision/usbvision-video.c    |   4 +-
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c    | 476 +++++++++++++++++++++++++++++++++++++++++++++---------
 drivers/media/v4l2-core/v4l2-event.c             |   5 +-
 drivers/media/v4l2-core/v4l2-ioctl.c             | 211 +++++++++++++++++++-----
 drivers/media/v4l2-core/v4l2-subdev.c            |  26 ++-
 drivers/media/v4l2-core/videobuf-core.c          |   5 +-
 include/media/v4l2-common.h                      |  21 +++
 include/media/v4l2-ioctl.h                       |  55 +++++++
 include/trace/events/v4l2.h                      |   2 +-
 include/uapi/linux/videodev2.h                   |  29 ++++
 16 files changed, 717 insertions(+), 135 deletions(-)
