Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 446B1392B7C
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 12:10:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236113AbhE0KMT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 May 2021 06:12:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236105AbhE0KMR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 May 2021 06:12:17 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74058C061760
        for <linux-media@vger.kernel.org>; Thu, 27 May 2021 03:10:44 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id e2so65184ljk.4
        for <linux-media@vger.kernel.org>; Thu, 27 May 2021 03:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Jm/6jFCe3/7FOinz4SHy1Ee5ISvSki/EZvOhN9srBpY=;
        b=LGZVhXqBUDdX1KmMdSxzLcJeA+4qUVmlfy8wrXeVpW8TABCjHmnkD9dGcbbP71xWLg
         7Vxy1H6Br35G36rwv5dOVypvJYzC0jSVtg/wZomZQDxm2xB/vkWoMCzI/Tjgg9wl6R7j
         do9h37JCcYmF5NUhoh1KeG2QlKpOrIcgL4R+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Jm/6jFCe3/7FOinz4SHy1Ee5ISvSki/EZvOhN9srBpY=;
        b=kOqAoCcceeVIml9582zBkZ3Lr8UrLv77Uz4xq1046WJgnHYA3Bl8jF4EkR4v6EYuxP
         HXH68FKHbkwTxkok2UBavtr1OtRN54gfNdDgBdl6X3sJSpHQt3Wss2EoFsZgCvypQFrZ
         T+/kqAiBAD6DuuCRFlCxh5AhAgWVdWIqQ0+y0bONQb4NNgrHWJ7S3Q3bmr9iWfAddfGh
         kXabk9kv/mVwG5gggZjCbWbxsaNOh8R9Vsf9xNUG16cbTzSCNupqRztnEjaoD1hdG1jI
         GFy+HfShMnTw8frwKD7szv0exzjrpEixCXDV+jrRBu0Nbuqw3LbyaWcYWANgTKb7idqB
         3Jng==
X-Gm-Message-State: AOAM532ioupG98MCl/1iQ//C+qJ6kL59qM8BfekbltMTB29lax8mM9Kr
        MFWj7wBIs4G7241aoDip7Qj95beY3dVOqg==
X-Google-Smtp-Source: ABdhPJwAmuABvSmmhNQpw1wb4lrZYtkc4fI/ljTDLV4mO7SBDs2bvKY5IlHaUdrtLYbn99IOOU9KJw==
X-Received: by 2002:a2e:9e90:: with SMTP id f16mr1958063ljk.437.1622110242479;
        Thu, 27 May 2021 03:10:42 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id v203sm160373lfa.156.2021.05.27.03.10.41
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 May 2021 03:10:41 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id w15so28510ljo.10
        for <linux-media@vger.kernel.org>; Thu, 27 May 2021 03:10:41 -0700 (PDT)
X-Received: by 2002:a2e:988b:: with SMTP id b11mr2014124ljj.87.1622110241115;
 Thu, 27 May 2021 03:10:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210519143011.1175546-1-acourbot@chromium.org>
 <20210519143011.1175546-7-acourbot@chromium.org> <CA+Px+wV2N9uRuMGBzZDibCYqPVigPb5K40Q1BuLa58K2RY_eaA@mail.gmail.com>
In-Reply-To: <CA+Px+wV2N9uRuMGBzZDibCYqPVigPb5K40Q1BuLa58K2RY_eaA@mail.gmail.com>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Thu, 27 May 2021 19:10:28 +0900
X-Gmail-Original-Message-ID: <CAPBb6MXFrneXmhA=1FshkrGLZOder4_KeyzD7xGdw66o0hTBZw@mail.gmail.com>
Message-ID: <CAPBb6MXFrneXmhA=1FshkrGLZOder4_KeyzD7xGdw66o0hTBZw@mail.gmail.com>
Subject: Re: [PATCH v5 06/14] media: mtk-vcodec: vdec: move stateful ops into
 their own file
To:     Tzung-Bi Shih <tzungbi@google.com>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 21, 2021 at 10:37 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> On Wed, May 19, 2021 at 10:31 PM Alexandre Courbot
> <acourbot@chromium.org> wrote:
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
> > new file mode 100644
> > index 000000000000..ed4b1308a0e4
> > --- /dev/null
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
> > @@ -0,0 +1,667 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +#include <media/v4l2-event.h>
> > +#include <media/v4l2-mem2mem.h>
> > +#include <media/videobuf2-dma-contig.h>
> > +
> > +#include "mtk_vcodec_drv.h"
> > +#include "mtk_vcodec_dec.h"
> > +#include "mtk_vcodec_intr.h"
> > +#include "mtk_vcodec_util.h"
> > +#include "vdec_drv_if.h"
> > +#include "mtk_vcodec_dec_pm.h"
>
> Would be good practice to sort them.

Did what I could, but the order seems to somehow matter. :/

>
> > +static struct vb2_buffer *get_display_buffer(struct mtk_vcodec_ctx *ctx)
> > +{
> > +       struct vdec_fb *disp_frame_buffer = NULL;
> > +       struct mtk_video_dec_buf *dstbuf;
> > +       struct vb2_v4l2_buffer *vb;
> > +
> > +       mtk_v4l2_debug(3, "[%d]", ctx->id);
> > +       if (vdec_if_get_param(ctx,
> > +                       GET_PARAM_DISP_FRAME_BUFFER,
> > +                       &disp_frame_buffer)) {
> > +               mtk_v4l2_err("[%d]Cannot get param : GET_PARAM_DISP_FRAME_BUFFER",
> > +                       ctx->id);
> > +               return NULL;
> > +       }
> > +
> > +       if (disp_frame_buffer == NULL) {
>
> Although this is a move refactor, to be neat, !disp_frame_buffer.

These were also raised by checkpatch.pl --strict, they are now all fixed.

>
> > +static struct vb2_buffer *get_free_buffer(struct mtk_vcodec_ctx *ctx)
> > +{
> > +       struct mtk_video_dec_buf *dstbuf;
> > +       struct vdec_fb *free_frame_buffer = NULL;
> > +       struct vb2_v4l2_buffer *vb;
> > +
> > +       if (vdec_if_get_param(ctx,
> > +                               GET_PARAM_FREE_FRAME_BUFFER,
> > +                               &free_frame_buffer)) {
> > +               mtk_v4l2_err("[%d] Error!! Cannot get param", ctx->id);
> > +               return NULL;
> > +       }
> > +       if (free_frame_buffer == NULL) {
>
> The same concern as above.
>
> > +static void clean_display_buffer(struct mtk_vcodec_ctx *ctx)
> > +{
> > +       struct vb2_buffer *framptr;
> > +
> > +       do {
> > +               framptr = get_display_buffer(ctx);
> > +       } while (framptr);
> > +}
> > +
> > +static void clean_free_buffer(struct mtk_vcodec_ctx *ctx)
> > +{
> > +       struct vb2_buffer *framptr;
> > +
> > +       do {
> > +               framptr = get_free_buffer(ctx);
> > +       } while (framptr);
> > +}
>
> while (get_display_buffer(ctx)) ;
> and
> while (get_free_buffer(ctx)) ;
> looks better.

Done.

>
> > +static int mtk_vdec_flush_decoder(struct mtk_vcodec_ctx *ctx)
> > +{
> > +       bool res_chg;
> > +       int ret = 0;
>
> No need to initialize.

Done.

>
> > +static void mtk_vdec_worker(struct work_struct *work)
> > +{
> > +       struct mtk_vcodec_ctx *ctx = container_of(work, struct mtk_vcodec_ctx,
> > +                               decode_work);
> > +       struct mtk_vcodec_dev *dev = ctx->dev;
> > +       struct vb2_v4l2_buffer *src_buf, *dst_buf;
> > +       struct mtk_vcodec_mem buf;
> > +       struct vdec_fb *pfb;
> > +       bool res_chg = false;
> > +       int ret;
> > +       struct mtk_video_dec_buf *dst_buf_info, *src_buf_info;
> > +
> > +       src_buf = v4l2_m2m_next_src_buf(ctx->m2m_ctx);
> > +       if (src_buf == NULL) {
>
> To neat, !src_buf.
>
> > +       dst_buf = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
> > +       if (dst_buf == NULL) {
>
> To neat, !dst_buf.
>
> > +static void vb2ops_vdec_stateful_buf_queue(struct vb2_buffer *vb)
> > +{
> > +       struct vb2_v4l2_buffer *src_buf;
> > +       struct mtk_vcodec_mem src_mem;
> > +       bool res_chg = false;
> > +       int ret = 0;
> > +       unsigned int dpbsize = 1, i = 0;
> > +       struct mtk_vcodec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
> > +       struct vb2_v4l2_buffer *vb2_v4l2 = NULL;
>
> ret, i, and vb2_v4l2 are obviously no need to initialize.

Done, thanks!
