Return-Path: <linux-media+bounces-35936-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8F2AE9A3A
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 11:36:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37A251896696
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 09:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13BCE2BF3E0;
	Thu, 26 Jun 2025 09:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VCQc3imn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7E22C032B
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 09:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750930486; cv=none; b=oD9tSeeoJ74cIBYcI5go2wcVoCb4V05ENcO1CZSZCq+JtFXXvAmjVM/dz7bq5B3rx+gZJ9iCS/RKFwjvkMG4BF6KFtNYP7g38KuPxOtt/SJ2STMR3+6S4mlPqEr7N4OuGvJ76gPWJmEqqzYtdzPnqvv6rfCEd21xZ7DwbOqMJyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750930486; c=relaxed/simple;
	bh=daWENH4sK516masqOiqrmZ6Qx3lAJVRs4pOEyMGTS2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=moJwVaRdCiiRufaiS8Vxdsm39Uvdj/7Av6XNzrikcGf5RvwAxmA4g1WcUBCLXqUPOknnF/43+H07A0JZM3BqS1ghg8UuJ8zqVVkat5lQf9+phqTrLhXECaL6TYh8zc7Y8kcuOU5yDtQpsYd0ePuxHl1kPwg5A0h4CdONvJD2rv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VCQc3imn; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-3a54700a46eso387752f8f.1
        for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 02:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750930483; x=1751535283; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jmk5itUcCIG6Y80ZPXMFyz9ACwii6tzjqEWxl1mzR5U=;
        b=VCQc3imnVsBnNK9cD8sfl6GgjI8pRKX2KrqquL8wXHhsYO9X425iJ7Gt8YWN23djrD
         s0WCjgG7D9OhM57kheWlhdsd5xr1r64NoWZt6dyzksvpRappQNGLqsOb47kX8GB8b9Ly
         c+qDyNT3HhfPNsYDIDvQTdQByOj7FBbnSuOZm22CwIjp63pclj4//e3XtnL/fxkqqO2a
         AJgiTRCo7ZeB5RoOlAxR7PW2yr+ahMBNSe0CFFDLrGVn8wCni4K1z22J/f4fqBthShZH
         iQ6Y15k0oQKbA9V++JM+iiiJA5gLGKUeArR70Ir7y/G/nVr+Fb1JUp0LnhOqGF4f8oiZ
         Qj9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750930483; x=1751535283;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jmk5itUcCIG6Y80ZPXMFyz9ACwii6tzjqEWxl1mzR5U=;
        b=d7AmMB30Zg0vgWdjrIPZvnM3aJ94VaQBdqM+zsKSPAjIq45NPbKhkxHd8TP4Woey4c
         e0qvv6xxbQI5A6ucGdGNQXqInWnczC8wttVEiCfSebCdeJM2ninr4aFhVzqgZXXgDzc0
         O7Nw/+ISgMhTxOzQW1TOiC6Cq4DAqSt0sIZRretM0MXSc+dki7uTPJlKlh5J6y0+EpuR
         /7e+2XANboHYRXQ2SI4jSudZAl6tCCX0oJVec7AKfXji7rJJQzZjaMViA/mKp5J0ZeF7
         EPcp3aiv9a8+P5OWL7mjOyBLKwH9A/7ahwHiFNbnViTsfm5gL09jdS51ZVqxM6Eboj8f
         mKKA==
X-Forwarded-Encrypted: i=1; AJvYcCU5thu/FVS4xIYuy81rqbM30Cl8a5VleLHWVrWwLTrX8IvT6SFnexoyxyOBVGn4aGsx4+AdKmkvoA02yg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWhE/zcZwi7017GEOZbY8TXbCol8X5+8aFhhMHNk09j4wuVxV3
	1Z17q8bWgLSwMsvlqq6Xhqsahc+CNpy7GgCvOiUsb4rjmc4CGe0Ko3cm0ePAu66mmmA=
X-Gm-Gg: ASbGncs5ejaYe01QKA8bhbYks/zl/dHSfq3k8L+siViIZR7x4Cn6BuL0QGOLOAd91fW
	3smt1Wz0O4lKZA3k6x5QC72f6imb2beaSCnHtUIUXxIHCqY+MLj7EsV1TfSeBFJcsC6IkWrXNex
	Phk8eoPex8CmVN15YVEnwEzeu9Lgw1dXzmKIbpZ6wSUz3sGsB+6MA7qKMqraWYIk6igjUk3kdqj
	/vlt+NfTxtatO5YGNxQeA7OeVOBbATyMM241NPAm9K0EZecMRcbZ+/19+rVwZzwe73NIT6PWaHr
	Dq0opjcuRqUSZYtozuw4RbcfvxBAhzRMbDngzKrMko87Umg53vsz97JsLA76SOc6KtX9Kieddvf
	LSN2D2zAAa8aq3ndMz4iJ3G4bB9A=
X-Google-Smtp-Source: AGHT+IFsKTdNJ5UoksfB3ZzoCCyLEvAmb7v32X3qcFkFmLrA7HtlHe0xa0JRXmgqGSDIbpaNAIULcQ==
X-Received: by 2002:a5d:5847:0:b0:3a3:7593:818b with SMTP id ffacd0b85a97d-3a6ed62eb62mr5516826f8f.21.1750930483250;
        Thu, 26 Jun 2025 02:34:43 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a4213f0sm13810175e9.36.2025.06.26.02.34.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 02:34:42 -0700 (PDT)
Message-ID: <2dce02ad-6913-494b-afa3-315e9b50529b@linaro.org>
Date: Thu, 26 Jun 2025 10:34:41 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: media: qcom,x1e80100-camss: Sort
 interconnects alphabetically
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20250624094253.57441-1-vladimir.zapolskiy@linaro.org>
 <20250624094253.57441-2-vladimir.zapolskiy@linaro.org>
 <aa56b956-95f3-484d-8afa-058925b95bfd@kernel.org>
 <fff77f71-e21b-43b9-9da5-6cf819add970@linaro.org>
 <5a5b78f7-e156-4c5e-8407-b249040e227d@kernel.org>
 <c29385d4-30ea-4774-9cf9-699b08e29800@linaro.org>
 <329b89a4-85a9-496f-8b1b-6239dfc9057b@kernel.org>
 <930edec1-7403-4ecf-bb17-2e68b8d351f8@kernel.org>
 <e0eb8d55-b4fd-4f3b-94b0-5c56d48b4671@linaro.org>
 <c923723f-5e94-4621-9bb8-36c8572f9b51@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <c923723f-5e94-4621-9bb8-36c8572f9b51@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/06/2025 10:11, Krzysztof Kozlowski wrote:
> Hm? This was not a true statement and anyway this was not from me. Why
> are you both with Bryan creating some fake rules and then later use them
> in arguments in discussions?
> 
> We don't talk here what sort of rule other person invented.

Ah here lads stop dragging this up

https://lore.kernel.org/all/c1539cce-92eb-43fc-9267-f6e002611bbb@linaro.org/
Date: Mon, 30 Sep 2024 09:55:19 +0100	

We've subsequently discussed this twice now face-to-face, subsequently.

It's very clearly not OK to reorder the interconnect nodes.

Stop @ me about this.

---
bod

