Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 837A74CEC51
	for <lists+linux-media@lfdr.de>; Sun,  6 Mar 2022 17:54:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232429AbiCFQzS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Mar 2022 11:55:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231218AbiCFQzR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Mar 2022 11:55:17 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6E5F41605;
        Sun,  6 Mar 2022 08:54:24 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 10F7D482;
        Sun,  6 Mar 2022 17:54:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646585662;
        bh=mhT517VAmXVC6DXdNmYkViFAhLpxLMeHciIaiEmB2S0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qsKJQgAVwnHCG+aG1bcjmnhAQf+69Qdj9I+DdfDxh/wid9BGqBL4avhBcQKQW559H
         GYi7Pmqg+oWsEnPMebfLIq+DHRJfHG/BwcYKu7pzMyqTlNbH1lLTKsOPYP9/Kjrbzu
         k+2pPTrpR2NBgej7IBJ8tDPUp9mqY7GGS9tRZfUo=
Date:   Sun, 6 Mar 2022 18:54:10 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: Re: [PATCH 1/2] dt-bindings: media: Add macros for video interface
 bus types
Message-ID: <YiTnMq+czvLzEtnf@pendragon.ideasonboard.com>
References: <20220227203352.17314-1-laurent.pinchart@ideasonboard.com>
 <20220227203352.17314-2-laurent.pinchart@ideasonboard.com>
 <YhvoC0aXpJUTslnC@paasikivi.fi.intel.com>
 <YhvqLL0LYWt2ryaE@pendragon.ideasonboard.com>
 <Yh416qrZr32PzMtJ@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Yh416qrZr32PzMtJ@robh.at.kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,

On Tue, Mar 01, 2022 at 09:04:10AM -0600, Rob Herring wrote:
> On Sun, Feb 27, 2022 at 11:16:28PM +0200, Laurent Pinchart wrote:
> > On Sun, Feb 27, 2022 at 11:07:23PM +0200, Sakari Ailus wrote:
> > > On Sun, Feb 27, 2022 at 10:33:51PM +0200, Laurent Pinchart wrote:
> > > > Add a new dt-bindings/media/video-interfaces.h header that defines
> > > > macros corresponding to the bus types from media/video-interfaces.yaml.
> > > > This allows avoiding hardcoded constants in device tree sources.
> > > > 
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > ---
> > > >  include/dt-bindings/media/video-interfaces.h | 16 ++++++++++++++++
> > > >  1 file changed, 16 insertions(+)
> > > >  create mode 100644 include/dt-bindings/media/video-interfaces.h
> > > > 
> > > > diff --git a/include/dt-bindings/media/video-interfaces.h b/include/dt-bindings/media/video-interfaces.h
> > > > new file mode 100644
> > > > index 000000000000..e38058e1cca7
> > > > --- /dev/null
> > > > +++ b/include/dt-bindings/media/video-interfaces.h
> > > > @@ -0,0 +1,16 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > > +/*
> > > > + * Copyright (C) 2022 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > + */
> > > > +
> > > > +#ifndef __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__
> > > > +#define __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__
> > > > +
> > > > +#define MEDIA_BUS_TYPE_CSI2_CPHY		1
> > > > +#define MEDIA_BUS_TYPE_CSI1			2
> > > > +#define MEDIA_BUS_TYPE_CCP2			3
> > > > +#define MEDIA_BUS_TYPE_CSI2_DPHY		4
> > > > +#define MEDIA_BUS_TYPE_PARALLEL			5
> > > 
> > > I've been long thinkin of renaming "PARALLEL" as "BT.601" which it really
> > > is. I don't mind postponing that, but I think you could as well start here.
> > > Up to you.
> > 
> > I think it's a good idea, but we then need to decide what to do with
> > other types of parallel buses. Let's start this discussion now, and
> > implement it in a patch on top of this series.
> 
> 5 and what it means is an ABI. If it is ambiguous and needs to be more 
> specific, then you need new numbers for all of those specific types.
> 
> If it is just a rename, I prefer it is done from the start.

It's both :-) It's ambiguous, but only used to refer to BT.601-liked
buses today in mainline, so I'll rename it. The number may be used to
refer to different types of parallel buses out-of-tree, and we can add
new types for that in mainline later when/if needed.

> > > Should this be somehow visible in video-interfaces.yaml?
> > 
> > I wish we could use macros in .yaml files instead of numerical values,
> > but I don't think that's possible. I can do this:
> > 
> >    bus-type:
> >      $ref: /schemas/types.yaml#/definitions/uint32
> >      enum:
> > -      - 1 # MIPI CSI-2 C-PHY
> > -      - 2 # MIPI CSI1
> > -      - 3 # CCP2
> > -      - 4 # MIPI CSI-2 D-PHY
> > -      - 5 # Parallel
> > -      - 6 # BT.656
> > +      - 1 # MIPI CSI-2 C-PHY (MEDIA_BUS_TYPE_CSI2_CPHY)
> > +      - 2 # MIPI CSI1 (MEDIA_BUS_TYPE_CSI1)
> > +      - 3 # CCP2 (MEDIA_BUS_TYPE_CCP2)
> > +      - 4 # MIPI CSI-2 D-PHY (MEDIA_BUS_TYPE_CSI2_DPHY)
> > +      - 5 # Parallel (MEDIA_BUS_TYPE_PARALLEL)
> > +      - 6 # BT.656 (MEDIA_BUS_TYPE_BT656)
> 
> Seems a bit redundant to have both comment text and define. The only 
> part missing from the defines is 'MIPI'.

I agree. I'll use the macros.

It would be nice if macros could be used instead of numerical values in
the YAML schema, but that's certainly not high on the wishlist.

> >      description:
> > -      Data bus type.
> > +      Data bus type. Use the macros listed above (defined in
> > +      dt-bindings/video-interfaces.h) instead of numerical values.
> > 
> > Any better proposal ?
> > 
> > > > +#define MEDIA_BUS_TYPE_BT656			6
> > > > +
> > > > +#endif /* __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__ */

-- 
Regards,

Laurent Pinchart
