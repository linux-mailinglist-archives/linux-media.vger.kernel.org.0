Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 113D42E0180
	for <lists+linux-media@lfdr.de>; Mon, 21 Dec 2020 21:25:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725885AbgLUUYY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Dec 2020 15:24:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:36766 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725780AbgLUUYX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Dec 2020 15:24:23 -0500
X-Gm-Message-State: AOAM532otr+cGDYafcztKLWgg9Fy0Xa7D/6pnPaVGRw+dyMSsKVVAdln
        c9IvC64VdxAjhLRrk1W7Gs4idzx2DP6l56ipKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608582223;
        bh=pcSJN+YLOFI64SCfcdWFU0j3Rk7xrktOPoeyLddm9FU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=PVNtCu3YsIYA/8f2OSTZpdAU/qZK9rmvKApqIjajHQwW3qreSmBh43Ez6GMPl3VpM
         O4obK3vsDtJMeZ6FJMc9cTxugVJ89G2CVZIHGih+07Vbi1JBjAzb1pVm+SPNpzI6pZ
         ggpifoibi8bWRfFjQk4axyl3XJ7dBzWqo3v/ZXR1HrJQxlIGtV6PYRjRPXA2UMygyN
         TnWhj9c+Ub35i1Jyql3e8HUbdR+FCN4e/Yo0IQDBne4UaunNF/aduqxI6DZUXzUdyu
         7syAOVzCNu/vFNfcE2mQdxZs9aF1PCSEQjwemX3PCKLnZ5hKpnlV0KmTcqu71MMspO
         WpGd+KPgbRkdA==
X-Google-Smtp-Source: ABdhPJyF9RhwfI20x3C/y2LX0hxx8Z5xC9TEEOv7MIH9GNthEg0YW/K+1y/QScpH7qnpETNvZLIB1JKlurZ0HXEgKos=
X-Received: by 2002:a17:906:4146:: with SMTP id l6mr17142423ejk.341.1608582221684;
 Mon, 21 Dec 2020 12:23:41 -0800 (PST)
MIME-Version: 1.0
References: <20201119161956.756455-1-jacopo@jmondi.org> <20201119161956.756455-2-jacopo@jmondi.org>
 <20201125091526.GI3940@paasikivi.fi.intel.com>
In-Reply-To: <20201125091526.GI3940@paasikivi.fi.intel.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 21 Dec 2020 13:23:29 -0700
X-Gmail-Original-Message-ID: <CAL_JsqLfdGumeicqqhkfn5K40GaXX93NuNZTOpgcCLycHmVQbg@mail.gmail.com>
Message-ID: <CAL_JsqLfdGumeicqqhkfn5K40GaXX93NuNZTOpgcCLycHmVQbg@mail.gmail.com>
Subject: Re: [PATCH v4 01/30] dt-bindings: media: i2c: Rename ov5647.yaml
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        roman.kovalivskyi@globallogic.com,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        naush@raspberrypi.com, Eugeniu Rosca <erosca@de.adit-jv.com>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 25, 2020 at 2:15 AM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Cc Rob + DT list.

You have to resend if you really want me to see things. In this case,
I don't think you need to wait on me for a rename.

Acked-by: Rob Herring <robh@kernel.org>

>
> On Thu, Nov 19, 2020 at 05:19:27PM +0100, Jacopo Mondi wrote:
> > Rename 'ov5647.yaml' as 'ovti,ov5647.yaml' and update the
> > MAINTAINERS file entry accordingly.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  .../bindings/media/i2c/{ov5647.yaml => ovti,ov5647.yaml}        | 0
> >  MAINTAINERS                                                     | 2 +-
> >  2 files changed, 1 insertion(+), 1 deletion(-)
> >  rename Documentation/devicetree/bindings/media/i2c/{ov5647.yaml => ovti,ov5647.yaml} (100%)
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/ov5647.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
> > similarity index 100%
> > rename from Documentation/devicetree/bindings/media/i2c/ov5647.yaml
> > rename to Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 69d55ed67e1cf..3f2acc3a78687 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -12928,7 +12928,7 @@ M:    Jacopo Mondi <jacopo@jmondi.org>
> >  L:   linux-media@vger.kernel.org
> >  S:   Maintained
> >  T:   git git://linuxtv.org/media_tree.git
> > -F:   Documentation/devicetree/bindings/media/i2c/ov5647.yaml
> > +F:   Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
> >  F:   drivers/media/i2c/ov5647.c
> >
> >  OMNIVISION OV5670 SENSOR DRIVER
> > --
> > 2.29.1
> >
>
> --
> Sakari Ailus
