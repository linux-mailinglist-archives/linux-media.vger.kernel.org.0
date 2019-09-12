Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 998FDB1576
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2019 22:34:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727504AbfILUeb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Sep 2019 16:34:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:58014 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727387AbfILUea (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Sep 2019 16:34:30 -0400
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 822EE2081B;
        Thu, 12 Sep 2019 20:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568320470;
        bh=9zsVAQszxukXWrSERDHPeEK1oIeDsPHZ+92NCDWFApk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eKmeCfGU2SI0KmRPr2IfM8VLEvVDZaEpn6MMiadOLQg3013o1tXlxC2LpDeWpQV0h
         +7equ1jM/7hcEU3Zg0xrtDUXTWQFB08nas8ttZcLnFAyfr0YOKGQ3hzyUxxREnfDYp
         80endAJMkSLfewUaf4DV8NTpm8rVsMvuYlnGavmY=
Date:   Thu, 12 Sep 2019 22:34:27 +0200
From:   Maxime Ripard <mripard@kernel.org>
To:     Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>
Cc:     wens@csie.org, robh+dt@kernel.org, mark.rutland@arm.com,
        mchehab@kernel.org, hverkuil@xs4all.nl, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH 3/6] ARM: dts: sunxi: h3/h5: Add MBUS controller node
Message-ID: <20190912203427.ajbmtm5djctpkz6p@localhost.localdomain>
References: <20190912175132.411-1-jernej.skrabec@siol.net>
 <20190912175132.411-4-jernej.skrabec@siol.net>
 <20190912202057.czb6nzgssg442isi@localhost.localdomain>
 <1679881.yZ8pMUtPNZ@jernej-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1679881.yZ8pMUtPNZ@jernej-laptop>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 12, 2019 at 10:28:37PM +0200, Jernej =C5=A0krabec wrote:
> Dne =C4=8Detrtek, 12. september 2019 ob 22:20:57 CEST je Maxime Ripard na=
pisal(a):
> > Hi,
> >=20
> > On Thu, Sep 12, 2019 at 07:51:29PM +0200, Jernej Skrabec wrote:
> > > Both, H3 and H5, contain MBUS, which is the bus used by DMA devices to
> > > access system memory.
> > >=20
> > > MBUS controller is responsible for arbitration between channels based
> > > on set priority and can do some other things as well, like report
> > > bandwidth used. It also maps RAM region to different address than CPU.
> > >=20
> > > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > > ---
> > >=20
> > >  arch/arm/boot/dts/sunxi-h3-h5.dtsi | 9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > >=20
> > > diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> > > b/arch/arm/boot/dts/sunxi-h3-h5.dtsi index eba190b3f9de..ef1d03812636
> > > 100644
> > > --- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> > > +++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> > > @@ -109,6 +109,7 @@
> > >=20
> > >  		compatible =3D "simple-bus";
> > >  		#address-cells =3D <1>;
> > >  		#size-cells =3D <1>;
> > >=20
> > > +		dma-ranges;
> > >=20
> > >  		ranges;
> > >  	=09
> > >  		display_clocks: clock@1000000 {
> > >=20
> > > @@ -538,6 +539,14 @@
> > >=20
> > >  			};
> > >  	=09
> > >  		};
> > >=20
> > > +		mbus: dram-controller@1c62000 {
> > > +			compatible =3D "allwinner,sun8i-h3-mbus";
> > > +			reg =3D <0x01c62000 0x1000>;
> > > +			clocks =3D <&ccu 113>;
> > > +			dma-ranges =3D <0x00000000 0x40000000=20
> 0xc0000000>;
> > > +			#interconnect-cells =3D <1>;
> > > +		};
> > > +
> >=20
> > If that's easy enough to access, can you also add the references in
> > the devices that are already there? (CSI and DE comes to my mind, but
> > there might be others).
>=20
> Strangely, DE2 doesn't use this offset. That was tested on OrangePi Plus2=
E,=20
> which has 2 GiB of RAM and subtracting this offset causes corrupted image.

Ok, weird. But if it was tested then fine by me :)

> But I can add this properties to CSI too. However, wouldn't that need CSI=
 DT=20
> binding expansion with those properties? othetwise DT check will fail.

Oh right, we definitely need to update the binding indeed. The code
should be able to cope with both cases already.

Maxime
