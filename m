Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1BE747FAB8
	for <lists+linux-media@lfdr.de>; Mon, 27 Dec 2021 08:14:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231164AbhL0HO5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Dec 2021 02:14:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbhL0HO4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Dec 2021 02:14:56 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 657DCC06173E
        for <linux-media@vger.kernel.org>; Sun, 26 Dec 2021 23:14:56 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id k6-20020a17090a7f0600b001ad9d73b20bso13632297pjl.3
        for <linux-media@vger.kernel.org>; Sun, 26 Dec 2021 23:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5NO1al33KK9AHVngYVbDZ//RPzqF3GCVIYpihpM+V6E=;
        b=nbcXBPQ/7er1rZWmEfpq0TF/KSxhRx0TV39wk5WBswwtHGHRf13BjvS4oPacEr2phQ
         GIJJy0KN5yms6XcELwEfT95jAlJN7EB7BY+C6lw6M5lJdZeOXtIG2OmMEIY3KnwigNDC
         veTXyaLZUBkBlsHd+/DsjCiRoAdZZcCPGBV6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5NO1al33KK9AHVngYVbDZ//RPzqF3GCVIYpihpM+V6E=;
        b=6to1ADs7c75pefh9cZ0MTLUh2toTulpIkuNJkVicxcHc0uYRCF71J/CUADL+Fr4BRn
         CxGaSKN4CeUIbqBcRPLecLS+3d2RaUQqLG0dNJRyHI8njEIOo0ends8qRWHC0Qsns0Ka
         HUvaa+HUeAmCYuMEWWBzEDQh9sxNMPu4OwwgwMVStA1MzeIS+F+qsy2XcvB+RvDfuiMc
         GF2Qs6lx9B4Nhy10amTPaQI8jTXhYIePs9DlY8Qe7TcYSP6jElo1st/1N+OsY9kuX9W3
         Mis9pX4rckNNzi1yUBhrYqLRU6f3CR/0PduByPiQc8Kgk0EMWofOlmBXqlkX89xoopjJ
         LNqA==
X-Gm-Message-State: AOAM532x7p1egwnKXyMPAg/JIz1VtJ0Hf+TKvlqOHhTWLROH2bTVqwcF
        PzSFQjpJbnRnBaQxgZDDux55sV5RXp4IJw==
X-Google-Smtp-Source: ABdhPJxQtA65alacn6++B/nm/OlWjT/nyzxgXHsV3EL1O5Gwmsi3I4nIJGeFVjWJTpexyvRVOvnbVA==
X-Received: by 2002:a17:902:8693:b0:148:a2e7:fb5a with SMTP id g19-20020a170902869300b00148a2e7fb5amr16268386plo.155.1640589295634;
        Sun, 26 Dec 2021 23:14:55 -0800 (PST)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com. [209.85.216.51])
        by smtp.gmail.com with ESMTPSA id s2sm15606468pfe.103.2021.12.26.23.14.55
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Dec 2021 23:14:55 -0800 (PST)
Received: by mail-pj1-f51.google.com with SMTP id mj19so12760946pjb.3
        for <linux-media@vger.kernel.org>; Sun, 26 Dec 2021 23:14:55 -0800 (PST)
X-Received: by 2002:a05:6102:e89:: with SMTP id l9mr4547183vst.80.1640588810744;
 Sun, 26 Dec 2021 23:06:50 -0800 (PST)
MIME-Version: 1.0
References: <20211117130635.11633-1-dafna.hirschfeld@collabora.com> <20211117130635.11633-8-dafna.hirschfeld@collabora.com>
In-Reply-To: <20211117130635.11633-8-dafna.hirschfeld@collabora.com>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Mon, 27 Dec 2021 16:06:39 +0900
X-Gmail-Original-Message-ID: <CAPBb6MX8Yq5eoumOUxK+OmSEu6cQE8nqfABtHTz+UdAsRfXtvQ@mail.gmail.com>
Message-ID: <CAPBb6MX8Yq5eoumOUxK+OmSEu6cQE8nqfABtHTz+UdAsRfXtvQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] meida: mtk-vcodec: remove unused func parameter
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        kernel@collabora.com, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        courbot@chromium.org, Dafna Hirschfeld <dafna3@gmail.com>,
        eizan@chromium.org, houlong.wei@mediatek.com,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Irui Wang <irui.wang@mediatek.com>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        =?UTF-8?B?TWFvZ3VhbmcgTWVuZyAo5a2f5q+b5bm/KQ==?= 
        <maoguang.meng@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        minghsiu.tsai@mediatek.com, Tomasz Figa <tfiga@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 17, 2021 at 10:07 PM Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
> The prarameter bs_size to function vpu_enc_encode
> is not used. Remove it.
>
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Indeed, it's an output parameter of the calling functions and has no
business being passed to vpu_enc_encode.

With the typo in the headline fixed,

Reviewed-by: Alexandre Courbot <acourbot@chromium.org>


> ---
>  drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c | 9 +++------
>  drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c  | 3 +--
>  drivers/media/platform/mtk-vcodec/venc_vpu_if.c       | 1 -
>  drivers/media/platform/mtk-vcodec/venc_vpu_if.h       | 1 -
>  4 files changed, 4 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
> index b6a4f2074fa5..bf03888a824f 100644
> --- a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
> +++ b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
> @@ -367,8 +367,7 @@ static int h264_encode_sps(struct venc_h264_inst *inst,
>
>         mtk_vcodec_debug_enter(inst);
>
> -       ret = vpu_enc_encode(&inst->vpu_inst, H264_BS_MODE_SPS, NULL,
> -                            bs_buf, bs_size, NULL);
> +       ret = vpu_enc_encode(&inst->vpu_inst, H264_BS_MODE_SPS, NULL, bs_buf, NULL);
>         if (ret)
>                 return ret;
>
> @@ -394,8 +393,7 @@ static int h264_encode_pps(struct venc_h264_inst *inst,
>
>         mtk_vcodec_debug_enter(inst);
>
> -       ret = vpu_enc_encode(&inst->vpu_inst, H264_BS_MODE_PPS, NULL,
> -                            bs_buf, bs_size, NULL);
> +       ret = vpu_enc_encode(&inst->vpu_inst, H264_BS_MODE_PPS, NULL, bs_buf, NULL);
>         if (ret)
>                 return ret;
>
> @@ -451,8 +449,7 @@ static int h264_encode_frame(struct venc_h264_inst *inst,
>         mtk_vcodec_debug(inst, "frm_count = %d,skip_frm_count =%d,frm_type=%d.\n",
>                          frame_info.frm_count, frame_info.skip_frm_count,
>                          frame_info.frm_type);
> -       ret = vpu_enc_encode(&inst->vpu_inst, H264_BS_MODE_FRAME, frm_buf,
> -                            bs_buf, bs_size, &frame_info);
> +       ret = vpu_enc_encode(&inst->vpu_inst, H264_BS_MODE_FRAME, frm_buf, bs_buf, &frame_info);
>         if (ret)
>                 return ret;
>
> diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
> index 8267a9c4fd25..6b66957d5192 100644
> --- a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
> +++ b/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
> @@ -302,8 +302,7 @@ static int vp8_enc_encode_frame(struct venc_vp8_inst *inst,
>
>         mtk_vcodec_debug(inst, "->frm_cnt=%d", inst->frm_cnt);
>
> -       ret = vpu_enc_encode(&inst->vpu_inst, 0, frm_buf, bs_buf, bs_size,
> -                            NULL);
> +       ret = vpu_enc_encode(&inst->vpu_inst, 0, frm_buf, bs_buf, NULL);
>         if (ret)
>                 return ret;
>
> diff --git a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
> index be6d8790a41e..e7899d8a3e4e 100644
> --- a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
> +++ b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
> @@ -225,7 +225,6 @@ int vpu_enc_set_param(struct venc_vpu_inst *vpu,
>  int vpu_enc_encode(struct venc_vpu_inst *vpu, unsigned int bs_mode,
>                    struct venc_frm_buf *frm_buf,
>                    struct mtk_vcodec_mem *bs_buf,
> -                  unsigned int *bs_size,
>                    struct venc_frame_info *frame_info)
>  {
>         const bool is_ext = MTK_ENC_CTX_IS_EXT(vpu->ctx);
> diff --git a/drivers/media/platform/mtk-vcodec/venc_vpu_if.h b/drivers/media/platform/mtk-vcodec/venc_vpu_if.h
> index f9be9cab7ff7..f83bc1b3f2bf 100644
> --- a/drivers/media/platform/mtk-vcodec/venc_vpu_if.h
> +++ b/drivers/media/platform/mtk-vcodec/venc_vpu_if.h
> @@ -45,7 +45,6 @@ int vpu_enc_set_param(struct venc_vpu_inst *vpu,
>  int vpu_enc_encode(struct venc_vpu_inst *vpu, unsigned int bs_mode,
>                    struct venc_frm_buf *frm_buf,
>                    struct mtk_vcodec_mem *bs_buf,
> -                  unsigned int *bs_size,
>                    struct venc_frame_info *frame_info);
>  int vpu_enc_deinit(struct venc_vpu_inst *vpu);
>
> --
> 2.17.1
>
