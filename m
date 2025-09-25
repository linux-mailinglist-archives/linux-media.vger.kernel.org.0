Return-Path: <linux-media+bounces-43139-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6DCB9E360
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 11:10:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5611D383C92
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 09:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ECA92DE6FF;
	Thu, 25 Sep 2025 09:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pcpo4Dcm"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279C725A631
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 09:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758791421; cv=none; b=Pc9q2GzFBJE3ZRyzDaNa6QI7jLW/axeTotgUQV6QiBLMgEPkOeMXo+limo/OX9RMt7OAMCYg/7rb76pzlHfKU770uhXGj62r73LcLX5+y2GJue/3kcP6XN5knAOM4yFMViYyOHVwfDFdQ5Qhd11hf3GfHIZhLJhYcP83tDXAKyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758791421; c=relaxed/simple;
	bh=VaO3i7T1b7yOwRkFlMNKwsdMGDTOTdR9OM8uKc1xL/Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WZ1+uMgVCyZIR6Zem6EtFoBCvLaMNSxGArzu4Q/Xscv373pm3nBPcQxjRAxXCRIUzm+yZVMcN42QIZDkSRTUExYl/KnrRcF+VCp/SEr+bSRyW2Rx6BHXYyFnYOzDgIqKQkYgsLh7T0J3BjqUQDRgwL5yUCTBodvtmt7FuffF33I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pcpo4Dcm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ONr9Qu027915
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 09:10:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eYZzVW9nVW8KA6tqECyGN+RNlHNLZrOF+4bwFfwCiLE=; b=Pcpo4DcmW+oDY+r+
	rZDyKMfWtqOYmhDD+enL9K3uf+OTqlFyAXN/08CmPZ3ClsBOpmOvqZYc2iq9jzh+
	ZNZfVXyO3GFnzRhVce+wuD/Vi7/nu1KcCHDXjAU4+T+Mp2XXuEpf/CV+ajux7p3D
	/nQW/mMp7q7mXkLksJUAlDZncJak4r6Vf/neAeWxxctL6Jx6VRqBRgMGxgWTd4V7
	r8P2lldig94Y5NjiLSbYD6CxB49v2JzmeKngy8C9KKJD11te01a4oMGirqXLoir7
	8sWfk/7Zs8ZAcisVSWptv7S0ItJSbiOGBVD7kesJwCflFdYvGBABAZ0s3aKQHwzb
	D0F46w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmnyvnc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 09:10:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-853f011da26so28295785a.0
        for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 02:10:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758791412; x=1759396212;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eYZzVW9nVW8KA6tqECyGN+RNlHNLZrOF+4bwFfwCiLE=;
        b=dOk0HrdxyqP3NeaPHRROrE4MuwFPQd8rqAIh4zjo/hjprVtVfpm0jbw0US9pB0DmAv
         VHUGc3FzBNqReh82UtkhiKUiMoiLe5okC8q/kyluJYObx8cYuKu/y4WKveMeGJ0p27mY
         AFmONX1Gw/BITnavvjdTtS2hidGzUuCyy8CdpCePxXyOK0hXJkonlQaBIXQiuEKrUG8o
         eq7AdlOf8lXbMeEg0hC0BnoRG6gjl8zT7Wb/pQEM40t6POOuhAWcKjCNJrqME2re04q8
         7Ol6YKpI3n3FsZFXUqeY8yTes1ibnGPS9cEV70eHzVW1LYYgSLtFnXpDR6kCGCo0LNL/
         r2Gg==
X-Forwarded-Encrypted: i=1; AJvYcCU3PIYMmRoDcrRfwUfjZQPEF90NeWbz8YihYdBplzWxau5Jb0mrJd3mIP4R93ByaWWTiU5IgaMz8uB2HQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6wgzGUUPUgDgsbE5mr8gu2SFabTw9pAYRfzMYMM19ldRr4yz1
	5wfy3u0V/EeDCVgZ4tTX2KW+V++Oqe8I1nUCDQ0fuZEIX6lJKQrI5Sx5WI5BLCIV9eSsELmowT1
	cttRMJ+j3tPP4F8X6iPdLdfVhfcU8PVleJQ/I7xjarPl9plx+QWnwFk3o2r+EErNrjud+3AI8Sg
	==
X-Gm-Gg: ASbGncspzaJSrfRpjw51BC3OAPpWnzGHV2ADqjQ5vrQMOZaEbhpdCZ7kbycKHJPVZ11
	Fq+KQrLYaW95Pm9Wj0Nd0ut7LP8OA7yZ5VlPSQUnKWM7bVQGatnmfxLCm5iwGJUqMkP+sbOekGW
	kM80Ff/viw9ss5/ydfodtzXPTOGOWUeq2/se7BJ5GGq1dtcdsCxTGey/xEupu4KcAYKOPJAjLaB
	A2TQb9V4luL11O7kwU+npJIWyKJ0y8w9p11uITYyirykq3yq4a9gjWC8CoFDgS3k96hRr9cyqGI
	Hn6ydT4Wc4bpJhKz7wBSYN7of3/nCZNZDP4KYzTHmA8/voo+iRmdBzUBVHzYTmdi1kyX6svpaTH
	tjq5+ShuI2qKKxomxlaaiIw==
X-Received: by 2002:a05:620a:1a0f:b0:827:52b2:42be with SMTP id af79cd13be357-85adf5d2741mr246323485a.1.1758791412033;
        Thu, 25 Sep 2025 02:10:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGADNWi8FxPoW2rbFkEpU+q5ie6LXLacUuiyEXFSNUKEa5yYt7K4AF5EOvbsvCoObZuswbrig==
X-Received: by 2002:a05:620a:1a0f:b0:827:52b2:42be with SMTP id af79cd13be357-85adf5d2741mr246319685a.1.1758791411237;
        Thu, 25 Sep 2025 02:10:11 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353fa65a62sm126307366b.47.2025.09.25.02.10.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 02:10:10 -0700 (PDT)
Message-ID: <ab28a715-6b5e-4adc-8889-f47ee2e18d5c@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 11:10:08 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] media: iris: Move vpu register defines to common
 header file
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <quic_bvisredd@quicinc.com>
References: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
 <20250925-knp_video-v1-5-e323c0b3c0cd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250925-knp_video-v1-5-e323c0b3c0cd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d506fa cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=-FEiAWMsPlssRVfEe-4A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: dEfiAexFHNQOnFrU3CE7zZGTcR-4jXaW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfXyxevHRhfJQ/X
 q/lJFVvBeAZuVlwsAzU/ZHCeQXWY1eclKLqfZ1QGyiDd+9RUnr4wIjqXROnhcYPfp+bxoWS/jML
 Jm8/tVLYDu+KN85jmn4cS1z8mIV899FWy3pHIuDodkzIprsVfNrS9uTFKkhjJu7+2RrOrINjdMV
 fJ2MDNt6vWeHU8neQFkdY6W9o7k3l68mNF2i/1d4sxMx5k1BNnpD8wqtVV3rRYJbR3JVvJpfzXs
 kd2v0kLLuEK+cB5kCmazskHPdaGGo1D+NIZTv5syVm39v8G5DvG97u7PuUxvRP2OukXu1KbbNId
 lxHaHFrKA4FmJQ/eakfYZQIXLtIYPHcVCvGRWV/29q6iVvdJI+eWglbCdbbnunTMDFzL7kdDUnA
 KVk0i+GX
X-Proofpoint-GUID: dEfiAexFHNQOnFrU3CE7zZGTcR-4jXaW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000

On 9/25/25 1:14 AM, Vikash Garodia wrote:
> Some of vpu4 register defines are common with vpu3x. Move those into the
> common register defines header. This is done to reuse the defines for
> vpu4 in subsequent patch which enables the power sequence for vpu4.
> 
> Co-developed-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
> Signed-off-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 36 ----------------------
>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 23 --------------
>  .../platform/qcom/iris/iris_vpu_register_defines.h | 29 +++++++++++++++++

This is a slippery slope. I think it's better if you explicitly say
the header file contains the register map of VPU3 instead, as let's say
VPU5 may add a random register in the middle (pushing some existing ones
+0x4 down). Such changes are annoying to debug, and we've unfortunately
been there on Adreno..

Because you're using this for a single common function that is both acting
upon the same registers and performing the same operations on them across
VPU35 and VPU4, it's okay to de-static-ize the function from iris_vpu3.c and
refer to it from vpu4 ops, keeping the register map private to the former
file which I think will end up less error-prone for the future.

Konrad

