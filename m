Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EE60D2A7C
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2019 15:12:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388055AbfJJNL4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Oct 2019 09:11:56 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:58991 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387758AbfJJNL4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Oct 2019 09:11:56 -0400
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:bc04:8998:8ec1:1871])
        by smtp-cloud8.xs4all.net with ESMTPA
        id IYESijV5zop0AIYETiU36N; Thu, 10 Oct 2019 15:11:54 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@siol.net>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        mripard@kernel.org, tfiga@chromium.org, jonas@kwiboo.se,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCHv3 0/8] media: cedrus: h264: Support multi-slice frames
Date:   Thu, 10 Oct 2019 15:11:44 +0200
Message-Id: <20191010131152.68984-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfDfZsdP8Bvplzj9CDblZjIi5D9n20zQHLWkR0+QzhQv0APoECiXDGOQIMb7MlTBmw8l+n0Al6dvd0Ah5ByzSQfFoZoQdPhsi3a5mQjtBD32IUHL22MsZ
 ii0OmEjKK7NFVZePJBv6yoiWbDE2K39Q3AzTm6iCm1knE/gZFg+wUU03oKOpBFjgI4/LViDu+X3y1vI89P9KK2me19qucxZ2IOW0RooJZffgRJ5diHwkVL/F
 FmXkx+YFLy2D4EcmqJD3WWANwTtr1WTjLsxtjZvD0vhdHuzlnbvXSv4/0F4fdd/g5ThqzN+lKjoE/1pGSyNfGHPT6sXctD0vqc9n/krompLLQ2fVid3hE2AY
 fxsJbfMci/xcHdWtHunUbTFFzG/bvmU31RNKaZP1xPbtRPw8oRZnbuGbbxY00fvDghxQnW7zMN9esfQBTfhPZtyV24mr0g==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series adds support for decoding multi-slice H264 frames along with
support for V4L2_DEC_CMD_FLUSH and V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF.

This has only been compile-tested. Jernej, can you test with ffmpeg?

This series is based on https://www.spinics.net/lists/linux-media/msg158081.html
plus ideas from https://www.spinics.net/lists/linux-media/msg158625.html.

Changes since v2:

- Move the code to detect if a capture buffer is done to
  the v4l2-mem2mem core framework.
- Move the first-slice detection to the core as well.
- Add a new v4l2_m2m_buf_done_and_job_finish() function that
  finishes a job taking held capture buffers into account.
  Marking buffers as done and finishing the job has to be
  done with job_spinlock held to avoid race conditions with
  v4l2_m2m_ioctl_stateless_decoder_cmd().
- v4l2_m2m_ioctl_stateless_decoder_cmd takes the job_spinlock
  to prevent race conditions.

Regards,

        Hans

Hans Verkuil (4):
  vb2: add V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF
  v4l2-mem2mem: support held capture buffers
  videodev2.h: add V4L2_DEC_CMD_FLUSH
  v4l2-mem2mem: add new_frame detection

Jernej Skrabec (4):
  media: v4l2-mem2mem: add stateless_(try_)decoder_cmd ioctl helpers
  media: cedrus: Detect first slice of a frame
  media: cedrus: h264: Support multiple slices per frame
  media: cedrus: Add support for holding capture buffer

 Documentation/media/uapi/v4l/buffer.rst       |  13 ++
 .../media/uapi/v4l/vidioc-decoder-cmd.rst     |  10 +-
 .../media/uapi/v4l/vidioc-reqbufs.rst         |   6 +
 .../media/videodev2.h.rst.exceptions          |   1 +
 .../media/common/videobuf2/videobuf2-v4l2.c   |  12 +-
 drivers/media/v4l2-core/v4l2-mem2mem.c        | 188 +++++++++++++++---
 drivers/staging/media/sunxi/cedrus/cedrus.h   |   1 +
 .../staging/media/sunxi/cedrus/cedrus_dec.c   |   1 +
 .../staging/media/sunxi/cedrus/cedrus_h264.c  |  12 +-
 .../staging/media/sunxi/cedrus/cedrus_hw.c    |  16 +-
 .../staging/media/sunxi/cedrus/cedrus_video.c |  14 ++
 include/media/v4l2-mem2mem.h                  |  44 +++-
 include/media/videobuf2-core.h                |   3 +
 include/media/videobuf2-v4l2.h                |   5 +
 include/uapi/linux/videodev2.h                |  14 +-
 15 files changed, 283 insertions(+), 57 deletions(-)

-- 
2.23.0

