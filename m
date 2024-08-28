Return-Path: <linux-media+bounces-17012-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 255039626AC
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 14:15:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49DDB1C21C2C
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 12:15:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11435175D20;
	Wed, 28 Aug 2024 12:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DXCkuQrF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9783813D53D;
	Wed, 28 Aug 2024 12:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724847295; cv=none; b=ix60Nu0xOQ2nxtbJHhuWED/NgzOY+4R4JoPCF/8Ffjg/JXVLW6RrCPT6Sh0iBkIIVuIn/5NFBCFLw51Ob50esm9mmVUts4CqH0GNmN8erW9oltBGi0SdoRCtEXZDlVbdqhzIQYm7gC9oPnUfr6Wz2blPBpZHR0QjzF2TJlAiJSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724847295; c=relaxed/simple;
	bh=FedBPNvWnRBW4FwoI7m8twxwx7vsQQ1gen13mGStnVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gRj2ZcG7XL9BPt/4q/0ZL6X3bp/fG0egcD3rYWLc0Vog3ag+vot3OJjFl5rdYuHUpqRouqGmIW69L7gFzfaRL+MP/+wu/DkGcLnKiewDtlUNtzg80htq0ItDLQqXzmhe9bShmfiT2vtTDPTIJ1MCCIGnfjol0zaYBA4ZhhK/1Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DXCkuQrF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 92FCA220;
	Wed, 28 Aug 2024 14:13:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724847223;
	bh=FedBPNvWnRBW4FwoI7m8twxwx7vsQQ1gen13mGStnVA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DXCkuQrFaCtFSHgvHIdWUiV0Aln91HQGgN1nY71h28FwR6b5A5u6lX7ACsUtaEkt8
	 afHrRwwtfxHMYhG508o3fCzOmVjX8/eScOyZkZ8mI9zB/tuW454D6dhW/u32pWZ54K
	 ydNIwba/sSPppyhYmQ1B/Mki9ArD7AvYxAUlQDGE=
Message-ID: <b3fe348b-60a3-4480-8a8e-89760c5bb7ae@ideasonboard.com>
Date: Wed, 28 Aug 2024 15:14:47 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: media: Add bindings for
 raspberrypi,rp1-cfe
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Naushir Patuck <naush@raspberrypi.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20240620-rp1-cfe-v2-0-b8b48fdba3b3@ideasonboard.com>
 <20240620-rp1-cfe-v2-2-b8b48fdba3b3@ideasonboard.com>
 <Zs8ErwJVTGYkHfJl@kekkonen.localdomain>
 <20240828111153.GL30398@pendragon.ideasonboard.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20240828111153.GL30398@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 28/08/2024 14:12, Laurent Pinchart wrote:
> On Wed, Aug 28, 2024 at 11:06:23AM +0000, Sakari Ailus wrote:
>> On Thu, Jun 20, 2024 at 02:07:51PM +0300, Tomi Valkeinen wrote:
>>> Add DT bindings for raspberrypi,rp1-cfe.
>>>
>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>> ---
>>>   .../bindings/media/raspberrypi,rp1-cfe.yaml        | 98 ++++++++++++++++++++++
>>>   1 file changed, 98 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/raspberrypi,rp1-cfe.yaml b/Documentation/devicetree/bindings/media/raspberrypi,rp1-cfe.yaml
>>> new file mode 100644
>>> index 000000000000..851533de2305
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/media/raspberrypi,rp1-cfe.yaml
>>> @@ -0,0 +1,98 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/media/raspberrypi,rp1-cfe.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Raspberry Pi PiSP Camera Front End
>>> +
>>> +maintainers:
>>> +  - Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>> +  - Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
>>> +
>>> +description: |
>>> +  The Raspberry Pi PiSP Camera Front End is a module in Raspberrypi 5's RP1 I/O
>>> +  controller, that contains:
>>> +  - MIPI D-PHY
>>> +  - MIPI CSI-2 receiver
>>> +  - Simple image processor (called PiSP Front End, or FE)
>>> +
>>> +  The FE documentation is available at:
>>> +  https://datasheets.raspberrypi.com/camera/raspberry-pi-image-signal-processor-specification.pdf
>>> +
>>> +  The PHY and CSI-2 receiver part have no public documentation.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - const: raspberrypi,rp1-cfe
>>> +
>>> +  reg:
>>> +    items:
>>> +      - description: CSI-2 registers
>>> +      - description: D-PHY registers
>>> +      - description: MIPI CFG (a simple top-level mux) registers
>>> +      - description: FE registers
>>> +
>>> +  interrupts:
>>> +    maxItems: 1
>>> +
>>> +  clocks:
>>> +    maxItems: 1
>>> +
>>> +  port:
>>> +    $ref: /schemas/graph.yaml#/$defs/port-base
>>> +    additionalProperties: false
>>> +    description: CSI-2 RX Port
>>> +
>>> +    properties:
>>> +      endpoint:
>>> +        $ref: video-interfaces.yaml#
>>> +        unevaluatedProperties: false
>>> +
>>> +        properties:
>>> +          data-lanes:
>>> +            minItems: 1
>>> +            maxItems: 4
>>> +
>>> +          clock-lanes:
>>> +            maxItems: 1
>>
>> minItems needs to be 1 as well.

Hmm, I see a lot of

clock-lanes:
   maxItems: 1

in the device tree bindings. And 
https://docs.kernel.org/devicetree/bindings/writing-schema.html says 
"Cases that have only a single entry just need to express that with 
maxItems".

>>
>> Or... is this actually configurable in hardware?
> 
> Looking at the driver, lane reordering is not supported, so we could
> drop this property. If the hardware is found to support it later, it can
> easily be added back without any backward compatibility issue.

Re-ordering is not supported. I guess clock-lanes can be dropped, 
although I feel that if we have the clock lane in the hardware, and the 
numbering of data-lanes must take that into account, then:

clock-lanes = <0>;
data-lanes = <1 2>;

looks better than:

data-lanes = <1 2>; /* and implicit clk lane 0 */

But I can't think of any practical benefit it brings...

  Tomi


