Return-Path: <linux-media+bounces-42206-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC38B51686
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 14:06:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7859D1C81975
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 12:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 535613112CF;
	Wed, 10 Sep 2025 12:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="fM7clJ7t";
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="fM7clJ7t"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.mleia.com (mleia.com [178.79.152.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F52C28C87C;
	Wed, 10 Sep 2025 12:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.79.152.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757505987; cv=none; b=FMOFC/O4wlLTBd8BuW94tACgNaIhbvgdoH5Rldn3Fl/3Kbf5Fq3W4LZWsLWMPimqrNsbz8mMgopwmJwAWF2wAsOKYC7A3d8aUfDnpy1sUCDSqhgYIQdQrteNQPa/sPykgYLWrz1BV0P5t7EUrh8sFVZ+8iiEnBSX3Etg6SYK47k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757505987; c=relaxed/simple;
	bh=n8uo/+X4cJWRjA9CXCXEuKfSuSoKhT15GXPbuvWzaqQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mj3rcYOTL2iX+QL/nbWX/PCTZmd3m8/cBVd7pQv4x0JcWJqGAu/LTFUqpJ+bsbrXAFQC91FsPfGMIxMcWjECsNUP0TqCehLnrMEZrHwySYciUlYoHfGd8CaIggG+FILyVDPNLpIVdpcKU2kKu3y4GTw1DY/HDnkMaDT/+VLuOC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com; spf=none smtp.mailfrom=mleia.com; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=fM7clJ7t; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=fM7clJ7t; arc=none smtp.client-ip=178.79.152.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mleia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1757505977; bh=n8uo/+X4cJWRjA9CXCXEuKfSuSoKhT15GXPbuvWzaqQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fM7clJ7toOc7mAASUwV4oG6CSnxTHXzJco8Az+lZJRTs6yUjutvvpeZpX/LUN72py
	 VyH8thYEgQfE2dPgCt8Xm03yYsK0hqGMhN71/cjjS4AiRtV+4A+XgEuQ1HSesJkWnD
	 vsCTIw9ibOOA+dkIlTihpnlWXSBM5a6BiRKS0ihcsovC33Z9wm2rCdEpgw330cgaRV
	 JUNN99dHdvSA8NR1e2MnQ2+0KeJbfVE0kvdZbUHQPmgFsU4xaQdrR0iU4PRV2yZ9dX
	 iUf5SvqrD90Nz/LVxfu5tFvrh0yqp7KL7hGlFT3g4V/M80mJoXFwjrw2D63wU5c5du
	 evGigoG1lhYxw==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id C56D33D364D;
	Wed, 10 Sep 2025 12:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1757505977; bh=n8uo/+X4cJWRjA9CXCXEuKfSuSoKhT15GXPbuvWzaqQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fM7clJ7toOc7mAASUwV4oG6CSnxTHXzJco8Az+lZJRTs6yUjutvvpeZpX/LUN72py
	 VyH8thYEgQfE2dPgCt8Xm03yYsK0hqGMhN71/cjjS4AiRtV+4A+XgEuQ1HSesJkWnD
	 vsCTIw9ibOOA+dkIlTihpnlWXSBM5a6BiRKS0ihcsovC33Z9wm2rCdEpgw330cgaRV
	 JUNN99dHdvSA8NR1e2MnQ2+0KeJbfVE0kvdZbUHQPmgFsU4xaQdrR0iU4PRV2yZ9dX
	 iUf5SvqrD90Nz/LVxfu5tFvrh0yqp7KL7hGlFT3g4V/M80mJoXFwjrw2D63wU5c5du
	 evGigoG1lhYxw==
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id 35B4F3D348C;
	Wed, 10 Sep 2025 12:06:17 +0000 (UTC)
Message-ID: <e526e93e-1373-4f1e-82ab-6b22d68211cd@mleia.com>
Date: Wed, 10 Sep 2025 15:06:12 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: media: ti,ds90ub953: Add new property
 ti,gpio-data
To: Guoniu Zhou <guoniu.zhou@nxp.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250910-ds90ub953-v1-0-a7813ffbdf11@nxp.com>
 <20250910-ds90ub953-v1-1-a7813ffbdf11@nxp.com>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20250910-ds90ub953-v1-1-a7813ffbdf11@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20250910_120617_825763_E76A8A58 
X-CRM114-Status: GOOD (  10.98  )

On 9/10/25 12:44, Guoniu Zhou wrote:
> Add new property ti,gpio-data to let user select ds90ub953 gpio output
> remote data coming from the compatible deserializer.
> 
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
>   Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
> index 2e129bf573b79e0ca8f25b4ec5fc6ea76c50abd7..7c3144677f11004468ed3a3fba74e6eee2d259d2 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
> @@ -26,6 +26,16 @@ properties:
>   
>     gpio-controller: true
>   
> +  ti,gpio-data:
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    default: 0
> +    minimum: 0
> +    maximum: 15
> +    description: |
> +      Program each gpio pin to output remote data coming from compatible
> +      deserializer using the LOCAL_GPIO_DATA[7:4] register. This property
> +      has to be a '/bits/ 8' value.
> +

No, this shall be done as a GPIO controller function of the IC, and not
as a hardcoded (!) custom property.

>     clocks:
>       maxItems: 1
>       description:
> 

NAK, the approach is wrong.

-- 
Best wishes,
Vladimir

