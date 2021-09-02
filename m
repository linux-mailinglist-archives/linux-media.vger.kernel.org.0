Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0E123FF169
	for <lists+linux-media@lfdr.de>; Thu,  2 Sep 2021 18:31:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346236AbhIBQb6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Sep 2021 12:31:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345946AbhIBQb5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Sep 2021 12:31:57 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44AC2C061760
        for <linux-media@vger.kernel.org>; Thu,  2 Sep 2021 09:30:59 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id eb14so3781615edb.8
        for <linux-media@vger.kernel.org>; Thu, 02 Sep 2021 09:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=USYcfZjcg7/rxlJ01qDkInwsA0jQO3CoE6DaEmLtMHw=;
        b=SDXUXUjmEVYZVRMiOjlF6C4d8OElSn6OzwvpYK2P3+X6vbGGhNs3jl1Ah1E0/7xecX
         WWKAnRPN44pWc3rcAL4fQhmzfslDo5omfiE/1QZB2cYPVDj2K3bHJezEtHeyfh4cZlHb
         d8c+n71v8TI/B/n08wsJhylVzu1ptUpffH6Tj9cHySfMqmneUXvCAGax3A+ws/lnAOzo
         o7vHeWehks3XPV9NwG3j6PWL5/2PsZisukEAt1fEfETB+2q4LMGvOHld5BCtF9YHg0LS
         +TDuif9usO4s7ySKeqHgR01drPlO+/7cMmNeK7GuHBQiBM6gtzzq7oAPTXu1Grr4gx3+
         C2QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=USYcfZjcg7/rxlJ01qDkInwsA0jQO3CoE6DaEmLtMHw=;
        b=AHOf7EBdVr542ya6U5lappWgqKg4o1QnrqwH2G8ujZEQAiKGqHjeKLwbLbGmUZqZZt
         3zgPERJTt1j4vSJh4vt2JNRLh29Pc2w2H/hwYNfCJhndRHkMJQBIW5Mjir7jtoJ53H7N
         m0U9qzk1FnBJAPDUPOlCQVBYi/Av/epgnBmHI2qPisj+9RoA7NO4+8WVEpY1qlQRCE8v
         tOYfJrXckN1ocgBpPs/Tw/dr6cNGfQXIothLuBqFnG2gN7FG2Gpef9h3lZtVSy9WVTKj
         6I/Nt9YQJDvJZSVO9QrNLT4qjphGWiZmgmCA437R2Uwwgj02lepH7TCR/8y67QCCTRmm
         P9EQ==
X-Gm-Message-State: AOAM531zkvGsOo3Tn5bPFfcJzlAUKpSrchPYtPOXIjppWWbXS/mA2wob
        dVtHQKR3Al+QXVuayj5ye3/HtYiabhbwsuvSG9pXLQ==
X-Google-Smtp-Source: ABdhPJy5d8mB0+bh+1dUQc9dMKYmM1vESBNDZccve874Sy179Xy0j7+SM+XKQHqNCiicfZiEUKLtVAnozq+y+AYfH1E=
X-Received: by 2002:aa7:d157:: with SMTP id r23mr4287441edo.322.1630600257783;
 Thu, 02 Sep 2021 09:30:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210901083215.25984-1-yunfei.dong@mediatek.com>
In-Reply-To: <20210901083215.25984-1-yunfei.dong@mediatek.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Thu, 2 Sep 2021 13:30:46 -0300
Message-ID: <CAAEAJfDOt_GyDPojcj5P6Wou9HC2GC8YzRt2wYyqdrCOjfeOog@mail.gmail.com>
Subject: Re: [PATCH v6, 00/15] Using component framework to support multi
 hardware decode
To:     Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Irui Wang <irui.wang@mediatek.com>,
        linux-media <linux-media@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Project_Global_Chrome_Upstream_Group 
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 1 Sept 2021 at 05:32, Yunfei Dong <yunfei.dong@mediatek.com> wrote:
>
> This series adds support for multi hardware decode into mtk-vcodec, by first
> adding component framework to manage each hardware information: interrupt,
> clock, register bases and power. Secondly add core thread to deal with core
> hardware message, at the same time, add msg queue for different hardware
> share messages. Lastly, the architecture of different specs are not the same,
> using specs type to separate them.
>
> This series has been tested with both MT8183 and MT8173. Decoding was working
> for both chips.
>
> Patches 1~3 rewrite get register bases and power on/off interface.
>
> Patch 4 add component framework to support multi hardware.
>
> Patch 5 separate video encoder and decoder document
>
> Patches 6-15 add interfaces to support core hardware.
> ----
> This patch dependents on : "media: mtk-vcodec: support for MT8183 decoder"[1] and
> "Mediatek MT8192 clock support"[2].
>
> 1: Multi hardware decode is based on stateless decoder, MT8183 is the first time
> to add stateless decoder. Otherwise it will cause conflict. This patch will be
> accepted in 5.15[1].
>
> 2: The definition of decoder clocks are in mt8192-clk.h, this patch already in clk tree[2].
>
> [1]https://patchwork.linuxtv.org/project/linux-media/list/?series=5826
> [2]https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/commit/?h=clk-next&id=f35f1a23e0e12e3173e9e9dedbc150d139027189
> ----
> Changes compared with v5:
> -Add decoder hardware block diagram for patch 13/15
>


The discussion on v5 was still on-going, so sending this v6
is not helpful. The context for v5's discussion is now harder to find.

Please avoid sending a new version without properly
discussing all the feedback, and without reaching consensus.
This is very important, please keep it in mind.

Specifically, the feedback on v5 was NAK, with the request to avoid
using any async framework, and instead try to find a simpler solution.

For instance, you can model things with a bus-like pattern,
which ties all the devices together, under a parent node.
This pattern is common in the kernel, the parent
node can use of_platform_populate or similar
(git grep of_platform_populate, you will see plenty of examples).

You will still have to do some work to have the proper
regs resources, but this is doable. Each child is a device,
so it can have its own resources (clocks, interrupts, iommus).

You don't need any async framework.

    vcodec_dec: vcodec_dec@16000000 {
        compatible = "mediatek,mt8192-vcodec-dec";
        reg = <something>;
        mediatek,scp = <&scp>;
        iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
        dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;

        vcodec_lat@0x10000 {
            compatible = "mediatek,mtk-vcodec-lat";
            reg = <0x10000 0x800>;      /* VDEC_MISC */
            interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH 0>;
            // etc
        };

        vcodec_core@0x25000 {
           compatible = "mediatek,mtk-vcodec-core";
           reg = <0x25000 0x1000>;      /* VDEC_CORE_MISC */
           interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH 0>;
           // etc
        };
    };

Thanks,
Ezequiel
