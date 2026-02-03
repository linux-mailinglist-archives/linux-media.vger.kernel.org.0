Return-Path: <linux-media+bounces-52141-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AmMAkiDgmneVgMAu9opvQ
	(envelope-from <linux-media+bounces-52141-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 00:22:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C362DFB8B
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 00:22:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0A65F30B82EB
	for <lists+linux-media@lfdr.de>; Tue,  3 Feb 2026 23:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DA7C32571B;
	Tue,  3 Feb 2026 23:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lA7Z6LXz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE0C31812C
	for <linux-media@vger.kernel.org>; Tue,  3 Feb 2026 23:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770160940; cv=none; b=MEATRFbl7m5WRb7KKU32s8ZPMgVK80iJ9fWUs2UBH2bDBR/w2CEgpV9VdXJwJz1mcCaPyODegfLxRyPtGKF9CoCDylzrYWMjQJ7oL21K+y8yNj53h91/XS1sc8B60yDe5Sg7a4HST59/Gye2BlnBdgAVpsa/DIkHTo+h63n08G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770160940; c=relaxed/simple;
	bh=vmGDTvEh0kB/nA8sp+H/PED+RYlPTGDJvMgu8OOxZgU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AhnT0X1YgC1EEjO/nlkrzrLPI95hm/0PEQ3H5iDzRUD0O9NL1ftZ7teFogINUUYfRjGSzYZY2fSr9uAAy5bCE7sOYiTuL0DcABGPfn/+S78BXBbJ6M2QNBJt8FweathUT9WDylarkenYukTCDMyN89q+QqzCFLe7g8t10d+o8EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lA7Z6LXz; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-432d28870ddso61354f8f.3
        for <linux-media@vger.kernel.org>; Tue, 03 Feb 2026 15:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770160935; x=1770765735; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zHQSzgLVAjnFP4dBv05KnkyuxPSQFJ3wmRvAOwsqKgI=;
        b=lA7Z6LXzT+vaJ1rbVAfhg+7GjJkYrIgBM/ims6zHGMCYrIxKjmE+WPTRfIzvcSdrA6
         jXpZ5dLPLw5gwb75RVqmPp3+pgUFoRZ18CYP6U/dgkpcDx5LKNMhAzamnfaku1LiRPh8
         iWyVmJ6+6IgFiVkuGUW9opeO49Fd8zt+lH/PrmgYDzflPy3JCaXnRt+0aUWfmwnQV0yO
         hqHG96AxXgFcKXIVNuUyYO5q3x5j7gF13SCMf+QIewodnXqcPRV8yxRjS72a4wNk0LTn
         aeTtg0nxCbrFvDYRBkoawUU+gbtm1DkOTxo5zGzc8INEo5nDZ2hWxOZ/LTBVglaKaAeZ
         iuEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770160935; x=1770765735;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zHQSzgLVAjnFP4dBv05KnkyuxPSQFJ3wmRvAOwsqKgI=;
        b=I/c0FLGEHNt1TAm456kEDSSqY3Uu6WQJRrfmOoJ54zYT9O/xL5xNQRcD559M1P585o
         umZZVG15RxswsChbG6Dcr7vMfS3QSCDiuVmK9zV603OM30vP4SDt28iRVEi42L9hmaHU
         RZZ3WnLaDwKgs1YQHJG2vIZ3unpsHsvGYn8SNyv7WKA7kAePjifG5VnQ/tKfL9Dr86mx
         WsRcFG3g8qlngvim9UzmugwIPsmXsYu9Zb7bdqwB+YO68SXnrU8W/Zn0afw9+cypELr4
         vBxQqxX8cuMm93w7taJfscVdg6VoBtE+4MctQrDufVKBpKipzgIaP5X6WTk0O36/eHj4
         WCCA==
X-Forwarded-Encrypted: i=1; AJvYcCUFx/jwApSVz4V/lcJg8GbiOzRYytYDJNoSLSuD81Y7F3A2HSul+OBqkBNSRo2c4q3awjGaTMHILNu8vA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpHX3MMFpK8xaeiorQ88eZBB7TUDmB53OG4XZ1vumB1Wf/L7ZV
	ZS6R/0cm+Hl4XO1mKVp0WBxcEIdDuPLGVhJJraf/CQUb6uscfBd5TTH1kTT8KzXOQX8=
X-Gm-Gg: AZuq6aIViujtkWjf7Jmoso0VF8arAdcTUAe6TwizIabfrZGsyr2d9g2VOX9C+PgplFh
	Q2FVLqb8jWznqSX6w8FQIx7d8P3bwiPJzuutpKoqZ8nRyvnruf/loqVib3FAlkTygafaqJytVs9
	ZNkIeS4/TsoChn4mU1uo1Mc4OgaVkTLp6XMV2nWj81ZQa7uMKLPNceiVplQIVCOBGpauztDpNBq
	EE+eUABrAHqvWxxfNaIOXIUVuQ6iTtIm9yM/S/bmnssiaQruXTW0RY4MQEkOXbpmNILyh9cPTq4
	RuDjXLiGT4KxOkf534AwIoAFla2yOHcN3D6R7hQI3XYSCHnbDX8FeRypjGx53BofYa4/LKmKMxG
	cctO64YaC+5aQMGNwzpVBYhtYFvHjixM6+CAvehsqQNSZbyUmoJrGKR9G0wWxoimDob8YTIzcLT
	Ob/KrN9d+2c16ug/9FDFL3PWujaoUCBot/ZFtcrNQjCMBN9LQtT4Q0a2h6lXeBXSU=
X-Received: by 2002:a05:6000:603:b0:436:143c:c000 with SMTP id ffacd0b85a97d-436180593b3mr1240527f8f.45.1770160935331;
        Tue, 03 Feb 2026 15:22:15 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43618057f7csm2010133f8f.23.2026.02.03.15.22.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 15:22:14 -0800 (PST)
Message-ID: <e29f4014-a8f5-479c-8043-e0d9f3de06d7@linaro.org>
Date: Tue, 3 Feb 2026 23:22:12 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] media: dt-bindings: qcom,sm8250-venus: sort out
 power domains
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Ulf Hansson <ulf.hansson@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Hans Verkuil <hverkuil@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
 <26272oeYIcfP__dNdKT_lizJQ9hvr9jKE2zsy_3aiWVlymjbtHB5vToDV_2DL3N8gIxnqB_YminHDztbUanmwg==@protonmail.internalid>
 <20260201-iris-venus-fix-sm8250-v2-3-6f40d2605c89@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260201-iris-venus-fix-sm8250-v2-3-6f40d2605c89@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52141-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:dkim,linaro.org:mid,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7C362DFB8B
X-Rspamd-Action: no action

On 01/02/2026 10:49, Dmitry Baryshkov wrote:
> First of all, on SM8250 Iris (ex-Venus) core needs to scale clocks which
> are powered by the MMCX domain. Add MMCX domain to the list of the power
> domain to be used on this platform.
> 
> While we are at it, drop minItems from both power-domains and
> power-domains-names, it doesn't make sense from the hardware point of
> view. There are always 2 GDSCs and two power rails wired to the video
> clock controller and Venus. Disallow passing just two.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
> index da54493220c9..04cbacc251d7 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
> @@ -21,15 +21,14 @@ properties:
>       const: qcom,sm8250-venus
> 
>     power-domains:
> -    minItems: 2
> -    maxItems: 3
> +    maxItems: 4
> 
>     power-domain-names:
> -    minItems: 2
>       items:
>         - const: venus
>         - const: vcodec0
>         - const: mx
> +      - const: mmcx
> 
>     clocks:
>       maxItems: 3
> @@ -114,8 +113,9 @@ examples:
>           interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>           power-domains = <&videocc MVS0C_GDSC>,
>                           <&videocc MVS0_GDSC>,
> -                        <&rpmhpd RPMHPD_MX>;
> -        power-domain-names = "venus", "vcodec0", "mx";
> +                        <&rpmhpd RPMHPD_MX>,
> +                        <&rpmhpd RPMHPD_MMCX>;
> +        power-domain-names = "venus", "vcodec0", "mx", "mmcx";
> 
>           clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
>                    <&videocc VIDEO_CC_MVS0C_CLK>,
> 
> --
> 2.47.3
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

