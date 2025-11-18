Return-Path: <linux-media+bounces-47314-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB005C6B330
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 19:25:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 77BFF28F33
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 18:25:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE5033612DF;
	Tue, 18 Nov 2025 18:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MM6wPB9J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OPtv9IMz"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1F6328632
	for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 18:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763490321; cv=none; b=kMo1IlO4abAmk8iO2X7MTbMZmEo3QpZ6oVwv6JBzbWZFhFMvHFZ2EkCNOIhn0PZnF+Gq/tx3cLm2waiuU0vljK5xUvDWV0fS/kto+91mmrkrg90nwxWwAyZkd7QRQF8hi2kMaTMWE0c3mpi4guZFxIqAxK2DaHydUFLcasowGI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763490321; c=relaxed/simple;
	bh=0RYbcD1FC3g2+gh/OJvJ1oHXpXDBxnpRP8sZE6lHwSY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MmRPxKu5VacPZvmDzi7cBuhNhoDellPxByA98j2gPI8H6Qo5iN/ZlrKucu8Ryu6UvZNofIZm347iwTeKBKZKkE9N0rgy65X6eGjNFJNAFvrmVkQwarosCSbUPXeTX/dmAO3mxiDmSVvtDTi3BDzOxCPjAUtqXd5GnwDJ/cuTjY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MM6wPB9J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OPtv9IMz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIDfXIG2272088
	for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 18:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OtFnw+ZUhvacU8hbef65l+oiIQGF74Z2kyVRPfFI1FM=; b=MM6wPB9JEdTpLuxp
	UALmBMNdKtpGm5EJtYQT80mx+HJa2e3Y9KB5fl85c2nQamsi+6L4vvi5125GQ2wt
	90+iz/Zo5HZWlAoQ1NpFf3Ted2t4ts53vV0sHUJumdcCsasS9FCd7Ncci4GgTPGw
	Y9Mag/GMhtY8CKs/ooY5WdJwZLn7ZstAhIlUeF0KteLF1pKsdFe18hM2kuXIt5YQ
	jGESaZKolI1SjW1wtsWv7ClTsC8TetDVe8D5npJCtSwJ25cYnkOydNW6OOAxtHQw
	OpCpPkI3mjcgLjIgrdOfl6dsRjaIJ4w/qdLXZchSSKb9sFV1e5M3Gjr+YlkGPeiC
	wdtOVw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agkrmj361-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 18:25:18 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3438744f11bso10993963a91.2
        for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 10:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763490317; x=1764095117; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OtFnw+ZUhvacU8hbef65l+oiIQGF74Z2kyVRPfFI1FM=;
        b=OPtv9IMz2gTNGXLYI62Lno1LaSII94Jq8/TuA/W5n1e8W8KZesGKv2ouK4nz6GE30/
         akG1Muyx0ElJ7nrXHtW65pqqDYwJlYaZUla6I11XnzG0HMCES8UKQAP5huDF9ZOffH4Q
         y5QiyM6XpWgd8nigKRlgmBTuOUt1mVM/goWDwTBoUNbiH4y7gq35AU5pQFRNt13zMLTw
         vGb1oDbT50K8VbhQKHE+VAM8oBmLowMMoz2ZnDTjjAVAkdOPYt5icUMeMJQGeeZDBecI
         tXKhsJ3+F8KtDCmxYMNgUuOJe1UlXjduJX5k6IvNuwm7lI+k7cB+A4g5pw7fIiOesTjO
         5f4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763490317; x=1764095117;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OtFnw+ZUhvacU8hbef65l+oiIQGF74Z2kyVRPfFI1FM=;
        b=IEN2JNUZ1556fskzBEyJ5sMKciIBnBWRwycTfJVGGa1v/0mRx6EXwtqlC2zRamStkV
         mM0CL0YlFI2U9rYU3ILYae60qxhTgAodq+8bvJCafx+32US8FPlCvxRBoiKwrN+Wc0NO
         IugkHFbNahzuOj8d5CYYMVeMYoyIBHD+2d8XGsiE4Fla9BXaOXdzOyLvV+r8Zqh4AjCL
         VMetDKLYcnYlLc4yx4iItykz6xRST6zg011gFdZR+hKgMT97VXkEhR2VRyxnJzA6i7ni
         WN16abyifJSnzX3fFiVkQmwYpzBD1GaAjNb9tV525kEcj9TOY/VoWn1KtsKX1HMChJlO
         mr5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUMLsSq1k84f8TPu+DGIAVHEeunOujH/Erg8D7YwhUmoji1md2LM5avggJ83SrmN/3L+thUNR7dlSlwvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYFAf4lv2VBjizr/Lm4cQKZz0WClTAP9ku0T2JZDNjKuy+41r7
	emRupnLmR2titfN7N8WVU/ikvT+vYdJIwHpoPzbRI7khEMjRZye144r/unGhTiULtKqXchF2Hk7
	pvAVV6Ts6vZWZbg8MHqQaZhrskc4WC1h8Mq6I32rj4Bhx0oGFbvr5Y1w1tsCb36rFaw==
X-Gm-Gg: ASbGncsApj81/YtDi9kEgAs9OTq4n8rj46h4hLoJnpeGvwsF/jAcfx/hsh86Ucxn3c+
	n4aXw+uH9M8B8gCR8YlOiT/T+ir6RXWmvt2VkI6kAbOOvUdCSfChLDip3xxjPSLA6JukjecFpGz
	X9Zok59r0LQPAlPROvZBIdy1Qe6hEX5ZCZU2v6vTnCm8OT2CR0IDcsM+p17EA+rDKa6zPnxHR0v
	oSlVPCkzBNYDydqR7wJDSO/tBvWuMEg32IdVJuisV65E4OoOgQ7hmnTf70b6gtFZiYg2c+eC22E
	VxHYAGqQCIKekAfuCTkWsppGhCAL+z9npwKPwmbNkwVbK3C8UKtZoIUuloXBzmH3PTm19An6WNJ
	fuhloCv1JcDRYr1bYzxoWwNGbBg/QsrOiRdI2jmvhedlD0yRguJnksd9V/G/f6D0d
X-Received: by 2002:a17:90b:4c0d:b0:343:e2ba:e8be with SMTP id 98e67ed59e1d1-343f9eaddb1mr19030902a91.10.1763490317535;
        Tue, 18 Nov 2025 10:25:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHgkC4v9MbHD71suJ/U+iLegUV9Kt0QpttshW9z4L5Q9wXCA+ksAEvNaMfhbYTIREdqFuo+vw==
X-Received: by 2002:a17:90b:4c0d:b0:343:e2ba:e8be with SMTP id 98e67ed59e1d1-343f9eaddb1mr19030868a91.10.1763490317068;
        Tue, 18 Nov 2025 10:25:17 -0800 (PST)
Received: from [10.62.36.22] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345bbfcd094sm155361a91.1.2025.11.18.10.25.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 10:25:16 -0800 (PST)
Message-ID: <37d0f89f-69be-45a7-90fa-347d6a3800bf@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 10:25:15 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] media: dt-bindings: Add CAMSS device for Kaanapali
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251113-add-support-for-camss-on-kaanapali-v6-0-1e6038785a8e@oss.qualcomm.com>
 <20251113-add-support-for-camss-on-kaanapali-v6-1-1e6038785a8e@oss.qualcomm.com>
 <bd899586-f714-4d2e-95e3-6abf124e75a4@linaro.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <bd899586-f714-4d2e-95e3-6abf124e75a4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDE0NyBTYWx0ZWRfX9bxDhiPl95em
 pF8UA9+TAy3kmBVEl+hkCnViXMn46FwAYlcNN91tyT4ghWfIFHtATwmSrDenGALKaQyG4POO9cR
 x6UPsCbcbEA5nxgtCM2F9eKSAIFaRgmCVnobbpzZIXQYbmri3iMKefdl2JMFW0kK1Q5/b2chvzd
 LGQnkrgNuS0zhTHGsyYinD5T1DDKvAhPPADCX0zNRBn/huutQZfEeBF+Wx/UYPF/nUC98oy2sfQ
 mcdBAnq+cWakGef9khUCVAaRobG6+OTY/14+34tlAPOPbNWJXfCr48M8uZu45CtaejhjbCaTYRq
 x6fMHI8M1zw/yym5Vjv0cs/18L9MTsSu6YdoK5PqiKBvaNRxFOgv84j1++aKI7DERaxHaFSp43L
 sD3SntGwry446RQJNTe7l7GpZuT/Tg==
X-Proofpoint-ORIG-GUID: kx7I9D5LGyNNCyfdDNTO3gxxet0Ym51W
X-Proofpoint-GUID: kx7I9D5LGyNNCyfdDNTO3gxxet0Ym51W
X-Authority-Analysis: v=2.4 cv=JfWxbEKV c=1 sm=1 tr=0 ts=691cba0e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=YIc4kcsZVYj8qvzJPVMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180147


On 11/18/2025 7:00 AM, Bryan O'Donoghue wrote:
> On 14/11/2025 03:29, Hangxiang Ma wrote:
>> +                  <0x0 0x0900e000 0x0 0x1000>,
>
> Why aren't you starting @ 0x0900e000 ? seems to be omitting some of 
> the registers in the ICP block. Should start at +0xd000 not +0xe000 ?
>
>> +                  <0x0 0x0902e000 0x0 0x1000>,
>
> Same here.
Hi Bryan, HLOS does not have access to those registers. They are 
configured by the Hyp.
>
>> +                  <0x0 0x090d7000 0x0 0x20000>,
>> +                  <0x0 0x0904e000 0x0 0x1000>,
>> +                  <0x0 0x0904d000 0x0 0x1000>,
>> +                  <0x0 0x09057000 0x0 0x40000>,
>> +                  <0x0 0x09147000 0x0 0x580>,
>> +                  <0x0 0x09148000 0x0 0x580>,
>> +                  <0x0 0x09149000 0x0 0x580>,
>> +                  <0x0 0x0914a000 0x0 0x580>,
>> +                  <0x0 0x0914b000 0x0 0x580>,
>> +                  <0x0 0x093fd000 0x0 0x400>,
>> +                  <0x0 0x093fe000 0x0 0x400>,
>> +                  <0x0 0x093ff000 0x0 0x400>;
>
> The rest of these registers start at the defined block addresses in 
> the documentation.
>
> Unless there's a very good reason for that, please amend.
Sorry, is there an additional concern here or you were just pointing 
these as reference for the above?
>
> ---
> bod
>
Thanks,

Vijay.


