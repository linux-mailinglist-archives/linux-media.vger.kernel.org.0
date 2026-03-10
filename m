Return-Path: <linux-media+bounces-55041-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDYKOyrEr2nDcAIAu9opvQ
	(envelope-from <linux-media+bounces-55041-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 08:11:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02671246290
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 08:11:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BF014302067B
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 07:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A38EE3D902C;
	Tue, 10 Mar 2026 07:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eKGGEOvQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Aeiixa5A"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D393D3009
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 07:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773126669; cv=none; b=J7c+gPDJRTjW2XpHJiCsEqN2Om/Gz3Yiy6R6gcaw2rlf0VGsmAI/P65joQi29QS2kVIC+eqAEPXk7YiNI6BBpKa3SWOaU5RPlAhQKbMWISoJclvCoqc48Gt/OKzP5lcxzt4IY+q3JkEpVxXLQNaZFxcq6Wo1CQelIKnQLNY3m8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773126669; c=relaxed/simple;
	bh=pPsVnGpOk4qG6+VcTy7J0ELkfiFzp+h1SotxmX/ICbA=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=YAJ1C48dIFnEt/Jq5OVyi9AcniXVLwjbvQjjAHcwMkxFiAP9ZFc45bdu+ADsLtKylKTkulWyJ4tiMgjrdc6Cil37upduOl1Q+09+CBJYj5L3uvhlnnryHHVKn21FxKKYtMWHTVhqE7kF3LCCWT3vBQHCfcWVcvkAD5Ar5JqfDKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eKGGEOvQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Aeiixa5A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A5lJhJ568755
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 07:11:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uVkLm00HhPjsOGiwCmfcOyAgMbGBSuN51lPh4PLo0kM=; b=eKGGEOvQJ2dBH437
	JJOw3EWOyPCZKLKm92sOnXFcFUCcogdP9zQHjfFFqlz0fZhN350yeRFlRNXuv8sa
	D5rHDz7udFXeZh0O2KAr2fPD1l/mHJCLzufVMiDUU64uAxVyop8KlJuVylocF/dW
	CW2NAXySDZT9PJzBOJYHY8Mib7RN/sTJ4wz/MgpgXOdZX/wkWS0+BXLiqPtltoYy
	jHZ6eHuI5xVOADlNrUM/TjtH0qkTqjeVGtAen4b6YTL1IwwdA+lqAN5u2jN/eaLU
	tR5MlMjEtQvONYkNg7I+/tsbNFpW2beKu6V243b9lIAuc6z50kJCAgsT59hArcZm
	lG+e+Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctdf8g926-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 07:11:06 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c7381a95fffso3271690a12.0
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 00:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773126666; x=1773731466; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uVkLm00HhPjsOGiwCmfcOyAgMbGBSuN51lPh4PLo0kM=;
        b=Aeiixa5A9jRtghh1wAxMEjsXsOcSWoFqmfLV6aflDaA59/JChTZqO9XdBFKd11gJYT
         Tty1WZXnU7+PEVBaXMIf2MWErFPl2MUEihVInnuJvixTh14rpNo0Ho6P/MVF05sNlpwW
         ROtEDtIlTJCDmS1fFmVbsmRHfZOjaaCMlKMEmZp5GvoNZmMnAY+c7O7GtD8iYdWunqF8
         Oxe4WTUB9pSRJ+lHbCYm0gL8J/Dq6QeyXQMME2hltvuEZXZlTHZXIp8jYpsJLtXu6fc0
         uK/71++hqNLiZ4wkbQ+H6PSpmrR1/pHLUOrhX+mRzUJwj9nKQsGync7FXnin2u9gZ9jD
         jMgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773126666; x=1773731466;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uVkLm00HhPjsOGiwCmfcOyAgMbGBSuN51lPh4PLo0kM=;
        b=KUhyGKFVrsCiQ0ks446vqba+Vhwn/69m2kwFi4MrBNKiwQyhhp3hADiP+k0lEgAsic
         0+HB4IdDidrHdpXciXR0IJBflptwN7hA1v0CF/bdE8VIgMmVL4gWZScUusaa79iDp4Bd
         omIgMIZlZkNleUDTsioPP+3gsLUuui+24h+KtdT+1RH60Y7Vlx0+M9BmYvdPmFuSj/Su
         9U0g2oojIdUi9WU3655p7blcdoToldlOVlgidDcsxxQSxOUe3QpDYDrBqB2htlFrfRyS
         WL5rnI6sdSBrG/c7wKAfc+8KKwyBtH0Ni1up9JvbVRAgJ3y8/Anmx2ihWgYTp6inPkTL
         fLuA==
X-Forwarded-Encrypted: i=1; AJvYcCWEzNWoDwVjvFir6HA8nVuLs9a8ycqT8MyFKVbVb/48CrI2GB7fqLFtxkIcrbajGIlviF/5y6r1qkQFag==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWUqm75NiTatpUqCg6YxQeI105coXxfpaNVJ6nUtP33k72Jy/o
	QUh599iZr0/XEjwMGZrlx7Y6bTAb2tPuxsnBrv9Hwf8RNMw5psE3qAcAfsbdfqLCvug+TxyjN2P
	HooKGVKdeTF02gUvBvnGzMCUJO5evfJaZ+c+TF6/cXDxBuJnWSbwq8Itu5nXpTtzz4g==
X-Gm-Gg: ATEYQzz4CsbRoD9olgR7pKpXvL87m1ZS4BYxz+mBz1oSgy7hhFcm2RXssvOm78TRcS3
	i9d4jVuChAU8xHk7hErQGZ5ofjVxh+FEpahQIcH+u7ERY8FP4aMMXXYURf+VfFZGzzIL0EssE83
	/pv1EIAHyNro4Mj4VZy8Y6hwt6PNyVGk6e/Q74hrzSIqbDE4DiefF7BjxLSff6b7ybgyjN+Urvp
	A0TSiYZfgzbUrEfFNIcmO2jfjRYpgstACSGnB/lcs2haRwnnq5m+0clOW1qZWTa9az3S3q97a1T
	VnfrsjvrdlRULGssmLG99VyELs6IIXr2y6xEeUZn9LZRq+e5dZ4OUgaTvwWH3ltk4mNtAMSqCWW
	USIK6tL9eKL1k8Y33LJZGPEI1QPJXa9IXCaaafIYdVz+sreyELqhRkVk5I6ddPLVm2vs3Rh/Atn
	/xyMr99RdytMCSzqo=
X-Received: by 2002:a05:6a00:71c6:b0:829:8e51:505a with SMTP id d2e1a72fcca58-829a2f7a0d6mr9389305b3a.45.1773126665883;
        Tue, 10 Mar 2026 00:11:05 -0700 (PDT)
X-Received: by 2002:a05:6a00:71c6:b0:829:8e51:505a with SMTP id d2e1a72fcca58-829a2f7a0d6mr9389287b3a.45.1773126665399;
        Tue, 10 Mar 2026 00:11:05 -0700 (PDT)
Received: from [10.249.19.96] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48d372esm12756272b3a.61.2026.03.10.00.11.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 00:11:04 -0700 (PDT)
Message-ID: <f0aa45dc-cbe7-47ff-80b2-bdd5a8ae1585@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 15:11:00 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/5] arm64: dts: qcom: purwa: Override Iris clocks and
 operating points
To: Krzysztof Kozlowski <krzk@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20260306-enable_iris_on_purwa-v2-0-75fa80a0a9e3@oss.qualcomm.com>
 <20260306-enable_iris_on_purwa-v2-2-75fa80a0a9e3@oss.qualcomm.com>
 <3dcfac27-4a6a-4322-bb39-089b934cc371@kernel.org>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <3dcfac27-4a6a-4322-bb39-089b934cc371@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA1OSBTYWx0ZWRfX7tlnWVqoXF1U
 phCL/nrm6bY2CGR2GWXq5/CHmlxm0xvoz71Le/syl26hlFCbAKIM+YcVYABgK/QcaG7v0n8IioL
 tBAJByjkf27PXHk7vHLWssSkvE84lBIYG8MYkBzf/NvQwcXkmSaRRpWNNA5jLf0dTpILad6+ycM
 QHsdM79weJeth3woiqIGKt0wDfyapogjbt/zXpDRzfDJXJawZ89pHB/UAzaNGkJDeZ67NMYxEiX
 7moppgFNOXPhcqwM96L9MAKWZs5yCqyPil1R6bC7BTz/YJv9NecgSW1PZb0Ym+VYLotQ2ye+m0q
 CZeVqcvvYZORc4q/hTmx/oZanrZoc/0zhYmh1n4iOBW+cWlJR+ITvAQCBSNtVUb7c8UVZ70mCSp
 YPoBYy3iRx4OUJ6gBeN8UURlqHvL/cmOMwzUGzuQR3kRy9jQOcwy6tlmSbLslnGTVu/7o0LfAlc
 FJe7wLQRi40ySXRBmVw==
X-Proofpoint-ORIG-GUID: oMIk7XO431nV8kliu1hmFZhyH7z3Dd1g
X-Proofpoint-GUID: oMIk7XO431nV8kliu1hmFZhyH7z3Dd1g
X-Authority-Analysis: v=2.4 cv=b+W/I9Gx c=1 sm=1 tr=0 ts=69afc40a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=lIHO-FEEoKl4Bihg_moA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100059
X-Rspamd-Queue-Id: 02671246290
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-55041-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 2026/3/7 21:15, Krzysztof Kozlowski wrote:
> On 06/03/2026 09:44, Wangao Wang wrote:
>> The Iris block on X1P differs from SM8550/X1E in its clock configuration
>> and requires a dedicated OPP table. The node inherited from the X1E cannot
>> be reused directly, and the fallback compatible "qcom,sm8550-iris" cannot
>> be applied.
>>
>> Override the inherited clocks, clock-names, and operating points, and
>> replaces them with the X1P42100-specific definitions. A new OPP table
>> is provided to support the correct performance levels on this platform.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/purwa.dtsi | 53 +++++++++++++++++++++++++++++++++++++
> 
> DTS cannot  be put in the middle of patchset. Read submitting patches in DT.
> 
> 
> Best regards,
> Krzysztof

Understood, thanks for pointing this out.

-- 
Best Regards,
Wangao


