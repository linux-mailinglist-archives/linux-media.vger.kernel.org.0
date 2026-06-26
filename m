Return-Path: <linux-media+bounces-65767-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cnvWDb+vPmr7KAkAu9opvQ
	(envelope-from <linux-media+bounces-65767-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 18:58:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D906CF4C8
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 18:58:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=ideasonboard.com header.s=mail header.b=XavWwpTs;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65767-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65767-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=ideasonboard.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3E5DC30074B9
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 16:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AECA0400E09;
	Fri, 26 Jun 2026 16:58:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639283F9F4D;
	Fri, 26 Jun 2026 16:58:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782493116; cv=none; b=QrIIdpvdFqYU2AHl+98oS8yzaZUi99WZ4IWUGTsrUyFbGZkiKbXXfLMVD1aRSaL4t818Vn9QUTN+g3ut3W9PDK4tFRL04fBFSYPE6+DlJyKCLADnBuB8loEbg/Lzm0cnY2Yx2rxvkldFniuBwgqbFH8T2FDTQVsmi3iN5UEw/mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782493116; c=relaxed/simple;
	bh=tctF25yDjX2h/D8jTaVAW8rgtRGo6jx+AhqWLDpBgto=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=PBKTrt3jVWTfD9aXD1FN1++zvIOOvdN5rBph+7yEq/t5tJiS8l2tG6ZjlQxjtp+m0qeHqCyPsb9vRPY0g+ZVFa+tg34vFg2KGIk5d66vbmcXzTJrzgqKLDnY49piOENcz5fyx3q2fi7DAkXdzOqABNYH8jMfKSSq6tzpBg+0ghU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=fail (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XavWwpTs reason="signature verification failed"; arc=none smtp.client-ip=213.167.242.64
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D3CD91E7;
	Fri, 26 Jun 2026 18:57:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782493070;
	bh=tctF25yDjX2h/D8jTaVAW8rgtRGo6jx+AhqWLDpBgto=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=XavWwpTshvR2O36bfPMEeGMaH0w7ZdslrtG03Qazu+OZnaOrAdHxWil5SaIhIb0cY
	 JMvAYnk+2anzMx7HlygYjieq5FydLfCQQ2JSjFiBcLiE61AZt31R9BdllD2TjmFZbd
	 IcL7snuNtXIT11WheBb0ccOUTcoe4r1AFdHxHaok=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260626143310.GF2363897@killaraus.ideasonboard.com>
References: <20260626-kbingham-orientation-v2-0-47178be927b4@ideasonboard.com> <20260626-kbingham-orientation-v2-4-47178be927b4@ideasonboard.com> <20260626143310.GF2363897@killaraus.ideasonboard.com>
Subject: Re: [PATCH v2 4/8] ARM: tegra: Convert to new media orientation definitions
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Jimmy Su <jimmy.su@intel.com>, Matthias Fend <matthias.fend@emfend.at>, Mikhail Rudenko <mike.rudenko@gmail.com>, Daniel Scally <dan.scally@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Michael Riesch <michael.riesch@collabora.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Paul Elder <paul.elder@ideasonboard.com>, Martin Kepplinger <martin.kepplinger@puri.sm>, Quentin Schulz <quentin.schulz@theobroma-systems.com>, Tommaso Merciai <tomm.merciai@gmail.com>, Svyatoslav Ryhel <clamor95@gmail.com>, Richard Acayan <mailingradian@gmail.com>, Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.
 de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux@ew.tq-group.com, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Fri, 26 Jun 2026 17:58:28 +0100
Message-ID: <178249310801.36676.2030968701607803461@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[ideasonboard.com:s=mail];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ideasonboard.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65767-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jacopo@jmondi.org,m:sakari.ailus@linux.intel.com,m:jimmy.su@intel.com,m:matthias.fend@emfend.at,m:mike.rudenko@gmail.com,m:dan.scally@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:michael.riesch@collabora.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:paul.elder@ideasonboard.com,m:martin.kepplinger@puri.sm,m:quentin.schulz@theobroma-systems.com,m:tomm.merciai@gmail.com,m:clamor95@gmail.com,m:mailingradian@gmail.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix. de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:heiko@sntech.de,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux@ew.tq-group.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lis
 ts.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:laurent.pinchart@ideasonboard.com,m:krzk@kernel.org,m:conor@kernel.org,m:mikerudenko@gmail.com,m:tommmerciai@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[kieran.bingham@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[42];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kieran.bingham@ideasonboard.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,jmondi.org,linux.intel.com,intel.com,emfend.at,gmail.com,ideasonboard.com,collabora.com,foss.st.com,puri.sm,theobroma-systems.com,nvidia.com,nxp.com,pengutronix. de,pengutronix.de,glider.be,sntech.de,vger.kernel.org,ew.tq-group.com,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,ideasonboard.com:from_mime,ideasonboard.com:email,ping.linuxembedded.co.uk:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C4D906CF4C8

Quoting Laurent Pinchart (2026-06-26 15:33:10)
> On Fri, Jun 26, 2026 at 01:07:56PM +0100, Kieran Bingham wrote:
> > The orientation property for video interface devices now has definitions
> > to prevent hardcoded integer values for the enum options.
> >=20
> > Update the users throughout the nvidia device trees to use the new
> > definitions.
> >=20
> > Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> > ---
> >  arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi | 3 +=
+-
> >  arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi    | 3 +=
+-
> >  arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts                     | 4 +=
++-
> >  arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi                      | 3 +=
+-
> >  4 files changed, 9 insertions(+), 4 deletions(-)
> >=20
<snip>
> > diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi b/arch/arm/boo=
t/dts/nvidia/tegra30-lg-x3.dtsi
> > index 60e8a19aa70e..c58e3026a115 100644
> > --- a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
> > +++ b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
> > @@ -4,6 +4,7 @@
> >  #include <dt-bindings/input/input.h>
> >  #include <dt-bindings/leds/common.h>
> >  #include <dt-bindings/media/video-interfaces.h>
> > +#include <dt-bindings/media/video-interface-devices.h>
> >  #include <dt-bindings/mfd/max77620.h>
> >  #include <dt-bindings/thermal/thermal.h>
> > =20
> > @@ -1216,7 +1217,7 @@ rear-camera@10 {
> >                       dvdd-supply =3D <&vdd_1v2_rear>;
> >                       avdd-supply =3D <&vdd_2v7_rear>;
> > =20
> > -                     orientation =3D <1>; /* Rear camera */
> > +                     orientation =3D <MEDIA_ORIENTATION_REAR>;
>=20

It must have been hot when I typed that one out...

> This should be MEDIA_ORIENTATION_BACK. And you should compile all the
> device trees the series touch.

Indeed, I got caught out by these being in arm, with the others in arm64
even though I explicitly pulled these out to a separate patch!

Fixed up and now I have compiled also with:

make O=3Darm32 ARCH=3Darm multi_v7_defconfig
make O=3Darm32 ARCH=3Darm dtbs -j32

which looks clean.

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks

Kieran

>=20
> >                       rotation =3D <90>;
> > =20
> >                       nvmem =3D <&m24c08>;
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart

