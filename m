Return-Path: <linux-media+bounces-23584-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D54C89F4B43
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 13:52:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDE4F16F4C8
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 12:52:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 842A71F3D39;
	Tue, 17 Dec 2024 12:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GQRHhQWM"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99F61F03DE;
	Tue, 17 Dec 2024 12:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734439922; cv=none; b=aU8ceZ8rLr6graYVA/mCPGUTjrkZL6qVuvDUQJkZt5eW8Rc1DE0/a5AA+OpFSzppNEtFIBDpg3TosG4jYqEqB8XyNJYHmihofbXkeEgdtSHhOQDz+a2/4NLRLBLwQnrcjRj6IyHnFJqCSTsp5onF7OdWdaLbOq4pOL2m0P3o7hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734439922; c=relaxed/simple;
	bh=I4FYDTyNIY5gLD94sPXnPj1vxlnXjSPz9Qn4hsE2jSQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P4TW/To3trLlA/Tf7qjeHp0ey3egM45VYMARzfHDj7l6x8pmd1qjnvHUBgnHE/V1ZQMzX1x0EekQmsUXTljinRqTtesDZ1a1Kjg2p/EOQQ5chOghpUZbKckxCfw+gA3aFYNzvefFvrZbqnkLp9SQQ5gc7ACg1wmxSIH99Tfzg3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GQRHhQWM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F23DBC4CED3;
	Tue, 17 Dec 2024 12:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734439921;
	bh=I4FYDTyNIY5gLD94sPXnPj1vxlnXjSPz9Qn4hsE2jSQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GQRHhQWMW2uHtCkjGCYFzAeppw/VMonWtunESwK28Ev+9IAgvTlxZbA8x1JTruyF9
	 /wZtTBRZOaphsEBHjBwmefuLtcPn/Um4lLU1XB51YIvMkO2nt/GevXrDaaQunCJhuV
	 9V9h5x5AtmoLiC96KRCny20dl2oaflP/vwyyXE47Ptm8Gdh7PxQWuob0RVYYsDsei2
	 yQuUL0gz39n6sWdLFBP9GIETXPrwAuqNU+OjHw3PMU9RZWoi2xD5gYBosz70ZRXd7j
	 HrBAiECpCOQFFG/9BO2+alHGWBi4tOCtP1iJSOooTfHGIOqHnQNX78WvPvWtfXx9UY
	 DlKEEnwLlZzJQ==
Message-ID: <7e50e257-9e13-4d32-8de9-8deb53fd30e4@kernel.org>
Date: Tue, 17 Dec 2024 13:51:54 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/8] dt-bindings: media: platform: visconti: Add
 Toshiba Visconti Video Input Interface
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: yuji2.ishikawa@toshiba.co.jp, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil-cisco@xs4all.nl, nobuhiro1.iwamatsu@toshiba.co.jp,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
References: <20241125092146.1561901-1-yuji2.ishikawa@toshiba.co.jp>
 <20241125092146.1561901-3-yuji2.ishikawa@toshiba.co.jp>
 <04a7ebf7-2924-4894-bc53-ba77e2f64fae@kernel.org>
 <TY3PR01MB99822E6161ED319B4DE855B492042@TY3PR01MB9982.jpnprd01.prod.outlook.com>
 <d5294015-4790-490e-8136-615039a5c733@kernel.org>
 <20241217094508.GD11445@pendragon.ideasonboard.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20241217094508.GD11445@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/12/2024 10:45, Laurent Pinchart wrote:
> On Tue, Dec 17, 2024 at 06:43:22AM +0100, Krzysztof Kozlowski wrote:
>> On 17/12/2024 01:00, yuji2.ishikawa@toshiba.co.jp wrote:
>>> Hello Krzysztof
>>>
>>> Thank you for your review
>>>
>>>> -----Original Message-----
>>>> From: Krzysztof Kozlowski <krzk@kernel.org>
>>>> Sent: Monday, November 25, 2024 7:08 PM
>>>> To: ishikawa yuji(石川 悠司 ○ＲＤＣ□ＡＩＴＣ○ＥＡ開)
>>>> <yuji2.ishikawa@toshiba.co.jp>; Laurent Pinchart
>>>> <laurent.pinchart@ideasonboard.com>; Mauro Carvalho Chehab
>>>> <mchehab@kernel.org>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
>>>> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Sakari Ailus
>>>> <sakari.ailus@linux.intel.com>; Hans Verkuil <hverkuil-cisco@xs4all.nl>;
>>>> iwamatsu nobuhiro(岩松 信洋 ○ＤＩＴＣ□ＤＩＴ○ＯＳＴ)
>>>> <nobuhiro1.iwamatsu@toshiba.co.jp>
>>>> Cc: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org;
>>>> linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org
>>>> Subject: Re: [PATCH v12 2/8] dt-bindings: media: platform: visconti: Add
>>>> Toshiba Visconti Video Input Interface
>>>>
>>>> On 25/11/2024 10:21, Yuji Ishikawa wrote:
>>>>> Adds the Device Tree binding documentation that allows to describe the
>>>>> Video Input Interface found in Toshiba Visconti SoCs.
>>>>>
>>>>> Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
>>>>> Reviewed-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
>>>>
>>>> Why this tag stayed and other was removed? What was the reason of tag
>>>> removal?
>>>>
>>>
>>> The stayed tag is due to internal review.
>>
>> Did the internal review really happened? How is it that immediately new
>> version has internal review without any traces?
>>
>> I have doubts this review happened in the context of reviewer's
>> statement of oversight.
>>
>>> The removed tag is due to code's change (split of csi2rx part) after the last review.
>>> If the code is largely changed following the instruction of another reviewer
>>> after obtaining the tags, how should the tags be handled?
>>
>> Drop all reviews and perform reviews on the list.
>>
>> Such internal review appearing afterwards is rather a proof it you are
>> adding just the tags to satisfy your process. I have no way to even
>> verify whether that person performed any reasonable review or maybe just
>> acked your patch.
> 
> How do you verify that for public reviews ?

By quality or amount of comments. Or timing. Or reviewing cover letter
without any feedback on individual patches.

There are many, many ways. Considering how many companies were adding
fake manager-review-tags in the past (or fake SoBs), I am pretty picky
on that.

Best regards,
Krzysztof

