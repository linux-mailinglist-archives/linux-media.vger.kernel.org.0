Return-Path: <linux-media+bounces-48622-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 029EDCB58C9
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 11:46:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 00FF13016EF3
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 10:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F45E3064BB;
	Thu, 11 Dec 2025 10:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kfk4bb3z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C36623EAA1
	for <linux-media@vger.kernel.org>; Thu, 11 Dec 2025 10:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765449982; cv=none; b=AcdNeZN3b1aFE3TMY7sCfnareW+uCJBMgadlbAL8aCVzN8xlSZe1bSOzaFxkeTJZ0KDKbfpemFzwbQY3h+oTVIKbX+McX5uQ3zOr+8XoFkTeAhtBEsam5QfD8LR4ZPmsWl5FJzdSAYyvPAkZcnp71CoaILTBPQXZET7o5OyyUtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765449982; c=relaxed/simple;
	bh=7nizhHjO3b9Dw9M3chS4sgZFznZhBTrr/fB3xTkLVf4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HzDxdsBPjiprlNV6adhYIHlx739HyWlT+8NH6HGa8T8DwFXvnd0G+ifzMhthbM7SHEGa1lkK4Ud3jjqspwYCUR+GPQ8Caz1tOWNp2sRtvvKv8iLz6qXwztZ41Ij+EGMSA67jHlWGatTMYZjGgB85tMmgMNdah5oUlzzSgQCfNGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kfk4bb3z; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59584766a77so112828e87.1
        for <linux-media@vger.kernel.org>; Thu, 11 Dec 2025 02:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765449977; x=1766054777; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=go1f5cR2F7EaH8swZCcuA0b9ZduXHeBI/V7kRO1y+wY=;
        b=kfk4bb3zpYKmsMtIEyAC/fHXA4XdnfhRt4d/5nQXgtqg9/PGvAn2w0DesQYBJjFzE2
         /ywhvHH0oa20AgG7lNjn+9fthibMXaHAZNNZkxYBZcDf1TOUK9IqMigahhvMyv5PuALz
         GzeLLhjjtfpnTqMbHRWQR4b4VYKVVD9EdRl4I7XAjlrenAS7etyth3MDsoiKwM/IbXMD
         tbUijkOmjYxFv4W9wpmDZPUZJjzGs3M3aIfcPp/klgcFTA3Fv4Vfvi5jr/IiGdSs2d3X
         fxJ1JhkY9bYunE+xe7xBoZ0jDBtBC+E2ETM/2MJPDUnj0Vc+g2r2lkdMQkUCcn/DkvxP
         j6UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765449977; x=1766054777;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=go1f5cR2F7EaH8swZCcuA0b9ZduXHeBI/V7kRO1y+wY=;
        b=HVHvdNQIjycaJPH3atHcOA8clvV4D063NPIXYFu2AAxkzEQwNZhJwR4DJ+KvsKMJq0
         DsMT5jIXO+P/nJ+wqkZF6RD5K99BfYA1iqD/ereIpOldBUGDPHq5pR2W1V2p8J2R9B6e
         SaGWGDUYKlEs4pfpHYV2GybmpKgFk4MVFOsd+BT4HoCrsKMlMyFSOn6X17xZW63eVXvL
         F8ojURvOVRlVxgVwIVFJwKq6Jkx+VRpp/mt1HlSs0rkHnT1/KpbDnIR+Wt6nMr3F5TA9
         M/J3g1MVgB0lQp1VVIZEOlb1CB5zwDETgu4JvbwWNyZpVAZmM9EmiaDGXKXa3E0tPmXa
         K5Pg==
X-Forwarded-Encrypted: i=1; AJvYcCXl7a2juRbVAXdDeueC72vgm6RCzF0lEQzL6KEcSteecVXjDzy6ntgPdUHZ8QPonC9vkoz5tfpAf6FRvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFTFilXvnC4FGmJZ+412QEuKzWSU4P3j4E/UdqeXMZNeLMGCZP
	XojHqo03qK3i1XgUuVCyfidslZV1E96VEWn6ZqOz9POmDjG1pOzwuIXx7k3SjmBC/94=
X-Gm-Gg: AY/fxX70z0mx2EdNBO+NjxNiWw6Q+sBo+kezP1T540mRpcvxm0UCmqu+wsp7B0wo3BB
	QYGOzHZ2bhqcEqOzjGbQPt66DPoXF+a676l13ZY3SfwNTv8EkDYvYQioIkkrrpEaHzTT1OSZWgh
	8M9TKDxw4uvBGUrLkpjSZRjx1YwCVW866bqOMmVt8Mctssyfz/MLTwmrtN72qrYFWv+TqakFzg+
	CD3nUPnY5qAsh+sMJTVqLJdNjU+UAhsHgjmN0zSJ5RGIocSKHFqa2yQtueyDT+ZvTKaCw/jq49t
	2igVxYQDvhADcmo/V068EdT9j70Lg5X+cEANPtga/5tjgz6dTwHvlXzYTMKSoh1Ze75PND1x03B
	2B0GKNd0wJUndmEQfvfdX+OL+AQRcevyxI5Mz7IfrOh267xJi6N0kFBgjdSroNHyscQva0aZmGh
	Z2oAgwdTLkfjp8CYnnHIlAhtpNe0EwPoa9fYrdSLf26FVa2BsYmENTQzmOdrDYI2QLKQ==
X-Google-Smtp-Source: AGHT+IE9M+bCShDEmQtEErnzK0/+9MOvXjCquSMAEdTJbHAqDbkRp/jSYuX+hNEV5JitECiyFFHZZQ==
X-Received: by 2002:a05:6512:130b:b0:597:d790:a1a2 with SMTP id 2adb3069b0e04-598f380609dmr399134e87.8.1765449977401;
        Thu, 11 Dec 2025 02:46:17 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-598f3199a23sm755322e87.95.2025.12.11.02.46.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Dec 2025 02:46:16 -0800 (PST)
Message-ID: <32463967-8256-4681-b823-7ddce29f1c00@linaro.org>
Date: Thu, 11 Dec 2025 12:46:15 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] arm64: dts: qcom: sdm670: remove camss endpoint
 nodes
Content-Language: ru-RU
To: Richard Acayan <mailingradian@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>
References: <20251211014846.16602-1-mailingradian@gmail.com>
 <20251211014846.16602-4-mailingradian@gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251211014846.16602-4-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/11/25 03:48, Richard Acayan wrote:
> There is no need to add these by default for all of SDM670. Originally,
> they were added so there could be a label for each port. This is
> unnecessary if the endpoints are all added in a fixup to the camss node.
> 
> This is required since dcf6fb89e6f7 ("media: qcom: camss: remove a check
> for unavailable CAMSS endpoint") was applied, forcing all endpoint nodes
> to be probed, even if they are marked as disabled. According to the body
> of this commit, there is "no valid or sane usecase".

Right, endpoints are not devices.

> 
> Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Link: https://lore.kernel.org/r/488281f6-5e5d-4864-8220-63e2a0b2d7f2@linaro.org
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

