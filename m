Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E56022E87D
	for <lists+linux-media@lfdr.de>; Mon, 27 Jul 2020 11:07:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727996AbgG0JHC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jul 2020 05:07:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727982AbgG0JHA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jul 2020 05:07:00 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 461F9C061794
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2020 02:07:00 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id v6so1000004ota.13
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2020 02:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HYKgToXHXhx0gJz2aTB9SU//eyR38G50GGbzq2n5Ipw=;
        b=hPNIvNvpFOTTuiyz1gtUwXItKh0lDha0D8yxF72PrmXRN/3g7ABWPSATcOBc0/4qQ+
         Oi/jJNcK71J61tBAoBRZSwlh2A8FEOKUZc+dPww7gaiKNe6LU+hwXFjbVFcVKeuGUK+n
         qNlAEZxVzu9wK21hZVA2GI93Vf63+n9BtOuwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HYKgToXHXhx0gJz2aTB9SU//eyR38G50GGbzq2n5Ipw=;
        b=frbRwbyfXx2nhKajeMQatXTUBpnM/dET1eZCiafAFnE0k6PZJs/yevryfaiG+DsWhv
         3tWzz3pkmKo9gJ+9q7ido06nLMp20fdki/SUfmnGSQrVnnpYq/3lYf03L//XYclNdsHy
         Y1Ut8iAVaqCjyFWFWoQYPZGtgAIED3E8l1sgTLHVosJs8fzxXS4q01jvrP15vhPe0Ziw
         vWgnVJv1mXvl6bxh4JJtnMIl7m/KM3OTJ3a4zmb6idFlC6rKRAi0pspRJnhuJaLSun8F
         b1GH40J3SiphBZAzek47lOmEkFEAfnQB7RrAYrgNKKw7At8UKlMx1oBMw59bBOx99fGc
         ELUg==
X-Gm-Message-State: AOAM530jUfB1XyXimGgnEKRuJLOc+SL5hLcE7i1KjRuO07iTXXdzNdkS
        rdi4NAqXIV8HOFALQZLDKT4VaI9aCJE=
X-Google-Smtp-Source: ABdhPJzJCoOtxYznFEBMzsZ7W9pWFLLfBYoFec3jsD8OBk5/evgnQ1/JDfrHWDoamax3WBvNgYpuMQ==
X-Received: by 2002:a9d:5e18:: with SMTP id d24mr18930443oti.88.1595840818547;
        Mon, 27 Jul 2020 02:06:58 -0700 (PDT)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com. [209.85.210.53])
        by smtp.gmail.com with ESMTPSA id l78sm1954053oih.29.2020.07.27.02.06.56
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2020 02:06:57 -0700 (PDT)
Received: by mail-ot1-f53.google.com with SMTP id w17so11796476otl.4
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2020 02:06:56 -0700 (PDT)
X-Received: by 2002:a9d:5609:: with SMTP id e9mr18648943oti.141.1595840815529;
 Mon, 27 Jul 2020 02:06:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200713060842.471356-1-acourbot@chromium.org>
 <20200713060842.471356-8-acourbot@chromium.org> <CAAEAJfA4Po9R25CzBxiFAV=7-7rPujLc79zLnXyXWk7xNbBtYA@mail.gmail.com>
In-Reply-To: <CAAEAJfA4Po9R25CzBxiFAV=7-7rPujLc79zLnXyXWk7xNbBtYA@mail.gmail.com>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Mon, 27 Jul 2020 18:06:42 +0900
X-Gmail-Original-Message-ID: <CAPBb6MUsSzrZAZdeH+at+9pf5sVa0ghE982ktnPW8rB91pYt6Q@mail.gmail.com>
Message-ID: <CAPBb6MUsSzrZAZdeH+at+9pf5sVa0ghE982ktnPW8rB91pYt6Q@mail.gmail.com>
Subject: Re: [PATCH v3 07/16] media: mtk-vcodec: venc: specify supported
 formats per-chip
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        linux-media <linux-media@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Jul 26, 2020 at 11:29 PM Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
>
> Hi Alexandre,
>
> Last review on my side, this series looks mostly good.

Thanks for taking the time to look at it! I know it's not the best
looking code out there. ^_^;

>
> On Mon, 13 Jul 2020 at 03:09, Alexandre Courbot <acourbot@chromium.org> wrote:
> >
> > Different chips have different supported bitrate ranges. Move the list
>
> s/bitrate ranges/formats

Ack.

>
> > of supported formats to the platform data, and split the output and
> > capture formats into two lists to make it easier to find the default
> > format for each queue.
> >
> > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
> > ---
> >  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |   8 ++
> >  .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 122 +++++++-----------
> >  .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |  40 ++++++
> >  3 files changed, 95 insertions(+), 75 deletions(-)
> >
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > index b8f913de8d80..59b4b750666b 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > @@ -313,6 +313,10 @@ enum mtk_chip {
> >   * @has_lt_irq: whether the encoder uses the LT irq
> >   * @min_birate: minimum supported encoding bitrate
> >   * @max_bitrate: maximum supported encoding bitrate
> > + * @capture_formats: array of supported capture formats
> > + * @num_capture_formats: number of entries in capture_formats
> > + * @output_formats: array of supported output formats
> > + * @num_output_formats: number of entries in output_formats
> >   */
> >  struct mtk_vcodec_enc_pdata {
> >         enum mtk_chip chip;
> > @@ -321,6 +325,10 @@ struct mtk_vcodec_enc_pdata {
> >         bool has_lt_irq;
> >         unsigned long min_bitrate;
> >         unsigned long max_bitrate;
> > +       const struct mtk_video_fmt *capture_formats;
> > +       size_t num_capture_formats;
> > +       const struct mtk_video_fmt *output_formats;
> > +       size_t num_output_formats;
> >  };
> >
> >  /**
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> > index 50ba9da59153..05743a745a11 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> > @@ -23,47 +23,9 @@
> >  #define DFT_CFG_WIDTH  MTK_VENC_MIN_W
> >  #define DFT_CFG_HEIGHT MTK_VENC_MIN_H
> >  #define MTK_MAX_CTRLS_HINT     20
> > -#define OUT_FMT_IDX            0
> > -#define CAP_FMT_IDX            4
> > -
> >
> >  static void mtk_venc_worker(struct work_struct *work);
> >
> > -static const struct mtk_video_fmt mtk_video_formats[] = {
> > -       {
> > -               .fourcc = V4L2_PIX_FMT_NV12M,
> > -               .type = MTK_FMT_FRAME,
> > -               .num_planes = 2,
>
> Again, not an issue with your patch, so feel free to ignore this.
>
> You may avoid keeping track of num_planes (or any other
> property of the pixel format) and use v4l2_fill_pixfmt_mp
> to get all the information you need.

That's a good idea. Let's see if I can come with an extra patch in a
way that does not prevent the already acked patches from being merged.
:)
