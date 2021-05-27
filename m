Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E788D392938
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 10:08:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235087AbhE0IJt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 May 2021 04:09:49 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:59023 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229793AbhE0IJt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 May 2021 04:09:49 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id mB3plaVOCVN4kmB3slNcXi; Thu, 27 May 2021 10:08:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1622102895; bh=5LIlnKliUzmvBxewoH5nL1xb3w4buWTu/k3+pHw1gwk=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Lr+h0hV5xuGnWeHosj7z+qGrbQzAWouRW1XG8RcsIveAX2kn/acW3ZsJ5VWZ16JJu
         Jk2NncbDr2pgehgNj6IBBme4KKOPps03gPLwI9OGqLEeJofMwCTOJqsF11jkCj9sGM
         3qyrN+Mb9uN9txSlxYrbYoIj4XS6KW0Yz9vV9dp/syKV8/bgGj1LazqF7bOYkyqzYG
         t+rsmTqX0m7RDNufHtk4ZcmctZYyiFhM8yQwMo9N3G4EjP+8s7jdyvAZ/wi8OG25H1
         oQ1EglQmU4tcgxy7ArPhs0M84HwePDtvEoQ15xQdd4PeWBAWwY/GYurE0M0iEzXB5Z
         NBc59cBKJqbuw==
Subject: Re: [PATCH v5 00/14] media: mtk-vcodec: support for MT8183 decoder
To:     Alexandre Courbot <acourbot@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org
References: <20210519143011.1175546-1-acourbot@chromium.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <ed6610cb-5164-4185-f7c9-6d872ea16ec7@xs4all.nl>
Date:   Thu, 27 May 2021 10:08:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210519143011.1175546-1-acourbot@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfH+45w8wpmjxur/OI64pQjjjtsYE7fGqfPJ1UkDh/mSiWZQs+T5FiyCW4UXNZtNLofMxvRxeWgB1GFF5+NcBBAhtVjKjj3Um2QJaetd3JfS6/Q9BU9BZ
 hTAAjcl9VnKvsmEcXaO75N2Tm3kB5gDafG0wiMKvb/jq709uYLbgLo7iirUuEbsllN0H/IFNGVSJZYXY+vNHL2KR5PcGjOQJM+XbNDRKsqFNHzSon6GxqeaD
 HpIt2veeEcqxhHLhQ/q5aNV1nBeSSiEgnGFtEp5id4T24Pt2gisOL/+JKdHQgBIZFazcKfDbKZGEvFbS8dRaSYzsdH6v3cP8R5ChMcMdTBFCvB2ht4K+iU8m
 97RyDlSm7t7uFJ6pTRoDuu6l1cCwYb9EnB8JwYKgQjd2L3rSKH2ZTweK1Bhf+iff2B1D6e+/pcqxii33RVMvvHSP1XEl0qpG/Ecl6VRvg6ZNkhOQSS4Da95Y
 Hu5PN6Lfub/NdxTgNyoOGmfeuQ0+WuTOLmjLU1trP8D0xMezcmM5bw16yEk=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexandre,

On 19/05/2021 16:29, Alexandre Courbot wrote:
> This series adds support for the stateless API into mtk-vcodec, by first
> separating the stateful ops into their own source file, and introducing
> a new set of ops suitable for stateless decoding. As such, support for
> stateful decoders should remain completely unaffected.
> 
> This series has been tested with both MT8183 and MT8173. Decoding was
> working for both chips, and in the case of MT8173 no regression has been
> spotted.
> 
> Patches 1-5 fix a few compliance issues with the decoder and encoder, most
> notably by adding support for the START and STOP command for the latter. These
> patches were last in the previous series but have been moved to the beginning so
> they can be applied sooner.
> 
> Patches 6-9 separates the "stateful" part of the driver into its own file and
> add support for the new firmware and pixel format used by MT8183.
> 
> Patches 10-14 add support for H.264 stateless decoding and MT8183.
> 
> Changes since v4:
> * Moved compliance fix patches to the head of the series.
> * Select MEDIA_CONTROLLER_REQUEST_API.
> * Properly capitalize MM21's format description string.
> * Reorganize stateless code as suggested by Hans.
> * Fix compilation errors when DEBUG is defined.
> * Merge double-free fixup patch into the patch that introduced the issue (was
>   a separate patch coming right after the one introducing the issue).
> 
> Changes since v3:
> * Stop checking that controls are set for every request.
> * Add V4L2_CID_STATELESS_H264_START_CODE control.
> * Stop mapping OUTPUT buffers and getting the NAL type from them, use the
>   nal_ref_idc field instead.
> * Make V4L2_CID_MIN_BUFFERS_FOR_CAPTURE control stateful-only.
> * Set vb2_buffer's field to V4L2_FIELD_NONE in buffer validation hook.
> 
> Changes since v2:
> * Add follow-up patches fixing support for START/STOP commands for the
>   encoder, and stateful decoder.
> 
> Alexandre Courbot (8):
>   media: mtk-vcodec: vdec: use helpers in VIDIOC_(TRY_)DECODER_CMD
>   media: mtk-vcodec: vdec: clamp OUTPUT resolution to hardware limits
>   media: mtk-vcodec: make flush buffer reusable by encoder
>   media: mtk-vcodec: venc: support START and STOP commands
>   media: mtk-vcodec: vdec: handle firmware version field
>   media: mtk-vcodec: support version 2 of decoder firmware ABI
>   media: add Mediatek's MM21 format
>   dt-bindings: media: document mediatek,mt8183-vcodec-dec
> 
> Hirokazu Honda (1):
>   media: mtk-vcodec: vdec: Support H264 profile control
> 
> Yunfei Dong (5):
>   media: mtk-vcodec: vdec: move stateful ops into their own file
>   media: mtk-vcodec: vdec: support stateless API
>   media: mtk-vcodec: vdec: support stateless H.264 decoding
>   media: mtk-vcodec: vdec: add media device if using stateless api
>   media: mtk-vcodec: enable MT8183 decoder

Running scripts/checkpatch.pl --strict over this patch series gives
a lot of warnings and checks. A lot of these look like they are easy
to fix and reasonable.

Regards,

	Hans

> 
>  .../bindings/media/mediatek-vcodec.txt        |   1 +
>  .../media/v4l/pixfmt-reserved.rst             |   7 +
>  drivers/media/platform/Kconfig                |   3 +
>  drivers/media/platform/mtk-vcodec/Makefile    |   3 +
>  .../platform/mtk-vcodec/mtk_vcodec_dec.c      | 817 +++---------------
>  .../platform/mtk-vcodec/mtk_vcodec_dec.h      |  27 +-
>  .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  66 +-
>  .../mtk-vcodec/mtk_vcodec_dec_stateful.c      | 668 ++++++++++++++
>  .../mtk-vcodec/mtk_vcodec_dec_stateless.c     | 366 ++++++++
>  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  58 +-
>  .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 135 ++-
>  .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |   4 +
>  .../mtk-vcodec/vdec/vdec_h264_req_if.c        | 780 +++++++++++++++++
>  .../media/platform/mtk-vcodec/vdec_drv_if.c   |   3 +
>  .../media/platform/mtk-vcodec/vdec_drv_if.h   |   1 +
>  .../media/platform/mtk-vcodec/vdec_ipi_msg.h  |  23 +-
>  .../media/platform/mtk-vcodec/vdec_vpu_if.c   |  43 +-
>  .../media/platform/mtk-vcodec/vdec_vpu_if.h   |   5 +
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
>  include/uapi/linux/videodev2.h                |   1 +
>  20 files changed, 2290 insertions(+), 722 deletions(-)
>  create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
>  create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
>  create mode 100644 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
> 
> --
> 2.31.1.751.gd2f1c929bd-goog
> 

