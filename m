Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC818421EC2
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 08:13:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232478AbhJEGPf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 02:15:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232460AbhJEGPf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 02:15:35 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2637FC061745
        for <linux-media@vger.kernel.org>; Mon,  4 Oct 2021 23:13:45 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id r4-20020a7bc084000000b0030d6fc48bd2so1180307wmh.1
        for <linux-media@vger.kernel.org>; Mon, 04 Oct 2021 23:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j0gdpa7QFj6JEtxCL0CAkQhhWBN7lylbx+e4M1Vsb7o=;
        b=VSMlRsoRvLnUs/myw52hG6menRckaTpfD/sc8jEUT0jyW5v3NKcZHtBWqWykMD5xpQ
         mFu4QMfCZ9RQ9gHcJ9QFLXWCDQioaZGzCLDj2r3q5cK6Bu/YSHR3txAyRLJylC+4AKLR
         g55PRWGvVR45Df7AB215vAr2ryBVF9UVBNPf2zz3lLIf+C6rBUlNftwFmbW96vlrWdTq
         hCwjH6VQ0tr1DWzEEMjTxsoihIPbk377R7bOZfQPdhVWl10LaMlIoj6UaOF+EZtODQyV
         LwPycfL7e8vNKveuzSRdCDYLP9xDWVdJMnpBwUvvLfFs+gIqIOclKdHk3GCXIwYTLdoB
         y/FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j0gdpa7QFj6JEtxCL0CAkQhhWBN7lylbx+e4M1Vsb7o=;
        b=sh+b+QN6nP+gA+L1CXV+fM8HEr2agOKYfwjdq8tOq2Fo0+J/AC2XBfeOwyMDUxvEpP
         EARQxhnzJ72lXKbYh9X9CBDGIpXbeNhhEoX+aOpdss61vniQkW7Y0r31VKIfT7qxflPi
         xmvg5Ad1kDkyerZ3nquQ9/IQeEzPzGctvFcb9XcB/tsqfYkLe7jssYsy3kUxbXju94Vl
         H6EAyx2dX8pEw0bLbpTuYCCnvUZAZ6zGE16TM1MDI4e8qEiIhufBI2/iLDvbAHUQgKh7
         dfbHy5Wmnou4fE/nDO4tyfpgoluWj44vMzW2Nw4hE+Npf3xO1KU2ngY7HK144pcfnoPE
         nCqQ==
X-Gm-Message-State: AOAM530r8kj82tB6rQ8wUxP1wT6qE7rJTYHDtUyOma4ku/MDZCv/eg8x
        QS6/p672JepynGuEA2uIslQ4lm4daOEDnXLCliE98Q==
X-Google-Smtp-Source: ABdhPJwvzH04gXiNcjIVGCd6bQFa+g35hTdKUKGTFBM4UFTMR14Ybiy5zm5HBrSroG102mfVLu4iLioSc6A1uZAaB2I=
X-Received: by 2002:a05:600c:1c9a:: with SMTP id k26mr1406845wms.169.1633414423545;
 Mon, 04 Oct 2021 23:13:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210901083215.25984-1-yunfei.dong@mediatek.com>
 <CAAEAJfDOt_GyDPojcj5P6Wou9HC2GC8YzRt2wYyqdrCOjfeOog@mail.gmail.com>
 <3b9463e88d88ce85205da08f8263252da7726ade.camel@mediatek.com>
 <aba7fb4ffe6e45ac90869b5017468386bce64d28.camel@mediatek.com>
 <b7ed8b71578a98704e9b8ca29cac63c67cc14b3f.camel@mediatek.com>
 <CAAEAJfCHEBFc8B7C0bu7UxtJdffvDarqgA-rset1wPjLOiV01A@mail.gmail.com> <CAC-pXoMR=mOwnKqP5SFAfF3Ka5UrG0F8Mj=sJuEziU=uOKftoA@mail.gmail.com>
In-Reply-To: <CAC-pXoMR=mOwnKqP5SFAfF3Ka5UrG0F8Mj=sJuEziU=uOKftoA@mail.gmail.com>
From:   Tomasz Figa <tfiga@google.com>
Date:   Tue, 5 Oct 2021 15:13:32 +0900
Message-ID: <CAAFQd5DzLMFarc2fFkrcE4t+T3mk5XJtCoWa8WpHNuOS5++SbA@mail.gmail.com>
Subject: Re: [PATCH v6, 00/15] Using component framework to support multi
 hardware decode
To:     Steve Cho <stevecho@chromium.org>
Cc:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        "yunfei.dong@mediatek.com" <Yunfei.Dong@mediatek.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <Andrew-CT.Chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
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

On Tue, Sep 28, 2021 at 2:02 AM Steve Cho <stevecho@chromium.org> wrote:
>
> Hi Ezequiel,
>
> Thank you for reviewing these series from Yunfei!
> This series is one of the main obstacles for us at the moment for MTK
> so please continue to help & support reviewing this series.
>
> > > According to google's suggestion, it's better not to use v4l2 async
> > > also.
> >
> > Hum? I haven't seen such objection on the mailing list.
> Maybe coming from Tzung-Bi?
> Yunfei, please let us know.

I do object to using V4L2 async. It's designed for independent
components of media pipelines, handled by multiple different drivers
and also modelled as V4L2 subdevices. We don't have anything like that
here.

How about just open coding something trivial that only fits the needs
of this specific driver? I think it would be as simple as a linked
list and registering the V4L2 devices only after all the nodes probe.

Best regards,
Tomasz
