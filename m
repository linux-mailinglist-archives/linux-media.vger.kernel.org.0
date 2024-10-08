Return-Path: <linux-media+bounces-19217-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8139994665
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 13:17:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61DB628A4F2
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 11:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F34C1C9B77;
	Tue,  8 Oct 2024 11:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OEk8k9J6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4291C3301
	for <linux-media@vger.kernel.org>; Tue,  8 Oct 2024 11:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728386239; cv=none; b=pRWqzI3fdbjfJ+FMP+LIeWnbCVR8fDsFXMMYWLwD691p8xdIow2I3idCuHQwxCZvYk9n3JfdV4yroZKS0lkEHDMgp4rahfRaDu+PvA84qBZSullpSQBZGYvTTcNPl9G5u09T/l2byeVabdeYxE6zO222uLFbXJ33XH7xmKbWQbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728386239; c=relaxed/simple;
	bh=JciPD3Kds7CPkAVP6VNzM1EEeODN/Rh825zly+fAF84=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jYqLEv92/F17tBeJpP2hbkPGyxEQSwGG05WpMozjMYgIH0Qa2cCy5tFEaIoR7euqGO3Y0XqBeJ97AL9c423XZtkDbzyEGav+ORFZ4SxKf6iD9i7xSa9+LVh5eXvEIYkZH5+IE/n6pOcOTMPxNsdERGaMzJMxzqHxykU397YKsOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OEk8k9J6; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42e6dbc8c7dso9076145e9.1
        for <linux-media@vger.kernel.org>; Tue, 08 Oct 2024 04:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728386236; x=1728991036; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JciPD3Kds7CPkAVP6VNzM1EEeODN/Rh825zly+fAF84=;
        b=OEk8k9J6BdsLKJrsTuwsp0Uqbwc8wv/FWzRP+yvVjPPCr1EkXqtS5mxN54Ov8AHvv0
         bWmpq6POfYu/P29iDgth8P84yoPs+8m9aUEEL01DJzj4vi/okbzBQRkzlswYflLECBq9
         fwNF0GMPdQIkxkzAFQLEoiVYyep240uAmNq7myOdk0eBERH41ks7D3Sl1QyUCqoTlut5
         vDkDemQTO8ciWIUKk2XvJqLUJDXzGmaz4q9XG+/tFAjOx92alXDg+SuxXovtoXR39x+a
         R+R4OsDxJ3MFdgxhOWs0Oqzh2roAhjXxDR+hedYUtvgaaOn1QpfR/HnNeojmOyBPzPlZ
         8Zsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728386236; x=1728991036;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JciPD3Kds7CPkAVP6VNzM1EEeODN/Rh825zly+fAF84=;
        b=FMFkql+mi3A0gSNbcT5pkTJP6/ZGw7kiZ4Yx+mCv4g5eLjbohyIGazAeYzmEconK8r
         8TPbOfbe+t77ulA+xaLnQnUi9O+OYC8FxIFhXwmh8Fi4ISho+/FBghFjDwlY1wugw0Qz
         aO5Fh3xk/ik7YdFLeHBmfMYnoylplra2I8fl2N0NVwNntV8X4kdmrOAjAkLT+DGykxNf
         3aUNBCetUk3g0aohGry1FIz8pUI15wJAwqCDSwERi5ukR9jhN5FPCp/9v4rDoZLDEbJ/
         ciDzn8ZSliOp6v83HUmatcZwrjyai/I3vasZy+blS+SKDcQaoMM0LvaLcQaj+eoZVBbD
         Su1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVLybVqQWDr4tYHHxeBkMK5QVOWMRXA+7oYl/PIbswVDxtshNMVU2BTSVh+SSAgeNfS57KBAW4/rJBViw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4JUqpz8jnDztOqFGG6q8FnvVHlo0r8oS67zNzP/dBluhMg46t
	BOE1INkoUQ434EoJqncC7EhIamz49MDbpupY4N/CN1vc4rrH/XfcGk5BlLJHfR0=
X-Google-Smtp-Source: AGHT+IEAFSTz5clJF/IkCMELN4GqRyE/D0UXIDSHPlX2c7AW19xZoI1TFNw/XfTjQpRGOTp4fbfP1A==
X-Received: by 2002:a05:600c:590b:b0:430:52ec:1e2a with SMTP id 5b1f17b1804b1-43052ec1fb3mr5626555e9.7.1728386236532;
        Tue, 08 Oct 2024 04:17:16 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4305254ff6bsm15704655e9.18.2024.10.08.04.17.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 04:17:15 -0700 (PDT)
Message-ID: <e5561ad1-5ee8-4e2a-89fe-e5c78cd29136@linaro.org>
Date: Tue, 8 Oct 2024 13:17:14 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: media: qcom,sc8280xp-camss: Fix
 interrupt types
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20240923072827.3772504-1-vladimir.zapolskiy@linaro.org>
 <20240923072827.3772504-2-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240923072827.3772504-2-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/09/2024 09:28, Vladimir Zapolskiy wrote:
> The expected type of all CAMSS interrupts is edge rising, fix it in

Please re-phrase the commit msg to explain who expects it ("expected
type"). Further discussion lead to feeling that you based it on drivers,
which is obviously not enough.

> the documented example from CAMSS device tree bindings for sc8280xp


Best regards,
Krzysztof


