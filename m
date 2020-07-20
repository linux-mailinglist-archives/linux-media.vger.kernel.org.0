Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0DF8226744
	for <lists+linux-media@lfdr.de>; Mon, 20 Jul 2020 18:10:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387636AbgGTQKM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jul 2020 12:10:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:48548 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387633AbgGTQKL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jul 2020 12:10:11 -0400
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3404E2064B;
        Mon, 20 Jul 2020 16:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595261410;
        bh=U7uXjX8IfjoIHHcZ94LBnWRXLP1OX+olQJgVuZvrYz8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=mywFm7Q0v6qrIqaQ80nhFbUpcFOGRvUhHtCEA/fayqjg0rtYs/pYaWNKJfRqyw3i7
         XLoxMzbKuZ6U1GcIcAVpCuXX8oodHcdxaDHqTU0uV8Uk8ODLH1CZk2FLTVg8JWrWk5
         azVsSx9XhFktMuRsA0P0lAJSD1h4gOcHR2w6hAVE=
Received: by mail-ej1-f42.google.com with SMTP id w9so4531276ejc.8;
        Mon, 20 Jul 2020 09:10:10 -0700 (PDT)
X-Gm-Message-State: AOAM532UX6QmOkkBaR02RKknpIS2MC84vWZupOPQ9JrLRy6icZs/0LNG
        BQfwcdpj72qj4FEDNwQgY8s9dOLej04/Eu4NUQ==
X-Google-Smtp-Source: ABdhPJzjWZka7dLZIstGqrBjwKgkCw0Jts0It8B2AGaHIdJ5T0KmMrd6sjOYVhE+rD/LgFxqtR3lEzkplYm7brWs4pA=
X-Received: by 2002:a17:906:404e:: with SMTP id y14mr21106907ejj.260.1595261408723;
 Mon, 20 Jul 2020 09:10:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200506084039.249977-1-eizan@chromium.org> <20200506184018.v2.1.I27dac0775ba64deff6a91837f39bfba83dccdf84@changeid>
In-Reply-To: <20200506184018.v2.1.I27dac0775ba64deff6a91837f39bfba83dccdf84@changeid>
From:   Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date:   Tue, 21 Jul 2020 00:09:57 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9qSpH51kkopofoQTfSqYqGWcQVN8KrJJKQDWozoMK+NQ@mail.gmail.com>
Message-ID: <CAAOTY_9qSpH51kkopofoQTfSqYqGWcQVN8KrJJKQDWozoMK+NQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] [media] mtk-mdp: add driver to probe mdp components
To:     Eizan Miyamoto <eizan@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi, Eizan:

Eizan Miyamoto <eizan@chromium.org> =E6=96=BC 2020=E5=B9=B45=E6=9C=886=E6=
=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=884:41=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Broadly, this patch (1) adds a driver for various MTK MDP components to
> go alongside the main MTK MDP driver, and (2) hooks them all together
> using the component framework.
>
> (1) Up until now, the MTK MDP driver controls 8 devices in the device
> tree on its own. When running tests for the hardware video decoder, we
> found that the iommus and LARBs were not being properly configured. To
> configure them, a driver for each be added to mtk_mdp_comp so that
> mtk_iommu_add_device() can (eventually) be called from dma_configure()
> inside really_probe().
>
> (2) The integration into the component framework allows us to defer the
> registration with the v4l2 subsystem until all the MDP-related devices
> have been probed, so that the relevant device node does not become
> available until initialization of all the components is complete.
>
> Some notes about how the component framework has been integrated:
>
> - The driver for the rdma0 component serves double duty as the "master"
>   (aggregate) driver as well as a component driver. This is a non-ideal
>   compromise until a better solution is developed. This device is
>   differentiated from the rest by checking for a "mediatek,vpu" property
>   in the device node.
>
> - The list of mdp components remains hard-coded as mtk_mdp_comp_dt_ids[]
>   in mtk_mdp_core.c, and as mtk_mdp_comp_driver_dt_match[] in
>   mtk_mdp_comp.c. This unfortunate duplication of information is
>   addressed in a following patch in this series.
>
> - The component driver calls component_add() for each device that is
>   probed.
>
> - In mtk_mdp_probe (the "master" device), we scan the device tree for
>   any matching nodes against mtk_mdp_comp_dt_ids, and add component
>   matches for them. The match criteria is a matching device node
>   pointer.
>
> - When the set of components devices that have been probed corresponds
>   with the list that is generated by the "master", the callback to
>   mtk_mdp_master_bind() is made, which then calls the component bind
>   functions.
>
> - Inside mtk_mdp_master_bind(), once all the component bind functions
>   have been called, we can then register our device to the v4l2
>   subsystem.
>
> - The call to pm_runtime_enable() in the master device is called after
>   all the components have been registered by their bind() functions
>   called by mtk_mtp_master_bind(). As a result, the list of components
>   will not change while power management callbacks mtk_mdp_suspend()/
>   resume() are accessing the list of components.

For the component binding problem, MDP is similar to DRM driver [1],
and DRM is probed by mmsys driver [2] (mmsys is a device which control
display clock, display routing, mdp clock, mdp routing). Maybe you
could refer to what DRM does.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/gpu/drm/mediatek/mtk_drm_drv.c?h=3Dv5.8-rc6
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?h=3Dv5.8-rc6&id=3D667c769246b01c53ad0925d603d2a2531abd3ef2

Regards,
Chun-Kuang.

>
> Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
