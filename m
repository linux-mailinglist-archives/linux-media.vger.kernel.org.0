Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE26914E051
	for <lists+linux-media@lfdr.de>; Thu, 30 Jan 2020 18:58:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727448AbgA3R61 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jan 2020 12:58:27 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55542 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727193AbgA3R61 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jan 2020 12:58:27 -0500
Received: by mail-wm1-f68.google.com with SMTP id q9so4778324wmj.5;
        Thu, 30 Jan 2020 09:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CZXIQXVYU4MVlCICqrY50PmIWeOp4Q999l2dG/dliN4=;
        b=VP01D78RvC0qG41N7aharAzA4Rq7zhCq085KhGKpHu1oU+7LdZTciUnhCP/W1R7+Wz
         p32Wmp3ZmWvReVus+kPyF1T38WrnIutr5bHLm2qb1/Pke6gp+xu5++URqyJ/hzfdaGIJ
         vuLbI5Vq3c8lECCFJrqOcSV9eIwmDUmC8+8ZJCeBBOP5rtE3dOsIOvaLuCLkSSprlcIR
         1gjxfFYihOXcy0xRScxk4Bo9sDCu58P4vsAepevUWOBr11OmhJJW1w2UQnatF4lhowtN
         cWsjnfK2LJjXGpWwAMpW/Z4hUZu4qik1By669zV4yS2tjekzzZS7fqyDc0iQgpVdsl7U
         WFpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CZXIQXVYU4MVlCICqrY50PmIWeOp4Q999l2dG/dliN4=;
        b=aolN3BE30u6zvxvKGqhg8F2HFel7v6sRw+iyL0+XTkFMS9sANr0xA1GHlEpU+5PIMH
         8FrFDR9LBryZx/v+9w7kLCxdrI8cIYC1rr3J/Fxo8wHmjAAXUA6u99caMktTQylO/WcV
         GgC6kdDbeL+rDNW7WjR7swF0DmzPVPnNHhEO/yiR48H2W7p3ylz3tSTwr42pvDkKwP1q
         aTcH9Z5PMFQPRGvRUaxrBtlPOx70BsyrBwJLkcQkONNroghJjdq9aSNLfGu+kBqBgHmY
         U//0LfqxVIvSldiabE+eX+Ley0nIrho3uuYU6gvjiR0p1LUeWr7SmSBVnW7r4B0G3yFL
         moTQ==
X-Gm-Message-State: APjAAAX/+MRknvILnxi4g4oa8yKV3R0N/zXDyjDVXhCJnzr0LA06cXoL
        0tfEEjl/jB47qfUKLdzQnAgL0Y+s
X-Google-Smtp-Source: APXvYqz2k5viVPFsK6/0Qk2Rx2ZcQrNuxYhpEIKqwZxeZUsm/8mg45KEoMwcUgRPzURqhnJr3je89A==
X-Received: by 2002:a05:600c:20e:: with SMTP id 14mr6870327wmi.104.1580407102492;
        Thu, 30 Jan 2020 09:58:22 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id u1sm7146843wmc.5.2020.01.30.09.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2020 09:58:21 -0800 (PST)
Date:   Thu, 30 Jan 2020 18:58:20 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: Re: Re: [RFC PATCH v1 5/5] arm64: tegra: Add Tegra VI CSI
 suppport in device tree
Message-ID: <20200130175820.GA3155155@ulmo>
References: <1580235801-4129-1-git-send-email-skomatineni@nvidia.com>
 <1580235801-4129-6-git-send-email-skomatineni@nvidia.com>
 <20200129094624.GD2479935@ulmo>
 <bd18711d-ce23-cbee-7824-37a8c78908e6@nvidia.com>
 <20200130123607.GB2584455@ulmo>
 <c5fd4eb3-0026-95a5-5162-e1cf5302698e@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zYM0uCDKw75PZbzx"
Content-Disposition: inline
In-Reply-To: <c5fd4eb3-0026-95a5-5162-e1cf5302698e@nvidia.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2020 at 09:18:50AM -0800, Sowjanya Komatineni wrote:
>=20
> On 1/30/20 4:36 AM, Thierry Reding wrote:
> > On Wed, Jan 29, 2020 at 08:22:48AM -0800, Sowjanya Komatineni wrote:
> > > On 1/29/20 1:46 AM, Thierry Reding wrote:
> > > > On Tue, Jan 28, 2020 at 10:23:21AM -0800, Sowjanya Komatineni wrote:
> > > > > Tegra210 contains VI controller for video input capture from MIPI
> > > > > CSI camera sensors and also supports built-in test pattern genera=
tor.
> > > > >=20
> > > > > CSI ports can be one-to-one mapped to VI channels for capturing f=
rom
> > > > > an external sensor or from built-in test pattern generator.
> > > > >=20
> > > > > This patch adds support for VI and CSI and enables them in Tegra2=
10
> > > > > device tree.
> > > > >=20
> > > > > Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> > > > > ---
> > > > >    arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi |  8 +++++++
> > > > >    arch/arm64/boot/dts/nvidia/tegra210.dtsi       | 31 ++++++++++=
+++++++++++++++-
> > > > >    2 files changed, 38 insertions(+), 1 deletion(-)
> > > > >=20
> > > > > diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arc=
h/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
> > > > > index b0095072bc28..ec1b3033fa03 100644
> > > > > --- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
> > > > > +++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
> > > > > @@ -10,6 +10,14 @@
> > > > >    			status =3D "okay";
> > > > >    		};
> > > > > +		vi@54080000 {
> > > > > +			status =3D "okay";
> > > > > +		};
> > > > > +
> > > > > +		csi@0x54080838 {
> > > > > +			status =3D "okay";
> > > > > +		};
> > > > > +
> > > > >    		sor@54580000 {
> > > > >    			status =3D "okay";
> > > > > diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm6=
4/boot/dts/nvidia/tegra210.dtsi
> > > > > index 48c63256ba7f..c6107ec03ad1 100644
> > > > > --- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> > > > > +++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> > > > > @@ -136,9 +136,38 @@
> > > > >    		vi@54080000 {
> > > > >    			compatible =3D "nvidia,tegra210-vi";
> > > > > -			reg =3D <0x0 0x54080000 0x0 0x00040000>;
> > > > > +			reg =3D <0x0 0x54080000 0x0 0x808>;
> > > > >    			interrupts =3D <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
> > > > >    			status =3D "disabled";
> > > > > +			assigned-clocks =3D <&tegra_car TEGRA210_CLK_VI>;
> > > > > +			assigned-clock-parents =3D <&tegra_car TEGRA210_CLK_PLL_C4_OU=
T0>;
> > > > > +
> > > > > +			clocks =3D <&tegra_car TEGRA210_CLK_VI>;
> > > > > +			clock-names =3D "vi";
> > > > > +			resets =3D <&tegra_car 20>;
> > > > > +			reset-names =3D "vi";
> > > > > +		};
> > > > > +
> > > > > +		csi@0x54080838 {
> > > > > +			compatible =3D "nvidia,tegra210-csi";
> > > > > +			reg =3D <0x0 0x54080838 0x0 0x2000>;
> > > > > +			status =3D "disabled";
> > > > > +			assigned-clocks =3D <&tegra_car TEGRA210_CLK_CILAB>,
> > > > > +					  <&tegra_car TEGRA210_CLK_CILCD>,
> > > > > +					  <&tegra_car TEGRA210_CLK_CILE>;
> > > > > +			assigned-clock-parents =3D <&tegra_car TEGRA210_CLK_PLL_P>,
> > > > > +						 <&tegra_car TEGRA210_CLK_PLL_P>,
> > > > > +						 <&tegra_car TEGRA210_CLK_PLL_P>;
> > > > > +			assigned-clock-rates =3D <102000000>,
> > > > > +					       <102000000>,
> > > > > +					       <102000000>;
> > > > > +
> > > > > +			clocks =3D <&tegra_car TEGRA210_CLK_CSI>,
> > > > > +				 <&tegra_car TEGRA210_CLK_CILAB>,
> > > > > +				 <&tegra_car TEGRA210_CLK_CILCD>,
> > > > > +				 <&tegra_car TEGRA210_CLK_CILE>;
> > > > > +			clock-names =3D "csi", "cilab", "cilcd", "cile";
> > > > > +
> > > > >    		};
> > > > Can this be a child of the vi node? Looking at the register ranges =
it
> > > > seems like these are actually a single IP block. If they have separ=
ate
> > > > blocks with clearly separate functionality, then it makes sense to =
have
> > > > CSI be a child node of VI, though it may also be okay to merge both=
 and
> > > > have a single node with the driver doing all of the differentiation
> > > > between what's VI and what's CSI.
> > > >=20
> > > > Looking at later chips, the split between VI and CSI is more explic=
it,
> > > > so having the split in DT for Tegra210 may make sense for consisten=
cy.
> > > >=20
> > > > I know we've discussed this before, but for some reason I keep comi=
ng
> > > > back to this. I'll go through the other patches to see if I can get=
 a
> > > > clearer picture of how this could all work together.
> > > >=20
> > > > Thierry
> > > We can keep it separate as we discussed.
> > >=20
> > > But as Tegra186 onwards, CSI is separate device to be all cosistent I=
 kept
> > > CSI as separate node for Tegra210 as well.
> >  From our discussion, my understanding was that CSI would be a separate
> > device, but it would still be a subdevice of VI. The address offset of
> > the CSI registers not being aligned to a power of two is a strong
> > indication that this is really all part of the same block.
>=20
> Yes our earlier discussion is to have CSI as subdevice.
>=20
> Later looking into T186 and later NVCSI is totally separate so it will be
> separate device and to have driver common moved Tegra210 CSI also as
> separate device instead of having it as subdevice of VI.
>=20
> Earlier when we discussed at that time I am using TPG also from device
> graphs but not moved to hard media links inside driver for TPG.
>=20
> For this we need CSI to be available prior to VI.

Why is that? Does creating the hard media links need access to a struct
device? What if we created that device in the VI driver without any
reliance on DT? Shouldn't that also work? I have a hard time imagining
that there aren't other devices like this where we don't necessarily
have separate devices for these links.

> If we add CSI as subdevice to VI, CSI will not be available by the time
> VI init happens.

The CSI subdevice should be registered as part of the VI driver's probe,
right? That's typically where you'd call of_platform_populate(). Could
we not set up the hard media links in the ->init() callbacks for the
host1x clients? Those are called after all of the devices have been
probed, so the CSI device should be available at that time.

> Currently host1x subdevices listed has CSI before VI and CSI init happens
> earlier so by the time VI init happens CSI is available to do media links
> b/w VI video entity and CSI subdevice entity.

Okay, I understand how this would be a convenient solution. However, the
device tree is a hardware description, so we need to ignore what we know
about the operating system infrastructure that we want to use when
writing the device tree bindings (and the device tree content) in order
to make sure the same binding will work on a different operating system
which may have a completely different infrastructure (or none at all).

> Also having CSI as separate subdevice (not as subdevice to VI) for T210 w=
ill
> be consistent with T186 and later.

Again, I see how that's convenient. But the main difference between
Tegra210 and Tegra186 is that on the former, the CSI is merged with VI,
whereas on the latter the CSI is a completely separate hardware block.

Since device tree describes the hardware, that difference should be
apparent in the device tree. I initially thought as well that it would
be advantageous if both had the same representation, but I do realize
now that this has a significant impact on the device tree, and it
violates the basic principles we base device tree binding design on.

Thierry

--zYM0uCDKw75PZbzx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4zGToACgkQ3SOs138+
s6FrSA//S4hnF6LegLDj4px69095POZCKniXdjgAkBMlbI1KEeGYD0TNY/6m7Y0U
B9TXlvgURxhKD4kARgcRKOH0huPJ65nFka5Gud/zK4uQJHmxBrhP2wb1P6KVOCQq
GsNMLUarCfEmMfGAJMnsfZxR/CkA25pKvs+kwm78AKbUfqt8mBttSpLPp9Uo1Nua
drhCx64Qiih4usggc5cIxv5c4YnVG5rP5oItrW7lpc92lt7f+1e9wCIpDsv1Y+nT
L/M/zs9rY20JwQYkST1c7LXKaJUWvz34CDL1pgIUonXpfsmXTULd6UPxCtqSiS1R
LXzl4YY6paC4fd7r+FUxLw/aX5gNGeBFtbWqJFbp93w8g/hYR40SAQWTxD9BWgPe
mE21ZYZuTSz7UjX7u6XPK7jhG561rFt6lrrcrsh0R9aJVRIE6m9DEwVaWKO3icUt
R66e5zPy1JiqM0IAcp7bUjAjMuzPhidCNJ3//PQUFXGvJqO8RInQzzKg7i6KbZyc
J2ztnKAOsRMjaFiXAcshRk8Yqgr607kHnkd3cUAvZd8cuRfK+bLSLFk01Kcu61ks
7376g17I8GoofulfuYaTd7lgV0upQpkmCsnz4e4/B0KmqFYmTVsx8iJnoo69jdXF
ysgeilHCDLH4isYpGqj6jPc0sgo4g1YSHbegOIU7+Zzo0m6bW0Y=
=uJqZ
-----END PGP SIGNATURE-----

--zYM0uCDKw75PZbzx--
