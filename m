Return-Path: <linux-media+bounces-48455-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A03BECAF60C
	for <lists+linux-media@lfdr.de>; Tue, 09 Dec 2025 10:02:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 825F6303B2A9
	for <lists+linux-media@lfdr.de>; Tue,  9 Dec 2025 09:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8D7429B8E0;
	Tue,  9 Dec 2025 09:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SjPiMIfq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P1iKUsVP"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D5228541A
	for <linux-media@vger.kernel.org>; Tue,  9 Dec 2025 09:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765270960; cv=none; b=IqC9yfIhWWmllvHBJu/dxjidE7e/QXhCC1jBiqTXutsx5NVvK5jO0xqCSZvFmFyeP2vJiUiNMnUhLxJAncOLp2Z42wb3BFjVW6i8h4D6UYaQh7kY6TD2gW1gFOxgY/Czwpl/dDdhLDWHNkNr1fq5dddacHgQI3HENay4rqQ7G+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765270960; c=relaxed/simple;
	bh=EtTv7vNEzQMUejWJsJu8WCawWuLh0PKnt37hkY8faZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bkFSXL9TIUGG59XegyCG8R8Q+oqHOgsGb7PkrWvq4m0eqZfBSN+uF5n0nY58/tiftCDUzgQOeItcLWdKqbYeEzmMZYx4HZPMlSqpDSt4Xn7h/2rK/EUo27ZMKQJP0hPKGKYRh+GC9pDdD3dlBjhxoIcsp3Kc/xVVUSBvwSxegqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SjPiMIfq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P1iKUsVP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B98w9AA3203558
	for <linux-media@vger.kernel.org>; Tue, 9 Dec 2025 09:02:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tjn5t+EqGVO41CN3VxibifbWGxwt18O6GEv39Vxr8zo=; b=SjPiMIfq/BEvEaca
	ecXb40cLK/160ttgpfBV6J6KO5sMjNy4ijd707tQ3K/zTYiCFca3N4jbQDBvFT5g
	RZAI2p/RYEXglsLeiRRVauF2NGfZkuGqy00Wj0HGPXFSIg5ci5BZ9wLDrV5PsWFz
	ZDcxY93xt5/Sw92CR4JCsaupEHrBBelIdThit6XJ3VW93MHG5In211tTlL6dWjzQ
	zlDaK5yepK9feoJ6Ro3iYJsnM0QlF7pzbZdySCav9N1wWJZCvVvJliImghWcNTIU
	d4G4b1SCRraaFJGWhEINz6a7vSCu/VjGE9V9Td38Unbk+wN7EpfDK164Mz+H44NM
	PypzZA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axgqpr0kb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 09 Dec 2025 09:02:37 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2956f09f382so35643275ad.1
        for <linux-media@vger.kernel.org>; Tue, 09 Dec 2025 01:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765270957; x=1765875757; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tjn5t+EqGVO41CN3VxibifbWGxwt18O6GEv39Vxr8zo=;
        b=P1iKUsVPMOd8sHGTn25o6bG5sg0hvOBqh9PJtgsBQZuAqatFXWdJJ7Ayzbwdh68yjJ
         JjYxGEdyfyXPrr72kkLgFhjDZ8C90uYSKWzHgxSM6e7bVvtbnPrTlATMZOuJS53W33AR
         TLOAS25TeLudMZu30CxJj9hM3tJCe31vXh6/In6mLx2MbT2OYcnliPjdBSmrZgez9SQh
         Lc+4HOdKwhAYDCNvGupZj96s2PJcHlLmquK8mI8yeeheymaECnP1SlSv5aB68yad3H8F
         r4qSJh9G6iPY/Q2kA02h7cQpaF1nKng8LGlgx1q9Hy6NNFPlT1rcDhWaZ3slpQb5NFRl
         KYIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765270957; x=1765875757;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tjn5t+EqGVO41CN3VxibifbWGxwt18O6GEv39Vxr8zo=;
        b=TBfw+ag4sLWn+z251plfkMKGOGijgTh8kOuj1FyBLYlR69UcB1ThSLqY1WUMKCXl+W
         AlLb97B1nM1tZkk+jh3frCRzyBvZabA2QqQJ8gKQGD4MG3Pr596jQNiTN84Yabxr3I/q
         Hg5INgPUK+3efVYo0aLdZpureSrkuKyA36n1yrfyZJ5Q9QUdHrpoysa1t2+6FvBL5m3Q
         dQrIYZr6+DJO+RQpZsbvJGD0V7bXpO8wknA79jCxkRDnu4jb6sBe4JxIIeU1RSCjYVQw
         oDzdjignDL7gXPQhm9U6unu7LFaXyRyy8YivRWAlscikqoLiIbGEcf0RLGSovzP+/wPq
         hw8w==
X-Forwarded-Encrypted: i=1; AJvYcCXmA3DS/j4SGR1fKNPUwPQs2RndEfl3M5N70waGFRqAHRXkw6dnCb+jlhV9pep/SEanNHEWgT+QTIWyog==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuMxCYUrSk5ELQRwgMzdNOUy+yFkV0IKQL+/9vurjRAHyHrf8y
	wCZfR15vpYNXMEAme1CJjbIJVlU9uQDFL2sVR15fteXf5pqU5i6rp2ZV4mMVGBRdN1ICCjPqK42
	FuLnSqGOW4NF2v7UpWaJhfEo8DVzsXn77AtRvqAiHAXRdd4J76iEHGtwQoMrMNcDVAw==
X-Gm-Gg: AY/fxX7jllpL2pR7ZmPnhpbf9B+z1ZG+jA7grBjrPlZTApKLHNyPkVecgEe0GsJ9O5Z
	Cnx0d6mu3B9xabNtR8dXuSFmA5+92gRVZpSGR+tQTxkVBckE7EuKy1bXXu6dS2eOgM9StgQ3+Xs
	ThmiLmS512NOfHhi2acHeoSPAzTG/EhSz2DHpXC6SbgT63KFJhQRtELYi6G03Ho9GP6+AN0lu+y
	WTz/+udXjzUuJuxqtx3J0/z/UrZ68C5RACClPPDc02JdLZjZ5OHcDDDpvvqGZfeKO0qbAqa/FIK
	q2rMqhIZTtP/wzk7EfYRcExOeDUctA1t4gYAUvhTSD5OfRBxdQdo+ZTOkt3uSJ4IWsaTHtSLBao
	DHrs5CPMP88Cdd0ZdvtPSbVRD2h2IoIpRwb0tFBeWLg==
X-Received: by 2002:a17:902:f78b:b0:295:55fc:67a0 with SMTP id d9443c01a7336-29ea02a9cb2mr8870725ad.2.1765270956824;
        Tue, 09 Dec 2025 01:02:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHkhI1GXHBiPquCji+ZgoLgAwuwKObWbNekX0HnKK5pPxwDFhYjZRIriYLSQ5ETb888EDm3lQ==
X-Received: by 2002:a17:902:f78b:b0:295:55fc:67a0 with SMTP id d9443c01a7336-29ea02a9cb2mr8870475ad.2.1765270956300;
        Tue, 09 Dec 2025 01:02:36 -0800 (PST)
Received: from [10.206.101.67] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29e2444f5a0sm69951955ad.33.2025.12.09.01.02.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 01:02:35 -0800 (PST)
Message-ID: <157a3960-0110-4026-8ef5-e3378c8db693@oss.qualcomm.com>
Date: Tue, 9 Dec 2025 14:32:29 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] media: iris: Introduce vpu ops for vpu4 with
 necessary hooks
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
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
References: <20251107-knp_video-v3-0-50c86cbb0eb8@oss.qualcomm.com>
 <X5BA5y9fXZEHaAaGjdczRxdqFLVPrIv37Drl75z21uc4100UvnYAoEHzwGGyLGVGIv5NBDnu_Mn8rM8gSxCyNw==@protonmail.internalid>
 <20251107-knp_video-v3-6-50c86cbb0eb8@oss.qualcomm.com>
 <5a5908db-aa96-4cfa-a908-d393dd2d79c0@kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <5a5908db-aa96-4cfa-a908-d393dd2d79c0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KMhXzVFo c=1 sm=1 tr=0 ts=6937e5ad cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=nqpN-pjiYS0InRIFTCgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: aft8PLce7iJ8GnWeY6Cu4YS8e9Jitvuk
X-Proofpoint-ORIG-GUID: aft8PLce7iJ8GnWeY6Cu4YS8e9Jitvuk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA2MyBTYWx0ZWRfX3aMVQjDJSBtc
 W49mtd30BdUvKor3mbT4qKq0nzMSSeDZRmN/dw91kiFYYtOB9AG3M/Ngs17kP2M98xj1LStZsxQ
 40dBIW7cgg0n/nbYGetOr+4iC31ZRBiklirckPbRej+IuHHPaNd8t+Kkp+dqZMrQVv/S0QJNedm
 wD5hXpvj9jXiQ7hd/OI1JbkRk4bR0CiFRdbWGn/gPCYVzopyLqh+w6sdek8X2tjyGmVcELw3Mgq
 eSyrVcosoCC7QQ2P+06MCHvlI6HUOVhR15hVgFYX4EkaXcL2YlcHgKQtiV5wa65lC9Jv1dUFuLp
 ipXY0xlgY8NoT3Pbe0TIuu6jC67sVUlU+KeUZFvHXrAn5h4KEYgYp/Vg1EKGtvfDm0PEvyBOF7e
 4vBvXe+T1zETp8JI4zWSDbNazI4psg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090063


On 12/7/2025 4:34 AM, Bryan O'Donoghue wrote:
> On 07/11/2025 09:49, Vikash Garodia wrote:
>> Add power sequence for vpu4 by reusing from previous generation wherever
>> possible. Hook up vpu4 op with vpu4 specific implemtation or resue from
>> earlier generation wherever feasible, like clock calculation in this
>> case.
>>
>> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
> 
>> +static void iris_vpu4x_power_off_hardware(struct iris_core *core)
>> +{
>> +    u32 efuse_value = readl(core->reg_base + WRAPPER_EFUSE_MONITOR);
>> +    bool handshake_done, handshake_busy;
>> +    u32 value, count = 0;
>> +
>> +    iris_vpu4x_genpd_set_hwmode(core, false, efuse_value);
>> +
>> +    if (!(efuse_value & DISABLE_VIDEO_APV_BIT))
>> +        iris_vpu4x_power_off_apv(core);
>> +
>> +    value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
>> +
>> +    if (!(value & CORE_PWR_ON))
>> +        goto disable_clocks_and_power;
>> +
>> +    value = readl(core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
>> +
>> +    if (value & CORE_CLK_HALT)
>> +        writel(0x0, core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
>> +
>> +    readl_poll_timeout(core->reg_base + VCODEC_SS_IDLE_STATUSN, value,
>> +               value & VPU_IDLE_BITS, 2000, 20000);
>> +
>> +    do {
>> +        writel(REQ_POWER_DOWN_PREP, core->reg_base + 
>> AON_WRAPPER_MVP_NOC_LPI_CONTROL);
>> +        usleep_range(10, 20);
>> +        value = readl(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS);
>> +
>> +        handshake_done = value & NOC_LPI_STATUS_DONE;
>> +        handshake_busy = value & (NOC_LPI_STATUS_DENY | 
>> NOC_LPI_STATUS_ACTIVE);
>> +
>> +        if (handshake_done || !handshake_busy)
>> +            break;
>> +
>> +        writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
>> +        usleep_range(10, 20);
>> +
>> +    } while (++count < 1000);
>> +
>> +    if (!handshake_done && handshake_busy)
>> +        dev_err(core->dev, "LPI handshake timeout\n");
>> +
>> +    writel(MVP_NOC_RESET_REQ_MASK, core->reg_base + 
>> AON_WRAPPER_MVP_NOC_RESET_REQ);
>> +    readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
>> +               value, value == MVP_NOC_RESET_REQ_MASK, 200, 2000);
> 
> I realise it replicates what we already have upstream but...
> 
> if (!handshake_done && etc) is true then how does it make sense to 
> continue on with the routine at all ?

Yes, LPI (low power..) is an optional "good to have" routine before 
resetting the NOC and powering down.

> 
> We would expect the poll_timeout to timeout .. ?

during good times, it would not, and when it times out, it is always 
good to force reset the NOC before the GDSCs/clocks are turned off.

> 
> If the documentation states loop 1000 times trying this then does it 
> also say continue to try to power things off if that 1000 retries fails ?

Thats correct.

> 
> I realise its a nit-pick but the logic seems a bit fluffy here. Could 
> you tidy it up ?
> 
> Also now that I look at it - vpu2 and vpu3 both trap the timeout and 
> jump to some kind of cleanup routine.
> 
> goto disable_power;
> 
> Why is that logic not being followed here ?
> 
>> +    writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_SYNCRST);
>> +    writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
>> +    readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
>> +               value, value == 0x0, 200, 2000);
> 
> Feels like there is little point in having a poll timeout if we throw 
> away a timeout result code..
> 
> Not sure why you're changing up the logic from previous versions ?
> 

Given the NOC reset/ack is recommended, even if LPI times out, we can 
move to disable_power i.e power off clocks/GDSCs, once NOC reset times out.

Regards,
Vikash

