Return-Path: <linux-media+bounces-40339-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B7FB2D3C4
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 07:55:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 512F6627918
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 05:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DAB42BDC14;
	Wed, 20 Aug 2025 05:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MaYnT4m0"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7895236124;
	Wed, 20 Aug 2025 05:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755669347; cv=none; b=DIjKHKQc9q51CPzQcFOhMnQuT800IIljPLfrAfbiA6fZVRSNXa/ykRoptm2ku2J9q0TK4xgQkkJIe8X3hN3Q1VfpoCeEmjjuMlTJrlpokq2bbeAbGKNDOGdLeS1cu8G97EIdwHtC0RdAd+nb3tp4hhmmJHULImmdXNejtmpdhwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755669347; c=relaxed/simple;
	bh=E0+N2wRZMXrF5z7DzstfXp7XFzQUZ047KHqMx/8n9/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SdqRqRnLnrVdCyVhnEt1wrEzPzIVMj2o1w0eqTRr15w7C+gkOGlUgActd0kBWLMrXzE+2YEZo3UB3jayrM61yv2gPo+uMwQkgtbzh5HL5wUxwIDJNGYDCNS14kJCz2YLdc+JGX9hk1te8Eg5q5CrHIw/ZJe4B/vcHvbZ/RwduEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MaYnT4m0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF70FC4CEEB;
	Wed, 20 Aug 2025 05:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755669346;
	bh=E0+N2wRZMXrF5z7DzstfXp7XFzQUZ047KHqMx/8n9/c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MaYnT4m0WN5eTjiALC52eebZA7CkBr3MIQgRikIjOLXsB1N/2HNI44GM7HjYB0eMO
	 35d8QG8sppzDG/FQA4DJ6YRhE7zFvBRcsPPnZFxLuWdKGqWLyfk+r4OETZLoOlbpU2
	 2I9MGCNJJBp0HStJczx2UvAveNeXt6dZLsH3ssUbSD5zn0zklCvyFEeAUI8LpglyA8
	 16AGF6zKHv0PlLhuPRhiuugUPQX/nNMUS0Cg1Y0gPf/zwP0PNIDRweRbQGDURyY1L+
	 2KOz61EailChCTvdMFzZtvnqRVGNJiYk8P9Amq95gVlQUL85iysu9N0n1aRha0lE14
	 YGCMqKkRc5l0Q==
Message-ID: <aab06f96-83c9-4e1c-9e1b-6148a3055e67@kernel.org>
Date: Wed, 20 Aug 2025 07:55:38 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] dt-bindings: media: Add MT8196
 mediatek,vcodec-encoder
To: =?UTF-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>,
 =?UTF-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?R2VvcmdlIFN1biAo5a2Z5p6XKQ==?= <George.Sun@mediatek.com>,
 =?UTF-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
 "andrzejtp2010@gmail.com" <andrzejtp2010@gmail.com>,
 "nhebert@chromium.org" <nhebert@chromium.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
 "nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
 =?UTF-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>,
 "sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "christophe.jaillet@wanadoo.fr" <christophe.jaillet@wanadoo.fr>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>,
 =?UTF-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?=
 <Andrew-CT.Chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>
References: <20250814085642.17343-1-kyrie.wu@mediatek.com>
 <20250814085642.17343-6-kyrie.wu@mediatek.com>
 <20250815-meek-porcelain-oarfish-1411e3@kuoka>
 <cff7beabdfce15b014597f6fbb0ea23375ecb902.camel@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <cff7beabdfce15b014597f6fbb0ea23375ecb902.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/08/2025 04:55, Irui Wang (王瑞) wrote:
> Dear Krzysztof,
> 
> Thanks for your reviewing.
> 
> On Fri, 2025-08-15 at 10:54 +0200, Krzysztof Kozlowski wrote:
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>
>>
>> On Thu, Aug 14, 2025 at 04:56:41PM +0800, Kyrie Wu wrote:
>>> From: Irui Wang <irui.wang@mediatek.com>
>>>
>>> Add MT8196 encoder compatible string, which will reference VCP
>>> device.
>>
>> You ignored comments from v2.
> 
> I think I misunderstood the v2 comments, I rewrote the title because it
> said dt-bindings and encoder twice, this is not enough, right? we need
> to describe more information in Body text?

where are lore links in the changelog? Why aren't you using b4 to submit
patches?

> 
>>
>>>
>>> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
>>
>> Incorrect SoB chain.
>>
>>> ---
>>>  .../bindings/media/mediatek,vcodec-encoder.yaml | 17
>>> +++++++++++++++++
>>>  1 file changed, 17 insertions(+)
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/media/mediatek,vcodec-
>>> encoder.yaml
>>> b/Documentation/devicetree/bindings/media/mediatek,vcodec-
>>> encoder.yaml
>>> index ebc615584f92..bb4dbf23ccc5 100644
>>> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-
>>> encoder.yaml
>>> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-
>>> encoder.yaml
>>> @@ -24,6 +24,7 @@ properties:
>>>                - mediatek,mt8188-vcodec-enc
>>>                - mediatek,mt8192-vcodec-enc
>>>                - mediatek,mt8195-vcodec-enc
>>> +              - mediatek,mt8196-vcodec-enc
>>>        - items:
>>>            - const: mediatek,mt8186-vcodec-enc
>>>            - const: mediatek,mt8183-vcodec-enc
>>> @@ -58,6 +59,11 @@ properties:
>>>      description:
>>>        Describes point to scp.
>>>
>>> +  mediatek,vcp:
>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>> +    description:
>>> +      Describes point to vcp.
>>
>> For what? You just repeated the property name. You must say here
>> something useful instead: why this is needed, what is its purpose.
> 
> I would like to say:
> "define this 'mediatek,vcp' property here, this is a phandle point to

Don't explain to us what DT is. Above is 100% redundant.

> vcp device, for platforms using vcp firmware."

Explain what is the purpose of this in hardware, how hardware uses it,
what problem for hardware this addresses.


> 
> Is this OK for you?
>>
>>
> 
>>> +
>>>    power-domains:
>>>      maxItems: 1
>>>
>>> @@ -76,6 +82,17 @@ required:
>>>    - iommus
>>>
>>>  allOf:
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            enum:
>>> +              - mediatek,mt8196-vcodec-enc
>>> +
>>> +    then:
>>> +      required:
>>> +        - mediatek,vcp
>>
>> else
>>
>> mediatek,vcp: false
> 
> I think the else statement is no need here. Different platforms are
> using different firmware phandle, vpu, scp, and vcp. so we use if-then
> to describe the required property for these platforms. 

Hm? I just told you it is needed. Otherwise, explain why each
variant/device has now VCP.

You have entire commit msg to explain all this.


Best regards,
Krzysztof

