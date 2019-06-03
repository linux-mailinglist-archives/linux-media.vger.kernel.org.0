Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A118A32EA5
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2019 13:29:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728334AbfFCL2m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jun 2019 07:28:42 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:55115 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727599AbfFCL2m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 Jun 2019 07:28:42 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud9.xs4all.net with ESMTPA
        id Xl8lhL0iUsDWyXl8ohsnTI; Mon, 03 Jun 2019 13:28:39 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Pawel Osciak <posciak@chromium.org>
Subject: [PATCHv4 0/2] Document memory-to-memory video codec interfaces
Date:   Mon,  3 Jun 2019 13:28:33 +0200
Message-Id: <20190603112835.19661-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfEPTyoh1yAThPyp6qVnqkcIDaqQrh4QjHGR9uEnzFOnNjdJUCXMk8OkYdaSMP7/O9ZfRzopWZedWy95AWlMXzPm7YpGiriybTlghkQZclQmRgV0/mum8
 RTBaX4t3K6vsqVmU1rQtRFDbf7JMpfYOmnc+HDvVMf/LCpMttppk3VGuJl5rBx6ASSab37SGb6pKdz/VoZlp4zrflyoP5gf6sADY26TBb7ycM2SeShd5WrT4
 IyxS8fhs5OhECBDqzP7BrDA2HLK75o3aO+uVDXeJciPedF7JjwmWCOyfbDvhmVV/wA9kmTLG6HHImn0XwmGFlKSK+k9WVauQ1HnKFPRURlGc4NPbqM2Ct+YG
 kEn1nMH8lOtbU1fB5gNq8TN9pZkgocZ2E+Xxzs0T9D7f+DX3WkvAslnrIrzzwm/2P/K+z5cacXhWumSDQNfpgYfR5nUkWqbCIZFPoEzMN1nnxohhnZeE38bf
 m177luwsffXgtExo
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since Thomasz was very busy with other things, I've taken over this
patch series. This v4 includes his draft changes and additional changes
from me.

This series attempts to add the documentation of what was discussed
during Media Workshops at LinuxCon Europe 2012 in Barcelona and then
later Embedded Linux Conference Europe 2014 in Düsseldorf and then
eventually written down by Pawel Osciak and tweaked a bit by Chrome OS
video team (but mostly in a cosmetic way or making the document more
precise), during the several years of Chrome OS using the APIs in
production.

Note that most, if not all, of the API is already implemented in
existing mainline drivers, such as s5p-mfc or mtk-vcodec. Intention of
this series is just to formalize what we already have.

Thanks everyone for the huge amount of useful comments to previous
versions of this series. Much of the credits should go to Pawel Osciak
too, for writing most of the original text of the initial RFC.

This v4 incorporates all known comments (let me know if I missed
something!) and should be complete for the decoder.

For the encoder there are two remaining TODOs for the API:

1) Setting the frame rate so bitrate control can make sense, since
   they need to know this information.

   Suggested solution: require support for ENUM_FRAMEINTERVALS for the
   coded pixelformats and S_PARM(OUTPUT). Open question: some drivers
   (mediatek, hva, coda) require S_PARM(OUTPUT), some (venus) allow both
   S_PARM(CAPTURE) and S_PARM(OUTPUT). I am inclined to allow both since
   this is not a CAPTURE vs OUTPUT thing, it is global to both queues.

2) Interactions between OUTPUT and CAPTURE formats.

   The main problem is what to do if the capture sizeimage is too small
   for the OUTPUT resolution when streaming starts.

   Proposal: width and height of S_FMT(OUTPUT) are used to
   calculate a minimum sizeimage (app may request more). This is
   driver-specific.

   V4L2_FMT_FLAG_FIXED_RESOLUTION is always set for codec formats
   for the encoder (i.e. we don't support mid-stream resolution
   changes for now) and V4L2_EVENT_SOURCE_CHANGE is not
   supported. See https://patchwork.linuxtv.org/patch/56478/ for
   the patch adding this flag.

   Of course, if we start to support mid-stream resolution
   changes (or other changes that require a source change event),
   then this flag should be dropped by the encoder driver and
   documentation on how to handle the source change event should
   be documented in the encoder spec. I prefer to postpone this
   until we have an encoder than can actually do mid-stream
   resolution changes.

   If sizeimage of the OUTPUT is too small for the CAPTURE
   resolution and V4L2_EVENT_SOURCE_CHANGE is not supported,
   then the second STREAMON (either CAPTURE or OUTPUT) will
   return -ENOMEM since there is not enough memory to do the
   encode.

   If V4L2_FMT_FLAG_FIXED_RESOLUTION is set (i.e. that should
   be the case for all current encoders), then any bitrate controls
   will be limited in range to what the current state (CAPTURE and
   OUTPUT formats and frame rate) supports.

Comments regarding these two encoder proposals are welcome!

Regards,

	Hans

Changes since v3:

- Lots of stylistic fixes and fixing typos/grammar/etc.

Decoder:

- width/height for S_FMT(OUTPUT):

  Expects that the output width and height is always a valid
  resolution (i.e. never 0x0), and G/S/TRY_FMT and REQBUFS will use that
  instead of returning an error. Note that this resolution is a placeholder
  until the actual resolution is parsed from the stream.

- Dropped step 3 (Query the minimum number of buffers required for the CAPTURE
  queue via VIDIOC_G_CTRL().) in the Capture Setup section. It seems to be
  a left-over from earlier versions. The same information is also in Step 10,
  so no need to have this in two places.

- Added step 5 in the Capture Setup section: set COMPOSE rectangle if needed.

- VIDIO_DECODER_CMD: document EBUSY return while draining the queue.

Encoder:

- width/height for S_FMT(CAPTURE): The width/height for the CAPTURE format
  are marked as read-only and are based on the encoders current state such
  as the OUTPUT format.

- Drop TGT_COMPOSE support in the encoder: there are currently
  no encoders that can do composing/scaling.

- Document corner cases in the Drain sequence

- Document error handling.

- VIDIO_ENCODER_CMD: document EBUSY return while draining the queue.

Changes since v2:
(https://lore.kernel.org/patchwork/cover/1002474/)
Decoder:
 - Specified that the initial source change event is signaled
   regardless of whether the client-set format matches the
   stream format.
 - Dropped V4L2_CID_MIN_BUFFERS_FOR_OUTPUT since it's meaningless
   for the bitstream input buffers of decoders.
 - Explicitly stated that VIDIOC_REQBUFS is not allowed on CAPTURE
   if the stream information is not available.
 - Described decode error handling.
 - Mentioned that timestamps can be observed after a seek to
   determine whether the CAPTURE buffers originated from before
   or after the seek.
 - Explicitly stated that after a pair of V4L2_DEC_CMD_STOP and
   V4L2_DEC_CMD_START, the decoder is not reset and preserves
   all the state.

Encoder:
 - Specified that width and height of CAPTURE format are ignored
   and always zero.
 - Explicitly noted the common use case for the CROP target with
   macroblock-unaligned video resolutions.
 - Added a reference to Request API.
 - Dropped V4L2_CID_MIN_BUFFERS_FOR_CAPTURE since it's meaningless
   for the bitstream output buffers of encoders.
 - Explicitly stated that after a pair of V4L2_ENC_CMD_STOP and
   V4L2_ENC_CMD_START, the encoder is not reset and preserves
   all the state.

General:
 - Dropped format enumeration from "Initialization", since it's already
   a part of "Querying capabilities".
 - Many spelling, grammar, stylistic, etc. changes.
 - Changed the style of note blocks.
 - Rebased onto Hans' documentation cleanup series.
   (https://patchwork.kernel.org/cover/10775407/
    https://patchwork.kernel.org/patch/10776737/)
 - Moved the interfaces under the "Video Memory-To-Memory Interface"
   section.

For changes since v1 see the v2:
https://lore.kernel.org/patchwork/cover/1002474/

For changes since RFC see the v1:
https://patchwork.kernel.org/cover/10542207/

Tomasz Figa (2):
  media: docs-rst: Document memory-to-memory video decoder interface
  media: docs-rst: Document memory-to-memory video encoder interface

 Documentation/media/uapi/v4l/dev-decoder.rst  | 1084 +++++++++++++++++
 Documentation/media/uapi/v4l/dev-encoder.rst  |  608 +++++++++
 Documentation/media/uapi/v4l/dev-mem2mem.rst  |    9 +-
 Documentation/media/uapi/v4l/pixfmt-v4l2.rst  |   10 +
 Documentation/media/uapi/v4l/v4l2.rst         |   12 +-
 .../media/uapi/v4l/vidioc-decoder-cmd.rst     |   41 +-
 .../media/uapi/v4l/vidioc-encoder-cmd.rst     |   51 +-
 7 files changed, 1779 insertions(+), 36 deletions(-)
 create mode 100644 Documentation/media/uapi/v4l/dev-decoder.rst
 create mode 100644 Documentation/media/uapi/v4l/dev-encoder.rst

-- 
2.20.1

