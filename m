Return-Path: <linux-media+bounces-47370-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEB8C6F10F
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 14:55:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0FED7506233
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 13:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 068903612C2;
	Wed, 19 Nov 2025 13:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hFIhR5+Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i1n8AQaz"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B333612D4
	for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 13:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763558976; cv=none; b=c0mNTfUV9hvKF/IMBgHBSxF1XVPVXxF09aeL1D0Ln1EMzHNDvsfCdb/HDa+SYRmC5wjquaoYItL+eJv3f/1BthEvNvVTXHOR0zFH1mWP5NT3+sYWGWnRglGem8RF0Z/rniAGRwvrXkhqFKcAMIjwFTYDCnNNZ3msiJfuZF4FbZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763558976; c=relaxed/simple;
	bh=P5EFCLkeVjIC6Db2GqTKOtDPyJqdrP0m/jjUMLaPTxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nRwaKQZb/XWyGYOH/0TjJ8K94U05rO0EErWNWFV14JmB6qYFh+etkXMKZphsB3Q1e7nw9m272QF6nSuNdA2LYACENhZL4jxSBiRG2BUTm/gCyeJzssd0ARDu/lQBZhmYoWh40KZ6wl+MLlJVaHrhGw4tfnKH9jZPby8josvYY+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hFIhR5+Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i1n8AQaz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ7aAtr718609
	for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 13:29:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QGGdogWgWUImr0gsxTERgdARrL1T0foOXEeAjf5Gy4k=; b=hFIhR5+ZLQA0eZY6
	hfK8rCmhNC3dJnIcq/cGWW64yyvKOhawlXz5jh4MvQQ/Dt57jDBH/plsxlbMUlUE
	qHQFhY4EoqWGgZnUBCm3z5fdQC2GFW1XtaCwjfsO3ie1khQQl3QnXnqjqKX3jhCe
	ry+1ofwv8b38Yu3tkC8Hk/Dmt2/kU/nP4b/Qp2s8Ng1+BNyzyXF3tNiTAn3uOFgk
	RUXbhmBcRbJUjT0/b4m/JdrAR9AUP+ptjAuNIcWv6pJc1u1mmH6nw8lM4fWDQZ33
	7hbenEYV0qHQqJV3SQKVzfEKzBfoG//DkgOAYFq/oJ7PB1tkk5K7PTiT8sX3Rh+G
	612Nsw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah9n0s0vb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 13:29:33 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b9b9e8b0812so14309807a12.0
        for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 05:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763558973; x=1764163773; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QGGdogWgWUImr0gsxTERgdARrL1T0foOXEeAjf5Gy4k=;
        b=i1n8AQazbIjcDtydNFu6xJGk2epLydb3gDcZHElo4DcnJ2F3J5RFxatQRNEnZUtzkG
         JKtcSyFv2pujW0gqXIC1Lf3Lc1DXYHPaYuSBU8KkAsedbjy6f8mgLY4/ae38ALSrd39R
         jD0LR7UscSAj0eHakijHcR6l1wkoiUYIwt8hZAvL3rpFEDRlqQJC6dgy49FlXWR4PbBb
         byUCA6uBnT5iRyl/8yOTpsAU2ea/F9GRlyARHAReRWqqrPCq7Cs6W9bCowtKPzNU1CMj
         9NNSrztZpD5S9o1LDCa2of8zEEKZNu/dm/e0E+iaB1msiFBk1tHxoWFjnHYLgq8ZukWn
         lOFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763558973; x=1764163773;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QGGdogWgWUImr0gsxTERgdARrL1T0foOXEeAjf5Gy4k=;
        b=rQ4LoY0O1saNX0AQ9EiLKBJGASmlChfq0sgb+lUcjbc4Apo0VFV55dKejUw9DEgxXW
         Slpq0I13hCyuxfSu/2vcbvBchq5QA+FWRhbY+fYI9niWno33oibK+OoE2xgukKjIYc/I
         dzq3N56Ak/gmR8AVCn6fJk/ZHaZjjqZddo2ta0rGO+p/mRzFNa0exKwItEPYhIUQLRNk
         lcVmgqwNZvXSkpELmDPvNheL89QcoYiTrS883t5FkFPOtDTQCwGF8V7X9tf4shkZqEmT
         CezRU6KR1+zk1k5ZQ5kOKB3J/w6Nw24e9Qrbv4k+v6mXlwiBZfGp3vUDGJcfJ3qY3GvG
         +A0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWG+Qqdw7fqCpBDAoRDVpRRtlVdQFj7/L7OBodTL4w/z9HI0rBftS5j88YuXwnesgUYyYitStW1mtUOyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTHpVm1bNzd7avndqAGonR2DiXoccbcEoNxqlDiTfShMsk918F
	gVtg9CftewvOVDQd2u5W5k64kDxLRJFyG7EF1Rag5+CG7pjhSkOvsLx3qJY6A31Nax2dUz9tepp
	TmV1amUmmI3FOc/YurEINNv4TdAUcQDhLRQaXKkIeeXcqfRRPZOzvNI2blVk53qZnSg==
X-Gm-Gg: ASbGncuQLYZd/dpSzGF9lX2R9A4oNH288GwK0EP4sxbSR8hdErY4DxThdTvPhY5ptac
	EcAWfsG0i4TeUdhBCZzPjGBSU8a9NM+5op5CoumlRyaO4TTr9cdfm481nn0sbqHeRS000GZ0Oo7
	A/EGWb1iZG7Ed9LQ5JvSRfWGWBgadFFwnLedWXiU+qe733/yyOP6ORLZRg2ltLvuhlPxKOWf7If
	fBKO+12ZDqFGBtAfaLiivllPzuTLbUlQ+dGbc+pKlBqn8Ha8qUb2UJsRBiffTfSGiOnhA034Qc4
	iPo5nb242EbsfZxsrgR6rwXD9UaOaRHpMAJ5fNmrt6w9Qcfgpv+DU55YWoe8Pfw3Ct6FpC+1DRH
	Vt9j8SV0YsCUn5unyd50hJSxIBH73sjQCkEVLvDWb
X-Received: by 2002:a17:903:18b:b0:295:8c51:6505 with SMTP id d9443c01a7336-2986a741aaemr243774295ad.33.1763558973171;
        Wed, 19 Nov 2025 05:29:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVtsrHwgS9TdK2Xnym6543vqIpxNswUiEHoeYWVo4V8hSYs944J/eKrb2JYQw0iM9JjQMPMw==
X-Received: by 2002:a17:903:18b:b0:295:8c51:6505 with SMTP id d9443c01a7336-2986a741aaemr243773935ad.33.1763558972808;
        Wed, 19 Nov 2025 05:29:32 -0800 (PST)
Received: from [192.168.1.57] ([98.148.145.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c24229bsm208073505ad.30.2025.11.19.05.29.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 05:29:32 -0800 (PST)
Message-ID: <ce15589e-f389-43f4-a671-4f7bf3894f86@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 05:29:30 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] media: dt-bindings: Add CAMSS device for Kaanapali
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <37d0f89f-69be-45a7-90fa-347d6a3800bf@oss.qualcomm.com>
 <2d7ac7e8-ab69-44a6-b732-3657abf3a5a6@oss.qualcomm.com>
 <1f320bc6-ba7b-476a-b9fa-b5333f66530f@oss.qualcomm.com>
 <fa8ddb59-079a-41c8-b75d-c7a9d40e7da3@linaro.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <fa8ddb59-079a-41c8-b75d-c7a9d40e7da3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDEwNyBTYWx0ZWRfXwnht7U4Caogr
 xJrP2kUZavsmq5JSvD7DKvdRh2eulgMJiUkiulv+opIdHnwQrc5D796WJ0VycwabBCo9A7VwNEM
 9btPJjOH7UJOFwaPuzr2qTce3bYbxBhgAx3Nise0j92qcfqG/h4DVoSlK7kflFiciTh0a3QQcGD
 bpA3riUxJ8EZj2W4XMHYcIVk8YgoMjHDZDLeRD2VgDHVWayLJT1Ou1Ww9dWN2uD2dh02a6MOuOt
 XtAKMm8Vvvmw0pJV6FSSLLi1hXuVQsIMEBiJAfN0bkfbbRu8KHiVXcN3AGHwEvE+jht37cuXHne
 ojzu1DtRBu5BwOf0mFE+QtD3r7o7xpUgtk7s2C7H2SpHMnwDHZ3rr2fdqzfVw+l7xVaW8OR/2ac
 mOuCL+TUjECIinYcV2oZOu+DAqp65Q==
X-Proofpoint-GUID: OaoFRIDCY89qdhQggOb075kL7Hp-3Ons
X-Authority-Analysis: v=2.4 cv=QZlrf8bv c=1 sm=1 tr=0 ts=691dc63d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=BiHMn5M11h/vNwziJwzFrg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pKwLnlz3lkq_G46TUYIA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: OaoFRIDCY89qdhQggOb075kL7Hp-3Ons
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_04,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511190107


On 11/19/2025 1:21 AM, Bryan O'Donoghue wrote:
> On 18/11/2025 21:45, Vijay Kumar Tumati wrote:
>>>> Hi Bryan, HLOS does not have access to those registers. They are 
>>>> configured by the Hyp.
>>> If that's hyp, please add them. We already have platforms without
>>> Gunyah. Remember, bindings are defined once and for good and I wouldn't
>>> call it impossible that someone would want to run that configuration on
>>> Kaanapali some day
>>>
>>> Konrad
>>
>> Sure, if that's the standard. But even on systems without Gunyah 
>> (say, KVM/PKVM), these will not be configured from HLOS in the 
>> regular flow. It will be done from TZ.
>
> By the bootloader/s or by runtime TZ app ?
>
> ---
> bod

The proposed architecture is for it to be done by the TZ (Secure EL1).

Thanks,

Vijay.


