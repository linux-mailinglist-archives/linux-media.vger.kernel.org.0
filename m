Return-Path: <linux-media+bounces-10479-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DF88B7D43
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 18:38:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E80DB287C91
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 16:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAFE1DDBE;
	Tue, 30 Apr 2024 16:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dhGV+ZdJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B9E4EB54
	for <linux-media@vger.kernel.org>; Tue, 30 Apr 2024 16:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714495038; cv=none; b=YCFxmnPE7uCtIV326IZZIfqZIzty4zQewUhZO9vU65rfC0Ob0tuJk1YtirUIHQ54kjw20P3r9KflB7BJs3QDOuUc0G/rzVpcWOncrWlu8lZHCM689IQfCQOqsF6pFO5qrO40fYhUjn03smswwc8JTYDZhkT64rCWxKMrL832FTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714495038; c=relaxed/simple;
	bh=9CpN840f2wTT9zTjYM6ElxKvLKgIrVf9hv1SbuRDWgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kIbuIcxhozvh/RTMEmIlzqOOBM4DqA23K0MT2HkrsA601WtgRU53NE8H1JfGtiT9EjJGRnC8QhdqC3SsiICKkCW4ACvJUcmsvIKKK2Z2fZkaTkiiXMcc1Wqt85HKW2ZYsY1hMMbQwePOln2nsqrEul//OxyS/RHCEuXIdZZlF4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dhGV+ZdJ; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a4702457ccbso785012466b.3
        for <linux-media@vger.kernel.org>; Tue, 30 Apr 2024 09:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714495035; x=1715099835; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2NrGBRSW1H5HEb8rlYybZvtI0xpQurZ+vyDd2YBGwSg=;
        b=dhGV+ZdJlAYlNnBwG9wPPyTjIiSZ35I5MOVWhD7Q3SocdN3YpZPoVlnKk4pMNNV7xD
         z0YJkq2Tou0O8K328zMEym0TCbxgMMP3bX9lzdnacUJx4xymmw1xZB1xyKMFSRZZbSLI
         +A7HU+bAjQCUVEb0G1q8SoIZtpRgkRJ7q3FCXyg5us8g0L93KPXu7zU2s0NfaxCyU4Ju
         pICs5cY3QGGqbp5hGacmk2h5FHCQ72O99CHXDFdXYoDRmldCsiKgiqjTS8XNEsaC2z53
         dpCZkEGwLZw7RhifDufpY0dqmLszaGDTLt6q49G37qO35sqLufTexio4SlUciLvgLm+2
         D+aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714495035; x=1715099835;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2NrGBRSW1H5HEb8rlYybZvtI0xpQurZ+vyDd2YBGwSg=;
        b=oMgUVT984Ma/dlN6rEFHK1oC2s1nEIlmXdqRM+4LHXt7kA869Rl2IEW4OjBD5ybXSL
         Pn+ODogzm/ZgYLVU7sanE0gPCi2p+7R5F5u2VqlzfMllWbq8ba7YKKyphxErRWdsbmu/
         GLnqLgfwVWWdnjMsFAfMQ3qsWOO1FBzqdE//hPiYLS8H/Ds80rqOeOa1iYQDXvrjmIsw
         RrfSpRw20Ya2IbmXS92cZ+6/EUvyzX6fZhM8UmJU7edF4sijGU9TK9hQXTai2dkUgvXy
         vEcpFdmD4bTIcK9fJfE7cg1jRo+aDaHHEe3KNF69/qLUDeKwShv1F0Gzgw6vKL0JOm+/
         m7mg==
X-Forwarded-Encrypted: i=1; AJvYcCXdhjzhcrC5gxcATfoB9rN5ROQ/2QImPMxkV8fPA3oGrFDtRYusbINrX3tKbl0hPJki7+OLc7A8XvdRnta1uC3ipJEsNFdA+jE0fNA=
X-Gm-Message-State: AOJu0YxNixsaN4qa3N08wIKyT5mJvWyRbof+ChGtw4ILeKJINu95jKFO
	tS5nhOFOzkuh9jcETgpAqssuLRP1EcK4vRthZteg7Udfcp78wkkiZiZpAuJGZ8s=
X-Google-Smtp-Source: AGHT+IGvSOBJo6lnod5DMBhu3GxWe/i83cG660ROXgVUIpjVTSsHSXsW/BwD81ZbvNPgTNmKsvwR7Q==
X-Received: by 2002:a17:906:4f91:b0:a58:ec38:be74 with SMTP id o17-20020a1709064f9100b00a58ec38be74mr198644eju.17.1714495034604;
        Tue, 30 Apr 2024 09:37:14 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id i21-20020a170906a29500b00a526a992d82sm15282670ejz.4.2024.04.30.09.37.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Apr 2024 09:37:14 -0700 (PDT)
Message-ID: <6bfe3573-a9a3-4d7e-ad77-d1ceea625ebb@linaro.org>
Date: Tue, 30 Apr 2024 18:37:12 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: media: add qcom,msm8998-venus
To: Marc Gonzalez <mgonzalez@freebox.fr>,
 Bjorn Andersson <andersson@kernel.org>, Jeffrey Hugo
 <quic_jhugo@quicinc.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>
Cc: MSM <linux-arm-msm@vger.kernel.org>,
 linux-media <linux-media@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <ff646f97-68e3-4fef-9b56-2bd98f0cbe7d@freebox.fr>
 <4f99f0a1-1fae-42cf-a8ea-0f859e9818b9@freebox.fr>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <4f99f0a1-1fae-42cf-a8ea-0f859e9818b9@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/04/2024 17:30, Marc Gonzalez wrote:
> msm8998 has the same video encode/decode accelerator as msm8996.
> 
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


