Return-Path: <linux-media+bounces-34718-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEB3AD85F9
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 10:50:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DC85189376E
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 08:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 334F6272811;
	Fri, 13 Jun 2025 08:50:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C482DA77F;
	Fri, 13 Jun 2025 08:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749804609; cv=none; b=Gz74PG4gmvCdU9ugFyph4lYHEsNMve/vkROMiDEtdV5l1J7MLeUUp2W5AE/pMs+ZmTvVTUBaVm5yCGfTP4y/FBexxKRrGzt+ntmkJmlm2bYG/MvoE0civsaqPWl4R1bKMsIsXKtJHdTqcaXGso6modaz6tbPk7tJHZAAvtYJEzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749804609; c=relaxed/simple;
	bh=WbzY6vHw+HALJcAi9aUX+7UiRoYDYDHxVku4XzU7emg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m9XtyJ7DSeLkQLco4lfLVVM6hK81jdvEnj6oIxDPgct/ib+H3MhR+DCsNxoPkuDdUax/lPaKwESF6MdNlBtGiIOcwDr155c6GZ5KyfxA+nPvLkhVhXnf3e/yilKVwEV+9HLTL1CSBtGQIxjS27y9/YUdHUH5nLECmeIY1m+W9S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BF95C4CEE3;
	Fri, 13 Jun 2025 08:50:06 +0000 (UTC)
Message-ID: <54e8c99c-a1bd-4431-8eb5-844b15c61465@nxsw.ie>
Date: Fri, 13 Jun 2025 09:50:04 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: media: qcom,x1e80100-camss: Fix isp unit
 address
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250610083318.2773727-1-vladimir.zapolskiy@linaro.org>
 <RWBE_UIknv_CsgGZeJ9uULll0tI3X_fNQyZyOYvtTCz_3bLbycYGAl8kIG6A-FD5KzpFLJQ0D0xKib0KJAnjpg==@protonmail.internalid>
 <20250610083318.2773727-2-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
In-Reply-To: <20250610083318.2773727-2-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/06/2025 09:33, Vladimir Zapolskiy wrote:
> According to the devicetree specification a unit address shall match
> the first address value of the reg property.
> 
> Fixes: 2ab7f87a7f4b ("dt-bindings: media: Add qcom,x1e80100-camss")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
> Another fix on top of https://lore.kernel.org/all/20250502204142.2064496-1-vladimir.zapolskiy@linaro.org/
> 
>   .../devicetree/bindings/media/qcom,x1e80100-camss.yaml          | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> index 7d4e6ef57bf8..959cff1a31a8 100644
> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> @@ -190,7 +190,7 @@ examples:
>           #address-cells = <2>;
>           #size-cells = <2>;
> 
> -        camss: isp@acb6000 {
> +        camss: isp@acb7000 {
>               compatible = "qcom,x1e80100-camss";
> 
>               reg = <0 0x0acb7000 0 0x2000>,
> --
> 2.49.0
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

