Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14ABB7C71AC
	for <lists+linux-media@lfdr.de>; Thu, 12 Oct 2023 17:37:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343696AbjJLPhj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Oct 2023 11:37:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232023AbjJLPhi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Oct 2023 11:37:38 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B12BB8
        for <linux-media@vger.kernel.org>; Thu, 12 Oct 2023 08:37:37 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E69F5C433C8;
        Thu, 12 Oct 2023 15:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697125056;
        bh=ML/ItAhL36ApIhxTi+3W4IYUm7EIERSRXtCwbBcLfCc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KUa9IbTgCoqpTvU++heQIdq4I240gcIfvieNWQpfdGD+PIR77+dxnOrwjQD+/eKVA
         1Sv6NOvaDsKwzy8jY0RtidZaieb0+H5DmsS5VioUWmAkStXuxFmVeO7Q5+pAu77JpM
         kcE/0Zs73AbnQMRTpp1F5faMlpmhcnJHqzSo3dRts+66VzU0ayHF9NKHbRYaixDlH2
         NaE1yjZFPQoN07qCBoNB3gDedgUXBRGxhJCv42sKFsrKlb6cwmS21fPmiv/+ozLxzd
         ri1h+7x2j6k7Ld7q5rps95jyMp9QXRjgVeQCNJkglh2u2RZuq2fw7a9Mm8D7gSV8u6
         +OnouuvXbcLOA==
Received: (nullmailer pid 891148 invoked by uid 1000);
        Thu, 12 Oct 2023 15:37:34 -0000
Date:   Thu, 12 Oct 2023 10:37:34 -0500
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Conor Dooley <conor@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        devicetree@vger.kernel.org, Lee Jackson <lee.jackson@arducam.com>
Subject: Re: [PATCH 1/2] media: dt-bindings: Add OmniVision OV64A40
Message-ID: <20231012153734.GA826122-robh@kernel.org>
References: <20231010151208.29564-1-jacopo.mondi@ideasonboard.com>
 <20231010151208.29564-2-jacopo.mondi@ideasonboard.com>
 <20231011-conflict-monument-75379ef495cc@spud>
 <ar5rf3mas33vvg47jflmhajpyx2pypdjdf3x522x3a3v5cva2a@gjmr5cjv6dyd>
 <20231011-deserve-platonic-0beb72c94661@spud>
 <20231011162454.GB5306@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231011162454.GB5306@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 11, 2023 at 07:24:54PM +0300, Laurent Pinchart wrote:
> On Wed, Oct 11, 2023 at 05:16:50PM +0100, Conor Dooley wrote:
> > On Wed, Oct 11, 2023 at 06:12:28PM +0200, Jacopo Mondi wrote:
> > > On Wed, Oct 11, 2023 at 04:53:34PM +0100, Conor Dooley wrote:
> > > > On Tue, Oct 10, 2023 at 05:12:07PM +0200, Jacopo Mondi wrote:
> > > > > Add bindings for OmniVision OV64A40.
> > > > >
> > > > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > > Signed-off-by: Lee Jackson <lee.jackson@arducam.com>
> > > >
> > > > What does Lee's SoB indicate here?
> > > 
> > > Lee has contributed to the development of the driver and validation of
> > > bindings.
> > 
> > Then you're missing a Co-developed-by: from Lee :)
> > 
> > > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > > index b19995690904..df089d68b58c 100644
> > > > > --- a/MAINTAINERS
> > > > > +++ b/MAINTAINERS
> > > > > @@ -15821,6 +15821,13 @@ S:	Maintained
> > > > >  T:	git git://linuxtv.org/media_tree.git
> > > > >  F:	drivers/media/i2c/ov5695.c
> > > > >
> > > > > +OMNIVISION OV64A40 SENSOR DRIVER
> > > > > +M:	Jacopo Mondi <jacopo.mondi@ideasonboard.org>
> > > > > +L:	linux-media@vger.kernel.org
> > > > > +S:	Maintained
> > > > > +T:	git git://linuxtv.org/media_tree.git
> > > >
> > > > Binding looks fine to me, my question is here. Usually having a tree
> > > > here means that you apply the patches yourself. Do you?
> > > >
> > > 
> > > No, and only Mauro has commit rights on the media tree.
> > > 
> > > All i2c sensor drivers have a tree listed, regardless who commits
> > > there. What should I put there ?
> > 
> > IMO, nothing. The media tree entry should cover the parent directory,
> > no?
> 
> There's little documentation for the T: tag. In MAINTAINERS, we have
> 
>         T: *SCM* tree type and location.
>            Type is one of: git, hg, quilt, stgit, topgit
> 
> which doesn't tell much. In Documentation/sbumitting-patches.rst,
> there's ona additional paragraph:
> 
>   Note, however, that you may not want to develop against the mainline
>   tree directly.  Most subsystem maintainers run their own trees and
>   want to see patches prepared against those trees.  See the **T:**
>   entry for the subsystem in the MAINTAINERS file to find that tree, or
>   simply ask the maintainer if the tree is not listed there.
> 
> If the purpose of the T: tag is to tell which tree patches for this
> driver should be developed against, the above tree seems right.

No, it says 'T' would be in the subsystem entry, not the driver entry.

It is somewhat frequently suggested to use 'T' entries as the way to 
find maintainers who apply patches vs. maintainers for a file. I would 
like something more explicit, but that's what we have ATM.

Rob
