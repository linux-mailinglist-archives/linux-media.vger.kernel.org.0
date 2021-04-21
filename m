Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49877366AED
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 14:38:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239860AbhDUMjE convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 21 Apr 2021 08:39:04 -0400
Received: from mail-vs1-f42.google.com ([209.85.217.42]:33386 "EHLO
        mail-vs1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238447AbhDUMiz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 08:38:55 -0400
Received: by mail-vs1-f42.google.com with SMTP id k19so7990711vsg.0;
        Wed, 21 Apr 2021 05:38:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6ALp4ZieNZZ/Ge8Ck+QEaMFcRz5+PoS2G+LjWU70FyA=;
        b=cbQacpdmULEeC8FwKazMuMPkF4LBWPoup5XG3rA1/pkgeZafOvlaLIfZvDYhy9p5hC
         hEYfnAomQxlrnTQwcrJZ2iu7gg3FkDXelsA9oP+2rsd3TYH7Cvbye/WOP/aot9Wqjo7E
         0+UCkdRXExLyitvmJuJGc5xB97zwHDNzDcgEI+NORyMsk/kYuQ21KlLrftzYlL3zOSaR
         EBfQ2mL3KK0eYA4MCGwFUswVhHUKkixnz3U9BLZoAOLSdenEyFmu8kEtBUMv6FWqXo54
         g4EwCm49PsXUW3UP+ZwTgquYPJJf3Nae5H6hsaBV2pH+4EsEUIMkC5FN8l/8jcXkpK3N
         Or/g==
X-Gm-Message-State: AOAM530cFDFQYpYoYmYf7xryUYS3emxcVeeP9zEyyFFUlPFGGRjPCuEv
        zwpnAHFChRVp7CSlzOh1K8Z6/fCzZe1ILg+hy0ryeSZu
X-Google-Smtp-Source: ABdhPJxCa92hyV2QXrUDmNrbi9fPbCWQyb2GtX+ATD7zl2J88K+uhBVzhTODAbNWn/MYolnGB7uJN4epBz1tKa7KzaM=
X-Received: by 2002:a67:7c8c:: with SMTP id x134mr24769126vsc.40.1619008702371;
 Wed, 21 Apr 2021 05:38:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210413155346.2471776-1-niklas.soderlund+renesas@ragnatech.se>
 <YHiPWPTjWeEQ522E@pendragon.ideasonboard.com> <YHlFWvVBps2vYnPM@oden.dyn.berto.se>
 <YH/zyzfgpmXvkDpB@pendragon.ideasonboard.com> <YIAbBoqEAZONAYii@oden.dyn.berto.se>
In-Reply-To: <YIAbBoqEAZONAYii@oden.dyn.berto.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 21 Apr 2021 14:38:11 +0200
Message-ID: <CAMuHMdUiqhjm49cg0UMjk3qxgVZYQM0RAHbefvh8mdj58qDr4A@mail.gmail.com>
Subject: Re: [PATCH] media: dt-bindings: media: renesas,csi2: Node port@0 is
 not mandatory
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Wed, Apr 21, 2021 at 2:31 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> On 2021-04-21 12:43:39 +0300, Laurent Pinchart wrote:
> > On Fri, Apr 16, 2021 at 10:05:46AM +0200, Niklas Söderlund wrote:
> > > On 2021-04-15 22:09:12 +0300, Laurent Pinchart wrote:
> > > > On Tue, Apr 13, 2021 at 05:53:46PM +0200, Niklas Söderlund wrote:
> > > > > When converting the binding to use the video-interfaces schemas the node
> > > > > port@0 was incorrectly made a mandatory property.
> > > > >
> > > > > The port@0 node describes which CSI-2 transmitter the R-Car CSI-2
> > > > > receiver is connected too. Not all boards connects all CSI-2 receivers
> > > > > to an CSI-2 transmitter.
> > > >
> > > > Ports are properties of the device, they should always be there,
> > > > regardless of connections. It's the endpoints that describe connections.
> > >
> > > I understand what you are saying and if that is the way things are done
> > > I'm fine with it. As this was brought to light by a recent change in the
> > > bindings I wish to understand if this was always the case the bindings
> > > have been wrong all along or not.
> > >
> > > I only ask as because if we keep the port@0 mandatory there will be
> > > board files that needs to add empty port@0 nodes as we know they are not
> > > used. And as the media bindings are already quiet large for some Renesas
> > > boards I want to understand this before spewing out a lot of patches
> > > adding empty nodes ;-)
> >
> > In my opinion port@0 should be in the SoC .dtsi, not in the board .dts.
> > Individual boards can then add endpoints when the CSI-2 receiver is
> > connected. Would that make sense for you ?
>
> I think this is a case of pragmatism vs being technically correct, and
> of course 'technically correct' being the best kind of correct ;-)
>
> Any of the two options works for me as long as we fix the DT validation
> errors that currently exists. Laurent seems to prefers keeping the
> port@0 mandatory and adding empty port@0 nodes to dtsi files.
>
> @Geert: Does this work for you?

Yes, that's fine for me. Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
