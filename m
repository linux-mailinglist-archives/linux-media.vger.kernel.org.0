Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E1783BA027
	for <lists+linux-media@lfdr.de>; Fri,  2 Jul 2021 14:00:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232055AbhGBMDO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jul 2021 08:03:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232026AbhGBMDO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jul 2021 08:03:14 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32960C061762;
        Fri,  2 Jul 2021 05:00:41 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id o6so11006207oic.9;
        Fri, 02 Jul 2021 05:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YJ+EtDWQs+us5BNhruD1jgDhGjdRaOspQtCVuCEvz6w=;
        b=HjTbAAxcGzjV6TBksscfbS39Y0D5cXtkVuCR9ZUNTYvK7MNOcQXOaW6LVxvxFcxiNa
         259jkdIOYViNy6gVGSIDmEiAt0DLNGa66t+q01Oi7MYvCrIntzJ6mgd80d3Ww+oiAPQp
         w9Df7ljvR+MRo4t6/YhXSeERV1yKgCzkyG4/PhNtUan/GFDZMHtlGveKMjyvTbhwKgsJ
         FXlFT9mIe58Gqjus8GKGNWfJHpJQZ5AyVHHdNZnHVgkpuGZxwhHqnZ4A1FcaEaB5qSyl
         DTBfAnG99kySz8EwXWQwrtXBk9PgfDMJNHmGz0OOCN9fexL5hTL4XGFhZC+Mj8XcajRi
         152A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YJ+EtDWQs+us5BNhruD1jgDhGjdRaOspQtCVuCEvz6w=;
        b=Wij14HJkoPkmDgsorD+AgNS53SJLaEK17ruAHXmJzH+2nd5owPdIQyUJuIKKhWNwxa
         PuWm6m40c97++5P5Nt4D7Dh/l517t9WmgSdAHC8bNhK9bHrRejYCI9jAwe6/Vk18QNUF
         EEviEsUWg6Y0ZxZRNbqFiufHge10hvAFVUZEf6Kb/jy5SpkAoMoBApykggXvFwAGHjDn
         GqSzeqOluA//CnWMnPgPeY0gArrQ+xn9JLtZoqNQB97R3AqdschJfbg9DNk23PHWXKz+
         pNcpiHZAgZidDsS0iRKNwRJ48pJsx3LBFnLehPudUcwoonhhRh5kIjzPzRO6L5N6gsDA
         YGuw==
X-Gm-Message-State: AOAM5315gmPHBbkKC97/BAcHLYleUJrBXH4GYxQMtVwWvD0l0026qHem
        HXJirrxMl/0hPEQ7DE04n3MMpojRXtvkEY3b6Ig=
X-Google-Smtp-Source: ABdhPJxaqD6iLUK7oN18ismHWnS+wN5LDYUpPu6kfPNxTL9+T0VoE/IqpdnTG+Nc8XgAtZvT3BpB6IhtsXLxXXkfxco=
X-Received: by 2002:aca:a9d0:: with SMTP id s199mr3600343oie.47.1625227240500;
 Fri, 02 Jul 2021 05:00:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210623073549.24170-1-moudy.ho@mediatek.com>
In-Reply-To: <20210623073549.24170-1-moudy.ho@mediatek.com>
From:   Enric Balletbo Serra <eballetbo@gmail.com>
Date:   Fri, 2 Jul 2021 14:00:28 +0200
Message-ID: <CAFqH_51+wQ=MxOKAfjA7nBspjcqfsRPy0oxg3iripuYJQ3HEmA@mail.gmail.com>
Subject: Re: [RFC PATCH V0 01/10] media: mtk-mdp3: Add Mediatek MDP Driver
To:     Moudy Ho <moudy.ho@mediatek.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        daoyuan huang <daoyuan.huang@mediatek.com>,
        Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Landley <rob@landley.net>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org, drinkcat@chromium.org, acourbot@chromium.org,
        pihsun@chromium.org, menghui.lin@mediatek.com,
        sj.huang@mediatek.com, ben.lok@mediatek.com, randy.wu@mediatek.com,
        srv_heupstream@mediatek.com, frederic.chen@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mody Ho,

Thank you for your patch. Some comments below.

Missatge de Moudy Ho <moudy.ho@mediatek.com> del dia dc., 23 de juny
2021 a les 9:36:
>
> From: mtk18742 <moudy.ho@mediatek.com>
>

Please fix your git configuration, I assume this should be something
like Moudy Ho <moudy.ho@mediatek.com>. Note that the author and the
Signed-off must match.

> Add MDP driver for MT8183
>

In general please use a more verbose commit messages, you know what
MDP means (I probably also know, but not everyone knows what MDP
means) It is a good practice to when you introduce a new driver to
explain well what is and for what is used.

The first question that I have here is why current MDP driver (that
supports other Mediatek chips like the MT8173) can't be extended to
support MT8183. How different is this MDP driver and why can't share
the code.

This single patch is huge, and is unlikely that anyone spend time
reviewing it just for that. I'd recommend to split it and introduce
step-by-step, functionality by functionally. I also have the
impression that you're just reimplementing things that are actually
upstream or not taking advantage of what is already upstream. i.e the
access to the mmsys registers. Please use current kernel
drivers/interfaces API instead of reimplementing it.

I'd strongly recommend to look at current Mediatek mdp driver and see
if you can add support for MT8183 there, and if not, looks at it as
reference.

Best regards,
  Enric


> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  drivers/media/platform/Kconfig                |   17 +
>  drivers/media/platform/Makefile               |    2 +
>  drivers/media/platform/mtk-mdp3/Makefile      |    9 +
>  drivers/media/platform/mtk-mdp3/isp_reg.h     |   37 +
>  .../media/platform/mtk-mdp3/mdp-platform.h    |   58 +
>  .../media/platform/mtk-mdp3/mdp_reg_ccorr.h   |   75 +
>  .../media/platform/mtk-mdp3/mdp_reg_rdma.h    |  206 +++
>  drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h |  109 ++
>  .../media/platform/mtk-mdp3/mdp_reg_wdma.h    |  125 ++
>  .../media/platform/mtk-mdp3/mdp_reg_wrot.h    |  115 ++
>  .../media/platform/mtk-mdp3/mmsys_config.h    |  188 +++
>  drivers/media/platform/mtk-mdp3/mmsys_mutex.h |   35 +
>  .../media/platform/mtk-mdp3/mmsys_reg_base.h  |   38 +
>  drivers/media/platform/mtk-mdp3/mtk-img-ipi.h |  282 ++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.c   |  521 +++++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.h   |   54 +
>  .../media/platform/mtk-mdp3/mtk-mdp3-comp.c   | 1329 +++++++++++++++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-comp.h   |  155 ++
>  .../media/platform/mtk-mdp3/mtk-mdp3-core.c   |  282 ++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-core.h   |   86 ++
>  .../media/platform/mtk-mdp3/mtk-mdp3-debug.c  |  973 ++++++++++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-debug.h  |   39 +
>  .../media/platform/mtk-mdp3/mtk-mdp3-m2m.c    |  804 ++++++++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-m2m.h    |   42 +
>  .../media/platform/mtk-mdp3/mtk-mdp3-regs.c   |  748 ++++++++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-regs.h   |  373 +++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-vpu.c    |  313 ++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-vpu.h    |   79 +
>  28 files changed, 7094 insertions(+)
>  create mode 100644 drivers/media/platform/mtk-mdp3/Makefile
>  create mode 100644 drivers/media/platform/mtk-mdp3/isp_reg.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mdp-platform.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_ccorr.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_rdma.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_wdma.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_wrot.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mmsys_config.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mmsys_mutex.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mmsys_reg_base.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-img-ipi.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-debug.c
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-debug.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.c
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.h

 [snip]

> --
> 2.18.0
>
