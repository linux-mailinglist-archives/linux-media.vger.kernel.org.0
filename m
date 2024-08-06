Return-Path: <linux-media+bounces-15875-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCC9949BAA
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 00:57:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D525A28339C
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2024 22:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1238175562;
	Tue,  6 Aug 2024 22:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BJ2FN07w"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D4F16EB7C
	for <linux-media@vger.kernel.org>; Tue,  6 Aug 2024 22:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722985065; cv=none; b=p2iT/kTe2opdSoEhst+uewY2dNuMV2bHBwDnIr2KN1X1KBVwXfUJtbXw+CnvqhFbE0Kv/tZgQOM0vBwDQ7xU67BItqxZq6Pbh3gZuofB1w8jZmoILPF2VmcENnsVn5Hdj/A2hZHQcr8zKrXxTOhKzwa2Ygna/+ZxL5+8Mw6gsgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722985065; c=relaxed/simple;
	bh=f/pBBmuOnXggjReY2gD2qrwLemd6tOUCzjyvi/3XbbA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=GsoJkKOY4DmsbB0mfR+LOKGoMhA96iAW5I+S2QZrHI8XZwBkhvqM11Uz5kfNLcXa6c5V9D6ZDuflfQSVZk5lRQODpcz96A0usZPdozN+4MCipRQ3VDW8pgJja5gXhpbpdTgT+PPg1TtGvZMvxvZOBAmOYQU53bAIy83xbEo1fEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BJ2FN07w; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3686b554cfcso669798f8f.1
        for <linux-media@vger.kernel.org>; Tue, 06 Aug 2024 15:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722985060; x=1723589860; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tl/MWzipv4Gj3gjH7wNOx3y0c0rYys7Mj781hb5lquE=;
        b=BJ2FN07wrWCosQEPkcn42WpkLCAu5ybV26BeOh+cP60VrbSHnvPhQuQ1Bvd5sMHWf/
         Rn0PTsf70NysFf22hFaYE/cuanR4S2tMB0mbuw7demkdiUNGDja5LUfJ6I3Qm8TV9ty4
         s5xCL5AzedGLZ1ylwt1pSbPFCa8/znkFtlPb10YkWPSwffhd66GeAGGvbpq+WZx9jM+/
         AX1/6LlLaq9VEVWlJA72R8Yy1jlyVDGzpMctnsoRwcRgWkLYy1eeGhkJNZDL58YAGzem
         CCE1Tls6n0wDgUYk0Fz+UNTQlYYrDaD3ZTAejEaQfSCHP2v3fo408IBMizawcp+krx9K
         4rXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722985060; x=1723589860;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tl/MWzipv4Gj3gjH7wNOx3y0c0rYys7Mj781hb5lquE=;
        b=aRFuOE2R4sTOmOAzbtIPBixRKI4yzzWBE4JFiC/NS8Jo4t8nG50G3F+mDs6y94Dxoa
         3hst3Gnr5JE6ji+7F3BQ2mCCMpkkdHdJzvoVeiaqPUm2NQN4oDLea7b8Or1DCtOxBeOh
         Rij1yEUhQXakrI1Tv8SWAARl+solyveCXgQueRjWB/SrC36NBK+E6FYTGGHUG8udgYSB
         +aLJy3jUIIo6XkkoPyOUX9686GiM/OVotAZpurVw5GDvYOJUSx4KbNoLV1txQXiLNX8W
         vqBqqiZRhEKUL3DVGO5mvgdbQzhKAtnQ9wtoiLfx8BSAFP21a3MJdFezdggeEbbC0rbZ
         0crw==
X-Forwarded-Encrypted: i=1; AJvYcCWLXnUp2uU9459Y/3dLc0aH2FSfG6Jc1hY6T3m2oMgilKH7rZdmDrhN1zMNmebMyOKV9iFaYM6UhEPXhY5dPzqG9FyxHV/CkZVj1w8=
X-Gm-Message-State: AOJu0YymdJ25HifVRT93f0jbPTro6nJ082Pcv4IyN5VSHPyIQpcwejyH
	/ANWqcS6ndFGqU/S+H6vG9JCElt896oRsmfTRsmrycCOilb+nmeWzYvs0Q5Em/k=
X-Google-Smtp-Source: AGHT+IH7rR+SRmN+gNYTX4K5kNRsgPXma/GQhS91xFWug6zHqokpJE1Qj0+/3o4GvWmUN7xbKFg36A==
X-Received: by 2002:a5d:5e11:0:b0:36b:cc42:29f9 with SMTP id ffacd0b85a97d-36bcc422dbcmr7995868f8f.51.1722985060360;
        Tue, 06 Aug 2024 15:57:40 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290580c720sm1611035e9.41.2024.08.06.15.57.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Aug 2024 15:57:39 -0700 (PDT)
Message-ID: <81192a77-ec22-45bd-91d6-4a0ec381a6f3@linaro.org>
Date: Tue, 6 Aug 2024 23:57:38 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: media: camss: Add qcom,sdm670-camss
To: Richard Acayan <mailingradian@gmail.com>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20240806224219.71623-7-mailingradian@gmail.com>
 <20240806224219.71623-9-mailingradian@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240806224219.71623-9-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/08/2024 23:42, Richard Acayan wrote:
> Add the camera subsystem for the Snapdragon 670.
> 
> Adapted from SC8280XP camera subsystem.

Hmm, I'd like a little bit more of a commit log here. sdm670 as found in 
"spiffy device X" contains N CSIDs, Y VFEs.

Its not super important but a description that is device specific would 
be nice.

> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>   .../bindings/media/qcom,sdm670-camss.yaml     | 353 ++++++++++++++++++
>   1 file changed, 353 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> new file mode 100644
> index 000000000000..543fad1b5cd7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> @@ -0,0 +1,353 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
> +
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,sdm670-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SDM670 Camera Subsystem (CAMSS)
> +
> +maintainers:
> +  - Richard Acayan <mailingradian@gmail.com>
> +
> +description:
> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
> +
> +properties:
> +  compatible:
> +    const: qcom,sdm670-camss
> +
> +  clocks:
> +    maxItems: 33
> +
> +  clock-names:
> +    items:
> +      - const: camnoc_axi
> +      - const: cpas_ahb
> +      - const: cphy_rx_src
> +      - const: csi0
> +      - const: csi0_src

These "_src" clocks should be dropped.

> +      - const: csi1
> +      - const: csi1_src
> +      - const: csi2
> +      - const: csi2_src
> +      - const: csiphy0
> +      - const: csiphy0_timer
> +      - const: csiphy0_timer_src
> +      - const: csiphy1
> +      - const: csiphy1_timer
> +      - const: csiphy1_timer_src
> +      - const: csiphy2
> +      - const: csiphy2_timer
> +      - const: csiphy2_timer_src
> +      - const: gcc_camera_ahb
> +      - const: gcc_camera_axi
> +      - const: slow_ahb_src
> +      - const: soc_ahb
> +      - const: vfe0_axi
> +      - const: vfe0
> +      - const: vfe0_cphy_rx
> +      - const: vfe0_src
> +      - const: vfe1_axi
> +      - const: vfe1
> +      - const: vfe1_cphy_rx
> +      - const: vfe1_src
> +      - const: vfe_lite
> +      - const: vfe_lite_cphy_rx
> +      - const: vfe_lite_src
> +
> +  interrupts:
> +    maxItems: 9
> +
> +  interrupt-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe_lite
> +
> +  iommus:
> +    maxItems: 4
> +
> +  power-domains:
> +    items:
> +      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
> +
> +  power-domain-names:
> +    items:
> +      - const: ife0
> +      - const: ife1
> +      - const: top

Named power domains, maith on fear.

Provided you fix the above and Krzysztof is happy, you can add my

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

