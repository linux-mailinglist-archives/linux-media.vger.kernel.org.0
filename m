Return-Path: <linux-media+bounces-50664-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B36D1DA29
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 10:41:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C946D300DA7F
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 09:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3CCB389454;
	Wed, 14 Jan 2026 09:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JLzesBQl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OIk6sdvi"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0327B318BBC
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 09:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768383538; cv=none; b=oC3LNgGVgJDxgkHznpfQsYNBa+DrQ5EOkXIh9CGvz3CDMN0QZ7zLyka3I3Emj8VBZH/9C8gRs1wCggodHm3oJk58lN5K9yiAgEa/FbtislU6bULOMMrkshup4XrZ9+XLSXWU8/BDh+lCmMFekelvUtFRE8c3whmf2tquptRd0ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768383538; c=relaxed/simple;
	bh=Xp38FH3EHfLB/9zTGdTJEuAENX2mrwIViykrDPLmLVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IyUgNHtxHR9Goqs2Z05tSbrSpo5PtCzwDCTJTODIPphpCslzFWrKdeXhwl7o6Bn8w8ajutgaLKCNADDZd2CvE2reJ1MYoyJ+oKn05Tqkkco3Fm2rSLarFtzs9ozthENgBkPQqq0daFPMpCu+D7h1fVM5F7Rr3tbaEleZIgy2SuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JLzesBQl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OIk6sdvi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E7jUDP2082031
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 09:38:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HaaIfuet+WloNaLSPkAqR4z1R5fxpgk8RlbsTuisYMA=; b=JLzesBQlYUcf9Ggd
	pr7OxN+d21DBV4892AwsKQZ/j2eY7rkxmYgeEVwod0XuXJq/NTPnLsCcJaR+IRjV
	GGJ9Itb4jKAdpx8B2sEKaPrRIDFKvpkh0YQu6ns3mtQxuPngVNY20wmfYsDXwFKW
	Z7kL04sUU1Wv3uX7/aZLU3PQMjxtslYZ8eolgGgI7aQ/uVpOhZzbi1+3YU9VGq8k
	x9pma2MOwRi/KKL3UlBIO9MUUsGTbvzsdvImCaDokX080aRm+ZFUjlhZlUqMN9Bq
	4nkK3uiuRU2le7B7t88TMt4ZMOhnnQaSSSW41U2mIF0EuworIY3Id3XGL1IF37aB
	CfBwtQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnu58tr48-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 09:38:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c536c9d2f7so534185a.1
        for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 01:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768383535; x=1768988335; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HaaIfuet+WloNaLSPkAqR4z1R5fxpgk8RlbsTuisYMA=;
        b=OIk6sdvi9DeCtSdV+WNdd2naHIbON/NfFoQJK6vfKoIlWe5XNdYxazDe/w+n81030V
         pTTaIZt12d4ePkxET1nmR7caksAw7nWTqyZW9OhyDPuotJPnxh/zx0aM2zs6RfceFvgz
         ai/z2aoTixfXDE41MyqIMZMA3+Td9VarwQWNcpnMzjFJ7cPlvvrL2HGVpz24XqXF/c9j
         +J23SqjKtfCbsK5l0aaTkwV31webPtswiSPlBkx4xc1nTVGbsQhdHAlgrdiXzXZzsQ71
         0ejTEIZXlaLAfyW/PDIm+bFfUYfHY55TDSBQEaHT2K9wJTCdRStGrAm5RmKUyvxz+6XK
         EbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768383535; x=1768988335;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HaaIfuet+WloNaLSPkAqR4z1R5fxpgk8RlbsTuisYMA=;
        b=Lprkdotb91EgpQ/VlQsVnKBe7qfHTi5sEXL3oKjhEHNHMp4LFuxfUrtbOt+agsur4v
         zlDqUr3rJ4gNOHLtGKZLbZN3YSyHXIm2B+CbyEg8XSBICPjiNMMDuQ+ymvzNNiFbXotI
         n9B8ytGRoAsKJ6li8phC/6wHNAmNebfApAnFnS+luGRyaAgvpXcdsoMO5rs5vHH16J7n
         GHFMmyGc+FeMhqAQVtFjvYRTSBdO+3o0ZXdNHceP1NHsPW4pJWJXv4UM8nhzyo8fcPMw
         PUu4aaHvxlMKC4uL2qCkinAWm0xc79bF2dM4QhvfypvB2bSUV6Mlr2B7ReLpp2rrpn8J
         Klfg==
X-Forwarded-Encrypted: i=1; AJvYcCXm2Asmb+wfBLyCZiPOZMbNTc2n/UafLpjr8dpsqXXmB/WFMvL4WwmLQQcq8wQEmc1sAedbYiw97tPYkA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5rVyiMYbGHXZuZux8gFeq6vqRWMLHdeWA9TSOLXR+Qc2eZbJw
	fdspRWg+DMsjpdiDsnirutUdLgx1etR6r05hmp6kLAPykMnPo6msqCREzYne3HR1BdxyMlT8gBq
	pOGSylA21tnMBziPxrvMiNh6pypHHh29pGAsO5Hw4DwZoBdy28+g36Ogsg75eWKPh9w==
X-Gm-Gg: AY/fxX6vhvCSv0XlCX3xvWOXLIiqRgM7QeFs8n9suwj0dNy2/kY3Q20BvG0NN0QW/lU
	IUHMbKz/DtA0re+sGuj/o5gjYjgjhatlzNxlowxLkQL/A8BfNUmE7k9nKlcEYBu8kwvx32ssZIZ
	Lctm6alMibsqnFbQQXv3c8XWETOdPWkr9qm4MURZ2UHeGOFvWGydPzZYRKH/WxbZHBYhMyYnGWV
	aL6Q/jUhBnqak9oA/+87olY0xe1YE7zBIphpgm2APDyDAYa5YHG5qOEWjDvtzdJpg3dn6LSd9kf
	O/2NVTc9K8VzoUcQdJVyLZxVJS2BvFlPYEiNTWyGd3j/sbJzHai/8Gj4NXF3+5dlGXhsvd1etbF
	Wo610NOsLgPSOFb8c6xcDhf3ue3ckWdBGaOArgg8gNpd+NbXD9n0IFj0EAvQjjcUkOFI=
X-Received: by 2002:a05:620a:bc3:b0:8b9:fa81:5282 with SMTP id af79cd13be357-8c52fb16342mr214670885a.3.1768383535311;
        Wed, 14 Jan 2026 01:38:55 -0800 (PST)
X-Received: by 2002:a05:620a:bc3:b0:8b9:fa81:5282 with SMTP id af79cd13be357-8c52fb16342mr214669185a.3.1768383534889;
        Wed, 14 Jan 2026 01:38:54 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507b8c4c15sm22444115a12.4.2026.01.14.01.38.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 01:38:54 -0800 (PST)
Message-ID: <87699223-c2ab-4aa8-821b-aefe7d2c6b29@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 10:38:51 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/11] media: iris: retrieve UBWC platform
 configuration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
 <20260113-iris-ubwc-v2-3-4346a6ef07a9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260113-iris-ubwc-v2-3-4346a6ef07a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA3OCBTYWx0ZWRfX5Cq/gnNVy24U
 oji0313zkox9xT9vLVTZ8BgVEni9a+sEF9vFSC2ayZhL/i3BYuPXD6s6thfuJcUzbYUQdxmFHRU
 sM9q1PoSjO4dGFy9jnxmwvrhPR8Pq1pCWZL9GMJGxizlywCxT+DeR9iEZW2WjkimVrdlKjq/Ykd
 umZvAGYBTCPSawKTDDtJ9fahV8M0SeMhPJ6xUYRBqBmz9ScZeNH3a+mZE65BZAuFN7sWJpM8uAw
 pRs/MZlt15I9TK5+ryutwYU1Lmu21+G6hY1syxiUsZRaz+fb1+lfYKOhrZV6mequZmIN7Tmqya8
 Q5DWzppzPUeSKb3ROMwGHBz1IssCwu//fPucqtbVeqOPx+rNrA0LKDD+4uCNNR95ES9mQlgm7hV
 c9vj3I05DFNQo1ZdxKkjGyR6wDp8qD2QgUBnjZyapkw3aIwIQ/aLZTpSM0Gx84MzrL0zcYIHT2d
 PK89barvBipCm5FtWmw==
X-Authority-Analysis: v=2.4 cv=BZnVE7t2 c=1 sm=1 tr=0 ts=69676430 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=cAxcSLUL-m0wKPm7p5wA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 5-jl7g37Xdq4sc1NOlniyn4HzjKWooLZ
X-Proofpoint-GUID: 5-jl7g37Xdq4sc1NOlniyn4HzjKWooLZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140078

On 1/13/26 5:57 PM, Dmitry Baryshkov wrote:
> Specifying UBWC data in each driver doesn't scale and is prone to
> errors. Request UBWC data from the central database in preparation to
> using it through the rest of the driver.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


