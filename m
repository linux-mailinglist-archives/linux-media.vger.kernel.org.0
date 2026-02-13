Return-Path: <linux-media+bounces-52737-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOvwIdsnj2kvKgEAu9opvQ
	(envelope-from <linux-media+bounces-52737-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 14:32:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CFF136689
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 14:32:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8702730515CC
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 13:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3017C1B85F8;
	Fri, 13 Feb 2026 13:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aztyqmkJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DD334D4F3
	for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 13:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770989511; cv=none; b=pwpdm58hpIvLXBuBHqR7btlRixuAiS1wZxrsXJxSUHXRz+rUPMLuOznIjmchU0q4LhswPOONbBIncoIAlClsv/jiOU2IFWizWptItLS/zp2pGL/et7F3xkaVUKfl5MPerUUuM+gQP25wCT+CEqEtS5Q++2EyAPmi15rj7bKXv2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770989511; c=relaxed/simple;
	bh=9611KZFZ/L1Ph1AhhjwuaMFyxx/hs7k2tOHyJPaZPuU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QTsU2sYtfcwjQJZha6nNAtvPUd4jRpbFQHsqrVxCg6wYiPxZYUhV1zoH21moYWqMYRLc+HK6pRFNU9JlqIZecffVvwHfA/sDLWWhwubseINNpulyQUNt1Q9bZF3HCdN4+Idqgv6qVRy1OBBfVwJ/QpkTD2BowK8p01K2OBds+KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aztyqmkJ; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59e5b2730e9so30440e87.1
        for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 05:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770989508; x=1771594308; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=muJHKh3a4POX2qeaRW8JB2A7m86DLBucT7+9bUtzEHc=;
        b=aztyqmkJG6DaVlUHaoAwBO75bQcfAk7DZ/fMF6cxFgiHMIr0TubMHNMx8AvxUE2/16
         JPd4HlMMFcpSxHEG34frqjglS1mG2I/xpj2fwOMMq0kqTrM/HVw0P4Gk0E6RrxorI1MD
         HDdMMRl9wI/kicZTb2KAg4uaDU062Hh+X+DdLJug3PDJOFNJvpMHTAN6unpDaYYyNjbj
         aICEjBhaxZ2B76Swyn9wAm7uX9nJt1Rt+LojMYCrccQk3+cJpBQXHgxoEJEmu9QNYA3v
         sQiSkYdwvzLspdXor7oQx34I4cnZbTYHtjVn9Eb6faHCtlyrRKATf+y/4aYLSn8bI7pP
         gMdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770989508; x=1771594308;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=muJHKh3a4POX2qeaRW8JB2A7m86DLBucT7+9bUtzEHc=;
        b=fcvjUJzqjqYw1mGpa0pWQ5/nzWSNe8ZKZaG6J+Li8yRb/E1ny03zhRkRkCSm2LwmhQ
         XCKaYpktm/vHyaSLqcvwSGInN6UP9ayR9l+YMtl349QrooNXB0FtiSnT8l/XZGbLnVOJ
         mOrYCEKB49PTaoErXdZ5XBmd+bbNIlnph9YDME7pdvR82RPjvBrLQq6vT1daiO+Q2d9P
         PZ5MY8CO6/KQ2gOcFPn1rFHKXBnAyhhsH0Z8a7vK4zSJPSkhditQVg13kpxXGwsqNsoM
         YZHnuR3y86lvfm2onlcVmpbcH6uLKBphjy3x4Q6I75EYZdTGxr5V95Qs0eZT7gLzBcFh
         79Gw==
X-Forwarded-Encrypted: i=1; AJvYcCUl4Asdi4hGFQt/wraZbGbAvqKEZ0Vc0MJkVuTFhcDXIAulwiGoCdQtzBGyD6T1Okb2ySpmmC8fP+nHRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzncXbfB0ZWLixF404dFQLY5lQnrqm55uQgYDLV7oDgIYXDjzNx
	kikzfDQdoWL0StIQdib9ObYVsHF3NyQ0S+FYBppPH17zIv9OpZzyQ5xSuln1wped438=
X-Gm-Gg: AZuq6aImQ1taLnwcGTW/2IobUpHdFFShIeks0oCW/Zi5b+HMci/BJxaAAtBcBmipW8b
	Xuc6+3Yh+TlIpFG2Xa52vss7dlDJFFAouxVnv/wp44wLSnU+f1eBcPh+cjgME9H0AjkysUiT2X5
	kNGP/EbIfEXEQoptN5QfzoVjpsDtOSWMFqw2aHkKd19FE/vzEUYglBNaUctWFekNx7CPVxLPHkQ
	uhooYrcqF7g+rLf5s48jICf66TuQtdkXUI5lEugPjQaxcbJ9ujyWTm0SmpK1jZvC4HR6kztwoAO
	meJy7fgPjBlUJRvi3geNqvMJB3wBmH2vagZQ3I+ejIln9bBStsrPO9eSwNlj0LYfxl12EM+jUz/
	VB5Xdf+j3bnfjBnmr+xoGppEiFFb2KDbkkDaGGfA42MHixO3O0GsrxulElAnnHc7+hLdcAJATrQ
	ADve/WDiqY0CkqgFrgokYr5ESUU6G7ndfh+H0BC2uu+bnjJoHauIg8GoDWdbaLOcY7EdV5DCi0Q
	qFuLg==
X-Received: by 2002:a05:6512:4045:10b0:59e:63b8:62a9 with SMTP id 2adb3069b0e04-59ef3a4f1a2mr308614e87.8.1770989508188;
        Fri, 13 Feb 2026 05:31:48 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f568d95sm1557193e87.30.2026.02.13.05.31.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 05:31:47 -0800 (PST)
Message-ID: <7f31e787-a2a0-4518-8cc7-c012e22859c8@linaro.org>
Date: Fri, 13 Feb 2026 15:31:46 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/5] arm64: dts: qcom: monaco-evk: Add camera AVDD
 regulators
To: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>,
 bryan.odonoghue@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 hverkuil-cisco@xs4all.nl, loic.poulain@oss.qualcomm.com, rfoss@kernel.org,
 andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
 cros-qcom-dts-watchers@chromium.org
Cc: quic_svankada@quicinc.com, quic_vikramsa@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260213132058.521474-1-quic_nihalkum@quicinc.com>
 <20260213132058.521474-5-quic_nihalkum@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260213132058.521474-5-quic_nihalkum@quicinc.com>
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52737-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[quicinc.com,linaro.org,kernel.org,xs4all.nl,oss.qualcomm.com,vger.kernel.org,chromium.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim,linaro.org:email,qualcomm.com:email,quicinc.com:email]
X-Rspamd-Queue-Id: 14CFF136689
X-Rspamd-Action: no action

On 2/13/26 15:20, Nihal Kumar Gupta wrote:
> Define three fixed regulators for camera AVDD rails, each gpio-controlled
> with corresponding pinctrl definitions.
> 
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/monaco-evk.dts | 63 +++++++++++++++++++++++++
>   1 file changed, 63 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
> index 565418b86b2a..bfd727c745c6 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
> @@ -77,6 +77,48 @@ platform {
>   			};
>   		};
>   	};
> +
> +	vreg_cam0_2p8: vreg-cam0-2p8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_cam0_2p8";
> +		regulator-min-microvolt = <2800000>;
> +		regulator-max-microvolt = <2800000>;
> +		startup-delay-us = <10000>;
> +
> +		gpio = <&tlmm 73 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&cam0_avdd_2v8_en_default>;
> +		pinctrl-names = "default";
> +	};
> +
> +	vreg_cam1_2p8: vreg-cam1-2p8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_cam1_2p8";
> +		regulator-min-microvolt = <2800000>;
> +		regulator-max-microvolt = <2800000>;
> +		startup-delay-us = <10000>;
> +
> +		gpio = <&tlmm 74 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&cam1_avdd_2v8_en_default>;
> +		pinctrl-names = "default";
> +	};
> +
> +	vreg_cam2_2p8: vreg-cam2-2p8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_cam2_2p8";
> +		regulator-min-microvolt = <2800000>;
> +		regulator-max-microvolt = <2800000>;
> +		startup-delay-us = <10000>;
> +
> +		gpio = <&tlmm 75 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&cam2_avdd_2v8_en_default>;
> +		pinctrl-names = "default";
> +	};
>   };
>   
>   &apps_rsc {
> @@ -564,6 +606,27 @@ perst-pins {
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

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

