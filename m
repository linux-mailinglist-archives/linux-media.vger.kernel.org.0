Return-Path: <linux-media+bounces-13311-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DC245909A4E
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 00:59:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38079282194
	for <lists+linux-media@lfdr.de>; Sat, 15 Jun 2024 22:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 868666BB5C;
	Sat, 15 Jun 2024 22:58:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC909537F2;
	Sat, 15 Jun 2024 22:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718492332; cv=none; b=hiU7Zhy1HfItKHPQzZB6F58gaiZFgXYkHvKfmiJ0dSqarpdqh492J1DHNbQOFPq0i+Anxnr9l9te6izUcDeCN3t8j7rxLNlopIS9eVQAa5bJRBIAkWkbSpZMlbg02LArR/MsAPXXUZnnAp54EQzevLkUPJYwgSQQrSNMwPlyFIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718492332; c=relaxed/simple;
	bh=P1YVi7a9KN4Sv0YEIiIcHYvtV+ZKTrEhkKY+YeE5nqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ec8ZX0vCh08/PC2GjAZ0OOyDqbxA6kr+S06WFqsnObCBRdifooeguu1Ko3IteJkhAyXyh1VLsFlcVXKk7Hj7DOLWAROjKQ83wwvqmtDc2CHw4Yi55FJ2riuNrAtrbwlXMVzqy9/n3idcPfpCigiBjSFY/n3Xpw+wdMxQnoOCKWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from 79-98-74-242.sys-data.com ([79.98.74.242] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sIcLe-00022x-WA; Sun, 16 Jun 2024 00:58:15 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Jonas Karlman <jonas@kwiboo.se>,
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>, Alexey Charkov <alchark@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Diederik de Haas <didi.debian@cknow.org>, Andy Yan <andy.yan@rock-chips.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev
Subject:
 Re: [PATCH 2/3] media: dt-bindings: rockchip: Document RK3588 Video Decoder 2
 bindings
Date: Sun, 16 Jun 2024 00:58:13 +0200
Message-ID: <4352466.CQOukoFCf9@phil>
In-Reply-To: <14930500.uLZWGnKmhe@arisu>
References:
 <20240615015734.1612108-1-detlev.casanova@collabora.com>
 <442bbb41-40ed-4e6c-b854-02b636f09fc3@kwiboo.se> <14930500.uLZWGnKmhe@arisu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Samstag, 15. Juni 2024, 21:49:21 CEST schrieb Detlev Casanova:
> On Saturday, June 15, 2024 4:11:00 A.M. EDT Jonas Karlman wrote:
> > Hi Detlev,
> > 
> > On 2024-06-15 03:56, Detlev Casanova wrote:
> > > Document the Rockchip RK3588 Video Decoder 2 bindings.
> > 
> > Why the need for a new schema file and not just extending existing
> > rockchip,vdec.yaml with a new compatible and the new clock?
> 
> Yes, that can work as well indeed. I wasn't sure if different drivers could 
> share a schema file.
> 
> > > Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> > > ---
> > > 
> > >  .../bindings/media/rockchip,vdec2.yaml        | 80 +++++++++++++++++++
> > >  1 file changed, 80 insertions(+)
> > >  create mode 100644
> > >  Documentation/devicetree/bindings/media/rockchip,vdec2.yaml> 
> > > diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec2.yaml
> > > b/Documentation/devicetree/bindings/media/rockchip,vdec2.yaml new file
> > > mode 100644
> > > index 000000000000..e54891b46986
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/rockchip,vdec2.yaml
> > > @@ -0,0 +1,80 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/rockchip,vdec2.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Rockchip Video Decoder 2 (VDec2)
> > > +
> > > +maintainers:
> > > +  - Heiko Stuebner <heiko@sntech.de>
> > > +
> > > +description: |-
> > > +  The Rockchip rk3588 has a stateless Video Decoder that can decodes
> > > H.264, +  HEVC, VP9 and AVS2 streams.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: rockchip,rk3588-vdec2
> > 
> > I fail to see the need to call this vdec2 instead of established vdec.
> > 
> > Suggest this is changed to rockchip,rk3588-vdec.
> 
> Wouldn't that be misleading if rockchip,rk3399-vdec and rockchip,rk3588-vdec 
> use different drivers ?

Devicetrees and their binding don't care about how operating system
implement things in drivers. 

While they come with the Linux-kernel most of the time, they are pretty
much independent from implementation details.


> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description: The Video decoder AXI interface clock
> > > +      - description: The Video decoder AHB interface clock
> > > +      - description: The Video decoder core clock
> > > +      - description: The Video decoder CABAC clock
> > > +      - description: The Video decoder HEVC CABAC clock
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: axi
> > > +      - const: ahb
> > > +      - const: core
> > > +      - const: cabac
> > > +      - const: hevc_cabac
> > > +
> > > +  assigned-clocks: true
> > > +
> > > +  assigned-clock-rates: true
> > > +
> > > +  power-domains:
> > > +    maxItems: 1
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - interrupts
> > > +  - clocks
> > > +  - clock-names
> > > +  - power-domains
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
> > > +    #include <dt-bindings/power/rk3588-power.h>
> > > +
> > > +    vdec2: video-codec@fdc38100 {
> > > +        compatible = "rockchip,rk3588-vdec2";
> > > +        reg = <0x0 0xfdc38100 0x0 0x500>;
> > > +        interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH 0>;
> > > +        clocks = <&cru ACLK_RKVDEC0>, <&cru HCLK_RKVDEC0>, <&cru
> > > CLK_RKVDEC0_CORE>, +                 <&cru CLK_RKVDEC0_CA>, <&cru
> > > CLK_RKVDEC0_HEVC_CA>; +        clock-names = "axi", "ahc", "core",
> > > +                      "cabac", "hevc_cabac";
> > > +        assigned-clocks = <&cru ACLK_RKVDEC0>, <&cru CLK_RKVDEC0_CORE>,
> > > +                          <&cru CLK_RKVDEC0_CA>, <&cru
> > > CLK_RKVDEC0_HEVC_CA>; +        assigned-clock-rates = <800000000>,
> > > <600000000>,
> > > +                               <600000000>, <1000000000>;
> > > +        power-domains = <&power RK3588_PD_RKVDEC0>;
> > 
> > iommus and resets seem to be missing?
> 
> Indeed, even if their are not used yet, I'd make sens to already have them 
> here to stabilize the device tree, right ?

correct. DT only ever describes the hardware. And while it is possible
to extend bindings later, having the obvious things in it from the start
makes a lot of sense.




