Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F8E545FFE0
	for <lists+linux-media@lfdr.de>; Sat, 27 Nov 2021 16:32:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351558AbhK0Pfg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Nov 2021 10:35:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345734AbhK0Pdf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Nov 2021 10:33:35 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FD2AC061746
        for <linux-media@vger.kernel.org>; Sat, 27 Nov 2021 07:30:21 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id o13so25473269wrs.12
        for <linux-media@vger.kernel.org>; Sat, 27 Nov 2021 07:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=/ZqNS2/d5HEPbwhRFYwQ90FsPz3QwiVzWwJw3fPcrHI=;
        b=M7F2jtwnYy43NZy9RyVkbtFocw08LeSeZjBTKU10gvqicCDgGM2+/51GakgEY09Eoz
         uC/GVasF4+UazQiFiCHAl6s5rpDbr+ykdJJoXDqgA2b2ztVXKPvzy0ukcVM6xrc+3Ybc
         ghqty1clqSsjAYAc2Ngcsu8PtW/9d2DsR5+cgZE1lOWbFJNN+kXULC1Ii0u57F1sgVRq
         PAUlU+CgTatIAqYLG6Ehyia1SJwATYsgZ0jmM3Ctf9P6SQ5CAR96H43kcPapBaqsA0W7
         g5O+y+awldV5WLdK5lIKD0Dk+Y+h/mCe5CKCWQxFLi1G+Af3sYKFxVCSp0jMCSktqjMv
         +P0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=/ZqNS2/d5HEPbwhRFYwQ90FsPz3QwiVzWwJw3fPcrHI=;
        b=T0rxvSC2n663jGehlg+4LEjVNBzYBaC8uW7JY0YM5inwzdvv3FXi83bpZmEiR+7194
         Mqe/X8BIcwJQNinxvP2VOiIVJl1VzmzLXGmZb4ctrfzHDblq0ADMAwhVtKJ+WtAf5T0j
         ek+vX7jlLkWny+rYrHqdiuPmX3JMUabIig0pvZHw+LAjZX4y2MqOgNJtQvaGikesljL2
         xZ5HAGQRaSLhdykeolUYUS4Vs6TWpc89guQVo+hxvZJr1jYIBo5rSy/RluZsRXeJofxv
         f9FkuCWzh/cLXYV9xu2+1tBSXQwJeGLuW9RPb2wXpsY7amBQ5fWqioHEv9cx+SxzPYBO
         84Gg==
X-Gm-Message-State: AOAM532OzZG5CV5BhlGQOKqagihLsAlFqL3ZXeLYGKR9d/s/BfBRSmkG
        coKJGiz/gaqGFeqyrZ/vyRlh1Q==
X-Google-Smtp-Source: ABdhPJxy/SgmCsNQYjcyXxrIRYhu+6W73WeUVzgSC1JpIpPF/h9pmgZ7hET3915SBsM6M8TD9PiqBg==
X-Received: by 2002:a05:6000:1548:: with SMTP id 8mr21184741wry.279.1638027019603;
        Sat, 27 Nov 2021 07:30:19 -0800 (PST)
Received: from localhost (p54ac5892.dip0.t-ipconnect.de. [84.172.88.146])
        by smtp.gmail.com with ESMTPSA id z11sm8752376wrt.58.2021.11.27.07.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Nov 2021 07:30:19 -0800 (PST)
Date:   Sat, 27 Nov 2021 16:30:18 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/3] media: rcar-{csi2,vin}: Move to full Virtual Channel
 routing per CSI-2 IP
Message-ID: <YaJPCt6nnTsCcfdU@bismarck.dyn.berto.se>
References: <20211020200225.1956048-1-niklas.soderlund+renesas@ragnatech.se>
 <YYvkglOfUwlsobAV@pendragon.ideasonboard.com>
 <YYvs20DbCoz5qY2S@oden.dyn.berto.se>
 <YYv54ItUXuG2sLjZ@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YYv54ItUXuG2sLjZ@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 2021-11-10 18:57:04 +0200, Laurent Pinchart wrote:
> On Wed, Nov 10, 2021 at 05:01:31PM +0100, Niklas Söderlund wrote:
> > Hi Laurent,
> > 
> > On 2021-11-10 17:25:54 +0200, Laurent Pinchart wrote:
> > > Hi Niklas,
> > > 
> > > On Wed, Oct 20, 2021 at 10:02:22PM +0200, Niklas Söderlund wrote:
> > > > Hello,
> > > > 
> > > > This series attempts to increase the flexibility of the R-Car VIN 
> > > > capture pipeline by allowing for free form Virtual Channel routing 
> > > > within the same CSI-2 IP block.
> > > > 
> > > > When Gen3 support was first added to this R-Car VIN and CSI-2 driver the
> > > > routing was centred around the CHSEL register which multiplex the
> > > > different parallel buses that sits between the CSI-2 receivers source
> > > > side and the VIN dma engines. This was a bad design as the multiplexing
> > > > do allow for only a few combinations and do not play nice with many
> > > > video streams in the system.
> > > > 
> > > > For example it's only possible for CSI-2 Virtual Channels 0 and 1 of any
> > > > given CSI-2 receiver to be used together with the scaler.
> > > > 
> > > > Later datasheets have expanded the documentation and it is now possible
> > > > to improve on this design by allowing any Virtual Channel to be routed
> > > > to any R-Car VIN instance, provided that there exists a parallel bus
> > > > between them. This increases the flexibility as all Virtual Channels can
> > > > now be used together with the scaler for example.
> > > > 
> > > > The redesign is not however perfect. While the new design allows for
> > > > many more routes, two constrains limit a small portion of routes that
> > > > was possible in the old design but are no more.
> > > > 
> > > > - It is no longer possible to route the same CSI-2 and VC to more then
> > > > one VIN at a time. This was theoretically possible before if the
> > > > specific SoC allowed for the same CSI-2 and VC to be routed to two
> > > > different VIN capture groups.
> > > 
> > > Does it mean we can't capture image data and embedded data from the same
> > > camera sensor in separate buffers ?
> > 
> > On the contrary. Without this change we can't capture any embedded data.  
> > With this patch we still can't capture it, unless the R-Car CSI-2 
> > receiver lies. But with this applied we are closer to enable meta data 
> > to reach user space.
> 
> How do you envision this being done ?

I'm a sure yet. My current idea floating around is to extend the R-Car 
CSI-2 subdevice with a new source pad for embedded data. This is what we 
do today with the CSI-2 subdev, one source pad for each of the 4 virtual 
channels so I think it will fit into the design quiet nicely.

> 
> > > > - It is no longer possible to simultaneously mix links from two CSI-2 IP
> > > > blocks to the same VIN capture group.
> > > > 
> > > > For example if VIN2 is capturing from CSI40 then VIN{0,1,3} must also
> > > > capture from CSI40. While VIN{4,5,6,7} is still free to capture from
> > > > any other CSI-2 IP in the system. Once all VIN{0,1,2,3} links to CSI40
> > > > are disabled that VIN capture group is free again to capture from any
> > > > other CSI-2 IP it is connected to.
> > > 
> > > What practical limitation does this bring, does it forbid any useful use
> > > case ?
> > 
> > Yes and no ;-). It limits a small set of use-cases, while enabling a 
> > great many more. In the old setup you are allowed to route a mix of Rx 
> > to Tx intermixing a few of the modules 1:1 as an exception. With this 
> > change you get routing n:to:n with a few exceptions.
> 
> That I understand, but are there any exceptions that were previously
> allowed that you think map to important use cases ?

I can't think of any important use-case we are excluding with this work.  
From the other angle we do gain an important use-case with this change, 
with this change each VC will be able to use the scaler (once that work 
is merged upstream). This is a use-case we can't support today.

> 
> > > > At the core of the redesign is greater cooperator of the R-Car VIN and
> > > > CSI-2 drivers in configuring the routing. The VIN driver is after this
> > > > change only responsible to configure the full VIN capture groups
> > > > parallel buses to be to a particular CSI-2 IP. While the configuration
> > > > of which CSI-2 Virtual Channel is outputted on which of the R-Car CSI-2
> > > > IP output ports is handled by the CSI-2 driver.
> > > > 
> > > > Before this change the CSI-2 Virtual Channel to output port was static
> > > > in the CSI-2 driver and the different links only manipulated the VIN
> > > > capture groups CHSEL register. With this change both the CHSEl register
> > > > and the CSI-2 routing VCDT registers are modified for greater
> > > > flexibility.
> > > > 
> > > > Patch 1/3 and 2/3 are cleanup patches moving code around preparing for 
> > > > the real work in 3/3. The work is based on the latest media-tree.
> > > > 
> > > > Kind Regards,
> > > > Niklas Söderlund
> > > > 
> > > > Niklas Söderlund (3):
> > > >   media: rcar-vin: Refactor link notify
> > > >   media: rcar-vin: Breakout media link creation
> > > >   media: rcar-{csi2,vin}: Move to full Virtual Channel routing per CSI-2
> > > >     IP
> > > > 
> > > >  drivers/media/platform/rcar-vin/rcar-core.c | 379 ++++++--------------
> > > >  drivers/media/platform/rcar-vin/rcar-csi2.c |  58 ++-
> > > >  drivers/media/platform/rcar-vin/rcar-dma.c  |   2 +-
> > > >  drivers/media/platform/rcar-vin/rcar-vin.h  |  18 +-
> > > >  4 files changed, 167 insertions(+), 290 deletions(-)
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Kind Regards,
Niklas Söderlund
