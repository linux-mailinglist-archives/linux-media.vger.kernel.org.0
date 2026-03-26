Return-Path: <linux-media+bounces-57111-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8N8jIFORxGnH0gQAu9opvQ
	(envelope-from <linux-media+bounces-57111-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 02:52:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B13632E0E0
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 02:52:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BB8E4302BD52
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 01:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67E1A38F926;
	Thu, 26 Mar 2026 01:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z0jzwhZ5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E30637A496
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 01:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774489889; cv=none; b=Aw5q984nt9LFZjAd8QRut1FNRT9BS1VB9fV3sC4nYHe0qZZCB9bF5oQc5Ht1iomOzc0j9zsCOY33SwupEHqsTfkhrOV6SO4MREpu2k3gMd+Y2bCJIVkav3uRwC9b0taDkQT8xOJPUC33tT2rTX2JPGXbPtUA534Q0u/ze0gSzpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774489889; c=relaxed/simple;
	bh=rUxcPY1pKjNKkuCXrvvt2Y64QqdkwyCUDmgJEVlUu1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yo9fha4dxUK7xcIKvg0CWbG0XJPOLbgCHKsGnP4FjvwLQov3M3L4DQGqS248ryi33suWC9VCh/K0xxu+gehblya5WiVQsyb9elNldpXZSkXW5IbV3QsesX/aJu85nvcG72iOTwlVz4A4WIDxrUDvZWriqaoclIfJZLPastuCHs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z0jzwhZ5; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a277d9c5b2so85508e87.0
        for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 18:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774489886; x=1775094686; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=66PFHV45L6JK0kry67ATm2uMaTr448PNAnY9DrkuAGQ=;
        b=Z0jzwhZ5VCZrEG7aMHOE4DuQCvbcopnNUuw4YMLPimt/BcEk8EoX/LXUyktCv8NB+f
         tOPnRNvvs+MGYUOuVVgORuBdbL+Vze2oYzeqmXnigPByc/iTnG5rG41bErWgcXzY+vIW
         hgli3quiszUd/fJ5qLfaay6B3QnfhEsr7BNDaIujQ7a/YF0YGfwUumAXqaD+//vqXQqR
         P66T8YMsUfyMlK7x8U1a5Il3fyurLF9l0a9pCpSYa5EigUyttaK35Mjas9UOOPCJB5Wb
         3OBirHB/rMQXctCp4aaTIQQRjPGHD1OhWZFWyncuQF0UNOrn2jcP/tNPnIdXFEID39K5
         /mnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774489886; x=1775094686;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=66PFHV45L6JK0kry67ATm2uMaTr448PNAnY9DrkuAGQ=;
        b=UMriu5qFKd/r8rvmS+rwg2hFiQPyNcfSALDuYDFY8CSMbfvnu/eAxsiAobDgGwOGB0
         QZIMQ8J/affTt0tpuFPztWS5Zu5jmO6RoqGq74BWsaoZKmZP9i3apIIsL+a+tfEbu0S5
         vFP8lBZQoAKtt8/jTOSV5Pdg/CtpiKAjl4fQBgTBNU13gGLVdLpvFUSj/GhdiVSIBEqK
         7AQw22RcyEEc4NgFQYOyuZ185Sgf7nVZEeuSNVyALlAqfHov7UCFrfAoZ0b9yfr3g2+o
         ivgdni5tTqvylCKCxF6zdC2UD3Qduf9G5WOfeqoqRW4MLjyVJpX/FUNfwPtsVwHepl3S
         ojlQ==
X-Forwarded-Encrypted: i=1; AJvYcCX54F4rIbuf5Hn6FjdRH5BqdaxGXwBsW9nqumoMeBcXgE/zYPrJjyTepCxHWCTEZJhKBuDXdwXy4TqOMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YygLuzcr/UiIx/lRTqLXcD0pA2qvDpYml6lshjv4yc2LtD3M/9c
	x6HWPxaBuHPAMYwHLnIRHL9R0gJ0X4y3kSFwsASz6u1LC+iMTv5HIlF2cbbd2tJ41lLx/HflfAV
	GUIQz
X-Gm-Gg: ATEYQzxMoMXYjycSwBuwql6avyRb7mCaKDmE2ne+ocLRSPb/HjdqtgalSiflNDfEK90
	AlVm2WdxbUJKPnYA0D1KGo7m2jNmseEFSmeG1vy9++ZKEPyZZvLw6x4sxHOz01xewc2moCHE6pK
	03Nst3cJj0QrpAQMtK6D7H+ZL0b9JqvUoPMgatdeHQ/E5HwMfAn2kNYEnMArrTZCrjp5oP78mJ7
	yAtx2Igrc18no9J2A2WSWXVqnYkDHhExNhNiBtFzKrepdzKR7Z2FX8Kvsrv/JxSJItverVpy05t
	D6ew8r4euBZVaQAL2SkCopoOex4vhENQ7XPDYgurTc5OI5HFxW4B4FXurFWhEydM/cXLiEWudVa
	6+hyLAhN4qPTXnD0GiUZtcHQIR16dr/X7OikBklBxfI+72hynTn6HcIqnSZaLKJGNJw8QlqZNcB
	H5+Brtgo54/ENFhIVFkRTEkHDbawwxSN6/uXPSaeQKcCgYe7yCzKUSnQ/cerylyIOoPB/OysfjG
	MeFgg==
X-Received: by 2002:a05:6512:33d1:b0:5a1:2ec0:7442 with SMTP id 2adb3069b0e04-5a29b947c2emr1087597e87.0.1774489885671;
        Wed, 25 Mar 2026 18:51:25 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2a063ef5bsm252287e87.17.2026.03.25.18.51.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 18:51:25 -0700 (PDT)
Message-ID: <17ab70a4-1ab8-4384-8537-44dbfe31889a@linaro.org>
Date: Thu, 26 Mar 2026 03:51:24 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/7] dt-bindings: media: qcom,x1e80100-camss: Add
 support for combo-mode endpoints
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Christopher Obbard <christopher.obbard@linaro.org>
References: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
 <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-2-5b93415be6dd@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-2-5b93415be6dd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,baylibre.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-57111-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,0.0.0.1:email]
X-Rspamd-Queue-Id: 2B13632E0E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/26/26 03:28, Bryan O'Donoghue wrote:
> Qualcomm CSI2 PHYs support a mode where two sensors may be attached to the
> one CSIPHY.
> 
> When we have one endpoint we may have
> - DPHY 1, 2 or 4 data lanes + 1 clock lane
> - CPHY 3 wire data lane
> 
> When we have two endpoints this indicates the special fixed combo-mode.
> - DPHY endpoint0 => 2+1 and endpoint1 => 1+1 data-lane/clock-lane combination.
> 
> Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   .../bindings/media/qcom,x1e80100-camss.yaml        | 69 ++++++++++++++++++++--
>   1 file changed, 65 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> index c17b9757b2c86..f44138f522bba 100644
> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> @@ -148,7 +148,8 @@ properties:
>       $ref: /schemas/graph.yaml#/properties/ports
>   
>       description:
> -      CSI input ports.
> +      CSI input ports. Supports either standard single sensor mode or
> +      Qualcomm's combo mode with one sensor in 2x1 + 1x1 data-lane, clock-lane mode.
>   
>       patternProperties:
>         "^port@[0-3]$":
> @@ -156,26 +157,86 @@ properties:
>           unevaluatedProperties: false
>   
>           description:
> -          Input port for receiving CSI data from a CSIPHY.
> +          Input port for receiving CSI data.
>   
>           properties:
> -          endpoint:
> +          endpoint@0:
>               $ref: video-interfaces.yaml#
>               unevaluatedProperties: false
>   
> +            description:
> +              Endpoint for receiving a single sensor input (or first leg of combo).
> +
>               properties:
>                 data-lanes:
>                   minItems: 1
> -                maxItems: 4
> +                maxItems: 4 # Base max allows 4 (for D-PHY)
> +
> +              clock-lanes:
> +                maxItems: 1
>   
>                 bus-type:
>                   enum:
>                     - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
>                     - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
>   
> +          endpoint@1:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            description:
> +              Endpoint for receiving the second leg of a combo sensor input.
> +
> +            properties:
> +              data-lanes:
> +                maxItems: 1
> +
> +              clock-lanes:
> +                maxItems: 1
> +
> +              bus-type:
> +                const: 4 # Combo is D-PHY specific
> +

It's unclear why both 'bus-type' and 'phys' cell argument are needed
at the same time, they are equal and thus one of two is redundant.

-- 
Best wishes,
Vladimir

