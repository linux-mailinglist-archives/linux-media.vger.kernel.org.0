Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4714A39C084
	for <lists+linux-media@lfdr.de>; Fri,  4 Jun 2021 21:38:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230443AbhFDTkg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Jun 2021 15:40:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:38862 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230421AbhFDTkg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 4 Jun 2021 15:40:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5070061417;
        Fri,  4 Jun 2021 19:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622835529;
        bh=BMvhvMm4CS6SkbcLH6tRFN72rFuBUAdyYFInvitnhxo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Mq65Z03//DFCbGu/wvm6LZBEm5gHb0XDQsHIS86rJ0DseZGOjmjxbVMgqhEJIf6lp
         NNBQvaSLjsjEXyvGe4DT58ySsqT42YUdKRITu/ysajoEa1SD4x/g50AhPwCly4bHxv
         abnmDecodI/ofeh/MUIwShzmYf6ZDjNhJy647z6b3P0pvSY9nsg1c54rp/prBccn0G
         UUJftN3cLWrBa5YTcVEQWx0NkDJGljOrJY1aK/Odhm8HSQwAWzlvEcvqd09ttkdBrh
         1BykoI1M3j9YoiIkbnyUJgfjr0CZ8YbNxdi4Nlz5IG4dGVq+/6/7BSfwVG4CvLrXsr
         0XxUPq6Tb+NhQ==
Received: by mail-ed1-f42.google.com with SMTP id f5so7404075eds.0;
        Fri, 04 Jun 2021 12:38:49 -0700 (PDT)
X-Gm-Message-State: AOAM531EPVWuRpHTvttDZnzGqbIwHv5M5aeb214q9hNa2hkx1ZKzcnRf
        dQKh2LLEiy47bJYJKdHsCEiUCRPikIRFmchzMA==
X-Google-Smtp-Source: ABdhPJwAtWTmsO5thBF7oJ6AXBvU5ffREBwKmS+FE1kSBnOskP3Sef/q82G/J9MMdwfceCiFRgqVkUQznXl50uMlMsQ=
X-Received: by 2002:aa7:cb19:: with SMTP id s25mr6552231edt.194.1622835527894;
 Fri, 04 Jun 2021 12:38:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210408202436.3706-1-fabrizio.castro.jz@renesas.com>
 <20210409185420.GA3955417@robh.at.kernel.org> <CAL_JsqL5tzJhMzTyyTDnVh=doDknepkk8R0McKsj4U2aqSMFAw@mail.gmail.com>
 <YIhvPCzWOah2kFk7@pendragon.ideasonboard.com>
In-Reply-To: <YIhvPCzWOah2kFk7@pendragon.ideasonboard.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 4 Jun 2021 14:38:36 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJU6NGGtHUqfNrRqg5Km5n35LviUrazoU2dL82vB-+BvQ@mail.gmail.com>
Message-ID: <CAL_JsqJU6NGGtHUqfNrRqg5Km5n35LviUrazoU2dL82vB-+BvQ@mail.gmail.com>
Subject: Re: [PATCH] media: dt-bindings: media: renesas,drif: Fix fck definition
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ramesh Shanmugasundaram <rashanmu@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Apr 27, 2021 at 3:08 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Rob,
>
> On Tue, Apr 27, 2021 at 01:02:57PM -0500, Rob Herring wrote:
> > On Fri, Apr 9, 2021 at 1:54 PM Rob Herring wrote:
> > > On Thu, 08 Apr 2021 21:24:36 +0100, Fabrizio Castro wrote:
> > > > dt_binding_check reports the below error with the latest schema:
> > > >
> > > > Documentation/devicetree/bindings/media/renesas,drif.yaml:
> > > >   properties:clock-names:maxItems: False schema does not allow 1
> > > > Documentation/devicetree/bindings/media/renesas,drif.yaml:
> > > >   ignoring, error in schema: properties: clock-names: maxItems
> > > >
> > > > This patch fixes the problem.
> > > >
> > > > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > > > ---
> > > >  Documentation/devicetree/bindings/media/renesas,drif.yaml | 4 +---
> > > >  1 file changed, 1 insertion(+), 3 deletions(-)
> > > >
> > >
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> >
> > Still failing in linux-next...
>
> Sorry, as a standalone fix, I incorrectly thought you'd merge it.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> and applied to my tree. I'll send a pull request to linux-media when the
> merge window closes.

Still failing in linux-next. It's also a failure in Linus' tree, so it
needs to go in as a fix.

Rob
