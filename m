Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16EC3416D37
	for <lists+linux-media@lfdr.de>; Fri, 24 Sep 2021 09:56:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244536AbhIXH4y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Sep 2021 03:56:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244520AbhIXH4u (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Sep 2021 03:56:50 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DA6AC061757
        for <linux-media@vger.kernel.org>; Fri, 24 Sep 2021 00:55:17 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id i4so36878849lfv.4
        for <linux-media@vger.kernel.org>; Fri, 24 Sep 2021 00:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JGmW9C+VJgClTUsrZKCeV0/J9rVWIZQmzpXvw/rQpIk=;
        b=Ahrt2ozoHr1F1XaGJc8UFWICEWx8gXzt2P8DnqE+76I7f+qcZ4PJLWcuYI7YYLRuRF
         295dBHmchEjQ+f5oiSMLwpl0RZfub+JdzvYGDp7mjQ8AaIXLVPfVNgYDTMO7EVOxbxg1
         dGIlLtwfrbge+SQVQC4xuZMPe1HxIqWieoegc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JGmW9C+VJgClTUsrZKCeV0/J9rVWIZQmzpXvw/rQpIk=;
        b=uzLh7Xdae8bUSarHpC3Cg5j5eB6OT0O4QOBLb/GJ5JgzvqT/CjaaOHlh03Y/PFGPip
         RVvmrIfDzlif+Ux3HSdf6F5QIVtkWaVenSTe93i5zsx/d6qBRlryz9Tzhz6sFVatpVOn
         Qj5zlC/lZVAgKWPbU+dTVKO/LgL8Kw31h1hZnAm1HQQenTvZ9CeKgyY0/0yYJT13qLMb
         tU6RhC9ln/jyE+C1mVoI6PM62yDvg4pVng+P8npwvcMvK+vAjlqDKP66sa1It1B6FLtn
         rvezu0SO6WxMN7QZjFfRpK0phU44Yr1l8gYToqzIb0TsAPYUDMx+2tQQdSJv10SQwkAm
         bMvw==
X-Gm-Message-State: AOAM530cdrJx1YPM5VgVJkf7FFpuLHSLScVzm8eiPCj/xCVg19LAMt1X
        88OJlsJqLA3fkEDokEDTRJpXWdql5UbBXzeITiSGrw==
X-Google-Smtp-Source: ABdhPJzkFv7HLV5oiZBfchGG412aWLIODM5Pu3aEuCwVKvIU5JXdh28L0/JBma6qNUvVyNbpJPJPjk4Mep/rE15SXIc=
X-Received: by 2002:a05:651c:1505:: with SMTP id e5mr9964384ljf.9.1632470115670;
 Fri, 24 Sep 2021 00:55:15 -0700 (PDT)
MIME-Version: 1.0
References: <1632469543-27345-1-git-send-email-kyrie.wu@mediatek.com>
In-Reply-To: <1632469543-27345-1-git-send-email-kyrie.wu@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 24 Sep 2021 15:55:04 +0800
Message-ID: <CAGXv+5H3MRhSi=x0UA2vsXheDjVR0Cdig0DmEvS5dLLgSBCnvA@mail.gmail.com>
Subject: Re: [PATCH V4,0/5] Support jpeg encoder for MT8195
To:     "kyrie.wu" <kyrie.wu@mediatek.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Project_Global_Chrome_Upstream_Group 
        <Project_Global_Chrome_Upstream_Group@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Devicetree List <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>, xia.jiang@mediatek.com,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Irui Wang <irui.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 24, 2021 at 3:46 PM kyrie.wu <kyrie.wu@mediatek.com> wrote:
>
> MT8195 has two jpeg encoding HW, each one has its own
> power-domain, clock, interrupt, register base.
> The two jpeg encoding HW can work together to
> achieve higher performance.
>
> Generally, one HW needs to register one device node,
> and the APP operates the HW through the device node.
> If there are multiple HWs, the multiple device node
> needs to be registered. At this time, the app needs
> to design software logic to use multiple HWs in parallel,
> which will undoubtedly increase the difficulty of
> app development and weaken its compatibility.
>
> These serial patches use the component framework
> to achieve the purpose of using multiple HWs
> through only one device node. About the component
> framework Block Diagram, please check below:
>
>                 Master(device node)
>         ________|_________________________
>         |                      |             |
> component0(HW0) component1(HW1) component2(HW2) ......
>
> As above, the component framework is similar to a
> master-component two level architecture.
> Both master and component have the compatible
> attribute in the device tree, and the corresponding
> platform driver structure is defined in the driver.
> Therefore, when the compatible attribute matches,
> the corresponding probe function will be called.
>
> In the probe function of component, operations
> such as initialization clock, remmap register base,
> registration interrupt will be performed.
> And add the component to a component linked
> list to find the corresponding master.
>
> In the probe function of the master, the device
> node will be registered, and the master will be
> added to a master linked list to find the
> corresponding component.
>
> After the master matches the component,
> it will obtain the clock, interrupt, register base
> and other resources in the component,
> and operate the HW through these resources.
> At the same time, multiple HWs software function
> interfaces are designed in the master driver.


Please include a changelog with your cover letter (or in each patch).
This is the fourth version of the series, and it's unclear what has
changed between the versions.


ChenYu

> kyrie.wu (5):
>   dt-bindings: mediatek: Add mediatek, mt8195-jpgenc compatible
>   media: mtk-jpegenc: Use component framework to manage each hardware
>   media: mtk-jpegenc: add jpegenc timeout func interface
>   media: mtk-jpegenc: add jpeg encode worker interface
>   media: mtk-jpegenc: add output pic reorder interface
>
>  .../bindings/media/mediatek-jpeg-encoder.yaml      |   3 +
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c    | 395 ++++++++++++++++++---
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h    |  79 +++++
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c  | 298 ++++++++++++++++
>  4 files changed, 730 insertions(+), 45 deletions(-)
>
> --
> 2.6.4
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
