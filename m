Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB7732DA407
	for <lists+linux-media@lfdr.de>; Tue, 15 Dec 2020 00:18:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388698AbgLNXPV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Dec 2020 18:15:21 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:34109 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393292AbgLNXPK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Dec 2020 18:15:10 -0500
Received: by mail-oi1-f193.google.com with SMTP id s75so21219525oih.1;
        Mon, 14 Dec 2020 15:14:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iTh9N+rYwCFON7UymOJ+NHCNudvypqo4gsPCV8m5fAQ=;
        b=P40iXVwFM4yHW6QJuhIQ338K+oNHVyx2m4/82tHNj/FLCfvXwOh2m9JcSfK0RUaRFd
         4rzw8TOQvVW9YLNGtkqNbJUB/HgsDds+je1JD3dx5cDC36c7nHZ2G0jEdKQS/tK9eiBj
         NhmndigXpu00eLYC3337WuWI4dExSEFPultbEG0DudLUgjk5tdR8wulmB2DLrurBfJJG
         2g1s0paCa1I72v1SCn13zrHjIEQ2Qd1M6CGKwhNA61lZ2TLk7hfHZKhftnAHNiHT02iy
         4kus+eD2oEc9xLMb0UB4ybdn4IJjWsyqpLo/6NIZnz0xLO58svCYfjs28ykDQiy5Ggsd
         RKIA==
X-Gm-Message-State: AOAM532F1/bKw4jasp4A4BkXAHD77FywHkN2NsCBdua8GLZmK0mVmgX+
        k7UHlalHBrN81bk2XaIB9w==
X-Google-Smtp-Source: ABdhPJw1/PEgIntKwP3Lbk8KAqgDfV7JdP6WU47iGZx+gZR0xq+HV8tbXHiKJO2xLiTHpwxo3QYgSw==
X-Received: by 2002:a05:6808:2c4:: with SMTP id a4mr20405604oid.114.1607987669080;
        Mon, 14 Dec 2020 15:14:29 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id u141sm4569388oie.46.2020.12.14.15.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 15:14:28 -0800 (PST)
Received: (nullmailer pid 2560486 invoked by uid 1000);
        Mon, 14 Dec 2020 23:14:26 -0000
Date:   Mon, 14 Dec 2020 17:14:26 -0600
From:   Rob Herring <robh@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-sunxi@googlegroups.com, Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        kevin.lhopital@hotmail.com
Subject: Re: [PATCH v3 08/15] dt-bindings: media: Add A31 MIPI CSI-2 bindings
 documentation
Message-ID: <20201214231426.GB2555279@robh.at.kernel.org>
References: <20201211155708.154710-1-paul.kocialkowski@bootlin.com>
 <20201211155708.154710-9-paul.kocialkowski@bootlin.com>
 <20201214113509.gkzf42rtag5b4mcn@gilmour>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201214113509.gkzf42rtag5b4mcn@gilmour>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Dec 14, 2020 at 12:35:09PM +0100, Maxime Ripard wrote:
> On Fri, Dec 11, 2020 at 04:57:01PM +0100, Paul Kocialkowski wrote:
> > This introduces YAML bindings documentation for the A31 MIPI CSI-2
> > controller.
> > 
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > ---
> >  .../media/allwinner,sun6i-a31-mipi-csi2.yaml  | 149 ++++++++++++++++++
> >  1 file changed, 149 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun6i-a31-mipi-csi2.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-mipi-csi2.yaml
> > new file mode 100644
> > index 000000000000..4d0bab541da1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-mipi-csi2.yaml
> > @@ -0,0 +1,149 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/allwinner,sun6i-a31-mipi-csi2.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Allwinner A31 MIPI CSI-2 Device Tree Bindings
> > +
> > +maintainers:
> > +  - Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - const: allwinner,sun6i-a31-mipi-csi2
> > +      - items:
> > +          - const: allwinner,sun8i-v3s-mipi-csi2
> > +          - const: allwinner,sun6i-a31-mipi-csi2
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: Bus Clock
> > +      - description: Module Clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: bus
> > +      - const: mod
> > +
> > +  phys:
> > +    items:
> > +      - description: MIPI D-PHY
> 
> This should be written as
> 
> phys:
>   description: ...

Then you need 'maxItems: 1' or just that. I guess there is some value in 
saying it is a D-PHY.

Rob

