Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02CFBCDFEA
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 13:09:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727606AbfJGLJs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 07:09:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:46064 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727317AbfJGLJr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Oct 2019 07:09:47 -0400
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B057F2064A;
        Mon,  7 Oct 2019 11:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570446586;
        bh=qK2QnTNew50AovHrktWG22vqb06vH8d2dRbYgAAQCck=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YRL+/JhPnB4qVpA6HNY/kO/onyRZoyQUo6y48Vk/2jeWPf9aW07lT1dPoFmRALoTk
         jtpipKR639mlvD3ZOlEw6dsFBm9u6CBHutUtup+0iD5WXZe3FiYsfJjAfQabBafI3a
         vGp+D5A2ZGAn6k/TMSDLoK1EMyPthVSEhE4GJ1+0=
Date:   Mon, 7 Oct 2019 13:09:43 +0200
From:   Maxime Ripard <mripard@kernel.org>
To:     Chen-Yu Tsai <wens@csie.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/2] dt-bindings: media: sun4i-csi: Drop the module clock
Message-ID: <20191007110943.lyz3nep7udr6weu3@gilmour>
References: <20191003154842.248763-1-mripard@kernel.org>
 <CAGb2v66az3uQnibudKai7ATfXh+w1Y+bJ=o258RVe9SCNRpGNQ@mail.gmail.com>
 <20191003163754.26ciq2ljcbuuvcrx@gilmour>
 <CAGb2v66WOZZj15GkARRzCTsSRhZi_6aEFK4w+O+aGmYwvVYGdw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gfwbyrumehvh2ot3"
Content-Disposition: inline
In-Reply-To: <CAGb2v66WOZZj15GkARRzCTsSRhZi_6aEFK4w+O+aGmYwvVYGdw@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--gfwbyrumehvh2ot3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Fri, Oct 04, 2019 at 02:33:41PM +0800, Chen-Yu Tsai wrote:
> On Fri, Oct 4, 2019 at 12:37 AM Maxime Ripard <mripard@kernel.org> wrote:
> > On Thu, Oct 03, 2019 at 11:51:05PM +0800, Chen-Yu Tsai wrote:
> > > On Thu, Oct 3, 2019 at 11:48 PM Maxime Ripard <mripard@kernel.org> wrote:
> > > >
> > > > It turns out that what was thought to be the module clock was actually the
> > > > clock meant to be used by the sensor, and isn't playing any role with the
> > > > CSI controller itself. Let's drop that clock from our binding.
> > > >
> > > > Fixes: c5e8f4ccd775 ("media: dt-bindings: media: Add Allwinner A10 CSI binding")
> > > > Reported-by: Chen-Yu Tsai <wens@csie.org>
> > > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > > ---
> > > >  .../devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml | 7 ++-----
> > > >  1 file changed, 2 insertions(+), 5 deletions(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
> > > > index 5dd1cf490cd9..d3e423fcb6c2 100644
> > > > --- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
> > > > +++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
> > > > @@ -27,14 +27,12 @@ properties:
> > > >    clocks:
> > > >      items:
> > > >        - description: The CSI interface clock
> > > > -      - description: The CSI module clock
> > > >        - description: The CSI ISP clock
> > > >        - description: The CSI DRAM clock
> > > >
> > > >    clock-names:
> > > >      items:
> > > >        - const: bus
> > > > -      - const: mod
> > > >        - const: isp
> > > >        - const: ram
> > > >
> > > > @@ -89,9 +87,8 @@ examples:
> > > >          compatible = "allwinner,sun7i-a20-csi0";
> > > >          reg = <0x01c09000 0x1000>;
> > > >          interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
> > > > -        clocks = <&ccu CLK_AHB_CSI0>, <&ccu CLK_CSI0>,
> > > > -                 <&ccu CLK_CSI_SCLK>, <&ccu CLK_DRAM_CSI0>;
> > > > -        clock-names = "bus", "mod", "isp", "ram";
> > > > +        clocks = <&ccu CLK_AHB_CSI0>, <&ccu CLK_CSI_SCLK>, <&ccu CLK_DRAM_CSI0>;
> > > > +        clock-names = "bus", "isp", "ram";
> > >
> > > I believe what we thought was the ISP clock is actually the module clock
> > > for the whole CSI subsystem. So we should still use the module clock entry,
> > > and remove the ISP entry.
> >
> > I'm really not sure it is. CSI1 on the A20 (possibly the A10 as well,
> > I haven't checked), and the one on the A13 don't have any ISP embedded
> > in the CSI controller.
> >
> > It makes some difference, because according to the BSP, you can see
> > that the ISP clock is taken for CSI0:
> > https://github.com/linux-sunxi/linux-sunxi/blob/sunxi-3.4/drivers/media/video/sun4i_csi/csi0/sun4i_drv_csi.c#L389
> >
> > While for CSI1, that block is commented out, and the ISP clock never
> > used:
> > https://github.com/linux-sunxi/linux-sunxi/blob/sunxi-3.4/drivers/media/video/sun4i_csi/csi1/sun4i_drv_csi.c#L396
> >
> > So I really believe that the ISP clock is here to feed the ISP block
> > within the CSI controller if there's any. But it's far from always the
> > case, as opposed to a module clock for the whole CSI controller that
> > would be here in both cases.
>
> I guess we should try to test this with CSI1 one, either on a Cubieboard
> or OlinuXino with a simple camera like the OV7670?
>
> Do you have any hardware on hand for this? I have the Cubieboard but I
> need to get some proper 2.0mm connector blocks.

I've tested it with the A13 before, and it doesn't need the ISP clock

Maxime

--gfwbyrumehvh2ot3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXZsc9wAKCRDj7w1vZxhR
xe8bAP4y7gE06QSkjyJMfN/E+73ErbKG/ywgEMhdUOldFR1BCgEAp0po3XMHrAbf
6U/EwEK0FrUyTP67CkGvDLUqK++uww8=
=Baec
-----END PGP SIGNATURE-----

--gfwbyrumehvh2ot3--
