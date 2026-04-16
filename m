Return-Path: <linux-media+bounces-58926-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFN2GT3+4GnzoAAAu9opvQ
	(envelope-from <linux-media+bounces-58926-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 17:20:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC164108B5
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 17:20:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 238E63161523
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 15:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF83F3E314C;
	Thu, 16 Apr 2026 15:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GwXJkIBn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I2hmzzmb"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48453E3143
	for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 15:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776352657; cv=none; b=XarqWKZbF+iCXMWehCckX+6sZhtXn2pU0oz3QmY6IJqnLFXaotT3X9sYTqRvUoz/TNlYA9+asAW21LPYZ/LxL3zFGAzwSpQ+FxweWUYrZNI2yq0t8Vq8PAzHBnT2WrzXpqI9srENN7PjG2cXGEssxsy3gQ0C5gGCVnakccHa1rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776352657; c=relaxed/simple;
	bh=Y9LX7R9+xvJZFxNo9WMoAQ1JYWTg+bkpYQnvouL0PCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oXCK6YgPcwG4c+qfpmcPVTem+KPDX77Uzk36RNa6aDIrvmkO1p4nUp7X/XJ/D9Bx1QfaW6Kd1wm5pqPJSdpzwyWxY7DPRpfhncU10PZsyQNQHzc/y37r3QIyKHTevDJK3X2/7BrGuHe4CiX+TKRF65PSz2ja0mKtjh2z2wGz4+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GwXJkIBn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I2hmzzmb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63GBiFM01668253
	for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 15:17:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aZFe5oFc6le2GeaVbR8SGtLA0c7Ib48E+jy/yvzvnMU=; b=GwXJkIBnO8vEVG58
	EgVKlZQPL3fZjXcXGGeqWrdyqQHf2PSvtNTeBzBHcI6xJEpXstE6TNM1WZM3+xfp
	wL+98aKkeHZEmFrFtrdE37/VXOwdt2v6HHdGW4e21JkYYhGIOzPmjf//pNP7zihi
	11BuPlNvvaVOFRr8Vb6V63Xyzrur8/5Cl4OM32WChWxXxraoeg3w8+jmENmQach6
	zJy4IhqWBQWLYkrxPEXb4LKnsMZa4jhJb53upzSfB1QiUvLl1DfN6qY/GWsfIa+Q
	p0QOURpAj5f9mbKHB/gOhwuIkOroh6tfM+trwOj1tlONyZQjCJZY3RcIFvQ46yR8
	Uhi+lA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djtd91wqs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 15:17:34 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5ff04e26bd9so539542137.0
        for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 08:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776352654; x=1776957454; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aZFe5oFc6le2GeaVbR8SGtLA0c7Ib48E+jy/yvzvnMU=;
        b=I2hmzzmb0c5tUeklxalLFQJgkHKlP5H+NLomFBqSww0HYwHLUWtHnW7u8/Z/8OrFw0
         TBsNqRwAeBR/z8HXUhdnKJbD4HpNPNWO3chp+vhDGmOgf47ns4ceBbEiEuVaEg1DCsQk
         Cck4edpeHexXYWOvGuq9AAM86SyCW13ry7Xoz9X48VNFj0qefZhYCT0GIe97kZJx2QrA
         i+LOmIgVQ+NiUudnipJvqp24iNxPiD8yixO591tVChDf3i2dpJHOE4IbbYtRk6Pc4fSc
         lfBYI/kwyYxR8oXVU+DIqN3Mk9JFPhsh64fw4iJrjjji7TKOoRICbMmVi5EqTDQNKgW4
         VQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776352654; x=1776957454;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aZFe5oFc6le2GeaVbR8SGtLA0c7Ib48E+jy/yvzvnMU=;
        b=tUbXhkxE9PS6+sWhWMLUAuA/KZCzy/J7783EuhxqK1nZp/XQjKUn4gkL78SczieXcg
         /FSS9Xa8ICBn/mdPGd/mdFHsivYm+sMGFMJCsQYDJ5iRRVuK5fry+RcqLAyKp2QfEsAO
         0ADbYfG1bouSpG3xT7TxHK00Z5jiI0byYpLXHtmKjaHHLzovEIEmxscni42N0XOLtReg
         ZcytImEdirVtTv+D0KHvLnWdxL6/M0XCTt3NNO0/gJxBKSQDhFx13epxkwK1fn+J0LHZ
         wnebb555ngCcQnGF/TV3CY37HE1wcyrATF0VEMktnJBS+9JB1gN2r91Ys7JXZruPoCBv
         gPMA==
X-Gm-Message-State: AOJu0YzmiTAarOiiFJm+QpFWEEsz+v5mwqX+F31h/+deI7Y9Hy29B5SJ
	wFzoShR43YTLbvrOpcSR20LsoLf9CmdOmr/hxat27iQzo4c/6ToZ9H09J0l4DqjjUarsf61gfFu
	4UEVqRYsNoXCZbts6PB1mwV+He5ukh5F0tawYE2ndtatcDlSx1JNE7jbZtC5AdpHT0Q==
X-Gm-Gg: AeBDiesmnppfSVLnYUj85fhxJunTkeVL8Ex1CVatfE3AzR1Ge4vhw27u/KaOk7I5tGH
	ZQ82RIhTcr3fF7BTKFM0ruVarozR6QUgYgQOMPJiuoA+6+s/EJUcMZMOxbghKJ4LVeUaNJBgxr2
	0B0Slr1G5SIOOHk8D57OMD2y/b4FO7Fq3ftdR8wO3lrGLmHzbVTgN6jrNatuUs0BGgTtNQi62/O
	3Cp8xxAMRoSew74Nc6iubx6qHgBCfVFRTgArfczK0xRu8m5OjujpsPHsK86XbwWpBwF/dU6pHwy
	jIeLaKKDqhsvOCilmurxKSjK2aibsuATyJn5l72DrIEOWR6987/H3M+5k7ab7vz3OaB/U+8ICaO
	+MaYz3Y61CTOg0LxKg4PfyjwQliS2nUClRUcxVm/sRLHgppvdYZCA3r0jb8L5tKsxz6qaVwcLIa
	vajX33XCY8Eqy2cg==
X-Received: by 2002:a05:6102:5c3:b0:604:e96f:af36 with SMTP id ada2fe7eead31-612b24cc542mr1280260137.0.1776352653987;
        Thu, 16 Apr 2026 08:17:33 -0700 (PDT)
X-Received: by 2002:a05:6102:5c3:b0:604:e96f:af36 with SMTP id ada2fe7eead31-612b24cc542mr1280216137.0.1776352653539;
        Thu, 16 Apr 2026 08:17:33 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba1778c3ecasm181609466b.44.2026.04.16.08.17.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 08:17:32 -0700 (PDT)
Message-ID: <379806e6-f855-4960-922f-26e3380b4afa@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 17:17:29 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 05/10] arm64: dts: qcom: msm8939-longcheer-l9100:
 Enable venus node
To: Erikas Bitovtas <xerikasxx@gmail.com>, Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
 <20260416-msm8939-venus-rfc-v1-5-a09fcf2c23df@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260416-msm8939-venus-rfc-v1-5-a09fcf2c23df@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDE0NCBTYWx0ZWRfX/OswpSA/MHXE
 nikh7vURoa4T0m/HgUXRK1wi3Bjs3H/i1c2WbtF7jglN5PAX5csvEZMEI5FteTFU6NSgV9vNGJl
 eIDC3eqBzRRS8CixIZubTd5yffEggrOAASfAhdRW0vUUlo8iKZnFUZ2QZ+g+jwLEWEunpFEeSSg
 VeMTRPf8un2Z4El+SZhnrSkGrLP24d0N2XeFoJnca5DP0OJDfF/SvyVqjrQnmX4odH8xm+XQitc
 xw6GMBzfXcobie0GgGKM2xpuvme/m8rfHiw3MBR8PVtrBDoHRtdZO/DhSQb2GbPqt3uYMR0heCx
 7qSa3+09Vv2HckUWESDlwJ52WM8pMgCjxpDviCwuOvYodUUVJuCHevvao2UP/w3di3CSxy9Oxzi
 bayB0KDqD9dPwTb7g5VppdoY8CKginasJ7rkL7a+Zq+onj42pN3ySIabK+yiHAkYdoUUkSxrfgL
 /C6LlJkdqzccIAGVmKw==
X-Authority-Analysis: v=2.4 cv=avuCzyZV c=1 sm=1 tr=0 ts=69e0fd8e cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=HDjIzE35AAAA:8 a=PzOwlJsuetSFvmXlP_AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=y3C0EFpLlIT0voqNzzLR:22
X-Proofpoint-GUID: nbW0E2AUmJdeCpBItL2xm4qTLyfvCRH7
X-Proofpoint-ORIG-GUID: nbW0E2AUmJdeCpBItL2xm4qTLyfvCRH7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160144
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58926-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,apitzsch.eu:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,oss.qualcomm.com,apitzsch.eu,baylibre.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ACC164108B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/16/26 3:43 PM, Erikas Bitovtas wrote:
> From: André Apitzsch <git@apitzsch.eu>
> 
> Enable the venus node so that the video encoder/decoder will start
> working.
> 
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> ---
>  arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
> index 13422a19c26a..48514c3df718 100644
> --- a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
> @@ -314,6 +314,14 @@ &usb_hs_phy {
>  	extcon = <&usb_id>;
>  };
>  
> +&venus {
> +	status = "okay";

Likewise

Konrad

