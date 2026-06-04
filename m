Return-Path: <linux-media+bounces-63747-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RGNcD8QYIWqP/AAAu9opvQ
	(envelope-from <linux-media+bounces-63747-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 08:18:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F6C63D36B
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 08:18:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YOj0p0pZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="hx/Rtj/9";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63747-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63747-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1060C302224F
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 06:15:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD7A1384CC4;
	Thu,  4 Jun 2026 06:15:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60AC3D6CAB
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 06:15:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780553720; cv=none; b=JLHBTnR+RnBYeehli1sBhy98tkwsn1cH2kdZxvkNJjneNMfjwE0R9NGYbcFJy0/WMP0XSojT0tp4gj5YePXI5X5KU3IzBmXWKJP8DEaBORqvNxurSwJZsmM4FlL6GtX9TvOhEKrs7CzJFTvkzvKiRqb9b/4Ip29XzyoXSc7CD+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780553720; c=relaxed/simple;
	bh=l/ipR7J4Gn1OuOoiyhxZtBOgRqVxGgZsG44uG/aCGdU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=F9HTkUeF7E0hpWhMSwK3uElMoM271IvnroF6avebJcVfXVuTPYyoD73+8TNLbLRxuSgCJwBHwxc6ulw+Y6Zr1sU9GfdfEb8rxcnQrvAXn7TzKV85Gf906YdNL7sTCS29yu/0blxUV1pNWLxXCTrbV3+5uf2bf+zTEPC0pUo7/4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YOj0p0pZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hx/Rtj/9; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6542NCOt2260834
	for <linux-media@vger.kernel.org>; Thu, 4 Jun 2026 06:15:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pm1lmiRraz5tQhBBiQXHAywz2nv5ol03QuUwN7r5rmM=; b=YOj0p0pZTfOeNsdf
	tpHy7bUuSPB3al2zgsjQSY1R0yPszYZdgsfEYzSkX7xO4EIvyaBFfzAad4R6MHkY
	8i+E+Nl2CN5a0DDyPYORL2slZdaJOVQosrSaus35IZG2AzWKvwAhFm4WHK6TlCRS
	EjfEraBiNF4m1OAVJUh1392KVPgv9bUyJhOPzMHciEbiLWN08Jf+LOvWF+maDVfF
	BFiUTPV95mGbCwdQ9VwgzxInPEIUPhZvL9r3zDKU6+iEc2vtSsXSbHPX1+az6Ak9
	lNXxcivpK3dAVqLUpEsJBS62dMNnAl0MjI/eFAy+DEnxYol5qNi6SMrH0b6GDESb
	9mY6DA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejr2mjmy5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 04 Jun 2026 06:15:18 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d98b76d12so267306a91.2
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 23:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780553718; x=1781158518; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pm1lmiRraz5tQhBBiQXHAywz2nv5ol03QuUwN7r5rmM=;
        b=hx/Rtj/9GfPFi52h9oHs2/GcWaIKvDcsEeJqQs3J5gSTx2a+aQr/TjvrRDVlfvfdb2
         NnoMyD3TsDVYwYkQDePzPUW8WRQg9Cb1XGZvTmbjeiwcW5DEiMq40efDAG7Wsjt2QT5a
         zg60Gl7UQn9P+bohUTFeU14TOfHE53v/zPrQKmB2/DOxo3qBVMEW1XhDfvniQoIQTrRP
         jewbOxVRidW5IgiJUhzBwdtvjDahoRkXquR20xwgFrZW+qEUc1/bsckRwGt/8vXkvqXE
         PgMkEKGvYAXic/oXFxXuGOosTOfdFxggLHRw6OKfKaMHbt2Hw6Sy8NENpQW2UdXjA83x
         x0aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780553718; x=1781158518;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pm1lmiRraz5tQhBBiQXHAywz2nv5ol03QuUwN7r5rmM=;
        b=XlBWrGwKdF5BW3vabNp43dKALtCz4A1j5LgyEQo6OPoi2+VP2OfFe4k/QMlgfbctiO
         BdLYeogKSq2cteNw+g214HNcDajno6eAJdx/8ABj3tH2sv5CzHC6WeARncAQ3LWV0dCd
         RLlR7XnRPdSUzlkx8Au9GbiwzRp2XiufoQd59PiyF9GqejC1NpqJSRmoDNM+K2gVoO2G
         3K4EME5+bfNrm7gn8n79DCnkdElonxEBsjN3TAPortls3LdQyP/taaSUGjDCiaqzfZhh
         ROiXDSsOSrwQtvlQHTVXXFgm2Y9j84ODXh8CtSjdRejSxlKFriENZR+mMaKpxRHM+wsj
         3NGg==
X-Forwarded-Encrypted: i=1; AFNElJ+oCZlC3s2rr10jKNOriCCHrRMgvuyGRYNe+1MOh/r8MFkrz/GS0alg29iD4vF74PldRzGGP9im4fLIZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzELmdcr8W1hZXWvxGO24lZ9FjNDGjVWDUAIZD2lJm7NnzBMwR
	LTZJyPPaBALZM3PQSSzJlx/ZYHhaG8agLm6V5Fxw2y7bp40hQQZQ/p0NHn4LFk2Q1Df2cOtjqPY
	vXr06KggPxKBFEPH3a3ppPFGHR7slk3ZrVsmhIzLI049G2P9WmYSAa21XiizvhMkJ2g==
X-Gm-Gg: Acq92OG7eOuUGy7+v0dbJaRCQ1Sd9WY1XsO2IVYw5Wa0PgSCsl/6q6K9rCyelLW4tma
	/8BHwcdqNaf92S+WkCxLvPyvF1jsORYCe4nOLu/uUziB9pXhFm6UIdBeLYZ4WBhFRYoqmJZjKx6
	7jCJZhN1B5iuQ/PQWo15s/UWKd2OQMsSWMdY6l3iIg5R+T4jgpV0UWk9oL1UMox+KCvVlxyF9v6
	09LpYLbHIdMhaKasfBXtw0+G/WwAKhU3euTS7bPK3RNZqmaHiQIw3aAWJZ5cikHJtx1rnkJ+y7K
	qq0Ly2Lp8mItVuWl1/YuqFEuUGArhGgVkHdOHHwrSv83AYjQ5s9Dx0av0EIuqIgLyF3TxtZKB+p
	ttdhv21XC9UmaHJgXs1vvpe8EhfvrNiiXkz2fVU5xWFzX9RURCXD6aZaP3neQ293j
X-Received: by 2002:a17:90b:55c5:b0:36d:bc21:4ae1 with SMTP id 98e67ed59e1d1-36e33ba4a37mr6551049a91.27.1780553717683;
        Wed, 03 Jun 2026 23:15:17 -0700 (PDT)
X-Received: by 2002:a17:90b:55c5:b0:36d:bc21:4ae1 with SMTP id 98e67ed59e1d1-36e33ba4a37mr6551011a91.27.1780553717214;
        Wed, 03 Jun 2026 23:15:17 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36e6b904cadsm4235759a91.0.2026.06.03.23.15.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 23:15:16 -0700 (PDT)
Message-ID: <4d5eb9d3-9437-c5ae-d28f-93d7604f8cb0@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 11:45:09 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: qrb4210-rb2: enable venus device
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260515-iris-sm6115-v2-0-2ab75229de61@oss.qualcomm.com>
 <20260515-iris-sm6115-v2-4-2ab75229de61@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260515-iris-sm6115-v2-4-2ab75229de61@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8KsEUjgVDxhaVn6NlC2UTL2maT8ydjS8
X-Proofpoint-ORIG-GUID: 8KsEUjgVDxhaVn6NlC2UTL2maT8ydjS8
X-Authority-Analysis: v=2.4 cv=A91c+aWG c=1 sm=1 tr=0 ts=6a2117f6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=7yNcMj-pRB2AcvHbL8oA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA1OCBTYWx0ZWRfX1AcoMXgv1sEk
 OLdo6jKcPgFQfkHjWhczoaqCJhKarsd8graAJAYKx1TD7WnEA3fOVKGi3OUqd6F0HSCJmNj0HKD
 pQfNwFdjcJpGGd5nbYZCUsBPAu3R+tfqVAQIem77uXKynjfzSimJiH/UDqUA636zANXEJT2zqWT
 3BFqsaWlFXEieSoWF+UbZrP6rWYfWy6dhhnjhVSexbZm+Z8QMloV+U8LjHayYcAYmPmxiJ95mjw
 a60cln09QDQDTzrfIg3o6/eXvpPA9Z7EHqDVgNJ2BNfsft8IEj+dBAw30JjTFqm4YydX2s5Gwss
 MdyXDiNjAal3KMYFNOmkqInH96TTuifOeqqY/7t/3JBkpqs9OfUGdG7XfZ1G5Qi51uotdR5G07A
 uiHduRsYaXGMENsc5y5Y6FbT/LCSBXmel6+Zdldt9ekivvywT0C4xsPMdhQlOpBJMxk3ASL30c0
 +p/jSXcuDQmpbVqAI+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040058
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63747-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jorge.ramirez@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 35F6C63D36B


On 5/15/2026 5:29 PM, Dmitry Baryshkov wrote:
> Enable the Venus en/decoding device on the Qualcomm RB2 board. The HFI
> Gen2 firmware for AR50Lt platforms doesn't work on RB2, so fix the
> firmware in the DT for now.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> index 1203172729fa..a6236b09cdbd 100644
> --- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> @@ -739,6 +739,12 @@ &usb_qmpphy_out {
>  	remote-endpoint = <&pmi632_ss_in>;
>  };
>  
> +&venus {
> +	firmware-name = "qcom/venus-6.0/venus.mbn";
> +
> +	status = "okay";
> +};
> +
>  &wifi {
>  	/* SoC */
>  	vdd-0.8-cx-mx-supply = <&vreg_l8a_0p664>;

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


