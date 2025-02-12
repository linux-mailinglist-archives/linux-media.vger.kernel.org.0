Return-Path: <linux-media+bounces-26034-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 30284A31E34
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 06:47:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD3357A377D
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 05:46:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1601E1FBC8B;
	Wed, 12 Feb 2025 05:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OEY6BjB6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F9C2BD10;
	Wed, 12 Feb 2025 05:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739339253; cv=none; b=PsFmL0YA7+K9EYtAYCG2RFaiCmqax7htM7uZEKzIi+FUM5OS7wMeCH9Bbt33RsD4kLi/OqfFFn9anwzkE/hWOU96Nwyv2sLG5CMFRt4RYtqF6YYLW2qpk1yGqk4YUajm1TRCTN3Hiz5NooECjOTHCAL4OsjWzUf49s0bph+kbn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739339253; c=relaxed/simple;
	bh=ilS7Vyw4k14KiS1Avo6VfcY56qUDNzLPX44dUnRds40=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BaHyk0gZGg1wZ132QkuPb+s6mUBPP0ovBwwmuxmKGu7hyVXHDNZbmPwks/IQCHBd1Yngjv8eQcrKwVnte4pMk+c263mBNjkrr6gKx0p4Grs0vZAlXd6QmE6WeVXYdePYbaoa/QPGDdtLMRU05B7zkvVW8whcawXeLhZS6f8w0GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OEY6BjB6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EE5EC4CEDF;
	Wed, 12 Feb 2025 05:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739339252;
	bh=ilS7Vyw4k14KiS1Avo6VfcY56qUDNzLPX44dUnRds40=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OEY6BjB6CkYChOeih1Nh4KTQb5T3hOPO5/BHvi7V1yaiUS6QYrxbrMpu0V9TvJU9J
	 PwMtEHJOV6jMdEDMrdF4qoiQ9afZeuZ6U3krh0RCknAFygY+3WJGg7Kih9DhWHKuSv
	 i/NuEcces9zbZEenBCoX3iPwqBRmIs7J7JJgst006EuNAjOkCEUt+SsxGWFqfhCp88
	 cUBp1jdnSvjeMgknSBOmx7GTlxJPM03xAa0VK2sY1ujBxaB2ENY3MKmls+qnGaSwJu
	 qzkT/pTUkgod6PlEHu19Q/f8NAeU6ZmA7G/R1fLahfBESpsq3/opCLlle12M5ej6zZ
	 VtgyK3wzJuDfw==
Message-ID: <e7a1b608-2bad-41d4-844a-07fd73818bb3@kernel.org>
Date: Wed, 12 Feb 2025 06:47:20 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] of: Add warpper function
 of_find_node_by_name_balanced()
To: Zhang Zekun <zhangzekun11@huawei.com>, robh@kernel.org,
 saravanak@google.com, justin.chen@broadcom.com,
 florian.fainelli@broadcom.com, andrew+netdev@lunn.ch, kuba@kernel.org,
 o.rempel@pengutronix.de, kory.maincent@bootlin.com,
 jacopo+renesas@jmondi.org, kieran.bingham+renesas@ideasonboard.com,
 laurent.pinchart+renesas@ideasonboard.com, maddy@linux.ibm.com,
 mpe@ellerman.id.au, npiggin@gmail.com, olteanv@gmail.com,
 davem@davemloft.net, taras.chornyi@plvision.eu, edumazet@google.com,
 pabeni@redhat.com, sudeep.holla@arm.com, cristian.marussi@arm.com
Cc: arm-scmi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-media@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, chenjun102@huawei.com
References: <20250207013117.104205-1-zhangzekun11@huawei.com>
 <20250207013117.104205-2-zhangzekun11@huawei.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250207013117.104205-2-zhangzekun11@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/02/2025 02:31, Zhang Zekun wrote:
> There are many drivers use of_find_node_by_name() with a not-NULL
> device_node pointer, and a number of callers would require a call to
> of_node_get() before using it. There are also some drivers who forget
> to call of_node_get() which would cause a ref count leak[1]. So, Add a
> wraper function for of_find_node_by_name(), drivers may use this function
> to call of_find_node_by_name() with the refcount already balanced.
> 
> [1] https://lore.kernel.org/all/20241024015909.58654-1-zhangzekun11@huawei.com/
> 
> Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
> ---
>  include/linux/of.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/include/linux/of.h b/include/linux/of.h
> index eaf0e2a2b75c..b7c6d7ff278c 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -268,6 +268,11 @@ static inline const char *of_node_full_name(const struct device_node *np)
>  #define for_each_of_allnodes(dn) for_each_of_allnodes_from(NULL, dn)
>  extern struct device_node *of_find_node_by_name(struct device_node *from,
>  	const char *name);
> +static inline struct device_node *of_find_node_by_name_balanced(struct device_node *from,
> +								const char *name)
> +{
> +	return of_find_node_by_name(of_node_get(from), name);

I don't think that solution to people not reading API description is to
create more API with similar but a bit different behavior, especially
undocumented.

Best regards,
Krzysztof

