Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6A602DC1E7
	for <lists+linux-media@lfdr.de>; Wed, 16 Dec 2020 15:13:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbgLPOMy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Dec 2020 09:12:54 -0500
Received: from mail-oi1-f173.google.com ([209.85.167.173]:38783 "EHLO
        mail-oi1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726396AbgLPOMx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Dec 2020 09:12:53 -0500
Received: by mail-oi1-f173.google.com with SMTP id x13so18576543oic.5;
        Wed, 16 Dec 2020 06:12:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=d9IG4L/5kqAsPJUUPo/DF2eSmilATF1K3306QiZRdMc=;
        b=qDJZusbfYLstxj45uiGz7tMboO+TIUnBf1hcCscWfpEP5dsB3Hsf6r/BDsDyCJjxL5
         tJV4A7UDZB0G0WL2p7/Pt1ujy/H00L80GIocJAhY0R6VXSIi3U0JfNF9kzvz+yahfiYs
         6gIprjLF+BjDoNMNaO8EhHoIuH29LwvfV86qLcSeKajVD2ilJjA4UKkIUE0MeYIBqnJA
         YVBIklaWcvBGd605C9bRLX2+yWjLlCaDnmZ+wNIUwLBkUApYz27guCDHJYAO9MZp/IiT
         wPoxY+BwmGhFTm8o4MKYY2Wg85gLqZXSVQkEZj+ivF/DqFbpyQMiaJF7H7Cr5sgppeJh
         LBXg==
X-Gm-Message-State: AOAM533Gh1186LW37ONQdY7RK5Hlc1xF2iZ56o0emaysIYRjkKgf9s8F
        bSG0bH8VISC2syqYZV3l7j9l5bR/ng==
X-Google-Smtp-Source: ABdhPJz74g6qzjy7hOkovlSheopH0aAIWbjsnbZS8+uhxJZmJ7bt7whE1cGUw3R0cCxnK5snw7cn/A==
X-Received: by 2002:aca:5253:: with SMTP id g80mr2075695oib.98.1608127932708;
        Wed, 16 Dec 2020 06:12:12 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m3sm451583ots.72.2020.12.16.06.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Dec 2020 06:12:11 -0800 (PST)
Received: (nullmailer pid 1830343 invoked by uid 1000);
        Wed, 16 Dec 2020 14:12:10 -0000
Date:   Wed, 16 Dec 2020 08:12:10 -0600
From:   Rob Herring <robh@kernel.org>
To:     Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: dt-bindings: Convert video-interfaces.txt
 properties to schemas
Message-ID: <20201216141210.GB651087@robh.at.kernel.org>
References: <20201210211625.3070388-1-robh@kernel.org>
 <20201210211625.3070388-2-robh@kernel.org>
 <alpine.DEB.2.20.2012161113060.15676@axis700.grange>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.20.2012161113060.15676@axis700.grange>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 16, 2020 at 11:18:03AM +0100, Guennadi Liakhovetski wrote:
> Hi Rob,
> 
> Sorry for the delay! I didn't realise my ack was required for this patch.
> I won't object against the licence change, but please don't add me as a
> maintainer of

Okay, so that's an Ack?

> 
> On Thu, 10 Dec 2020, Rob Herring wrote:
> 
> [snip]
> 
> > diff --git a/Documentation/devicetree/bindings/media/video-interfaces.yaml b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> > new file mode 100644
> > index 000000000000..7415a4df1576
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> > @@ -0,0 +1,344 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/video-interfaces.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Common bindings for video receiver and transmitter interface endpoints
> > +
> > +maintainers:
> > +  - Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> 
> I did commit the original version of
> Documentation/devicetree/bindings/media/video-interfaces.txt but that was
> more than 8 years ago, I haven't worked in media / V4L for several years
> now, so, I don't think I can meaningfully maintain that file now.

Okay, I'll drop you.

Anyone else want to sign up? Laurent?

Rob
