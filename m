Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC9AF13B8DE
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2020 06:14:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726559AbgAOFOa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jan 2020 00:14:30 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:40860 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725957AbgAOFO0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jan 2020 00:14:26 -0500
Received: by mail-oi1-f196.google.com with SMTP id c77so14235379oib.7
        for <linux-media@vger.kernel.org>; Tue, 14 Jan 2020 21:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1V7MW/ylG5HH52qKYnJfjENVm5zMbyLo/1xAyipVPNU=;
        b=Toqv6jeGfvvxWRkr5nvZFkzGlWyXW0qh9bEcuwG/GucvkAKkjZSDtLzEWNyuJz0kAn
         3LFtDjFZjvJ7Cjg7QuoSNUcSCrCzCprhHwc/fgBE3nhH6SR9YUsAAdK89gezNLJwSh+u
         U2JRzqaD9IF3wcMHh/XVE6mg6as3ybZqHT9UQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1V7MW/ylG5HH52qKYnJfjENVm5zMbyLo/1xAyipVPNU=;
        b=erAuzDJW0n4uaPta8SJPNMZifX9giN9PpxCuukAFopZVrYK0Vr3Gzu4lWyTIwLq3TF
         aQ5eNbt59tvfgaboScTAwPAo7aetEgGL5r/qiNZLWy0gVbySxMzLe91UR1Gx5B8snSBA
         94huQN5PRCUmKuND5+9TUfv/cpiydLzEUvJ7/W5MuUiBfe6rTSZ9E6xvWbPkH4wuWYsp
         toThQ5CTIv8y5Ls9xComrrIM+TS0/WQ4CVszdN/eoSoD5kqGJv4geyLgemFQjjYByUTb
         YWSDhlclSi4jkk6yIgeox69Ozo52ZKm2odXfkTyH/ovxKMW+pnqs6yteIu00Qp/7kXpx
         gPcg==
X-Gm-Message-State: APjAAAWS+POqn3GfZ/mDrHZ8WyhIOg5V4JS9uuD2AN/TmqdcYHhgLo1y
        rQl7UM/jFu7TzD34xF3spZlVKoVIq6Ae6A==
X-Google-Smtp-Source: APXvYqz0OH2MEjnLgCmAe5xcN7RKzzrqdkigXZ3ANUuBDABneQmRAxXSUVaOoBqqw7HZh9aDWRt+yg==
X-Received: by 2002:aca:d4ca:: with SMTP id l193mr19951967oig.133.1579065265109;
        Tue, 14 Jan 2020 21:14:25 -0800 (PST)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com. [209.85.167.174])
        by smtp.gmail.com with ESMTPSA id 6sm5332160oil.43.2020.01.14.21.14.23
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2020 21:14:24 -0800 (PST)
Received: by mail-oi1-f174.google.com with SMTP id a67so14259822oib.6
        for <linux-media@vger.kernel.org>; Tue, 14 Jan 2020 21:14:23 -0800 (PST)
X-Received: by 2002:aca:d0b:: with SMTP id 11mr19753910oin.71.1579065262776;
 Tue, 14 Jan 2020 21:14:22 -0800 (PST)
MIME-Version: 1.0
References: <20200114033226.16786-1-gtk_ruiwang@mediatek.com> <CAPBb6MXhiNK84PuUy8=RUUeSh5j4VXw-Ar5SbZDHZAobp7xpEQ@mail.gmail.com>
In-Reply-To: <CAPBb6MXhiNK84PuUy8=RUUeSh5j4VXw-Ar5SbZDHZAobp7xpEQ@mail.gmail.com>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Wed, 15 Jan 2020 14:14:11 +0900
X-Gmail-Original-Message-ID: <CAPBb6MXu9+9C7iUZST_OCwfren7kggFTG41DArF6yzRa_0hf4w@mail.gmail.com>
Message-ID: <CAPBb6MXu9+9C7iUZST_OCwfren7kggFTG41DArF6yzRa_0hf4w@mail.gmail.com>
Subject: Re: media: mtk-vcodec: reset segment data then trig decoder
To:     gtk_ruiwang <gtk_ruiwang@mediatek.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tomasz Figa <tfiga@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Longfei Wang <longfei.wang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>, srv_heupstream@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 15, 2020 at 12:47 PM Alexandre Courbot
<acourbot@chromium.org> wrote:
>
> On Tue, Jan 14, 2020 at 12:32 PM <gtk_ruiwang@mediatek.com> wrote:
> >
> > From: gtk_ruiwang <gtk_ruiwang@mediatek.com>
> >
> > VP9 bitstream specification indicate segment data should reset to
> > default when meet key frames, intra only frames or enable error
> > resilience mode. So memset segmentation map buffer before every
> > decode process is not appropriate.
> >
> > Reset segment data only when needed, then trig decoder hardware
> >
> > Signed-off-by: Rui Wang <gtk_ruiwang@mediatek.com>
> > ---
> >  .../platform/mtk-vcodec/vdec/vdec_vp9_if.c    | 19 +++++++++++++++----
> >  1 file changed, 15 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
> > index 24c1f0bf2147..42c9c3c98076 100644
> > --- a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
> > +++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
> > @@ -110,7 +110,9 @@ struct vp9_sf_ref_fb {
> >   * @buf_len_sz_c : size used to store cbcr plane ufo info (AP-R, VPU-W)
> >
> >   * @profile : profile sparsed from vpu (AP-R, VPU-W)
> > - * @show_frame : display this frame or not (AP-R, VPU-W)
> > + * @show_frame : [BIT(0)] display this frame or not (AP-R, VPU-W)
> > + *     [BIT(14)] reset segment data or not (AP-R, VPU-W)
> > + *     [BIT(15)] trig decoder hardware or not (AP-R, VPU-W)
> >   * @show_existing_frame : inform this frame is show existing frame
> >   *     (AP-R, VPU-W)
> >   * @frm_to_show_idx : index to show frame (AP-R, VPU-W)
> > @@ -494,12 +496,12 @@ static void vp9_swap_frm_bufs(struct vdec_vp9_inst *inst)
> >                                         frm_to_show->fb->base_y.size);
> >                 }
> >                 if (!vp9_is_sf_ref_fb(inst, inst->cur_fb)) {
> > -                       if (vsi->show_frame)
> > +                       if (vsi->show_frame & BIT(0))
> >                                 vp9_add_to_fb_disp_list(inst, inst->cur_fb);
> >                 }
> >         } else {
> >                 if (!vp9_is_sf_ref_fb(inst, inst->cur_fb)) {
> > -                       if (vsi->show_frame)
> > +                       if (vsi->show_frame & BIT(0))
> >                                 vp9_add_to_fb_disp_list(inst, frm_to_show->fb);
> >                 }
> >         }
> > @@ -870,13 +872,22 @@ static int vdec_vp9_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
> >                                         vsi->sf_frm_sz[idx]);
> >                         }
> >                 }
> > -               memset(inst->seg_id_buf.va, 0, inst->seg_id_buf.size);
> >                 ret = vpu_dec_start(&inst->vpu, data, 3);
> >                 if (ret) {
> >                         mtk_vcodec_err(inst, "vpu_dec_start failed");
> >                         goto DECODE_ERROR;
> >                 }
> >
> > +               if ((vsi->show_frame & BIT(15)) &&
> > +                   (vsi->show_frame & BIT(14))) {
>
> Using the new bits in this manner means this patch is not compatible
> with the older firmware.
>
> On an older firmware, these bits will be 0, which means the decoder
> will never be started. To preserve compatibility, the behavior should
> be reversed: *do not* reset and/or start the decoder if the bits are
> set.
>
> Also both bits are only used together - we should either separate the
> data segment reset and decoder start, or rely on only one bit for
> this.

Ah, looks like I missed the fact that the decoder is still started
even when these bits are not set. So this indeed looks
backward-compatible. Please ignore my comment.
