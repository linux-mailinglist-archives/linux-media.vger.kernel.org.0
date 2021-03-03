Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EA1B32C7AF
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 02:11:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1391158AbhCDAci (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Mar 2021 19:32:38 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38998 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1388022AbhCCU2G (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Mar 2021 15:28:06 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id D5FFF1F46025
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com
Subject: [PATCH v2 0/8] V4L2 stateless VP8 de-staging
Date:   Wed,  3 Mar 2021 17:27:06 -0300
Message-Id: <20210303202714.212394-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

After close scrutiny of the VP8 specification, it seems
the VP8 stateless API is ready.

This series contains a series of clean-ups and improvement:
renaming symbols for consistency, documenting things for clarity,
and then moves the control to proper V4L2 headers.

It must be noted that, unlike parsed H.264, V4L2_PIX_FMT_VP8_FRAME
buffers must contain the VP8 frame header. In others words
a VP8 parsed frame buffer is:

  +--------+-----------------------------------------------------+-----+------------+  
  | tag 3B | extra 7B | header | MB data | DCT size | DCT part 0 | ... | DCT part N |  
  +--------+-----------------------------------------------------+-----+------------+  

Hopefully the pixel format documentation is now clear about that.

Support in Cedrus and Hantro is available upstream, and Mediatek
support is available downstream [1] which uses the API as-is.

This was tested with GStreamer v4l2codec element and Fluster [2]
conformance test, on a Hantro G1 device.

Changelog:

v2: * Rename VP8_FRAME_IS_KEY_FRAME

[1] https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2614338/21/
[2] https://github.com/fluendo/fluster

Ezequiel Garcia (8):
  media: uapi: vp8: Remove "header" from symbol names and macros
  media: uapi: vp8: Rename v4l2_vp8_loopfilter to v4l2_vp8_loop_filter
  media: uapi: vp8: Add proper kernel-doc documentation
  media: uapi: Move parsed VP8 pixel format out of staging
  media: uapi: Move the VP8 stateless control type out of staging
  media: controls: Log VP8 stateless control in .std_log
  media: uapi: Rename V4L2 VP8 specific macro to V4L2_VP8_
  media: uapi: move VP8 stateless controls out of staging

 .../media/v4l/ext-ctrls-codec-stateless.rst   | 318 +++++++++++++++++
 .../media/v4l/ext-ctrls-codec.rst             | 323 ------------------
 .../media/v4l/pixfmt-compressed.rst           |  15 +-
 .../media/v4l/vidioc-g-ext-ctrls.rst          |   4 +
 .../media/v4l/vidioc-queryctrl.rst            |   6 +
 .../media/videodev2.h.rst.exceptions          |   1 +
 drivers/media/v4l2-core/v4l2-ctrls.c          |  39 ++-
 drivers/staging/media/hantro/hantro_drv.c     |   2 +-
 .../staging/media/hantro/hantro_g1_vp8_dec.c  |  55 ++-
 drivers/staging/media/hantro/hantro_hw.h      |   2 +-
 drivers/staging/media/hantro/hantro_vp8.c     |  10 +-
 .../media/hantro/rk3399_vpu_hw_vp8_dec.c      |  55 ++-
 drivers/staging/media/sunxi/cedrus/cedrus.c   |   2 +-
 drivers/staging/media/sunxi/cedrus/cedrus.h   |   2 +-
 .../staging/media/sunxi/cedrus/cedrus_dec.c   |   2 +-
 .../staging/media/sunxi/cedrus/cedrus_vp8.c   | 113 +++---
 include/media/v4l2-ctrls.h                    |   5 +-
 include/media/vp8-ctrls.h                     | 114 -------
 include/uapi/linux/v4l2-controls.h            | 195 +++++++++++
 include/uapi/linux/videodev2.h                |   4 +
 20 files changed, 677 insertions(+), 590 deletions(-)
 delete mode 100644 include/media/vp8-ctrls.h

-- 
2.30.0

