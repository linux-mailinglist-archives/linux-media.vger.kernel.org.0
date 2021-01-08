Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80D3B2EF2E9
	for <lists+linux-media@lfdr.de>; Fri,  8 Jan 2021 14:15:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727247AbhAHNO2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 08:14:28 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:51426 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726992AbhAHNO2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jan 2021 08:14:28 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id B596C1F469E7
Message-ID: <f9a163675ae05cc77b2d527ea5d68064fbbeead9.camel@collabora.com>
Subject: Re: [PATCH 5/5] media: hantro: Add support for the Rockchip PX30
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jacob Chen <jacob-chen@iotwrt.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date:   Fri, 08 Jan 2021 10:13:36 -0300
In-Reply-To: <X/ggTOOTBhGoFDpW@aptenodytes>
References: <20210107134101.195426-1-paul.kocialkowski@bootlin.com>
         <20210107134101.195426-6-paul.kocialkowski@bootlin.com>
         <f7291b83fe39d71c3192ea58ebf71e3909bd38af.camel@collabora.com>
         <X/ggTOOTBhGoFDpW@aptenodytes>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 2021-01-08 at 10:05 +0100, Paul Kocialkowski wrote:
> Hi Ezequiel,
> 
> On Thu 07 Jan 21, 16:08, Ezequiel Garcia wrote:
> > Happy to see this patch. It was on my TODO list,
> > but I hadn't had time to bringup my rk3326 device.
> 
> Same here, I just had an occasion to use it again these days so I jumped
> on it!
> 
> > A few comments.
> > 
> > On Thu, 2021-01-07 at 14:41 +0100, Paul Kocialkowski wrote:
> > > The PX30 SoC includes both the VDPU2 and VEPU2 blocks which are similar
> > > to the RK3399 (Hantro G1/H1 with shuffled registers).
> > > 
> > > Besides taking an extra clock, it also shares an interrupt with the IOMMU
> > > so it's necessary to request the interrupt shared.
> > > 
> > 
[..]
> > > diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
> > > index 34c9e4649a25..07f516fd7a2e 100644
> > > --- a/drivers/staging/media/hantro/hantro_hw.h
> > > +++ b/drivers/staging/media/hantro/hantro_hw.h
> > > @@ -148,6 +148,7 @@ enum hantro_enc_fmt {
> > >         RK3288_VPU_ENC_FMT_UYVY422 = 3,
> > >  };
> > >  
> > > +extern const struct hantro_variant px30_vpu_variant;
> > >  extern const struct hantro_variant rk3399_vpu_variant;
> > >  extern const struct hantro_variant rk3328_vpu_variant;
> > >  extern const struct hantro_variant rk3288_vpu_variant;
> > > diff --git a/drivers/staging/media/hantro/rk3399_vpu_hw.c b/drivers/staging/media/hantro/rk3399_vpu_hw.c
> > > index 7a7962cf771e..4112f98baa60 100644
> > > --- a/drivers/staging/media/hantro/rk3399_vpu_hw.c
> > > +++ b/drivers/staging/media/hantro/rk3399_vpu_hw.c
> > 
> > Perhaps it's time to rename this to rockchip_vpu_hw.c,
> > and merge rk3288 and rk3399? It's a nitpick, though.
> 
> Haha, I was thinking the exact same thing but wasn't sure it would be welcome!
> 
> I was thinking of rockchip_vpu2_hw.c or rockchip_vdpu2_hw.c since that's
> apparently how it's called in Rockchip terminology: VDPU2 and VEPU2 for the
> Hantro G1 and H1 with the shuffled register layout. The rk3288 stuff is
> probably VDPU1/VEPU1 and we might want to rename it accordingly as well.
> 

I'd rather keep it simple as rockchip_vpu_hw.c and just throw in there
all the rockchip stuff.

Thanks,
Ezequiel

