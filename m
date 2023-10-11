Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A972E7C5910
	for <lists+linux-media@lfdr.de>; Wed, 11 Oct 2023 18:24:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231858AbjJKQYz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Oct 2023 12:24:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230271AbjJKQYy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Oct 2023 12:24:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A72F991;
        Wed, 11 Oct 2023 09:24:52 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5EBD3512;
        Wed, 11 Oct 2023 18:24:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1697041484;
        bh=VvTWetfAU33D3NP4Jevd86GCQidIbkk2d2bk+mjnMe8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LYj9wM8RwWcbKBn5rk0zwDaQg5Jn324N0JGSPS2g0ZYJn1uK63bcgRpdZBDnLxLQc
         0Ey+84ngHilPQdrAL7Lc+LxVCqHsG2B0I80cUcdeMIsLIhRjc6bSGGgN7QYJWr8AEg
         RFBm+XV7sVILu2eUcg7mbVZdTZqt0SNe19Rm3xB0=
Date:   Wed, 11 Oct 2023 19:24:54 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Conor Dooley <conor@kernel.org>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        devicetree@vger.kernel.org, Lee Jackson <lee.jackson@arducam.com>
Subject: Re: [PATCH 1/2] media: dt-bindings: Add OmniVision OV64A40
Message-ID: <20231011162454.GB5306@pendragon.ideasonboard.com>
References: <20231010151208.29564-1-jacopo.mondi@ideasonboard.com>
 <20231010151208.29564-2-jacopo.mondi@ideasonboard.com>
 <20231011-conflict-monument-75379ef495cc@spud>
 <ar5rf3mas33vvg47jflmhajpyx2pypdjdf3x522x3a3v5cva2a@gjmr5cjv6dyd>
 <20231011-deserve-platonic-0beb72c94661@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231011-deserve-platonic-0beb72c94661@spud>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 11, 2023 at 05:16:50PM +0100, Conor Dooley wrote:
> On Wed, Oct 11, 2023 at 06:12:28PM +0200, Jacopo Mondi wrote:
> > On Wed, Oct 11, 2023 at 04:53:34PM +0100, Conor Dooley wrote:
> > > On Tue, Oct 10, 2023 at 05:12:07PM +0200, Jacopo Mondi wrote:
> > > > Add bindings for OmniVision OV64A40.
> > > >
> > > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > Signed-off-by: Lee Jackson <lee.jackson@arducam.com>
> > >
> > > What does Lee's SoB indicate here?
> > 
> > Lee has contributed to the development of the driver and validation of
> > bindings.
> 
> Then you're missing a Co-developed-by: from Lee :)
> 
> > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > index b19995690904..df089d68b58c 100644
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -15821,6 +15821,13 @@ S:	Maintained
> > > >  T:	git git://linuxtv.org/media_tree.git
> > > >  F:	drivers/media/i2c/ov5695.c
> > > >
> > > > +OMNIVISION OV64A40 SENSOR DRIVER
> > > > +M:	Jacopo Mondi <jacopo.mondi@ideasonboard.org>
> > > > +L:	linux-media@vger.kernel.org
> > > > +S:	Maintained
> > > > +T:	git git://linuxtv.org/media_tree.git
> > >
> > > Binding looks fine to me, my question is here. Usually having a tree
> > > here means that you apply the patches yourself. Do you?
> > >
> > 
> > No, and only Mauro has commit rights on the media tree.
> > 
> > All i2c sensor drivers have a tree listed, regardless who commits
> > there. What should I put there ?
> 
> IMO, nothing. The media tree entry should cover the parent directory,
> no?

There's little documentation for the T: tag. In MAINTAINERS, we have

        T: *SCM* tree type and location.
           Type is one of: git, hg, quilt, stgit, topgit

which doesn't tell much. In Documentation/sbumitting-patches.rst,
there's ona additional paragraph:

  Note, however, that you may not want to develop against the mainline
  tree directly.  Most subsystem maintainers run their own trees and
  want to see patches prepared against those trees.  See the **T:**
  entry for the subsystem in the MAINTAINERS file to find that tree, or
  simply ask the maintainer if the tree is not listed there.

If the purpose of the T: tag is to tell which tree patches for this
driver should be developed against, the above tree seems right.

-- 
Regards,

Laurent Pinchart
