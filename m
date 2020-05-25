Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C74F1E0DAD
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2020 13:47:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390361AbgEYLru (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 May 2020 07:47:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390220AbgEYLrt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 May 2020 07:47:49 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EAB4C061A0E
        for <linux-media@vger.kernel.org>; Mon, 25 May 2020 04:47:48 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id g9so14758383edr.8
        for <linux-media@vger.kernel.org>; Mon, 25 May 2020 04:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Hl7IW7DWz99YomR3QOZBXmvlxAGPmsXZQwu20AX5v3s=;
        b=buAXv4JEaQqiHrO8/RCz7HUcFTvhmEjLbUZHKrXlRHNck0Rq6D8WUDoq2L3hNja/6v
         t1syq8JezlywvTLr95huE9K/RR3oyutUWhO1IsPHTp6b/xHwqCEXwE4xS0rtsqbZ6SEL
         KwmqiMdE0QJSqHwNi1PaxzQDGEvLE0qUP4uaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hl7IW7DWz99YomR3QOZBXmvlxAGPmsXZQwu20AX5v3s=;
        b=I/3MjBsHAIQdBGbMxj3ouOQ/DKTp/5ygb44QEuTAu9lJXXKuD9ylU5CuSrMAlSHRIN
         N7xjB7Zv/131hnhbtdE9OPLwHTNmK3YRL95mENlXFxI8Teb027M8kxog1g/gSJhW3nmE
         zVnO97Xsw9m3bign4RbxtnQoabPB/Dbhyi1BbbRHF4PUaZ59wxhxotrQcocgXFtbXmZN
         8yRy/Sm4X+ampUMCjBpppCtP13cXqZH93nIPfG2hf3beFVXKbWiK1UJ1swV8k1tBTa7f
         /hqzL0smUOtt/DiAHuL/IzCt8wRaQrYgZWu1sOSdI5XSCXVlQXKsCaSjUTGa38mI47zR
         cE7A==
X-Gm-Message-State: AOAM532qjbVKz/m6EKG5d8bBWGu39MVcOpXH6EYBoVbMiYCPS58W6YLE
        REkg9XsMnJ/Rr4SB0u3aw8iQ7zbQd21OaA==
X-Google-Smtp-Source: ABdhPJz2ws9OUU2yHQI4hGFhLU/K6ZuwZstAE/b6VcB7zXGk5v0Pbina2OeMhi7oqVAtapkkkbTN0w==
X-Received: by 2002:aa7:d0d9:: with SMTP id u25mr14006598edo.377.1590407266647;
        Mon, 25 May 2020 04:47:46 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id k3sm15308872edi.60.2020.05.25.04.47.45
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2020 04:47:46 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id c3so12556782wru.12
        for <linux-media@vger.kernel.org>; Mon, 25 May 2020 04:47:45 -0700 (PDT)
X-Received: by 2002:adf:e543:: with SMTP id z3mr14323859wrm.385.1590407265383;
 Mon, 25 May 2020 04:47:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200522202130.13306-1-jonas@kwiboo.se>
In-Reply-To: <20200522202130.13306-1-jonas@kwiboo.se>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 25 May 2020 13:47:33 +0200
X-Gmail-Original-Message-ID: <CAAFQd5C7SsLET_6yHNpXnG5ozb09znOpRV1Rx8-uDpy=d4+ETQ@mail.gmail.com>
Message-ID: <CAAFQd5C7SsLET_6yHNpXnG5ozb09znOpRV1Rx8-uDpy=d4+ETQ@mail.gmail.com>
Subject: Re: [PATCH] media: rkvdec: Fix H264 scaling list order
To:     Jonas Karlman <jonas@kwiboo.se>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 22, 2020 at 10:21 PM Jonas Karlman <jonas@kwiboo.se> wrote:
>
> The Rockchip Video Decoder driver is expecting that the values in a
> scaling list are in zig-zag order and applies the inverse scanning process
> to get the values in matrix order.
>
> Commit 0b0393d59eb4 ("media: uapi: h264: clarify expected
> scaling_list_4x4/8x8 order") clarified that the values in the scaling list
> should already be in matrix order.
>
> Fix this by removing the reordering and change to use two memcpy.
>
> Fixes: cd33c830448b ("media: rkvdec: Add the rkvdec driver")
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
>  drivers/staging/media/rkvdec/rkvdec-h264.c | 70 +++++++---------------
>  1 file changed, 22 insertions(+), 48 deletions(-)
>

+Alexandre Courbot +Jeffrey Kardatzke for visibility

> diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
> index cd4980d06be7..2719f0c66a4a 100644
> --- a/drivers/staging/media/rkvdec/rkvdec-h264.c
> +++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
> @@ -18,11 +18,16 @@
>  /* Size with u32 units. */
>  #define RKV_CABAC_INIT_BUFFER_SIZE     (3680 + 128)
>  #define RKV_RPS_SIZE                   ((128 + 128) / 4)
> -#define RKV_SCALING_LIST_SIZE          (6 * 16 + 6 * 64 + 128)
>  #define RKV_ERROR_INFO_SIZE            (256 * 144 * 4)
>
>  #define RKVDEC_NUM_REFLIST             3
>
> +struct rkvdec_scaling_matrix {
> +       u8 scaling_list_4x4[6][16];
> +       u8 scaling_list_8x8[6][64];
> +       u8 padding[128];
> +};
> +
>  struct rkvdec_sps_pps_packet {
>         u32 info[8];
>  };
> @@ -86,7 +91,7 @@ struct rkvdec_ps_field {
>  /* Data structure describing auxiliary buffer format. */
>  struct rkvdec_h264_priv_tbl {
>         s8 cabac_table[4][464][2];
> -       u8 scaling_list[RKV_SCALING_LIST_SIZE];
> +       struct rkvdec_scaling_matrix scaling_list;
>         u32 rps[RKV_RPS_SIZE];
>         struct rkvdec_sps_pps_packet param_set[256];
>         u8 err_info[RKV_ERROR_INFO_SIZE];
> @@ -785,56 +790,25 @@ static void assemble_hw_rps(struct rkvdec_ctx *ctx,
>         }
>  }
>
> -/*
> - * NOTE: The values in a scaling list are in zig-zag order, apply inverse
> - * scanning process to get the values in matrix order.
> - */
> -static const u32 zig_zag_4x4[16] = {
> -       0, 1, 4, 8, 5, 2, 3, 6, 9, 12, 13, 10, 7, 11, 14, 15
> -};
> -
> -static const u32 zig_zag_8x8[64] = {
> -       0,  1,  8, 16,  9,  2,  3, 10, 17, 24, 32, 25, 18, 11,  4,  5,
> -       12, 19, 26, 33, 40, 48, 41, 34, 27, 20, 13,  6,  7, 14, 21, 28,
> -       35, 42, 49, 56, 57, 50, 43, 36, 29, 22, 15, 23, 30, 37, 44, 51,
> -       58, 59, 52, 45, 38, 31, 39, 46, 53, 60, 61, 54, 47, 55, 62, 63
> -};
> -
> -static void reorder_scaling_list(struct rkvdec_ctx *ctx,
> -                                struct rkvdec_h264_run *run)
> +static void assemble_hw_scaling_list(struct rkvdec_ctx *ctx,
> +                                    struct rkvdec_h264_run *run)
>  {
>         const struct v4l2_ctrl_h264_scaling_matrix *scaling = run->scaling_matrix;
> -       const size_t num_list_4x4 = ARRAY_SIZE(scaling->scaling_list_4x4);
> -       const size_t list_len_4x4 = ARRAY_SIZE(scaling->scaling_list_4x4[0]);
> -       const size_t num_list_8x8 = ARRAY_SIZE(scaling->scaling_list_8x8);
> -       const size_t list_len_8x8 = ARRAY_SIZE(scaling->scaling_list_8x8[0]);
>         struct rkvdec_h264_ctx *h264_ctx = ctx->priv;
>         struct rkvdec_h264_priv_tbl *tbl = h264_ctx->priv_tbl.cpu;
> -       u8 *dst = tbl->scaling_list;
> -       const u8 *src;
> -       int i, j;
> -
> -       BUILD_BUG_ON(ARRAY_SIZE(zig_zag_4x4) != list_len_4x4);
> -       BUILD_BUG_ON(ARRAY_SIZE(zig_zag_8x8) != list_len_8x8);
> -       BUILD_BUG_ON(ARRAY_SIZE(tbl->scaling_list) <
> -                    num_list_4x4 * list_len_4x4 +
> -                    num_list_8x8 * list_len_8x8);
> -
> -       src = &scaling->scaling_list_4x4[0][0];
> -       for (i = 0; i < num_list_4x4; ++i) {
> -               for (j = 0; j < list_len_4x4; ++j)
> -                       dst[zig_zag_4x4[j]] = src[j];
> -               src += list_len_4x4;
> -               dst += list_len_4x4;
> -       }
>
> -       src = &scaling->scaling_list_8x8[0][0];
> -       for (i = 0; i < num_list_8x8; ++i) {
> -               for (j = 0; j < list_len_8x8; ++j)
> -                       dst[zig_zag_8x8[j]] = src[j];
> -               src += list_len_8x8;
> -               dst += list_len_8x8;
> -       }
> +       BUILD_BUG_ON(sizeof(tbl->scaling_list.scaling_list_4x4) !=
> +                    sizeof(scaling->scaling_list_4x4));
> +       BUILD_BUG_ON(sizeof(tbl->scaling_list.scaling_list_8x8) !=
> +                    sizeof(scaling->scaling_list_8x8));
> +
> +       memcpy(tbl->scaling_list.scaling_list_4x4,
> +              scaling->scaling_list_4x4,
> +              sizeof(scaling->scaling_list_4x4));
> +
> +       memcpy(tbl->scaling_list.scaling_list_8x8,
> +              scaling->scaling_list_8x8,
> +              sizeof(scaling->scaling_list_8x8));
>  }
>
>  /*
> @@ -1126,7 +1100,7 @@ static int rkvdec_h264_run(struct rkvdec_ctx *ctx)
>         v4l2_h264_build_b_ref_lists(&reflist_builder, h264_ctx->reflists.b0,
>                                     h264_ctx->reflists.b1);
>
> -       reorder_scaling_list(ctx, &run);
> +       assemble_hw_scaling_list(ctx, &run);
>         assemble_hw_pps(ctx, &run);
>         assemble_hw_rps(ctx, &run);
>         config_registers(ctx, &run);
> --
> 2.17.1
>
