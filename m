Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2968E36E61C
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 09:37:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237215AbhD2HiG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 03:38:06 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:42615 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229814AbhD2HhJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 03:37:09 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id c1D6lpGQjiDzSc1DAlkTFj; Thu, 29 Apr 2021 09:35:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1619681749; bh=e+nJscNVv3JQsbWlwn5P4urVvkcZ/Jr/l81JInVCgRw=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=GVTSyQ24Ogjk7I4tcaOqHj0W0Att+FfuPHcIwMezqkIbVqhrMd/W5X4ncDoneaURz
         z2vD4hpyFjhRT4tdg3jI89Sc0LEnEC3he9AeSK7zlddKZKvubirLayp9QpllJv0OVr
         QfOWL1H/pPhLltuBzYQs+VbZJKTkcn3q+g6RDAqsiMLbK/8qPC4vVFdxhvBUalfqW9
         F5zzcwrDFVTsMMBDzLB9eTYB2YpJUG3904OAcKO/4nbrGutTLR0LAIzQltkewsDsR2
         MzRRfwqhs4EdZpwCo/ATM+aO4EKW005T8uQRAHdK3/xLC46BS4UsbrMvp+0zCCOH2c
         JX685SJ56JWqg==
Subject: Re: [PATCH v4 00/15] media: mtk-vcodec: support for MT8183 decoder
To:     Alexandre Courbot <acourbot@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org
References: <20210427111526.1772293-1-acourbot@chromium.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <34782bc5-d891-8eef-d370-6cfcc547166a@xs4all.nl>
Date:   Thu, 29 Apr 2021 09:35:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210427111526.1772293-1-acourbot@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfBegxNwO7sjie5TrkNagJYw+HjzrJ7Zn+5Qg+SpHhR+WqQNGXlOvvaRUlXTd3rM9W28JFL81MTlv7IIDbIRAoZQRCq6qOMfu5R5wBxhuqrgrdOWVQFvV
 dVRMFwiWslx7Fwdr0AzDsqwgbLBjBtX/brx/cV8umxRe8FwHBG2SRX3960fsiLD8JXFVEMavXUzt1XF/D5AErhsZp8D1k7BVglju9naOtYGgNwmxtfIUyEME
 VjH/zBOQhW5Qz74NO8CTjQFLrjMGmlNlUgvR9YphAodAYbwJzjkIfRK5Q5ImnWKROWEqxhvXmaRg9TsRqMQc8yY7EC2h86Ygrpl2hxqsPFIuLv92CwguIBXF
 8vCu31qhm5SSYKEMrCTBMzOpKipLUlGVUPYqZO1dUL0sqwrv5Zvuk4v5uNEwmt30kM5Bmg7GjxF3AHV4hfQL0D+m4C11Z0snRZtzWyNSl3JW6o8LtK4EA1bl
 qxxH0YJD5uQ01RLCtdRG2FS6OfEXfNxkfTUGeA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27/04/2021 13:15, Alexandre Courbot wrote:
> This series adds support for the stateless API into mtk-vcodec, by first
> separating the stateful ops into their own source file, and introducing
> a new set of ops suitable for stateless decoding. As such, support for
> stateful decoders should remain completely unaffected.
> 
> This series has been tested with both MT8183 and MT8173. Decoding was
> working for both chips, and in the case of MT8173 no regression has been
> noticed.
> 
> Patches 1-9 add MT8183 support to the decoder using the stateless API.
> MT8183 only support H.264 acceleration.
> 
> Patches 10-15 are follow-ups that further improve compliance for the
> decoder and encoder, by fixing support for commands on both. Patch 11
> also makes sure that supported H.264 profiles are exported on MT8173.

For a v5 I would recommend that - where possible - these 'improve compliance'
patches are moved to the beginning of the series. That way they can be picked
up quickly without having to wait for the whole series to be accepted.

Regards,

	Hans

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
>   media: mtk-vcodec: vdec: handle firmware version field
>   media: mtk-vcodec: support version 2 of decoder firmware ABI
>   media: add Mediatek's MM21 format
>   dt-bindings: media: document mediatek,mt8183-vcodec-dec
>   media: mtk-vcodec: vdec: use helpers in VIDIOC_(TRY_)DECODER_CMD
>   media: mtk-vcodec: vdec: clamp OUTPUT resolution to hardware limits
>   media: mtk-vcodec: make flush buffer reusable by encoder
>   media: mtk-vcodec: venc: support START and STOP commands
> 
> Hirokazu Honda (1):
>   media: mtk-vcodec: vdec: Support H264 profile control
> 
> Hsin-Yi Wang (1):
>   media: mtk-vcodec: venc: make sure buffer exists in list before
>     removing
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
>  drivers/media/platform/Kconfig                |   2 +
>  drivers/media/platform/mtk-vcodec/Makefile    |   3 +
>  .../platform/mtk-vcodec/mtk_vcodec_dec.c      | 818 +++---------------
>  .../platform/mtk-vcodec/mtk_vcodec_dec.h      |  28 +-
>  .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  66 +-
>  .../mtk-vcodec/mtk_vcodec_dec_stateful.c      | 667 ++++++++++++++
>  .../mtk-vcodec/mtk_vcodec_dec_stateless.c     | 370 ++++++++
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
>  20 files changed, 2293 insertions(+), 723 deletions(-)
>  create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
>  create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
>  create mode 100644 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
> 
> --
> 2.31.1.498.g6c1eba8ee3d-goog
> 

