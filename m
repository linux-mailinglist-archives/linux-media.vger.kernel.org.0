Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90EAF1B7865
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2020 16:35:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727840AbgDXOfM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Apr 2020 10:35:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726946AbgDXOfM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Apr 2020 10:35:12 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0D61C09B045;
        Fri, 24 Apr 2020 07:35:11 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 5159B2A2DEF
Message-ID: <ad0310d6618cd8cd8a88c0eaf27ae83432a61344.camel@collabora.com>
Subject: Re: [PATCH v2 3/4] media: rockchip: rga: Add support for the PX30
 compatible
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hansverk@cisco.com>,
        justin.swartz@risingedge.co.za, Johan Jonker <jbx6244@gmail.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date:   Fri, 24 Apr 2020 11:34:59 -0300
In-Reply-To: <20200424135552.GI610776@aptenodytes>
References: <20200423200937.1039257-1-paul.kocialkowski@bootlin.com>
         <20200423200937.1039257-4-paul.kocialkowski@bootlin.com>
         <cf31ae67792aedf60ee4cf8002861edadc305314.camel@collabora.com>
         <20200424135552.GI610776@aptenodytes>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 2020-04-24 at 15:55 +0200, Paul Kocialkowski wrote:
> Hi Ezequiel,
> 
> On Fri 24 Apr 20, 09:54, Ezequiel Garcia wrote:
> > Hey Paul,
> > 
> > Thanks for the patch!
> > 
> > On Thu, 2020-04-23 at 22:09 +0200, Paul Kocialkowski wrote:
> > > The PX30 SoC has a RGA block, so add the associated compatible to
> > > support it.
> > > 
> > > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > ---
> > >  drivers/media/platform/rockchip/rga/rga.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
> > > index 9d122429706e..4fb4615662b7 100644
> > > --- a/drivers/media/platform/rockchip/rga/rga.c
> > > +++ b/drivers/media/platform/rockchip/rga/rga.c
> > > @@ -955,6 +955,9 @@ static const struct dev_pm_ops rga_pm = {
> > >  };
> > >  
> > >  static const struct of_device_id rockchip_rga_match[] = {
> > > +	{
> > > +		.compatible = "rockchip,px30-rga",
> > > +	},
> > 
> > Please note that if you don't have anything px30-specific,
> > then you don't need the compatible in the driver.
> > 
> > You can have something like:
> > 
> > compatible = "rockchip,px30-rga", "rockchip,rk3288-rga"
> > 
> > so you need to add it to the bindings. See Justin Swartz
> > recent patches for rk3228.
> 
> Thanks for the instruction!
> 
> I've been a bit confused about that because RK3399 has its own compatible
> (without a 2nd rk3288 compatible) although there's nothing different with it
> either. All of these rockchip platforms come with what they call "RGA2", that
> seems to have no variation across platforms (downstream rockchip even has a
> single compatible for it).
> 

Yep, and that's an anti pattern, so you can expect to see that elsewhere.

> Should we add the rk3288 compatible to the rk3399 dtsi? I guess we
> can't remove it from the driver at this point, for backward compatibility
> with previous dts (what a strange idea...).
> 

No, we don't necesarily need/have to do anything with rk3399,
not sure if there's any gain at this point.

> > Down the road, if you find something specific for px30,
> > you can make the driver aware. 
> 
> Makes sense, yes.
> 

Cool.

Thanks,
Ezequiel

