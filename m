Return-Path: <linux-media+bounces-18187-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F23D7976461
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 10:22:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8B112877F3
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 08:22:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C00EE190682;
	Thu, 12 Sep 2024 08:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iQ6WmGfq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F87518FDB3
	for <linux-media@vger.kernel.org>; Thu, 12 Sep 2024 08:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726129354; cv=none; b=Vm58J00WYWaEhWHmJyI/KwtVWOj2i+NJcMTzmi0p9k1UklePj/vKl5CnvrPCkkd0xnurEfhQor9Vqktqh2KEv7xMIjvzYPZ1V78kG5Ox1lwc0QyGnJLAWLSZvaQdfqpK3Ip2Xk/nk+uKGecEFyXjc2Cven558ZganEDSELqfbH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726129354; c=relaxed/simple;
	bh=fxk0ADnO7AYMfVAA4gttR0iy6g40PU6xW5oQpU3fVoE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CHPifa22cGwMr39RSWSWc68G1NOb9F1XEJHR1qa9rJsiek9a2k8HT5NpHvs8ZEVf3cWqC83SVwOd6VtaVIQ1aNJ+nzFPgCSpq8Jn+tYFr/W2D2Rgspx1Ya5AIkRrr8zeFOq3Lf0Muk3h67dDFzKqZ/ZcJT7udgHd0M5sEPBH2h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iQ6WmGfq; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53652c3bffdso99914e87.1
        for <linux-media@vger.kernel.org>; Thu, 12 Sep 2024 01:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726129350; x=1726734150; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mePICWeS9/hXtfqs7iQrU4vgAXNr6sPz0xlhgJSQNUM=;
        b=iQ6WmGfq5NEW7YhwxSaLSel95LhMshK8mEretsWZI5MihQP0mevOlnNwMJygGr95E2
         4j57pliz3OnWTZJHWA19K0Zc69QgBs1VTj0/qCKIgjUFjqX8IvZqsYMtJZQyWYJtlYUQ
         kLa4IMchh5XAte6GTh3822AKKBGKJPHZJdTVQDuNHP4vPOM/6fNYUlt7EmNFtkVinHZ/
         21lZgNmj/e2vld+hEpLP0OcLsyckLTZjfL2aKdAchf5ew12Eq2KU379SAMUq7kH/dCdj
         MkCHSQmF1RSNGK03Ni6jNFTVB9mSqYkIk1wBKpBdaOFcMyDy3mdsxZqR9+vmAE9KHlGA
         2yOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726129350; x=1726734150;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mePICWeS9/hXtfqs7iQrU4vgAXNr6sPz0xlhgJSQNUM=;
        b=FdewJ4MVwCW+N1UCqLgPu3K48CfptHqJgGOw4P4hAveK7T0iNoGrCmyLUnAr9pJsJh
         53pzkB+Upes6Y85OYEYCTw5h6hnubTISttPrcJhGMP2Smh97BVyEBKXL2hBdYv4lLHsP
         eQUjgBUR9Jcj5jBNbQB4l1KeqNo01asCkkFmA8VKTJS2gTJr8qD983SpT4Y5IfwoEEae
         dRod4ziMtSuTmcNL0kyyxXuKwQggAf90IaKExijoq7vOzDOVkDQlshLZoX2Xcb1XgMSM
         mPsj8zNcOhs/xv4KVLef8iceV3GQWfwh7/G+7Q0Lo0N2co4TT7l3s5kqqr0e2OPNuHj4
         OciA==
X-Forwarded-Encrypted: i=1; AJvYcCWaVM1WtSdJFESMpFkbyx5xGE0CwQYQf2I+D/L4vGbrRJY2LOCOpVsmTJro7Xst9GfPS67jKGNqP5BpRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCwwStwKiL5kKLUkJQ/6myyo5AEaV+19LzD/ahAiJlKR3+NkAH
	hmaqT56isEitHgKChxvPPokWTs65Za3bX5VqIFXuk53mHDQYKvjkIwNgcVXPAGg=
X-Google-Smtp-Source: AGHT+IFHpYz3MtFNhhk0qE4MQvJloavhfM+9b9Iwh0c9t2QbQKCzNxYvsVOPmoH00u63FcpYNGMucA==
X-Received: by 2002:a05:6512:3e08:b0:52f:c438:883c with SMTP id 2adb3069b0e04-53678fab60amr315905e87.1.1726129350250;
        Thu, 12 Sep 2024 01:22:30 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5365f8cb796sm1854010e87.171.2024.09.12.01.22.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Sep 2024 01:22:29 -0700 (PDT)
Message-ID: <b1b4a866-fa64-4844-a49b-dfdcfca536df@linaro.org>
Date: Thu, 12 Sep 2024 11:22:28 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] dt-bindings: media: camss: Add qcom,sm8550-camss
 binding
Content-Language: en-US
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@quicinc.com, Yongsheng Li <quic_yon@quicinc.com>
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-8-quic_depengs@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20240812144131.369378-8-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Depeng,

I do have one more ask for a change.

On 8/12/24 17:41, Depeng Shao wrote:
> Add bindings for qcom,sm8550-camss in order to support the camera
> subsystem for sm8550.
> 
> Co-developed-by: Yongsheng Li <quic_yon@quicinc.com>
> Signed-off-by: Yongsheng Li <quic_yon@quicinc.com>
> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>

<snip>

> +
> +  vdda-phy-supply:
> +    description:
> +      Phandle to a regulator supply to PHY core block.
> +
> +  vdda-pll-supply:
> +    description:
> +      Phandle to 1.2V regulator supply to PHY refclk pll block.
> +

Here the supplies should be split into ones, which are specific to CSI blocks,
and I believe they shall be set as optional.

The proposed names are:

vdda-phy-01-supply
vdda-pll-01-supply
vdda-phy-23-supply
vdda-pll-23-supply
vdda-phy-46-supply
vdda-pll-46-supply
vdda-phy-57-supply
vdda-pll-57-supply

I understand that what I ask is much more clumsy, and it could be seen even as
unneeded, however it'll be the right set of properties to describe the CAMSS IP
in this respect.

--
Best wishes,
Vladimir

