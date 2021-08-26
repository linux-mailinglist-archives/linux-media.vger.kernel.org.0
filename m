Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C1223F8442
	for <lists+linux-media@lfdr.de>; Thu, 26 Aug 2021 11:14:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240962AbhHZJPA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Aug 2021 05:15:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240937AbhHZJO7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Aug 2021 05:14:59 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5F51C061757
        for <linux-media@vger.kernel.org>; Thu, 26 Aug 2021 02:14:11 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 79-20020a1c0452000000b002e6cf79e572so6377210wme.1
        for <linux-media@vger.kernel.org>; Thu, 26 Aug 2021 02:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=ubJENgQIOzugIH6aIzu4aa5SOJeA5cH0TBu7UkdkwRo=;
        b=eWRM7qqism/66evB0/Z4A1uCvrnvkvTzAGwtb+rUwe1sPIN2AMyEYIn4BzeKGJqUoC
         JGhvessjn+k+1RDfzALVQ7b/43qoTxbHmhrfxabjnYDh33tDAFwtHDmh+cc99/k9KK+t
         5e/Btgkaw0RYWxCnueUGZR0K4Rlqxa35b/K5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=ubJENgQIOzugIH6aIzu4aa5SOJeA5cH0TBu7UkdkwRo=;
        b=jdZUNXm2Kl6fk8mnK1uCFY5H7ATZx4KQl20TMNe+b9m0nL+Yua1jRcv79VZr4e30mH
         oZOmfDqabDOeTlVTB6iDLcPGSkesXLYmHa5TXAqyO6Tspr2v5irtfqKczQmqNMEOZhCK
         7Bi7MMxX63XOaauTk4NG9bMbAJNOIDwpP5kyoqK2M4q4ELbE6q8NeawZCQQZqVMRVjpM
         unxS+bYpJjs+/CP4fDOwEuhfBeVbrRY4iiXIZ5yDHP3GrZY9ZgKNd3HkphO9QTIvx07f
         DIp1jBZZmPz+i2jDFt9B+DvQVeJrlAowcxoD90P9BnqkLgrDM1uuF5fwNxhr84rimMJ4
         o3uA==
X-Gm-Message-State: AOAM533zpMe90VEBrIGdkGQkQS4WuYAcM3bbQZO9T9fmytXlbyUHQQnu
        NwixP5hlcTjejv0gjmqxjOBgLQ==
X-Google-Smtp-Source: ABdhPJykiq+3RMvVzHhR2iD4afcW8Q8OoeIr3XVAh723gjD1Rvwc9Ym8gi6QoDtjdhPbP2Ip1lCUVg==
X-Received: by 2002:a1c:a903:: with SMTP id s3mr2538905wme.171.1629969250495;
        Thu, 26 Aug 2021 02:14:10 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id z137sm7917167wmc.14.2021.08.26.02.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 02:14:09 -0700 (PDT)
Date:   Thu, 26 Aug 2021 11:14:07 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
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
Subject: Re: [PATCH v5, 00/15] Using component framework to support multi
 hardware decode
Message-ID: <YSdbXzCJRsj/jsnl@phenom.ffwll.local>
Mail-Followup-To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Irui Wang <irui.wang@mediatek.com>,
        linux-media <linux-media@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        George Sun <george.sun@mediatek.com>
References: <20210811025801.21597-1-yunfei.dong@mediatek.com>
 <CAAEAJfDWOzCJxZFNtxeT7Cvr2pWbYrfz-YnA81sVNs-rM=8n4Q@mail.gmail.com>
 <CAKMK7uFW3Z=Up=OCJO4dNR9ffaTdFjHwoND9CrUw6LHmQ4t_AQ@mail.gmail.com>
 <CAAEAJfB3CoTU7bZe08wYEfTTm6=6UPOae9u39AtdbJ9saYknBA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAEAJfB3CoTU7bZe08wYEfTTm6=6UPOae9u39AtdbJ9saYknBA@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Aug 22, 2021 at 02:57:15PM -0300, Ezequiel Garcia wrote:
> On Sun, 22 Aug 2021 at 13:50, Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Wed, Aug 18, 2021 at 4:12 PM Ezequiel Garcia
> > <ezequiel@vanguardiasur.com.ar> wrote:
> > >
> > > +danvet
> > >
> > > Hi,
> > >
> > > On Tue, 10 Aug 2021 at 23:58, Yunfei Dong <yunfei.dong@mediatek.com> wrote:
> > > >
> > > > This series adds support for multi hardware decode into mtk-vcodec, by first
> > > > adding component framework to manage each hardware information: interrupt,
> > > > clock, register bases and power. Secondly add core thread to deal with core
> > > > hardware message, at the same time, add msg queue for different hardware
> > > > share messages. Lastly, the architecture of different specs are not the same,
> > > > using specs type to separate them.
> > > >
> > >
> > > I don't think it's a good idea to introduce the component API in the
> > > media subsystem. It doesn't seem to be maintained, IRC there's not even
> > > a maintainer for it, and it has some issues that were never addressed.
> >
> > Defacto dri-devel folks are maintainer component.c, but also I'm not
> > aware of anything missing there?
> >
> 
> A while ago, I tried to fix a crash in the Rockchip DRM driver
> (I was then told there can be similar issues on the IMX driver too,
> but I forgot the details of that).
> 
> I sent a patchset trying to address it and got total silence back.
> Although you could argue the issue is in how drivers use the component
> API, AFAICR the abuse is spreaded across a few drivers, so it felt
> more reasonable to improve the component API itself, instead of changing
> all the drivers.
> 
> See below:
> 
> https://patchwork.kernel.org/project/linux-rockchip/cover/20200120170602.3832-1-ezequiel@collabora.com/

Patches get lost on the mailing list, and rockchip is one of the lesser
maintained drivers. You need to ping this stuff.

For bridge/panel I still think we should work towards removing component.c
use from them.

> > There has been discussions that in various drm subsystems like
> > drm_bridge or drm_panel a few things are missing, which prevent
> > drivers from moving _away_ from component.c to the more specific
> > solutions for panel/bridges. But nothing that's preventing them from
> > using component.c itself.
> >
> > I'm happy to merge a MAINTAINERS patch to clarify the situation if
> > that's needed.
> 
> Indeed, that would be good.

Ok I'm going to type something.
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
