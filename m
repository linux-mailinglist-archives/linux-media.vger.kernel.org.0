Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 200483BCB44
	for <lists+linux-media@lfdr.de>; Tue,  6 Jul 2021 13:02:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231754AbhGFLDb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jul 2021 07:03:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231727AbhGFLD3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jul 2021 07:03:29 -0400
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7235BC061764
        for <linux-media@vger.kernel.org>; Tue,  6 Jul 2021 04:00:50 -0700 (PDT)
Received: by mail-io1-xd2e.google.com with SMTP id q2so9214799iot.11
        for <linux-media@vger.kernel.org>; Tue, 06 Jul 2021 04:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eEmJIJa0v/rePle6ZiJmkXBLf0tXP2KOovjivMZBv80=;
        b=QwfTscdCnYxl5W3v0uqo+Vp9odw4vdnPwAoBVqUYPoMBhGwbWub8cjaVgWVSAKbUP/
         jjvblrcSDn3hzJET+O5YGqybeZbrnheV73a9Q63Tk6gBUVkpPogvHBkJVuIUso1Als8p
         OqwFZLETeRJmiP4aLUbJAzic7A1tPzcnwKeqxKPFNJURtV04Vlw3zRjQHhYPI3JPJUja
         bszPardb0bXROaBdbxG6zb+PManXPuXffhjcOjmWYt7Wday1lhU7QujyJDMdtqgK3P/8
         YAV8gT1rW7h9DsJ6BfiJTLQgb866FGNuY29J/iPSihEQY+mZ3vwAxv+JmMNH2We+ebGF
         T0rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eEmJIJa0v/rePle6ZiJmkXBLf0tXP2KOovjivMZBv80=;
        b=s18s6PNym6xOMmYKgJ6yc+vSARhiW0Ob02kwdovRfsr1gGRnApxiZWuEbZieEh46mp
         GuW6BxMZQ0XICNRnfLqlg2ePamtTfD/V0f65e2bdcXcAp+Z7kAlCsKfRzqcHK8Bdm7BG
         vKgNDi30y8I8htx1dpRYbnlVaXPiGv9BPQu53dGP0pk9wy2HxkF2b6x7DOEqJ8yp3p04
         g12QQ7Ceb0NNPwIazf4Lj9hbk8MRKHDciQlfWlyL0OC5LSNCe19BQaxCVozYG8vqIXLS
         jhN4QEWLs04O1r29fbNuLmXSlRXTInYXiWYruhoL35amxQ8yfjn7CzUWcRX6cZ0RveB2
         7TUg==
X-Gm-Message-State: AOAM532NEmPhDvP87J9+uIFa9800CamWIEnVvei5LuvR5gcm/C1dtWeN
        ZLkmfNsac/csEtpuMFal7miEm8WITCucYpHkcZMPGw==
X-Google-Smtp-Source: ABdhPJxvj13Qe7ShtfOQOOMs44W/5ZrbsATHscYcUYaEOc5irj6+5wlNH6VxwLBPlwT/L07LNCOgx7R1idVY9sS9l5Y=
X-Received: by 2002:a02:b155:: with SMTP id s21mr12465245jah.50.1625569249677;
 Tue, 06 Jul 2021 04:00:49 -0700 (PDT)
MIME-Version: 1.0
References: <1625038079-25815-1-git-send-email-kyrie.wu@mediatek.com> <1625038079-25815-5-git-send-email-kyrie.wu@mediatek.com>
In-Reply-To: <1625038079-25815-5-git-send-email-kyrie.wu@mediatek.com>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Tue, 6 Jul 2021 19:00:38 +0800
Message-ID: <CA+Px+wW-L__+mGpvA3P0C7KQh=mJrQ2g0ciPVO=rKnueONqo0A@mail.gmail.com>
Subject: Re: [PATCH v2,4/9] media: mtk-jpegenc: Refactor jpeg clock interface
To:     "kyrie.wu" <kyrie.wu@mediatek.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bin Liu <bin.liu@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Tomasz Figa <tfiga@chromium.org>, xia.jiang@mediatek.com,
        maoguang.meng@mediatek.com, srv_heupstream@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 30, 2021 at 3:28 PM kyrie.wu <kyrie.wu@mediatek.com> wrote:
> Using the needed param for lock on/off function.
The description makes less sense.

The patch is more than a "refactor".  Please change the title accordingly.

>  static void mtk_jpeg_clk_on(struct mtk_jpeg_dev *jpeg)
>  {
> -       int ret;
> +       struct mtk_jpeg_dev *comp_dev;
> +       struct mtk_jpegenc_pm *pm;
> +       struct mtk_jpegenc_clk *jpegclk;
> +       struct mtk_jpegenc_clk_info *clk_info;
> +       int ret, i;
> +
> +       if (jpeg->variant->is_encoder) {
> +               for (i = 0; i < MTK_JPEGENC_HW_MAX; i++) {
> +                       comp_dev = jpeg->hw_dev[i];
> +                       if (!comp_dev) {
> +                               dev_err(jpeg->dev, "Failed to get hw dev\n");
> +                               return;
> +                       }
> +
> +                       pm = &comp_dev->pm;
> +                       jpegclk = &pm->venc_clk;
> +                       clk_info = jpegclk->clk_info;
> +                       ret = clk_prepare_enable(clk_info->jpegenc_clk);
> +                       if (ret) {
> +                               dev_err(jpeg->dev, "jpegenc clk enable %d %s fail\n",
> +                                      i, jpegclk->clk_info->clk_name);
> +                               return;
> +                       }
> +               }
> +               return;
> +       }
Doesn't it need to call clk_disable_unprepare() in the error paths?

> +                       pm = &comp_dev->pm;
> +                       jpegclk = &pm->venc_clk;
> +                       clk_disable_unprepare(jpegclk->clk_info->jpegenc_clk);
Consistency issue: mtk_jpeg_clk_on() has struct mtk_jpegenc_clk_info
*clk_info.  Why not also have the local variable here?

Is it a good idea to just separate functions for ->is_encoder for
mtk_jpeg_clk_on() and mtk_jpeg_clk_off()?  For example,
mtk_jpegenc_clk_on() and mtk_jpegdec_clk_on().

> +/** * struct mtk_jpegenc_clk_info - Structure used to store clock name */
> +struct mtk_jpegenc_clk_info {
> +       const char      *clk_name;
> +       struct clk      *jpegenc_clk;
> +};
> +
> +/* struct mtk_vcodec_clk - Structure used to store vcodec clock information */
> +struct mtk_jpegenc_clk {
> +       struct mtk_jpegenc_clk_info     *clk_info;
> +       int     clk_num;
> +};
> +
> +/** * struct mtk_vcodec_pm - Power management data structure */
> +struct mtk_jpegenc_pm {
> +       struct mtk_jpegenc_clk  venc_clk;
> +       struct device   *dev;
> +       struct mtk_jpeg_dev     *mtkdev;
> +};
> +
>  /**
>   * struct mtk_jpeg_dev - JPEG IP abstraction
>   * @lock:              the mutex protecting this structure
> @@ -103,6 +128,9 @@ struct mtk_jpeg_dev {
>         struct device           *larb;
>         struct delayed_work job_timeout_work;
>         const struct mtk_jpeg_variant *variant;
> +
> +       struct mtk_jpeg_dev *hw_dev[MTK_JPEGENC_HW_MAX];
> +       struct mtk_jpegenc_pm pm;
>  };
If the declaration cannot align, using 1-space is sufficient.
