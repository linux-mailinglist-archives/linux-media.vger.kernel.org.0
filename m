Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6639D38C14B
	for <lists+linux-media@lfdr.de>; Fri, 21 May 2021 10:06:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233626AbhEUIHs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 May 2021 04:07:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232833AbhEUIHr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 May 2021 04:07:47 -0400
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41665C061763
        for <linux-media@vger.kernel.org>; Fri, 21 May 2021 01:06:24 -0700 (PDT)
Received: by mail-il1-x130.google.com with SMTP id h11so17482296ili.9
        for <linux-media@vger.kernel.org>; Fri, 21 May 2021 01:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WAoGYY/IZ06EOl2sgqeBHp4au5PF0E3H2r0EKWA9o4I=;
        b=RSqrkjnpNv3xOnHZ57xV85Uq945ViwHco45Lb/nK/s/aRNbcF9pCLsb4Y/mHIA3IYC
         Je32opFAc0+tjj+OFJinHjPHi+Z6Eveu98JACjdv/T0YIZTwGfNRfn7QoGIU6u0xBgi4
         kZo5mUmgF8CHehv0XiTKyEvKYc3YNgsBDXDqbt+kjVgG15OM/j8KAkYcu+n2T5Os1kyD
         Agszq5EsRdHn8bEYnTwe5g9ZABpyl2rZxFP9/FXYrB10YlXSEICIC4Ov2ahNXLmk9rhP
         4D6bQthjeF7dN4B8gfI0pGsqR0GP8sWzQM0lVItc/wBdFGwnlSuFFl5ZbnMiyviYnEL3
         lwSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WAoGYY/IZ06EOl2sgqeBHp4au5PF0E3H2r0EKWA9o4I=;
        b=HYWv8zYkTwglKehaYQgz2rzoMaCmDcyoAvKc6uCZRMoy4Bp8dZSgMUigKwtsBQuxcO
         vRMc5zL4ZEhFGyyKDn1cAHUOu5bqgGDH2lUimTTYyX+6ZI7C6a9PJZsxduV1HMWO/MpW
         XOAGir/ScX61U1gXK3pY22xiSM1TLBKSYP+s1UrM5pJ64RdqFQpv+UuEhl2evZXB9f8+
         93caOHnWPqKQO0FMTl92l7R+1+0McDZm58l5oWCY7fPL2BE6WYo4YjSZO1gEzyOMsVEs
         1b39gf+90S8cbSxG6VVVlabiW05rCapRsEn3IPX30KZzNamQBZXPwtBjyMb0RrgOF/tk
         jbUA==
X-Gm-Message-State: AOAM532r9+28kHNlQZGfz6J0y4kaN6gooFsF3U74clsuqS6cSdf8H+bV
        w4zA8GQBvki0+Ov64jhQ/1rnF4tA5kDA+/F8eogE6A==
X-Google-Smtp-Source: ABdhPJw3h/Rdza5ih9pjbFjbrw/o2STJYHbm+xddgxIMSH3QaWhkLzFTbyk3TsjrO8vCypKIDZQWFwj1Tvz/HMgWS40=
X-Received: by 2002:a92:520e:: with SMTP id g14mr10448898ilb.218.1621584383431;
 Fri, 21 May 2021 01:06:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210521070139.20644-1-irui.wang@mediatek.com> <20210521070139.20644-4-irui.wang@mediatek.com>
In-Reply-To: <20210521070139.20644-4-irui.wang@mediatek.com>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Fri, 21 May 2021 16:06:12 +0800
Message-ID: <CA+Px+wXkn2ih0JdgKBOoHZU1=QqO=vE1MAP5tauHvRe=rtjg7g@mail.gmail.com>
Subject: Re: [PATCH v4,3/6] media: mtk-vcodec: Support 4GB~8GB range iova
 space for venc
To:     Irui Wang <irui.wang@mediatek.com>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Longfei Wang <longfei.wang@mediatek.com>,
        Yong Wu <yong.wu@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Fritz Koenig <frkoenig@chromium.org>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        linux-media@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        srv_heupstream@mediatek.com,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 21, 2021 at 3:02 PM Irui Wang <irui.wang@mediatek.com> wrote:
> +       if (of_get_property(pdev->dev.of_node, "dma-ranges", NULL))
> +               dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(34));
> +

From your previous dt-bindings patch[1], it has 4 banks.
> 0~4G; 4G~8G; 8G~12G; 12G~16G.

But, the code treats it as a boolean.  I.e. 0~4GB if non-existent;
otherwise, 4GB~8GB.

[1]: https://patchwork.linuxtv.org/project/linux-media/patch/20210521070139.20644-3-irui.wang@mediatek.com/
