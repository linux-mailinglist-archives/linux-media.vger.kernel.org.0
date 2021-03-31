Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DD783505A0
	for <lists+linux-media@lfdr.de>; Wed, 31 Mar 2021 19:37:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234333AbhCaRhZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Mar 2021 13:37:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234473AbhCaRhI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Mar 2021 13:37:08 -0400
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AB30C061574;
        Wed, 31 Mar 2021 10:37:07 -0700 (PDT)
Received: by mail-vs1-xe2a.google.com with SMTP id l8so8935274vsj.13;
        Wed, 31 Mar 2021 10:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T5aWfvcz8u1FqqDGdDL6+xvWowM95AwK3yzA+ivU68k=;
        b=LGe9GR1/zmzY7Bw4iwGyqNB2EfzGnXvve/KRMSnvZPaD9vRsQvM9zW7KnUMj7Z52WB
         JUq8LviYd5S3NqWtANefpx78Oj9GNy3egbUVIPa7OPIJlLvoq+i85ViNPl04DBqAH9R7
         798uNuQScz3YyGrdsFIQvUj/VYhHqazF56aY3EqcY5HVXqFjVNLpiCzV+hwktzO+veno
         K/no0vaawRUmVpCstcMKSB86B6A0jxcjdh+67YFtGITjw7pgr+7PQjwQ0J7Fd5wjwzCp
         vZRYCcj9L0J8zTtrorZLwVd1JLtzGyjFbceOnfANunmQhcuxzdHD2XIjYWUmOffyS0o2
         /XuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T5aWfvcz8u1FqqDGdDL6+xvWowM95AwK3yzA+ivU68k=;
        b=fTjcX/GUSkZNZSN1n5l55RCHkjzcT8mjEGvzZ7LFLvtUvxUvANc12DzHcN8n5snoml
         xLDBczXxHagPBGPqKInPlvqR8OF1t8LkdxIdSuXfg5pMFvFswRNxUwAnYpjR+7sK//Ex
         54xZZWIgOyKP7mFrZnSGfV5XMs3FKEovZYtH5g6PG9i7NHmZsNdNhEu0B7axDXTe3aqL
         5aHvihCdotN/lerIRHUOm+21F+w9krR7OO/2HzKuE0S396WM+7976drA/aKxR+DQl+qd
         clA689dQ75lXeblBdlQdowqCgerofv4KIrK+7NH3rzvjYP83HrvdVC9nax4gSFZaz2Xt
         P9NA==
X-Gm-Message-State: AOAM531oVRz2HSVtTfZbH9FVBCMIRkojHxZ1ANbhdKXhvrWQ/xLKO/rR
        T5NcLiLPyGvPQ5SiQJDbxwiL+1qurZinnps9nfA=
X-Google-Smtp-Source: ABdhPJzCfcI4pNU+3xrqudaT5wmZzJPE2MZmFf8fWWrNRShRIebblLgnhDIz2xErtIx2+kBt2nF5dMlJiVxMhH7uqCw=
X-Received: by 2002:a05:6102:21d1:: with SMTP id r17mr2544845vsg.19.1617212226819;
 Wed, 31 Mar 2021 10:37:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210311154055.3496076-1-emil.l.velikov@gmail.com>
 <5ecf1d3b8a8f88d6387a1549faeb4f4180cf5d4b.camel@collabora.com>
 <CACvgo51uNyQgzGdW=f-0wxvjv-+OD1p7E4DJXRzu1GvnAHbcCQ@mail.gmail.com>
 <50b3b4b3-6c5b-3f1e-3499-c88574ce9f74@microchip.com> <YFxObibxqK23WTMf@piout.net>
 <CACvgo53V8sZ2PA0NTR1=JCqcFGBecqs7=aB4uofApOa-C0GZCA@mail.gmail.com> <3aeb1924-d461-ab8b-440b-81f33a1a8213@microchip.com>
In-Reply-To: <3aeb1924-d461-ab8b-440b-81f33a1a8213@microchip.com>
From:   Emil Velikov <emil.l.velikov@gmail.com>
Date:   Wed, 31 Mar 2021 18:36:55 +0100
Message-ID: <CACvgo53CCZ8N2w9+6s8KfVtoVYxZPGQYOWYrRTdXv_y9ZqMs5A@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] Microship SAMA5D4 VPU support et al
To:     Nicolas Ferre <nicolas.ferre@microchip.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        devicetree <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org,
        linux-rockchip <linux-rockchip@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 29 Mar 2021 at 10:54, Nicolas Ferre <nicolas.ferre@microchip.com> wrote:
>
> On 25/03/2021 at 15:22, Emil Velikov wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > Greetings all,
> >
> > On Thu, 25 Mar 2021 at 08:48, Alexandre Belloni
> > <alexandre.belloni@bootlin.com> wrote:
> >>
> >> On 24/03/2021 14:44:14+0100, Nicolas Ferre wrote:
> >>> Now, when we have the tag from Rob, how to coordinate these different
> >>> pieces? Will it go through the media git tree? Will we benefit from a stable
> >>> branch to share or will we just have to wait for the driver to hit Mainline
> >>> before adding the defconfig and DT patches?
> >>>
> > Thanks for the Acked-by Nicolas.
> >
> >>
> >> I think the defconfig and dt patches can go through at91 as soon as we
> >> get Rob's ack. There is no build dependency so it can be taken at any
> >> time. Worst case, we end up with a selected config option that doesn't
> >> exist.
> >>
> > My personal preference is to merge everything in one go.
> > I believe it will be easier from maintainer's point of view, plus odds
> > of conflicts with the AT91 tree are close to zero.
> >
> > Then again, as long as the maintainers are happy - I'm fine either way.
>
> I'm taking defconfig 2 last patches of your series right now. No need to
> include them in subsequent versions.
>
> For DT, I'm waiting for settlement on refined code. As indicated by
> Alexandre, changes will need to travel through arm-soc tree so we'll
> coordinate when patches are ready.
>
Ack, dropped from v3 (also fixed the Microchip typo).

Thanks again
Emil
