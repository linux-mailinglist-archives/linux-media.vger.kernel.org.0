Return-Path: <linux-media+bounces-49048-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA7ECCA88D
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 07:49:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 417413076A08
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 06:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEF1920311;
	Thu, 18 Dec 2025 06:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ADKrIknU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33ED21E5B88;
	Thu, 18 Dec 2025 06:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766040434; cv=none; b=KVTAkUx25/CHQ0G6RyULGfUiiui7aN1HSc0sIRlkBQgEjY59Noypb7BPKchw8eAWKU7/UoXfH69b7JV3kfnUWwv6hxIQ4+zuQOS7KabMPssPhQqk/xTZDXwZj8DkE+GMt3bNcPHRLuYDxGz/6xyGT4jf8BOJ5PEhvKC3jfOWrM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766040434; c=relaxed/simple;
	bh=uN2lhfHr1fTJC5wzLnMklkWDJtjXEyGbnW+303REKLU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=b+XKzd+hl3BYXYJytwnfyUnCOqjaPjagKMetHoluI2TqRdDr4KJTt5j97+nt06e8yIpdN2vHZwrbwxRVa6IC9U2zUnAFfqonO4P0OS1T4lz5vTn/nH+rg+EBmQPLSYP0555nHn4/FM+aCTaKHbaMf6kbUeevkmMU9fgmEG1T5fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ADKrIknU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FF86C4CEFB;
	Thu, 18 Dec 2025 06:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766040433;
	bh=uN2lhfHr1fTJC5wzLnMklkWDJtjXEyGbnW+303REKLU=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=ADKrIknUiK2m8L19sWxZRFvQUJyUm/MkkIlWDXLVz7ITiTcvjFQYdSzJ41nhDRWt/
	 jooOm0BLSqby3SPMef+O9wWK5eypV+e5SYI4GjOqPFA/zBmqhyUjeITiRd8AAJPi2z
	 kjXIGBDKe6X9PElI6Aq6WeHVVbjapj5ArENQ7t8FlNEQ7bm33bMuZeO44CVsAqelD/
	 20OowHgq48QTmmwWhHvjHiK7yLW/kc+AP9mxOcJfdYvPdPAm5AY3WHduA+/6uBN3lZ
	 agPwKZSgsdtTS6K/NG3TTFwOpBBzzYTz9G+cJ2R5gCwtZK6k3hUrcK94A+Wl/H1cAW
	 0G39uMV2arG2g==
Message-ID: <7cded6be-069e-4ac7-a50b-1668da1d0fe8@kernel.org>
Date: Thu, 18 Dec 2025 06:47:09 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: dt-bindings: qcom,x1e80100-camss: Fix typo in
 CSIPHY supply description
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251028111115.46261-2-krzysztof.kozlowski@linaro.org>
 <3f6f62f3-67be-4d3a-89ab-747e6acae29c@kernel.org>
 <2BdPBluiAnB-F8ARSQv4PaXBdF9XffSvuiKdrZin1Pn2OVqRjVAf1YzGc4fZt8F9-UExJTdk6zWn9G6Qr5b10A==@protonmail.internalid>
 <730230b1-d753-4c64-9c38-0e86a184c0fa@kernel.org>
 <70deadce-1910-45d9-a790-e9d614cf2bf0@kernel.org>
 <2fVuN3xQbgTTCdlnlWe-EHFn9Y6WcTXgY17tWNKB2rNu7Iz1UFco7EOMSCR_AGdwX7Jp239IEsxiHXn9VCf_mg==@protonmail.internalid>
 <8b56b91e-0161-4739-a6c8-a9898de3672f@kernel.org>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <8b56b91e-0161-4739-a6c8-a9898de3672f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/12/2025 06:44, Krzysztof Kozlowski wrote:
>> I think you_should_ have received a b4 ty when that hit media-next ..
> I checked before pinging, look:
> 
> https://lore.kernel.org/all/730230b1-d753-4c64-9c38-0e86a184c0fa@kernel.org/
> 
> Nothing that this was applied.
> 
> Best regards,
> Krzysztof

Strange.

I'll look into why this doesn't happen, my understanding was that it 
does even though I don't do the b4 ty's myself.

---
bod

