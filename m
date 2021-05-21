Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF21D38C864
	for <lists+linux-media@lfdr.de>; Fri, 21 May 2021 15:38:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235878AbhEUNkM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 May 2021 09:40:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236159AbhEUNjx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 May 2021 09:39:53 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD329C061343
        for <linux-media@vger.kernel.org>; Fri, 21 May 2021 06:38:25 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id a11so20183097ioo.0
        for <linux-media@vger.kernel.org>; Fri, 21 May 2021 06:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P8K4c4I3E0ScqatNpdtAdPPA1ppP33415CwioITRQ28=;
        b=WvVKiwzhtpchBrgwnrtu/VPArYkX35BZT0jVz2d3peS1iXg6p8KiiuIH8jzggDnNbr
         yVrse6NVTrPmjE13XP0shAgyR6vrOPr4U+8BCzEgDpoetP1EvMdhiy01IkSobFcBO+tl
         Mk2kr2gTuf9ODLYRqzppYHHEJGi6vKBENrmpg5YimFUu0StPEtOSKjdBlrr3PyXpgM63
         x+f5H8Wbimx1f1jScGC0mXwSoguiTIz0BHscM9OXDPR6I7deEJDecbuSxOy5nisEi9On
         gpn+r1UM7x/iX6z/r4bi1rMgMW3VtAEiVPGX6Ru1XTV/RByNIDbbQ887CRW3fpP7AOXd
         4sUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P8K4c4I3E0ScqatNpdtAdPPA1ppP33415CwioITRQ28=;
        b=PxrBAuOAUl0laOeLM2ntrD/WAHt5v0Wgyp0PWk5aip2RnMeHbIuwIR0iwwTYzTJi2K
         ZPxoR2KJwU6nKw5o69tKdWG9AGIZS9/ZWzKqVRx7JuczX5vh/STn4UywadgGKqjtsuP0
         9cWPRT6piwmhGOqPd+mW8fZaKZ6NkWtbzSFREas7T5ocnerjVXZQaaaAdbowwZ/xN3xx
         GZylBhqKPxI/klFvb+lwLfftAc4R5fHiMNuTX/5KXodHcLCwcOv2LX2WCKCgnP5TAYtS
         lTSY5DPSyPiS4Tj0cajlUB0QSKYTGZTn+AWLUu6/bQSpxgVJkJCO4Ah9eSfLTdoXYc8k
         JpoA==
X-Gm-Message-State: AOAM5318upRk1ul5PCkDBua7XP0Thy2H/mp0Vsk+EqL80ncA5M/Xljnb
        S+P12pknm0sMk3ZhmVl4JwdKZdNMSA+oRbMIBITasg==
X-Google-Smtp-Source: ABdhPJwGS5p1CUtc8MeJkM1M+YPLMW1IaLUnAfAAaV6/8vNhpyIeddCaWTRXOChcNDmTYv0D6x0Fsq6hZZ3HcEF0JCc=
X-Received: by 2002:a05:6638:3010:: with SMTP id r16mr4601269jak.126.1621604304927;
 Fri, 21 May 2021 06:38:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210519143011.1175546-1-acourbot@chromium.org> <20210519143011.1175546-12-acourbot@chromium.org>
In-Reply-To: <20210519143011.1175546-12-acourbot@chromium.org>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Fri, 21 May 2021 21:38:13 +0800
Message-ID: <CA+Px+wXXtsmG2q4aJ4Em1pzFcA-mA6CuATfXKevNyEOuBq+zYw@mail.gmail.com>
Subject: Re: [PATCH v5 11/14] media: mtk-vcodec: vdec: support stateless H.264 decoding
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
> +#include "../vdec_drv_if.h"
> +#include "../mtk_vcodec_util.h"
> +#include "../mtk_vcodec_dec.h"
> +#include "../mtk_vcodec_intr.h"
> +#include "../vdec_vpu_if.h"
> +#include "../vdec_drv_base.h"

Would be good practice to sort them.

> +static int allocate_predication_buf(struct vdec_h264_slice_inst *inst)
> +{
> +       int err = 0;

No need to initialize.  It will be overridden soon.

> +static void free_predication_buf(struct vdec_h264_slice_inst *inst)
> +{
> +       struct mtk_vcodec_mem *mem = NULL;
> +
> +       mtk_vcodec_debug_enter(inst);
> +
> +       inst->vsi_ctx.pred_buf_dma = 0;
> +       mem = &inst->pred_buf;

Is it possible to inline to the variable declaration?  Or mem no need
to initialize.

> +static int alloc_mv_buf(struct vdec_h264_slice_inst *inst,
> +       struct vdec_pic_info *pic)
> +{
> +       int i;
> +       int err;
> +       struct mtk_vcodec_mem *mem = NULL;

No need to initialize.  It will be overridden soon.

> +static void free_mv_buf(struct vdec_h264_slice_inst *inst)
> +{
> +       int i;
> +       struct mtk_vcodec_mem *mem = NULL;

No need to initialize.  It will be overridden soon.

> +static int vdec_h264_slice_init(struct mtk_vcodec_ctx *ctx)
> +{
> +       struct vdec_h264_slice_inst *inst = NULL;

No need to initialize.  It will be overridden soon.

> +static void vdec_h264_slice_deinit(void *h_vdec)
> +{
> +       struct vdec_h264_slice_inst *inst =
> +               (struct vdec_h264_slice_inst *)h_vdec;

No need to cast from void *.

> +static int vdec_h264_slice_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
> +                                 struct vdec_fb *fb, bool *res_chg)
> +{
> +       struct vdec_h264_slice_inst *inst =
> +               (struct vdec_h264_slice_inst *)h_vdec;

No need to cast from void *.

> +       const struct v4l2_ctrl_h264_decode_params *dec_params =
> +               get_ctrl_ptr(inst->ctx, V4L2_CID_STATELESS_H264_DECODE_PARAMS);
> +       struct vdec_vpu_inst *vpu = &inst->vpu;
> +       uint32_t data[2];
> +       uint64_t y_fb_dma;
> +       uint64_t c_fb_dma;
> +       int err;
> +
> +       /* bs NULL means flush decoder */
> +       if (bs == NULL)

To neat, !bs.

> +static int vdec_h264_slice_get_param(void *h_vdec,
> +                              enum vdec_get_param_type type, void *out)
> +{
> +       struct vdec_h264_slice_inst *inst =
> +               (struct vdec_h264_slice_inst *)h_vdec;

No need to cast from void *.
