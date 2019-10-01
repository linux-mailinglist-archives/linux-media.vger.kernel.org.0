Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA18FC2F92
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2019 11:05:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733305AbfJAJE4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Oct 2019 05:04:56 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:44549 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729642AbfJAJE4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Oct 2019 05:04:56 -0400
Received: by mail-ed1-f66.google.com with SMTP id r16so11140106edq.11;
        Tue, 01 Oct 2019 02:04:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kDE63cHClZRpjYxaxSJbfnVBB7aC+oqxVvBZabNwLO8=;
        b=n7gGXx35oEIe16TW0UBxCZTtXu6KKwvIKhAvoChEPvBxCkXYMq5nuLx8dm3MMDnDk+
         RrAqVIGZzqg66biLbyUjRugQYzagN3UKNPW1SJ1swJWIFTOO/YTBjWxHkHrfH4Rplw3p
         JQQSxvoQItISFZBedzwYJdrEt9/mw6xtVLHu/Q/EHFyh5vaCvuegjTJb++P5w5m5SBQ9
         R4jLY6kmCCEOHfVtu6ND9jPTiXXbk+Y/q8CUrvTcG9P9u2Hj4HxS9m08Yym7LobqXgFp
         2Iw3GSBsx8bHJhgY5xxL8z2GPkb0+rhtJ/I7RvM8dcp/fWl0Zt870PHPp7cSbX9jUhUk
         q0WQ==
X-Gm-Message-State: APjAAAUVOOf/iiTyTbPqCPYUCheWWllbMzD98ooV5CcO26wzMyhjU9F6
        aI/25432ySI6tOpw69o2ICdA4ymMg7s=
X-Google-Smtp-Source: APXvYqzylK39Qdr5FP30e/7iCno7z7sWFz2IwNYIppLyoa+Jv2m8cDpa0t1FR7jdFSyXuLB+2keF8Q==
X-Received: by 2002:a17:906:e088:: with SMTP id gh8mr22444283ejb.246.1569920693104;
        Tue, 01 Oct 2019 02:04:53 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id o31sm3007839edd.17.2019.10.01.02.04.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2019 02:04:52 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id q17so14465818wrx.10;
        Tue, 01 Oct 2019 02:04:52 -0700 (PDT)
X-Received: by 2002:a5d:684a:: with SMTP id o10mr16368695wrw.23.1569920692247;
 Tue, 01 Oct 2019 02:04:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.34bcd988943a26671681eaf849aacab51fab1cfe.1562847292.git-series.maxime.ripard@bootlin.com>
 <110dd9ff1784c29fa16304825a41d1603a33f166.1562847292.git-series.maxime.ripard@bootlin.com>
 <CAGb2v64nx2AuWZN+RxCneE0pqvXr_d7u6mQ+=nCHv2VJ1MNtrQ@mail.gmail.com>
 <CAGb2v66Sin9HZ+QENegLQ3d7iiy278niwdr9rEZ0HwUfeQNFRQ@mail.gmail.com> <20191001085246.55srb62bpfc6jhtu@gilmour>
In-Reply-To: <20191001085246.55srb62bpfc6jhtu@gilmour>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Tue, 1 Oct 2019 17:04:40 +0800
X-Gmail-Original-Message-ID: <CAGb2v66-Nak6RgtXYwOE6_nqHsOkLMh1G7CWJMDND1YzrywmHA@mail.gmail.com>
Message-ID: <CAGb2v66-Nak6RgtXYwOE6_nqHsOkLMh1G7CWJMDND1YzrywmHA@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] dt-bindings: media: Add Allwinner A10 CSI binding
To:     Maxime Ripard <mripard@kernel.org>
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 1, 2019 at 4:52 PM Maxime Ripard <mripard@kernel.org> wrote:
>
> Hi,
>
> Thanks for looking into this.
>
> On Sun, Sep 15, 2019 at 04:54:16PM +0800, Chen-Yu Tsai wrote:
> > On Thu, Aug 15, 2019 at 4:34 PM Chen-Yu Tsai <wens@csie.org> wrote:
> > >
> > > Hi,
> > >
> > > Sorry for chiming in so late.
> > >
> > > On Thu, Jul 11, 2019 at 8:15 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> > > >
> > > > The Allwinner A10 CMOS Sensor Interface is a camera capture interface also
> > > > used in later (A10s, A13, A20, R8 and GR8) SoCs.
> > > >
> > > > On some SoCs, like the A10, there's multiple instances of that controller,
> > > > with one instance supporting more channels and having an ISP.
> > > >
> > > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> > > > ---
> > > >  Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml | 94 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
> > > >  1 file changed, 94 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
> > > > new file mode 100644
> > > > index 000000000000..97c9fc3b5050
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
> > > > @@ -0,0 +1,94 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/arm/allwinner,sun4i-a10-csi.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Allwinner A10 CMOS Sensor Interface (CSI) Device Tree Bindings
> > > > +
> > > > +maintainers:
> > > > +  - Chen-Yu Tsai <wens@csie.org>
> > > > +  - Maxime Ripard <maxime.ripard@bootlin.com>
> > > > +
> > > > +description: |-
> > > > +  The Allwinner A10 and later has a CMOS Sensor Interface to retrieve
> > > > +  frames from a parallel or BT656 sensor.
> > > > +
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    oneOf:
> > > > +      - items:
> > > > +          - enum:
> > > > +              - allwinner,sun7i-a20-csi0
> > > > +          - const: allwinner,sun4i-a10-csi0
> > >
> > > CSI0 on the A10 has an ISP. Do we know if the one in the A20 does
> > > as well? It certainly doesn't say so in the user manual. If not,
> > > then we can't claim that A20 CSI0 is compatible with A10 CSI0.
> > >
> > > > +
> > > > +      - items:
> > > > +          - const: allwinner,sun4i-a10-csi0
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  interrupts:
> > > > +    maxItems: 1
> > > > +
> > > > +  clocks:
> > > > +    items:
> > > > +      - description: The CSI interface clock
> > > > +      - description: The CSI module clock
> > > > +      - description: The CSI ISP clock
> > > > +      - description: The CSI DRAM clock
> > > > +
> > > > +  clock-names:
> > > > +    items:
> > > > +      - const: bus
> > > > +      - const: mod
> > >
> > > I doubt this actually is a module clock. Based on the usage in your
> > > device tree patch, and the csi driver in the old linux-sunxi kernel,
> > > the clock rate is set to 24 MHz, or whatever the sensor requires for
> > > MCLK.
> >
> > I'm working on adding support for this on the R40, and it seems with
> > this SoC the picture is much clearer. It has the same CSI interface
> > block, but the CCU has the clocks correctly named. We have:
> >
> >   - CSI_MCLK0
> >   - CSI_MCLK1
> >   - CSI_SCLK
> >
> > in addition to the bus clocks.
> >
> > The CSI section also explains the clock signals:
> >
> >     6.1.3.2. Clock Sources
> >     Two Clocks need to be configured for CSI controller. CSI0/1_MCLK
> >     provides the master clock for sensor and other devices. CSI_SCLK
> >     is the top clock for the whole CSI module.
> >
> > So it would seem the ISP clock we currently have in the DT is simply
> > the module clock shared by all CSI-related hardware blocks, and the
> > module clock is bogus.
>
> I don't think it is. It looks like there's no ISP in the R40 CSI
> controllers, so that would mean that we don't have an ISP clock, and
> the SCLK is the module clock.
>
> Does that make sense?

Right. That's another way to put it. The point is I believe the
CSI[01]_CLK clocks on the A10/A20 are simply the MCLK outputs.

ChenYu
