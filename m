Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EC7836EA02
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 14:07:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235342AbhD2MIQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 08:08:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233922AbhD2MIQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 08:08:16 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB467C06138B;
        Thu, 29 Apr 2021 05:07:29 -0700 (PDT)
Received: from [IPv6:2a02:810a:880:f54:11ef:dfbe:29a3:d3d] (unknown [IPv6:2a02:810a:880:f54:11ef:dfbe:29a3:d3d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 867411F43410;
        Thu, 29 Apr 2021 13:07:27 +0100 (BST)
Subject: Re: [PATCH v4 00/15] media: mtk-vcodec: support for MT8183 decoder
To:     Alexandre Courbot <acourbot@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org
References: <20210427111526.1772293-1-acourbot@chromium.org>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <976d420c-b4fc-bc23-c398-9b3a7ab4ffc9@collabora.com>
Date:   Thu, 29 Apr 2021 14:07:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210427111526.1772293-1-acourbot@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 27.04.21 13:15, Alexandre Courbot wrote:
> This series adds support for the stateless API into mtk-vcodec, by first
> separating the stateful ops into their own source file, and introducing
> a new set of ops suitable for stateless decoding. As such, support for
> stateful decoders should remain completely unaffected.
> 
> This series has been tested with both MT8183 and MT8173. Decoding was
> working for both chips, and in the case of MT8173 no regression has been
> noticed.

I am trying to test the decoder with this patchset using v4l2-ctl on mt8173.

I am trying to decode an h264 file into V4L2_PIX_FMT_MT21C format.
I am not able to do it. It seems that the driver expects each buffer to start
with a nal starting code, and the v4l2-ctl command just read the files into
buffers without any parsing.

Can you share the command and the files you used for testing?

Thank you,
Dafna

> 
> Patches 1-9 add MT8183 support to the decoder using the stateless API.
> MT8183 only support H.264 acceleration.
> 
> Patches 10-15 are follow-ups that further improve compliance for the
> decoder and encoder, by fixing support for commands on both. Patch 11
> also makes sure that supported H.264 profiles are exported on MT8173.
> 
> Changes since v3:
> * Stop checking that controls are set for every request.
> * Add V4L2_CID_STATELESS_H264_START_CODE control.
> * Stop mapping OUTPUT buffers and getting the NAL type from them, use the
>    nal_ref_idc field instead.
> * Make V4L2_CID_MIN_BUFFERS_FOR_CAPTURE control stateful-only.
> * Set vb2_buffer's field to V4L2_FIELD_NONE in buffer validation hook.
> 
> Changes since v2:
> * Add follow-up patches fixing support for START/STOP commands for the
>    encoder, and stateful decoder.
> 
> Alexandre Courbot (8):
>    media: mtk-vcodec: vdec: handle firmware version field
>    media: mtk-vcodec: support version 2 of decoder firmware ABI
>    media: add Mediatek's MM21 format
>    dt-bindings: media: document mediatek,mt8183-vcodec-dec
>    media: mtk-vcodec: vdec: use helpers in VIDIOC_(TRY_)DECODER_CMD
>    media: mtk-vcodec: vdec: clamp OUTPUT resolution to hardware limits
>    media: mtk-vcodec: make flush buffer reusable by encoder
>    media: mtk-vcodec: venc: support START and STOP commands
> 
> Hirokazu Honda (1):
>    media: mtk-vcodec: vdec: Support H264 profile control
> 
> Hsin-Yi Wang (1):
>    media: mtk-vcodec: venc: make sure buffer exists in list before
>      removing
> 
> Yunfei Dong (5):
>    media: mtk-vcodec: vdec: move stateful ops into their own file
>    media: mtk-vcodec: vdec: support stateless API
>    media: mtk-vcodec: vdec: support stateless H.264 decoding
>    media: mtk-vcodec: vdec: add media device if using stateless api
>    media: mtk-vcodec: enable MT8183 decoder
> 
>   .../bindings/media/mediatek-vcodec.txt        |   1 +
>   .../media/v4l/pixfmt-reserved.rst             |   7 +
>   drivers/media/platform/Kconfig                |   2 +
>   drivers/media/platform/mtk-vcodec/Makefile    |   3 +
>   .../platform/mtk-vcodec/mtk_vcodec_dec.c      | 818 +++---------------
>   .../platform/mtk-vcodec/mtk_vcodec_dec.h      |  28 +-
>   .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  66 +-
>   .../mtk-vcodec/mtk_vcodec_dec_stateful.c      | 667 ++++++++++++++
>   .../mtk-vcodec/mtk_vcodec_dec_stateless.c     | 370 ++++++++
>   .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  58 +-
>   .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 135 ++-
>   .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |   4 +
>   .../mtk-vcodec/vdec/vdec_h264_req_if.c        | 780 +++++++++++++++++
>   .../media/platform/mtk-vcodec/vdec_drv_if.c   |   3 +
>   .../media/platform/mtk-vcodec/vdec_drv_if.h   |   1 +
>   .../media/platform/mtk-vcodec/vdec_ipi_msg.h  |  23 +-
>   .../media/platform/mtk-vcodec/vdec_vpu_if.c   |  43 +-
>   .../media/platform/mtk-vcodec/vdec_vpu_if.h   |   5 +
>   drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
>   include/uapi/linux/videodev2.h                |   1 +
>   20 files changed, 2293 insertions(+), 723 deletions(-)
>   create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
>   create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
>   create mode 100644 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
> 
> --
> 2.31.1.498.g6c1eba8ee3d-goog
> 
