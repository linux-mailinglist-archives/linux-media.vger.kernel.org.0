Return-Path: <linux-media+bounces-28392-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EA181A66B92
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 08:27:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04416189A1CE
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 07:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09FC01EF362;
	Tue, 18 Mar 2025 07:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WDFyaPVG"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA511A08A8;
	Tue, 18 Mar 2025 07:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742282864; cv=none; b=PPkjQMXLI6KlcvhajJ8RygIKnTRlVDHB8Z4Uw/PxkGEX337fATTL3mw1GN9KiRnpXFTUZDxVS2InI53Ps3Qk7NcvhhV/ii4bvSGvYXdQGA+z0oV+021AM/dJVhQ3YQxWN+8Z052dRKu8fU+B6OlN3OHo+NhQoeldNm/YT5pvznc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742282864; c=relaxed/simple;
	bh=LD6D/fUK6vuH/GD8DCKxkLu8RTp2JZwsSqgWYZh7hpc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D/fWub3R7S+C5FTUF1hwTGTJ+CUKHT4JD1me5n1gtxwu4CenEcfp+viB80jh6Dp5MYEnk6z4hyhB/rc/L2QwGvrq+KepMgHCVt+MqLMJp7TY/LMCzsiecWnUmE62omJuuUo6CulgyWtI0XH5+GCfhiDZqow6wtc5/TBQFzkVejQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WDFyaPVG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A493C4CEDD;
	Tue, 18 Mar 2025 07:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742282862;
	bh=LD6D/fUK6vuH/GD8DCKxkLu8RTp2JZwsSqgWYZh7hpc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WDFyaPVGzvHMilLAt47cjoHTyC9Wm0uxr4aeVi/mbQhW6j0M/ohPt7dMPqt1NNMl/
	 4jVWKcDmuo/gHn9KStefm8faq/YmcG2uJgP6vkQNNgcuTIqoNdTXUFleLekiodpOJR
	 OPD2I97tqWcVcGUAm+5D80Fv5nENj97Yn1wmGSYZkPTup1hNOKM6Po7CKp3C+Oy/oH
	 rZGLckGaVAoGgkvmUMrZYY34vtfvYfa0htfdhEVOFa7xluiznciDj5IjT9z9A2RsWN
	 ih4PUkqDgFTFsiAebpglSXEBx9giOf+DnB1HCY9vabRFss4vUBWBvmN0ri2WKks+VJ
	 Fyy3cIJ76Xs7Q==
Message-ID: <4134b49c-f3f2-4b46-bf2c-52986fca265f@kernel.org>
Date: Tue, 18 Mar 2025 08:27:36 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] dt-bindings: media: renesas,isp: Add ISP core
 function block
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20250315152708.328036-1-niklas.soderlund+renesas@ragnatech.se>
 <20250315152708.328036-2-niklas.soderlund+renesas@ragnatech.se>
 <20250317-merry-ringtail-of-competition-7d46fb@krzk-bin>
 <20250317114904.GA868399@ragnatech.se>
 <573bb90b-bada-4dde-b88a-f92db1d1a3d1@kernel.org>
 <20250317153406.GB919085@ragnatech.se>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250317153406.GB919085@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/03/2025 16:34, Niklas Söderlund wrote:
> SoCs. I know it's confusing and not logical but that's how they are 
> made.
> 
> - One part is the ISP Channel Selector, this is a function that sits on 
>   the CIS-2 receiver data bus. It is responsible for selecting which 
>   CSI-2 Virtual Channel is routed to which DMA capture engine.
> 
>   This part is what the rcar-isp.ko driver have always supported and 
>   every instance of the ISP that is described in tree deals with just 
>   this one function as this is the one we always had documentation for.
> 
>   This block is the one the reg-names and clock-names labels "cs".
> 
> - One part that we now wish to add is the ISP Core. This is a 
>   traditional ISP that act on image data in different ways. This is what 
>   I try to model with the reg-name and clock-name labeled "core".
> 
>   This is new and we have not had documentation for this until recently.  
>   Unfortunately the "core" and "cs" functions is implemented in the same 
>   IP block. And to operate the "core" one needs to also deal with "cs".  
> 
> To make it more interesting all ISP Channel Selectors (cs) do not have a 
> companion ISP Core, but most do. The lack of a ISP core is OK, it just 
> means that video capture path can't manipulate the image as much as 
> paths that do.
> 
> It's not ideal but to support the ISP Core and ISP Channel Selecotr the 
> rcar-isp.ko module needs both "core" and "cs" clocks and regs. And to 
> support just the Channel Selector it only needs the "cs" resources.
> 
> 
> Sorry if I have been confusing. A good example of this is patch 4/7 in 
> this series. It shows the V4M board that have 2 ISP instances, one that 
> have both cs and core functions, and one that only have cs function.

Based on this I think the instances with ISP core are not the same
hardware as instances without. You have there different (new)
programming model for entirely new part of hardware not present in "old"
instances.

Different device means different compatible.

And judging by the address:
reg = <0 0xfed00000 0 0x10000>, <0 0xfec00000 0 0x100000>;
1. 0xfec0 < 0xfed0
2. Huge address range

that's not "renesas,r8a779h0-isp" at all, but your old "ISP" device is
actually a part of that 0xfec0_0000.

Probably the channel selector should have never been called "ISP"
because it does not process images. :/

> 
>>
>> What is this ISP core responsible for inside Renesas ISP? How many ISPs
>> are inside of SoC?
> 
> The ISP core is responsible for image manipulation. ISP Channel Selector 
> for CSI-2 channel routing. The number of ISP varies between SoCs:
> 
> 
> V3U: Have 4 ISP instances, all 4 have cs and core.
> V4H: Have 2 ISP instances, both have cs and core.
> V4M: Have 2 ISP instances, one have cs and core, one have only cs.


Best regards,
Krzysztof

