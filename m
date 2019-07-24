Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C358472CD1
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2019 13:05:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727380AbfGXLFb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jul 2019 07:05:31 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:50095 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726681AbfGXLFb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jul 2019 07:05:31 -0400
Received: from tschai.fritz.box ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id qF5Hh3g5kLqASqF5KhNDyL; Wed, 24 Jul 2019 13:05:29 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Maxime Jourdan <mjourdan@baylibre.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 00/14] Stateful/stateless codec core support
Date:   Wed, 24 Jul 2019 13:05:09 +0200
Message-Id: <20190724110523.29248-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfHTcspy1VwrGjmYaMDxR3AkHmgn15EpEQjJ1j2p9LkdB2nm4eYTMHFDYl6OB/gC5Bk4jfET5vEgS9mrUPR85F+qerV6BMmjM42wJDeBre/x5atvuPnk5
 2ouyYkAHMtDVlcUwjV6qPwYJYaCwJvyg/gfRIJk1e42ZQFG7eiyacBW1D9zDBeSl+YyrcZXO6YgInw/6xJALRG+Xvqi7v/nPQUouzwyTYiXI5/zeQFeN27Ym
 qkhnDHhUuJBto8f/wZ+aCYbIMJst6896aGzjjxSw0cVdBFGjbjinCZyukgAztcrS2cwa9XRTMdZOAjB7QFjn4eP9mszEjvuT6ylHxC0Mtm08UvPHtwSufg21
 oivNLTzFQCgSRCmaxxw5CHYDJDPlDiz8THQyuyuYbL5zYRUVBFINcB0rypMgG6OUiPSRa5hn40h4x63GKgUeRQBd4Hkwaq9FPPN2kN48FLNhGpOIpI0RBK7J
 BiMODkpyRe8PEUMwe2UYlvaI37yYoSTAIq+TZWLS/3xdLsRaLSkfwvgJwAJTcfgjngGjlA0nzU7V5sLR0AYc+XSts3DidhRsVkFywRxSOPMi8JESzGBB8HWZ
 qQw=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series consolidates various patches/patch series that add
features or document memory-to-memory video codec interfaces.

This includes patches adding V4L2_FMT_FLAG_DYN_RESOLUTION,
new code adding V4L2_FMT_FLAG_HAS_BITSTREAM_PARSER, new code
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

Changes for the stateful decoder documentation since v4:

- In the Decoding section change "multiple ``OUTPUT`` buffers generate
  one ``CAPTURE`` buffer: timestamp of the ``OUTPUT`` buffer queued last
  will be copied." to "queued first" since this corresponds to
  existing implementations.

- Document that width and height are required fields in step 4 of the
  Capture Setup.

- Mention the new ENUM_FMT flags.

Changes for the stateless decoder documentation since v5:

- Document that width and height are required fields in step 4 of the
  Capture Setup.

- Mention the new V4L2_DEC_CMD_FLUSH command to flush the last held
  capture buffer. This replaces the 'queue an empty buffer' solution.

In my view this series is ready to go in, except for the last patch
(stateful encoder).

Maxime, I didn't add the proposed V4L2_FMT_FLAG_MANUAL_RESOLUTION
flag since I think that can go in separately. I also am not 100%
happy with that name, although I can't think of a better one.

Regards,

	Hans

Alexandre Courbot (1):
  media: docs-rst: Document m2m stateless video decoder interface

Hans Verkuil (6):
  v4l2-ioctl.c: OR flags in v4l_fill_fmtdesc(), not don't overwrite
  videodev2.h: add V4L2_FMT_FLAG_HAS_BITSTREAM_PARSER
  videodev2.h.rst.exceptions: tymecode -> timecode
  vb2: add V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF
  videodev2.h: add V4L2_DEC_CMD_FLUSH
  pixfmt-compressed.rst: improve H264/HEVC/MPEG1+2/VP8+9 documentation

Maxime Jourdan (5):
  videodev2.h: add V4L2_FMT_FLAG_DYN_RESOLUTION
  media: venus: vdec: flag OUTPUT formats with
    V4L2_FMT_FLAG_DYN_RESOLUTION
  media: s5p_mfc_dec: set flags for OUTPUT coded formats
  media: mtk-vcodec: flag OUTPUT formats with
    V4L2_FMT_FLAG_DYN_RESOLUTION
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
 .../media/videodev2.h.rst.exceptions          |    7 +-
 .../media/common/videobuf2/videobuf2-v4l2.c   |    8 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec.c      |    4 +
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |    1 +
 drivers/media/platform/qcom/venus/core.h      |    1 +
 drivers/media/platform/qcom/venus/vdec.c      |   11 +
 .../media/platform/s5p-mfc/s5p_mfc_common.h   |    1 +
 drivers/media/platform/s5p-mfc/s5p_mfc_dec.c  |   18 +
 drivers/media/platform/vicodec/vicodec-core.c |    3 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |    2 +-
 include/media/v4l2-mem2mem.h                  |   42 +
 include/media/videobuf2-core.h                |    3 +
 include/media/videobuf2-v4l2.h                |    5 +
 include/uapi/linux/videodev2.h                |   20 +-
 27 files changed, 2419 insertions(+), 57 deletions(-)
 create mode 100644 Documentation/media/uapi/v4l/dev-decoder.rst
 create mode 100644 Documentation/media/uapi/v4l/dev-encoder.rst
 create mode 100644 Documentation/media/uapi/v4l/dev-stateless-decoder.rst

-- 
2.20.1

