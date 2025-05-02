Return-Path: <linux-media+bounces-31593-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E5247AA743F
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 15:54:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E68A9C52F0
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 13:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C88AC255F55;
	Fri,  2 May 2025 13:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XFbdDlW2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C707A255236
	for <linux-media@vger.kernel.org>; Fri,  2 May 2025 13:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746194069; cv=none; b=t6nv88MK5xPPURwDcSVaotV7FBk40OcSXsfMsL7JQwthac4c7nmrhtSpyE6K8xhvXC1sx83Kb/IJdvE1rKPSfeucN5tRE9VCt9WTqyLHi0KTMzv+/sr3Ptci6Ncby5KVaWn6w9OxvAFoOzVWcsvgfvxg80TcBSfwUfXHNH7SgDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746194069; c=relaxed/simple;
	bh=SbYvC/lGbKbVig/CuUnTBRTVK/wus5dwp1Hyif8wsEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OCzW5tsDcJyXLxmO9ksmy0nMQnqAo0Ubq09h78KWXiwy62sYR1+zHrOUi7e76/qxyFLg/czhTkUQyM3g5syaT7abMG4epbq8FAmTozLBVtuwMbykTmZCoet/LaPWXgx0hqWJA52s/N2BUuEmfSIjhqfLYGV2f9eLTK2zC+M5NaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XFbdDlW2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542DB6xH016414
	for <linux-media@vger.kernel.org>; Fri, 2 May 2025 13:54:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yL9EoiyJnIJjcu+Ek4UoLm4TG9MKg3HqDNyWMAzlopo=; b=XFbdDlW2SNdvnijb
	SwJirOH4EhzEbnVzh94ePCGcYcLocIt6Blc4KWIkBqpseH7PBGBoHs8VBXDA2sdQ
	4AzG67qLT2mERYPYG8VYctHIJQ7ImJ5ir98vClgJ5sE7UB+jhbeVkQykxS1tBvXa
	56YGcBqASyd5fKM3AT4wbP3UsXKWApBFVdkbiiTcypeDZdrWlY/DB2EN3dGijGPJ
	qOW2In0WlOzw9IwwitrSlU4KSvkEzj3fuDRqG/evdbkATXC7IeIMko+3MYd6Kqb/
	d4qWpfjzy8ZVfUZmwAFwnZP5xQ0cu1xNeBXccBevlGhpCBoRpGiSk2bOhCM5VLuW
	ErD+aw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6uagcub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 02 May 2025 13:54:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5841ae28eso48295585a.1
        for <linux-media@vger.kernel.org>; Fri, 02 May 2025 06:54:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746194065; x=1746798865;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yL9EoiyJnIJjcu+Ek4UoLm4TG9MKg3HqDNyWMAzlopo=;
        b=e6hU68u4effrr9+irN4tJruRqP0/9HSUYAvj/8OMvPn943j5hwp3KNGARwiLezE4Ix
         0jX95f2atjNsNywKrlrOive9sa0YJZTc39YZ2NpUZjP3ZSXf0PX9fcL2MsZh0jYZ6Yeg
         c2g8Y4SorF3esU4HI7leCjrwN0P0cvawxmyksSc/l2lCVGxFQDdJO0alXRpFZ6aOi02b
         zDCDDNOVis/BZaMq3AUP/kTyDS7iXVPHWzo9ZPudBpEMm+CMIWAC0xIzHlz3a50dHNgR
         FO5aeULWBBW9uJMz8PqWfxEq/wdZ2vbzPzXfBt1iDqr1w/3rV8uPTD1n4SqQMWGuL3Dx
         smJg==
X-Forwarded-Encrypted: i=1; AJvYcCWuKXzZTv5ZbMfNzlPx2GH7V2fKV1v2Zqw7CU8kC1B7oEJwSr2aFpbTSO4xX9Ca9L0deMxENg5Sh1n1vg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgaQ27Zky+atLb1fzQ1CV+ig/ZBmqeYBvspKVu7/7FD0nV3gyQ
	08PeSo4mrpveI7sjH1Hggz19X7npA24DHTlipb5xNez2Vr05BsBVz2DeoxF12QkXUTnIvf84U6u
	SlBg2IMDp2wOrIzT0TJbMzWL5rzjfLhr8MKwlR1P/10OKP43dFQ2g6L8rzYIZ8g==
X-Gm-Gg: ASbGncvfRw+u3nZ9jYK3OjQg1dl+146M9fa+t8PJ03ah0DgYAKKAkuM8swD3ATIuGRV
	fmPtYXPYhtBOtiOWhh7Bive0kiEmhmxsqMgg0rGKPNXtEnKn865ivq5u1Bxb4qRLWsAjA1+RHA5
	E2StQNNV3yIv6ufXgXEFhx/hpyb/12eKJxz8qNWXGkxT/cMXU6YyyN5uP3PdWn50xBoqKFtCraG
	vQsoWd/gUz+/D0N519DrkgYK9NS062fnGGCimk057XKyiNDqve+u84s6n08byVmtzRW7OquRjwx
	zx6Y6JoTBSiREjFzvqpzSQUb87gW5vyTOaY485BNcYmKGAOi2mSfSwMq3tcrHtE5j8Y=
X-Received: by 2002:a05:620a:4447:b0:7c3:d752:f256 with SMTP id af79cd13be357-7cad5b4f0f8mr152976785a.7.1746194065717;
        Fri, 02 May 2025 06:54:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwqDIQDynRQ/WTGlGryiob37MpltRCrA//d1qVHrqR2ToFyr62qtJV46XmvMEp/ixzQsjp0w==
X-Received: by 2002:a05:620a:4447:b0:7c3:d752:f256 with SMTP id af79cd13be357-7cad5b4f0f8mr152974685a.7.1746194065289;
        Fri, 02 May 2025 06:54:25 -0700 (PDT)
Received: from [192.168.65.113] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa777c8b1dsm1262238a12.18.2025.05.02.06.54.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 06:54:23 -0700 (PDT)
Message-ID: <afd7c1c7-dade-4343-8e2f-1eea0e403c9c@oss.qualcomm.com>
Date: Fri, 2 May 2025 15:54:21 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/23] media: iris: Prevent HFI queue writes when core
 is in deinit state
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil
 <hverkuil@xs4all.nl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org,
        20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com,
        stable@vger.kernel.org
References: <20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com>
 <20250502-qcom-iris-hevc-vp9-v3-5-552158a10a7d@quicinc.com>
 <250cdec3-1437-4c45-aab1-0428218b9437@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <250cdec3-1437-4c45-aab1-0428218b9437@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BNizrEQG c=1 sm=1 tr=0 ts=6814ce93 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=AWkmbyHJa9485OIXA2sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDExMCBTYWx0ZWRfX1XEqsU1+lGID UHjf8dmS0HOBJFwYK9By8I/w7pKIWaC146L5wr9I4BEAxksrQJUEk078gceICELPo+4PwTsgzOJ s8kqUPO/KRRt6pE5pEotrQ0q/50zUE3xgEBaNeKEiqvW8PZCyNfIbMYOEhXUEoKrcw+AoLifnI4
 JZ+JRd2zVLRuoaB7n/yUydl1e8pGfHVeOsXL+s0biZqEk5mRKgb2GAf6vAbkQfOvYtgGu6RFw2O jiGbMzsgNWheoq+qnPDZnGabJ6YfKuMzUOtdiU87OUQALcTbTOUbDjh4jWOjNpi/f1kcJDidMu4 L9kb2vhuFU3EmbCf9vGbQyNDu+xCNTtJtkr/FFDW9Nrd9isYSTxKuChfJlpfqrP8U9GVD42nuxI
 gIy1iJRabh93rMdPGbZWTBf8HmzZhktKcsK28sesbuwTVqaGfZWypKiMqgg+5DDZQO+Mr8uE
X-Proofpoint-GUID: L7VN3l7FZtO5eECvUe1JcjKUaiB7_Do7
X-Proofpoint-ORIG-GUID: L7VN3l7FZtO5eECvUe1JcjKUaiB7_Do7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_02,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
 phishscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020110

On 5/2/25 2:22 PM, Bryan O'Donoghue wrote:
> On 01/05/2025 20:13, Dikshita Agarwal wrote:
>> -    if (core->state == IRIS_CORE_ERROR)
>> +    if (core->state == IRIS_CORE_ERROR || core->state == IRIS_CORE_DEINIT)
>>           return -EINVAL;
> 
> Instead of checking for 2/3 of the states why not just check for the 1/3 ?
> 
> enum iris_core_state {
>         IRIS_CORE_DEINIT,
>         IRIS_CORE_INIT,
>         IRIS_CORE_ERROR,
> };
> 
> if (core->state != IRIS_CORE_INIT)
>     return -EINVAL;
> 
> Cleaner and more explicit - declaring the state you must be in, as opposed to a list of states you should not be in.

Being explicit in state machines helps maintainability - if we get
e.g. IRIS_CORE_LIGHT_SLEEP down the line, this could easily fail

Konrad

