Return-Path: <linux-media+bounces-50503-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA87D16C28
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 07:02:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4ABC2302D5D5
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 06:01:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C49B130F924;
	Tue, 13 Jan 2026 06:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="faCJqzdj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KsJq8/q/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92BB187346
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 06:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768284089; cv=none; b=bKIXm1WibMqtIuRaGyFG/8Gm38wGKA721xjsvt9bvwvIYw672N5IWxbbshxPN+IBb5Qc0ZzhJXLI5pOWks5W2IxTOArkaXBq2hYh+hwMIrHbh2Vh4hwejYVim6UAW5ur4cH4qsPQMTL8PmmQ3GryvNQEteEeorwW4NQUhtoQT1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768284089; c=relaxed/simple;
	bh=ExFtf1dq3lSreIpntFmRGLkfTfR1R3Y1ehLQ2GfmSN0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DjZzBeX5eV41uhECsbnRbGtJWpSH9sIjJsCCI+fa0sAy0KYyoanRirqiF/v6ezO6M3GkTQzok03klf3ke79uXtAU0f3dH3ghszDR4tcMFGDsMG5PyLzvKnwVe77CXanEagk59koyqXWpBZ2S9Mj68Uv1PpSeN7+tXkEXfCUNw0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=faCJqzdj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KsJq8/q/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60CN4w8r3299726
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 06:01:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UE8MfK0gQU/+v4SfmTZbwuu2WaGJyuUhtz4oKoxzIJE=; b=faCJqzdjZysdhUgc
	zJHG/ANGupldsybM1PgJTYlZ8JBLmqKbNWfSrR2AEHcyIUaQyJWYOdqklLUbmO2f
	AYp0LrH5jpHBLIaAtUB0jGEvCX5I7Kfj910tupRTsnqRIIJZn31YwU3b9OA8/yn2
	4U8gTsBnBlMCLHDriRRzuPs+4a7KfepiRpw7k+BYLjcLlNDu5e839fbblT1+B1/+
	wfLQw1fxF5v1jGs2q11ezrWPQOVrG5T+gd8T0EQhO/XvBUZdA5/9Q51e4efeXpUY
	RpVSNWLHeRvROH+1G1WCs/yTFUU9GHq7lXEtaFA9kbl9GaQZZhQKItu2xYqTxXc8
	3ETpnQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn6jm9jhu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 06:01:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b24a25cff5so2308671385a.2
        for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 22:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768284086; x=1768888886; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UE8MfK0gQU/+v4SfmTZbwuu2WaGJyuUhtz4oKoxzIJE=;
        b=KsJq8/q/U/g+IQXkEDtrBGZu+YkqaZ7d0CT8BLfq+MHFeyVVdbiDYpSXni0W3iQcsn
         GBsIl//oEk1eWhoORZveUC599eNGvNTTF7fTdSBlDOoLzK+Q2P8dquZEJTlhvykTdadv
         JifnbPbILGskolRkxdHMI37vKEGH9PAxjvPHR27Fce18OXhcWpdEjP6sfa0uZGkDm2cp
         OB3XLfeZ3GFJLvuNgNT/7fbr/ETRBSa3Mb9ytIZuFvc3ym4cMbZj2U0rX7uC+u1NmU0E
         RximaozqyreOuE/ylZ7z5kNEvzYMZHlTnnWlCKyCjTI4BewmMqz6SXKzisfXqjRZN81d
         qE1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768284086; x=1768888886;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UE8MfK0gQU/+v4SfmTZbwuu2WaGJyuUhtz4oKoxzIJE=;
        b=PyiAmaoH5gvOT4Pu0WrP6WhqY9e5zKe02wZio4mKRmycwxf48m3c6ozu0gLDu3BJxu
         IKuPoVjuOF4ortO4sIcD0AYm3ihw4ueJreU+zWu3WAvekeCZVgv0ro3iLFzl/pZzYVx/
         Eq9Qf7fibHE4CfyY3/aqPduV93QLjSS6bHEHTVsdjxSBB47ku+9nShW2ZLuoz2t2TZLB
         iR1ywkVUjjXFJl8RfVGRYs+JESJwqPnjT4EZMi+g9xMO+O5Ei4Stp/GlVJi7y7mQZPUX
         EC1AEyyI3j+Xw5pFs798Il0khoKQJBeWxw5ic1U561WhMv4TLaMpStzNE/KlnumYARdx
         s4Cg==
X-Forwarded-Encrypted: i=1; AJvYcCX1Kp8PUv5mtzVd0AEZaFF6DJ9fr9PXOkeAvID0MS+ARE3JkF0+Ra/yWDNIxMLhww/LNQKjZ7nXJr4NeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKUvGxF1c1nLUw583yHdY1FWW1J9KW05P9Ofrg94HShfAJbrTU
	fR9PykKfs2iv2nfKlrOlcSB2505dbJOH6O6u9akXAgE/vR3oa4+omOo37KCAkwZb0R2VozcWoc0
	ppoe0zr1M63So26Ind0xr/H3imcjNdKDLVP/mMfEZCE0cevjwRRe+s8xzroHsmmjp0g==
X-Gm-Gg: AY/fxX5Ln591l9+7crr5J6ICRGfTAPX+mY2/idxpzu+SX13F4Cfswj3/Ql+ZvU9v17g
	UhCIeLPsQNHt2yemPVBJXx2BcVPA0Gi497y3qCGXjihcGwCDJ7/naFrsPe4kWdEyoCyiaL5DNzS
	797g+GQeBw4ms4R2syJzYm+KtsnilZOYZ94OwDBCJjb1b8UiUs3cUpcY8FeqrSj3iPsVhSiAsU2
	R2y2xSu30shdGARm59stKNakJ9sM9QfKWf5GiRdOtiIMcLTKNPMmigK14eocQhKKDS/ck+b1+jw
	9AMbsPwntb8xYL+JVbY/BbhqULiinbzVnSj6auUDDOIclUOYeLbgMWZmg78kKCFRsubW5L4fi9T
	xnOLm3NgWa1Np4dWzHhVKIG50Vc4S9YZnElkItj7yj2VgpsYiBksijjup0HJkwrGdI+ZbL7NX
X-Received: by 2002:a05:620a:2a0b:b0:8b3:eb4:720a with SMTP id af79cd13be357-8c3893a28dcmr2960772085a.38.1768284085952;
        Mon, 12 Jan 2026 22:01:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEyKSW6/UDtn6iXo+OfnG5T1IMbLQQ6Qo5k6ywT1sJoHyq2E0QCBHbEYFD0ECiXarD+FMZ4Qg==
X-Received: by 2002:a05:620a:2a0b:b0:8b3:eb4:720a with SMTP id af79cd13be357-8c3893a28dcmr2960767885a.38.1768284085362;
        Mon, 12 Jan 2026 22:01:25 -0800 (PST)
Received: from [10.38.241.242] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f51bf8csm1649498885a.28.2026.01.12.22.01.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 22:01:24 -0800 (PST)
Message-ID: <e93f95e7-59ec-405a-aa05-df78ad86be9b@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 14:01:20 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/3] media: qcom: camss: tpg: Add TPG support for
 multiple targets
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20251226-camss_tpg-v7-0-ccb536734805@oss.qualcomm.com>
 <20251226-camss_tpg-v7-3-ccb536734805@oss.qualcomm.com>
 <250743e3-66d8-4a39-a487-947ae1c831b8@linaro.org>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <250743e3-66d8-4a39-a487-947ae1c831b8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2ZKDSwAS1LyvZodHpcbCzFAHmSnfeiFN
X-Authority-Analysis: v=2.4 cv=SK1PlevH c=1 sm=1 tr=0 ts=6965dfb6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=yaJj5qA20OuGLx1VwxsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 2ZKDSwAS1LyvZodHpcbCzFAHmSnfeiFN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA0OCBTYWx0ZWRfX6qYVLonbioVR
 V2QMaCqEvhfVRChs3nAs7MBt8OoLkTjyJh6Lf4Ky93fHxUKW6RKNCxZCZfMSyg5xiumzNIbHRrN
 qFx0/hJuygtyh0nSTvpjnx02+KyJsg38SLHF2WzPjhX0ZbMZz1JAgqjA6xg3J8QZWu1rNBpHl/x
 HMpo/T5M1KifyEv141uW5bLfRLoigG8VVtyEjNg7DYuGnuXcFrXkQvhD1hmS5K+fHVZVxE6NPds
 QDFEwWal+efJJXz30vEbubCijNbXbPU8ESggcK78bKQMzWkpVc5zfppziHCaGU9FVN+ufkt9bK3
 n3KE+5YT1QiM4Fp3x/d6nqR2QS8siY4y6Nxy+62fMS9rUyzCxTAcpLOiDCVVaCZDViKFBQ/4Q4j
 jfJuijJVw/HsMNmrIeYsO8wCrAQjz824pwQNmFUH2XRxrndXX/EjERZ0iDubFrziZAR1SgZriXY
 CA8jASugPIPGez08Puw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130048



On 1/12/2026 11:43 PM, Bryan O'Donoghue wrote:
> On 26/12/2025 09:19, Wenmeng Liu wrote:
>> Add support for TPG found on LeMans, Monaco, Hamoa.
>>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/camss/Makefile         |   1 +
>>   drivers/media/platform/qcom/camss/camss-csid-680.c |  16 ++
>>   .../media/platform/qcom/camss/camss-csid-gen3.c    |  16 ++
>>   drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 257 +++++++++++ 
>> ++++++++++
>>   drivers/media/platform/qcom/camss/camss.c          | 128 ++++++++++
>>   5 files changed, 418 insertions(+)
> This is causing a regression on Hamoa.
> 
> Did you check the camera itself still streams ? For me, camera streaming 
> breaks when this patch is applied.
> 
> Please look into this.
> 
> ➞  git bisect good
>                  [git:60c1b50b1f2f5] ✖
> 9d1d90cca34ca66617ade951d42c94d5f086717f is the first bad commit
> commit 9d1d90cca34ca66617ade951d42c94d5f086717f
> Author: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> Date:   Fri Dec 26 17:19:12 2025 +0800
> 
>      media: qcom: camss: tpg: Add TPG support for multiple targets
> 
>      Add support for TPG found on LeMans, Monaco, Hamoa.
> 
>      Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>      Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
> 
>   drivers/media/platform/qcom/camss/Makefile          |   1 +
>   drivers/media/platform/qcom/camss/camss-csid-680.c  |  16 ++++++++
>   drivers/media/platform/qcom/camss/camss-csid-gen3.c |  16 ++++++++
>   drivers/media/platform/qcom/camss/camss-tpg-gen1.c  | 257 ++++++++++++ 
> ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
> +++++++++++++++++++++++++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss.c           | 128 ++++++++++++ 
> ++++++++++++++++++++++++++++++++++++++++++++++++++
>   5 files changed, 418 insertions(+)
>   create mode 100644 drivers/media/platform/qcom/camss/camss-tpg-gen1.c
> 
> ➞  git bisect log
>                  [git:60c1b50b1f2f5] ✖
> git bisect start
> # status: waiting for both good and bad commits
> # bad: [2ae8c3645005e9115f39e8aa61dea9ea48cc356e] media: qcom: camss: 
> add support for SM6150 camss
> 
> git bisect bad 2ae8c3645005e9115f39e8aa61dea9ea48cc356e
> # status: waiting for good commit(s), bad commit known
> # good: [f89c11002f67740aaed818137d513d6c3dbc348a] dt-bindings: media: 
> qcom,x1e80100-camss: Add missing regs, clocks, iommus
> 
> git bisect good f89c11002f67740aaed818137d513d6c3dbc348a
> # good: [18f74c5866cb470123eb0b39cf3248a09fab3ef9] media: qcom: camss: 
> Add common TPG support
> 
> git bisect good 18f74c5866cb470123eb0b39cf3248a09fab3ef9
> # bad: [9aaf62e09bb1bb17c186addc49984343623df50e] media: qcom: camss: 
> csid-340: Fix unused variables
> 
> git bisect bad 9aaf62e09bb1bb17c186addc49984343623df50e
> # bad: [9d1d90cca34ca66617ade951d42c94d5f086717f] media: qcom: camss: 
> tpg: Add TPG support for multiple targets
> 
> git bisect bad 9d1d90cca34ca66617ade951d42c94d5f086717f
> # good: [60c1b50b1f2f5466c07aeb4148df25227b5f6d55] media: qcom: camss: 
> Add link support for TPG
> 
> git bisect good 60c1b50b1f2f5466c07aeb4148df25227b5f6d55
> # first bad commit: [9d1d90cca34ca66617ade951d42c94d5f086717f] media: 
> qcom: camss: tpg: Add TPG support for multiple targets
> 
> ---
> bod

The actual result of CSI2_RX_CFG0_TPG_NUM_SEL | CSI2_RX_CFG0_TPG_NUM_EN 
is 28 | 27 = 31, which is just an integer rather than a mask.

Sorry for lack this error code fix. will fix it in next version.

Thanks,
Wenmeng




