Return-Path: <linux-media+bounces-54253-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIRxMWZ4pmnxQAAAu9opvQ
	(envelope-from <linux-media+bounces-54253-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 06:57:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 580791E95E0
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 06:57:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 14A9F30A3051
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 05:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C1EF347521;
	Tue,  3 Mar 2026 05:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CkZdqbu3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LzX9Joq3"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65042F3C22
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 05:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772517393; cv=none; b=praynJuUOu8E2xa6ywFJMoPwGZYiYbP+/K7xJUewrBoKqtPM4NrI8YuK8YKWHEEhYvLDIWQ/DYY6DqJZCuibRkjawBN+lW77P2fwnJKiSCHP4vaqI3nHQ+/T58Fdqyi6rxI4WMXk7ilEMr3+ZfuweDWTWQ8Sh+42/gyqmGvC3mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772517393; c=relaxed/simple;
	bh=3bIXffY/9X2HVXQIA39mw4H/IcuURtGpwlkl8koIlMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cP7DJxd9BhET4HIx5HiMfnQ96H5CDyObuXeXPFMoGeEoHq8BY8jZ9jhZVKNbeSodE6NdwqB5XDQ2z8WFxczgV66Xpo/bGyhIThc6q9AxQ+PQdIwkoRtKMiX5mZGIIvSlwAGPHx6PQOVFeQtxw9LpYL4LBnJHGWglvWXRKaFwIzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CkZdqbu3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LzX9Joq3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622Ko4iH959368
	for <linux-media@vger.kernel.org>; Tue, 3 Mar 2026 05:56:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zFRkum70LwaLQ544ntcVbg9EgSAccXUR17foftejeHo=; b=CkZdqbu3cXsf309b
	1OkxUDCi1VpE2jB2U5FHi51pNiwjumq7GxVWzn7z//8zQ0D4kfl3te8hSE93N4T5
	LWhf+B7KcWF74PfyGuurDHDDD/y6Y6k5dJFZQ80QzLLN19Qa/oKR32m3kMBvrUeA
	VV3hixGm0uywBPQzSzQcRJpvVOvv2wLtHIioVOTXnN79emeW7kJ7tva3TXeP4Z0r
	UqjxXMj13pfBHLbcGwsibGFYdU1IcF4jJVKZwUGoTmZhQ4eCG7NtZnYkavJ+Gwf0
	cwwtpIOHqyXYDqZHrrxbM8SIsqr8usCBdGqxXMnJ9vvDhQrmzthXOJYxdSPR4qUy
	8SHkMw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnhx59fye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 05:56:31 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3598f4fbb13so1732629a91.2
        for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 21:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772517391; x=1773122191; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zFRkum70LwaLQ544ntcVbg9EgSAccXUR17foftejeHo=;
        b=LzX9Joq3wwuk+XT3KCPFxtZmnRtoXnbSMOQDA5snSLJFljuLigv2UL7Z8ALm7YPaLI
         PWgC/rm6Jz88F0xt/9vpreiVDL8yhKtQ/7Zdg7Zgf5WK8G7iK82y8TOvW2oAvhXTL2P7
         cbvoUhqaPwOGKIfHhHWxg9ryTqW13X4h8ABJJzSEnzFbFXVp/AJBFAqQfqlxtTmoGFCC
         TvoEoZ2lASAjGGBE6qQJsEs29F8XkEZgNrOdYuePJJQXtdNoiUIwVokXX54+ceHSg13z
         RO3q9sP9drAgUHzHHNJNCx8LExgG/IndFDKmv2a+gnRHqbt9wG5/YbsqvlfYUsxNDUyI
         GquA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772517391; x=1773122191;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zFRkum70LwaLQ544ntcVbg9EgSAccXUR17foftejeHo=;
        b=ZxnUPBBFmNw7+qXAzLs+qUtQ/9y/0QPj/W+G0OzJrv4UxGKBaQ2Mf3NPIhmfawc4qs
         zVM8nTCu29/OkLQ4/VCDvbOv2uHVFIVbejBRESiq1R38PW8FxedspweZRJ2bU2w+kMwy
         gEKdghIkY9OVDPU7RO+7gzcLAPzsMO2QnMOX2Awy2Uymmrd+wkTGfz5I40dVSM2e5Q33
         uQXje5twUFWt6xydmpIiNuYk1BumIjGWgUOzFcuJcURGojBWwOvhoSQVqKfLKoelStsz
         +bJAxIwmTuEccUJbWAQ6xiipQzpvPQPpGArC5/NVJOyGJbY56cjuYnF6migj1YyqJuT5
         LcfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUozw3KuRTutMNt20dGjb58QOyI54BUHsf340Fw9u6m/TnBsa69ShS4CW61nRgJLC7IXD1mfjFDBfNyPA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8qE/Uk01cxpva5VrcQr+SjdUsri6cP20A92o2B+HxOvCRS4pA
	eYr9sEjh0z8k+X6t4QDqpSCCT7ibkMKXFappTWV37Q0EC2Na3cQwTW5ZDl6Me0DQcVxg+lbsGs9
	ve2Bo2XilhP+AHq/L4Bk9BNTArUd79L6GWf0LeKjVmpxwNzukqP2myVJRNCC2ZLi+dQ==
X-Gm-Gg: ATEYQzwZ/1u9HNtjlXegFsNYL+dRAOBr0wN1nI+5GjYpJX1gxPn8ylim6Q8DTzDTwuq
	jeVFNCMYshfxk5kLjnb9sgt3dstDK0H4tXJD6zQSGAzYzmRtQ16bBig9q27ih3wG6Y3g3OB/OI8
	B5R4ynaIpJQlc7oZg8kaDbKaP+bSX/KbNNGULkhZx+e/UcUUfLSK48fH7idW2bUGaQlXwegLghl
	ANhWaP/HWo4IMKdlDi1pVzV1pJTO/HXmoS/AcHxaIoTlGB7Dsqb8bJG/j6kLag55SdlJ0mj7gEH
	U2pd+7xzOSwXoQ0hmKRvj+Cl54y5DDEz24oG//FrpMGwwNNziZzWTsKETP9oG5h8IiJnjRh/rGy
	RSATjIH5xpK0DEWwq/F4uvT6PjCJHGGbkrhWpoJd0qUO7rPAa
X-Received: by 2002:a17:90b:1e50:b0:359:8812:7c01 with SMTP id 98e67ed59e1d1-35988127fd7mr5371860a91.28.1772517390662;
        Mon, 02 Mar 2026 21:56:30 -0800 (PST)
X-Received: by 2002:a17:90b:1e50:b0:359:8812:7c01 with SMTP id 98e67ed59e1d1-35988127fd7mr5371841a91.28.1772517390198;
        Mon, 02 Mar 2026 21:56:30 -0800 (PST)
Received: from [10.218.28.224] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c49eb72sm1199207a91.12.2026.03.02.21.56.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 21:56:29 -0800 (PST)
Message-ID: <9ff1645f-b2c9-4c1a-ae2d-96af416b08d9@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 11:26:22 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 08/18] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-8-95517393bcb2@linaro.org>
 <4fab8e64-8251-4424-974c-19434ee04c76@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <4fab8e64-8251-4424-974c-19434ee04c76@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDAzOCBTYWx0ZWRfX6by+AMOCT+OW
 7Hvmdftc93fJn8cbIScg+cViOXS2pHXM/0m+xIIbm6ROR2yrhOXRpomX4DEahgMeIqD13R1C3n4
 ughMzsDv3XoB5GHGExybnbxjgTzyFDAAWmw8HnCTHZpmbFmQrOl02xpi9766kFig7qJKUcNUsZU
 Qj7GNSgLPSoVg3kOgwRHJFFdwK8RfNon9lBjDF7ane5UrmmEnQNyKY0ZE/FsnWQlMKVwY+wQNjJ
 YcyT5l1G4HpIRG+8EMzLOdzMJXrsjZGx29DhnqLPgPRvkNz7zhl2KjZdI9CQ6kjbzIX+sfl3Weo
 GU9R8Y5Z4sS96msxk7wmqvLnJe32CDPIFCKhhMcD3xeMWgq6EvmZCjODXfwpCPdIVqt5eWhQqA9
 RHOhHGX+K9aLZyaLKXlo181OQwv2gwnn4pqVhJBiXvygsKntccm2CM+t0QF+M6JFsElpnal78l+
 b4HcKgAWnvywGfLNkWg==
X-Authority-Analysis: v=2.4 cv=T9CBjvKQ c=1 sm=1 tr=0 ts=69a6780f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=c9pHKBabw8uT7j5izdkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: C8YN-9WkWhtVzYQzcckMozmLNRXrzmGt
X-Proofpoint-ORIG-GUID: C8YN-9WkWhtVzYQzcckMozmLNRXrzmGt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 clxscore=1011 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030038
X-Rspamd-Queue-Id: 580791E95E0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54253-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ade0000:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linaro.org,kernel.org,baylibre.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


>>  
>> +
>> +		camcc: clock-controller@ade0000 {
>> +			compatible = "qcom,x1e80100-camcc";
>> +			reg = <0 0x0ade0000 0 0x20000>;
>> +			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
>> +				 <&bi_tcxo_div2>,
>> +				 <&bi_tcxo_ao_div2>,
>> +				 <&sleep_clk>;
>> +			power-domains = <&rpmhpd RPMHPD_MXC>,
>> +					<&rpmhpd RPMHPD_MMCX>;
>> +			required-opps = <&rpmhpd_opp_low_svs>,
>> +					<&rpmhpd_opp_low_svs>;
> 
> Taniya, in light of the recent discoveries on other platforms, does x1
> need a performance vote on MXA here?

Konrad, MxA is always ON, and with the current clock configuration, a
performance vote isn’t required because the clock controller currently
votes only for the minimum level.

-- 
Thanks,
Taniya Das


