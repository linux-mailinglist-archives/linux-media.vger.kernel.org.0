Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28674762B5
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2019 11:50:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725983AbfGZJuy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jul 2019 05:50:54 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42300 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725978AbfGZJux (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jul 2019 05:50:53 -0400
Received: by mail-wr1-f68.google.com with SMTP id x1so3849840wrr.9
        for <linux-media@vger.kernel.org>; Fri, 26 Jul 2019 02:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wLA3PFf9lWJRBezrnxaj3d1RmCj9sv29f6/CUJQS0cA=;
        b=dl9N32kBmUdrzYltTIv/7FCA/mmWDoWPIbF71BXlfBe0YOmC+DrPe88qeQ7XHmc2Yy
         fHeDJWVjXce4GEoybKBO+U5uvsglw1MwKOdIfkH+wkWZbve8DFWLtXW8Zk8sA9YyektI
         RfdE5sFygJoB2eImCP1aPpWqn+IrxjqbNKOS2dy041cOpOYO9JQo2uQxMn29saqeShTu
         miPBdqL+auErWPl5ama/AQqDj0VQT32wPou83WLQL5K5vYRnj1hI4MHZUhb/O46CCVWP
         Y536KYFmghFQNw7gqU3Nzv86eaQLVbRGjmnC29HCCSeq/nZcmed/3ozQHvr+aKqiBXY8
         U5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wLA3PFf9lWJRBezrnxaj3d1RmCj9sv29f6/CUJQS0cA=;
        b=Xjtbpyhr0x695kz2WFMigo+JPs8yOyMDHW3AwfFWXGMP7PRDz5MQevAw/KLk8BJsJ3
         fLHSEPGYMYLkBDT7X6dkrqrbMzs5O2qse/5D1SGIyoIk+3GmBUU9QOZwXUX7xq9A6G5S
         EcECXV3KDhEyKGKIkfaqneRyG+XNYQHeK2e8bOndfo+DgD34iEWNKd4I93DUn/+dqbkn
         8PwnIbDZxnRQ/ECRASl1JzwX8Lr6sW3awE7MeyaDc6kzQOo+L4ZNrB+asbaqmo5PdenZ
         TVrZZIbyPPICnA/cRCNxcRidmao2J5zhCtrtU3mwL5G4AmIiKjTSm6unuXpcaxBo7lQ6
         2u4w==
X-Gm-Message-State: APjAAAWxIVwJpkpvKg8kYglvxIYbTGmwCeahK9GaoXTvA7H1VXFDNGRb
        naLJAJBOMpicm8FJMw/3K0wqW1wsz52ljOV2Aucsqw==
X-Google-Smtp-Source: APXvYqxy3E2BpQuB8GYasJrhThy0I0mb0nO973kDwd54tL2LiOpMEu12rVJVxuazSo9zC4+47IMuHeUHoIcV3zAAju8=
X-Received: by 2002:a5d:4ec1:: with SMTP id s1mr94082510wrv.19.1564134651467;
 Fri, 26 Jul 2019 02:50:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190724112716.30288-1-hverkuil-cisco@xs4all.nl>
In-Reply-To: <20190724112716.30288-1-hverkuil-cisco@xs4all.nl>
From:   Maxime Jourdan <mjourdan@baylibre.com>
Date:   Fri, 26 Jul 2019 11:50:40 +0200
Message-ID: <CAMO6naxRxk8cLTNrfHjWspJVguA3=HLPsqne=eNhraRYjAzCZg@mail.gmail.com>
Subject: Re: [PATCH 00/14] Stateful/stateless codec core support (resend)
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 24, 2019 at 1:27 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> (There were too many recipients for my provider, so resending
> again without the zillion CCs, and in batches of 5 patches. Stupid
> spammer detection...)
>
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

Sure! I can prepare an RFC once this series lands if you wish.

> Regards,
>
>         Hans
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
> --
> 2.20.1
>

Thank you for including my series with your modifications on top.

The patches regarding stateful decoders are fine by me. To nitpick, I
would maybe rename V4L2_FMT_FLAG_HAS_BITSTREAM_PARSER to something
such as:
 - V4L2_FMT_FLAG_FLEXIBLE_BITSTREAM_PARSER
 - V4L2_FMT_FLAG_PERMISSIVE_BITSTREAM_PARSER

Since by definition a stateful decoder is able to parse the bitstream,
it could be a bit confusing to see a format without
V4L2_FMT_FLAG_HAS_BITSTREAM_PARSER, something actually quite common.
But it is all well explained in the format documentation (patch 11/14)
and is of low-ish importance, so I don't really mind either.

Maxime
