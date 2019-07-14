Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA16267DD7
	for <lists+linux-media@lfdr.de>; Sun, 14 Jul 2019 09:01:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726227AbfGNHBE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jul 2019 03:01:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:35434 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725958AbfGNHBE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jul 2019 03:01:04 -0400
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 65C9A2064A
        for <linux-media@vger.kernel.org>; Sun, 14 Jul 2019 07:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563087663;
        bh=adBrjHSpkk22mnLLbl/iv2929KizSrVFZ5lreBod0hA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ZaiE02rqd6G1ZfKrkA/mfUKEUS+ISsBIh9IAg0HongEUxTgbx2ozIkv0Nvq7WspTu
         lOgaoK0tgxoXP+EwKXh0POA16C6XUD/lEK1EksJZEVNE75FnTKaH91nIcllyFQBg+V
         dD38LXjoJ9h0iaF81Wqt6jtJhvnPEKXtCJfkASaU=
Received: by mail-wr1-f45.google.com with SMTP id g17so13809676wrr.5
        for <linux-media@vger.kernel.org>; Sun, 14 Jul 2019 00:01:03 -0700 (PDT)
X-Gm-Message-State: APjAAAXAQ5ud6VqpbqILb7Y9ryyOF/nxB2qH9kQbdaQQUcTg7vPMpcHh
        g0yPhEpv5pjHKZeOvPnuyHExmUrRFjgKgXuup2Q=
X-Google-Smtp-Source: APXvYqwvuEQL8FEpumbvIIJm+cxQ5xe4+F60oXxmbyI8CcmjYg+8gQiJWbyNuLyDYFCJyMYz7zY5tM//mPwRq4LcVkY=
X-Received: by 2002:a5d:50d1:: with SMTP id f17mr19352083wrt.124.1563087662038;
 Sun, 14 Jul 2019 00:01:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190712224700.11285-1-sean@mess.org> <20190712224700.11285-3-sean@mess.org>
In-Reply-To: <20190712224700.11285-3-sean@mess.org>
From:   Sean Wang <sean.wang@kernel.org>
Date:   Sun, 14 Jul 2019 00:00:50 -0700
X-Gmail-Original-Message-ID: <CAGp9Lzq+RcizFgP4LJMxaH3K6Jcbk8jit8bv+3M2fwqwwV4NvA@mail.gmail.com>
Message-ID: <CAGp9Lzq+RcizFgP4LJMxaH3K6Jcbk8jit8bv+3M2fwqwwV4NvA@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: mtk-cir: lower de-glitch counter for rc-mm protocol
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Frank Wunderlich <frank-w@public-files.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 12, 2019 at 3:47 PM Sean Young <sean@mess.org> wrote:
>
> The rc-mm protocol can't be decoded by the mtk-cir since the de-glitch
> filter removes pulses/spaces shorter than 294 microseconds.
>
> Tested on a BananaPi R2.

Thanks for grabbing the board and do the test voluntarily.

>
> Signed-off-by: Sean Young <sean@mess.org>

Acked-by: Sean Wang <sean.wang@kernel.org>

> ---
>  drivers/media/rc/mtk-cir.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/media/rc/mtk-cir.c b/drivers/media/rc/mtk-cir.c
> index 9dc467ebae24..8027181de985 100644
> --- a/drivers/media/rc/mtk-cir.c
> +++ b/drivers/media/rc/mtk-cir.c
> @@ -35,6 +35,11 @@
>  /* Fields containing pulse width data */
>  #define MTK_WIDTH_MASK           (GENMASK(7, 0))
>
> +/* IR threshold */
> +#define MTK_IRTHD               0x14
> +#define MTK_DG_CNT_MASK                 (GENMASK(12, 8))
> +#define MTK_DG_CNT(x)           ((x) << 8)
> +
>  /* Bit to enable interrupt */
>  #define MTK_IRINT_EN             BIT(0)
>
> @@ -400,6 +405,9 @@ static int mtk_ir_probe(struct platform_device *pdev)
>         mtk_w32_mask(ir, val, ir->data->fields[MTK_HW_PERIOD].mask,
>                      ir->data->fields[MTK_HW_PERIOD].reg);
>
> +       /* Set de-glitch counter */
> +       mtk_w32_mask(ir, MTK_DG_CNT(1), MTK_DG_CNT_MASK, MTK_IRTHD);
> +
>         /* Enable IR and PWM */
>         val = mtk_r32(ir, MTK_CONFIG_HIGH_REG);
>         val |= MTK_OK_COUNT(ir->data->ok_count) |  MTK_PWM_EN | MTK_IR_EN;
> --
> 2.21.0
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
