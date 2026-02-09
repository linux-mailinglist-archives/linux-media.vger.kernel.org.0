Return-Path: <linux-media+bounces-52386-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEusFWChiWlU/wQAu9opvQ
	(envelope-from <linux-media+bounces-52386-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 09:57:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C34C310D435
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 09:57:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 06DB23027128
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 08:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF63132692D;
	Mon,  9 Feb 2026 08:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E16QCMYF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U/qC1afg"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D863164DC
	for <linux-media@vger.kernel.org>; Mon,  9 Feb 2026 08:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770627238; cv=none; b=H9d1gJYa4kmz5eM7s4vqm40mY/DhuIs5/nKZBK+lXjgrl9AySAyXlUfFqc3Fl5kdMinM01aPqa2rpIllfg0/Iu5XYDbCmUGPUEcFzLBgR2VUpN8TrZAiEgiXK7BXxyarA5r3A/HYloIj3quylb6kHjewUaa1qzYBmrDMsMzjh7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770627238; c=relaxed/simple;
	bh=BrBZsjwWaf2XsMq/I5R1KtMQUDwHUJrvmQol7WQysVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X56aszkdBBCQ/uoMsIfGv7TfzaeKGmwvGPaiC8LumXRTLtNJJ4+JOggdWKQxBmwCT0z31CCPGm4iDpDl+hewgAI1kmXJsgzCSRQFNvrSUjngM9/YjjZ4ebr8TR8rJwpXYD7SPsg77bBvwidk/Z/+Q4Oau/8srYP8Ykel6aZ+ZkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E16QCMYF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U/qC1afg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61940LlX1656367
	for <linux-media@vger.kernel.org>; Mon, 9 Feb 2026 08:53:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	90zRJ2l5zzlz0Ue4j9HhTVeCKnf0b8++PwghUJfL5YQ=; b=E16QCMYFgG/vcS5+
	forNQMItfvT5tGXtHMWcBjJDtzACfYeUNrlNZgHTTZW9ZXb9ZS7368I9P+Nq5jI0
	xtmp0ZQJuGvh7bZ2HE6j4vgjjjY6Df4Rw5GzTQWFIrLixxIlfuSSkC7HRV9xumL7
	lDicEwd/u/1BnJaOewE8zjW/wCWn2uZcIQ+FgB4z2nMmRjj0Iy9JUB6NpKPOY4Vm
	8f0Y9DK/1nu76oaUVsyvVJC+1p+Vfhm0jqISA/rWOQC5Qu1N9ISyXqIrEu58keaK
	6/IdkU3iDy7fPtfDMmtSQmrZ9E7AsDxK4gdUr3ZBwfByLXUni7/VJQoxDTMrXty/
	/6k3ZA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7862rwf6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 09 Feb 2026 08:53:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8ca3952cbb9so191861885a.1
        for <linux-media@vger.kernel.org>; Mon, 09 Feb 2026 00:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770627236; x=1771232036; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=90zRJ2l5zzlz0Ue4j9HhTVeCKnf0b8++PwghUJfL5YQ=;
        b=U/qC1afgrYYG7uZIVS+DCCk8o/ZnpoYaCAN8VVGJwy1rsiUU7ZG3vO+cobovxejOpa
         6I1Q2i+u5if7xBEWl+cYWJ4Q/GWUu72Wp+dQ2tkckolXgFPLwr7QGguDVlKS0K59AHF6
         w9YsospQR0cl566aR6+faKqr7eeobMJ+RihSaMAiUWCpDk0k4aIjxri+9Ijz18BsHL1Q
         tgC/JhTnVBDoc+y1pxcnA/TXBRMT23zAlCtxg4yBMGGY9ccNM/gTZYUivmHFenDKrQkl
         rVUDc1bzSKtyfgQpGED0VyQH+OMmX4otUk/nTE6Mc0FWf5jOqf7nAgwrkkHJNxYWW4JE
         yrvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770627236; x=1771232036;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=90zRJ2l5zzlz0Ue4j9HhTVeCKnf0b8++PwghUJfL5YQ=;
        b=Lbl4oJBZJJubktVxJ9dIbB6Qda8+asYUtXwaQG4sbFQG7s1Skn9KCoJVLj1MCqsHtw
         5UdCQ0ATaneCPyXK9IMn2TPtJnlyOkEnw8xe7zH7EYwCym6Y/9YNeW2WLAlqc5SRvg38
         WftGgXpanvKuoai2KugIeWEuQ1I7quGtJlvqCk1vN+PUsA+guVfjMWiFjUqrleuhd6Oo
         zFgqUm377KmGn7VMsFi3eYoldwC/eGYRxU/82MmcDQ5Fl+DHXrYPwErxyQdpGlLJRDB2
         lZj/Pnb9xrtPZu0+q19GDzMAuRYgunFwKjPha08DeOnxeZHv6+XphCX/8rSJI31VeNg0
         hYNw==
X-Gm-Message-State: AOJu0YwrDlX7Lb8pcr5M56PEuioeBUVJdkvwRuPMUhTo6PuqIDU2Ned6
	5jAPBE7ifzbvmjYNVfuN3KTvgNXNPHT1XaGR/sgOUHD7SyepfBN6ni6gsR+yZlRHzQnW57R97J1
	tVK4JYvV6SkjPd0cQ/fj1RQ9moA2gGyIPCX67gfJql6rqMc4puNk4qgnBpiT03IudSw==
X-Gm-Gg: AZuq6aJ+NX131bGP6BU02sFnQ2nsvm2myY/J4J/hS3YM0DdEOKVeXmP/VfZ19JPylXN
	YpoPspPCUMMD8gRS/j7FI098vA6D6Ej0aJXzduIzo0Bivd4XjAUiCbfwR9wRIg5ze9rxuJue3FB
	V14/Z2Qz3oOV/3YgIf/8uHcYZYlLRfrxFQ9YBQXLLjRtO8RSuPjNAYe5IkcdsdS/5IV3jK/3yE8
	c2bSAqfKu7iV2IoKyo4xGN6c0vbGkqVOCX1EvjnzqQkRRul8WdCtyEOHcHqiv9Z7pc299NgfN9T
	9SsbKulP2Gk2lW+7BUoNi3nloH5YYV1E2melkt2OnambO0LKxrH8ZhmTo1QeITGnrSrc8Fr9+i2
	f2GCBAz01/V84yJWyrSoXF0qtVR6JPAd6DwM1/Z8KoIl6gJzRZxN2Onhux1+28b6GQoE=
X-Received: by 2002:a05:620a:46a6:b0:8ca:1ea3:3d9d with SMTP id af79cd13be357-8caeeb51263mr1147316785a.1.1770627236499;
        Mon, 09 Feb 2026 00:53:56 -0800 (PST)
X-Received: by 2002:a05:620a:46a6:b0:8ca:1ea3:3d9d with SMTP id af79cd13be357-8caeeb51263mr1147315585a.1.1770627236136;
        Mon, 09 Feb 2026 00:53:56 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8edae39441sm358996766b.59.2026.02.09.00.53.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 00:53:54 -0800 (PST)
Message-ID: <af694d66-4e5a-4c44-8858-8d30e9d5a70d@oss.qualcomm.com>
Date: Mon, 9 Feb 2026 09:53:51 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: purwa-iot-som: enable video
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
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
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260209-enable_iris_on_purwa-v1-0-537c410f604f@oss.qualcomm.com>
 <20260209-enable_iris_on_purwa-v1-5-537c410f604f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260209-enable_iris_on_purwa-v1-5-537c410f604f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA3MyBTYWx0ZWRfX3HumPo8gE4bq
 VZr3zLDO7gi6Dvx8d5aoFN/2zfj41o7FG5in3FE4VzmKU7zixz5bw4NKdCH4YG0XHraxbU+o8CH
 BvrWGk+vL/v6o7YpeZ1SvLcCgzVtGvu9D6xrJUlDdBknsjysiP+q0esiWssUcIN4Hd2bgUNvJQ7
 6wL0/y3Q3sR4vvDNXNKkLa1IGFp1QzlSyL0YmTCDtdOgAoVbP2vWCI0AH0ilaR26IrVA3F5wUpB
 SQ1x2C0j7gxk8eqnBAOIgY1JFEMAKXce2iW2C7QBixIfgck8tq0sabQcXKwis48b3t7SWeMNdp2
 fo9GKExZCcSquF1/R84ypdo5ia0PVnMPSOf2jYcmThVMoPoegfPWJjfNvDxCvr+exkUJlvFwrAm
 FvvAfRdP5aNQyp56V3PwaerD+NKTs9/B4VIU87YjUo/dCheNwZp3zM7NsNKYODWThTDdw/rJVgr
 mL8KG526+inL3o7dU2g==
X-Authority-Analysis: v=2.4 cv=bZhmkePB c=1 sm=1 tr=0 ts=6989a0a5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=KOkvy7CdQc8EJBPl0WAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: GhgU89W0SibQMHvv3hYfUWDeY_9PMw1X
X-Proofpoint-GUID: GhgU89W0SibQMHvv3hYfUWDeY_9PMw1X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602090073
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52386-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C34C310D435
X-Rspamd-Action: no action

On 2/9/26 8:39 AM, Wangao Wang wrote:
> Enable video nodes on the purwa-iot-som board.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

