Return-Path: <linux-media+bounces-43242-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 31952BA3716
	for <lists+linux-media@lfdr.de>; Fri, 26 Sep 2025 13:10:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8B69560343
	for <lists+linux-media@lfdr.de>; Fri, 26 Sep 2025 11:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D7DF2F5A06;
	Fri, 26 Sep 2025 11:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zu8WUCUc"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5922F532D
	for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 11:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758885025; cv=none; b=nH9apqX59lPqBoekKDUeTaloBps9MsafX6xOwgfIuVELxHq2YmPkHcX+MQKS2OIDmTfRV1hfiqN/9htfUMrmjTY50wgLCvQSu4CYHD2yCpym+XpS8MfAgKy9oAcfIRX/UbDdU+ajtRdFBggM6bNNraTdSirHb43lh+aIZM0S4Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758885025; c=relaxed/simple;
	bh=I4xoHL80G2ZfDuKa9HnNaBQgT5lrhctN5hpb7qk6ZIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qOMXu8sel5iw2GbtRoibafVKg0Vwt58r9ctMaX+7EorpIgw66t3bBmRLpdQu0J6ltnq9HgnX02Siu2dBjLL8Oo/6IDp06hOLiWnaiYzhE0KOrAmrM6/hYcZ/JO5HanNcKMkvQJjUG7XQs7d5H9hSqXMs7RYp2amei5jbpwxA6uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zu8WUCUc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q8vXl8020676
	for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 11:10:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v1ONDLRaCsNVpsb5LinjVBIw5qd7QNwulTLtR4csJkU=; b=Zu8WUCUcomq5CxTf
	Sv5MJsUmyuHqJhrnCxb4a1iqle1qCSh8eETGShuNFdPAemlTSL/xpDATRjwDZJMn
	SBJvy9BlMuxtdc4mqin81Zl6rKQKL4mt1nP5s2MjCgjtZNd+9ivaj5j52d04Ld9j
	flPxRZmBSrBWEGc5DGa2wCAz5wYHtA2DtaLPYkDdc9J5vzZ3l1VV6sSXzPJzNDX4
	gVHVqRng6xL2/RcEpXhOB8N5H1AtknAjbbjWKZBPMpdmyvwrcBBEkh7C+YOBwbCB
	oleBg6h4LEB6sVqon1QxuJl3yRFNTbzWZ2aODQXb3x+0Cj93gVVz5y670sxaQoYk
	dDi9Tg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0qtmfn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 11:10:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-85e23ce41bdso54484785a.3
        for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 04:10:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758885022; x=1759489822;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v1ONDLRaCsNVpsb5LinjVBIw5qd7QNwulTLtR4csJkU=;
        b=qAMu0M9DsBgsQPtkEfqimC2BnzQKd5XjzrbjQlYVaKpiqMxzfbPK/y5aGaCh3EJ+tg
         xUsMbqhBeLz/8/YiQ3UJrnJoufWFY0eLlsnQ0J+1CwW5V2Z0dCOlL13Zh0Q/a+B5i2sr
         HBM+ZW6a4cMN6Q+HgxaBa5TJHkWAhZLaoPom07a5YKVZ3GO2bR3dgviPtndV8kCkDbtt
         DL78+Zq10jQTQnVRbr91F9hwjwpufjEJTmbsCucDd+gKU62n2aXpt5jzmKXH8Z2HSg4U
         AkTsa/NKfcL+zxmiRHls/kWATpfFEcBN35IVd65Z/gxprOFv9NbmJzI5Vrcn80R7AS5P
         z2iQ==
X-Forwarded-Encrypted: i=1; AJvYcCXU50TEfJYm54cA3COki7EsfbHWla8zS/i283BcWINYS95rWDEP8Vh+cF1tZclNNidaqfoBEuUt4x/GqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyT9F9IyP6Zzq9qm0Mvt/AX82IYOtpp+UcJv+3Ex3e5Zs8/robr
	hISofh7reiXGxkwwR9fZgL/ozFhkRUkEJaHKCMVb5XcdEYxRwnMjjL+FAJaZnl354dxMKmr9HdT
	GLHmtf1DCsdLxgjHYZnamN8vUq8jabat9+b6s6dUZ6fr/4+RxbFdE2eNgkDGrm4Jtjg==
X-Gm-Gg: ASbGncvpSP3yTW2YffZ164Xq4l+HZB3Oi6yIlCxbWswSz0a9zm3SXqGX9OqeUo0+7A+
	j44GCNW7nFr7ioNzpG/t1/Nmka9c/n4k0WYHFoOu9fbak6ztaihiT2YTREcWRz/VSK7TDArCeNa
	/kDWq2Kd+yHMoGuh4avkMf2zlxCbdKLwfQ84p3b5f66+YP6++wh6GshdiXJ54e91qibwWzZkQte
	PcToAB/LDjwhYsotnzTjo0YcilWzLu6aE9/QlVLJcJO1b/nMmXgv1GgXWmcRm0Qrqab6nUk21v3
	0uNUzx/BEeFMLxhpbAbNqHqS3vzrb7l6j4XVmu/Sx0mk9CwTE2QpcYH1tgfWugpxMQxE3up1/AE
	9u/o2ibM/SNZ279RrhIjN9w==
X-Received: by 2002:a05:620a:2551:b0:851:b083:37e9 with SMTP id af79cd13be357-85ae26a5aa4mr562269085a.7.1758885022168;
        Fri, 26 Sep 2025 04:10:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFY4lzzL1WbSfFL3ieBfzZg7Jg97ceiWs/EAECWXTQao7o74NExuOjRcd/rgLZnQ9meP4ZhEA==
X-Received: by 2002:a05:620a:2551:b0:851:b083:37e9 with SMTP id af79cd13be357-85ae26a5aa4mr562265285a.7.1758885021683;
        Fri, 26 Sep 2025 04:10:21 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3545a98de2sm345622166b.96.2025.09.26.04.10.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 04:10:21 -0700 (PDT)
Message-ID: <f0f1e386-3860-46fc-bc5e-5a74e2175b7a@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 13:10:18 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: qrb2210-rb1: Add PM8008 node
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, dave.stevenson@raspberrypi.com,
        sakari.ailus@linux.intel.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org, conor+dt@kernel.org,
        robh@kernel.org, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250926073421.17408-1-loic.poulain@oss.qualcomm.com>
 <20250926073421.17408-3-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250926073421.17408-3-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 75uDuvMP_0_Dx6AnKwqFLC2jKA-xYwPG
X-Proofpoint-ORIG-GUID: 75uDuvMP_0_Dx6AnKwqFLC2jKA-xYwPG
X-Authority-Analysis: v=2.4 cv=api/yCZV c=1 sm=1 tr=0 ts=68d6749f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=pxQL0frbaL4a0zJdC2sA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX84lSOyi4p2XR
 faOQH/k4T/7BmhbyQfec5tI+88fSmtDPsLNcHg47qSnQzgkWZXtKyCkhS27JQm1Ti7D0JH/BkzM
 c6IgnmJbvytyeydQ8Y1nJI9IuedeS6NJQCeJtWq+sEQgdDYznpToTljS/ys7qSyAFAjJuO+SMnR
 7P3OsktYzz/KCWIpR2tIGBYEKgGrJansVmSVvnp0hESeb5VzlmQD6ackhWw5bEcHXtniJyIIlGR
 bTcUSQfP16eQwWWdjyoE1riNReFOzJRUvw7HKNNz6DPJp8X4bd/B2s9w6HSn2YPWSUC81cLG7Iu
 dhPcX54cXRtcl/z9fqOtLs5HrChkz64za9y3Di1cJbY02/WOSK9Oi6v4f9Q47TwUkPUvR5qn2C5
 bo4FagYBNsCCjSR8HKiLnRrvic/a1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_03,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On 9/26/25 9:34 AM, Loic Poulain wrote:
> The PM8008 device is a dedicated camera PMIC integrating all the necessary
> camera power management features.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

