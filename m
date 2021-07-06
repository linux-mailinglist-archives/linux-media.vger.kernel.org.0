Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FE9A3BCB3E
	for <lists+linux-media@lfdr.de>; Tue,  6 Jul 2021 13:00:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231561AbhGFLDR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jul 2021 07:03:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231543AbhGFLDQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jul 2021 07:03:16 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04F0AC061574
        for <linux-media@vger.kernel.org>; Tue,  6 Jul 2021 04:00:37 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id l5so24365411iok.7
        for <linux-media@vger.kernel.org>; Tue, 06 Jul 2021 04:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D9cJE9ZmLAhI4Z30OwANBpOGqptuN+YARhU6HockOH0=;
        b=OHgy1t6yQ7FLN3DygkT/BL+g1Fd0Y0bRZKpFs6VjQGau1kDmMGzL7F0PoN0fZTXJd2
         Qi9N0mqttZRAXdoPHG83q7gdrpYsOkUxdIvAJSSHYSGWL4DXfbc8zWv9CdDOsFCBwtT+
         D23O7XCfv/5/VemHuPMLO7xRZ/ifUDfmjlDdKhcNWYhZ3Ybp1Q3BCBHt85KSa1KysN1P
         VCJ6i61tTgQHnvs3ll/ziMz3PeOedLUZnwLerwbilVNQKAVBx13i15r3WJ6V0BBIDdUm
         E0GS4Jm+xxRGuw1x7Jq93k2/zwBGAfrYJz1HGkhFn/hcxSJVliDJet/g+YqaXSia3VbK
         P5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D9cJE9ZmLAhI4Z30OwANBpOGqptuN+YARhU6HockOH0=;
        b=Rgg5FOoWj0b+xNQWd/iEAzUrHWJivtbUxwMVXJC+g4h0bJi+9STTEz8T66yrKaa3M+
         5ZtkQbtiAbIoueHnq05TbvgnVJVGMYCt6H1ia++dViBKa0Pf7yWxE4IP/wEC6Qp8qnVI
         u8gBKbVVr4hCiWAqw/0I+ZOMkVbFLIEcyYZ7mKB6j3R27Ic+d79j+lydwNpO5NVxlJEP
         XZPLSIItw/2AFSk1V3rkhbtE4DTSGBk2DT679DaIx8KFu1eVQUcdcuxOFoS6J/1vvWEc
         TWnOwMCobO6qYimKT6u5DD5UqFTmuy9iTrAyX7ih74f1wIkxs2it97q82RHaEjHclzju
         f7SA==
X-Gm-Message-State: AOAM533N527LgcjF799rs5i3bDmbnotOHrTEKvP85xUoZGF2ticWOtfa
        sucVlSSx3tjV7PTlhbv9HA4DUhpRfelTzWQ5BRHzuQ==
X-Google-Smtp-Source: ABdhPJwQeTYajARaI85ZZA6cdpsrwFxnkE+PReeU0ZLQgcXDRmZbVRnHS07ukEQ4C29jdKjOddBIiVCJy35vC5fgxEA=
X-Received: by 2002:a5d:840c:: with SMTP id i12mr15050087ion.185.1625569236207;
 Tue, 06 Jul 2021 04:00:36 -0700 (PDT)
MIME-Version: 1.0
References: <1625038079-25815-1-git-send-email-kyrie.wu@mediatek.com> <1625038079-25815-3-git-send-email-kyrie.wu@mediatek.com>
In-Reply-To: <1625038079-25815-3-git-send-email-kyrie.wu@mediatek.com>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Tue, 6 Jul 2021 19:00:25 +0800
Message-ID: <CA+Px+wVE=QKh2-+RZevLUweFEUuoovW-1=Da2AWzB1fnJP=EKw@mail.gmail.com>
Subject: Re: [PATCH v2,2/9] media: mtk-jpegenc: Add MT8195 JPEG venc driver
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

On Wed, Jun 30, 2021 at 3:32 PM kyrie.wu <kyrie.wu@mediatek.com> wrote:
> Add MT8195 JPEG venc driver's compatible and device private data.
> compatible = "mediatek,mt8195-jpgenc": this node would only register
> jpgenc device node;
> compatible = "mediatek,mt8195-jpgenc0": HW0 node, this node would not
> register jpgenc device node, but register irq, init clk and power,
> remmap register base and do other resource options;
> compatible = "mediatek,mt8195-jpgenc1": HW1 node, just like HW0 node;
The commit message is not easy to read.  Please rephrase the sentences.

What does "venc" stand for?  I believe it is a copy-n-paste typo.

The commit title "support MT8195 JPEG encoder" looks better to me.

> -static const struct mtk_jpeg_variant mtk_jpeg_drvdata = {
> +static const struct mtk_jpeg_variant mtk_jpegenc_drvdata = {
Why remove mtk_jpeg_drvdata?

> -       .irq_handler = mtk_jpeg_enc_irq,
Why remove the IRQ handler?

> @@ -1548,10 +1551,6 @@ static const struct of_device_id mtk_jpeg_match[] = {
>                 .compatible = "mediatek,mt2701-jpgdec",
>                 .data = &mt8173_jpeg_drvdata,
>         },
> -       {
> -               .compatible = "mediatek,mtk-jpgenc",
> -               .data = &mtk_jpeg_drvdata,
> -       },
Why remove "mediatek,mtk-jpgenc"?

> +#if defined(CONFIG_OF)
> +static const struct of_device_id mtk_jpegenc_hw_ids[] = {
> +       {
> +               .compatible = "mediatek,mt8195-jpgenc0",
> +       },
> +       {       .compatible = "mediatek,mt8195-jpgenc1",
> +       },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(of, mtk_jpegenc_hw_ids);
> +#endif
Would expect somewhere to reference mtk_jpegenc_hw_ids but failed to find it.
