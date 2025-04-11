Return-Path: <linux-media+bounces-30016-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 60701A85C53
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 13:56:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A9814A0A91
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 11:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C7D1298CD5;
	Fri, 11 Apr 2025 11:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kJiVmiJ0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBADC298CB0
	for <linux-media@vger.kernel.org>; Fri, 11 Apr 2025 11:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744372564; cv=none; b=adJMr9oYvrZBjZh5o3FaZj1M3oVImaSfJY+Bo6MwDncDYKc/f6n/9CQO8yAHCWFRaZ/QNnKzLzN2GOz37db4NeiSnobUKzY6v1XViU6K8TnyBgcy8PHOVJa03ICTo6BLDg9jrF+wUk+8aSJSJ7TyAq5bO6FRz9r4gMhva339MRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744372564; c=relaxed/simple;
	bh=Cu54TXjKIVZN6OAhdDN2EqzH3UTCuwiaR97H+gM+NIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cpyBiH0SExSOEnxWPxFj0McCZzrmu3Ce9WaoeY1vlC3QMsO1Yhn3mUPw37Zxsh7mT3zZ75GuP4MjH5thFrchHs8W+x32ku9HkiyWMPpZe470WTAltodvALSMPG/P+UAtet4ml1hfac+PznU+ZJFjtEvmKFaQItWNXpZzXedZJ1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kJiVmiJ0; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf848528aso14510995e9.2
        for <linux-media@vger.kernel.org>; Fri, 11 Apr 2025 04:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744372561; x=1744977361; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pN3Z/ARVuoJpkU2wn9E4JVR2ARLig7yuShvQyV5vTWo=;
        b=kJiVmiJ0o5xL5LjcyqlwexgNPuYrSenk13Gj7X6weR9HUD+I2xBcw8I5ZepAE+Zo4s
         u6XdTBw+rr3+WlggBw8cq9/nmG/TwmxedAe3G7YEEegPAfAErQtWQW21tOAFI7WJS3tn
         FH9N8md1StgMJCilG+ySiZLZCTq6uFBsfVsJVkYN6d8shUT3mhdjflfFpcgV+9W/J314
         Z8M70xXxQ0dNEqJKEBg9xfR3AuZkP7IZiplwBctVPYtAzLGqrukxOWG9xE4lhSMGfUqt
         2SWSnpKPgVu06APhJ1uMxL8IOeFXfVLuEZ7mB3aJvqvelWgcTwuTIC9dfuF4eSPTYFo9
         XnPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744372561; x=1744977361;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pN3Z/ARVuoJpkU2wn9E4JVR2ARLig7yuShvQyV5vTWo=;
        b=vVkBZNpaZsb8eEBiznoHaBagwCkFc8BIah4DEltX/Mdvh3yr+5AqYVGQd3r8RJH7yS
         K+eiQwb9W+sNBvU1fo4wL47lLNkJu4/gVORpUx62i/4pfZkteBUe7CnK/aEr72wVLROD
         heEbxjqCJLZ40OxUKeSOUK3gugOVV2PYakhRu7pTR9WcxUppfX1A3I6YdyaXnm/NRWz0
         7q71YmbSjdeVsHHEzS/p4moVWGf+EDiCzvJCnkA4/jnQ2HJmSbscxfYC5MERsx1mVWhU
         6/PN8YUdHjHz0MlVFQj+xSCe//rTewTRJypKY/e+mQ3Gj0hnGPIqGhecFBQR+W4dZ+VL
         /Oqw==
X-Forwarded-Encrypted: i=1; AJvYcCVfofkz85rsj0Arn9wdI88r3ZhH6xGYmLLDNE8PMxm5bSQCPvjGVkzT0NNj2ZhcjfLmsId0FFDLCjJ3GA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4dfUHiocK2LnzAK/l7VbCKjLM79r3PT9X9RDKE0GIMprPnY1l
	9yppIWSf2AOapI3PAUQS/UvfwszAXt97BH/QRM7Sbe8M9bvuWNoerrxubfDvTqQ=
X-Gm-Gg: ASbGncv1Rj1QSf+bGIc2gXBTBJH5AGqb1SMpNJnRJWWbGnT0nHPVRIjzLEjTBOvxGyw
	CSvAuKE3mjWuq9b8nCITNPY8853a9aGmXSQmpaR2i+V1VWY0a/tN5LMdtcj5A0dtVfW8QJn52e8
	G/IU40FYcRr8NtOnKLYXRBhUcz2u6q6b1jm1YS8GKVlNRekV6d4xnqHdBfkPW79KZSkZF/OMZAR
	+gJLHKl0CmsCsXBhXfWvgP7rEperqSivNSxMzYi9pl0W9gSGhyxlah7xxXNIKS3vZ4dx7dxAmHD
	4runPgLwKiHxqiDn2HD1YnyTQ905GXN4WZwaruJw9n18v10GB4LPuinDFFQfdO1J+9DyqvGL4rn
	bmLRi2Q==
X-Google-Smtp-Source: AGHT+IGVwOsUyWKd/jj6a1Um5rgiAl9+zquoh9lJ8O3dxy1geRt6jJtBs9BvSvmSdZVORllOzBbeqg==
X-Received: by 2002:a05:600c:3c91:b0:43d:49eb:9675 with SMTP id 5b1f17b1804b1-43f3a9a68a1mr17951445e9.22.1744372561107;
        Fri, 11 Apr 2025 04:56:01 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2066d109sm85985325e9.20.2025.04.11.04.56.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 04:56:00 -0700 (PDT)
Message-ID: <fa6ab24d-80ea-42f0-b764-b8596e6b724d@linaro.org>
Date: Fri, 11 Apr 2025 12:55:59 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v5 0/8] media: qcom: iris: re-organize catalog & add
 support for SM8650
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <sSGjuqPKGTjE9al-J0RHMuA3Rk7hIh9x9RMWNefg93pJOOacQodM38LE11xl4vmO1I0OgSZFYR2sblISUxkPeg==@protonmail.internalid>
 <20250410-topic-sm8x50-upstream-iris-catalog-v5-0-44a431574c25@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250410-topic-sm8x50-upstream-iris-catalog-v5-0-44a431574c25@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/04/2025 17:29, Neil Armstrong wrote:
> Re-organize the platform support core into a gen1 catalog C file
> declaring common platform structure and include platform headers
> containing platform specific entries and iris_platform_data
> structure.
> 
> The goal is to share most of the structure while having
> clear and separate per-SoC catalog files.
> 
> The organization is based on the curent drm/msm dpu1 catalog
> entries.
> 
> Add support for the IRIS accelerator for the SM8650
> platform, which uses the iris33 hardware.
> 
> The vpu33 requires a different reset & poweroff sequence
> in order to properly get out of runtime suspend.
> 
> Follow-up of [1]:
> https://lore.kernel.org/all/20250409-topic-sm8x50-iris-v10-v4-0-40e411594285@linaro.org/
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Changes in v4:
> - Reorganized into catalog, rebased sm8650 support on top
> - Link to v4: https://lore.kernel.org/all/20250409-topic-sm8x50-iris-v10-v4-0-40e411594285@linaro.org
> 
> Changes in v4:
> - collected tags
> - un-split power_off in vpu3x
> - removed useless function defines
> - added back vpu3x disappeared rename commit
> - Link to v3: https://lore.kernel.org/r/20250407-topic-sm8x50-iris-v10-v3-0-63569f6d04aa@linaro.org
> 
> Changes in v3:
> - Collected review tags
> - Removed bulky reset_controller ops
> - Removed iris_vpu_power_off_controller split
> - Link to v2: https://lore.kernel.org/r/20250305-topic-sm8x50-iris-v10-v2-0-bd65a3fc099e@linaro.org
> 
> Changes in v2:
> - Collected bindings review
> - Reworked rest handling by adding a secondary optional table to be used by controller poweroff
> - Reworked power_off_controller to be reused and extended by vpu33 support
> - Removed useless and unneeded vpu33 init
> - Moved vpu33 into vpu3x files to reuse code from vpu3
> - Moved sm8650 data table into sm8550
> - Link to v1: https://lore.kernel.org/r/20250225-topic-sm8x50-iris-v10-v1-0-128ef05d9665@linaro.org
> 
> ---
> Neil Armstrong (8):
>        media: qcom: iris: move sm8250 to gen1 catalog
>        media: qcom: iris: move sm8550 to gen2 catalog
>        dt-bindings: media: qcom,sm8550-iris: document SM8650 IRIS accelerator
>        media: platform: qcom/iris: add power_off_controller to vpu_ops
>        media: platform: qcom/iris: introduce optional controller_rst_tbl
>        media: platform: qcom/iris: rename iris_vpu3 to iris_vpu3x
>        media: platform: qcom/iris: add support for vpu33
>        media: platform: qcom/iris: add sm8650 support
> 
>   .../bindings/media/qcom,sm8550-iris.yaml           |  33 ++-
>   drivers/media/platform/qcom/iris/Makefile          |   6 +-
>   .../media/platform/qcom/iris/iris_catalog_gen1.c   |  83 +++++++
>   ...{iris_platform_sm8550.c => iris_catalog_gen2.c} |  85 +------
>   ...ris_platform_sm8250.c => iris_catalog_sm8250.h} |  80 +-----
>   .../media/platform/qcom/iris/iris_catalog_sm8550.h |  91 +++++++
>   .../media/platform/qcom/iris/iris_catalog_sm8650.h |  68 +++++
>   drivers/media/platform/qcom/iris/iris_core.h       |   1 +
>   .../platform/qcom/iris/iris_platform_common.h      |   3 +
>   drivers/media/platform/qcom/iris/iris_probe.c      |  43 +++-
>   drivers/media/platform/qcom/iris/iris_vpu2.c       |   1 +
>   drivers/media/platform/qcom/iris/iris_vpu3.c       | 122 ---------
>   drivers/media/platform/qcom/iris/iris_vpu3x.c      | 275 +++++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_vpu_common.c |   4 +-
>   drivers/media/platform/qcom/iris/iris_vpu_common.h |   3 +
>   15 files changed, 598 insertions(+), 300 deletions(-)
> ---
> base-commit: 2bdde620f7f2bff2ff1cb7dc166859eaa0c78a7c
> change-id: 20250410-topic-sm8x50-upstream-iris-catalog-3e2e4a033d6f
> 
> Best regards,
> --
> Neil Armstrong <neil.armstrong@linaro.org>
> 
> 

Please fixup this

0007-media-platform-qcom-iris-add-support-for-vpu33.patch has no obvious 
style problems and is ready for submission.
0007-media-platform-qcom-iris-add-support-for-vpu33.patch:7: slighly ==> 
slightly

also accounting for my comments in patches #1 and #2 you can add for the 
series

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

