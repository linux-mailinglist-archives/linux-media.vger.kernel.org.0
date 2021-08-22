Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 755D73F4095
	for <lists+linux-media@lfdr.de>; Sun, 22 Aug 2021 18:50:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230438AbhHVQvR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 22 Aug 2021 12:51:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229912AbhHVQvQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 22 Aug 2021 12:51:16 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62DC7C061757
        for <linux-media@vger.kernel.org>; Sun, 22 Aug 2021 09:50:35 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id i3-20020a056830210300b0051af5666070so19727806otc.4
        for <linux-media@vger.kernel.org>; Sun, 22 Aug 2021 09:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dtfidEe/qjxfHjRkhW97hyLbAhf+ZJVGWplTJWO3Pbs=;
        b=KUQ1Wd1A9uHMPtRYx40LKABn7voa02Y4leoq1TyTTpx+BBE1w/r1SsSTOIUgCT4xfr
         oGJeHu5D3NKbu0d+8lZPwpu82/jyg8bA5oOOPJc+3h3eqD/tm+u+bfsB0MVHDBtL1LXy
         QLAGHfOtjkqC9xyeHfDXqtqW8CfEM4VOleO7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dtfidEe/qjxfHjRkhW97hyLbAhf+ZJVGWplTJWO3Pbs=;
        b=W79xmxb4rbL8w93eYj3R9NZcVgbJPTFZrbszZSXGbg4MX6MzgOcMzcdmNSElQBLq0P
         aEvAzh6S5ZbKW8mN0gv6QuXReDYho6pU1a4VyRQITXTEjgcQQyRoqGu35ndoOFNthP2D
         c3sSiaWpeblilJcBd0vbKfuhEquuM3HK9LYDdU2BYkekxbtfD2JUwp6F6yW7l7B4QxTs
         IMr6u7YWJ72gJrfqUKJVtVpUEtqU5CIZKNcBahiK839Hza/ylS3KK1MQ3jIw9XAG1abr
         OyoJaVAZ5JbW9acjsgEtT/u/SSZghKOB5oFvXGkDlfxgykXUhFU7RTylhwDrbKwjOHeB
         q0/w==
X-Gm-Message-State: AOAM5326vu8tHcf4EuXNCux6o6xTCJPatlJaMUWmbR+TDxUmG0sRU89D
        /MHll/eDluBhnl9d3IUnXvz01uEG890mWcjIVooHTg==
X-Google-Smtp-Source: ABdhPJzsqYUkGnoKx6cZL/MZd0xVLARgQAiHA36o4mNFCThs4ItbOa2X5Lm6FYKo4igPkf8VSlPht+LiVtxMvPa5diM=
X-Received: by 2002:a05:6808:1449:: with SMTP id x9mr9094210oiv.14.1629651034674;
 Sun, 22 Aug 2021 09:50:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210811025801.21597-1-yunfei.dong@mediatek.com> <CAAEAJfDWOzCJxZFNtxeT7Cvr2pWbYrfz-YnA81sVNs-rM=8n4Q@mail.gmail.com>
In-Reply-To: <CAAEAJfDWOzCJxZFNtxeT7Cvr2pWbYrfz-YnA81sVNs-rM=8n4Q@mail.gmail.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Sun, 22 Aug 2021 18:50:23 +0200
Message-ID: <CAKMK7uFW3Z=Up=OCJO4dNR9ffaTdFjHwoND9CrUw6LHmQ4t_AQ@mail.gmail.com>
Subject: Re: [PATCH v5, 00/15] Using component framework to support multi
 hardware decode
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     Yunfei Dong <yunfei.dong@mediatek.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>,
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
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        George Sun <george.sun@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 18, 2021 at 4:12 PM Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
>
> +danvet
>
> Hi,
>
> On Tue, 10 Aug 2021 at 23:58, Yunfei Dong <yunfei.dong@mediatek.com> wrote:
> >
> > This series adds support for multi hardware decode into mtk-vcodec, by first
> > adding component framework to manage each hardware information: interrupt,
> > clock, register bases and power. Secondly add core thread to deal with core
> > hardware message, at the same time, add msg queue for different hardware
> > share messages. Lastly, the architecture of different specs are not the same,
> > using specs type to separate them.
> >
>
> I don't think it's a good idea to introduce the component API in the
> media subsystem. It doesn't seem to be maintained, IRC there's not even
> a maintainer for it, and it has some issues that were never addressed.

Defacto dri-devel folks are maintainer component.c, but also I'm not
aware of anything missing there?

There has been discussions that in various drm subsystems like
drm_bridge or drm_panel a few things are missing, which prevent
drivers from moving _away_ from component.c to the more specific
solutions for panel/bridges. But nothing that's preventing them from
using component.c itself.

I'm happy to merge a MAINTAINERS patch to clarify the situation if
that's needed.
-Daniel

> It would be really important to avoid it. Is it really needed in the
> first place?
>
> Thanks,
> Ezequiel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
