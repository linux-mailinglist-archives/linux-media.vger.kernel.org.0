Return-Path: <linux-media+bounces-50857-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6B0D2F127
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 10:53:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 35DDE3043781
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 09:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1345635BDB8;
	Fri, 16 Jan 2026 09:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hzv8ym0I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GkZUBTdO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B24E30FF13
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 09:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768557074; cv=none; b=UjZXhyJ6k2q6X+oGQMPV9M4Fd0E1gPexMb4O8QksPdjVkO7qx16i/zHnAJtDtIV2cS6SFmkGi59xo4nNvF7zhxOa7fNlSY8waU0QEk8VucrCsIwZEqUxszEOKikBZpnio3ZD8Pn0fxJLBQ4j21vlEANnk2s4grqkGtPUhUo4MLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768557074; c=relaxed/simple;
	bh=SW7TUx9OJbaODdBqBX9kDt83LgGVLSIRHq89fu2IJeM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QekgN3eWJT6QGPbYjQ60rHIPKGiXm1k3LRHMz56bDtOEs6ftDlDIqtoEKyBsPOUQ/X3sS9Q9JXOQ/gQi/3G9MnR+X5uB+Jbcw2bQdFfnbqaSrpAupIe6iVaS2ZNZ3VFhIkq3Qe/3O6G2ZGBi6msjKDte800QkgHh1ph7DP55MU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hzv8ym0I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GkZUBTdO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G9iIge006925
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 09:51:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JyySEoy4cs4LSscoZXS7M1fbq2iJJdJ7HX00v7rwAvw=; b=hzv8ym0IKZ0ZxlpU
	m+jmdi97m5AkdI1y2bewZrci7G9ye3rGRUUoLjB/KtQlYtU1k253U/hWweCS8sOH
	WhogKRLYsevGHH+cstY214AzhyJsboeo7t7ApVlD1vz93C97rTx6Z+PbkXm6A92I
	Psmoxqwj6jO0oDfRzka/rh6FXlDihlNBkECl57yM0KqNv5/4ZsbWvk2lnd6A8eDH
	WQN6d8fEKKbqS/IMbF8SQUWeEAJHnOcT3uS/O7nW1AmGAi77QJRqFYXV5mEAqGX3
	TQg+6TZgjO5bXuotZaSrG9wQtt0jgeo4/TIVH8Wi8SWVc6ABNmTp0xFGnXIhDE36
	92j3Jg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bqjy9r0nr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 09:51:09 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-81f3fb8c8caso3681625b3a.1
        for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 01:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768557068; x=1769161868; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JyySEoy4cs4LSscoZXS7M1fbq2iJJdJ7HX00v7rwAvw=;
        b=GkZUBTdOVY8ZU56kQymfOK8obN0glC0Y9LNGWtjOfFQU3pHA9thonH/g9HPQv2YML+
         Sbjl6+wAxJrTeWkWgwAECvUfquCiORlHWhiJsDl5mZy496ZtMncRNCuIyoQG6WdcF+BF
         8IpMZGR69HqElFqGMI+JV7onPgc7MnShVVVPaUGtGSsgH5y96IBJ2TSo51L0nIjI6Z04
         EvupcnTPyK7S5dvSrqUxXbZ6PV+CnbHax1hsRE5LHFhrunOJtgdnUWXX9XlDZW1E/IX1
         xw3LPqWJ5iineEN9TVHcjhO6fZci8LtfFbV8rfEH5uTnqc4iRMvX/n1t+t/hQOm4JzBP
         Zejw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768557068; x=1769161868;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JyySEoy4cs4LSscoZXS7M1fbq2iJJdJ7HX00v7rwAvw=;
        b=sqhE76DNsW8eLd3x4uJhi/Vj21amxv2jECcB+ixfTCghpaoiTu8j/1fpzINcr0dORF
         L4CcuE7yyp0nCYhKKSLAzwZKU74bA1ZcNfX6yaPhHCkr8ES/XtOM0fRqH4Q+fRu7nUdJ
         K5w4ZRDfiOj0JS3KfRvzNx7ZRAoA5RXtHBKF5NWbyUio9RlRKyP3vC3REI5jkFEfmsla
         rOIv5OhymwSdYE2ymVSt8NTcsdjevfZryGj7abyU6qP8fRSL4HXUDYNwCZ1XHOsiWsHi
         vVg98v97S6kmjwncGt8ObBdxRef5P2kafnKv/hlApSGguJJh3c/wQk6nQMy7zHVPjIlu
         n4Eg==
X-Forwarded-Encrypted: i=1; AJvYcCVUD0ueZ8d10HGdUIUO3hac0blyDte0hbDcPusX/q8CCoPCnFV6aviDJS1Mu8cPfh78/2RBvUUKEUQJUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVVrWsS5RbbxW1YlRF47kmblwZ/8IAKhi2Tm0zmLZ+dZYXWa7c
	VkpY5KiC7vuE9yx2pLpFhelPZyLaq5pjMyEbAK/lNv7ePM1ndPOGkdrNeC1nk+utee2AnU5REVz
	lx2zTnxjAG3jTErZwkM1IW2k98qRez13nL6u5Keaaq+4Zx485+qJmDfQ+N+PRe6hf3g==
X-Gm-Gg: AY/fxX5uc5w9TY21pJ5N10D94mdNKfYIZaYmlh2w+umAa/w7Bxz+YzNlU1tyiQ0zLos
	rojQYks2Y0/u9mun751B5BKOiXfq6vxM4Fx7x0XlYfcJZqLNuNmO7WJBIv3Mnb6DuRqfM4iWUKu
	s8X6UNQuBI+WcZCxFbL/in6Vc6k0rNcKq/jvSCiAgbVwikIovXovuYI9JoW2XsyrNWNrvK+OW0N
	M63O1M7oxfVSRIGEvo3nSP8iTMvkRUbPoUz2BkoeNQ58uk+C+qp4GSBpNOZsKWj1b6thhgsXIuJ
	RwNkHjfNAv81mydjV7d2bBaG7BTlhlEZwZNfIUiBqRQcTEiNPqlem8UcmbHY2WkmYyIYkcx6HnK
	eDwkWueKkYUAxihfON9ln6knoHCGTteJsIVq1LtQTCg==
X-Received: by 2002:a05:6a00:18a8:b0:7f0:ead9:578 with SMTP id d2e1a72fcca58-81fa1780ff6mr1812567b3a.2.1768557068525;
        Fri, 16 Jan 2026 01:51:08 -0800 (PST)
X-Received: by 2002:a05:6a00:18a8:b0:7f0:ead9:578 with SMTP id d2e1a72fcca58-81fa1780ff6mr1812555b3a.2.1768557068045;
        Fri, 16 Jan 2026 01:51:08 -0800 (PST)
Received: from [10.0.0.3] ([106.222.229.125])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa10a03ffsm1625170b3a.6.2026.01.16.01.51.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 01:51:07 -0800 (PST)
Message-ID: <54b29b03-4166-60d9-d553-d0e655749da4@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 15:21:02 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 6/6] media: iris: Introduce vpu ops for vpu4 with
 necessary hooks
Content-Language: en-US
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20251210-knp_video-v4-0-8d11d840358a@oss.qualcomm.com>
 <20251210-knp_video-v4-6-8d11d840358a@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251210-knp_video-v4-6-8d11d840358a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VwaTZCuxyO_I3UHoeL9vVMSbBGxm5n9K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA3MyBTYWx0ZWRfX7YPCKtnbBIoG
 oDjK3JaanWCfzmowsXxSCvcvOn0CoADBNIld7RzJ0EDebwNYTjCtnCXrLIa60dbiM46XW06/Lpw
 o8SCK3Gt95H1XuT+q+aW+pwwtWuuNv/n7OofTPZ758HGqlYdOGBoTEy9Vh9FHZFmov5tweuMxD1
 IDRq0VU0e9ONsS0E3lUQmxZWroqk5JXC+1Ek1HGwwM0wT2TLnl2E9fRVJ2laoYR0rWZmeTN/jxO
 P86pCnU3KW1Z8EYdztrDVhs9a75H6i+r/UTkKp1n45LwrRhzDdx+0wkjuua0fK7twedWt4mGooW
 TpvuM+/Yynp1FNpxySYd1tV2I98q5tIA/vbAxOHb2G7cdio3f/2xtDWcuDd5OUyhxh2mNeipusq
 yCGYfCfNZOXezD2WMKiMfF3GI29V7X7nGQxNwxnLqAQ1W8bF0q4gJRRNPBDdk4S4DXW2ROoMNUc
 L69rToz/0ENT95NiNXQ==
X-Authority-Analysis: v=2.4 cv=OJIqHCaB c=1 sm=1 tr=0 ts=696a0a0d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=blWSk0AuXjsE0o78ys1YMg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=hqVnMPCZWYgSQcfks7QA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: VwaTZCuxyO_I3UHoeL9vVMSbBGxm5n9K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160073



On 12/10/2025 6:06 PM, Vikash Garodia wrote:
> Add power sequence for vpu4 by reusing from previous generation wherever
> possible. Hook up vpu4 op with vpu4 specific implemtation or resue from
> earlier generation wherever feasible, like clock calculation in this
> case.
> 
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/Makefile          |   1 +
>  .../platform/qcom/iris/iris_platform_common.h      |   7 +
>  drivers/media/platform/qcom/iris/iris_vpu4x.c      | 369 +++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
>  4 files changed, 378 insertions(+)
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

