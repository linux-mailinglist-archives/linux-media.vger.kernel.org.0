Return-Path: <linux-media+bounces-44619-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F24FBE03A8
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 20:41:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C16A7487BEC
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 18:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB2993002C9;
	Wed, 15 Oct 2025 18:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HehQwM83"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A602C11D4
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 18:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760553699; cv=none; b=QmB7VEHViKgu1QyulZjt3YRlsdfrpTZVUN/vYnpeK6lIdM3WaUMiBOk6VRQgkad9pgwZW40ELdxQZTC2AHYU12NQsV7jfkuH8xwJRVe9srTRbVUV6b52sqQQEyM9IBlqdRgAFwD//kh4d2Ky5vaWN2wskUqdNwNVSj+5dhzvzvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760553699; c=relaxed/simple;
	bh=dx0qVmHaErexTyZmeoLh4fwFrUvfpdSCx26iEjNbWxg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GFABWVqKtVu35ZoxIkFXApe539XxO6Dp5PjuX/IY7zXUxCghWLUlXQQI/o06Ka4bGBXyZnOXPrqnNESo8tgmUhHgIRRHXEOIeSpK85vdKXcu5yMzNzVlEESOx/rA8I1U2UJ1LBdci2z+KeBAXR9aV9P3UFuPnfC2s0pk80KPOss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HehQwM83; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-582067563fcso1144197e87.0
        for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 11:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760553695; x=1761158495; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJlLj6BAoxjVSk1NLTz6D1jxyQjoorCPPfMJr/rohBw=;
        b=HehQwM83lHvn4pSkb9fcOeFLAQVkxPXyOWY9idFVi1qswWRKVD806cxXLvsNoiRLCY
         5ePMhDUMvrfaa/67RNks/KMnhgPQJB9d7Z82rTxtTr1si+oY+6etJeZwpBwA6irkpzOZ
         HD8hZSpiDa9kKY4SQgSxGzMTFkBj6wTFT9+gu+HPe3fe7SS3dC+EKT7Zadxrq7Vipfmb
         gakLaijFgjP2qSS7bWJTNAST/Q5j+c7loJ3VhEc+9ATBIyPOv4zpJnoWRUmFkdZuokZb
         SvfRniiulfo0/3v7leX3Ob95lLo/Y6HZhetYoVNlmD3MVkkk7KBROrSmYHUlLwfGsJhc
         9OeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760553695; x=1761158495;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tJlLj6BAoxjVSk1NLTz6D1jxyQjoorCPPfMJr/rohBw=;
        b=rZXMRgNaiPbBWQeEQTFEgqOFy8N46+XD7wXQyDMXyKICXRxVaNeG1ckpZyMh6IErIc
         XFO+xQQ4rm4L6YmeO0ndgioVJdaMOl+I/O/C06CdBvhRdOzutGuvbCSM59sajTOHSxpX
         DoXBPHUFCKp2d26AIEyUruzX3Wfz532KiPRc/2fc+Ya1eud7pd8T49WlkyfuiDfRqew5
         MxAuSuI6qYuNPEL6JSXKP/VwEtJhqFm01NcYGPEpNW/TT3eQEd2Hxo5VouEcheS7XbJ4
         i6gF600l8mDYwp1kyKcJaTHLnQOuNvY2tWvAmGQu/JUADmHepyh6TrN9a+zL9938q2sL
         XXZA==
X-Forwarded-Encrypted: i=1; AJvYcCUlhgus17UgzKEyZeYOuD7Ej/yNC5XFb3orgMR77d9Xe5ECKFCrXszzKUzLC0ctYrqQ0vAjxAsi8lXuyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwagS2cOSKfamWkiuV917smOK0nh4FNu97wnn6y7c/GbvdP2xNK
	gW88AjluYfI3hp5peQ9tcC9Uvk45YIj5KiP1SKkUrJVFGRICzAaQJCgHm/KDAmKuYlPlpE0X9yl
	rp3mc
X-Gm-Gg: ASbGncsbFRApKSuWEeOowOa594JspuPEJhEuW0QBFKOcXmX9M+AX3m5F46yhsYCJKPl
	RNHO05I5+dr0tbOzgcsf19ihwOH/Pvt3RR6MxOPUFi5/6+sXrL/Zu9Kq9MYAI7l6QwNW8rZgDjD
	cxFMKM9xBvs5lGE1zxNB7DdsvDhHKIyYuwGTOvzp9BXhfUf4uZQnThpTGoFwQjiOW6QDMZOheK0
	TQnc/Nz78rveLFhG4ftEamygZPHL4o6LhKC4T5fgTctKsYcXJym8VtKl5GWPQbYDv1z4umSlIDE
	Eha9nRB2lboqQru4jrYF/Ex77c9Cn++z47zZQfOAFJjF5bADBxgrEfHEUzzgVhK4FfYTLscy8Tz
	waBtu59cZdwUwbeLh0XtXocu/lQAbkP0UctdjAaSD+YOnzASiD6pqbSc//zy7Idl9CS05sQKjX0
	NgJZLHRodjXwAMFPwX/1WEmoqscPW1WsGw4FE=
X-Google-Smtp-Source: AGHT+IF+omlnIj0VW42QBPNVZc431CsHdQ7EPsBKi1Mx1WFqeaAKSz1ndgSM5DbxSPhZLcvdHjBrYg==
X-Received: by 2002:a05:651c:1987:b0:36b:9ecc:cb62 with SMTP id 38308e7fff4ca-376099f239fmr41529381fa.0.1760553695443;
        Wed, 15 Oct 2025 11:41:35 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762ea14d46sm49223291fa.34.2025.10.15.11.41.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 11:41:34 -0700 (PDT)
Message-ID: <bfa0d4f2-45c6-463e-8afc-d90edcf8cf2f@linaro.org>
Date: Wed, 15 Oct 2025 21:41:32 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: media: qcom,qcs8300-camss: Add
 missing power supplies
To: Vikram Sharma <quic_vikramsa@quicinc.com>, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nihal Kumar Gupta <quic_nihalkum@quicinc.com>, bryan.odonoghue@linaro.org
References: <20251015130130.2790829-1-quic_vikramsa@quicinc.com>
 <20251015130130.2790829-2-quic_vikramsa@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251015130130.2790829-2-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/25 16:01, Vikram Sharma wrote:
> Add support for vdda-phy-supply and vdda-pll-supply in the QCS8300
> CAMSS binding to reflect camera sensor hardware requirements.

What are "camera sensor hardware requirements"? You do add properties
to the ISP.

> 
> Co-developed-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   .../bindings/media/qcom,qcs8300-camss.yaml          | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
> index 80a4540a22dc..dce0a1fcb10c 100644
> --- a/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
> @@ -120,6 +120,14 @@ properties:
>       items:
>         - const: top
>   
> +  vdda-phy-supply:
> +    description:
> +      Phandle to a regulator supply to PHY core block.

What is "PHY core block" here?

> +
> +  vdda-pll-supply:
> +    description:
> +      Phandle to 1.8V regulator supply to PHY refclk pll block.

This is a copy-paste example of a known to be wrong pattern.

If you open a QCS8300 documentation or a schematics of some QCS8300 powered
board, can you get a link between the actual pin names and the introduced
property? Likely there should be nothing, which resembles "PHY refclk pll
block" over there, and thus the description of the property is misleading.

Please check other similar and recently added properties, like it's been
done if you add a voltage level reference (and that's the only known for
sure information), there will be no need to guess the right voltage level.
And it's either incorrect in the description above or in the example below.

> +
>     ports:
>       $ref: /schemas/graph.yaml#/properties/ports
>   
> @@ -160,6 +168,8 @@ required:
>     - power-domains
>     - power-domain-names
>     - ports
> +  - vdda-phy-supply
> +  - vdda-pll-supply
>   
>   additionalProperties: false
>   
> @@ -328,6 +338,9 @@ examples:
>               power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
>               power-domain-names = "top";
>   
> +            vdda-phy-supply = <&vreg_l4a_0p88>;
> +            vdda-pll-supply = <&vreg_l1c_1p2>;
> +
>               ports {
>                   #address-cells = <1>;
>                   #size-cells = <0>;

-- 
Best wishes,
Vladimir

