Return-Path: <linux-media+bounces-5279-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FAD857D3D
	for <lists+linux-media@lfdr.de>; Fri, 16 Feb 2024 14:09:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A7B41F28632
	for <lists+linux-media@lfdr.de>; Fri, 16 Feb 2024 13:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09719129A60;
	Fri, 16 Feb 2024 13:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="J41Rqi8I"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252537868D;
	Fri, 16 Feb 2024 13:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708088965; cv=none; b=rZjwi+E5PHMJGpxL8iwPNJg/AQD1oGKz+sj5jAoaWDUBiphj8dWOTrCtI6EolLUkziiBf/OlCONXIs/qWawQwX5HJJfRbfomRV2HK+xCALryttOmRHeWgpO7ICU54mFW897DFA2mm32OGSR7v/1hnYpR6c7zlkU+Aa8SGkFL7XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708088965; c=relaxed/simple;
	bh=TwsN9C7Fo6AIvbubC96VPrwSsoOR6Erw6Vb2lFZeK7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z/GNPE62D4J0qvQk1gKhsCrS4s+u58xjCurOzkyrm8M9JwzwI7YJoclHMa1eiLQKaTYx17htFOa4lK7smPTSkYNcbwMGh2lbgNl1axr+pS/gxblMo+cKwX60YGc7pGg5rCXJYzO7buo78V17L0SymEyf/LiUqMNK6VyCbn36mUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=J41Rqi8I; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4407F6B3;
	Fri, 16 Feb 2024 14:09:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1708088956;
	bh=TwsN9C7Fo6AIvbubC96VPrwSsoOR6Erw6Vb2lFZeK7o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J41Rqi8IrFMujJJ50z+IFzpleYkScHihTXx/xK6TGldIqiC+VrOktbDF988yEeDTY
	 Q3On+OOaTNf7PZNfsYVUfzBwaAGhMt3cB4Er/2rWY2RJXGyhaycEQbLhj+O9uRbROC
	 TT/GmRcN/CebTdrY4A2bv/FyGz+5w82nESEGbvWM=
Message-ID: <e06b0792-187d-454b-aa62-d9c1e797df17@ideasonboard.com>
Date: Fri, 16 Feb 2024 13:09:15 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] dt-bindings: media: Add bindings for ARM mali-c55
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Conor Dooley <conor@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, jacopo.mondi@ideasonboard.com,
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com
References: <20240214141906.245685-1-dan.scally@ideasonboard.com>
 <20240214141906.245685-3-dan.scally@ideasonboard.com>
 <20240214142825.GA7873@pendragon.ideasonboard.com>
 <20240214-velcro-pushy-0cbd18b23361@spud>
 <20240215110205.GD7873@pendragon.ideasonboard.com>
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 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
In-Reply-To: <20240215110205.GD7873@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi both

On 15/02/2024 11:02, Laurent Pinchart wrote:
> On Wed, Feb 14, 2024 at 05:37:17PM +0000, Conor Dooley wrote:
>> On Wed, Feb 14, 2024 at 04:28:25PM +0200, Laurent Pinchart wrote:
>>> On Wed, Feb 14, 2024 at 02:19:03PM +0000, Daniel Scally wrote:
>>>> Add the yaml binding for ARM's Mali-C55 Image Signal Processor.
>>>>
>>>> Acked-by: Nayden Kanchev <nayden.kanchev@arm.com>
>>>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>>>> ---
>>>> Changes in v2:
>>>>
>>>> 	- Added clocks information
>>>> 	- Fixed the warnings raised by Rob
>>>>
>>>>   .../bindings/media/arm,mali-c55.yaml          | 77 +++++++++++++++++++
>>>>   1 file changed, 77 insertions(+)
>>>>   create mode 100644 Documentation/devicetree/bindings/media/arm,mali-c55.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
>>>> new file mode 100644
>>>> index 000000000000..30038cfec3a4
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
>>>> @@ -0,0 +1,77 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/media/arm,mali-c55.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: ARM Mali-C55 Image Signal Processor
>>>> +
>>>> +maintainers:
>>>> +  - Daniel Scally <dan.scally@ideasonboard.com>
>>>> +  - Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: arm,mali-c55
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  interrupts:
>>>> +    maxItems: 1
>>>> +
>>>> +  clocks:
>>>> +    items:
>>>> +      - description: ISP video clock
>>> I wonder if we need this clock. Granted, it's an input clock to the ISP,
>>> but it's part of the input video bus. I don't expect anyone would ever
>>> need to control it manually, it should be provided by the video source
>>> automatically.
>> I'd say that if there's a clock controller providing this clock, even if
>> it is implicit in the video feed it's good to have here. Being able to
>> increment the refcount on that clock would be good, even if you don't
>> actually control it manually?
> I don't expect there would be a clock controller to directly reference
> in most cases. It depends a bit on where the clock domain crossing
> between the source (often a CSI-2 receiver) and the ISP is. If it's
> implemented in glue logic bundled with the ISP, which wouldn't be
> described in DT as a separate node, then there's a higher chance we'll
> have a clock controller for vclk. If it's implemented in the source,
> vclk will just come from the source, which won't be listed as a clock
> controller.
>
> One option would be to make this clock optional, by moving it to the end
> of the clocks list, and setting
>
> 	minItems: 2
> 	maxItems: 3
>
>>>> +      - description: ISP AXI clock
>>>> +      - description: ISP AHB-lite clock
>>> These two other clocks look good to me.
>>>
>>>> +
>>>> +  clock-names:
>>>> +    items:
>>>> +      - const: vclk
>>>> +      - const: aclk
>>>> +      - const: hclk
>> Why not "video" "axi" "ahb-lite"? There's 3 useful letters between the
>> tree clock names you've provided - they're all clocks, so having "clk"
>> in them is just noise :)
> As far as I understand, the names proposed by Dan come directly from the
> IP core documentation.


This is the case, but I do take Conor's point that more descriptive names might be nicer - if I'm 
honest I just didn't think about it particularly given "Xclk" is such a common name for them 
already, but having been poked into thinking about it I do agree.

>

