Return-Path: <linux-media+bounces-50868-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83ACDD3031B
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 12:14:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B0DE03131CD2
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 11:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0102E3612F9;
	Fri, 16 Jan 2026 11:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="B8+VwbhH"
X-Original-To: linux-media@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFF8274FE3;
	Fri, 16 Jan 2026 11:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768561669; cv=none; b=gyV7hQePw7KtAGXu9HOnXQv3aoF4YCCyBDbMtE2cO1cSwZHJ3msndzHoAagDI7FiQEyjMnf4jCLAcjIvyQ5EN3R1UrBdhOUtY0coAqFkH0lkUX9s5TBL7zhOj4VOcALrDXypq0alxj7kCPIPjZ93QbmS4v5biNOlWaKVrqqRcgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768561669; c=relaxed/simple;
	bh=whg9/SgnRXJSe6Nqm3QSG2N8JXAeg6aAaaOHiRkCxHk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lHPLUp0huYyZIqZegQ83g1OEcJf0Lz5JOvI4gNzMuADY81KSMvnn4+OaPiOWf+/TT0glcVCgKDp0CWRWfs/lVc2JWg7XZRUFnZk2YcM80Jmo9wgVqcXdJvdw3hmViHp2u0Y2owBf9cPiF8aZb3VIaxYAIfUoteyeqGUyKMnHWI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=B8+VwbhH; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=dzSr+vK27hutzJjP42tJFaeLCI9FsTxETKHO6P3r+0c=; b=B8+VwbhHy4P6pCRNKtlLFwEdMp
	lhd0dxCpyuWrkYSuFEtmsiURAqSkvL/WinKpjy116YeztW7MJT+o53mT7hYGinbXb5rz0fm+m9zJB
	lpJIK6pM6ETLCiX9v0Ye98LU9ruBQ2DKWyE434g2tIDq9H3jryobySsbYWr/2GIoRxH1Abn+g8hZT
	r5idEIyofm7OiqISbU3v7vIeP2AYgduIoNS5Wda1NnflUaC+71XIa06q52eiFHb6AQo+F6BTZxa4J
	ycJZXdXCjQe4yMpDNmnHmpGfL6QSHpA2JnpU4S3oUhc7a9WJGOTUixQKFBC9CE6mEqdKJuj/qRLPh
	BubXjh/g==;
Received: from i53875a97.versanet.de ([83.135.90.151] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vghfn-002cBj-LC; Fri, 16 Jan 2026 12:07:24 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: michael.riesch@collabora.com, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Kever Yang <kever.yang@rock-chips.com>, Frank Li <Frank.li@nxp.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v4 1/3] media: dt-bindings: add rockchip mipi csi-2 receiver
Date: Fri, 16 Jan 2026 12:07:22 +0100
Message-ID: <5173450.iZASKD2KPV@diego>
In-Reply-To: <aWoOzn_d7ixgbzj4@kekkonen.localdomain>
References:
 <20251114-rockchip-mipi-receiver-v4-0-a9c86fecd052@collabora.com>
 <20251114-rockchip-mipi-receiver-v4-1-a9c86fecd052@collabora.com>
 <aWoOzn_d7ixgbzj4@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Freitag, 16. Januar 2026, 11:11:26 Mitteleurop=C3=A4ische Normalzeit sch=
rieb Sakari Ailus:
> Hi Michael,
>=20
> On Thu, Jan 15, 2026 at 07:26:07PM +0100, Michael Riesch via B4 Relay wro=
te:
> > From: Michael Riesch <michael.riesch@collabora.com>
> >=20
> > Add documentation for the Rockchip MIPI CSI-2 Receiver.
> >=20
> > Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> > Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> > ---
> >  .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  | 141 +++++++++++++=
++++++++
> >  MAINTAINERS                                        |   6 +
> >  2 files changed, 147 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mi=
pi-csi2.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi=
=2Dcsi2.yaml
> > new file mode 100644
> > index 000000000000..2c2bd87582eb
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2=
=2Eyaml
>=20
> I'd add a compatible string for the base IP block and name it accordingly.

personally, I wouldn't do that.

While the RK3568-variant is a somewhat smooth integration ... the now
(temporarily) omitted RK3588 variant of a similar block is not.

I.e. the RK3588 has quite a number of those CSI hosts, with a bunch of
resource routing bits and bops between those CSI hosts sitting in the
Rockchip "Gernal Register Files" (dumping ground for random bits and bops).

So you then get a syscon accessing per-soc registers and bits.

So while it is (compatible to) some Synopsis IP block, the integration to
make that thing actually do something is highly soc-specific.

That's also why the for example the dw-hdmi/dsi IPs don't use a common
compatible [0] [1] [2] [3] [4]


[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-dw-hdmi.yaml
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/devicetree/bindings/display/hisilicon/dw-dsi.txt
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
[4] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.ya=
ml


> > +    soc {
> > +        interrupt-parent =3D <&gic>;
> > +        #address-cells =3D <2>;
> > +        #size-cells =3D <2>;
> > +
> > +        csi: csi@fdfb0000 {
> > +            compatible =3D "rockchip,rk3568-mipi-csi2";
>=20
> This would become e.g.
>=20
>             compatible =3D "rockchip,rk3568-mipi-csi2", "snps,dw-mipi-csi=
2rx";
>=20
> See my comments on the driver patch as well.

In the PCIe area, we have  rockchip,rk3568-pcie and rockchip,rk3568-pcie-ep
for a similar combo.

=46or CSI the receiver is the vastly more common thing to do. So if anythin=
g,
I'd go with "foo-csi2" vs. "foo-csi2-device", if somebody really develops a
"camera" SoC, with a fully featured DT-based OS in the future ;-) .

Heiko




