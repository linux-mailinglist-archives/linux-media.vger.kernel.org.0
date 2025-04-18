Return-Path: <linux-media+bounces-30535-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 59295A93598
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 11:51:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D2243AA085
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 09:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C552F270EC8;
	Fri, 18 Apr 2025 09:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HwwhoVLE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C1B21ADAB
	for <linux-media@vger.kernel.org>; Fri, 18 Apr 2025 09:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744969887; cv=none; b=FhPKbCwIuGTPdlY/T31DjkTUqN+7k5feDZ5Rhu5z3ExAC+GlNid70zmOkTQTZ+bwISB+qizQJFkcRiToHIpAgFCuCmhAgVO1XDr0FbdLmF6SiN8Ca39Xx3/EwhxChRW17Gd1hmZC17ZS+0082bGRAyFreZN2YG7/COXiXor8toM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744969887; c=relaxed/simple;
	bh=LSv2LPESZn+oRo8x96FVTGHst4ynm5FV4i+s/CjsLEo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cmSptbM3jjrPZBHVhHhaf7Bw6brVBeKkwpNYzWzZZ7ON/BeKT3eBNu/w1NU0BW+jxyCzLLeUQWfz7shCo5AHfrc017UFNGJpI7uHFYNG4fWFFCOTXsHIKYJv/NpN535rN0jnDGd466cVD67cGoB1BAV2/COi94YGRFPuWVQhW8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HwwhoVLE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I2S6A2012576
	for <linux-media@vger.kernel.org>; Fri, 18 Apr 2025 09:51:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rA3sdyVQ16H8kPttRg91Jt1G7uDSj/gcw6eTTAKQB5c=; b=HwwhoVLEu9m/84c/
	izpixz+E1FYpZpSYEhwGskeFb8/7o9N2GWSo62T5C4Diwsr/dxEMUQzCUklx4rg3
	jnksSTFHQQo+UPXubMSkt914vvoRX317E3k/+WTh1V469h5y3QBBQnAkdMi6GALQ
	avc036Vf/bnYej3fUw8Wjkc2piUyI75EhILfq4XKjRJ1kvnJX4b2X3TSDsxj35Rh
	Du8dvHU4r+6wdK37romVDqsSMpbgUDAXLo9jGTg8owSAaAR4vjF/uLGi5N/EcC6d
	1wL6M8Vqyp6wKUJCN67m88CLdrSCHb+PDt7d163csMLgtI0ccEQy1OaV/d6cN6Bc
	vIiapw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf4vsrqp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 18 Apr 2025 09:51:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5ad42d6bcso40789485a.2
        for <linux-media@vger.kernel.org>; Fri, 18 Apr 2025 02:51:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744969882; x=1745574682;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rA3sdyVQ16H8kPttRg91Jt1G7uDSj/gcw6eTTAKQB5c=;
        b=P7PqeIQ1XRFoP/aUD2Mp6dOHz4jEzJCR+XMovdv6MADc1WfyQzD5UoKHLM41rSAnag
         JaeDog+iedLNiVem4qIw6PTNuMjH97b680QerQNKhYgaeHIMQcAn94hT4CJNA22bf7V2
         KaWcg19fSrdE7xMzdcLVfxb5WkzVxJQEH3J9q+9m5TaJxC2xt823pIRlhNKgDlgOM+8a
         /F56sGwKbeK1J6aGKc/5x7J3E+JYzXZTfZ+Lz5Fo5GCgPD3FcMGSPmKfLHPfZse5DAFh
         /9lIDABQCGg/STCTri+XFY5DCqYC1YJVVmuabzWBg01aoYiHs1LGPBx2at4Z1aAgIXmO
         yyIg==
X-Forwarded-Encrypted: i=1; AJvYcCVN/jIqeKjbtwfx35E308jq6i6jjPG2vpTlQB3vMVHCYr9+v2/u3gJreSu970pNXDGT3kH0Uyj4opVJsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzP+Y7rgowEkK9gHtWiiTI9LbOhXSHi3I9Dj9P2GI+fbY+OqeOH
	Nfdinv4NUOuCKcEML5QZyeiC4fq1phSV0yQ0NtlcJOoUQ8NRod2XaRmHn6uMvDCZAJsH8zQ6Fk3
	43JoiUhhw0Y7gk5DAeEIUcJsYktwGglGvkd5OH0QNLw/bdWcTdP34ExBZYnUcmQ==
X-Gm-Gg: ASbGncsLz69n+TXH6kNRvrlItIeN6NYYBqOB4upawDUXPwh8jUgNyjT8weFrPveu8aa
	hkkZMjgWIx295QkXEqQGXffFOMPDnKCN4hZnci0SAhLXKqZXo/3tKKaPyuf8DhQXMIFJjNSN73B
	Mk2Gzdyzskgv1PtXJzdCd5FpTf0E/bOTDsnUCOtQB+xzIcX12wkOruyJOBdpGMcniEF9WzD2szI
	J1amzg3Ccc6VBKcuiMMVxHequ7u6PejMWiCDcpge/UFmdIG3jSF3yooilWBz4Ly5azsJoH87sCE
	RlzScr1uOOU/J7Ug3EoVvEmWk1gNB9tCoNC2E5Adj23TQoUaEdmjey8PvOu0ofX1bA==
X-Received: by 2002:a05:620a:2592:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7c927f9a9f9mr101649285a.4.1744969882149;
        Fri, 18 Apr 2025 02:51:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqDwroTCof2h7lnX1zVhtLN5ZBbsfi9HNceZCvlYWCbV0282LNM0+SsV1JAE41A/dMk5vamA==
X-Received: by 2002:a05:620a:2592:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7c927f9a9f9mr101647585a.4.1744969881711;
        Fri, 18 Apr 2025 02:51:21 -0700 (PDT)
Received: from [192.168.65.58] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec0c64csm102377266b.13.2025.04.18.02.51.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 02:51:21 -0700 (PDT)
Message-ID: <5e6a3c7e-4e58-4e42-ac31-3666f49d07f6@oss.qualcomm.com>
Date: Fri, 18 Apr 2025 11:51:17 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: sa8775p: Add support for camss
To: Vikram Sharma <quic_vikramsa@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, rfoss@kernel.org,
        todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <quic_svankada@quicinc.com>
References: <20250210155605.575367-1-quic_vikramsa@quicinc.com>
 <20250210155605.575367-3-quic_vikramsa@quicinc.com>
 <65663927-cc11-4810-8714-7600786f299b@oss.qualcomm.com>
 <7fd92093-3efc-4f24-967d-7e267162b26d@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7fd92093-3efc-4f24-967d-7e267162b26d@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: WirIoJsv-WOeNjgrGJu73jt_mkBjQq5D
X-Authority-Analysis: v=2.4 cv=IZ6HWXqa c=1 sm=1 tr=0 ts=6802209b cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=-5tugLDAGQjhnTpWTo4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: WirIoJsv-WOeNjgrGJu73jt_mkBjQq5D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_02,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=986 mlxscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180072

On 4/18/25 9:28 AM, Vikram Sharma wrote:
> 
> On 4/14/2025 7:18 PM, Konrad Dybcio wrote:
>> On 2/10/25 4:56 PM, Vikram Sharma wrote:
>>> Add changes to support the camera subsystem on the SA8775P.
>>>
>>> Co-developed-by: Suresh Vankadara <quic_svankada@quicinc.com>
>>> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
>>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
>>> ---
>> [...]
>>
>>> +            interrupts = <GIC_SPI 565 IRQ_TYPE_EDGE_RISING>,
>>> +                     <GIC_SPI 564 IRQ_TYPE_EDGE_RISING>,
>>> +                     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
>>> +                     <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
>>> +                     <GIC_SPI 759 IRQ_TYPE_EDGE_RISING>,
>> 760> +                     <GIC_SPI 758 IRQ_TYPE_EDGE_RISING>,
> 
> Hi Konrad,
> 
> We cross checked internal documents to confirm IRQ number for csid_lite2/3 and vfe_lite2/3
> Calculation for IRQ number is done with respect to vector number as
> irq_num = (vector - 32).
> csid_lite2 vector -> 791
> csid_lite3 vector -> 790
> vfe_lite2  vector -> 793
> vfe_lite3  vector -> 792
> 
> thus irqs are as
> csid_lite2 -> 759
> csid_lite3 -> 758
> vfe_lite2  -> 761
> vfe_lite3  -> 760
> 
> Please let me know if this looks fine to you?

We had a similar issue with qcs8300 - the reported vector id skipped a
number at some point. In that case the SPI ports indices alongside
them were advised to be used. Please check with the HW team, but I
suppose this would be the case for this one too.

Konrad

