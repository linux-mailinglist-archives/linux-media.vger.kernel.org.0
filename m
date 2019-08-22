Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 609E79A04D
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2019 21:45:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392085AbfHVTpN convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 22 Aug 2019 15:45:13 -0400
Received: from mailoutvs34.siol.net ([185.57.226.225]:56048 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1732015AbfHVTpN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Aug 2019 15:45:13 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 588C4524922;
        Thu, 22 Aug 2019 21:45:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id 3YxjoKs4nn6j; Thu, 22 Aug 2019 21:45:09 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id B8DC452481F;
        Thu, 22 Aug 2019 21:45:08 +0200 (CEST)
Received: from localhost.localdomain (cpe-86-58-59-25.static.triera.net [86.58.59.25])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id BAB68524922;
        Thu, 22 Aug 2019 21:45:05 +0200 (CEST)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        paul.kocialkowski@bootlin.com, mripard@kernel.org
Cc:     pawel@osciak.com, m.szyprowski@samsung.com,
        kyungmin.park@samsung.com, tfiga@chromium.org, wens@csie.org,
        acourbot@chromium.org, gregkh@linuxfoundation.org,
        jernej.skrabec@siol.net, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, ezequiel@collabora.com,
        jonas@kwiboo.se
Subject: [PATCH 0/8] media: cedrus: h264: Support multi-slice frames
Date:   Thu, 22 Aug 2019 21:44:52 +0200
Message-Id: <20190822194500.2071-1-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series is continuation of work from
https://patchwork.linuxtv.org/cover/58186/

It picks up unmerged patches (9-12) from aforementioned series and
adds support for decoding multi-slice H264 frames along with support
for V4L2_DEC_CMD_FLUSH and V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF in
Cedrus driver.

Code was tested by modified ffmpeg, which can be found here:
https://github.com/jernejsk/FFmpeg, branch mainline-test
It has to be configured with at least following options:
--enable-v4l2-request --enable-libudev --enable-libdrm

Samples used for testing:
http://jernej.libreelec.tv/videos/h264/BA1_FT_C.mp4
http://jernej.libreelec.tv/videos/h264/h264.mp4

Command line used for testing:
ffmpeg -hwaccel drm -hwaccel_device /dev/dri/card0 -i h264.mp4 -pix_fmt bgra -f fbdev /dev/fb0

Please note that V4L2_DEC_CMD_FLUSH was not tested because I'm
not sure how. ffmpeg follows exactly which slice is last in frame
and sets hold flag accordingly. Improper usage of hold flag would
corrupt ffmpeg assumptions and it would probably crash. Any ideas
how to test this are welcome!

Thanks to Jonas for adjusting ffmpeg.

Please let me know what you think.

Best regards,
Jernej

Alexandre Courbot (1):
  media: docs-rst: Document m2m stateless video decoder interface

Hans Verkuil (2):
  vb2: add V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF
  videodev2.h: add V4L2_DEC_CMD_FLUSH

Jernej Skrabec (4):
  media: cedrus: Detect first slice of a frame
  media: cedrus: h264: Support multiple slices per frame
  media: cedrus: Add support for holding capture buffer
  media: cedrus: Add support for V4L2_DEC_CMD_FLUSH

Tomasz Figa (1):
  media: docs-rst: Document memory-to-memory video encoder interface

 Documentation/media/uapi/v4l/buffer.rst       |  13 +
 Documentation/media/uapi/v4l/dev-encoder.rst  | 608 ++++++++++++++++++
 Documentation/media/uapi/v4l/dev-mem2mem.rst  |   2 +
 .../media/uapi/v4l/dev-stateless-decoder.rst  | 424 ++++++++++++
 Documentation/media/uapi/v4l/pixfmt-v4l2.rst  |   5 +
 Documentation/media/uapi/v4l/v4l2.rst         |   2 +
 .../media/uapi/v4l/vidioc-decoder-cmd.rst     |  11 +-
 .../media/uapi/v4l/vidioc-encoder-cmd.rst     |  51 +-
 .../media/uapi/v4l/vidioc-reqbufs.rst         |   6 +
 .../media/videodev2.h.rst.exceptions          |   1 +
 .../media/common/videobuf2/videobuf2-v4l2.c   |   8 +-
 drivers/staging/media/sunxi/cedrus/cedrus.h   |   1 +
 .../staging/media/sunxi/cedrus/cedrus_dec.c   |  11 +
 .../staging/media/sunxi/cedrus/cedrus_h264.c  |  11 +-
 .../staging/media/sunxi/cedrus/cedrus_hw.c    |   8 +-
 .../staging/media/sunxi/cedrus/cedrus_video.c |  35 +
 include/media/v4l2-mem2mem.h                  |  42 ++
 include/media/videobuf2-core.h                |   3 +
 include/media/videobuf2-v4l2.h                |   5 +
 include/uapi/linux/videodev2.h                |  14 +-
 20 files changed, 1230 insertions(+), 31 deletions(-)
 create mode 100644 Documentation/media/uapi/v4l/dev-encoder.rst
 create mode 100644 Documentation/media/uapi/v4l/dev-stateless-decoder.rst

-- 
2.22.1

