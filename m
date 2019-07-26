Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C190762FC
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2019 12:02:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725928AbfGZKCX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jul 2019 06:02:23 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:39149 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725815AbfGZKCX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jul 2019 06:02:23 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id qx3JhJDazAffAqx3MhXDtq; Fri, 26 Jul 2019 12:02:20 +0200
Subject: Re: [PATCH 00/14] Stateful/stateless codec core support (resend)
To:     Chen-Yu Tsai <wens@kernel.org>,
        Maxime Jourdan <mjourdan@baylibre.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
References: <20190724112716.30288-1-hverkuil-cisco@xs4all.nl>
 <CAMO6naxRxk8cLTNrfHjWspJVguA3=HLPsqne=eNhraRYjAzCZg@mail.gmail.com>
 <CAGb2v65p_U64aGwnq4c373VB9dN7XG=jHgzQ76XLH6-7A+j4xA@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <1660d45a-00b0-3909-84e7-1bd58bc2972d@xs4all.nl>
Date:   Fri, 26 Jul 2019 12:02:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAGb2v65p_U64aGwnq4c373VB9dN7XG=jHgzQ76XLH6-7A+j4xA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfHnXhsb8gd5vjLK0QtLd9WVEEEQ2C9tdxu+ufZYyyxY6arrWAOPYYnNCchY+Ks59u05Go6bR0GFaGlS0Z4rCIV+Rc2Fq1ra14Qgb0LrSPplg1MM8ov/J
 fr9slQ4YwMKoo1qGmqMBEnbsYVq1zHInCXUDfPE6EVnEo6F0Vc16kDOTZ5rTqh8PEhseWXRgX0LG8hOUy28+NgHc72shkIpz7oVC3P4YqjS6Bapekuh2Y0d3
 2sZOTl3ejD4dtnBojQ+AfQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 7/26/19 11:56 AM, Chen-Yu Tsai wrote:
> On Fri, Jul 26, 2019 at 5:50 PM Maxime Jourdan <mjourdan@baylibre.com> wrote:
>>
>> On Wed, Jul 24, 2019 at 1:27 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>>
>>> (There were too many recipients for my provider, so resending
>>> again without the zillion CCs, and in batches of 5 patches. Stupid
>>> spammer detection...)
>>>
>>> This series consolidates various patches/patch series that add
>>> features or document memory-to-memory video codec interfaces.
>>>
>>> This includes patches adding V4L2_FMT_FLAG_DYN_RESOLUTION,
>>> new code adding V4L2_FMT_FLAG_HAS_BITSTREAM_PARSER, new code
>>> adding V4L2_DEC_CMD_FLUSH, patches adding V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF
>>> (now with documentation) and patches documenting the stateful
>>> encoder/decoder and stateless decoder.
>>>
>>> The stateful encoder documentation is still RFC quality (there are
>>> open TODOs, see https://patchwork.kernel.org/cover/10972783/).
>>>
>>> The stateless decoder documentation is the same as the v5 posted
>>> by Alexandre, but with my comments incorporated.
>>>
>>> Also added are updated pixelformat descriptions. Please review this!
>>> I didn't update the MPEG4 format since I'm not sure what to put there.
>>>
>>> If anyone has access to recent codec standards, then I would really
>>> like to have the right references to 'MPEG Picture' and 'Access Unit'.
>>> It would be good to just refer to the definition of what a Picture
>>> or Access Unit is in the right standards.
>>>
>>> Changes for the stateful decoder documentation since v4:
>>>
>>> - In the Decoding section change "multiple ``OUTPUT`` buffers generate
>>>   one ``CAPTURE`` buffer: timestamp of the ``OUTPUT`` buffer queued last
>>>   will be copied." to "queued first" since this corresponds to
>>>   existing implementations.
>>>
>>> - Document that width and height are required fields in step 4 of the
>>>   Capture Setup.
>>>
>>> - Mention the new ENUM_FMT flags.
>>>
>>> Changes for the stateless decoder documentation since v5:
>>>
>>> - Document that width and height are required fields in step 4 of the
>>>   Capture Setup.
>>>
>>> - Mention the new V4L2_DEC_CMD_FLUSH command to flush the last held
>>>   capture buffer. This replaces the 'queue an empty buffer' solution.
>>>
>>> In my view this series is ready to go in, except for the last patch
>>> (stateful encoder).
>>>
>>> Maxime, I didn't add the proposed V4L2_FMT_FLAG_MANUAL_RESOLUTION
>>> flag since I think that can go in separately. I also am not 100%
>>> happy with that name, although I can't think of a better one.
>>>
>>
>> Sure! I can prepare an RFC once this series lands if you wish.
>>
>>> Regards,
>>>
>>>         Hans
>>>
>>> Alexandre Courbot (1):
>>>   media: docs-rst: Document m2m stateless video decoder interface
>>>
>>> Hans Verkuil (6):
>>>   v4l2-ioctl.c: OR flags in v4l_fill_fmtdesc(), not don't overwrite
>>>   videodev2.h: add V4L2_FMT_FLAG_HAS_BITSTREAM_PARSER
>>>   videodev2.h.rst.exceptions: tymecode -> timecode
>>>   vb2: add V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF
>>>   videodev2.h: add V4L2_DEC_CMD_FLUSH
>>>   pixfmt-compressed.rst: improve H264/HEVC/MPEG1+2/VP8+9 documentation
>>>
>>> Maxime Jourdan (5):
>>>   videodev2.h: add V4L2_FMT_FLAG_DYN_RESOLUTION
>>>   media: venus: vdec: flag OUTPUT formats with
>>>     V4L2_FMT_FLAG_DYN_RESOLUTION
>>>   media: s5p_mfc_dec: set flags for OUTPUT coded formats
>>>   media: mtk-vcodec: flag OUTPUT formats with
>>>     V4L2_FMT_FLAG_DYN_RESOLUTION
>>>   media: vicodec: set flags for vdec/stateful OUTPUT coded formats
>>>
>>> Tomasz Figa (2):
>>>   media: docs-rst: Document memory-to-memory video decoder interface
>>>   media: docs-rst: Document memory-to-memory video encoder interface
>>>
>>>  Documentation/media/uapi/v4l/buffer.rst       |   13 +
>>>  Documentation/media/uapi/v4l/dev-decoder.rst  | 1101 +++++++++++++++++
>>>  Documentation/media/uapi/v4l/dev-encoder.rst  |  608 +++++++++
>>>  Documentation/media/uapi/v4l/dev-mem2mem.rst  |   10 +-
>>>  .../media/uapi/v4l/dev-stateless-decoder.rst  |  424 +++++++
>>>  .../media/uapi/v4l/pixfmt-compressed.rst      |   36 +-
>>>  Documentation/media/uapi/v4l/pixfmt-v4l2.rst  |   10 +
>>>  Documentation/media/uapi/v4l/v4l2.rst         |   12 +-
>>>  .../media/uapi/v4l/vidioc-decoder-cmd.rst     |   52 +-
>>>  .../media/uapi/v4l/vidioc-dqevent.rst         |   11 +-
>>>  .../media/uapi/v4l/vidioc-encoder-cmd.rst     |   51 +-
>>>  .../media/uapi/v4l/vidioc-enum-fmt.rst        |   16 +
>>>  .../media/uapi/v4l/vidioc-reqbufs.rst         |    6 +
>>>  .../media/videodev2.h.rst.exceptions          |    7 +-
>>>  .../media/common/videobuf2/videobuf2-v4l2.c   |    8 +-
>>>  .../platform/mtk-vcodec/mtk_vcodec_dec.c      |    4 +
>>>  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |    1 +
>>>  drivers/media/platform/qcom/venus/core.h      |    1 +
>>>  drivers/media/platform/qcom/venus/vdec.c      |   11 +
>>>  .../media/platform/s5p-mfc/s5p_mfc_common.h   |    1 +
>>>  drivers/media/platform/s5p-mfc/s5p_mfc_dec.c  |   18 +
>>>  drivers/media/platform/vicodec/vicodec-core.c |    3 +
>>>  drivers/media/v4l2-core/v4l2-ioctl.c          |    2 +-
>>>  include/media/v4l2-mem2mem.h                  |   42 +
>>>  include/media/videobuf2-core.h                |    3 +
>>>  include/media/videobuf2-v4l2.h                |    5 +
>>>  include/uapi/linux/videodev2.h                |   20 +-
>>>  27 files changed, 2419 insertions(+), 57 deletions(-)
>>>  create mode 100644 Documentation/media/uapi/v4l/dev-decoder.rst
>>>  create mode 100644 Documentation/media/uapi/v4l/dev-encoder.rst
>>>  create mode 100644 Documentation/media/uapi/v4l/dev-stateless-decoder.rst
>>>
>>> --
>>> 2.20.1
>>>
>>
>> Thank you for including my series with your modifications on top.
>>
>> The patches regarding stateful decoders are fine by me. To nitpick, I
>> would maybe rename V4L2_FMT_FLAG_HAS_BITSTREAM_PARSER to something
>> such as:
>>  - V4L2_FMT_FLAG_FLEXIBLE_BITSTREAM_PARSER
>>  - V4L2_FMT_FLAG_PERMISSIVE_BITSTREAM_PARSER
>>
>> Since by definition a stateful decoder is able to parse the bitstream,
>> it could be a bit confusing to see a format without
>> V4L2_FMT_FLAG_HAS_BITSTREAM_PARSER, something actually quite common.
>> But it is all well explained in the format documentation (patch 11/14)
>> and is of low-ish importance, so I don't really mind either.
> 
> Out of curiosity, would the new flags mean people have to update
> userspace applications to check for them? I mean, stateful decoders
> already "just work" right now, don't they? At least that was my
> impression playing with the out-of-tree bcm2835-codec.

Kind of. Some stateful codecs still require userspace to do some
preparsing and give them buffers containing the Access Unit (H264).
This is what e.g. gstreamer and ffmpeg do, and so that works. But such
drivers can't handle the case where you just feed them a raw bitstream,
and that was never documented.

So we're tightening the spec reflecting what is actually used. And adding
a new flag to tell userspace that there is a full parser so you don't
have to split up the bitstream.

Regards,

	Hans
