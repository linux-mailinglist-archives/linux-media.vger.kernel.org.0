Return-Path: <linux-media+bounces-54097-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNhHHhKfpWnACAAAu9opvQ
	(envelope-from <linux-media+bounces-54097-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 15:30:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7570E1DAD26
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 15:30:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C049D306A872
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 14:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD7063FD151;
	Mon,  2 Mar 2026 14:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RGeUqWTV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ovc2aNYL"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E8540149F
	for <linux-media@vger.kernel.org>; Mon,  2 Mar 2026 14:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772461176; cv=none; b=HjAb19FAxb5ZmQqLW7PX8ZmryN3v1XPA0oMw987hvNfH4NKtkKy8cwue/yDb2bg5RGERON/sQZ9cseTHiMr3ElrO2wFH9uqnB8Qk5CDs3g/iSFw5jZA2PKvhNu/7Zy6rtR3dPCYQ4GpKwEY1zE5gOCP6BEbM440WcX6tuthVwpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772461176; c=relaxed/simple;
	bh=pATfqLu+e2vqZ4O40YVHYShR1JR8UGne+lTZ9RVoEQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W8e5JlSSqnzp4SLKQoFFRLb/vYFNq/XUm6egZqo6BzGhDD3/EuRRe0Xoudhn7byuAS3MZdM9gokfA2msfvOVk0143C8/NJ7Z4JMpFmcQbKH3FLU5WwHTZazVA/dmwaWcK3I+TKGlJIZqrWJGh5+zJ5EOtGdFPbBfttz9AcRJZDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RGeUqWTV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ovc2aNYL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6229K2vq782712
	for <linux-media@vger.kernel.org>; Mon, 2 Mar 2026 14:19:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fjo/kdQSRpPefoMLwX6+iCPNspce4EmQ1eua8UqXSEA=; b=RGeUqWTVOt4Re0fA
	Rw6mJufAeAi28bVyMVkohFE5iZY6p6n0as0LiN73UTDEsoZKYEp5ZCqFWswmT106
	Td5LGDPwwjcuZG8GJQEI6i/P0ijVSG+Fu8iy4sFUPBrsSeMU4ZwZ8xLBGtmeq1BM
	dzgZ9FVkL2ahEuOrhHaM1PuNEkNXdcQ85GJpXQDyxHLUtQi95wK/XblaRoTugFgD
	v6AgbcIR0MEuVA3mtTJwybgNBA9BcRHOKpqWs23pS3GBRFDKWtPd92C6wHav9wqQ
	sYhfFK8xTHknlr9iWUSjsA1fEohCcZ11Pstvv1O+3VGjlCUpJq69xhSPyleZH3vi
	LUvOcQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7u00xhp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 14:19:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb4025302aso383889685a.3
        for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 06:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772461173; x=1773065973; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fjo/kdQSRpPefoMLwX6+iCPNspce4EmQ1eua8UqXSEA=;
        b=Ovc2aNYLfZqQfRo0WGUnLB2vo7F5ZawB1O9fbqe2nWRBhQfx5zDYz+81ONLNEDSNSi
         ioev076ovPEyo7U0qHpVvRmzz7IgK6ZYA945ZdaYp2SGpWojMN+aFzjj7eQR8AgHGukh
         VonRgbfuZg73GEWKBFsirwZvWMLsS3U8mPbNuHIQHsqY9uYISJAsH/on5UAyUXoNUwGm
         SqmpVu9G9mlXbBo7qy/2RfXs1pygwmgHdMa7+5JcgjS+wRL31imsyjAweQOd8jdMEnGZ
         U3CWFX7oNeZ3JhF85GM0SsL3cpUmjRAxqZV7SgHB5YqtB8jiQYlGQ54m/ODLs6Id9ffV
         IUyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772461173; x=1773065973;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fjo/kdQSRpPefoMLwX6+iCPNspce4EmQ1eua8UqXSEA=;
        b=PBSUtFVANSYJ0R1/2ZLK7x0+og2f5Ky4usfxVYBCeoTn9xsNKEkCjc80ZsJUeqzgNp
         C+1ltcoOtzMrDNam/H8GAVQCsZsS5p8D1mbAHYw+lqPrre7PDm7KoYiihy0qILXFRqF2
         /2tP5QqNLHfvPNjkmwTA76ufOyMFwtloWGYd6woI2j1tvR+mEtIQzVp5jlSSEfDHHkvP
         AlWjWA6WzloXbAeYNSi8XBllzXgaHtOXpSgmeXpzMoE0eIaOflhpJj0M/UrAPrNUMnyb
         RWOawugbo8mFvlTi4EF4VJKXua5/LozEf4ORea2HdYWHCfUhdB+1vTxYskcCumSY0UnW
         urbw==
X-Forwarded-Encrypted: i=1; AJvYcCUhgBZn+bZt9Y1bTxvHm4cFGtc05VS0e49ErZ3SZzsEw8PY2NAxajVq5sc5YgGHKRYS3WtmrJ/Iks0Jdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaKph08oJrV6n6x+pAotG+4EIF59da1hS+vI1aabz+8hAxd4K2
	nAYB/JvmTnQifKYIs43P3Ax0jPWkGPgaaKKrN5hhS4xjhAGp2DgzOP+5mbJOTqSwgmyXhTLP/ht
	5fWfIuPJa8tP+3r1OmdgrxabO6NIhHew4mzenDBMeHYZdzKPUqtp8K2j9uswXM3CcIQ==
X-Gm-Gg: ATEYQzxnzL6wFaeTgFihyE0wxBhJGUoTBjyoVOrJ6Xu34DuBYIWRj3LHkF1jGs/+ANf
	8++u7VwWM/iB2oIsDSWcQkGXvFaT/lTc7UavC3BqENJc4f7ZTA4WQ8fxHilVERHjYKt4WlYNm6r
	EWIiMWrvWhBomPfxrp4Itw3P8KS9Ge5Jt+ciuLO3RXvkKQ5Pvoo5x5mYkDb+Za4kIdP42Fl8Uio
	WpKI6zASpu7y9rT1B2ZXcfbXE1/FHpxYDt7IRvkVbdrSLyVcIn3FFKkaI44QOuO8Gm2kEGnCeie
	Jo1m52bMPPYCa568BaesF9dDb9GTD0CV3bzV9zbwKpwZOxkALPGZZa8iDwB9OaKLdqe/p9KQsV9
	pWvJ4GBslY/zUCHpjek72pWNvSlCEk5BNYX+Zmh9ZptcLBXrqeaaWOayIjFXLXfFj3yxWiK2aJF
	RhVuA=
X-Received: by 2002:a05:620a:46a4:b0:8ca:2e37:ad06 with SMTP id af79cd13be357-8cbc8f467c1mr1228837385a.10.1772461173124;
        Mon, 02 Mar 2026 06:19:33 -0800 (PST)
X-Received: by 2002:a05:620a:46a4:b0:8ca:2e37:ad06 with SMTP id af79cd13be357-8cbc8f467c1mr1228833585a.10.1772461172660;
        Mon, 02 Mar 2026 06:19:32 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fac07c09fsm3499457a12.32.2026.03.02.06.19.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 06:19:30 -0800 (PST)
Message-ID: <9cb20af1-c2f5-4511-a066-24bc689d2fa5@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 15:19:27 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: hamoa-iot-som: Add pm8010 L4M
 regulator
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
References: <20260227-hamoa_evk-v1-0-36f895a24d8f@oss.qualcomm.com>
 <20260227-hamoa_evk-v1-1-36f895a24d8f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260227-hamoa_evk-v1-1-36f895a24d8f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GMMF0+NK c=1 sm=1 tr=0 ts=69a59c75 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=__G2b6sp-w7MuTAc3JcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEyMCBTYWx0ZWRfX2YwuEGktR99p
 mtnOWAQt9+zTbVIdY6XgXa2/pn7QZ47GNj/M4EVpLlavh7YtYSeaFyKO4vpi5oMS7/igP+c8qXF
 qhhn4BHl/Yhg7TtyRIgIv7nIaoF8Uy5Pam5Ip8IUQX0a8IAUmN4jBCIeVTcRe5B/auUsO7vv0/X
 FHARufZmmv6unPFPjevyun0DIQpthAszCwk5xvRni1Ovgv29lWOz/XmxYlP1whzDVP+T70fQuPO
 1Gsedy5BGZd9zNjxCTAvja4m4ni4TN0nADtVTANKDPK8/vZ4ak6HHdQt1knanxVeYvJL+Dk5Wi/
 EcEJTBkKH/WJTjexwchsAdOUj+++QCNV7+bXHQHZpawC69d/KlN8gzPIT1sGxkVMCsbSxWIMOo3
 NXq4guGp/QMF9cF/fTjXwmMpFPMNnYrmA86eOosC51IDBuqaDwKL+tYGXEbGTVgMU3Sh983L2Mm
 dvGfsJ5ceTh5A4uqZQQ==
X-Proofpoint-GUID: STzlcIbRKfaXd-4Cm0wYkY-qMw26rvaJ
X-Proofpoint-ORIG-GUID: STzlcIbRKfaXd-4Cm0wYkY-qMw26rvaJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020120
X-Rspamd-Queue-Id: 7570E1DAD26
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54097-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,nxp.com,pengutronix.de,gmail.com,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 2/27/26 6:29 AM, Wenmeng Liu wrote:
> From: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
> 
> Add pm8010 L4M regulator which is used by Camera I2C pull-up.

I think this mandates regulator-always-on, as we don't have a 
better solution for that now

Konrad

> 
> Signed-off-by: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
> index b8e3e04a6fbd489f66bb44a02aba7b9746f30fe2..5d9af325c931ebbc9f3f8261d427a31e6da090be 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
> @@ -376,6 +376,21 @@ vreg_l3j_0p8: ldo3 {
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  	};
> +
> +	/* PM8010_M */
> +	regulators-8 {
> +		compatible = "qcom,pm8010-rpmh-regulators";
> +		qcom,pmic-id = "m";
> +
> +		vdd-l3-l4-supply = <&vreg_s4c_1p8>;
> +
> +		vreg_l4m_1p8: ldo4 {
> +			regulator-name = "vrer_l4m_1p8";

typo: 'vreg'

> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1808000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
>  };
>  
>  &iris {
> 

