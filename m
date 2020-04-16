Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EAEC1AC525
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 16:14:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438215AbgDPOMP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 10:12:15 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:46015 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407224AbgDPOML (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 10:12:11 -0400
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 7DB971C001E;
        Thu, 16 Apr 2020 14:12:05 +0000 (UTC)
Date:   Thu, 16 Apr 2020 16:12:05 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Jacob Chen <jacob-chen@iotwrt.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hansverk@cisco.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 2/4] arm64: dts: rockchip: Add RGA support to the PX30
Message-ID: <20200416141205.GK125838@aptenodytes>
References: <20200416115047.233720-1-paul.kocialkowski@bootlin.com>
 <20200416115047.233720-3-paul.kocialkowski@bootlin.com>
 <478f0a8b-f819-62f4-83b8-27918c4c2431@gmail.com>
 <20200416132442.GI125838@aptenodytes>
 <f4ad8ea4-7904-1458-e564-2d20c87ed417@gmail.com>
 <20200416135519.GJ125838@aptenodytes>
 <f97d7661-834d-3fbf-2cd9-0b37c487e8f7@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="IA03tywDYuoVKXrw"
Content-Disposition: inline
In-Reply-To: <f97d7661-834d-3fbf-2cd9-0b37c487e8f7@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--IA03tywDYuoVKXrw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 16 Apr 20, 16:02, Johan Jonker wrote:
> On 4/16/20 3:55 PM, Paul Kocialkowski wrote:
> > Hi,
> >=20
> > On Thu 16 Apr 20, 15:44, Johan Jonker wrote:
> >> On 4/16/20 3:24 PM, Paul Kocialkowski wrote:
> >>> Hi,
> >>>
> >>> On Thu 16 Apr 20, 15:02, Johan Jonker wrote:
> >>>> Hi Paul,
> >>>>
> >>>> The conversion of rockchip-rga.txt to rockchip-rga.yaml by myself ju=
st
> >>>> has been approved by robh.
> >>>
> >>> Huh, I looked around for ongoing related work but missed it.
> >>> I'll definitely rebase on top of your series and use the yaml descrip=
tion
> >>> instead. Thanks!
> >>>
> >>>> Maybe place dts patches at the end of a patch serie.
> >>>> Could you include a &rga patch if your device is supported in mainli=
ne,
> >>>> so we can test with:
> >>>> make ARCH=3Darm64 dtbs_check
> >>>> DT_SCHEMA_FILES=3DDocumentation/devicetree/bindings/media/rockchip-r=
ga.yaml
> >>>
> >>> I tested with the PX30 EVB so I can surely add a node there if that t=
urns
> >>> out necessary (see below).
> >>>
> >>>> Johan
> >>>>
> >>>> On 4/16/20 1:50 PM, Paul Kocialkowski wrote:
> >>>>> The PX30 features a RGA block: add the necessary node to support it.
> >>>>>
> >>>>> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> >>>>> ---
> >>>>>  arch/arm64/boot/dts/rockchip/px30.dtsi | 11 +++++++++++
> >>>>>  1 file changed, 11 insertions(+)
> >>>>>
> >>>>> diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/bo=
ot/dts/rockchip/px30.dtsi
> >>>>> index 75908c587511..4bfbee9d4123 100644
> >>>>> --- a/arch/arm64/boot/dts/rockchip/px30.dtsi
> >>>>> +++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
> >>>>> @@ -1104,6 +1104,17 @@ vopl_mmu: iommu@ff470f00 {
> >>>>>  		status =3D "disabled";
> >>>>>  	};
> >>>>> =20
> >>>>> +	rga: rga@ff480000 {
> >>>>> +		compatible =3D "rockchip,px30-rga";
> >>>>> +		reg =3D <0x0 0xff480000 0x0 0x10000>;
> >>>>> +		interrupts =3D <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH 0>;
> >>>>> +		clocks =3D <&cru ACLK_RGA>, <&cru HCLK_RGA>, <&cru SCLK_RGA_CORE=
>;
> >>>>> +		clock-names =3D "aclk", "hclk", "sclk";
> >>>>> +		resets =3D <&cru SRST_RGA>, <&cru SRST_RGA_A>, <&cru SRST_RGA_H>;
> >>>>> +		reset-names =3D "core", "axi", "ahb";
> >>>>> +		power-domains =3D <&power PX30_PD_VO>;
> >>>>
> >>>> 		status =3D "disabled";
> >>>
> >>> As of 5.6, the rk3399 has the node enabled by default. Did that chang=
e?
> >>
> >> 'status' disappeared during review for rk3399 between v2 and v3, but
> >> doesn't mention the reason. If someone can give more info here?
> >>
> >> https://lore.kernel.org/lkml/1500101920-24039-5-git-send-email-jacob-c=
hen@iotwrt.com/
> >>
> >> https://lore.kernel.org/lkml/1501470460-12014-5-git-send-email-jacob-c=
hen@iotwrt.com/
> >>
> >>>
> >>> Since it's a standalone block that has no I/O dependency, I don't rea=
lly see
> >>> the point of disabling it by default.
> >>
> >> Vop, hdmi and other video devices are also disabled.
> >> Follow the rest I think...
> >=20
> > Well, these blocks do have related I/O ports so it makes sense not to e=
nable
> > them by default because of pinmux, or because there might be no connect=
or
> > populated/routed.
> >=20
> > For a memory to memory internal block, I don't see any reason why.
> > It's definitely not board-specific and having to add these nodes for ev=
ery board
> > that has them is kind of a pain and might be overlooked. This will easi=
ly result
> > in the feature not being available for end users without having to chan=
ge the
> > dt.
> >=20
> > Also, the vpu node is always enabled on rockchip (and sunxi) platforms.
> > I think these are better examples to follow.
>=20
> From PX30 TRM-Part1:
>=20
> Power domain is shared by vop and dsi.
> It's up to the user what blocks he/she enables and what power it uses.
>=20
> PD_VO: VOP_M, VOP_S, RGA and DSI

Hum, there is no direct correlation between "node is enabled in dt" and "re=
lated
hardware block consumes power". And removing nodes from dt is certainly not=
 an
appropriate way to do power management! Device-tree is a way to represent t=
he
hardware, not a configuration interface (well, besides the /chosen node).

Besides, the RGA driver seems to have good runtime pm support, so be assured
that its clocks will be off when unused.

Cheers,

Paul

> >=20
> > Cheers,
> >=20
> > Paul
> >=20
> >>>
> >>> What do you think?
> >>>
> >>> Cheers,
> >>>
> >>> Paul
> >>>
> >>>>> +	};
> >>>>> +
> >>>>>  	qos_gmac: qos@ff518000 {
> >>>>>  		compatible =3D "syscon";
> >>>>>  		reg =3D <0x0 0xff518000 0x0 0x20>;
> >>>>>
> >>>>
> >>>
> >>
> >=20
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--IA03tywDYuoVKXrw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl6YZ7UACgkQ3cLmz3+f
v9H7Bwf/dxe/z672mfjqt4PR187hrwSZUxb8QrJrY0H31hOL2NOEFEufOKHPlA8y
U+xPF95tT1SWwB+/6cjzhYGy9CF8EvmR0FDkBf2RVSXxbNvWSUMOFAVCA6bchQ5R
7iuxNcsjeQuEBGu6ljByelGcBFBTrk6MUQEmEKuAaH7F22lfnKTW53SlSXPvsnpD
CAexlBFsLxN9VKECnc2QZ5qUjpNqRozzOexjDewJWm3BlPg4buAAkSKOQKlwd7q0
h7hYNx79PY6aFfp2EpdVy7XnbJOGRyRvwWbWsMFnKQo4wSYNtKWD3vMO3y6rX8ag
JSRQ0iYXDgYz2uvtpi37rQb4y5Z0pg==
=u/wC
-----END PGP SIGNATURE-----

--IA03tywDYuoVKXrw--
