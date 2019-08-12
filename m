Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 257A589C44
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2019 13:05:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728016AbfHLLFU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Aug 2019 07:05:20 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:52265 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727235AbfHLLFT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Aug 2019 07:05:19 -0400
Received: from tschai.fritz.box ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id x88XhQAyTur8Tx88bhi10e; Mon, 12 Aug 2019 13:05:17 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>
Subject: [PATCHv2 00/12] Stateful/stateless codec core support
Date:   Mon, 12 Aug 2019 13:05:01 +0200
Message-Id: <20190812110513.23774-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfCOhU3mComj6wOMUMmIgX6kMEGYiilghGTghsKF26cS8V6qhlMZ0sxTFXtwWxY602VoF14SnMx3xLg5cAXtZ1vrwOqX1/yu0Ajr+GSJicyQJ9izBWTdo
 t5CaWFqAhPq3ExwxEzLEz334s1wIdWJLHw1L6zATQpuBDOHAyBqHXtZVDLUOWthwYNYX9vEV6NQjSG2M/JJtojsyMqEMSFLbmdhJbF9SpjDzOvrOqMgcil5x
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series consolidates various patches/patch series that add
features or document memory-to-memory video codec interfaces.

This includes patches adding V4L2_FMT_FLAG_DYN_RESOLUTION,
new code adding V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM, new code
adding V4L2_DEC_CMD_FLUSH, patches adding V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF
(now with documentation) and patches documenting the stateful
encoder/decoder and stateless decoder.

The stateful encoder documentation is still RFC quality (there are
open TODOs, see https://patchwork.kernel.org/cover/10972783/).

The stateless decoder documentation is the same as the v5 posted
by Alexandre, but with my comments incorporated.

Also added are updated pixelformat descriptions. Please review this!
I didn't update the MPEG4 format since I'm not sure what to put there.

If anyone has access to recent codec standards, then I would really
like to have the right references to 'MPEG Picture' and 'Access Unit'.
It would be good to just refer to the definition of what a Picture
or Access Unit is in the right standards.

If there are no more comments, then I want to merge patches 1-7 and
probably 8 as well (even though I think that one needs more work).

Patches 9-11 require that a stateless decoder driver is also
updated to use V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF and V4L2_DEC_CMD_FLUSH.

Changes since v1:

- Replace bitstream by bytestream as per comment from Nicolas.
- V4L2_FMT_FLAG_HAS_BITSTREAM_PARSER was renamed to
  V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM.

Regards,

        Hans

Alexandre Courbot (1):
  media: docs-rst: Document m2m stateless video decoder interface

Hans Verkuil (4):
  videodev2.h: add V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM
  pixfmt-compressed.rst: improve H264/HEVC/MPEG1+2/VP8+9 documentation
  vb2: add V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF
  videodev2.h: add V4L2_DEC_CMD_FLUSH

Maxime Jourdan (5):
  videodev2.h: add V4L2_FMT_FLAG_DYN_RESOLUTION
  media: venus: vdec: flag OUTPUT formats with V4L2_FMT_FLAG_DYN_RESOLUTION
  media: s5p_mfc_dec: set flags for OUTPUT coded formats
  media: mtk-vcodec: flag OUTPUT formats with V4L2_FMT_FLAG_DYN_RESOLUTION
  media: vicodec: set flags for vdec/stateful OUTPUT coded formats

Tomasz Figa (2):
  media: docs-rst: Document memory-to-memory video decoder interface
  media: docs-rst: Document memory-to-memory video encoder interface

 Documentation/media/uapi/v4l/buffer.rst       |   13 +
 Documentation/media/uapi/v4l/dev-decoder.rst  | 1101 +++++++++++++++++
 Documentation/media/uapi/v4l/dev-encoder.rst  |  608 +++++++++
 Documentation/media/uapi/v4l/dev-mem2mem.rst  |   10 +-
 .../media/uapi/v4l/dev-stateless-decoder.rst  |  424 +++++++
 .../media/uapi/v4l/pixfmt-compressed.rst      |   36 +-
 Documentation/media/uapi/v4l/pixfmt-v4l2.rst  |   10 +
 Documentation/media/uapi/v4l/v4l2.rst         |   12 +-
 .../media/uapi/v4l/vidioc-decoder-cmd.rst     |   52 +-
 .../media/uapi/v4l/vidioc-dqevent.rst         |   11 +-
 .../media/uapi/v4l/vidioc-encoder-cmd.rst     |   51 +-
 .../media/uapi/v4l/vidioc-enum-fmt.rst        |   16 +
 .../media/uapi/v4l/vidioc-reqbufs.rst         |    6 +
 .../media/videodev2.h.rst.exceptions          |    3 +
 .../media/common/videobuf2/videobuf2-v4l2.c   |    8 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec.c      |    4 +
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |    1 +
 drivers/media/platform/qcom/venus/core.h      |    1 +
 drivers/media/platform/qcom/venus/vdec.c      |   11 +
 .../media/platform/s5p-mfc/s5p_mfc_common.h   |    1 +
 drivers/media/platform/s5p-mfc/s5p_mfc_dec.c  |   18 +
 drivers/media/platform/vicodec/vicodec-core.c |    3 +
 include/media/v4l2-mem2mem.h                  |   42 +
 include/media/videobuf2-core.h                |    3 +
 include/media/videobuf2-v4l2.h                |    5 +
 include/uapi/linux/videodev2.h                |   20 +-
 26 files changed, 2416 insertions(+), 54 deletions(-)
 create mode 100644 Documentation/media/uapi/v4l/dev-decoder.rst
 create mode 100644 Documentation/media/uapi/v4l/dev-encoder.rst
 create mode 100644 Documentation/media/uapi/v4l/dev-stateless-decoder.rst

-- 
2.20.1

