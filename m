Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3B424B4EC0
	for <lists+linux-media@lfdr.de>; Mon, 14 Feb 2022 12:34:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351891AbiBNLe5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Feb 2022 06:34:57 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351888AbiBNLed (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Feb 2022 06:34:33 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8018B48
        for <linux-media@vger.kernel.org>; Mon, 14 Feb 2022 03:22:23 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9479247F;
        Mon, 14 Feb 2022 12:22:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1644837741;
        bh=X5xYBOTUMkifRNVR0lhrVA6C8OWJvW+i+GGXQUzntuo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=go5vUZsyxbtvAaNLsMIAePExd+54nrGg7CJA5HVSGiKmKzPWOz1YI+/NmyoR8KTT/
         TiM52ltjAxsBa9DNSdJQ4MRT1OS8u/Sc+4cTIC+IIJekIvQyKgy6rTo/Z9X9xn/Cn/
         90c6slUGpc9TuDn4EX5eJLp2f1MDhl4mGxkHq/jI=
Date:   Mon, 14 Feb 2022 13:22:15 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>, slongerbeam@gmail.com,
        p.zabel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, martin.kepplinger@puri.sm,
        xavier.roumegue@oss.nxp.com, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] media: imx: Rename imx7-mipi-csis.c to
 imx-mipi-csis.c
Message-ID: <Ygo7Z9xz6eGd7STb@pendragon.ideasonboard.com>
References: <20220211180216.290133-1-jacopo@jmondi.org>
 <20220211180216.290133-3-jacopo@jmondi.org>
 <CHVP0EFTUAMC.2NPFPZMC5ACNW@arch-thunder>
 <20220214112000.y7npvxtxoot26753@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220214112000.y7npvxtxoot26753@uno.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Mon, Feb 14, 2022 at 12:20:00PM +0100, Jacopo Mondi wrote:
> On Mon, Feb 14, 2022 at 10:20:57AM +0000, Rui Miguel Silva wrote:
> > Hey Jacopo,
> > I think you by now saw the kernel test report.
> >
> > You miss the rename in the makefile also.
> 
> Yes, that's pretty stupid sorry, I forgot to add the Makefile :(
> 
> I'll fix in v2
> 
> Laurent, do you want to squash 2/3 and 3/3 to have the symbols and the
> file rename in the same patch ?

I think I'd prefer that, but if it ends up being messy you can keep them
separate.

> > ------
> > Cheers,
> >      Rui
> > On Fri Feb 11, 2022 at 6:02 PM WET, Jacopo Mondi wrote:
> >
> > > Rename the imx7-mipi-csis.c driver to remove the reference to i.MX7.
> > >
> > > The driver is for an IP core found on i.MX7 and i.MX8 SoC so do not
> > > specify a SoC version number in the driver name.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > ---
> > >  MAINTAINERS                                                     | 2 +-
> > >  .../media/platform/imx/{imx7-mipi-csis.c => imx-mipi-csis.c}    | 0
> > >  2 files changed, 1 insertion(+), 1 deletion(-)
> > >  rename drivers/media/platform/imx/{imx7-mipi-csis.c => imx-mipi-csis.c} (100%)
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 5bdb8c881b0b..7def3b7d56bc 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -11891,7 +11891,7 @@ T:	git git://linuxtv.org/media_tree.git
> > >  F:	Documentation/admin-guide/media/imx7.rst
> > >  F:	Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
> > >  F:	Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
> > > -F:	drivers/media/platform/imx/imx7-mipi-csis.c
> > > +F:	drivers/media/platform/imx/imx-mipi-csis.c
> > >  F:	drivers/staging/media/imx/imx7-media-csi.c
> > >
> > >  MEDIA DRIVERS FOR HELENE
> > > diff --git a/drivers/media/platform/imx/imx7-mipi-csis.c b/drivers/media/platform/imx/imx-mipi-csis.c
> > > similarity index 100%
> > > rename from drivers/media/platform/imx/imx7-mipi-csis.c
> > > rename to drivers/media/platform/imx/imx-mipi-csis.c

-- 
Regards,

Laurent Pinchart
