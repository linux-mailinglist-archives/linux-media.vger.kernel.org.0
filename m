Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97A3E11EFFF
	for <lists+linux-media@lfdr.de>; Sat, 14 Dec 2019 03:32:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726528AbfLNCcY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Dec 2019 21:32:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:47278 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726046AbfLNCcY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Dec 2019 21:32:24 -0500
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DE4E724671;
        Sat, 14 Dec 2019 02:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576290743;
        bh=Eqc89Omw2jaNSyVCeKQpbJEzJvaQOE+Lhw+SBNFW1as=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=jZkbjakqLdjtzYgUNB/HYiBz3IBx4bt7kPaHKKN2tdiyTsc/jpOHeRDwVOQnR+K6Q
         su3Hi4gSfXWdv4OJ7ZXcgYPwxPVXUMKtoBZHIGiQEZLm+cCpc8+qFZUjagsB56r0Gw
         XQYDJVWfe4jc6/Tz2U9yjeSzMr2sPxMdZ4YluL8Q=
Received: by mail-wr1-f45.google.com with SMTP id b6so812910wrq.0;
        Fri, 13 Dec 2019 18:32:22 -0800 (PST)
X-Gm-Message-State: APjAAAXC8vFip97N4hbjqo/xPgZO86PeUuCoASHLumyE4GCxj/1l1N6/
        FTz9D88rTYXgplYFcHorQSsB+rjjDjHExbxB7tk=
X-Google-Smtp-Source: APXvYqydbgYkBfEkSoHYnoVFyJ9oQyanZL22yafvKiwGMvhkX5QHDVviEUybs0JIej2bMIEu5E4NYaiS2pFxFoLorOM=
X-Received: by 2002:adf:81e3:: with SMTP id 90mr15946921wra.23.1576290741171;
 Fri, 13 Dec 2019 18:32:21 -0800 (PST)
MIME-Version: 1.0
References: <20191213125414.90725-1-boris.brezillon@collabora.com>
 <20191213125414.90725-6-boris.brezillon@collabora.com> <20191213152332.GF4860@pendragon.ideasonboard.com>
 <20191213162550.59730f89@collabora.com>
In-Reply-To: <20191213162550.59730f89@collabora.com>
From:   Chen-Yu Tsai <wens@kernel.org>
Date:   Sat, 14 Dec 2019 10:32:12 +0800
X-Gmail-Original-Message-ID: <CAGb2v64u34+ukyvGuDWDMyC2L3TE8-sPPx1SOP5RVAPF+ssooA@mail.gmail.com>
Message-ID: <CAGb2v64u34+ukyvGuDWDMyC2L3TE8-sPPx1SOP5RVAPF+ssooA@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] media: dt-bindings: rockchip: Document RK3399
 Video Decoder bindings
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree <devicetree@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Dec 14, 2019 at 4:38 AM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Fri, 13 Dec 2019 17:23:32 +0200
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
>
> > Hi Boris,
> >
> > Thank you for the patch.
> >
> > On Fri, Dec 13, 2019 at 01:54:12PM +0100, Boris Brezillon wrote:
> > > Document the Rockchip RK3399 Video Decoder bindings.
> > >
> > > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > ---
> > > Changes in v3:
> > > * Fix dtbs_check failures
> > > ---
> > >  .../bindings/media/rockchip,vdec.yaml         | 71 +++++++++++++++++++
> > >  1 file changed, 71 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> > > new file mode 100644
> > > index 000000000000..7167c3d6a389
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> > > @@ -0,0 +1,71 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/rockchip,vdec.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Rockchip Video Decoder (VDec) Device Tree Bindings
> > > +
> > > +maintainers:
> > > +  - Heiko Stuebner <heiko@sntech.de>
> > > +
> > > +description: |-
> > > +  The Rockchip rk3399 has a stateless Video Decoder that can decodes H.264,
> > > +  HEVC an VP9 streams.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: rockchip,rk3399-vdec
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description: The Video Decoder AXI interface clock
> > > +      - description: The Video Decoder AHB interface clock
> > > +      - description: The Video Decoded CABAC clock
> > > +      - description: The Video Decoder core clock
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: aclk
> >
> > How about calling it "axi" ? None of the other clock names have "clk".
> >
> > > +      - const: iface
> >
> > And "ahb" here, as the AXI interface clock is also an interface clock ?
>
> Sure, I can do that.

Another possibility: "master" for the AXI clock, and "slave" for the AHB clock.
The AXI interface is likely the DMA master, while the AHB interface is a slave
interface for the control registers.

This is mostly based on hints from the crypto block.

ChenYu
