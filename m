Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD76B103A37
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2019 13:41:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729780AbfKTMlO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Nov 2019 07:41:14 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:42042 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728001AbfKTMlK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Nov 2019 07:41:10 -0500
Received: by mail-ed1-f65.google.com with SMTP id m13so20138690edv.9
        for <linux-media@vger.kernel.org>; Wed, 20 Nov 2019 04:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q+55S+QuaO7Th4WX3Vhb1ULyGdTHdLCacptPup2Qy0E=;
        b=RfOzJ494tIm42VFJ2nHTZjMUE2E9u1fIhqHULNHcdGVgr5NCf6crR8AO8m63508fHy
         5z0lddyOQ1hTIWTEQuviag10+HZ4MGBs+Ec1U0WaOq2a3Pck6yn36lphZIXzHOy/Y4hT
         Dmlr8bJZhQLW1HHjaloUCzjBtEsrc1Qtiir9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q+55S+QuaO7Th4WX3Vhb1ULyGdTHdLCacptPup2Qy0E=;
        b=bE3D5pf3P5EjZdzmGz/Bre3PWBTYu/rtSAvKfjuVVP4d8M+/ynlwuV8cHUk0kMXpLm
         8JmKSpG20g1nulIUBVJxDwoWiUP8E8j3/Mlqjrg1Mp9Hy6rbRhAgJceNAFyBeeiD4Hrc
         S2UfMiv86UE0d3lZOqJfKdxrMp9NCExF+HBxl4Fb5+aMnPuvXR8rupdkkusPB7rJjGaJ
         NWZLhvf3pC+rvdRslFiZg1jw+KlNJrewvVVq7IAPX9mrkh04NslHS1WIRoMv6v3kWA6G
         UEgYg0aRVd0xzZQxCoZk60kVrpuLaHlzeiXwj50voTp9UJhP7LJVbpth57UH5ciV+pik
         JssA==
X-Gm-Message-State: APjAAAUjVNQSTKupyrT7E+TCJx4pQzvGsQBGTgxymgF6wCdX2VRORjWZ
        MkfHlFdQo024IPCBXPXmc0ttJLTCZLed8Q==
X-Google-Smtp-Source: APXvYqyIkMW5CDxiqDFuWA1xANaLmYTGTQEKCsrQW67jp/9Kndu3Xuh6n/drJNBtvEhWJjEKjsQrBQ==
X-Received: by 2002:a17:906:5c4d:: with SMTP id c13mr5130358ejr.80.1574253666163;
        Wed, 20 Nov 2019 04:41:06 -0800 (PST)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id p5sm338909edi.9.2019.11.20.04.41.04
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2019 04:41:05 -0800 (PST)
Received: by mail-wm1-f42.google.com with SMTP id l17so6837558wmh.0
        for <linux-media@vger.kernel.org>; Wed, 20 Nov 2019 04:41:04 -0800 (PST)
X-Received: by 2002:a1c:40c1:: with SMTP id n184mr3122697wma.116.1574253664291;
 Wed, 20 Nov 2019 04:41:04 -0800 (PST)
MIME-Version: 1.0
References: <HE1PR06MB4011EDD5F2686A05BC35F61CAC790@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <HE1PR06MB4011A23596DCD988F2CAC603AC790@HE1PR06MB4011.eurprd06.prod.outlook.com>
In-Reply-To: <HE1PR06MB4011A23596DCD988F2CAC603AC790@HE1PR06MB4011.eurprd06.prod.outlook.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 20 Nov 2019 21:40:52 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CPpHH74fZJZdFfju0VXp+swXxCmzcWJ8=c8wi3Tje7CA@mail.gmail.com>
Message-ID: <CAAFQd5CPpHH74fZJZdFfju0VXp+swXxCmzcWJ8=c8wi3Tje7CA@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] media: hantro: Fix H264 motion vector buffer offset
To:     Jonas Karlman <jonas@kwiboo.se>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jonas,

On Thu, Nov 7, 2019 at 7:34 AM Jonas Karlman <jonas@kwiboo.se> wrote:
>
> A decoded 8-bit 4:2:0 frame need memory for up to 448 bytes per
> macroblock and is laid out in memory as follow:
>
> +---------------------------+
> | Y-plane   256 bytes x MBs |
> +---------------------------+
> | UV-plane  128 bytes x MBs |
> +---------------------------+
> | MV buffer  64 bytes x MBs |
> +---------------------------+
>
> The motion vector buffer offset is currently correct for 4:2:0 because the
> extra space for motion vectors is overallocated with an extra 64 bytes x MBs.
>
> Wrong offset for both destination and motion vector buffer are used
> for the bottom field of field encoded content, wrong offset is
> also used for 4:0:0 (monochrome) content.
>
> Fix this by setting the motion vector address to the expected 384 bytes x MBs
> offset for 4:2:0 and 256 bytes x MBs offset for 4:0:0 content.
>
> Also use correct destination and motion vector buffer offset
> for the bottom field of field encoded content.
>
> While at it also extend the check for 4:0:0 (monochrome) to include an
> additional check for High Profile (100).
>
> Fixes: dea0a82f3d22 ("media: hantro: Add support for H264 decoding on G1")
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
> Changes in v3:
>   * address remarks from Boris
>   - use src_fmt instead of dst_fmt
> Changes in v2:
>   * address remarks from Philipp and Ezequiel
>   - update commit message
>   - rename offset to bytes_per_mb
>   - remove MV_OFFSET macros
>   - move PIC_MB_WIDTH/HEIGHT_P change to separate patch
> ---
>  .../staging/media/hantro/hantro_g1_h264_dec.c | 31 +++++++++++++------
>  1 file changed, 22 insertions(+), 9 deletions(-)
>

First of all, thanks for the patches! Good to see more members of the
community contributing to the driver.

Please find my comments inline.

> diff --git a/drivers/staging/media/hantro/hantro_g1_h264_dec.c b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> index 70a6b5b26477..30d977c3d529 100644
> --- a/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> +++ b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> @@ -81,7 +81,7 @@ static void set_params(struct hantro_ctx *ctx)
>                 reg |= G1_REG_DEC_CTRL4_CABAC_E;
>         if (sps->flags & V4L2_H264_SPS_FLAG_DIRECT_8X8_INFERENCE)
>                 reg |= G1_REG_DEC_CTRL4_DIR_8X8_INFER_E;
> -       if (sps->chroma_format_idc == 0)
> +       if (sps->profile_idc >= 100 && sps->chroma_format_idc == 0)

I'd rather make this a separate patch with proper explanation in commit message.

>                 reg |= G1_REG_DEC_CTRL4_BLACKWHITE_E;
>         if (pps->flags & V4L2_H264_PPS_FLAG_WEIGHTED_PRED)
>                 reg |= G1_REG_DEC_CTRL4_WEIGHT_PRED_E;
> @@ -234,6 +234,7 @@ static void set_buffers(struct hantro_ctx *ctx)
>         struct vb2_v4l2_buffer *src_buf, *dst_buf;
>         struct hantro_dev *vpu = ctx->dev;
>         dma_addr_t src_dma, dst_dma;
> +       size_t offset = 0;
>
>         src_buf = hantro_get_src_buf(ctx);
>         dst_buf = hantro_get_dst_buf(ctx);
> @@ -244,18 +245,30 @@ static void set_buffers(struct hantro_ctx *ctx)
>
>         /* Destination (decoded frame) buffer. */
>         dst_dma = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
> -       vdpu_write_relaxed(vpu, dst_dma, G1_REG_ADDR_DST);
> +       /* Adjust dma addr to start at second line for bottom field */
> +       if (ctrls->slices[0].flags & V4L2_H264_SLICE_FLAG_BOTTOM_FIELD)
> +               offset = ALIGN(ctx->src_fmt.width, MB_DIM);

Isn't ctx->src_fmt.width already aligned to MB_DIM?

Also, offset is in bytes, so should we rather use the bytesperline field?

> +       vdpu_write_relaxed(vpu, dst_dma + offset, G1_REG_ADDR_DST);
>
>         /* Higher profiles require DMV buffer appended to reference frames. */
>         if (ctrls->sps->profile_idc > 66 && ctrls->decode->nal_ref_idc) {
> -               size_t pic_size = ctx->h264_dec.pic_size;
> -               size_t mv_offset = round_up(pic_size, 8);
> -
> +               unsigned int bytes_per_mb = 384;
> +
> +               /* DMV buffer for monochrome start directly after Y-plane */
> +               if (ctrls->sps->profile_idc >= 100 &&
> +                   ctrls->sps->chroma_format_idc == 0)
> +                       bytes_per_mb = 256;

nit: Adding a blank line here would make it much easier to read.

> +               offset = bytes_per_mb * MB_WIDTH(ctx->src_fmt.width) *
> +                        MB_HEIGHT(ctx->src_fmt.height);

It's kind of difficult to follow with this idea of bytes_per_mb IMHO.
Would it perhaps make sense to rewrite the code as below?

luma_size = ctx->src_fmt.planes[0].bytesperline * ctx->src_fmt.height;

if (ctrls->sps->profile_idc >= 100 &&
    ctrls->sps->chroma_format_idc == 0)
        chroma_size = 0;
else
        chroma_size = ctx->src_fmt.planes[0].bytesperline *
ctx->src_fmt.height / 4;

offset = luma_size + chroma_size;

Also, the code only handles 4:2:0 and 4:0:0. How about 4:2:2?

Best regards,
Tomasz

> +
> +               /*
> +                * DMV buffer is split in two for field encoded frames,
> +                * adjust offset for bottom field
> +                */
>                 if (ctrls->slices[0].flags & V4L2_H264_SLICE_FLAG_BOTTOM_FIELD)
> -                       mv_offset += 32 * MB_WIDTH(ctx->dst_fmt.width);
> -
> -               vdpu_write_relaxed(vpu, dst_dma + mv_offset,
> -                                  G1_REG_ADDR_DIR_MV);
> +                       offset += 32 * MB_WIDTH(ctx->src_fmt.width) *
> +                                 MB_HEIGHT(ctx->src_fmt.height);
> +               vdpu_write_relaxed(vpu, dst_dma + offset, G1_REG_ADDR_DIR_MV);
>         }
>
>         /* Auxiliary buffer prepared in hantro_g1_h264_dec_prepare_table(). */
> --
> 2.17.1
>
