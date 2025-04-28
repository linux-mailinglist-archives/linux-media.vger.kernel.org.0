Return-Path: <linux-media+bounces-31149-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CD4A9EA62
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 10:12:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2376176B65
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 08:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AEF324EAAB;
	Mon, 28 Apr 2025 08:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ZI9/Ub1Z"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D61C211476;
	Mon, 28 Apr 2025 08:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745827923; cv=none; b=GgLGbzjysoZnHa8hnBECwuTf1pVvptB1lbwWgdMN2e1RzG7HKxt6SlcStTyMV+1sifzvyRLqcWOmn9ZcNQF5aVttC1gwI87wOEqGkdwvKcs4shwln2USPuPdLUxXKT7G7oMny7PXQyiq06h7gKeBCHq1ZbyM6PRIhCblhGW2rBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745827923; c=relaxed/simple;
	bh=erak0Nrp6DhDn+xkrc0QqINceh4o0C6lMu4363PZjVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i4Apc3q6bp1hhLGJca63cZS3+Efm6AdPukYPTTmik6nWUQa9+rpJJTaklRMwnnYZ3+6HjgMvGV3VdQskkFquxJgxSOYNsGgH0w6RkGQktwOvsT8p+daD0fomz7rLeormnRvEs5xyPW9Eqk+4oPnPd9ON3cHc62d8LU3tyLxhCik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ZI9/Ub1Z; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745827913;
	bh=erak0Nrp6DhDn+xkrc0QqINceh4o0C6lMu4363PZjVE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZI9/Ub1ZC1O0XFComKyXBcHXXZLXK3tmTPFC3myp+dtz71rnW5XXb8ZEdsAuxCS9B
	 QQQNtLqv59Vi5EgcB0qaYDCE0L2x4fxHwz8QN1bodxeYUDRcJiqK/TqLNStA0ilSY4
	 b7Aq1o1ilMzg6UBFTLZITqdfiQf77C+rCDv9QlE+h1yYHmYfkWitQ2QUV3iNXBy/eO
	 ierDVOp1Pd3Qlzr3PaZInaLrZbE0yGcOMzAnKJ6At9gmGljroPXh9URrh0Ul93QvtC
	 RX0HGMfBfHY13Ge+OvzXeArdEEiZhFh53kbSMm9cd1yL4d955KH/Cfw1LNy3nNozgL
	 BiZLhnw7eC82A==
Received: from [IPV6:2a05:1141:1cc:8600:1cd7:9a7e:17d7:cd2c] (unknown [IPv6:2a05:1141:1cc:8600:1cd7:9a7e:17d7:cd2c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1C0CC17E0F93;
	Mon, 28 Apr 2025 10:11:52 +0200 (CEST)
Message-ID: <4a1e5834-df52-43d2-ab19-e3117840a001@collabora.com>
Date: Mon, 28 Apr 2025 10:11:51 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/11] media: dt-bindings: media: add bindings for
 rockchip rk3568 vicap
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20250306-v6-8-topic-rk3568-vicap-v5-0-f02152534f3c@wolfvision.net>
 <20250306-v6-8-topic-rk3568-vicap-v5-3-f02152534f3c@wolfvision.net>
 <20250307-pink-dalmatian-of-kindness-f87ad2@krzk-bin>
 <Z8rBGHK9Tjx7D1D2@kekkonen.localdomain>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <Z8rBGHK9Tjx7D1D2@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Krzysztof, Sakari,

Thanks for your feedback! Also, sorry for the delayed response, but as
the e-mail address indicates, there has been a job change in between
that kept me busy :-)

On 3/7/25 10:49, Sakari Ailus wrote:
> Hi Krzysztof, Michael,
> 
> On Fri, Mar 07, 2025 at 08:51:54AM +0100, Krzysztof Kozlowski wrote:
>> On Thu, Mar 06, 2025 at 05:56:04PM +0100, Michael Riesch wrote:
>>> Add documentation for the Rockchip RK3568 Video Capture (VICAP) unit.
>>>
>>> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
>>
>> subject: only one media prefix, the first
>>
>> A nit, subject: drop second/last, redundant "bindings". The
>> "dt-bindings" prefix is already stating that these are bindings.
>> See also:
>> https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

Ack. Plain "media: dt-bindings: add rockchip rk3568 vicap" it is, then.

>>
>>> ---
>>>  .../bindings/media/rockchip,rk3568-vicap.yaml      | 169 +++++++++++++++++++++
>>>  MAINTAINERS                                        |   1 +
>>>  2 files changed, 170 insertions(+)
>>>
>>
>> ...
>>
>>> +  clocks:
>>> +    items:
>>> +      - description: ACLK
>>> +      - description: HCLK
>>> +      - description: DCLK
>>> +      - description: ICLK
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: aclk
>>> +      - const: hclk
>>> +      - const: dclk
>>> +      - const: iclk
>>> +
>>> +  rockchip,cif-clk-delaynum:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    minimum: 0
>>> +    maximum: 127
>>> +    description:
>>> +      Delay the DVP path clock input to align the sampling phase, only valid
>>> +      in dual edge sampling mode. Delay is zero by default and can be adjusted
>>> +      optionally.
>>
>> default: 0

Ack.

> 
> And this is technically specific to the DVP port (0). Should (or could?) it
> be located there?

"Should"? Yes, makes sense to me.
"Could"? I guess, as we are referencing port-base here it should be
feasible. Not an expert opinion, mind you.

> 
>>
>>> +
>>> +  iommus:
>>> +    maxItems: 1
>>> +
>>> +  resets:
>>> +    items:
>>> +      - description: ARST
>>> +      - description: HRST
>>> +      - description: DRST
>>> +      - description: PRST
>>> +      - description: IRST
>>> +
>>> +  reset-names:
>>> +    items:
>>> +      - const: arst
>>> +      - const: hrst
>>> +      - const: drst
>>> +      - const: prst
>>> +      - const: irst
>>> +
>>> +  rockchip,grf:
>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>> +    description: Phandle to general register file used for video input block control.
>>> +
>>> +  power-domains:
>>> +    maxItems: 1
>>> +
>>> +  ports:
>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>> +
>>> +    properties:
>>> +      port@0:
>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>> +        unevaluatedProperties: false
>>> +        description: The digital video port (DVP, a parallel video interface).
>>> +
>>> +        properties:
>>> +          endpoint:
>>> +            $ref: video-interfaces.yaml#
>>> +            unevaluatedProperties: false
>>> +
>>> +            properties:
>>> +              bus-type:
>>> +                enum: [5, 6]
>>> +
>>> +            required:
>>> +              - bus-type
>>> +
>>> +      port@1:
>>> +        $ref: /schemas/graph.yaml#/properties/port
>>> +        description: Internal port connected to a MIPI CSI-2 host.
>>> +
>>> +        properties:
>>> +          endpoint:
>>> +            $ref: video-interfaces.yaml#
>>> +            unevaluatedProperties: false
>>
>> Hm, does it actually work? graph/port does not allow any other
>> properties. You should use graph/port-base and probably still narrow
>> lanes for both of port@0 and port@1.
> 
> I'd list the relevant properties for both DVP and CSI-2, either as
> mandatory or with defaults (could be reasonable for DVP signal polarities
> but not e.g. on number of CSI-2 lanes).

Not sure whether we are on the same page here. As pointed out in the
last round of feedback
(https://lore.kernel.org/all/0b19c544-f773-435e-9829-aaaa1c6daf7a@wolfvision.net/),
port@1 is not MIPI CSI, but some internal interface.

I tried to clarify this by changing the description of this port to
"Internal port connected to a MIPI CSI-2 host." The host (see
rockchip,rk3568-mipi-csi.yaml) has a port that is actually MIPI CSI and
one port that is the other end of port@1 here.

As to port@1 here, I am not aware of any properties that can be set. Not
even very peculiar ones similar to rockchip,cif-clk-delaynum. Should I
have overlooked something, I think we can relax the constraints, but we
should start strict, right?

> 
>>
>>
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - interrupts
>>> +  - clocks
>>> +  - ports
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/clock/rk3568-cru.h>
>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +    #include <dt-bindings/interrupt-controller/irq.h>
>>> +    #include <dt-bindings/power/rk3568-power.h>
>>> +    #include <dt-bindings/media/video-interfaces.h>
>>> +
>>> +    parent {
>>
>> soc {

Ack.

Best regards,
Michael

>>
>>> +        #address-cells = <2>;
>>> +        #size-cells = <2>;
>>
>> Best regards,
>> Krzysztof
>>
> 


