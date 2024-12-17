Return-Path: <linux-media+bounces-23537-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 101F59F4320
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 06:45:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A68C3188C59E
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 05:45:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8A23158A13;
	Tue, 17 Dec 2024 05:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ol/E2pG4"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1A6155CBA;
	Tue, 17 Dec 2024 05:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734414306; cv=none; b=Jnbd0N0CES5niGxgJ8kyWWhb1Urp23mDPGWiQs3Rt/qvk2sSKGm5EgyXeKUUDBggf5qhX0elszzIB3aUC3XDwwb2exrCoWgtpufO5Xu5UBX1yiWsEvopp9cbVbK83zjCrupyrnWlDWOV8xjQ06feBjLPRGOUyzxc9Lz+tfcflGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734414306; c=relaxed/simple;
	bh=MWgm0EeRQAos7JU2TgGxbz8jam6Pi3oYixsMVuEC75o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ghxQnet938Mp6zOpnF2AGBL9UU3UHVnbvEtMRfvVVZTkol6LcMGAWRKRDPTTw6B5elLBi3saABWubeOjD5S5OxsGkz6v+BSL2UnX5catqxuY+O9qxOnmMC3kYL3peLqUojjn4kNG9xX/9LweAbiAiLC7H0Woe+DReLgL+zUTIs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ol/E2pG4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 175A3C4CED3;
	Tue, 17 Dec 2024 05:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734414305;
	bh=MWgm0EeRQAos7JU2TgGxbz8jam6Pi3oYixsMVuEC75o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ol/E2pG4cjvTjNc7GRmqThIz38eNwlF7Knrm2OLb6rVTiDYZxdQTk6yVVGsRnCYbF
	 3/dZQ2sih6n4Bwz7aN7EV6c6BanPrIKxFUGPFr9C3YtefzsNsDcy5UberetYQqDFEs
	 NrXkmm6/cJZ0uqetT7WwiHux0zaB8r2LA6Af5/Js8K/n/xZDJ9kNLPPtsKBgtvIFth
	 a90T6wbDpM24fKnzidZtTKKyA1B2v1J/jSj3JOzXD6ZhiD7aiLhDVVzCkSjEv06qM0
	 vEUrBjC9W0aR39t3wbfgovHMLhV/Ty+IFuuh8M/KMKr5J5UE1eUosBThLpSjIW1vwF
	 pcq8JD3XPacuA==
Message-ID: <cb6be804-1649-4d17-839c-fe58a39baa1d@kernel.org>
Date: Tue, 17 Dec 2024 06:44:58 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 1/8] dt-bindings: media: platform: visconti: Add
 Toshiba Visconti MIPI CSI-2 Receiver
To: yuji2.ishikawa@toshiba.co.jp, laurent.pinchart@ideasonboard.com,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
 nobuhiro1.iwamatsu@toshiba.co.jp
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
References: <20241125092146.1561901-1-yuji2.ishikawa@toshiba.co.jp>
 <20241125092146.1561901-2-yuji2.ishikawa@toshiba.co.jp>
 <07e0cc97-c0c4-42fd-b51d-87b0eaed4e4a@kernel.org>
 <TY3PR01MB9982FE7739FABB2275C79C0B923B2@TY3PR01MB9982.jpnprd01.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <TY3PR01MB9982FE7739FABB2275C79C0B923B2@TY3PR01MB9982.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/12/2024 00:57, yuji2.ishikawa@toshiba.co.jp wrote:
>> On 25/11/2024 10:21, Yuji Ishikawa wrote:
>>> Adds the Device Tree binding documentation that allows to describe the
>>> MIPI CSI-2 Receiver found in Toshiba Visconti SoCs.
>>>
>>> Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
>>> Reviewed-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
>>
>>
>> How newly added patch can have already Rb tag? Was this review really, really
>> performed internally or you just satisfy some internal managers requirements
>> and fake the stats?
>>
> 
> I added this Reviewed-by tag because the patch was reviewed internally.


What issues were identified by internal review, especially in the
context of bindings?

> 
>>> ---
>>>
>>> Changelog v12:
>>> - Newly add bindings for CSI2RX driver
>>>
>>>  .../media/toshiba,visconti5-csi2rx.yaml       | 104
>> ++++++++++++++++++
>>>  1 file changed, 104 insertions(+)
>>>  create mode 100644
>>> Documentation/devicetree/bindings/media/toshiba,visconti5-csi2rx.yaml
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/media/toshiba,visconti5-csi2rx.yam
>>> l
>>> b/Documentation/devicetree/bindings/media/toshiba,visconti5-csi2rx.yam
>>> l
>>> new file mode 100644
>>> index 000000000000..5488072bc82a
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/media/toshiba,visconti5-csi2rx
>>> +++ .yaml
>>> @@ -0,0 +1,104 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
>>> +---
>>> +$id:
>>> +http://devicetree.org/schemas/media/toshiba,visconti5-csi2rx.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Toshiba Visconti5 SoC MIPI CSI-2 receiver
>>> +
>>> +maintainers:
>>> +  - Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
>>> +
>>> +description: |-
>>
>> Drop |-
>>
> 
> I'll drop "|-"
> 
>>> +  Toshiba Visconti5 SoC MIPI CSI-2 receiver device receives MIPI
>>> + CSI-2 video  stream. Use with VIIF device. T.B.D
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: toshiba,visconti5-csi2rx
>>
>> Why this is called "RX"? Can you have a TX? I had impression that one cannot.
>>
> 
> VIIF has only MIPI CSI2 receiver (CSI2RX). There's no TX for it.

So this device cannot be anything else? Then drop rx.

> Visconti also has VOIF (Video Output Interface) hardware which has MIPI CSI2 (not DSI) transmitter (CSI2TX).

Or this can be something else? Confusing.



Best regards,
Krzysztof

