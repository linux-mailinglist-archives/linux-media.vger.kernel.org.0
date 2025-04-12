Return-Path: <linux-media+bounces-30074-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD64DA86C66
	for <lists+linux-media@lfdr.de>; Sat, 12 Apr 2025 12:13:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B653B1B8199A
	for <lists+linux-media@lfdr.de>; Sat, 12 Apr 2025 10:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 992201C84A6;
	Sat, 12 Apr 2025 10:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wfl4QIQz"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB30D4C8F;
	Sat, 12 Apr 2025 10:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744452815; cv=none; b=IccPL8gl6EmCEAQU0frmb+qFGIcd+pgmTYaw98sMokxiKHe+KlR6iwb0XaYLdBNlSY2maY8lUBk0zS+8K+ITPI4zbmpP3j2k8ieNGFanl9YLF1jzr+y8G4uoNptSgJcOlVcQ/y7YBEqpLb4s3RaF8dQiCZax/veWFQh1HXU81lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744452815; c=relaxed/simple;
	bh=hdx7dilpviHAvfEHdp6u08ropQkeLaHjQudkCe/Si8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LEkmCSmXhQsfGx2KpNjB43dLYsYFMoHnWONP9KoZMStJM9P4jy8IxugodDFZjYmeG9Na1/onNQ3+1dp4x119aUrqjsYUVzgNwKUMcNRaC06sNk58b1JdwMHIngxX0g8gFp3lzCFm9L427uUytZ6cAxI6rDyy1H5sBkEwi9FTg5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wfl4QIQz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44E0EC4CEE3;
	Sat, 12 Apr 2025 10:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744452814;
	bh=hdx7dilpviHAvfEHdp6u08ropQkeLaHjQudkCe/Si8c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Wfl4QIQza6CjnvtazfAP38NucKldwu6LU2YpvL+QDNN/qFFc2CFpc0KedCU+q9hmF
	 si5Vgbm41aVb1oBcdtCyo9uR3gfl9pE2uWrH7eh6oRdjUfOEzAimI36UuAKKCRpY9/
	 h75xxcZvNEQ2EifeaCgKaKjcuSu1GCuBDxHMuYC9dg9wJGMiToZsZLsHJ+ToidQYtw
	 CXGRrmCLmPIDs/dejyGLHUWo0tqmMqOH3DaHVyWxcFKvJST5J9+1JL9pfeALBCE79w
	 UhhuFZYJ3mFGh6XM4BrwPS98e8M/a/lEsOpExQeX/4ScJ9TzhyIWc0ohUGU+HV0M/H
	 QN8ddxACQwxZg==
Message-ID: <9714498c-6d89-4e1c-87dc-1b6779e913e1@kernel.org>
Date: Sat, 12 Apr 2025 12:13:29 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/12] dt-bindings: mediatek: Add mediatek,
 mt8196-jpgdec compatible
To: =?UTF-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "kyrie.wu@mediatek.corp-partner.google.com"
 <kyrie.wu@mediatek.corp-partner.google.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20250410063006.5313-1-kyrie.wu@mediatek.com>
 <20250410063006.5313-2-kyrie.wu@mediatek.com>
 <20250410-wandering-righteous-hound-ac5edd@shite>
 <b4745bd99e28cf90581320f8ddb591f76b1c91b9.camel@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <b4745bd99e28cf90581320f8ddb591f76b1c91b9.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/04/2025 04:54, Kyrie Wu (吴晗) wrote:
> On Thu, 2025-04-10 at 08:39 +0200, Krzysztof Kozlowski wrote:
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>
>>
>> On Thu, Apr 10, 2025 at 02:29:54PM GMT, kyrie.wu wrote:
>>> Add mediatek,mt8196-jpgdec compatible to binding document.
>>>
>>> Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
>>
>> Usual mediatek comment - looks like copy paste of username. Please
>> reach
>> to your colleagues how to fix it.
> 
> Dear Krzysztof,
> 
> Do I need to change the username like that: Kyrie Wu <
> kyrie.wu@mediatek.com>?

And what did your colleagues say? Please use Mediatek resources prior
asking community for review.

> 
> Thanks.
>>
>>> ---
>>>  .../bindings/media/mediatek,mt8195-jpegdec.yaml           | 8
>>> ++++++--
>>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/media/mediatek,mt8195-
>>> jpegdec.yaml
>>> b/Documentation/devicetree/bindings/media/mediatek,mt8195-
>>> jpegdec.yaml
>>> index e5448c60e3eb..28a9a9bfdbf8 100644
>>> --- a/Documentation/devicetree/bindings/media/mediatek,mt8195-
>>> jpegdec.yaml
>>> +++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-
>>> jpegdec.yaml
>>> @@ -14,7 +14,9 @@ description:
>>>
>>>  properties:
>>>    compatible:
>>> -    const: mediatek,mt8195-jpgdec
>>> +    enum:
>>> +      - mediatek,mt8195-jpgdec
>>> +      - mediatek,mt8196-jpgdec
>>
>> And devices are not compatible?
> 
> Sorry, I don't understand the question exactly. Do you mean using the
> compatible string of MT8195 for both MT8195 and MT8196?

No, expressing compatibility with fallbacks or explaining in commit msg
the hardware, e.g. why these are not compatible.


Best regards,
Krzysztof

