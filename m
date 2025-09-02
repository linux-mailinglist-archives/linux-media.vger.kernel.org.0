Return-Path: <linux-media+bounces-41600-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 328D1B409CA
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 17:54:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A68D71B6406D
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 15:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A05A5334718;
	Tue,  2 Sep 2025 15:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SLFkjIu0"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3E632ED58;
	Tue,  2 Sep 2025 15:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756828427; cv=none; b=Hk0b+dWYXx99F2yO02koiP6AXfrgUZfgZk3CFQwi8yaTvyOiqb2OUaLRIw4HncJqwHqIfaXHUybiJ1b5EUnlA8qDBhk87C5JfMPX85Ld2Vmz0oz8U9CmbfJGNvzg0fFCKy4/jS9t6KUB/isCCVuwDaLMsKi9QRemqItcGX+Tj8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756828427; c=relaxed/simple;
	bh=DW2NCRd3COiQkXgoinnb8VcsKpxfxA3J84LepgCIijY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YGn+ymuln0hpK5anIIGKXys6Sknse7Md+VY9qqmI4WkXN7JI4VXip8knadhpYpByqPGjdVwhKgCcUsubjhkRi/CBeE5m5rKOKsyIh1Hkw29OLCuUsm/OO8tEGsvFIcA6IkAra/TXA+puWFK56tAdwrzbz+n+DMv/UGgCSHT6UeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SLFkjIu0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C24AEC4CEF5;
	Tue,  2 Sep 2025 15:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756828426;
	bh=DW2NCRd3COiQkXgoinnb8VcsKpxfxA3J84LepgCIijY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SLFkjIu0nlkv+0E5ucgkX15UP6BPezykAJeQSiMzD6O97KFko/gtX9bBDjlQdlBnG
	 7u7p4QjheiFDis7/nEGxsx2CfxdA28EoXnBcH6/puhT+B/Zdw9/z+rJskX5QFjGnYr
	 fwBosSzL6rnPg/AtiW9r3JbhKzW+7eiwg3Lro+VRdRXefriE90ztbLWtaVbyc3y3Yk
	 gpcoFelC7L9L9fEdY2byQSfW8rnYohisDzMBAcM2qvTbTGgtXbHBjSiIz87cWwobNz
	 WN1IUFXK4sLkqeKhW/N4wgb3dzffck/X5yaqKjd9jLuWGIw3/X8R57nfhWCuzzIC8Q
	 hBKBmZyClnR6Q==
Message-ID: <647fdf8a-835b-44d1-b0b8-a3d253a14787@kernel.org>
Date: Tue, 2 Sep 2025 17:53:39 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] media: dt-bindings: nxp,imx8mq-mipi-csi2: Add
 i.MX8ULP compatible string
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Frank Li <Frank.li@nxp.com>, Guoniu Zhou <guoniu.zhou@nxp.com>,
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>,
 Purism Kernel Team <kernel@puri.sm>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250901-csi2_imx8ulp-v5-0-67964d1471f3@nxp.com>
 <20250901-csi2_imx8ulp-v5-1-67964d1471f3@nxp.com>
 <20250901154610.GB13448@pendragon.ideasonboard.com>
 <aLZMQ7c8qr5XO88d@lizhi-Precision-Tower-5810>
 <20250902083554.GD13448@pendragon.ideasonboard.com>
 <7c461931-3b04-4354-a892-52f469511c5a@kernel.org>
 <20250902123524.GK13448@pendragon.ideasonboard.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250902123524.GK13448@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/09/2025 14:35, Laurent Pinchart wrote:
> On Tue, Sep 02, 2025 at 02:26:53PM +0200, Krzysztof Kozlowski wrote:
>> On 02/09/2025 10:35, Laurent Pinchart wrote:
>>>>>>          compatible:
>>>>>>            contains:
>>>>>>              enum:
>>>>>> -              - fsl,imx8qxp-mipi-csi2
>>>>>> +              - fsl,imx8ulp-mipi-csi2
>>>>>> +    then:
>>>>>> +      properties:
>>>>>> +        reg:
>>>>>> +          minItems: 2
>>>>>> +        resets:
>>>>>> +          minItems: 2
>>>>>> +          maxItems: 2
>>>>>> +        clocks:
>>>>>> +          minItems: 4
>>>>>> +        clock-names:
>>>>>> +          minItems: 4
>>>>>
>>>>> But according to this, the ULP version requires more clocks than the QXP
>>>>> version.
>>>>
>>>> If only clock number difference, generally, it is still compatible and can
>>>> be fallback, especialy driver use devm_bulk_clk_get_all().
>>>
>>> That's a driver-specific implementation decision, so I don't think it
>>> should be taken into account to decide on compatibility.
>>
>> The clock inputs do not restrict compatibility. If Linux can use
>> fallback to bind and operate properly, then it's a strong indication
>> devices are compatible.
>>
>> Imagine exactly the same registers, so same programming interface, but
>> one device takes one more clock which just needs to be enabled through
>> its lifetime. Such devices are fully compatible, even though clock
>> inputs differ.
> 
> That's only the case if someone enables the clock, isn't it ? From a DT
> binding point of view, how can we know that the extra clock will be

We talk about software using the binding in this particular case. Can
the software use fallback? Yes, it can.

> enabled by a component separate from the driver (in this case by the
> fact that the devm_bulk_clk_get_all() function gets all clocks) ?

If you go that way, only 100% identical devices are compatible.

> 
>> I also wanted to express exactly that case on my slides from OSSE -
>> slide 28:
>> https://osseu2025.sched.com/event/25Vsl/dts-101-from-roots-to-trees-aka-devicetree-for-beginners-krzysztof-kozlowski-linaro
> 
> Quoting that slide, you wrote
> 
> "Two devices are compatible when the new device works with Linux drivers
> bound via fallback (old) compatible".
> 
> That is clearly the case here for the existing *Linux* driver. But what
> if the driver called devm_bulkd_clk_get() with a device-specific list of
> clocks ? Or what if the same DT bindings are used on an OS that has no
> clk_get_all() equivalent ? This is my concern with declaring those two
> devices as compatible: they may be from the point of view of the current
> implementation of the corresponding Linux kernel driver, but DT bindings
> are not Linux-specific.

It seems you think of compatibility as new device is compatible with old
kernel, e.g. one not requesting that clock. We don't talk about such case.

> 
> Or do DT bindings assume that drivers have to always enable all clocks
> declared in DT, even if they don't know what those clocks are ? That
> seems error-prone, in quite a few cases drivers need to handle separate
> clocks in a device-specific way, with for instance a particular
> ordering, preventing them from using devm_bulk_clk_get_all(). If all
> drivers are required to manage all clocks declared in DT, this would get
> messy quite quickly.
> 
I don't really want to dive into such specifics, because it is
impossible to create a generic rule of out. We decide here about
programming interface mostly. Can Linux use the one from fallback-device
to properly operate the new one? Can the same driver bind to fallback
and operate the new device?

If you enable clock by clock for whatever reason, e.g. very specific
programming power up sequence, then answer would be: no, Linux cannot
use fallback because handling clocks differ.

Best regards,
Krzysztof

