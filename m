Return-Path: <linux-media+bounces-32860-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F79ABCF4C
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 08:29:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 348E78A127E
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 06:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9AB925CC58;
	Tue, 20 May 2025 06:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gNJh2BrK"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C6925EF8B;
	Tue, 20 May 2025 06:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747722434; cv=none; b=R9XtnFwbzlOsX9kofwDh8kE2gJdixw7W1+qtEjT9wP7gz7GBAB2pIVYnP3gxivcsxnV/RBl1vU2qFVdSI8h6hxJNVZdCLVxxZmPmGl/a+TASVGFFPtkXwSu4xL0FWsgxGuqizpaGYsnto+TJ5QCWHwBJ4q6kUxEcBer7QP9EgDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747722434; c=relaxed/simple;
	bh=zP6SDHTIuKSL2ym0vtEEnrQ7j+shMIs+JbhfY6qCzvc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vES78QETTcvrHVngGomgqKV3E661+RxwFYcSemQDOuS1OJva0J1kNmiZKYLWsWxtQSq+71oEhZ0/QJdiXLYlxVK+UMk/myog8yMgYYL7frSTgob4sIlQT5+y+z1uQDtdVlx4mUUguMN4RpnH163+gx3aAnKM+MdO4UQK69LI79w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gNJh2BrK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7690C4CEEF;
	Tue, 20 May 2025 06:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747722433;
	bh=zP6SDHTIuKSL2ym0vtEEnrQ7j+shMIs+JbhfY6qCzvc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gNJh2BrKsRrCE1lUH4HyJPqdUV60P6z2FdarI0T4xyW3sDJZPvIRI1EeRZV6akljn
	 HkLJ/LBR0tGS8OonknGDd/R/D02qEy11CsvLOPso5LRAYH2fiCERMEI64Aug0aQrHw
	 tM/N67BDthBLMGisgPm9VnAKdK//Hzbh/232IGbNOzAxqWPNfaK+aziiISuwuZF4/A
	 49fghvE8Xxp8V3/J0eT/x9Kt59fK7kviOSINzlAmpA9RsqnZwEpYW2OJcXTc7jf8Ia
	 Qmn+v8w7JWV+Dvp9utA46SYRzi6HaZdg37CMEMrvz6GlgftSLOJ4rnJ5xNFaTivy01
	 2h8U5tGU03b7A==
Message-ID: <f9eb4322-cf6f-445d-8ba8-39182325ca4e@kernel.org>
Date: Tue, 20 May 2025 08:27:09 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] dt-bindings: media: nxp: Add Wave6 video codec
 device
To: Nas Chung <nas.chung@chipsnmedia.com>
Cc: "mchehab@kernel.org" <mchehab@kernel.org>,
 "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, "robh@kernel.org"
 <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>, "marex@denx.de" <marex@denx.de>,
 "jackson.lee" <jackson.lee@chipsnmedia.com>,
 "lafley.kim" <lafley.kim@chipsnmedia.com>
References: <20250422093119.595-1-nas.chung@chipsnmedia.com>
 <20250422093119.595-3-nas.chung@chipsnmedia.com>
 <20250425-romantic-truthful-dove-3ef949@kuoka>
 <SL2P216MB124656A87931B153F815820BFB8AA@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
 <f1073f21-0885-486f-80c8-00f91dfd7448@kernel.org>
 <SL2P216MB1246002B8EFD5CBE69E447ACFB96A@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
 <cafba18a-5391-4d9d-aa4c-2f06f93af0f8@kernel.org>
 <SL2P216MB1246B1DA93D85C1536476D74FB9CA@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <SL2P216MB1246B1DA93D85C1536476D74FB9CA@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/05/2025 07:08, Nas Chung wrote:
> Hi, Krzysztof.
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzk@kernel.org>
>> Sent: Friday, May 16, 2025 9:56 PM
>> To: Nas Chung <nas.chung@chipsnmedia.com>
>> Cc: mchehab@kernel.org; hverkuil@xs4all.nl; sebastian.fricke@collabora.com;
>> robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org; linux-
>> media@vger.kernel.org; devicetree@vger.kernel.org; linux-
>> kernel@vger.kernel.org; linux-imx@nxp.com; marex@denx.de; jackson.lee
>> <jackson.lee@chipsnmedia.com>; lafley.kim <lafley.kim@chipsnmedia.com>
>> Subject: Re: [PATCH v2 2/8] dt-bindings: media: nxp: Add Wave6 video codec
>> device
>>
>> On 13/05/2025 09:39, Nas Chung wrote:
>>>>
>>>> All of above are wrong for the SoC...
>>>>
>>>>>
>>>>>         #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>>>         #include <dt-bindings/clock/nxp,imx95-clock.h>
>>>>>
>>>>>         soc {
>>>>>           #address-cells = <2>;
>>>>>           #size-cells = <2>;
>>>>>
>>>>>           vpu: video-codec {
>>>>>             compatible = "nxp,imx95-vpu", "cnm,wave633c";
>>>>
>>>> What does this device represent? It is not "ctrl", because you made ctrl
>>>> separate device node. Your binding description suggests that is the VPU
>>>> control region.
>>>
>>> My intention was to represent the MMIO VPU device, which includes
>>> both the core and control nodes.
>>
>> Then what is the VPU device if not CTRL? What is the CTRL device?
> 
> The VPU device represents the entire VPU hardware block,
> which includes 1 CTRL component(node) and 4 CORE components(nodes).

What is entire VPU hardware block?

> 
> The CTRL device represents the VCPU, a 32-bit processor embedded within the
> VPU hardware block. This VCPU is responsible for executing the VPU firmware.
> The CTRL device is in charge of tasks such as firmware booting, power management
> (sleep and wakeup command), and managing memory regions that are exclusively
> accessed by the firmware.

This sounds like CTRL is responsible for entire VPU block. What are the
tasks of VPU block then? What are its registers? What is that device
exactly doing?

You keep repeating the same, so my initial idea - CTRL is not a separate
block - still stands. Can you have more CTRL blocks than one?

Best regards,
Krzysztof

