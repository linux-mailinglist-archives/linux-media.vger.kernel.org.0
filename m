Return-Path: <linux-media+bounces-64904-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ynn8LVzhL2qMIQUAu9opvQ
	(envelope-from <linux-media+bounces-64904-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 13:26:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5970F685B83
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 13:26:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=dolcini.it header.s=default header.b=PeemKhZV;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64904-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64904-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=dolcini.it;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4AE71300D4F2
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 11:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAF5E3E51CB;
	Mon, 15 Jun 2026 11:25:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E123E44E1;
	Mon, 15 Jun 2026 11:25:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781522757; cv=none; b=sdONbyhCzG8fRK/Se+14zx9r7uQ2tLCtSX27P7jVvjEAyFxcXUUbWKMVytze9uqKyaBtZImD0iyCOhJf93gQu/4tP9+P9mRXhoPzia/ULe4+2ew6eeyEQ/m96i0DDazQxCs3LPdKP/jxlvEp0ZWmmKmx6cFlodvgUdpUdjTbxfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781522757; c=relaxed/simple;
	bh=aCiCrCVJCK0CqSjL+oVJoYwplS/qJ1qccA1+xU+pz80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YqA8Dn+9Y87XvTU1BG15p6jNHcJzKmD60LvjrSyoBvfYxO9x62VFI2pxR6dcDe9tiiZI3DDZxywdXDro9RO91M2NPCy35FdRbt+tRIMwZLg0ogvu8yp+/zwyKAzoQe19bWgycpGZowFhHrNOrngMTgWhzdnzgt4RczoS7DFsz3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=PeemKhZV; arc=none smtp.client-ip=217.194.8.81
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id F25701FA61;
	Mon, 15 Jun 2026 13:25:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1781522753;
	bh=9kKGvPf2rc3hM5ewk0p/1qE43DFbrtoz5U3rTNNnFvA=; h=From:To:Subject;
	b=PeemKhZVmT1F8yIxLlUuJAU4lWFxfPtbLr/IaaUJsTBvSIl7BvaLMcUfNkWfwhPS4
	 THWKQZVkEz1vc1HJqsw5BjqDdowsF/ycQyaSTh9KeF8BQ+G89hc4gQQA5x3uBbtyuE
	 E0pfPpl69Kw4wvN1uXt73iUk+Tgl5dUcvn34trjO0HjdNJFutLSXmXRxdZPBR1Q764
	 LpofrFVPAAVqC6nrP/N2GgJIWN+YmNjPqT4xaeOdIGoNetOZQtsml3UBQBKabR2F71
	 7T4EfMZnBiZ476g0WvvRr2FFLx1qQIEY6W6gRyfp5zndXVVbzzCKB0o8KbKoU+s9HL
	 E9ttnE3ob4lkA==
Date: Mon, 15 Jun 2026 13:25:49 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, julien.vuillaumier@nxp.com,
	alexi.birlinger@nxp.com, daniel.baluta@nxp.com, peng.fan@nxp.com,
	frank.li@nxp.com, jacopo.mondi@ideasonboard.com,
	laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	michael.riesch@collabora.com, anthony.mcgivern@arm.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	ai.luthra@ideasonboard.com, paul.elder@ideasonboard.com,
	geert@linux-m68k.org, sakari.ailus@linux.intel.com,
	hverkuil+cisco@kernel.org
Subject: Re: [PATCH v3 8/8] arm64: dts: freescale: imx95: Add NXP neoisp
 device tree node
Message-ID: <20260615112549.GA137559@francesco-nb>
References: <20260612132039.2089051-1-antoine.bouyer@nxp.com>
 <20260612132039.2089051-9-antoine.bouyer@nxp.com>
 <20260614090517.GA7434@francesco-nb>
 <761f284a-1660-41d5-9625-9b25bf18aca5@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <761f284a-1660-41d5-9625-9b25bf18aca5@nxp.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[dolcini.it,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[dolcini.it:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64904-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:antoine.bouyer@nxp.com,m:francesco@dolcini.it,m:julien.vuillaumier@nxp.com,m:alexi.birlinger@nxp.com,m:daniel.baluta@nxp.com,m:peng.fan@nxp.com,m:frank.li@nxp.com,m:jacopo.mondi@ideasonboard.com,m:laurent.pinchart@ideasonboard.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:michael.riesch@collabora.com,m:anthony.mcgivern@arm.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:ai.luthra@ideasonboard.com,m:paul.elder@ideasonboard.com,m:geert@linux-m68k.org,m:sakari.ailus@linux.intel.com,m:hverkuil+cisco@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER(0.00)[francesco@dolcini.it,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[francesco@dolcini.it,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[dolcini.it:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dolcini.it:dkim,dolcini.it:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5970F685B83

On Mon, Jun 15, 2026 at 11:56:15AM +0200, Antoine Bouyer wrote:
> On 6/14/26 11:05 AM, Francesco Dolcini wrote:
> > On Fri, Jun 12, 2026 at 03:20:39PM +0200, Antoine Bouyer wrote:
> > > Add neoisp device tree node to imx95.dtsi and enable it by default in
> > > 19x19 evk board.
> > > 
> > > Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
> > 
> > ...
> > 
> > > diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> > > index d6c549c16047..5543a6cb1250 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> > > @@ -1867,6 +1867,17 @@ pmu@49252000 {
> > >                        };
> > >                };
> > > 
> > > +             neoisp0: isp@4ae00000 {
> > > +                     compatible = "nxp,imx95-neoisp";
> > > +                     reg = <0x0 0x4ae00000 0x0 0x8000>,
> > > +                           <0x0 0x4afe0000 0x0 0x10000>;
> > > +                     interrupts = <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>;
> > > +                     clocks = <&scmi_clk IMX95_CLK_CAMCM0>;
> > > +                     clock-names = "camcm0";
> > > +                     power-domains = <&scmi_devpd IMX95_PD_CAMERA>;
> > > +                     status = "disabled";
> > > +             };
> > 
> > Why the node is disabled?  If the node is wholly described in
> > imx95.dtsi, it should be enabled.
> 
> Actually, all nodes are disabled in the SoC dtsi, and enabled on the board
> dts file, even if fully described on the dtsi. So I used same approach for
> neoisp.

This is not correct. Please check what we do for the GPU/VPU[1] and NPU [2],
for example. Is there a reason to do it differently for the ISP?

Francesco

[1] arch/arm64/boot/dts/freescale/imx8mm.dtsi
[2] arch/arm64/boot/dts/freescale/imx93.dtsi

