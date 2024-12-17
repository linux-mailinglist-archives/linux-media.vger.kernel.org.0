Return-Path: <linux-media+bounces-23533-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8711F9F4305
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 06:37:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 72F647A228C
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 05:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8F09155393;
	Tue, 17 Dec 2024 05:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b3P9zts9"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4161320B22;
	Tue, 17 Dec 2024 05:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734413826; cv=none; b=JMnZl66BGGg3axLUDy0toAmiLpsK25pQ9cE0JMCOHr0Nc3VLvSzI+qViWoIn48CiWg7np1mxpOHfXg/jLgx1szxi+XXIhkDGTmTGACEJzWxwwHC4fTs3V44c3H942SAy7ETq+6HWxyuhitFvQ2y9LqjficPlfxriPiOn0Ez5Aa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734413826; c=relaxed/simple;
	bh=543aNxMOvEVhXnG+s33Aztp+CppKhoHGZquTsZDNNK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f6ET7F/PdlO1J+7TKTa64Yut9gzGb3MCuEDDlDinwJ32z+lQ1vtS61DfHoDrrbRpk/iEX9jw4CWEwt9m3BU74uiWp5ENjxlYO9Lr9V6D0lNk4kBAiJKJgbGwrJzzoo6Y1zhoCcDLAxvPDItDx0WnTk6bg2BJuAYUy5Vx0p3V+W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b3P9zts9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9046AC4CED3;
	Tue, 17 Dec 2024 05:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734413825;
	bh=543aNxMOvEVhXnG+s33Aztp+CppKhoHGZquTsZDNNK0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b3P9zts9U9/LTFCmpcXeEIAtntOebfr4+7PsWErlvBQyua2y8ttol7uKmf/CPuJiv
	 kEqAOuP72aXHpGGvH2h+5pzcpLxGmD2JrPCNB2d0i5yk58bqbQCECDUGBjh8ZZ7wBC
	 XXdTxAShkIA4gUeB0p/N0lFku+wBHYtyqmChmkBxHbHKNQ2Uf0VWxJLC4d7h+kQuxo
	 TqeSz6k9Py3bzOgXHkf2NwZq11v5oGCJgmiI2DqwIrT5Joxw5meBoCxH+MiyuVTciq
	 iqTtrTgkebzafUhXlw+AQmQ8OFSu9WdN0ZkDYYcVh5PFquHO+46SzNwv+Yhlfw86vi
	 Clebg+QhhUVUw==
Message-ID: <989ea1b0-fd15-4279-bf6d-36cc78831015@kernel.org>
Date: Tue, 17 Dec 2024 06:36:57 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/5] dt-bindings: display: tegra: Add actmon
 information
To: Johnny Liu <johnliu@nvidia.com>
Cc: airlied@gmail.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jonathanh@nvidia.com, krzk+dt@kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-tegra@vger.kernel.org, luca.ceresoli@bootlin.com,
 maarten.lankhorst@linux.intel.com, mperttunen@nvidia.com,
 mripard@kernel.org, robh@kernel.org, simona@ffwll.ch,
 skomatineni@nvidia.com, thierry.reding@gmail.com, tzimmermann@suse.de
References: <262c8d8f-f53c-455b-9bca-3440afb7bcd6@kernel.org>
 <20241217010806.15703-1-johnliu@nvidia.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20241217010806.15703-1-johnliu@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/12/2024 02:08, Johnny Liu wrote:
>> On 14/12/2024 00:29, Johnny Liu wrote:
>>>> On Tue, Dec 10, 2024 at 09:45:50AM -0800, Johnny Liu wrote:
>>>>> An activity monitor (actmon) is used to measure the device runtime
>>>>> utilization to help drive software power management policies.
>>>>>
>>>>> Extend the reg space to include actmon aperture for actmon configuration
>>>>> through host1x.
>>>>
>>>> We kind of see that from the diff. Say what we do not see, e.g. ABI
>>>> impact or why this is flexible/optional for existing devices.
>>>
>>> Since actmon is not well-supported for the previous chips (e.g. T210,
>>> T186, T194, and etc) in this patch series, it's essential to make the
>>> specification of regs property optional for the previous chips.
>>
>> Then your schema should express it.
> 
> Could you explicitly point out which part doesn't express it well?
> 

You said it should be optional for previous chip, while this is not made
optional for previous chips. You made it optional for newest chips.


> Considering old variant T194, the schema in this patch already made the
> specification of actmon related properties optional.
> 
> If users specify actmon clock handle in clocks/clock-names properties:
> 
>  host1x@13e00000 {
> 	 compatible = "nvidia,tegra194-host1x";
> 	 // ...
> 	 clocks = <&bpmp TEGRA194_CLK_HOST1X>,
> 		  <&bpmp TEGRA194_CLK_ACTMON>;
> 	 clock-names = "host1x", "actmon";
> 	 // ...
>  }
> 
> Running the dtbs_check will report error WITHOUT this patch will have
> the following error:
> 
> $ make O=out ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
> 
> /out/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dtb: host1x@13e00000: clocks: [[5, 46], [5, 1]] is too long
> /out/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dtb: host1x@13e00000: clock-names: ['host1x', 'actmon'] is too long

This is not the meaning of word "optional".

> 
> 
>>>
>>> Enablement/Disablement of actmon won't affect the host1x main functionality.
>>> Its main job is to monitor the engines behind the host1x and serve for
>>> telemetry purpose.
>>>
>>> I could update the commit message to include the above reason. Please
>>> let me know if more information is required.
>>
>> And fix the schema to make it optional only for older variants.
> 
> To maintain backward compatibility, shouldn't we keep the newly added
> feature optional for all the variants?

Yes, but it is about driver. Is it optional in the driver?

Your binding says optional but driver says required and will fail. This
does not make any sense in the context of this patch and even less in
the context of your explanation.


Best regards,
Krzysztof

