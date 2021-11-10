Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2232544C4C4
	for <lists+linux-media@lfdr.de>; Wed, 10 Nov 2021 17:01:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232002AbhKJQEZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Nov 2021 11:04:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231795AbhKJQEY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Nov 2021 11:04:24 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4F75C061766
        for <linux-media@vger.kernel.org>; Wed, 10 Nov 2021 08:01:36 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id p16so7164139lfa.2
        for <linux-media@vger.kernel.org>; Wed, 10 Nov 2021 08:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=wibWDxYwBQXD/Fufok7R2wldSeiCyjELusSq7rGOsxA=;
        b=CFof9sA6KDx3j0wtmViLOrnQyYP3IXa/NqswqzdYWzHLnEOY+xhLjkKwP3ab4mmDDr
         YAtVNFTSvMOVTfFvtyyL65W/iteJcTyhYsQhrF5ktFmKY6dFhYbXfO37RV+gjx72/8Lt
         81+Cxs5i3/mebtWl//wQJmVkN2M5ozuG4L3MR+AUX6zZyTiQzjXhpm52lUK8YQsttjN8
         sK877rFzb37q3oSvP7KIde8ii7msn1pJtdIc0n1YCAg6x9fs3RwqLpFHU2x5/Uk3GVEt
         OSLJDhOtMuIfA5OoPyk/ebaGZDFaInoT05uoAAvh60l5BroeKdiIb3glgcI1SUcLZYvK
         cyLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=wibWDxYwBQXD/Fufok7R2wldSeiCyjELusSq7rGOsxA=;
        b=51Q9e/lYMefYLUvHl0xOyw6mJXv2lojWC07cDGE2DJG5tbqO933hZAkcHFHZJQFpWU
         tsvWom+oUn/2+jqBRaxoL8ieEmz3c9JcCjbk4n5e1WA8qxrQLev1HFKE5wcQ4D4QpdUK
         11r7t/1xFx9zkz8+CY94kKxzz1AEfQPvc9TE6s2VhYRTG08R1PVn3BjOySBg8EoE6/xj
         WjbdfKVxjssEraAv7AYI2OJy6w0uHxbz7HGxqRTI3SsnVGRBUIW+rNrcdC2BHz533IGn
         mrxxCyZePnBELhrmeEwTWA9DW64CzqZgU4ac1t2feFI9REmHruCroXkY/jPjLmO2cqFB
         Tnxw==
X-Gm-Message-State: AOAM532y/3aTE64LJvjvACVZEFLwMHJHIX7Oh1dJUBo2BlUBgKnb81KO
        8eG8qai2IBamclNZ+rA2d/D78g==
X-Google-Smtp-Source: ABdhPJxDICcrPkR8UwlImZ6/H3cpzalTYQMvB9sdGWASjS1vU8HSbjlequsHqIv3mg82jWZc0TzQ5w==
X-Received: by 2002:a05:6512:449:: with SMTP id y9mr108875lfk.609.1636560093237;
        Wed, 10 Nov 2021 08:01:33 -0800 (PST)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id v19sm29431lfg.160.2021.11.10.08.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 08:01:32 -0800 (PST)
Date:   Wed, 10 Nov 2021 17:01:31 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/3] media: rcar-{csi2,vin}: Move to full Virtual Channel
 routing per CSI-2 IP
Message-ID: <YYvs20DbCoz5qY2S@oden.dyn.berto.se>
References: <20211020200225.1956048-1-niklas.soderlund+renesas@ragnatech.se>
 <YYvkglOfUwlsobAV@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YYvkglOfUwlsobAV@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 2021-11-10 17:25:54 +0200, Laurent Pinchart wrote:
> Hi Niklas,
> 
> On Wed, Oct 20, 2021 at 10:02:22PM +0200, Niklas Söderlund wrote:
> > Hello,
> > 
> > This series attempts to increase the flexibility of the R-Car VIN 
> > capture pipeline by allowing for free form Virtual Channel routing 
> > within the same CSI-2 IP block.
> > 
> > When Gen3 support was first added to this R-Car VIN and CSI-2 driver the
> > routing was centred around the CHSEL register which multiplex the
> > different parallel buses that sits between the CSI-2 receivers source
> > side and the VIN dma engines. This was a bad design as the multiplexing
> > do allow for only a few combinations and do not play nice with many
> > video streams in the system.
> > 
> > For example it's only possible for CSI-2 Virtual Channels 0 and 1 of any
> > given CSI-2 receiver to be used together with the scaler.
> > 
> > Later datasheets have expanded the documentation and it is now possible
> > to improve on this design by allowing any Virtual Channel to be routed
> > to any R-Car VIN instance, provided that there exists a parallel bus
> > between them. This increases the flexibility as all Virtual Channels can
> > now be used together with the scaler for example.
> > 
> > The redesign is not however perfect. While the new design allows for
> > many more routes, two constrains limit a small portion of routes that
> > was possible in the old design but are no more.
> > 
> > - It is no longer possible to route the same CSI-2 and VC to more then
> > one VIN at a time. This was theoretically possible before if the
> > specific SoC allowed for the same CSI-2 and VC to be routed to two
> > different VIN capture groups.
> 
> Does it mean we can't capture image data and embedded data from the same
> camera sensor in separate buffers ?

On the contrary. Without this change we can't capture any embedded data.  
With this patch we still can't capture it, unless the R-Car CSI-2 
receiver lies. But with this applied we are closer to enable meta data 
to reach user space.

> 
> > - It is no longer possible to simultaneously mix links from two CSI-2 IP
> > blocks to the same VIN capture group.
> > 
> > For example if VIN2 is capturing from CSI40 then VIN{0,1,3} must also
> > capture from CSI40. While VIN{4,5,6,7} is still free to capture from
> > any other CSI-2 IP in the system. Once all VIN{0,1,2,3} links to CSI40
> > are disabled that VIN capture group is free again to capture from any
> > other CSI-2 IP it is connected to.
> 
> What practical limitation does this bring, does it forbid any useful use
> case ?

Yes and no ;-). It limits a small set of use-cases, while enabling a 
great many more. In the old setup you are allowed to route a mix of Rx 
to Tx intermixing a few of the modules 1:1 as an exception. With this 
change you get routing n:to:n with a few exceptions.

> 
> > At the core of the redesign is greater cooperator of the R-Car VIN and
> > CSI-2 drivers in configuring the routing. The VIN driver is after this
> > change only responsible to configure the full VIN capture groups
> > parallel buses to be to a particular CSI-2 IP. While the configuration
> > of which CSI-2 Virtual Channel is outputted on which of the R-Car CSI-2
> > IP output ports is handled by the CSI-2 driver.
> > 
> > Before this change the CSI-2 Virtual Channel to output port was static
> > in the CSI-2 driver and the different links only manipulated the VIN
> > capture groups CHSEL register. With this change both the CHSEl register
> > and the CSI-2 routing VCDT registers are modified for greater
> > flexibility.
> > 
> > Patch 1/3 and 2/3 are cleanup patches moving code around preparing for 
> > the real work in 3/3. The work is based on the latest media-tree.
> > 
> > Kind Regards,
> > Niklas Söderlund
> > 
> > Niklas Söderlund (3):
> >   media: rcar-vin: Refactor link notify
> >   media: rcar-vin: Breakout media link creation
> >   media: rcar-{csi2,vin}: Move to full Virtual Channel routing per CSI-2
> >     IP
> > 
> >  drivers/media/platform/rcar-vin/rcar-core.c | 379 ++++++--------------
> >  drivers/media/platform/rcar-vin/rcar-csi2.c |  58 ++-
> >  drivers/media/platform/rcar-vin/rcar-dma.c  |   2 +-
> >  drivers/media/platform/rcar-vin/rcar-vin.h  |  18 +-
> >  4 files changed, 167 insertions(+), 290 deletions(-)
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Kind Regards,
Niklas Söderlund
