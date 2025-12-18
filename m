Return-Path: <linux-media+bounces-49044-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3FBCCA713
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 07:23:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EEB9E3059AF4
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 06:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A1D7320CBE;
	Thu, 18 Dec 2025 06:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nnQz4vjP"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19AC1F9F7A;
	Thu, 18 Dec 2025 06:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766038972; cv=none; b=byqUprQSsGjIwaJn+iw8ykwx+SvcYnYjpjnchFU0AMGAOcWstDs27EhWLz6a5uef4akmf5m2FElDhxf02u8AJKyfSgNlBf7XYLQiFTFA1XrfGeCCHzAWHF5NMByQNdNGl1JVuVOdjetY1Svsfnm7Z2VbUG7tckE4bDis++X6w10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766038972; c=relaxed/simple;
	bh=pnIS2FShKQjUabvnbHEwdWW3bYPxQChmJ07Xpq9RehI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=rlLMpHOQQM17P6RnUDU8ZoZe8314USkFq6Fu9+BPHyOcW431n+ZhaQHmMXP3W19lwMOGBqUn2l/Oe+GNBzVsNAgTWpV+Kq7Ty15kSjYrkDSvd2tn/PjsdLBfL5T2iMvrECDMua4+MleJdAyXhUt2kmmaJeFFawAejCYFDi5j9TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nnQz4vjP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC9E3C4CEFB;
	Thu, 18 Dec 2025 06:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766038972;
	bh=pnIS2FShKQjUabvnbHEwdWW3bYPxQChmJ07Xpq9RehI=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=nnQz4vjPNGz/tehPz/MGfqACnYnxhIHZtPYw3GKTRYdEwUZ3TYbiOfqOoi6C+erI0
	 QIUt2BhEu69z85DASCLD7nni8uFe0Q6UVZ8YxFTtq8vcVfViHyVzAC4PvEOBb9Kz5z
	 gXRXANn6bU/rcMG8lOHFHfIyhsqC1CXhw5lM6wMt1MKZg197NCMiZ6Cnb5pUMqRvuX
	 cnWdR/VbAdR9B/g1ldV+kUOUTmZgtGhMi7BtK0vnNfDGuRcRuUca7OSrRouHhh2HPB
	 gphSghtA3IrO8LVGnWtc8dQxWz1m0JyvZMH8uBvmX8ikK48vcqL+QumL2b9NSEdx+t
	 rzE7tpI4cnvVw==
Message-ID: <70deadce-1910-45d9-a790-e9d614cf2bf0@kernel.org>
Date: Thu, 18 Dec 2025 06:22:47 +0000
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
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <730230b1-d753-4c64-9c38-0e86a184c0fa@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/12/2025 16:00, Krzysztof Kozlowski wrote:
>> Ping! It has been 1.5 months already. This also got other DT ack - TWO
>> DAYS after the posting - so why is this still not addressed by camss
>> maintainers?
>>
> Huh, my bad, this was applied. There is just no trace for it here, so I
> missed that. Apologies for the noise.
> 
> There is awesome tool, btw, called b4, and with one-command setup you
> can then later generate nice thank you letters (and with few more
> commands setup they can be nicely customized)...
> 
> Best regards,
> Krzysztof
> 

I think you _should_ have received a b4 ty when that hit media-next ..

---
bod

