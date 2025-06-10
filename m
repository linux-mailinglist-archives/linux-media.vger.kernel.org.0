Return-Path: <linux-media+bounces-34462-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F93AD3C51
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 17:11:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DFD24173F77
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 15:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED74F235079;
	Tue, 10 Jun 2025 15:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oviXTZgM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803AE23505B
	for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 15:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749568138; cv=none; b=T3N6sUoGHMSbGLdMVBT6eUoD1g/oBLGHYjVcgEtU6Nw0Jv3iakS5gzAoaVVdFV6fEy2yRWosaMk+3kun9ArZ7ToeRsNgpXoz/rF88OVJ5HmG1SKufyg81VwBp/+9y4d6s8PGl/Vbzgu743Q/rUBbQI4opfGz5IzY23iPWYHQogI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749568138; c=relaxed/simple;
	bh=zafj7aZavn6+rfBRYzGjnAgF8d7WzsIv1NqVPuCSe1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uc0mTdWPPDOL58KSaJJ2/8+VZQt1EGgb8BwfuhtiuXeegGnuZ3Tz2o1ICtPcyfQB1Cdl3T8/YqytCERUwa+ZID8JurDSwP1LWRF9/WrouWWP3K8BtesJ5jF2288CQtavXeL+6h2XL/FsTHf2GJbo9+rrl6xU3trh2mLLvqm6ElQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oviXTZgM; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-551fc6d4a76so5992194e87.0
        for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 08:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749568135; x=1750172935; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6KtswEqQ1pl5gFB1WRd58AOD0ITY+Z1hiQhfoUKBuUU=;
        b=oviXTZgMxqOuj9EC0DsjRwSLb0kcKfVRUgYFP2zL7B/t+kHWfg2DzLrv3u+6AnPSCM
         XSv16tF7pFAttwMYYAivMMuMGLnyeyPL2+wuiA2jPSENGZOuRmimTsb1mHEjECF8Zvfl
         IxxmZSXKs9LbDr/F/fLyllM368CE6ClSGwAxVx67SC1irT4oLpnL0FO3RR9OGsYEWrsR
         T0fNFJerovnML3+y0W8dmOOa0Szt9DGwM06SbpK7lolnJR2+JyaOY3xyMuFecRlaf96e
         yJmpTFYGUVA2E79tVMaTpTRNpqdbY3Y0iF4AjqUU8VuBuuPqnptIftCBNYc/wZASCw1g
         zFCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749568135; x=1750172935;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6KtswEqQ1pl5gFB1WRd58AOD0ITY+Z1hiQhfoUKBuUU=;
        b=jhtAK+pTZQpDIYKSVjZvvqaCjoCJJuDNHuW2H5AFpw3SGHlsCKx22EsIeGpG53sDzL
         /2D4oYQAq2EEJICBa25sRHqgTxpzMw8ptEs8f0NUrREKPT48bgaGOOT0Atk0PC59z2gW
         eWYUCRjKCQCcAfmV/VD/K4eQNf4X0qKmdXbEFlR60pji908yUpBJ8ECLYwBJP0GbBZMc
         RP6/g7h6FOd6iA5qp2/s7mpD15XSTDxJr27nKq4cMLHcDlw/bxGsjYI1ZOkzJDloyxi3
         Yt1gMyw9ryKRpax4fLPBb+yG4yp6SATAwfGnNjrZ57A5BlSkAjIWUxizskcr5J0yME57
         VIwg==
X-Forwarded-Encrypted: i=1; AJvYcCWKxTfAMvWJrUBr3N2WXdAseIc9kdUb1K/A65G/Wo/I8y/6YxSsF4IN4hHHJ4awjbMUcQUESRJ6CoPwkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq4zmOw+KpcMDVXI1qHf9WqoaOUguKote+sAL/y+LvWgRS9aV/
	+hWMIK17hQ9z3zbWtq2x5JUy7DavW+m9FWl1oC+nN1pWNFQtH5rSDBk1aCA1ksT5QUd13+j4b2v
	h9eR929k=
X-Gm-Gg: ASbGnct1FY/0Smd3ROz8Rik8IT441C8ZLmWe7VBlzvI1uTqXg5HmsIQO9qRPENr/ooy
	fz3l8wUBdIZO5t/r+U+UoTw/Wu9uyRvFlONDJtXpsyNBjOb9hlEKIk5U17GQqwGHj083kjt0E3W
	V/Cl5NHzRugUpmUT629exqwlJ5KVuibmFUrXAgGABJxIRs/OQFoEeF+oRzrb7i2BgDSwthqnHlR
	RufYNhxd6HG3/umLsjZKmtfq5Pogn0Nz/RbFk+TOU/mxm/w+E5lC7R3V4ZPjsc3cbXCJRM2vIVH
	pczGn96UThw9mxXgxx82DAlprw3nwLv/Sw5hsgPRzhvU0t6F1dMPUKQUfNYRrYsljbwFHiebx9V
	D/Aj63lga3KhkLG0kY7qJtn+4uRbQpor7W8BJUA==
X-Google-Smtp-Source: AGHT+IH+tWEkQXFAY0ELc5Dwc49Kdl/4EWO+CPjVNq2q4Kkp4CMqzwV1NPVTkuHfWtb2NlfA6pu6mg==
X-Received: by 2002:a5d:5f8c:0:b0:3a4:e665:ca5 with SMTP id ffacd0b85a97d-3a531883d8dmr15192347f8f.23.1749567739357;
        Tue, 10 Jun 2025 08:02:19 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532462d93sm12780025f8f.91.2025.06.10.08.02.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 08:02:18 -0700 (PDT)
Message-ID: <ae364f1c-5d64-4178-b26c-e58e352feee0@linaro.org>
Date: Tue, 10 Jun 2025 16:02:17 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: media: qcom,x1e80100-camss: Sort
 interconnect alphabetically
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250610083318.2773727-1-vladimir.zapolskiy@linaro.org>
 <a072d00e-df91-420b-9363-424bcdf1ed8e@linaro.org>
 <3e8f8220-1fad-437e-9fa4-5eb628891110@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <3e8f8220-1fad-437e-9fa4-5eb628891110@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/06/2025 13:45, Vladimir Zapolskiy wrote:
>>
>> How is this a Fixes: ?
> 
> I call it the fix to the dt-bindings documentation, then what is this
> change, if it's not a fix?..
> 
> Anyway, if there is a strong disagreement about if it's a fix or not,
> the Fixes tag can be dropped from the change, since it's so secondary.

Since we don't have a committed upstream user I don't think this is an 
ABI break.

But I also don't think it warrants a Fixes: tag either, there's no bug.

---
bod

