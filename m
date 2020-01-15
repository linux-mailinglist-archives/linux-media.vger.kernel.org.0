Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69DBF13B84A
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2020 04:47:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729010AbgAODrq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jan 2020 22:47:46 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:37840 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728884AbgAODrq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jan 2020 22:47:46 -0500
Received: by mail-ot1-f68.google.com with SMTP id k14so14916215otn.4
        for <linux-media@vger.kernel.org>; Tue, 14 Jan 2020 19:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fXE1pb9ZXSzUXM/cWp0vEuD1ufr49jnlyg/BuiYZBlA=;
        b=blCG6NNqmLU0+Yk3taOGfpNtJDvgllIRe1SUqtLakI2cGhtlgR7yOi6ZEASVsLviqR
         iyMUzuQ2s8+c3MOxNrGvBQg30aRdU8eM6KVBNxY9j8LAW4rePBASrqJ9bvNU+hQpe2Ea
         utDje7lx9JZAIV6DHWN8teCJ5y4glPgV1PECY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fXE1pb9ZXSzUXM/cWp0vEuD1ufr49jnlyg/BuiYZBlA=;
        b=IGlbydTK7mSKA8+8uv8x6wlWn6M4ogf7HJJJ1qgBbG07cOKpOM7FhbrDPHJSIixj8Z
         kXBwVuo+L2/vMYlSGvmJA+FZ9TOdh2JoJHPa3rwtBrt2JLw1S/T9dMWWhGfh+BHKC66L
         h3MtvbynSg/XtFceclT/EPkxdLUe1vJvV0ka5cUAeBNBw+VUt5yXuGY4Zdxu6fx521JK
         NGQDcO4pwYT1TfJaUn6I3f6ndvzjrMh3jgKQEyVr/GqHfRIfbKF2lK7+PPI+HR4v7IB0
         dfE7k6k4hcznz8zaVkEPjTsQ7xDiKlLqNWTo0FQXJm41FDAqw9U0j4ktwYUIPcVz/wPf
         ABxg==
X-Gm-Message-State: APjAAAXza1OEBK2/8eyb2FL1w650FRtMYxi4YMaSOuNDhfe0pu16ItCP
        l/fhstfz0LRY701ZR0zP5A8lS828i7g=
X-Google-Smtp-Source: APXvYqzgHrU3kHdPbpYrPlj5Ye93VNwh8OGKdtugdL8EkMc/OrJzClb5gVPqc/fjfG/sriRs4WhZ2A==
X-Received: by 2002:a05:6830:151a:: with SMTP id k26mr1393861otp.74.1579060065093;
        Tue, 14 Jan 2020 19:47:45 -0800 (PST)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com. [209.85.210.48])
        by smtp.gmail.com with ESMTPSA id p83sm5297071oia.51.2020.01.14.19.47.43
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2020 19:47:44 -0800 (PST)
Received: by mail-ot1-f48.google.com with SMTP id h9so14845693otj.11
        for <linux-media@vger.kernel.org>; Tue, 14 Jan 2020 19:47:43 -0800 (PST)
X-Received: by 2002:a05:6830:13da:: with SMTP id e26mr1239454otq.97.1579060063207;
 Tue, 14 Jan 2020 19:47:43 -0800 (PST)
MIME-Version: 1.0
References: <20200114033226.16786-1-gtk_ruiwang@mediatek.com>
In-Reply-To: <20200114033226.16786-1-gtk_ruiwang@mediatek.com>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Wed, 15 Jan 2020 12:47:32 +0900
X-Gmail-Original-Message-ID: <CAPBb6MXhiNK84PuUy8=RUUeSh5j4VXw-Ar5SbZDHZAobp7xpEQ@mail.gmail.com>
Message-ID: <CAPBb6MXhiNK84PuUy8=RUUeSh5j4VXw-Ar5SbZDHZAobp7xpEQ@mail.gmail.com>
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

On Tue, Jan 14, 2020 at 12:32 PM <gtk_ruiwang@mediatek.com> wrote:
>
> From: gtk_ruiwang <gtk_ruiwang@mediatek.com>
>
> VP9 bitstream specification indicate segment data should reset to
> default when meet key frames, intra only frames or enable error
> resilience mode. So memset segmentation map buffer before every
> decode process is not appropriate.
>
> Reset segment data only when needed, then trig decoder hardware
>
> Signed-off-by: Rui Wang <gtk_ruiwang@mediatek.com>
> ---
>  .../platform/mtk-vcodec/vdec/vdec_vp9_if.c    | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
> index 24c1f0bf2147..42c9c3c98076 100644
> --- a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
> +++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
> @@ -110,7 +110,9 @@ struct vp9_sf_ref_fb {
>   * @buf_len_sz_c : size used to store cbcr plane ufo info (AP-R, VPU-W)
>
>   * @profile : profile sparsed from vpu (AP-R, VPU-W)
> - * @show_frame : display this frame or not (AP-R, VPU-W)
> + * @show_frame : [BIT(0)] display this frame or not (AP-R, VPU-W)
> + *     [BIT(14)] reset segment data or not (AP-R, VPU-W)
> + *     [BIT(15)] trig decoder hardware or not (AP-R, VPU-W)
>   * @show_existing_frame : inform this frame is show existing frame
>   *     (AP-R, VPU-W)
>   * @frm_to_show_idx : index to show frame (AP-R, VPU-W)
> @@ -494,12 +496,12 @@ static void vp9_swap_frm_bufs(struct vdec_vp9_inst *inst)
>                                         frm_to_show->fb->base_y.size);
>                 }
>                 if (!vp9_is_sf_ref_fb(inst, inst->cur_fb)) {
> -                       if (vsi->show_frame)
> +                       if (vsi->show_frame & BIT(0))
>                                 vp9_add_to_fb_disp_list(inst, inst->cur_fb);
>                 }
>         } else {
>                 if (!vp9_is_sf_ref_fb(inst, inst->cur_fb)) {
> -                       if (vsi->show_frame)
> +                       if (vsi->show_frame & BIT(0))
>                                 vp9_add_to_fb_disp_list(inst, frm_to_show->fb);
>                 }
>         }
> @@ -870,13 +872,22 @@ static int vdec_vp9_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
>                                         vsi->sf_frm_sz[idx]);
>                         }
>                 }
> -               memset(inst->seg_id_buf.va, 0, inst->seg_id_buf.size);
>                 ret = vpu_dec_start(&inst->vpu, data, 3);
>                 if (ret) {
>                         mtk_vcodec_err(inst, "vpu_dec_start failed");
>                         goto DECODE_ERROR;
>                 }
>
> +               if ((vsi->show_frame & BIT(15)) &&
> +                   (vsi->show_frame & BIT(14))) {

Using the new bits in this manner means this patch is not compatible
with the older firmware.

On an older firmware, these bits will be 0, which means the decoder
will never be started. To preserve compatibility, the behavior should
be reversed: *do not* reset and/or start the decoder if the bits are
set.

Also both bits are only used together - we should either separate the
data segment reset and decoder start, or rely on only one bit for
this.

> +                       memset(inst->seg_id_buf.va, 0, inst->seg_id_buf.size);
> +                       ret = vpu_dec_start(&inst->vpu, NULL, 0);
> +                       if (ret) {
> +                               mtk_vcodec_err(inst, "vpu trig decoder failed");
> +                               goto DECODE_ERROR;
> +                       }
> +               }
> +
>                 ret = validate_vsi_array_indexes(inst, vsi);
>                 if (ret) {
>                         mtk_vcodec_err(inst, "Invalid values from VPU.");
> --
> 2.18.0
