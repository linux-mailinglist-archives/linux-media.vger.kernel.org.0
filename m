Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8905D3C5B
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2019 11:32:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727666AbfJKJcs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Oct 2019 05:32:48 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:45709 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726869AbfJKJcs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Oct 2019 05:32:48 -0400
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:611e:26b3:263e:a49f])
        by smtp-cloud7.xs4all.net with ESMTPA
        id IrHxixmWhjZ8vIrHyiRKiU; Fri, 11 Oct 2019 11:32:46 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@siol.net>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        mripard@kernel.org, tfiga@chromium.org, jonas@kwiboo.se,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCHv4 0/6] media: cedrus: h264: Support multi-slice frames
Date:   Fri, 11 Oct 2019 11:32:39 +0200
Message-Id: <20191011093245.33366-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfJkBaniRCfh4/O+wu+0o6PLkQpwMiFQE8t4GqaBXMYUoM616wdMCuOiP4StQcbBwXvpMjWbine9AUbtdOHfynKvhiV2oBqLTzBAtlHwFDlTpYvlMuru/
 zMwHNFWoqHAB26Q9yGYFQtGgYJdGXpN6d7HmknO7wCSC9mdhjVhnEK0PUSy0+jOVjzdb4w/XZzrPElEV6m+ZM7WgzgZS6DsPBk+vkcoFpSdwgj2bsOYqRlcr
 WPkn8pinh7zxR1GVyUU5IPvG4WfDsxrd6zg7qxSyT59ezQJs1u9YwFl79cr45Gc/d+sG0zWoRjSkpSfg6LKGy2QtwqzHnQCe5XHKoySY/jA8hJhDPoHHLKN3
 WZj/kEsMTtzMFBegPAbtR/05qx33ag5wG8Cxq7jKnHjCJvzr8cMdXbWwo8aytK3pvKmokwDqhSL/x0z9GTvCS+ZLWTaZNQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series adds support for decoding multi-slice H264 frames along with
support for V4L2_DEC_CMD_FLUSH and V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF.

This has only been compile-tested. Jernej, can you test with ffmpeg?

This series is based on https://www.spinics.net/lists/linux-media/msg158081.html
plus ideas from https://www.spinics.net/lists/linux-media/msg158625.html.

Changes since v3:

- Fix two 'unused variable' warnings in patch 2.
- Dropped patch 6/8 since this is no longer needed.
- Combined patches 7/8 and 8/8.
- Dropped an unnecessary cast in 8/8.

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

Jernej Skrabec (2):
  media: v4l2-mem2mem: add stateless_(try_)decoder_cmd ioctl helpers
  media: cedrus: h264: Support multiple slices per frame

 Documentation/media/uapi/v4l/buffer.rst       |  13 ++
 .../media/uapi/v4l/vidioc-decoder-cmd.rst     |  10 +-
 .../media/uapi/v4l/vidioc-reqbufs.rst         |   6 +
 .../media/videodev2.h.rst.exceptions          |   1 +
 .../media/common/videobuf2/videobuf2-v4l2.c   |  12 +-
 drivers/media/v4l2-core/v4l2-mem2mem.c        | 190 +++++++++++++++---
 .../staging/media/sunxi/cedrus/cedrus_h264.c  |  12 +-
 .../staging/media/sunxi/cedrus/cedrus_hw.c    |  16 +-
 .../staging/media/sunxi/cedrus/cedrus_video.c |  14 ++
 include/media/v4l2-mem2mem.h                  |  44 +++-
 include/media/videobuf2-core.h                |   3 +
 include/media/videobuf2-v4l2.h                |   5 +
 include/uapi/linux/videodev2.h                |  14 +-
 13 files changed, 282 insertions(+), 58 deletions(-)

-- 
2.23.0

