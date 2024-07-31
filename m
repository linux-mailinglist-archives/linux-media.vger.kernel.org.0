Return-Path: <linux-media+bounces-15669-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8849439A6
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2024 01:56:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23C7C1F22BA1
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 23:56:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE55216DC37;
	Wed, 31 Jul 2024 23:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LAxUHptm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616CD16DC18
	for <linux-media@vger.kernel.org>; Wed, 31 Jul 2024 23:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722470130; cv=none; b=RfkdRJWa3JeHRrtDwqWiSTFaj3pgYAI9hv/JxNfOys0hMYzLoU0XVMJ/2OzNyhwegvPXkGXdln2oc6i//hXwCuBclntiTh99wtyA86hJkwCFkpLTPU9LlQFBpcXJG6z/FNLuVEe7kT/XzXRv5mbMcTR0DUDKvX6YPkdvJTYWKjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722470130; c=relaxed/simple;
	bh=xa90za8ap4kZtbgIb/vEkrdsRq3O8fT5kqQZJ5RcLas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rJbKHY77CplCXzpSseWSFqtffEzRW33SE9ZSzzMdqIARgKmEbYjKrwSkGsoiQ/WEo8Ze9/m5tbK9RnPA2K1GEqofg5TH0YHlZeW4tg7hsa/o1h9oSH5fVYWioZVPxA3uY6EBAAx7NvBVsDR3PginVU6Bnm0y8o4zN/x+WQlfexM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LAxUHptm; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ef18ca13f2so12574361fa.3
        for <linux-media@vger.kernel.org>; Wed, 31 Jul 2024 16:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722470126; x=1723074926; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EJ3NULCzkwiCC2Hepk8G5amN9VNikpjxRbG+tpF7zHA=;
        b=LAxUHptmt5CamYLjVrrFNpWTfJYyk3PDEUwx/W4A6UKHR2p+HmROfqmG6UFxat5TlW
         IgC8W1sUXsi8qrepOERtZen6L8PBj+bMCrljeYbucN1m/22FLKstUIt2pwst24wvqFC+
         f1futCWS4Klia8spOBy4vO1/0bzVEgNZjiBrgG6/9bglCmSfX5jKXkejMHGN21eME2sO
         364x/NIirD3rSn3Qo7McU1eg3rZi4CF2P2qARNflC4gA/YTA/ZeXwani9OkIHBUzTxjZ
         uqBFz3oLkFX/r0gz2gWyhPlDqO1dcl0wDd6vGh+Bd2EJe39gYbdjU8TG+Gd5UiMa3ntQ
         OhMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722470126; x=1723074926;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EJ3NULCzkwiCC2Hepk8G5amN9VNikpjxRbG+tpF7zHA=;
        b=kRZAWu1WsaWxXX77uY5lTcwL9GkKlhGBJDUF7r3/6WQy+GFgovnqfXcR3Y9vS4nz7y
         9gMB2LSwtm43q+463ZeWk2klnEQqUyhghq1STp9URCM2Rxh1oBZeDVBDLXGmRCQ+/Iom
         61OnFvF+qFp6XWgiOEYUbJeAJtbMEN08qAC5EXKzrTFTbMuony38/xNywz/HpDtCmCyl
         r06L4AaFvqVnsljq2RVPlerfDussudFDQhx08xNIkQi60Zv6HDxKUePEpCjTREGVbH0z
         vd7up7AFmsWt1RSYS/ZKEv/A+f8nba1ND+TSdyvPZbnw96J1Ca4Q8SnwA1A3ydx/NrDU
         4PHg==
X-Forwarded-Encrypted: i=1; AJvYcCWnfBkpAHvL/T1G0W3knAX0FSz8A8AWj/aP7NVgEOpzX4x6KsvuAuU7NzyMuqoT6zrnL/yqfSnZWTVve3J3tAHI2PxX6Pdn5nLfWVI=
X-Gm-Message-State: AOJu0Yx9i1PfLGKddqYSWNBFu/jko8sTLVcuCfaHKctd+RyzfY8bvP/0
	Le88sqrIDN6/1eRSv53zx069QrjPCjiJY4WqO/KnQy1RP/iRgAk7QRx4tro+dF0=
X-Google-Smtp-Source: AGHT+IF6eRxek4PxWOHk6Y7e1bIUu6GosnxevnqznvnaV3O3UEpj3faiBC9UP/AMMW67lO/QHf44xg==
X-Received: by 2002:a2e:a7c7:0:b0:2ef:17df:62f9 with SMTP id 38308e7fff4ca-2f15329fdbcmr3852471fa.7.1722470126358;
        Wed, 31 Jul 2024 16:55:26 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f03cf3020esm20778791fa.33.2024.07.31.16.55.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 16:55:25 -0700 (PDT)
Message-ID: <4fdf4f1c-fac0-4c85-8154-45f797c6acfd@linaro.org>
Date: Thu, 1 Aug 2024 02:55:24 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/13] media: qcom: camss: csiphy-3ph: Move CSIPHY
 variables to data field inside csiphy struct
Content-Language: en-US
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20240709160656.31146-1-quic_depengs@quicinc.com>
 <20240709160656.31146-6-quic_depengs@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20240709160656.31146-6-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bryan,

On 7/9/24 19:06, Depeng Shao wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> A .data field in the csiphy device structure allows us to extend out the
> register layout of the three phase capable CSIPHY layer.
> 
> Move the existing lane configuration structure to an encapsulating
> structure -> struct csiphy_device_regs which is derived from the .data
> field populated at PHY init time, as opposed to calculated at lane
> configuration.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>

in my opinion the change is good, still it might be reasonable to rename
.init to something else and/or get it out of hw_ops.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

