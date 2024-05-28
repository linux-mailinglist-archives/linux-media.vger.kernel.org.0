Return-Path: <linux-media+bounces-12069-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D24BC8D1663
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 10:38:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 868B6283BE6
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 08:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A993213C831;
	Tue, 28 May 2024 08:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SglXt0ew"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B98428373;
	Tue, 28 May 2024 08:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716885472; cv=none; b=VAYUPCqvi7IeNfQP3GN9QfYGqDGBVeYon71yC0B8LcEhE6OP3SXyjZKKP3u+/9GnmpQ4KyXgcymHexoHfkzoFpj2ZIL3/lj3MN1GUPTdCvVnjUYTb6DZ+/lJ4pTctPbEv2xXGcumyoTkiR4VnhdY/T6PtittstW7fw9kW4IyNZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716885472; c=relaxed/simple;
	bh=TW1jNG1PIoyG2+so13309xJlYyhVgbq9D68UAfsajzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F+CXEdOnQV94TibemSC8ACROXppZBVxnslsC8Itk4Chk/40lPX/JUQsMdK8k59bMgQpuq5Nr4Y7aH4EwpHVTb075jUMF+wXWVeX+qmDduIOnDjtcWWDdOc2Yo0MxO034mQjG4mnuO9/zMHtU7ziehNQCgJvM9+hrJ508hDGH9cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=SglXt0ew; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716885468;
	bh=TW1jNG1PIoyG2+so13309xJlYyhVgbq9D68UAfsajzA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SglXt0ewsfNVjfgOblte5DXxYe8Odk5aHidxhfv8ZQblVTG7GI9Yc/cFxq62NVZ7X
	 5DZcv5LCwqa1F6GRv/DV1AwNsaoEZ5rDEWEEepby4GPPxZ3wcUEyNQzKr1Z3cuCU6L
	 S4+/xEECPAvyyx+UAARquesFnxxjqRtKt1FpNoAPJ5Gr4vj44frFNffkL+EyOYaqGK
	 NgCuhF8j+H9Xb4RH+6q8YUiXKwO0ZyBs0N3B9ja+Xm8j+6CS4YhqluGnOsyuNBW8Mj
	 xjbHL5U6lUueOIcVNsA1BXMacHvIMgYXFRVKf3Q/gLlDL1PahnVG5/cwRlnPMfumCI
	 Bv+WWc54qsaVg==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5C2603782157;
	Tue, 28 May 2024 08:37:48 +0000 (UTC)
Date: Tue, 28 May 2024 10:37:47 +0200
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Alex Bee <knaerzche@gmail.com>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: media: rockchip,vpu: Document RK3128
 compatible
Message-ID: <20240528083747.z55laxnmioorzaru@basti-XPS-13-9310>
References: <20240523185633.71355-1-knaerzche@gmail.com>
 <20240523185633.71355-2-knaerzche@gmail.com>
 <3639993.hdfAi7Kttb@diego>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3639993.hdfAi7Kttb@diego>

Hey Heiko,

On 28.05.2024 10:19, Heiko Stübner wrote:
>Am Donnerstag, 23. Mai 2024, 20:56:31 CEST schrieb Alex Bee:
>> The integration for this SoC is similar to RK3066/RK3188.
>>
>> Document it's compatible.
>>
>> Signed-off-by: Alex Bee <knaerzche@gmail.com>
>
>Reviewed-by: Heiko Stuebner <heiko@sntech.de>
>
>Media people, can you apply this patch alone from the series?

Yes, will do got this on my list already :).

>
>Thanks
>Heiko

Regards,
Sebastian

>
>> ---
>>  Documentation/devicetree/bindings/media/rockchip-vpu.yaml | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
>> index c57e1f488895..d1b47b14ca57 100644
>> --- a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
>> +++ b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
>> @@ -26,7 +26,9 @@ properties:
>>            - rockchip,rk3568-vpu
>>            - rockchip,rk3588-av1-vpu
>>        - items:
>> -          - const: rockchip,rk3188-vpu
>> +          - enum:
>> +              - rockchip,rk3128-vpu
>> +              - rockchip,rk3188-vpu
>>            - const: rockchip,rk3066-vpu
>>        - items:
>>            - const: rockchip,rk3228-vpu
>>
>
>
>
>
>

