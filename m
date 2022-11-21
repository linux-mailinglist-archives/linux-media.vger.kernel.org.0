Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C2EE631FF4
	for <lists+linux-media@lfdr.de>; Mon, 21 Nov 2022 12:11:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230501AbiKULLo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Nov 2022 06:11:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230504AbiKULKp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Nov 2022 06:10:45 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AF7B38A5;
        Mon, 21 Nov 2022 03:07:40 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9E39B74C;
        Mon, 21 Nov 2022 12:07:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669028826;
        bh=jGpOQO+X5hH4cZCBKqCtuHwespayHBV2l8MWJKlO3OE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cxCLAMKONpic0LLC+0kgMunFgGttSqr/Oedn8hwZiQA+2voVIscLoaDfKy2v6HV0n
         wU1ni4YP1Fckr1aV11bksXPJXR11Rw4QWqAODJpytsWu/qP/Zi12dWtQ7jfsOcxNUU
         OSt7m4U19PECxa54AOxueJREEjY8nkbExTbHXfhc=
Date:   Mon, 21 Nov 2022 13:06:52 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Paul Elder <paul.elder@ideasonboard.com>,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v3 0/6] dt-bindings: Add macros for video interface bus
 types
Message-ID: <Y3tbzArGt9yap6x7@pendragon.ideasonboard.com>
References: <20220615221410.27459-1-laurent.pinchart@ideasonboard.com>
 <YtOyCBOqCR71uG1i@paasikivi.fi.intel.com>
 <Y3dPGkFaz/qo/drw@pyrite.rasen.tech>
 <Y3krOMoBLKpF1L7/@pendragon.ideasonboard.com>
 <Y3tYyRHkvgei5We9@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y3tYyRHkvgei5We9@paasikivi.fi.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Mon, Nov 21, 2022 at 10:54:01AM +0000, Sakari Ailus wrote:
> On Sat, Nov 19, 2022 at 09:15:04PM +0200, Laurent Pinchart wrote:
> > On Fri, Nov 18, 2022 at 06:23:38PM +0900, Paul Elder wrote:
> > > On Sun, Jul 17, 2022 at 06:54:00AM +0000, Sakari Ailus wrote:
> > > > Folks,
> > > > 
> > > > > Laurent Pinchart (6):
> > > > >   dt-bindings: media: Add macros for video interface bus types
> > > > >   dt-bindings: Use new video interface bus type macros in examples
> > > > >   ARM: dts: freescale: Use new media bus type macros
> > > > >   ARM: dts: omap: Use new media bus type macros
> > > > >   ARM: dts: renesas: Use new media bus type macros
> > > > >   ARM: dts: stm32: Use new media bus type macros
> > > > 
> > > > What's the preference on the tree through which these would be merged?
> > > > 
> > > > The two first should probably go through the media tree but what about the
> > > > DTS? There's a dependency to the first patch. I can take these all if
> > > > people are fine with that.
> > > 
> > > How is this going?
> > 
> > Sakari, if there's a concern taking patches 3/6 to 6/6 in the media
> > tree, could you merge 1/6 and 2/6 ? If they can still be included in a
> > pull request for v6.2, I'll work on getting the dts changes in v6.3
> > through their respective trees.
> 
> I think I was expecting v4 from you. But I can address the comments, too,
> they were minor matters.

That would be nice :-) Could it still be done for v6.2 ?

> For applying the DTS patches I'd like to have ack from respective
> treemaintainers it's fine to take these through the media tree.

Works for me, this can be done in v6.3.

-- 
Regards,

Laurent Pinchart
