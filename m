Return-Path: <linux-media+bounces-52310-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BS4HKUUhmk1JgQAu9opvQ
	(envelope-from <linux-media+bounces-52310-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 17:19:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 094121002BE
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 17:19:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A0F8030601B7
	for <lists+linux-media@lfdr.de>; Fri,  6 Feb 2026 16:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 200702D322F;
	Fri,  6 Feb 2026 16:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y+/mUjRz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40837322B7A
	for <linux-media@vger.kernel.org>; Fri,  6 Feb 2026 16:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770394517; cv=none; b=ayJ0/Wf5orBxXbLeyERGbV93WFkQsOQRFpLBEXk+IfnbI3DBOp/K1J0SifYeRn61uwFvVeJ9tY4f5n9DdOM0J6HyXmPqVLb34p93HAkqjkOUUusmXjq+x/CSVjmCPc2nic3Rw6wg5FKWXGcMlI/lNkzaBaPSTrwYT0mD5oBHnAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770394517; c=relaxed/simple;
	bh=PgHh9sO6g1i1ICu0i5WHmFr2GjxMXiWnxdDbOdqYd2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=duh+dmABKnWDJHCnJcDpUaz71JMsEvZnkNjC7JWN4T0hqFGI9MXt6ztxcH53dsCRuAsu04dHmKG0/lhd+dzMGUAM2He8Dc9M5SRx7JkvmyWziwK96KYoHab6BPmsm8enu2jn04oG5mNGsbqF9zgvw9lR1GxUXGnnGQ40em5e95Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y+/mUjRz; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59ddb7189f5so217536e87.0
        for <linux-media@vger.kernel.org>; Fri, 06 Feb 2026 08:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770394515; x=1770999315; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j7YltPymBDZDAXQzrrunk/e6Y1HtLsHo+KDRbCcly/E=;
        b=y+/mUjRzihDm2JixE9p6rIb3fSOUWLS8I9ZP1yfw4volOB7qr/iIg9DcfjpoqVrOOY
         l493LZzuOq30hGV4lZOTWgXvcSpaDjJq3yKBxzUwu86qPouYsVX1x+CbLaYeAnJ/fvT1
         n7IbLT7s6zSuRFCcScHtVOsMXsVu83M0H6vgNqmloSVPN1UpptdM+A3mLN1z3pv8LvMT
         7j8rjkw9ECOuHjZaM1FofiNDVgf2iYNs8+pxbs1/9tw3GT6o2b9VKgnKYZChOzbYF97b
         Pgg3glu5WIT8xCepjlfJPom5TXcldwixBbcWs2YWa6axr8H6EYd4nkTilWBSep+ph0NZ
         eDng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770394515; x=1770999315;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j7YltPymBDZDAXQzrrunk/e6Y1HtLsHo+KDRbCcly/E=;
        b=f+27Dx9Qy1F0xh2w2KyoTac3p9f7X/m1yBTAMAOa4bdrx6XWpG/fT95pCvT9/Q63z4
         js/wJMuQhLH2rXdPlcTghbAvvkIsiBEDk9eFwpPUCs1kK4ei/cNRp9YAkViVDIdHJGex
         DqJTG48/yrKc9cMC2RfipCF5BHr6Niw2m0NKzMZwrDQW2kZHG8KLpaGoubMrp97n5kvR
         hUmL053lLURhALuDt59jbaZrLpfcHf08Nd6T7ya4vi0297PGt9ci5y8vWz9zS6sO7s8O
         +oO4n8HBzwd5ycby2uDxCeRxFFlzOITxuAveBs6s4Ps/sPSSdA43CFVdcuZdXVJGa2v9
         EiXg==
X-Forwarded-Encrypted: i=1; AJvYcCXA0jzxkZBz4T5oYoP4XMjBYoAM+X1xm1Z+bmkWpS+oJlegml7Cc4EjzJj2O+c3Kwv8c9iiyKQS9kCY+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yytb2DeHCGh29GJVc/sW8matFuR9O/fyCmCHfJXd1BXjmXenzdG
	Uuf10LPkLbTgctSdZugmLe6f5jU5aIe+bJJt0X0tdWVLtotsRQdm50Kl0zJXfkrkipw=
X-Gm-Gg: AZuq6aKTnd8bHVYMTN8Ea/dG25wTVVKXnv+5TilBFwaK9C4Xq5z+OxAE0RHcrM4cRkf
	/KfTI0gr1CWvqGq7BD9Ssz3x7l6gFDDRSMKomVgGotEk0lH73V5KVgNRijLEijIgyk0On7DvdUq
	nguTpNRbH/heIiaUCvqsjo2eTHWhsiCSzbv7i1IFrWwNtH02wFdB/JSqBA/ib66fWXbv0QhPAan
	pUW0nXCsjwbpzPMRTjsaM6QeBZ9t561mPUPulQCdsB/8HlUcdP/hcCHC0uOoZs4P44sBBkfxDst
	UNVcQmCe0cXJFbcC9EzAwPY/vqd9x6wzwuS88HAcTS8T+ypuQotQK2cAg8+e8x+LFxjctLfWUba
	BemQJ6iVkMhX3sQ7gjMq76my7xPAWULu1nNaQpWFj/1X81CW+AYl/HxymDNGGCg9XW+aAf6sP5h
	Cq/0YHShsLudXg/ItX331YuILZ97zceP4SAwtGsT+YRc9DtYQqD+odkHoE2pM03rw+7A==
X-Received: by 2002:a05:6512:24d7:10b0:59e:3e87:1a with SMTP id 2adb3069b0e04-59e4518da53mr385299e87.7.1770394515297;
        Fri, 06 Feb 2026 08:15:15 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44cf713fsm698812e87.1.2026.02.06.08.15.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 08:15:14 -0800 (PST)
Message-ID: <9de74828-85bf-408c-8f64-2a8694f71563@linaro.org>
Date: Fri, 6 Feb 2026 18:15:01 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/5] arm64: dts: qcom: monaco-evk: Add camera AVDD
 regulators
To: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>,
 bryan.odonoghue@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 hverkuil-cisco@xs4all.nl, loic.poulain@oss.qualcomm.com, rfoss@kernel.org,
 andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
 cros-qcom-dts-watchers@chromium.org
Cc: quic_svankada@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260121183142.1867199-1-quic_nihalkum@quicinc.com>
 <20260121183142.1867199-5-quic_nihalkum@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260121183142.1867199-5-quic_nihalkum@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52310-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[quicinc.com,linaro.org,kernel.org,xs4all.nl,oss.qualcomm.com,vger.kernel.org,chromium.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.985];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,linaro.org:mid,linaro.org:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 094121002BE
X-Rspamd-Action: no action

On 1/21/26 20:31, Nihal Kumar Gupta wrote:
> Define three fixed regulators for camera AVDD rails, each gpio-controlled
> with corresponding pinctrl definitions.
> 
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/monaco-evk.dts | 51 +++++++++++++++++++++++++
>   1 file changed, 51 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
> index 565418b86b2a..65c1b49c6dfb 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
> @@ -77,6 +77,36 @@ platform {
>   			};
>   		};
>   	};
> +
> +	vreg_cam0_2p8: vreg-cam0-2p8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_cam0_2p8";
> +		startup-delay-us = <10000>;
> +		enable-active-high;
> +		gpio = <&tlmm 73 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&cam0_avdd_2v8_en_default>;
> +		pinctrl-names = "default";
> +	};
> +
> +	vreg_cam1_2p8: vreg-cam1-2p8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_cam1_2p8";
> +		startup-delay-us = <10000>;
> +		enable-active-high;
> +		gpio = <&tlmm 74 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&cam1_avdd_2v8_en_default>;
> +		pinctrl-names = "default";
> +	};
> +
> +	vreg_cam2_2p8: vreg-cam2-2p8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_cam2_2p8";
> +		startup-delay-us = <10000>;
> +		enable-active-high;
> +		gpio = <&tlmm 75 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&cam2_avdd_2v8_en_default>;
> +		pinctrl-names = "default";

Since voltage level is known for all three regulators, why not to add

     regulator-min-microvolt = <2800000>;
     regulator-max-microvolt = <2800000>;

properties?

> +	}
>   };
>   
>   &apps_rsc {
> @@ -564,6 +594,27 @@ perst-pins {
>   		};
>   	};
>   
> +	cam0_avdd_2v8_en_default: cam0-avdd-2v8-en-state {
> +		pins = "gpio73";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	cam1_avdd_2v8_en_default: cam1-avdd-2v8-en-state {
> +		pins = "gpio74";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	cam2_avdd_2v8_en_default: cam2-avdd-2v8-en-state {
> +		pins = "gpio75";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
>   	qup_i2c15_default: qup-i2c15-state {
>   		pins = "gpio91", "gpio92";
>   		function = "qup1_se7";

-- 
Best wishes,
Vladimir

