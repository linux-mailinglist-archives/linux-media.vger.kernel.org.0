Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89EE13478D4
	for <lists+linux-media@lfdr.de>; Wed, 24 Mar 2021 13:50:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233835AbhCXMuC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Mar 2021 08:50:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233111AbhCXMte (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Mar 2021 08:49:34 -0400
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64937C061763;
        Wed, 24 Mar 2021 05:49:32 -0700 (PDT)
Received: by mail-vs1-xe2b.google.com with SMTP id l4so11257673vsc.7;
        Wed, 24 Mar 2021 05:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZGVrxs9AFgXtFmR5bPSS2YMR0x2lr3ZoZpgmiNE6mV4=;
        b=g+iHmZyHETsO/iBAZ0Gv3tMCRlrCEZP7WnRg1AqBEvxCPaJ3+8DbQ5MyYy6LbrXjgD
         2gIJGpBLkvCYa3VJF6W7dv0Z/ue1N9ejo0pMX/Ch6lqJe7m/7gN6aNZuZLx/fV4GXAOW
         vP2EfihLO9MqlKo8qbvrIcA20R1JbqMsewtutyMQeEPKSNNsdkj/12j20WBPIE8bKmlI
         RDkYnZ5G4550e23MsftqxziRCfAwX6qAymc82Pz8XhZXAIduA0CS5l54VvrBl35XBSXc
         MUQpYmjYfoejCNYdlP3HAsZrXpVRhX60en/5miDqif7Gwv8SANhv6Affmvdx6mhehzZ7
         lJ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZGVrxs9AFgXtFmR5bPSS2YMR0x2lr3ZoZpgmiNE6mV4=;
        b=Rgl5yTOgOWLC8yuEesBN/nlU+r+J51PfE77BZum+4WyugwctHxpDJXwsI0j4SKQ7em
         QVQGlaT6lgD9D0HbJUM0ryeXz3VMdBQuZVl45Q5XvCh+ahQJAEv5BfVO17b1TyzD++6F
         t7/Vq5ShLWAFSmfjGuKXrC3J6Ppenafni9EkcwwAHXN1l4LWOuZSDdGmeiR+mesY9sY8
         Q3jrn1snJnCYQpYCb7pESvDw3n6UmDVQLLDeW7XEjHfVPeXE76H5qWJh+8RjBq+HalB7
         PqWZB6ciezwiJyBTF8MZ0bYz03f3vuObHG1kDeufo+1fdEDHY8LuGQUBRHkZBHG50IkK
         QBzA==
X-Gm-Message-State: AOAM533W6gHblaInISsLg+liCFfQw/8qCmoP8oMhZNZlvNNZfd5ZIMVC
        zdEZZZ/a39KIPI100xskbUgiAEVzT6hZLJzoDZCEeXLweIA=
X-Google-Smtp-Source: ABdhPJzgycEcQKhzfuYScH5D4eg0SY5nemIhnP7BGV0KtR7gjbhZQMlqjVnGPk6R7LyVWXxlYMpu9GWzEXfrTqLWRoA=
X-Received: by 2002:a05:6102:c11:: with SMTP id x17mr1482920vss.18.1616590171550;
 Wed, 24 Mar 2021 05:49:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210311154055.3496076-1-emil.l.velikov@gmail.com> <5ecf1d3b8a8f88d6387a1549faeb4f4180cf5d4b.camel@collabora.com>
In-Reply-To: <5ecf1d3b8a8f88d6387a1549faeb4f4180cf5d4b.camel@collabora.com>
From:   Emil Velikov <emil.l.velikov@gmail.com>
Date:   Wed, 24 Mar 2021 12:49:19 +0000
Message-ID: <CACvgo51uNyQgzGdW=f-0wxvjv-+OD1p7E4DJXRzu1GvnAHbcCQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] Microship SAMA5D4 VPU support et al
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        devicetree <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org,
        linux-rockchip <linux-rockchip@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 16 Mar 2021 at 17:23, Ezequiel Garcia <ezequiel@collabora.com> wrote:

> On Thu, 2021-03-11 at 15:40 +0000, Emil Velikov wrote:
> > Emil Velikov (10):
> >   media: hantro: use G1_REG_INTERRUPT directly for the mpeg2
> >   media: hantro: imx: reuse MB_DIM define
> >   media: hantro: imx: remove duplicate dec_base init
> >   media: hantro: imx: remove unused include
> >   media: hantro: introduce hantro_g1.c for common API
>
> For patches 1-5:
>
> Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
>
> >   media: dt-bindings: Document SAMA5D4 VDEC bindings
>
> This one need to be reviewed by DT maintainers, I think.
>
Rob can you help with this one?

> >   media: hantro: add initial SAMA5D4 support
>
> For patch 7:
>
> Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
>
> >   ARM: dts: sama5d4: enable Hantro G1 VDEC
> >   ARM: configs: at91: sama5: update with savedefconfig
> >   ARM: configs: at91: sama5: enable the Hantro G1 engine
> >
>
> These need review from Microchip maintainers.
>
Alexandre, Ludovic, Nicolas
Do you have any input of the patches or series as a whole?
If you prefer we can drop the last two patches for the defconfig. I've
included those for posterity.

Thanks for the review Eze.
Would you recommend that I resend the series with your R-B or it's
better to wait for feedback from others?

-Emil
