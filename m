Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9B7F2DC21C
	for <lists+linux-media@lfdr.de>; Wed, 16 Dec 2020 15:26:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726495AbgLPOZl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Dec 2020 09:25:41 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:41542 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726332AbgLPOZk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Dec 2020 09:25:40 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4D07245E;
        Wed, 16 Dec 2020 15:24:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608128698;
        bh=wvcHjQoGe/khtxCSJuApgP2sP/PWMbdlprUUmhRo/xA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Sr9KxOZiWkDDUzpY+vaKXFoJLTHAnycQ3qz+HJ0PGYiwvR6f+zBZp6KPmhOY4xPXL
         KjKW/tpxhzOqtOMz+1hrulPLVWnXe4fI8CCyl++UZuUOeCkF3zcM5RXbU1iahc1xRe
         IbfGuroGNQqrg+RVXjFnhj8vte3ijApLiB/Y2zmo=
Date:   Wed, 16 Dec 2020 16:24:51 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: dt-bindings: Convert video-interfaces.txt
 properties to schemas
Message-ID: <X9oYs43PzXbIXXs8@pendragon.ideasonboard.com>
References: <20201210211625.3070388-1-robh@kernel.org>
 <20201210211625.3070388-2-robh@kernel.org>
 <alpine.DEB.2.20.2012161113060.15676@axis700.grange>
 <20201216141210.GB651087@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201216141210.GB651087@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,

On Wed, Dec 16, 2020 at 08:12:10AM -0600, Rob Herring wrote:
> On Wed, Dec 16, 2020 at 11:18:03AM +0100, Guennadi Liakhovetski wrote:
> > Hi Rob,
> > 
> > Sorry for the delay! I didn't realise my ack was required for this patch.
> > I won't object against the licence change, but please don't add me as a
> > maintainer of
> 
> Okay, so that's an Ack?
> 
> > 
> > On Thu, 10 Dec 2020, Rob Herring wrote:
> > 
> > [snip]
> > 
> > > diff --git a/Documentation/devicetree/bindings/media/video-interfaces.yaml b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> > > new file mode 100644
> > > index 000000000000..7415a4df1576
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> > > @@ -0,0 +1,344 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/video-interfaces.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Common bindings for video receiver and transmitter interface endpoints
> > > +
> > > +maintainers:
> > > +  - Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> > 
> > I did commit the original version of
> > Documentation/devicetree/bindings/media/video-interfaces.txt but that was
> > more than 8 years ago, I haven't worked in media / V4L for several years
> > now, so, I don't think I can meaningfully maintain that file now.
> 
> Okay, I'll drop you.
> 
> Anyone else want to sign up? Laurent?

I'll likely regret this, but yes, you can sign me up :-)

-- 
Regards,

Laurent Pinchart
