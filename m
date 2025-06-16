Return-Path: <linux-media+bounces-34983-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3731AADB67B
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 18:18:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CC7316CD04
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 16:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C9FF286D62;
	Mon, 16 Jun 2025 16:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YQiRguyq"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB522853E5
	for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 16:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750090707; cv=none; b=au9JQmJJp4kmqRlVr3sjXrJPKyaBeRVjrk9pvJDPdKaCOtDkGjqVSKV4u/UklZy9hUDEbm1TBKN15eE4TyVemERakZKszajES0P79UULhgUk9YcgQ6sHRjsGfo8YJs9rPW84YsGbyI/qkz7AFqQK5uh0ijUCTDPPMUHDMBytoBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750090707; c=relaxed/simple;
	bh=5dxQ60As8s/8rmI2TuFgJPch2gZ+j1BB1ZNS7po3vgM=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Djl1jCCEF10S9cq9AkhExMRmtPd1XF5u6C+0mKXzYJqP+kjFyOhyDfLsiKNu1KgQVG7ksJBs+4r2hucwlXkMBnQNYF9E0HXYHwbAyK6Az1fvfh4zgzlJVmxSFRI8giQ4wyO7WfBg6HKC66gtVBQ6zRjRLT3rfijs0zBaqrnjpAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YQiRguyq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G9PQG4006188
	for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 16:18:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lenjTOuIiqQxj1snFC9JaLJ/
	OZ0qD8QNh76r2FAzoEI=; b=YQiRguyq5DL80RlloScVAfpw9lTcjLnppkegCMZa
	XA3bRC9ogFQHNt0RhUOL4ceODzfvxjFD+qsYDyDR9S+0aXDgcR0xXljWFrqGLb4C
	XXJrG/LV3wDn2zt6EEFhv0eJrpT1T9+/S7oeaJ6BIMPsmW1YfIDF8FAyjXz8mtu/
	cOQeBKOuYMJXOYM0Z9wCaK40w2Ueu2rS4YwrMBEFstW0GQSFzU9SjqfXigg1iUK3
	QTZw4yT9ff3MdaU7YNg5I8GUPNgCKRHtCKHOMvzkgMUpEJqt6JLRvMg27m4uOycB
	NBZBWDuqz48C74/lMeLP2BSmHTR4cAYc+R4Jt8KR7dzDpw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791fsw4uv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 16:18:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c791987cf6so1041169885a.0
        for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 09:18:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750090704; x=1750695504;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lenjTOuIiqQxj1snFC9JaLJ/OZ0qD8QNh76r2FAzoEI=;
        b=t3SHswrK6MA/qWP19zmiNIm8SpaRr4hgpl3RMAcSiMbCAmzsCZKCSskEGTpvTLR0Xk
         +RbY5Xbm4eLMtytQToZve0swKPYtLuXqv7uqpVYhQSw6rF3g7XVNxyf2dlnpzKOP5CJ4
         isjRwhDfbd5jZPftoY1zM8ZI9OJpsk6iTiB5keePu+ivm/Ix67KyaUGJt1Drly3prSn3
         mnmfNqZGU968r5V0eiMVp71GU/SoBVBIGf2JQNoodMjS7SUSAwrPAQYraBgfsXnMa5t9
         UFahEY1gIrsF7PRjc1gebXtpMI46iknjtjk8K1o8qen1KG4xAayOKbyyATXya8QQRaz4
         I2tA==
X-Forwarded-Encrypted: i=1; AJvYcCVJUPwTxkZ7a5ns0+mgn0wIHxIWSWm2N6vWtTzmWjQSjw9Mx8fdcVe6gDiTi0lYlJF7CgDuQe59y6/3Kw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYNqxtm9a5ulmZIQfmFs7MCcToxBqVg80MK84NzTaTqwCm5iZ1
	hKyCMsnN/daiDhOy8A+mKcg+y1kA7vpY62mU6ufxgH6JOpaaiBrre+4nUNZ6P6iEdX69SJGTnjI
	DWzG6KTC75A7m/Mm6X4RFjoJuB/ge7fb0DlG81pa6XK+LoX4dHMyPQ5EJ4wHinQDtPw==
X-Gm-Gg: ASbGncsrA0wtGu/daGvxXI9V4fKIHsypmFCpsBwxNHsin4kdxGUCgPTcyBTC0VLIwpE
	CYUbjaZL/SMM/omG5vRTM8wBxGKq34tvjyTWdyoMSwx0Rmy4V5rfBhiNMQP7pfpmOQBEdbbWZf7
	4yZ3lZ/TlNH9gohyBL+ZHtyjDnVg2LHfMBmG0vCV4ehcdD9Lv9wnB0+cL3trlWSPLCypeIEMGwi
	CMXDfzUrWY7RH9eWMR1WTEdZzyrju++dg8A3Va9ZksA29G4ZHSfJCXJ2+04WvhWHmc/06ThoJyC
	/p1GD/T3azgLIkgsF/TMQvlCa9BLwjN/OoLMBFSXl95IArSk3yu6E8jwWw==
X-Received: by 2002:a05:620a:450b:b0:7d3:b9b6:f1b9 with SMTP id af79cd13be357-7d3c6cd6c86mr1518730085a.26.1750090703917;
        Mon, 16 Jun 2025 09:18:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYH0Bi1Qj/amsWCd72LYxFHGoIlfM8IzTVbUpM+all+BJ6C4oqXrBLJLX310yA58Ug9cHwug==
X-Received: by 2002:a05:620a:450b:b0:7d3:b9b6:f1b9 with SMTP id af79cd13be357-7d3c6cd6c86mr1518724785a.26.1750090703338;
        Mon, 16 Jun 2025 09:18:23 -0700 (PDT)
Received: from trex (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e13d014sm149938815e9.24.2025.06.16.09.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 09:18:22 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 16 Jun 2025 18:18:21 +0200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, stanimir.varbanov@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: media: venus: Add qcm2290 dt schema
Message-ID: <aFBDzWLkKC9MWGoC@trex>
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
 <20250613140402.3619465-2-jorge.ramirez@oss.qualcomm.com>
 <6f4e715f-1c73-450e-b7eb-92781b7fa050@kernel.org>
 <aFATp3zoSgkrj3YX@trex>
 <a76789cf-afe1-4d91-afdf-65c3af5ad11f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a76789cf-afe1-4d91-afdf-65c3af5ad11f@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDEwNSBTYWx0ZWRfX+FpMdC7Q34Ci
 ew1YgIr4LAqlxphD5Q/UbczJh4mpzsznX4E2uR22tX5gw6Ucqqg0iQLjxqKaBC87GkX0CoFnlqX
 yhd8kzz15wrgoHoUfPx0GIbnhvmQZ+shW2Sxwu7E0gdIFk0YismIoKclAJcDf3oMUq8CCfQYhZQ
 vUvl4Us7XVYL3rGtWqlM+EaDYS0p0rGq+yCwocYFLVoL2ZOn7urexWfqYi0X+OSN3BjUQksU9Mb
 8iKo8nOyEB2XUPF8/MG1CDQbRk35/AmoWoLXG2jEXt4ss3zyHaKjQRB5U+umdymOT6C0hA76vuz
 nS44sK8zM1xCk96Sy2VZC1M7p+ctLveYeFU9hn0uWEZLkbJX1HoTxmpTYDOyXcBPHbAQ24dWid3
 HLl7xH2rRUmzmo6TuijsI2OWX/+qJVGIsWlRwIFRkLB8UH4N8psL7sn8TjoyP3Wo9goAFhH/
X-Proofpoint-ORIG-GUID: LyNFC0hG6vQ1GYQ88GMy6anxR1UORIVh
X-Authority-Analysis: v=2.4 cv=OLIn3TaB c=1 sm=1 tr=0 ts=685043d0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=4oi7HMmTljfVUEt6n0wA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: LyNFC0hG6vQ1GYQ88GMy6anxR1UORIVh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_08,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 mlxscore=0 bulkscore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160105

On 16/06/25 16:41:44, Krzysztof Kozlowski wrote:
> On 16/06/2025 14:52, Jorge Ramirez wrote:
> >>
> >>> +  The Venus AR50_LITE IP is a video encode and decode accelerator present
> >>> +  on Qualcomm platforms
> >>> +
> >>> +allOf:
> >>> +  - $ref: qcom,venus-common.yaml#
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    const: qcom,qcm2290-venus
> >>> +
> >>> +  power-domains:
> >>> +    minItems: 2
> >>> +    maxItems: 3
> >>> +
> >>> +  power-domain-names:
> >>> +    minItems: 2
> >>
> >> Why is this flexible? Either you have two or three. Not mixed.
> > 
> > please check 5b380f242f360256c96e96adabeb7ce9ec784306
> 
> This does not explain why this is optional HERE. You cannot use for a
> new platform an argument that some existing platform was changed in
> ABI-preserving way.

thanks for quick the follow up.

but bear with me please because I dont follow - why can the same logic
be used - it being applicable - and therefore result in a definition
similar to those other platforms?

how would I capture such a requirement if not as done in this patch?

> 
> BTW, also subject prefixes needs fixing. For DTS: it is never "arch".

right, that is for patch 2 but ok, will fix there.

> For this patch: wrong order (see DT submitting patches).

yep, that is addressed in the next series

TIA!

> 
> Best regards,
> Krzysztof

