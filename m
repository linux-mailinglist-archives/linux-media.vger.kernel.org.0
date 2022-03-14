Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71DCB4D7B48
	for <lists+linux-media@lfdr.de>; Mon, 14 Mar 2022 08:09:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236516AbiCNHKX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Mar 2022 03:10:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229977AbiCNHKW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Mar 2022 03:10:22 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FE174091B
        for <linux-media@vger.kernel.org>; Mon, 14 Mar 2022 00:09:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BE3FCB80D38
        for <linux-media@vger.kernel.org>; Mon, 14 Mar 2022 07:09:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A03CC340EE;
        Mon, 14 Mar 2022 07:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647241750;
        bh=f/Y7oPlLBfeIpd4oHNPHWbCWiYfGD2KqN1ZGu91fkP4=;
        h=Date:From:To:Subject:In-Reply-To:References:From;
        b=TRnl0hPjwU9wYrBhF21CaMG/aDgdFoGoRnGcCiH4IYR5yqog/hmpZWYDlXIIkgsXi
         PmZdp2kx+P2KlnF/eWwC371VTzJtLw4mhSuZ4CMNHkUpcmUniQcCH7w+y6kFx/YxKv
         hN28vGofyW7MxqprgmkbSeEoaUKa8JSQBzhFEe6GCKTqsGcuUrI4sbdajo3jOJe9DV
         SzAXdp6lRscEN4OYqrM8erZvKqxlLoYGjs6xBOBdmLt4oh5eElbImkn/nw0p6k9Zhs
         QtJDdJbi/WLqEC3o6Yv1Ib3e90ZyjC09sz2JD3+f9XgLpetnHzFJ8s67DmOSAAJxjt
         iCQJjyP+WL3Jg==
Date:   Mon, 14 Mar 2022 08:09:06 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3 10/39] media: platform: place Renesas drivers on a
 separate dir
Message-ID: <20220314080906.6d9381ce@coco.lan>
In-Reply-To: <Yi3k3wD5IBhT/VQR@pendragon.ideasonboard.com>
References: <cover.1647155572.git.mchehab@kernel.org>
        <8f9726e9df5f4fb1df17aebc30b0fee07c2ca44a.1647155572.git.mchehab@kernel.org>
        <Yi3k3wD5IBhT/VQR@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-8.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sun, 13 Mar 2022 14:34:39 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> Hi Mauro,
> 
> Thank you for the patch.
> 
> On Sun, Mar 13, 2022 at 08:21:19AM +0100, Mauro Carvalho Chehab wrote:
> > In order to cleanup the main platform media directory, move Renesas
> > driver to its own directory.
> > 

...

> > +config VIDEO_RENESAS_FCP
> > +	tristate "Renesas Frame Compression Processor"
> > +	depends on V4L_MEM2MEM_DRIVERS
> > +	depends on ARCH_RENESAS || COMPILE_TEST
> > +	depends on OF
> > +	help
> > +	  This is a driver for the Renesas Frame Compression Processor (FCP).
> > +	  The FCP is a companion module of video processing modules in the
> > +	  Renesas R-Car Gen3 and RZ/G2 SoCs. It handles memory access for
> > +	  the codec, VSP and FDP modules.
> > +
> > +	  To compile this driver as a module, choose M here: the module
> > +	  will be called rcar-fcp.  
> 
> This should go before FDP1.

I'll do the reorder on the next version as proposed by you.

FYI, I opted to not sort the manufacturer's Kconfig files on this series
by purpose. After those patch series, the per-vendor Kconfig menus
have only a few drivers (up to ~10 config symbols). That makes it
a lot more manageable than what we had before. So, from my side, I don't
have any special requirements about Kconfig order.

On other words, the order inside each vendor-specific Kconfig
file should be a decision taken by the driver maintainers, which should
decide what fits better for them, considering that:

- the per-vendor driver order may not be in alphabetical order, as
  it may make sense to group drivers per type, platform and/or by
  its dependency chain;

- It is now easy to sort the per-vendor entries alphabetically,
  either per config title or per Kconfig symbol.

- Now that the main sort criteria is per-vendor, IMO it makes sense to
  have a per-vendor symbol space, e. g., instead of having:

	config VIDEO_RCAR_CSI2
	config VIDEO_RCAR_VIN
	config VIDEO_RCAR_ISP
	config VIDEO_RENESAS_CEU
	config VIDEO_SH_VOU
	config VIDEO_RENESAS_FCP
	config VIDEO_RENESAS_FDP1
	config VIDEO_RENESAS_JPU
	config VIDEO_RENESAS_VSP1
	config VIDEO_RCAR_DRIF

It could make sense to have all of them prepended with VIDEO_RENESAS:

	config VIDEO_RENESAS_CAR_CSI2
	config VIDEO_RENESAS_CAR_VIN
	config VIDEO_RENESAS_CAR_ISP
	config VIDEO_RENESAS_CEU
	config VIDEO_RENESAS_SH_VOU
	config VIDEO_RENESAS_FCP
	config VIDEO_RENESAS_FDP1
	config VIDEO_RENESAS_JPU
	config VIDEO_RENESAS_VSP1
	config VIDEO_RENESAS_CAR_DRIF

or some other variant of that, to produce smaller names, like using the
prefix adopted at the stock market (RNE, I guess): 

	config VIDEO_RNE_CAR_CSI2
	config VIDEO_RNE_CAR_VIN
	config VIDEO_RNE_CAR_ISP
	config VIDEO_RNE_CEU
	config VIDEO_RNE_SH_VOU
	config VIDEO_RNE_FCP
	config VIDEO_RNE_FDP1
	config VIDEO_RNE_JPU
	config VIDEO_RNE_VSP1
	config VIDEO_RNE_CAR_DRIF

With a change like that, a per Kconfig-symbol alphabetic order will change.

> 
> The FCP isn't a memory-to-memory device by the way, it's an ancillary
> device that handles compression of data transmitted on the bus between a
> DMA engine and memory. It's fine keeping it here, as it's related to the
> memory-to-memory devices.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks,
Mauro
