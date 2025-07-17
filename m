Return-Path: <linux-media+bounces-38014-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C832EB08D88
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 14:52:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 302DB7AFCFD
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 12:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8326C2D77E3;
	Thu, 17 Jul 2025 12:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mi2dJABB"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8272B292B58
	for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 12:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752756747; cv=none; b=MAiMaV7EItUT+jIjpSbxbvr/iT8wDLxx85h4gKIzbAPrXx3/j6NeqQchNcr75SrrYD0LAzihvY0vGzu4qe060nVOPUkORa72c/Tc+ppai2bWMjEi0Ju25TDTEuQb07XCblPveKJBBMgEh3qitXicbCcJ5xwr40AG1JgDHXod5Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752756747; c=relaxed/simple;
	bh=a67q9vRiltRTZHMR3Ms76FxNaY5qSMRH7L5XmrAljeY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BgYNf4+tPRxn5SMYHlDodfhmwsaOrIIsnyx0EwyQKTPpYsp0qyMeqVlJAB/7erpAUW+aipj3jiyI7ajuyX7d8tEORWl1SxQuaa6brXMwBT1BgPurSqXqgKoTDSXV643CNk6xEzLHCbPmh6I0CSnL4n6X4TabKL4iQNV7sNWzEaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mi2dJABB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HCpkSw007301
	for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 12:52:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5vBbIFMsukX9HGUnJnPR68gUMxT8rTJ0JNXNOwtyoPM=; b=mi2dJABBWnLK3AWI
	pxak5GCGoxNf2lp3htEsWycGZdDFYNlOMDHzJOE+V3JNWMcA0Bj6nnSRrnFBRl17
	4wPVmAdQXyzYpFu7xrxZzCLUcP69xntuF3Rd6eJ09QEuSwxW7oSy4z9TB2wrp1Rx
	+z5NtcS66gvu1+KucS7WaHehIaL3bqP7zwqceYejylvJ8V8OgGpA0l/yPTbPW9l7
	gTTKfPFyd2cIfEGgSh9MJSj5P7wJbG0orDqNF9HolwyjPyF+/thBTb8QYywN/vk8
	JHena3Rs7ZaVP+eU5Zu4kCaDI1nxDiCNaGQAaXvXVAD3l6AvhKXaBuA8RswDCmB8
	ztSrww==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wfca8vay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 12:52:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ab7406bfa1so1925501cf.3
        for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 05:52:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752756744; x=1753361544;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5vBbIFMsukX9HGUnJnPR68gUMxT8rTJ0JNXNOwtyoPM=;
        b=oCFk2zIecSMlLBsSQbyD4Ivcpv0FY2y1QZeq4M/zKqIBCkfxmlIO2Q6M4c/zWlWZFG
         m+LwAP6DTwsaY6otVFtdB7HTRTfvkjCWviH8Mri/6x2NLFkzXZk+n1VTqcPpDlMd3I3d
         90l1e+jb4swZeho2iOEWLe3UPBvBbxKnNp0CoeCvjt0Z7zkNG8cBBgRZhlGtXzUkVgZd
         hO70KRhyVsQ+CTfdJ02nU48fHr0EF9UMTcC+EYYnX1kYDgsQer7+uWDpKhxSOgrVPN0m
         4XYTyHeIonnvixawc9Id+pPtKiF6zz8roOhiyTmez25U40qj6sMW+gQuxQGg9+hXoBW3
         jDnw==
X-Forwarded-Encrypted: i=1; AJvYcCWxuE+p2r2oZjJ5twRJDOnqa0kI5kwCiUnhQiS1xLgb09nsCSClOlzdS0rR4w+Lsl/9zxp1hUBf9YbxGw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy28Bg2IlNkS3E426ItkslSWAo3Z34u8Br/6dhNvjb8TjqMPcur
	zJEcaZpAD4fvJlD2YWbItqJQh0rbYfPXFFUdN8SKQ51WSOQDWMcfti82cpxwY7cvg0L/gvcde/7
	nWlliES3RSeh+jXieSyMS+oa1O9V53WxQYvMoWCUldVaLTpF+Yq03qWUKQJvOVaUzzA==
X-Gm-Gg: ASbGncuyRCFyxUm88micqq1GXea/bju/7vmAvGif3w2US6G+oTA3hPCe9iG/VVzDs4S
	IGvXZ/EHSsmA7qfGECzAJmBhENOmzw/iZfXqQgoTLox+60vkvbN/HZx8HX+BI7PU6kQV/k9YRqf
	0OvYYOPnNwc/P1zVsJgqa56enecCxFn7arM8tbpbJIjdeXionDG4IgdDea2xrEGPFTufCmiNIVz
	H3tzMptI27ACeH1lIuKLWvOkLLoVsJCZe/7DNfkRFPFyJB9+pXT4bkdzwD/9tMAzP7cTk1OKg8G
	rWl83okOc21E/kQnV8AH+7d5HrdmA27oqn1aHb2LndciX0mKPvI3KoLIZsCXOvRAqp/Huod4757
	mjTlG0A+9DyjnuI/M7WHO
X-Received: by 2002:a05:622a:164b:b0:4a9:a2d2:5cd5 with SMTP id d75a77b69052e-4ab90a5b7c7mr43642461cf.6.1752756743593;
        Thu, 17 Jul 2025 05:52:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1GDc8kUpCOa+DP/D8Ogh1qBcyaDm+IZkeR2eLPatJQacP1EZjywXx5Ij/ieSAvtDStqwKug==
X-Received: by 2002:a05:622a:164b:b0:4a9:a2d2:5cd5 with SMTP id d75a77b69052e-4ab90a5b7c7mr43642321cf.6.1752756743170;
        Thu, 17 Jul 2025 05:52:23 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c976d9f7sm10021774a12.54.2025.07.17.05.52.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 05:52:22 -0700 (PDT)
Message-ID: <b16a5efd-21d8-4a59-b425-425800003c95@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 14:52:20 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] media: qcom: camss: Add link support for TPG
 common
To: Wenmeng Liu <quic_wenmliu@quicinc.com>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250717-lemans_tpg-v2-0-a2538659349c@quicinc.com>
 <20250717-lemans_tpg-v2-2-a2538659349c@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250717-lemans_tpg-v2-2-a2538659349c@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDExMyBTYWx0ZWRfXwRDP2/Smsbd7
 C3moiQ2Y2zaX9OIACPO0xrmYD4TMEqjdYMty/Z6efDefwvN20DaqepmMk0a2aHZC2ZBewlbn8vw
 7MWR2eYM2C+yY4r8WMSBTh5CdcX8BtdraRCZECRw5t5gPUZkse9SVC4X92KNBljPIBNZT6G+t93
 xX0tz0WKnAsv7lnkHFVn/mWfM/O8GHK1Tz4mOsaqRH2mre4uA36IIQDjPAm6czCJ/816Y7afsdj
 WMiymq5ITOEo8P99dlKFtmGPlVBxga2sz93QJgPVTwcuZ6hdU+M9yiugOLMD0a36IBSPY7M8jHg
 jtkEWFmiMlxJ2C4Yp1HqQs54tTJXIPVGScnyrZzEZv9K5sqlKAuQe2zSvHc0AuoTaDgVQC0i7zg
 42nNYv+NaBhqhzFxuQ3nUVfKOj8iuttLH1eN2uS6yu+kLDYrn2ZSY4Rzot9Iijv84mgqV7Is
X-Proofpoint-GUID: ZpHeDjBssqXQv0bLiK8Zv_2tmBs1HoRH
X-Authority-Analysis: v=2.4 cv=SeX3duRu c=1 sm=1 tr=0 ts=6878f208 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=ea1JrDabYO8hHO9gwP8A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ZpHeDjBssqXQv0bLiK8Zv_2tmBs1HoRH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-17_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170113

On 7/17/25 5:20 AM, Wenmeng Liu wrote:
> TPG is connected to the csid as an entity, the link
> needs to be adapted.
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---
>  drivers/media/platform/qcom/camss/camss-csid.c | 44 +++++++++++++++++-----
>  drivers/media/platform/qcom/camss/camss.c      | 52 ++++++++++++++++++++++++++
>  2 files changed, 87 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index 5284b5857368c37c202cd89dad6ae8042b637537..1ee4c4cc61cb32ce731dd8123522cc729d1ae3bb 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -1226,6 +1226,23 @@ void msm_csid_get_csid_id(struct media_entity *entity, u8 *id)
>  	*id = csid->id;
>  }
>  
> +/*
> + * csid_get_csiphy_tpg_lane_assign - Calculate lane assign by tpg lane num
> + * @num - tpg lane num
> + *
> + * Return lane assign
> + */
> +static u32 csid_get_csiphy_tpg_lane_assign(int num)
> +{
> +	u32 lane_assign = 0;
> +	int i;
> +
> +	for (i = (num - 1); i >= 0; i--)
> +		lane_assign |= i << (i * 4);

for (lane_idx = 0; lane_idx < lane_num: i++)
	u32_encode_bits(idx, 4 * idx)

should be equivalent and a little more comprehensible

although it would be nice to know where the 4 comes from (some register
bitwidth perhaps?)

Konrad

