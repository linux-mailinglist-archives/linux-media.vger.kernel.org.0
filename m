Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F107E423546
	for <lists+linux-media@lfdr.de>; Wed,  6 Oct 2021 02:57:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234027AbhJFA7e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 20:59:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230218AbhJFA7e (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 20:59:34 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5ADDC061749
        for <linux-media@vger.kernel.org>; Tue,  5 Oct 2021 17:57:42 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id f9so3345836edx.4
        for <linux-media@vger.kernel.org>; Tue, 05 Oct 2021 17:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BnBbGM64QgB5WqzcyJW08etbln6pWC86wmdrU2FWwHk=;
        b=jq9S2dgjGpgRQfijmZdn0qh5bgVlzqhVZ9YJBI764wnh/E12jtFJ2PsOoeyo0oFIyR
         LHqk+MI1VVu0h7KDAtA59I+nITfVc00AJyvynBMYhqzLZPw8Z02I5zuWJYeR7q6wIY5m
         nVLO32I2DZyl62N73IIk6XUHS83X+YlV5v9UmFKEdkFPoLzMgIOeapoVNbikwiZvL9Nm
         7bouOO6ZWYcMco3gu5muzmHlkOplwpYfX6brhibL4DWUBQhYp9W8xo2qbYmUPsHRheHI
         C3/TYxsC/tAiN6v2C3ZoIDig7SBYEXbUQCFf+qwQ+d43Au5j5mqebfmMslkcGzj+/lbU
         u8bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BnBbGM64QgB5WqzcyJW08etbln6pWC86wmdrU2FWwHk=;
        b=hp5508u6x/4KIYh7vzvNhHou+3qouDbVjVR1aj7ttxOCvV7KTo2DWmXAzS2b0WUNOY
         TmTCcDv1GuvaPT067nxj/2Bsg0FFo8gzQj49fSS++TLoJcVJnc8mUcRYCXIuoRSWntM0
         osdrBJrbAXf1tHndgnzYEQ6rnvV24OHBrRFV9MC3qFVdL0QX3W2GEowlDYRGVPSnY0gY
         IgQSfaqEkGKJEu6Gxroes5XMeGDJmx0IM+urYedhdW9PqCNYPw4cwxuM4H2hJmAQTBZG
         AXSUlOVJzwj3HJ5eT04yDDUWz8jUAxCCan9q6atHk6u/5y4TApGv1kHy7D9+06Vs+OTc
         PUFA==
X-Gm-Message-State: AOAM530EyegJjMNMd7VRDDTWICnxdxlnfq9DVI/Iaa/Nze+t402fk+vy
        63iuZZdUcaos55A+z+1i5Itqp/NWR1h0om4GfMLvpw==
X-Google-Smtp-Source: ABdhPJzAlobybkSmWpQ6ha24btcTyPI6Fe0fRQTXeGc7K0osnXOdlvUU2Svmk+mGvTY1LkqxvcAVltNOgEvreuqXjcw=
X-Received: by 2002:a50:d8cf:: with SMTP id y15mr30842697edj.66.1633481861084;
 Tue, 05 Oct 2021 17:57:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210926033935.9258-1-irui.wang@mediatek.com>
In-Reply-To: <20210926033935.9258-1-irui.wang@mediatek.com>
From:   Hirokazu Honda <hiroh@google.com>
Date:   Wed, 6 Oct 2021 09:57:30 +0900
Message-ID: <CAL1V8yzgu6k=RbijbiPGZsbbQMSk0LQRewvgzOgmO0Bbg6wBcA@mail.gmail.com>
Subject: Re: [PATCH] media: mtk-vcodec: MT8173 h264/vp8 encoder min/max
 bitrate settings
To:     Irui Wang <Irui.Wang@mediatek.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Maoguang Meng <Maoguang.Meng@mediatek.com>,
        Longfei Wang <Longfei.Wang@mediatek.com>,
        Yunfei Dong <Yunfei.Dong@mediatek.com>,
        Fritz Koenig <frkoenig@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com,
        linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Irui, thank you for the patch.


On Sun, Sep 26, 2021 at 12:39 PM Irui Wang <irui.wang@mediatek.com> wrote:
>
> Set recommend min/max bitrate range for MT8173 h264/vp8 encoder.
>
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>


I confirmed the patch worked with my own test.

Tested-by: Hirokazu Honda <hiroh@chromium.org>

-Hiro
>
> ---
> This patch dependents on "Clean redundant encoder format definition",
> which already accepted into linux-next.git:
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/patch/?id=4093eb21538ae4f2861b26f4615939e1fa50dc67
> ---
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> index 4489a9744cd7..5dce3681ce94 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> @@ -388,8 +388,8 @@ static const struct mtk_vcodec_enc_pdata mt8173_avc_pdata = {
>         .num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_h264),
>         .output_formats = mtk_video_formats_output,
>         .num_output_formats = ARRAY_SIZE(mtk_video_formats_output),
> -       .min_bitrate = 1,
> -       .max_bitrate = 4000000,
> +       .min_bitrate = 64,
> +       .max_bitrate = 60000000,
>         .core_id = VENC_SYS,
>  };
>
> @@ -400,7 +400,7 @@ static const struct mtk_vcodec_enc_pdata mt8173_vp8_pdata = {
>         .output_formats = mtk_video_formats_output,
>         .num_output_formats = ARRAY_SIZE(mtk_video_formats_output),
>         .min_bitrate = 64,
> -       .max_bitrate = 4000000,
> +       .max_bitrate = 9000000,
>         .core_id = VENC_LT_SYS,
>  };
>
> --
> 2.25.1
>
