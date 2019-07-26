Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FE6676196
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2019 11:12:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726067AbfGZJMd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jul 2019 05:12:33 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:56883 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725872AbfGZJMd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jul 2019 05:12:33 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id qwH4hIrhdAffAqwH8hWzLB; Fri, 26 Jul 2019 11:12:30 +0200
Subject: Re: [PATCH 00/14] Stateful/stateless codec core support
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
References: <20190724110523.29248-1-hverkuil-cisco@xs4all.nl>
Message-ID: <6988fc75-20dd-327e-83de-9c9e5b8a4738@xs4all.nl>
Date:   Fri, 26 Jul 2019 11:12:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190724110523.29248-1-hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLFEwxJw7mt3Sa6izYCLt5ssSmiWfKbWqLJU2iD8/2IVRXvwT4dqkR8LX4MSjemLdYKJzuLOSapaJUfN32ANPalS1XEAdWnDkfcFN5m2oLxYpAkB5xTv
 LjW5txL2BXdF5U6gPaytw25xD+jL3hoRmwWs4I2rE+x4RGpNxcxxF0ZTl7ctL9qX1DGIn/266bkn4bMuHbOe78FfWy/zMISnQGOt/3XhJjnCBIUPvPvSm+1I
 UzZG9gfE3Qt/cKvrenlvLWtTrm+yyPCbIWTYY3oH1ieHNJHGg2qvc2naaVlkge52aQakPeaepDofzSy0wUK0qVEEfL5LG0TtUG9KSWdc/JnmTtL8NU0jGw15
 z1gj4dfPQ7JVx96vM1/Xw7ZNf09O5o71iPxoYyIMBtKTEDwPEzTaQvhhU7tecMfI8M1QLgKFeAA68Uh+qPWrjMjI2kcyjOmq8IKMx09jR5XOiRuJ50ctUl5e
 9nHXFBNLvd0v33y7fVeI4MhVi3VTerYWW/pLIhno/KkzcNnd/EWonczIVaGD9Swnuz8f0L42TUpAwScvw4tBP6Pdc+WgVpeeEEBzpAQjUCrp4I8OirOq9gNH
 go8=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Just a reminder: due to problems with my provider (overly strict spammer
detection) I had to post this series again, this time without any CCs.

So the full series is here:

https://patchwork.linuxtv.org/cover/57699/

Please review. I certainly need help with "pixfmt-compressed.rst:
improve H264/HEVC/MPEG1+2/VP8+9 documentation".

Also, I only added V4L2_FMT_FLAG_HAS_BITSTREAM_PARSER to the s5p-mfc and
vicodec drivers. Please comment if other drivers also support this.

Regards,

	Hans


On 7/24/19 1:05 PM, Hans Verkuil wrote:
> This series consolidates various patches/patch series that add
> features or document memory-to-memory video codec interfaces.
> 
> This includes patches adding V4L2_FMT_FLAG_DYN_RESOLUTION,
> new code adding V4L2_FMT_FLAG_HAS_BITSTREAM_PARSER, new code
> adding V4L2_DEC_CMD_FLUSH, patches adding V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF
> (now with documentation) and patches documenting the stateful
> encoder/decoder and stateless decoder.
> 
> The stateful encoder documentation is still RFC quality (there are
> open TODOs, see https://patchwork.kernel.org/cover/10972783/).
> 
> The stateless decoder documentation is the same as the v5 posted
> by Alexandre, but with my comments incorporated.
> 
> Also added are updated pixelformat descriptions. Please review this!
> I didn't update the MPEG4 format since I'm not sure what to put there.
> 
> If anyone has access to recent codec standards, then I would really
> like to have the right references to 'MPEG Picture' and 'Access Unit'.
> It would be good to just refer to the definition of what a Picture
> or Access Unit is in the right standards.
> 
> Changes for the stateful decoder documentation since v4:
> 
> - In the Decoding section change "multiple ``OUTPUT`` buffers generate
>   one ``CAPTURE`` buffer: timestamp of the ``OUTPUT`` buffer queued last
>   will be copied." to "queued first" since this corresponds to
>   existing implementations.
> 
> - Document that width and height are required fields in step 4 of the
>   Capture Setup.
> 
> - Mention the new ENUM_FMT flags.
> 
> Changes for the stateless decoder documentation since v5:
> 
> - Document that width and height are required fields in step 4 of the
>   Capture Setup.
> 
> - Mention the new V4L2_DEC_CMD_FLUSH command to flush the last held
>   capture buffer. This replaces the 'queue an empty buffer' solution.
> 
> In my view this series is ready to go in, except for the last patch
> (stateful encoder).
> 
> Maxime, I didn't add the proposed V4L2_FMT_FLAG_MANUAL_RESOLUTION
> flag since I think that can go in separately. I also am not 100%
> happy with that name, although I can't think of a better one.
> 
> Regards,
> 
> 	Hans
> 
> Alexandre Courbot (1):
>   media: docs-rst: Document m2m stateless video decoder interface
> 
> Hans Verkuil (6):
>   v4l2-ioctl.c: OR flags in v4l_fill_fmtdesc(), not don't overwrite
>   videodev2.h: add V4L2_FMT_FLAG_HAS_BITSTREAM_PARSER
>   videodev2.h.rst.exceptions: tymecode -> timecode
>   vb2: add V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF
>   videodev2.h: add V4L2_DEC_CMD_FLUSH
>   pixfmt-compressed.rst: improve H264/HEVC/MPEG1+2/VP8+9 documentation
> 
> Maxime Jourdan (5):
>   videodev2.h: add V4L2_FMT_FLAG_DYN_RESOLUTION
>   media: venus: vdec: flag OUTPUT formats with
>     V4L2_FMT_FLAG_DYN_RESOLUTION
>   media: s5p_mfc_dec: set flags for OUTPUT coded formats
>   media: mtk-vcodec: flag OUTPUT formats with
>     V4L2_FMT_FLAG_DYN_RESOLUTION
>   media: vicodec: set flags for vdec/stateful OUTPUT coded formats
> 
> Tomasz Figa (2):
>   media: docs-rst: Document memory-to-memory video decoder interface
>   media: docs-rst: Document memory-to-memory video encoder interface
> 
>  Documentation/media/uapi/v4l/buffer.rst       |   13 +
>  Documentation/media/uapi/v4l/dev-decoder.rst  | 1101 +++++++++++++++++
>  Documentation/media/uapi/v4l/dev-encoder.rst  |  608 +++++++++
>  Documentation/media/uapi/v4l/dev-mem2mem.rst  |   10 +-
>  .../media/uapi/v4l/dev-stateless-decoder.rst  |  424 +++++++
>  .../media/uapi/v4l/pixfmt-compressed.rst      |   36 +-
>  Documentation/media/uapi/v4l/pixfmt-v4l2.rst  |   10 +
>  Documentation/media/uapi/v4l/v4l2.rst         |   12 +-
>  .../media/uapi/v4l/vidioc-decoder-cmd.rst     |   52 +-
>  .../media/uapi/v4l/vidioc-dqevent.rst         |   11 +-
>  .../media/uapi/v4l/vidioc-encoder-cmd.rst     |   51 +-
>  .../media/uapi/v4l/vidioc-enum-fmt.rst        |   16 +
>  .../media/uapi/v4l/vidioc-reqbufs.rst         |    6 +
>  .../media/videodev2.h.rst.exceptions          |    7 +-
>  .../media/common/videobuf2/videobuf2-v4l2.c   |    8 +-
>  .../platform/mtk-vcodec/mtk_vcodec_dec.c      |    4 +
>  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |    1 +
>  drivers/media/platform/qcom/venus/core.h      |    1 +
>  drivers/media/platform/qcom/venus/vdec.c      |   11 +
>  .../media/platform/s5p-mfc/s5p_mfc_common.h   |    1 +
>  drivers/media/platform/s5p-mfc/s5p_mfc_dec.c  |   18 +
>  drivers/media/platform/vicodec/vicodec-core.c |    3 +
>  drivers/media/v4l2-core/v4l2-ioctl.c          |    2 +-
>  include/media/v4l2-mem2mem.h                  |   42 +
>  include/media/videobuf2-core.h                |    3 +
>  include/media/videobuf2-v4l2.h                |    5 +
>  include/uapi/linux/videodev2.h                |   20 +-
>  27 files changed, 2419 insertions(+), 57 deletions(-)
>  create mode 100644 Documentation/media/uapi/v4l/dev-decoder.rst
>  create mode 100644 Documentation/media/uapi/v4l/dev-encoder.rst
>  create mode 100644 Documentation/media/uapi/v4l/dev-stateless-decoder.rst
> 

