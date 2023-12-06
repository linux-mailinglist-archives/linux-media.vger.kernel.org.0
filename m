Return-Path: <linux-media+bounces-1741-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2DD806C00
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 11:34:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE01F1C2096B
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 10:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDFF12DF92;
	Wed,  6 Dec 2023 10:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lY1Xg/Ev"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E67B1B5
	for <linux-media@vger.kernel.org>; Wed,  6 Dec 2023 02:33:57 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-332fd81fc8dso554592f8f.3
        for <linux-media@vger.kernel.org>; Wed, 06 Dec 2023 02:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701858836; x=1702463636; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vNWpu2Kl2fcT2EkQne/K9Yh75bFrD876NBGFXjjHEOg=;
        b=lY1Xg/Ev7Cep1nYHjYiK9Gi6e4ExyoOnOq+R/RG9SWn/xLRp0vZ7ukzDs0SUHWYNhI
         orm348jvSLqaY7x2345X+0L03k6zMDD8mViBxWN9NYZJgSWjIBYpggvHckmVAGU8cKEy
         1XakOpMDcjYJ6KpmffM93eqpKCeujm4e+DTrRKUVvF+4iBoZPhJLD+V/sMI+yLh/cdJN
         O3HCPGNkWDPXW/C0hBfIJt/ThX1OuQaQnaG9kMsjsKG8YudcEDagzaUHmrESf/SK+sou
         YTMlR3FE1MFRaI/5nV/Szy0l2J5BFxpt8q95wrBFAXHLIFr3lDH05eTcVzmWVDkWwxip
         cucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701858836; x=1702463636;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vNWpu2Kl2fcT2EkQne/K9Yh75bFrD876NBGFXjjHEOg=;
        b=FynwiPDxdHrl0k/ZpjsXaZ+7pU0nQ+mZ0WTyFBjQ920HSwgzFDn1s2ca4ILO/haMy7
         nipczQeX2bJYmozIpPOMWnQO7DiaPe2so89vVcc4n/ZDDl4hCVOz9DDw9L775rVR5F+W
         6+SlaU+cw4NXqQyOXV03csRy1U0TZkjUgE6l+ubwPzJPv2ysrPuMEi41gA+u8+fsu0bI
         tcLf9wBW2ineiwmCMungdUaE3ydqS/RPLE4HY4gBa55HWVB0+r6fS4GSNK0g2Ft4S/xP
         VhWB+RFPbDXALVn7kcEq/12sGJu/iDSeRU9uyJxF87+4hgWQXgpH8qTkt0RquTD7bH21
         mCSw==
X-Gm-Message-State: AOJu0YxwJYk79dd77JvVvcNoncg7p/WZ/fVITszR+IFbrALx4D5FWYN+
	6EtFNk71EboJWbsMFMHHQb8JIp8Gvf2wUAL9oJY=
X-Google-Smtp-Source: AGHT+IFHTfiHp66DAws9nAd4BCQOEM5XE2vOuXTqoXBYrnMXfJG6nRGYhpFVphsYKk2ITaLUqrIXhQ==
X-Received: by 2002:adf:e70e:0:b0:333:2fd2:68d9 with SMTP id c14-20020adfe70e000000b003332fd268d9mr394424wrm.108.1701858835916;
        Wed, 06 Dec 2023 02:33:55 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id b14-20020adff90e000000b0033346fe9b9bsm8429100wrr.83.2023.12.06.02.33.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 02:33:55 -0800 (PST)
Message-ID: <91188ba1-fd37-454f-beb1-0119bd24d3c8@linaro.org>
Date: Wed, 6 Dec 2023 11:33:53 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v5 11/11] arm64: dts: fsd: Add MFC related DT enteries
Content-Language: en-US
To: Aakarsh Jain <aakarsh.jain@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: m.szyprowski@samsung.com, andrzej.hajda@intel.com, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, krzysztof.kozlowski+dt@linaro.org,
 robh+dt@kernel.org, conor+dt@kernel.org, linux-samsung-soc@vger.kernel.org,
 andi@etezian.org, gost.dev@samsung.com, alim.akhtar@samsung.com,
 aswani.reddy@samsung.com, pankaj.dubey@samsung.com,
 ajaykumar.rs@samsung.com, linux-fsd@tesla.com,
 Smitha T Murthy <smithatmurthy@gmail.com>
References: <20231206063045.97234-1-aakarsh.jain@samsung.com>
 <CGME20231206063140epcas5p1ba86525117f4d9ec9172ae7cb18b7420@epcas5p1.samsung.com>
 <20231206063045.97234-12-aakarsh.jain@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231206063045.97234-12-aakarsh.jain@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/12/2023 07:30, Aakarsh Jain wrote:
> Add MFC DT node and reserve memory node for MFC usage.
> 
> Cc: linux-fsd@tesla.com
> Signed-off-by: Smitha T Murthy <smithatmurthy@gmail.com>
> Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>
> ---
>  arch/arm64/boot/dts/tesla/fsd.dtsi | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)

This should be merged via Samsung SoC, so I will take it once bindings
get accepted.

If there is going to be resend of entire patchset, please don't include
this patch in new resend. If this patch needs resending, send it
separately and provide lore link to the bindings.

Best regards,
Krzysztof


