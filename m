Return-Path: <linux-media+bounces-43945-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D1ABC4379
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 11:54:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BE97A3512BE
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 09:54:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B64CF246766;
	Wed,  8 Oct 2025 09:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MxYQueV2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9218E2F1FCD
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 09:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759917248; cv=none; b=teOTcqsGIacKxXsarUhKUxr/qu6r+13iJly1O9Ml+7vsn+OxdzDRB/pCgz9F5rlzkEqVZlzfYJexv7/xWy/EkwEmZj04Jr5CVDrdrUzLQl+qbUGtjIb7lOhA0WNOEXdPED7VhbUNtYp3D6hC+kEkWcR0vO5Jt6SfPEHarCzun0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759917248; c=relaxed/simple;
	bh=1CQtlEWAmGoK1pKpKe15XWPh3wub4+1F2ckrxKV7f1c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jO+Sxyg7VppAjZd0y857TceEZZ9SI3IcgsekUTVOwueF4jXQZ0CFw33NjPvdifpv6kuaHpRVL7Lymk/GXyFgzJ+fNs8yWnhbcHmNPkYv3/RedsqaYwf3/Z7uStQBUcU80KsYgAhGa6b8YQXI1d0Jxc4ySQWwJATVrKSDdTjRqQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MxYQueV2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890QMV001445
	for <linux-media@vger.kernel.org>; Wed, 8 Oct 2025 09:54:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aFIzjuGgDbnK2cw8+042MLhfbBNRjpqs1JtRKpKEdho=; b=MxYQueV2QahWNEQl
	sizcDke5goe/47DMk1wbY/Psl3FM+MfEEDbNA2Mn/in3AMLCqODCYWSqT3xiae35
	AA01bT2lmjt27LeUvwJVsqHi9DLiYDpInPHfss7SITUB/uchwOpwYBBKMso1+mUz
	uW1KoMg0cLSyuTDA6oommCf9mg6Xx0BXxnwfpFL3V1TVXgyS5xvjLU/bbqmYt0Su
	HrQpykT+EaeChT4VdTxavfiRocBhkeYnwgpLosvzcEzlzpY/XaFMco+NesB6VfXz
	6Two1fn5a1kpzSJUyr/+VXHJVnRg1cx5bnxmVnrYbB9BJItce3aKZ27Lbig2+UVA
	aOsLgA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49juy720u7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 09:54:05 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b63038a6350so804318a12.0
        for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 02:54:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759917244; x=1760522044;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aFIzjuGgDbnK2cw8+042MLhfbBNRjpqs1JtRKpKEdho=;
        b=qnOrN3leEacnNAItQdtXQxHO2o8sur2yxOemGypBGE772VS7omhItNj869E1CRwJGU
         D3jtb0Snlw6yd6qXYszDfqW/OijTDy8d2cLF088MFhAJswg0eAfPpMGWYxPyS6K3X3OA
         0VxN8pv+MlSgbJVYa6uuiyv0pK1n9BCGTWJmN+TyGSJNCppEVb30sICf3CvB/Pruqdio
         476n3wuVeE1kYAB0WLoGZTLFZzls23RRfTUixoLEqz7D/MlOYDiQuhPhMpMVa6ypHfvM
         9wFiSFSSbqEtWJgoxArocjsP/3OEI6sAoIN5LFrcrrONiKQ4gTHtABZtC7fYO7lxoFcO
         czqQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9LqQOd85IYUxoC4ktXatuMvj0ngEx0Wuh+uOYq4jQmE3issWJOuw1XCnljovbJJxlKdYzNLyb18cgyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEn7zvo5RbbYQwn+oRvnBsVYKNejImSPKG8pEYjEvGmM5AyZFr
	DGsuJ3mKaoxb91vy+vgYQORM1ilR5mKmM8iGbQAwEi24HAAGF0UoO7RxApHceAdgBiTNTfunqwM
	7Y8E5GSxwd5hx1s/VgF73gvVtlTqWEObg0RjIk2CLzwF4qPoGw7M+5aU2fU56+6ruXQ==
X-Gm-Gg: ASbGncvACoAybzY7GpUEUTEGkiaPhg/WVFGzBjNN9qVP/l1DB0XVzoRSqLBDEsqKI/K
	LsOLEkwp2IoZa9YhsPXHoz8+OH/2ZAwlQ0HEnl+fkLm4WhU94mCjND5tcq7mDDcUxVc+T9mMfrC
	MSDzZFgXR3DdgOHVdJA2W3CK5sCLy3WDVR2f30BJD2LB4bU8/j3p5IJWnw2dXHurVcT7Ma5EGbu
	Al9tz1Y/XJlF0IzvrhbJObWrQjAKKsiIMXAxxc9SIno/xCNCVIEuIo2bqclxDmWN8DuJVFsGFz/
	eOorF22+8EavDKzdkMPZmRRDTWVyjjwCjLSto0kpff6r165ADmniVDORpokpHQUro02PoWhegPk
	Pd8Bu
X-Received: by 2002:a17:902:ce0a:b0:26b:3cb5:a906 with SMTP id d9443c01a7336-28ec9c97565mr77582235ad.16.1759917244048;
        Wed, 08 Oct 2025 02:54:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOjlMcCZKwjgYLPXDCXMSmausWa/VxmHFDQuPR+sRg5qtn01XXj7w6EtvhXg4/+h696ZfGow==
X-Received: by 2002:a17:902:ce0a:b0:26b:3cb5:a906 with SMTP id d9443c01a7336-28ec9c97565mr77582005ad.16.1759917243499;
        Wed, 08 Oct 2025 02:54:03 -0700 (PDT)
Received: from [192.168.0.166] ([49.205.249.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d126ad9sm193842195ad.45.2025.10.08.02.53.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 02:54:02 -0700 (PDT)
Message-ID: <12edddcb-7b98-503c-c5fa-3acfd3bfe5b2@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 15:23:56 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/8] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vishnu Reddy <quic_bvisredd@quicinc.com>
References: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
 <20250925-knp_video-v1-1-e323c0b3c0cd@oss.qualcomm.com>
 <nuunkv3xwfes6wed5xf4re2efakndvvrfl4lhmenilkic4sjiy@5cb2f5ygegvm>
 <522d7244-0003-a42e-9be0-1d353df8d5bd@oss.qualcomm.com>
 <oimuo26ohcye74j6rl5hfbmd4ip5wzudhyiaibf74b5zmjb4vl@xh3dnp7gmvq7>
 <7c6ab647-0c54-4480-9eb2-5c2bbf5f857d@oss.qualcomm.com>
 <b5d465e9-e84c-fabf-f275-3d0a5abf764f@oss.qualcomm.com>
 <2ppixuzddqmpa2d7nkvwwbfn4dnt7j7voyqfqcqeokbkzjg2lm@mokv4cihiuw2>
 <27381eb6-18b8-774d-5171-6326dc6bd9b4@oss.qualcomm.com>
 <09d08a54-2a84-42db-bbab-050dc1487f6e@kernel.org>
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <09d08a54-2a84-42db-bbab-050dc1487f6e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IrITsb/g c=1 sm=1 tr=0 ts=68e634bd cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Qj1tmCQJ68Tb3jnDqiTdDw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=xDDSp5OMhEVwG_PMfckA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: KPZkdlqdrcrwoMiVS69Hv18zHAHCEY14
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyOSBTYWx0ZWRfX1ztdkNaZWtDU
 NLptqpi9ygBfZZ2+ybAIImn4Nj18tAu+XOcdRr7yA8mWTtfsk9lnYAalyao/EjkDbGSmKfckSW7
 dVm0GSaadzL97vCLmHRR1+tyb4tjmoKno9LWbL/sqwqbISQm4T+inXfi7DuEGKIN+r2gS/ei0JB
 /kLRY5tLW7GRxKYOKwUEBm8K9ijH8a/0xQyhdo8XYX9uXN6OifGcL0dkf1F/Qp1RsV+TWFxnMGv
 tspcUyEujrTPhhOxMizEMYj3DwLEjQ7qx3609xEzT428yvT76QvqJQMQUDRQuB/IY4zg0le/RH9
 WvCw4Kzql+O/hgdQsRjTT/QqY+tq9dQnpoNTobDo2I1sEYtT7U8a7IROWRaKUCqzkEl5dvVOTof
 IOqHZip2tnYlWMbTNCTS0KzAj1IvcQ==
X-Proofpoint-ORIG-GUID: KPZkdlqdrcrwoMiVS69Hv18zHAHCEY14
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040029


On 10/7/2025 7:28 PM, Krzysztof Kozlowski wrote:
>>>>     then:
>>>>       properties:
>>>>         power-domains:
>>>>           maxItems: 6
>>>>
>>>>     else:
>>>>       properties:
>>>>         power-domains:
>>>>           maxItems: 7
>>>>
>>>> Also, what is the downside in existing approach where we say that the hardware
>>>> can be functional with 5 pds, and 2 are optional based on hardware having them
>>>> or not ? So all combinations of [5, 6, 7] pds are valid. IIUC, the optional
>>>> entries are made for such cases where some hardware parts are variable, please
>>>> correct my understanding.
>>> Kaanapali hardware is not variable, is it?
>> By variable i meant the hardware is functional with or without those bindings,
>> hence was keeping them as an interface but optional. If that fits into optional
>> category, i can keep it existing way, otherwise will update to fix binding.
> You describe here how SoC is wired/engineered/created. Can you create a
> board with the Kaanapali SoC where the power domain is not there?

Not in kaanapali, so it explains if and only if the same SOC can be created
without those specific wiring, then it falls into optional category.

In the next revision of this series, will keep them under regular binding (not
optional).

Regards,
Vikash

