Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1276E38C851
	for <lists+linux-media@lfdr.de>; Fri, 21 May 2021 15:38:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236373AbhEUNj1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 May 2021 09:39:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236162AbhEUNjN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 May 2021 09:39:13 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52C3EC061763
        for <linux-media@vger.kernel.org>; Fri, 21 May 2021 06:37:50 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id a11so20181376ioo.0
        for <linux-media@vger.kernel.org>; Fri, 21 May 2021 06:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NttNeLhcm02+oiWbzzzzBiDUNeT7wjZHq2cUEjZv6s0=;
        b=v/KE6bfT6VCJYrnenvpz9zBGLCOpXfwLGaZk0v9Et0MttdvDk73dgEJXveraNR9+HX
         unAm2j2b4tweIPStl854Ty91CNZ4IATbtN30Hdlt/F9+O2Svl3Z3S5y5WCTgpx94AReE
         i7RJVe2ginenu3xnZAAnJE6i13f7bF9YRyqyVPIKJANH8TlhBrHYcJHjCSkW2pWbMUHN
         ekoIRlbQcYZbGZKbs+jpMEcUm64QeoI6u+ZCy4uuCGvHtDW4eVhePs2RskuLfrouVAYj
         UzhtkojWigfj4Np34KD4duWwqLdXu95eTnsWv25YY84Ape7heW8ImGamJvIJVeOouU5m
         Yhtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NttNeLhcm02+oiWbzzzzBiDUNeT7wjZHq2cUEjZv6s0=;
        b=MMEjrUF7gvnWX4j/jSq+sy5Sz7VHAEw20J9wnFSHeJqKwwN/iVkrxxTumkb1GprmFT
         Goe1bPWr9GsFp8aYHExhSwRPotBzCczRdZ250Urf/CysJ17jLqH2uAwQnze6G6q0eqsG
         PStNyOgaVutpMnQfacpP4269ZBYAyBiNFSq/GLDmDKj/JygQuYNViQDW4GGjZ5y4XLi3
         Im3IZfAftt99HUgIXCR9GQAZIJxne2l+6AP+0ugxZAZBvYI9znyG7/lUm8LQLMmsPT+h
         /orDZddfXXEUUp8gavJudHRmPytkO/aIaerRSF1ls9o6F6j0D4H+Vs9Chste9s04sdys
         v8ZA==
X-Gm-Message-State: AOAM533KWjmfNr2b6JonTBgy5EOovkOof6BYaszg/gUB4Y9d2/bfpcpC
        oCJhugPhJlbgHunxXsQbeikRZTs9V+qkTKMEOoiqYg==
X-Google-Smtp-Source: ABdhPJzEUGA0KMOrUAL9TbTil30C8ZfAEdpL4JFWkP9cEMg7KMBktxOSGrCkZNOGkkC4qfUWFxJqStq3Uq8d5/TlmRs=
X-Received: by 2002:a02:a81a:: with SMTP id f26mr4621472jaj.110.1621604269444;
 Fri, 21 May 2021 06:37:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210519143011.1175546-1-acourbot@chromium.org> <20210519143011.1175546-7-acourbot@chromium.org>
In-Reply-To: <20210519143011.1175546-7-acourbot@chromium.org>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Fri, 21 May 2021 21:37:38 +0800
Message-ID: <CA+Px+wV2N9uRuMGBzZDibCYqPVigPb5K40Q1BuLa58K2RY_eaA@mail.gmail.com>
Subject: Re: [PATCH v5 06/14] media: mtk-vcodec: vdec: move stateful ops into
 their own file
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, May 19, 2021 at 10:31 PM Alexandre Courbot
<acourbot@chromium.org> wrote:
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
> new file mode 100644
> index 000000000000..ed4b1308a0e4
> --- /dev/null
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
> @@ -0,0 +1,667 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-mem2mem.h>
> +#include <media/videobuf2-dma-contig.h>
> +
> +#include "mtk_vcodec_drv.h"
> +#include "mtk_vcodec_dec.h"
> +#include "mtk_vcodec_intr.h"
> +#include "mtk_vcodec_util.h"
> +#include "vdec_drv_if.h"
> +#include "mtk_vcodec_dec_pm.h"

Would be good practice to sort them.

> +static struct vb2_buffer *get_display_buffer(struct mtk_vcodec_ctx *ctx)
> +{
> +       struct vdec_fb *disp_frame_buffer = NULL;
> +       struct mtk_video_dec_buf *dstbuf;
> +       struct vb2_v4l2_buffer *vb;
> +
> +       mtk_v4l2_debug(3, "[%d]", ctx->id);
> +       if (vdec_if_get_param(ctx,
> +                       GET_PARAM_DISP_FRAME_BUFFER,
> +                       &disp_frame_buffer)) {
> +               mtk_v4l2_err("[%d]Cannot get param : GET_PARAM_DISP_FRAME_BUFFER",
> +                       ctx->id);
> +               return NULL;
> +       }
> +
> +       if (disp_frame_buffer == NULL) {

Although this is a move refactor, to be neat, !disp_frame_buffer.

> +static struct vb2_buffer *get_free_buffer(struct mtk_vcodec_ctx *ctx)
> +{
> +       struct mtk_video_dec_buf *dstbuf;
> +       struct vdec_fb *free_frame_buffer = NULL;
> +       struct vb2_v4l2_buffer *vb;
> +
> +       if (vdec_if_get_param(ctx,
> +                               GET_PARAM_FREE_FRAME_BUFFER,
> +                               &free_frame_buffer)) {
> +               mtk_v4l2_err("[%d] Error!! Cannot get param", ctx->id);
> +               return NULL;
> +       }
> +       if (free_frame_buffer == NULL) {

The same concern as above.

> +static void clean_display_buffer(struct mtk_vcodec_ctx *ctx)
> +{
> +       struct vb2_buffer *framptr;
> +
> +       do {
> +               framptr = get_display_buffer(ctx);
> +       } while (framptr);
> +}
> +
> +static void clean_free_buffer(struct mtk_vcodec_ctx *ctx)
> +{
> +       struct vb2_buffer *framptr;
> +
> +       do {
> +               framptr = get_free_buffer(ctx);
> +       } while (framptr);
> +}

while (get_display_buffer(ctx)) ;
and
while (get_free_buffer(ctx)) ;
looks better.

> +static int mtk_vdec_flush_decoder(struct mtk_vcodec_ctx *ctx)
> +{
> +       bool res_chg;
> +       int ret = 0;

No need to initialize.

> +static void mtk_vdec_worker(struct work_struct *work)
> +{
> +       struct mtk_vcodec_ctx *ctx = container_of(work, struct mtk_vcodec_ctx,
> +                               decode_work);
> +       struct mtk_vcodec_dev *dev = ctx->dev;
> +       struct vb2_v4l2_buffer *src_buf, *dst_buf;
> +       struct mtk_vcodec_mem buf;
> +       struct vdec_fb *pfb;
> +       bool res_chg = false;
> +       int ret;
> +       struct mtk_video_dec_buf *dst_buf_info, *src_buf_info;
> +
> +       src_buf = v4l2_m2m_next_src_buf(ctx->m2m_ctx);
> +       if (src_buf == NULL) {

To neat, !src_buf.

> +       dst_buf = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
> +       if (dst_buf == NULL) {

To neat, !dst_buf.

> +static void vb2ops_vdec_stateful_buf_queue(struct vb2_buffer *vb)
> +{
> +       struct vb2_v4l2_buffer *src_buf;
> +       struct mtk_vcodec_mem src_mem;
> +       bool res_chg = false;
> +       int ret = 0;
> +       unsigned int dpbsize = 1, i = 0;
> +       struct mtk_vcodec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
> +       struct vb2_v4l2_buffer *vb2_v4l2 = NULL;

ret, i, and vb2_v4l2 are obviously no need to initialize.
