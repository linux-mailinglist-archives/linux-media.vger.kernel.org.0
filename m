Return-Path: <linux-media+bounces-43451-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 062EEBAF985
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 10:24:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFD253C704B
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 08:24:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45F9C280024;
	Wed,  1 Oct 2025 08:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kk20w8N/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC6E23ABB0
	for <linux-media@vger.kernel.org>; Wed,  1 Oct 2025 08:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759307052; cv=none; b=CMOHtoUbOAnBfXMeJ601FuCRtPVrOXvcuO8kQp2/XqGntCWJuef71OXkUr0sZfJc/mKoVRklbhpu3r+CXjbu6RytapcHHC22W0xGFnoIaVB4N8vAWoe0fAY3fxgVvknX5Rp821FPskBGRsSUfdVhlWAqdIGW0svfOoYHHlzaCSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759307052; c=relaxed/simple;
	bh=+clJ7vL0rYP0PU+9eKAOYozUc2CoLqMkOXgjFChnTaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b/JhZQ8wqlB5nYX9EF7uwSzdpZ5t2T3aig/rC0H5LfzzKZ9KKwOaEB/Ia5NjYD4BDGDH12TeDsrEkosDr0xQla86T23Pumi9Y1qBBPvkEfWkfMBg4sLh42AVCEh3wxFO+OujeJLPlSXhUVnSS/HaOm0a/Vu3iPZi6PuVWOvE5ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kk20w8N/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5917mUkR017821
	for <linux-media@vger.kernel.org>; Wed, 1 Oct 2025 08:24:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9WeCZ8nODB+BE/0tMdVsmrnabswaxwFpBtLmdZ7Nur8=; b=kk20w8N/ftOiMHI2
	s+24PDgXUvUrdO5LF8zHRs4jQ0x056L8LAAkKL/4ZGuyiwdAs159BmPNicI4XeMi
	XAIhFiyB7/BnztmcA4VPvtJTOBZcTf7fj/uggYzAeEq9X9DH4kOiAL1lZxcm6rlD
	szhxRyyNqc27ixyGE1LqzORtIrnWYcRNxj+4aKzWLadRgOqMYhnxiFclIvNOXbEZ
	E3Rlv9QWvcmJk8WNzIlqIxOZhxju0YlRgfmSqCe/JRvIWjJoZCeMtY+9+tQ+cBqg
	iyXG/5l8Q7ADiUcfVxpmTIQGXEuuOlTFFjieVVXPi2WKdY8dPMZFm6hf4Vv9TjEJ
	QWHunQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e80tv1gu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 01 Oct 2025 08:24:09 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-76e2eb787f2so5774690b3a.3
        for <linux-media@vger.kernel.org>; Wed, 01 Oct 2025 01:24:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759307048; x=1759911848;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9WeCZ8nODB+BE/0tMdVsmrnabswaxwFpBtLmdZ7Nur8=;
        b=emLu3F+LPFVm1pvNCjFmIZeFlAgINbkS0a2Bs2hZrfvtIgOWSB+pkdHvAGIABukjEO
         Adf1TT5WS4CvuXPV+/CrwKWZ+8OHAJdrgqVi0SrmQueD6PEZBYOsQ8P1MQdfxvra25Mq
         23sb9NsywDH2zThat9A7hCXe/HdBg1aFvmuUrX4VW/ihhzZMqDmzsbgcxFQ/Pk/sqO6q
         qw0YUw2JmA2gOPqa9wu5UVVQ89NIzkFN5+71v+4yDEx5ENQkbzcM81iEGDaNL9WIGgl/
         i05oPGV3234pEBaDgYg2Cr7hch2kzwwsntudo9IDqgq8KrZuGXwIxOgHiwKTuujl65Lo
         MdZQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1bSNgJOu4Khglby2A67sYLpcvy/fHx8K3PiUscqHePIgry0C6m2tufd64UNhEhJywYUmJJcIkYohfkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxePWPKPnXOj8nF7xl2mkfPfn2ngNy6S0kjJLYNO9QeXyfR5wbT
	j2b/jEdisw7xUjG7Wc/763Qmi+1MCN9o++DBf8JKBJUfV7IS/AQOQSNXQAAmznsmJtfn+Z+lrhe
	JfQSx4luimOdGTn2e93f7hnbtxMxMjDfEWSQEKXIDocybO+Qk5HrcJ6QSkFz4wCsLeg==
X-Gm-Gg: ASbGncsQgvexGHpVti5IN2gBj9/zr3o1X0BYDDYhjRQxlTq+Zca7GCd731s14COy6ys
	oPiTYEBu/nMwTC9dWIBwUvNL7bncu+jfI8Nh9oQp3rH8+IkFkTAuXuxaMnXcCA1FVYy6zzk/FoV
	cAkUnXEkFj6O6lWytEX/yyaeZURLDgc8cR+JOnsqBghbISJOprRmu/RlLRw4sD5Rj7iAWJVkuYf
	9EshnQM+SLpu8DnH+TWJ10/ktiSfJOGnwOaecn1DQgM9JZ3SBTcm4m2jTNuTgWGUDJERJs939Yf
	YPsQ0LpFbIk68u2e5Ci4nrw9A4ARkRsAT+bG6pS+TP1W0mmVRoL+eF95RL7+HuOkQEJ2NFU+LvR
	nVao=
X-Received: by 2002:a05:6a00:a28:b0:772:2e00:831f with SMTP id d2e1a72fcca58-78af3fe8acamr3172148b3a.4.1759307047763;
        Wed, 01 Oct 2025 01:24:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+1vDkQo6+qHms4dPxWVBLyluPAupo+qgWQXu4cRIxAyzzN0qF87jp7WdFFUlrd4ofL8WQKw==
X-Received: by 2002:a05:6a00:a28:b0:772:2e00:831f with SMTP id d2e1a72fcca58-78af3fe8acamr3172120b3a.4.1759307047252;
        Wed, 01 Oct 2025 01:24:07 -0700 (PDT)
Received: from [10.0.0.86] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102c06981sm15689317b3a.72.2025.10.01.01.24.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 01:24:06 -0700 (PDT)
Message-ID: <63f593cd-9b57-0e23-e8ac-54f160cd5ed1@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 13:54:02 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] media: iris: Add support for QC08C format for decoder
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250919-video-iris-ubwc-enable-v1-0-000d11edafd8@oss.qualcomm.com>
 <20250919-video-iris-ubwc-enable-v1-1-000d11edafd8@oss.qualcomm.com>
 <d2qkd3k7pv7cv3rf76nf3wxedqagg7egz7q2vipiddxzbac5oj@rva7gymbaof7>
 <81932285-b007-7cdf-a28d-21131a26eb85@oss.qualcomm.com>
 <n67nom6bo2hskdn5k2bhbbhna2ew3viccsvvxqddzkbhmr6xfb@sn5abn2vto3z>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <n67nom6bo2hskdn5k2bhbbhna2ew3viccsvvxqddzkbhmr6xfb@sn5abn2vto3z>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyOSBTYWx0ZWRfX2gU6sCXyzysv
 gSF+cHxj0n+2IeO9eLrP/vNwQxs2fXHNeQYOn3m96XRxmgOcJZG8fk8ASTF/FxgfHRyaOqAS+2A
 5EdEND4TANo8E4pCPZr+KTtkXxSvXK/c+/rAC3BxP00MpAh8T1coi0QW/EZEUvgQ8vo4/rsbr7s
 aw3DWG1uFE2pX0d+7nTm9SNBpzOkYsaqf8VtiaqRBtJguG3TKHU665RSkoi31eyO1yZyYD+JFIm
 8O15gfZk7yFuEQ4MGci9XSrXXYmHRicGESVOVGd+BNlSmIW3Mk2a8C+dTRI128ZZ6lNA4Y7/twE
 1kHSqMR53DF50aVOFtDH14VS09kRkglEjjbZVR2jE0SJNC9K3yZHFjdsUHxsR0EZitC6nHi6yqg
 mVg+74GUf6r6264Sp0hyALQmNL37nQ==
X-Proofpoint-GUID: vG9oMww4TnFTm-SQLLF2CAb6xPYsyMsI
X-Authority-Analysis: v=2.4 cv=OMkqHCaB c=1 sm=1 tr=0 ts=68dce529 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=M6TxIu9XhMF2Uok1x6sA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: vG9oMww4TnFTm-SQLLF2CAb6xPYsyMsI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270029



On 9/24/2025 9:53 PM, Dmitry Baryshkov wrote:
> On Wed, Sep 24, 2025 at 04:24:07PM +0530, Dikshita Agarwal wrote:
>>
>>
>> On 9/19/2025 10:24 PM, Dmitry Baryshkov wrote:
>>> On Fri, Sep 19, 2025 at 09:17:16PM +0530, Dikshita Agarwal wrote:
>>>> Introduce handling for the QC08C format in the decoder.
>>>> Update format checks and configuration to enable decoding of QC08C
>>>> streams.
>>>
>>> What is QC08C? Is it supported on all devices?
>>
>> It's qualcomm specific compressed format, it's defined here
>> https://elixir.bootlin.com/linux/v6.17-rc2/source/include/uapi/linux/videodev2.h#L820
>>
>> And Yes, it's supported on all Qualcomm devices supported by iris driver.
> 
> Is it going to be supported by all platforms that are going to be
> migrated from Venus to Iris?

Yes, for all hardware which supports UBWC.

> 
> Is it just NV12 + UBWC or something else?

Yes it's NV12 + UBWC compression.

> 
>>
>>>
>>>>
>>>> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>>>> ---
>>>>  drivers/media/platform/qcom/iris/iris_buffer.c     |  5 +-
>>>>  .../platform/qcom/iris/iris_hfi_gen1_command.c     | 12 +++--
>>>>  .../platform/qcom/iris/iris_hfi_gen2_command.c     | 18 ++++++-
>>>>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
>>>>  drivers/media/platform/qcom/iris/iris_instance.h   |  7 ++-
>>>>  .../media/platform/qcom/iris/iris_platform_gen2.c  |  1 +
>>>>  drivers/media/platform/qcom/iris/iris_utils.c      |  3 +-
>>>>  drivers/media/platform/qcom/iris/iris_vdec.c       | 61 ++++++++++++++++++----
>>>>  8 files changed, 89 insertions(+), 19 deletions(-)
>>>>
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
>>>> index 5982d7adefeab80905478b32cddba7bd4651a691..11134f75c26dd1f6c92ba72fbf4e56e41a72de64 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_instance.h
>>>> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
>>>> @@ -15,12 +15,17 @@
>>>>  #define DEFAULT_WIDTH 320
>>>>  #define DEFAULT_HEIGHT 240
>>>>  
>>>> -enum iris_fmt_type {
>>>> +enum iris_fmt_type_out {
>>>>  	IRIS_FMT_H264,
>>>>  	IRIS_FMT_HEVC,
>>>>  	IRIS_FMT_VP9,
>>>>  };
>>>>  
>>>> +enum iris_fmt_type_cap {
>>>> +	IRIS_FMT_NV12,
>>>> +	IRIS_FMT_UBWC,
>>>
>>> UBWC is not a format on its own, it's a modifier of the format. Please
>>> come up with a better naming.
>>
>> Sure, will rename this to IRIS_FMT_QC08C inline with v4l2 definition.
> 
> Ack.
> 
> 

