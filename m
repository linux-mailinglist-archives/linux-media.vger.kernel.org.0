Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12C123493E5
	for <lists+linux-media@lfdr.de>; Thu, 25 Mar 2021 15:23:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231236AbhCYOWn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Mar 2021 10:22:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231211AbhCYOWS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Mar 2021 10:22:18 -0400
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com [IPv6:2607:f8b0:4864:20::934])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47051C06174A;
        Thu, 25 Mar 2021 07:22:17 -0700 (PDT)
Received: by mail-ua1-x934.google.com with SMTP id j19so564294uax.2;
        Thu, 25 Mar 2021 07:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S57t/1uwRfKG1nwTAGZ20K/6m0RxzmSR5OX1ptPVg94=;
        b=NW7W1qRvf4csE0KVccOVAq5d6aLpAik7ZL3gHuATuZsTcmPe4FwyptfuK1iFjHkLU6
         liLQQzgOAO35WF2+BvQP4jRs0VVvt1LVmWhdg5QLNgUcmLuY7YAWZBfADxqSaC7VGZBt
         CdrOkMVOonbMZD3vvoPrBdsFuzfduLQKp+A6HEPbiVTDi/TAlWkG1N7zFSlBBr/NqSYC
         syQNIP0KjFEm7qKq8YGzihrznCsIyXkN80bswPa1/8Wdc/B19+6ZwGTaYZmjkGDNQUbT
         qZNsu4E5MVv+3KSdnNfAgS0ZmcuzhGYVbk64eat8IPbuE0UlfF59Dep8mxZGitDBOQG4
         jXiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S57t/1uwRfKG1nwTAGZ20K/6m0RxzmSR5OX1ptPVg94=;
        b=Ds8Lf7h+LZmmE6rMsvga3FUdRufo/08VSJOIX+y0ceUGocVPQ9CW4QH0SPboEOPlui
         dpPksf59uQgMyv+j2xqOml/CUbmgNJqc80qTuHcsRiarg0dwOa3kpvJoWSYDwY/8YRYL
         /rd2/iOImlon50tu6h3tBiC490QWquyTpgvyjd6u4Iq1xu0EEVhhCdXkb2MacCMf/cHO
         /JrpSuxYRx99fPQuxSk+JVtkAwNIp8q+NL+8cs2wEruUGEj/TnI2vEIxiisOgjNIcz8B
         JJNrJXjufERBELICMU3MrRNK2vpGwcifb4R6dvY30x7RzOts3q+G58HNIcN3llaMctc6
         VIVw==
X-Gm-Message-State: AOAM530D5YBeocecakn60xhy1aWRu8C3wL4gmdctlstggi+4LjhzmcaX
        RlZVCflXBKr9sw2KPmBZK+Xw3wNHWrsCJaWf2/o=
X-Google-Smtp-Source: ABdhPJwIt5+cIAgYSFiUoxo0sH/fJcm+vHdY0ZMGYnBh5vACdXvgETtySDruWU7NTuQMIgZwon8bevCtNc32q5WaDJg=
X-Received: by 2002:ab0:6954:: with SMTP id c20mr5160344uas.106.1616682136426;
 Thu, 25 Mar 2021 07:22:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210311154055.3496076-1-emil.l.velikov@gmail.com>
 <5ecf1d3b8a8f88d6387a1549faeb4f4180cf5d4b.camel@collabora.com>
 <CACvgo51uNyQgzGdW=f-0wxvjv-+OD1p7E4DJXRzu1GvnAHbcCQ@mail.gmail.com>
 <50b3b4b3-6c5b-3f1e-3499-c88574ce9f74@microchip.com> <YFxObibxqK23WTMf@piout.net>
In-Reply-To: <YFxObibxqK23WTMf@piout.net>
From:   Emil Velikov <emil.l.velikov@gmail.com>
Date:   Thu, 25 Mar 2021 14:22:05 +0000
Message-ID: <CACvgo53V8sZ2PA0NTR1=JCqcFGBecqs7=aB4uofApOa-C0GZCA@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] Microship SAMA5D4 VPU support et al
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Nicolas Ferre <nicolas.ferre@microchip.com>,
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

Greetings all,

On Thu, 25 Mar 2021 at 08:48, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 24/03/2021 14:44:14+0100, Nicolas Ferre wrote:
> > Now, when we have the tag from Rob, how to coordinate these different
> > pieces? Will it go through the media git tree? Will we benefit from a stable
> > branch to share or will we just have to wait for the driver to hit Mainline
> > before adding the defconfig and DT patches?
> >
Thanks for the Acked-by Nicolas.

>
> I think the defconfig and dt patches can go through at91 as soon as we
> get Rob's ack. There is no build dependency so it can be taken at any
> time. Worst case, we end up with a selected config option that doesn't
> exist.
>
My personal preference is to merge everything in one go.
I believe it will be easier from maintainer's point of view, plus odds
of conflicts with the AT91 tree are close to zero.

Then again, as long as the maintainers are happy - I'm fine either way.

Thanks
Emil
