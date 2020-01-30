Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C0A114DAB5
	for <lists+linux-media@lfdr.de>; Thu, 30 Jan 2020 13:36:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727256AbgA3MgN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jan 2020 07:36:13 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36453 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727135AbgA3MgM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jan 2020 07:36:12 -0500
Received: by mail-wr1-f65.google.com with SMTP id z3so3866426wru.3;
        Thu, 30 Jan 2020 04:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=u6nSjsMYb9mrcDsoqtMXit9NsMnfMu+m0I8SCB6YcNM=;
        b=YgcT8HkiW8OhP1L3/QLV7ONg4yzO9IjZsGC8ZTEKRxioEbzTOZpiNUuE2tYE8F2vMi
         pPqFqhdiq0qf5OwJREKxlmO9kURzlo/oCe3+phAhv/PVAlTr54N4ssYjDHYheAhM1E8S
         KR1oG+fg4d6DEoIt9n3GBf3K1SJgpkDgKICpJM55zQF/An+OzrVH3nYdkVtYweqrkFxi
         pdSQlLla2uObIqbgndJxbKwp/8wOTSBEdrBoY7boSsWVpu2POsfuYu52in6JV0s1DTf7
         NpNXNz7YgL+/1yl7q9RrRmxcw1hwgxr/l59Qp2N5diSDeqZAlf3+ZGamZa5laqxWLOEy
         xdoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=u6nSjsMYb9mrcDsoqtMXit9NsMnfMu+m0I8SCB6YcNM=;
        b=KzGHre/q7GChxbVGQNVZhzoFKk2KeKHNVOpuq55UYMhe9GJ0tNJwfhRycV2Umw3G0K
         m37NnibSdRZx+q0SXj1O4+w6sd52bZY7O3JQsaSWnbnBlMCoHichjMpkd2oStVjqtARE
         1iB1K9IFWvx7w2GYPLde4WM6ukV5sxjrhczM4GJPBCwZrgA+I9mHzRkDHDlaq89zsQn8
         u0yhX6CqtUFB4Uh36E5AP/QftnP4Y6gagTI2+Ec5eLNzEhaTSNW/iV34K+ZE6q43M4Wi
         C3uYLtj0YYUIHOVhwz+HAY26q8jIUnYqMMY3y8b14+w0c1tamfrGPNsiKwP8V8jGxFGx
         jhoQ==
X-Gm-Message-State: APjAAAUspz69Kf3shL/Io3Gd51Hr4npVtJhii/dXpd3YNyeqoB3Nsdpb
        ux9EzfLsu75UA0I+2y2xzQCNugw+
X-Google-Smtp-Source: APXvYqw4gx0vnmleR9g2u3lZHvFT/D+TfQZdoNBXXAjWa88xP1QwbOk39QjU1kzsoNUgvaabMu9ZMQ==
X-Received: by 2002:adf:ce87:: with SMTP id r7mr5356522wrn.245.1580387769954;
        Thu, 30 Jan 2020 04:36:09 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id e16sm7156233wro.67.2020.01.30.04.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2020 04:36:08 -0800 (PST)
Date:   Thu, 30 Jan 2020 13:36:07 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: Re: [RFC PATCH v1 5/5] arm64: tegra: Add Tegra VI CSI suppport
 in device tree
Message-ID: <20200130123607.GB2584455@ulmo>
References: <1580235801-4129-1-git-send-email-skomatineni@nvidia.com>
 <1580235801-4129-6-git-send-email-skomatineni@nvidia.com>
 <20200129094624.GD2479935@ulmo>
 <bd18711d-ce23-cbee-7824-37a8c78908e6@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="/WwmFnJnmDyWGHa4"
Content-Disposition: inline
In-Reply-To: <bd18711d-ce23-cbee-7824-37a8c78908e6@nvidia.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--/WwmFnJnmDyWGHa4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29, 2020 at 08:22:48AM -0800, Sowjanya Komatineni wrote:
>=20
> On 1/29/20 1:46 AM, Thierry Reding wrote:
> > On Tue, Jan 28, 2020 at 10:23:21AM -0800, Sowjanya Komatineni wrote:
> > > Tegra210 contains VI controller for video input capture from MIPI
> > > CSI camera sensors and also supports built-in test pattern generator.
> > >=20
> > > CSI ports can be one-to-one mapped to VI channels for capturing from
> > > an external sensor or from built-in test pattern generator.
> > >=20
> > > This patch adds support for VI and CSI and enables them in Tegra210
> > > device tree.
> > >=20
> > > Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> > > ---
> > >   arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi |  8 +++++++
> > >   arch/arm64/boot/dts/nvidia/tegra210.dtsi       | 31 +++++++++++++++=
++++++++++-
> > >   2 files changed, 38 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/ar=
m64/boot/dts/nvidia/tegra210-p2597.dtsi
> > > index b0095072bc28..ec1b3033fa03 100644
> > > --- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
> > > +++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
> > > @@ -10,6 +10,14 @@
> > >   			status =3D "okay";
> > >   		};
> > > +		vi@54080000 {
> > > +			status =3D "okay";
> > > +		};
> > > +
> > > +		csi@0x54080838 {
> > > +			status =3D "okay";
> > > +		};
> > > +
> > >   		sor@54580000 {
> > >   			status =3D "okay";
> > > diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/bo=
ot/dts/nvidia/tegra210.dtsi
> > > index 48c63256ba7f..c6107ec03ad1 100644
> > > --- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> > > +++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> > > @@ -136,9 +136,38 @@
> > >   		vi@54080000 {
> > >   			compatible =3D "nvidia,tegra210-vi";
> > > -			reg =3D <0x0 0x54080000 0x0 0x00040000>;
> > > +			reg =3D <0x0 0x54080000 0x0 0x808>;
> > >   			interrupts =3D <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
> > >   			status =3D "disabled";
> > > +			assigned-clocks =3D <&tegra_car TEGRA210_CLK_VI>;
> > > +			assigned-clock-parents =3D <&tegra_car TEGRA210_CLK_PLL_C4_OUT0>;
> > > +
> > > +			clocks =3D <&tegra_car TEGRA210_CLK_VI>;
> > > +			clock-names =3D "vi";
> > > +			resets =3D <&tegra_car 20>;
> > > +			reset-names =3D "vi";
> > > +		};
> > > +
> > > +		csi@0x54080838 {
> > > +			compatible =3D "nvidia,tegra210-csi";
> > > +			reg =3D <0x0 0x54080838 0x0 0x2000>;
> > > +			status =3D "disabled";
> > > +			assigned-clocks =3D <&tegra_car TEGRA210_CLK_CILAB>,
> > > +					  <&tegra_car TEGRA210_CLK_CILCD>,
> > > +					  <&tegra_car TEGRA210_CLK_CILE>;
> > > +			assigned-clock-parents =3D <&tegra_car TEGRA210_CLK_PLL_P>,
> > > +						 <&tegra_car TEGRA210_CLK_PLL_P>,
> > > +						 <&tegra_car TEGRA210_CLK_PLL_P>;
> > > +			assigned-clock-rates =3D <102000000>,
> > > +					       <102000000>,
> > > +					       <102000000>;
> > > +
> > > +			clocks =3D <&tegra_car TEGRA210_CLK_CSI>,
> > > +				 <&tegra_car TEGRA210_CLK_CILAB>,
> > > +				 <&tegra_car TEGRA210_CLK_CILCD>,
> > > +				 <&tegra_car TEGRA210_CLK_CILE>;
> > > +			clock-names =3D "csi", "cilab", "cilcd", "cile";
> > > +
> > >   		};
> > Can this be a child of the vi node? Looking at the register ranges it
> > seems like these are actually a single IP block. If they have separate
> > blocks with clearly separate functionality, then it makes sense to have
> > CSI be a child node of VI, though it may also be okay to merge both and
> > have a single node with the driver doing all of the differentiation
> > between what's VI and what's CSI.
> >=20
> > Looking at later chips, the split between VI and CSI is more explicit,
> > so having the split in DT for Tegra210 may make sense for consistency.
> >=20
> > I know we've discussed this before, but for some reason I keep coming
> > back to this. I'll go through the other patches to see if I can get a
> > clearer picture of how this could all work together.
> >=20
> > Thierry
>=20
> We can keep it separate as we discussed.
>=20
> But as Tegra186 onwards, CSI is separate device to be all cosistent I kept
> CSI as separate node for Tegra210 as well.

=46rom our discussion, my understanding was that CSI would be a separate
device, but it would still be a subdevice of VI. The address offset of
the CSI registers not being aligned to a power of two is a strong
indication that this is really all part of the same block.

Looking at this again, I'm having second thoughts about even that
suggestion. It wouldn't be technically wrong to have an additional
subdevice for CSI, but I don't think it's really necessary.

Now, given that the DT part is going to be somewhat crucial because it
will be ABI once merged, I'd like to make sure we're not painting
ourselves into a corner. Could you post a few examples of how this
currently looks? In addition to this TPG-only example, do you have a
variant of what it looks with the current proposal? I can only find an
example of the CSI-as-subdevice-of-VI that we had discussed earlier.

Thierry

--/WwmFnJnmDyWGHa4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4yzbUACgkQ3SOs138+
s6FhFg/9F8psnyuKW3fE7vbe03ixbQo6NLijNej/rSez8byieqCo6vLkrK1xwDs6
OCy5s984O5epGdyuWNE06EY8lKVR8/nCM6ZztTBVct7qECMe29aDUqCLldSszTMy
/4kSsR1zWzTUnV9Uk3NNFcxRf/ZkQqgRDNSPJnqphwwJ0Og9iVSpgdigXph09wGb
YnAiJNMpDBr2phHGVfYAvXyy+V/6DWls5D9ME8k/Yxq275k+OzDhuNQ2K8GVTbFA
iL0CUY7bv6eEcRs/E4xxXIxeqJ+irYWGDX/KgA1VTjJMqla89MiVT1RJGy3zf9Fh
t153fTNON0ga6r51UpTFY4OM6W0O1X0Q6qQrKc+KtbD6/8I2NC8t20x51pqR2Irw
dhLckko4woaD/WynyeC15SwUfi8Tj52/TIEwa/nr0540Z+j0zPSrxQMRdbrhUIiL
wtbaF1r3Kcq+RkTsDSwGd2y/yShmvPkV1Rpn60+OwKMWs1gVG57LXTRBviqhN5YN
4R1S94GJxE5cJoBvcFVEGlmXa3H+pCs9w0e/DNGVn/zJcvnEYbLpSCWP5lD4C8H3
s809Ixy33n4yK31rY7lPQRmTANov/axo4bws/80UUHGVPvAHqpKYdJ3rvFzHzmQU
LSf+0DqunU7xjBKyliPvdKHWUSUiMmgGjAKaLn4KpdLq2gOM6rA=
=Yq0U
-----END PGP SIGNATURE-----

--/WwmFnJnmDyWGHa4--
