Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D19F3E45A1
	for <lists+linux-media@lfdr.de>; Mon,  9 Aug 2021 14:31:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233802AbhHIMb1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Aug 2021 08:31:27 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:45325 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233528AbhHIMb0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 9 Aug 2021 08:31:26 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id D4Qnm0UzS4SnAD4QqmmSQa; Mon, 09 Aug 2021 14:31:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1628512265; bh=1JnpY81zYR22eAIMj8YwHdE2jfxpqz8Bq/xmPMsAibU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=PssgTV2OeSyUhiW/DVzPrCf9omGPJ/Zo3xyPdR7zwCUYzwbnPTDO2vLCvnqhxq0pk
         3uj6AmMP20khXXpjqS0QvXkOtCxhRh8jfGphYW9QsjfICZ+a+892NFeylQZGm2L/JK
         tfoMHqMeacH3Q4+kiFd2LoZzVan7JX0vqoUL8tl4twU5Z6Ejk2Di7kC0PA7V8QB5jr
         ch/7b8eDZ/mFX68K3ZY2UJPHE6sEQSH4mhQrvlHLTYtNTMgEGDEuvVErfsYmF20dKx
         Gen99t041S4NdCKTXKzKWEYt0g674/9HGsrUuV49Df9KqxYrBQ0jN6DVJj2jNsmQZy
         VAs84im2OCIvg==
Subject: Re: [PATCH v7 00/14] media: mtk-vcodec: support for MT8183 decoder
To:     Tzung-Bi Shih <tzungbi@google.com>, yunfei.dong@mediatek.com,
        acourbot@chromium.org
Cc:     tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
        dafna.hirschfeld@collabora.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
References: <20210806041530.4170869-1-tzungbi@google.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <104309d4-0973-cf1f-d61f-731b0642c1cf@xs4all.nl>
Date:   Mon, 9 Aug 2021 14:31:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210806041530.4170869-1-tzungbi@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKHcYEgO5nUvEjWF9VvuOaGi8Xs1S3AddrVTU30ZsQPerr20ruSyK9C6mP13FtplYyLgn3GIRdTL8qJjeXvdxRk4wKv2bTNASL7brbvlB1M074pLCp9+
 teiCCo7SSdSEPn2OiFyMfPT9O0hvPVppgzR8lhNQX50tFJyZHj1PG9iOac8ZjLB16QRKajFqWICOVuLrOlYPbwucU/QDa8RoY8vdENJD9HATjfMXDX7sOBen
 WNIt7yqeRYSK9IX145iVK/9BFJTZqMvDVZtbZzHsmMphq09UACA9xUcrMxUDl9INiD8g3sTLN9NWpz6yVudP3u4Q1cbztf1Uqn96cb2/fbR1HnNemm7nsYvX
 cf/wiHmhBsrKzcWVnZeF2s9eQ9ak24+5t04dLZvpMJGvxvtD/LjbnTdtKMgpXRwUlH6KHhtKpfeBY+sQgLcTof93xPFps4TqARAH8Ln9gPScafDxX9qnhS7+
 t3tsKybO18UAK+qgtQ+ONljCB3jKf8KlhNs82dwe6iJd1Si6q8cN9L689aXWjpRuo+sgCDFQXnq0ACGK4snT5tQ7D2Asfct2f6BrBA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tzung-Bi,

I made a PR for this series, but I would like a follow-up patch that fixes this
sparse warning:

SPARSE:mtk-vcodec/mtk_vcodec_dec_stateful.c:615:35: warning: symbol 'mtk_vdec_8173_pdata' was not declared. Should it be static?
SPARSE:mtk-vcodec/mtk_vcodec_dec_stateless.c:346:35: warning: symbol 'mtk_vdec_8183_pdata' was not declared. Should it be static?

mtk_vcodec_dec.h is probably a good header to put the extern declaration.

Regards,

	Hans

On 06/08/2021 06:15, Tzung-Bi Shih wrote:
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
> patches were last up until v4 but have been moved to the beginning so they can
> be applied sooner.
> 
> Patches 6-9 separates the "stateful" part of the driver into its own file and
> add support for the new firmware and pixel format used by MT8183.
> 
> Patches 10-14 add support for H.264 stateless decoding and MT8183.
> 
> Note that a few checkpatch issues have been left unadressed on purpose:
> * Conversion from e.g. uint32_t to u32 can't be done without breaking
>   consistency. This should be done by a driver-wide patch.
> * Some macro warning suggesting parentheses for parameters expanded as struct
>   members, which is obviously not applicable here.
> * Warnings about adding new files without an update the MAINTAINERS, which is
>   irrelevant as the new files are already covered by the existing wildcards.
> 
> Changes since v6:
> (https://patchwork.linuxtv.org/project/linux-media/cover/20210705053258.1614177-1-acourbot@chromium.org/)
> * Fix errors from 'checkpatch.pl --strict'.
> * Fix missing kerneldoc issue.
> * Fix wrong device minor number reference.
> 
> Changes since v5:
> * Rebased against latest media tree.
> * Applied most suggestions of `checkpatch.pl --strict`. Some proposed fixes were
>   not applied because they would require a larger refactoring (i.e. large-scale
>   type changes) of the code.
> * Applied Reviewed-by and fix suggestions from Tzung-bi.
> * Check for ABORT state in vidioc_encoder_cmd.
> 
> Changes since v4:
> * Reorganized fixup patches first.
> * Select MEDIA_CONTROLLER_REQUEST_API.
> * Properly capitalize MM21's format description string.
> * Reorganize stateless code as suggested by Hans.
> * Fix compilation errors when DEBUG is defined.
> * Merge double-free fixup patch into the patch that introduced the issue.
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
> 
>  .../bindings/media/mediatek-vcodec.txt        |   1 +
>  .../media/v4l/pixfmt-reserved.rst             |   7 +
>  drivers/media/platform/Kconfig                |   3 +
>  drivers/media/platform/mtk-vcodec/Makefile    |   3 +
>  .../platform/mtk-vcodec/mtk_vcodec_dec.c      | 820 +++---------------
>  .../platform/mtk-vcodec/mtk_vcodec_dec.h      |  25 +-
>  .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  68 +-
>  .../mtk-vcodec/mtk_vcodec_dec_stateful.c      | 628 ++++++++++++++
>  .../mtk-vcodec/mtk_vcodec_dec_stateless.c     | 360 ++++++++
>  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  58 +-
>  .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 140 ++-
>  .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |   6 +-
>  .../mtk-vcodec/vdec/vdec_h264_req_if.c        | 774 +++++++++++++++++
>  .../media/platform/mtk-vcodec/vdec_drv_if.c   |   3 +
>  .../media/platform/mtk-vcodec/vdec_drv_if.h   |   1 +
>  .../media/platform/mtk-vcodec/vdec_ipi_msg.h  |  23 +-
>  .../media/platform/mtk-vcodec/vdec_vpu_if.c   |  43 +-
>  .../media/platform/mtk-vcodec/vdec_vpu_if.h   |   5 +
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
>  include/uapi/linux/videodev2.h                |   1 +
>  20 files changed, 2241 insertions(+), 729 deletions(-)
>  create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
>  create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
>  create mode 100644 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
> 

