Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BAC4631ED5
	for <lists+linux-media@lfdr.de>; Mon, 21 Nov 2022 11:54:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbiKUKyS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Nov 2022 05:54:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229864AbiKUKyI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Nov 2022 05:54:08 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ECFF23EAD;
        Mon, 21 Nov 2022 02:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669028047; x=1700564047;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5CzyKjvM5WYE6virKJsMLAdYS9+fXIpeK1k+J3c3OSs=;
  b=BmXxgbYvoWS3kz4mLqbjOnxIr6bAh0TuR0WUS95ZTBmZivHFIKmZG68z
   VkRZ2fiFygaCSKqb3ptXNITdUo06PhzqoWtFc0GYKQjxcwGBzxm7tUsWb
   7ytxqs6vuPfiwrSaTrcsOHepvRvGfdUGFrB7hOcumWCf02UV5+hnHXTrf
   WB4vH3RVuuIM1bx869cFgZPW/eanXggcIKQESUAub4Q5ZumFPjnVMJO3o
   Jz336ZTT3za/rrkCw7BPhXAwNGlCgQ8Wft7BO73nZyF15Hg9wvtD0w1ET
   yogIHmJJ37zJD1D+97CEFMqDt/1Ywc1MPcAIUAG4Xlaot4bWfxxsNXXdU
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="301073722"
X-IronPort-AV: E=Sophos;i="5.96,181,1665471600"; 
   d="scan'208";a="301073722"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2022 02:54:07 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="886075072"
X-IronPort-AV: E=Sophos;i="5.96,181,1665471600"; 
   d="scan'208";a="886075072"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2022 02:54:03 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 839582015F;
        Mon, 21 Nov 2022 12:54:01 +0200 (EET)
Date:   Mon, 21 Nov 2022 10:54:01 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Message-ID: <Y3tYyRHkvgei5We9@paasikivi.fi.intel.com>
References: <20220615221410.27459-1-laurent.pinchart@ideasonboard.com>
 <YtOyCBOqCR71uG1i@paasikivi.fi.intel.com>
 <Y3dPGkFaz/qo/drw@pyrite.rasen.tech>
 <Y3krOMoBLKpF1L7/@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3krOMoBLKpF1L7/@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Sat, Nov 19, 2022 at 09:15:04PM +0200, Laurent Pinchart wrote:
> Hello,
> 
> On Fri, Nov 18, 2022 at 06:23:38PM +0900, Paul Elder wrote:
> > Hi Sakari,
> > 
> > Gentle ping.
> > 
> > On Sun, Jul 17, 2022 at 06:54:00AM +0000, Sakari Ailus wrote:
> > > Folks,
> > > 
> > > > Laurent Pinchart (6):
> > > >   dt-bindings: media: Add macros for video interface bus types
> > > >   dt-bindings: Use new video interface bus type macros in examples
> > > >   ARM: dts: freescale: Use new media bus type macros
> > > >   ARM: dts: omap: Use new media bus type macros
> > > >   ARM: dts: renesas: Use new media bus type macros
> > > >   ARM: dts: stm32: Use new media bus type macros
> > > 
> > > What's the preference on the tree through which these would be merged?
> > > 
> > > The two first should probably go through the media tree but what about the
> > > DTS? There's a dependency to the first patch. I can take these all if
> > > people are fine with that.
> > 
> > How is this going?
> 
> Sakari, if there's a concern taking patches 3/6 to 6/6 in the media
> tree, could you merge 1/6 and 2/6 ? If they can still be included in a
> pull request for v6.2, I'll work on getting the dts changes in v6.3
> through their respective trees.

I think I was expecting v4 from you. But I can address the comments, too,
they were minor matters.

For applying the DTS patches I'd like to have ack from respective
treemaintainers it's fine to take these through the media tree.

-- 
Kind regards,

Sakari Ailus
