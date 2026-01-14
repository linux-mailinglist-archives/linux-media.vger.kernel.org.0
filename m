Return-Path: <linux-media+bounces-50663-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E21A8D1D98F
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 10:38:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D944F3025D9E
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 09:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4CF4389457;
	Wed, 14 Jan 2026 09:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZIR3aNnG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LYLEoJ6W"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00238387577
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 09:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768383481; cv=none; b=eax+SHPRx0L3DTZNq+M3n2bJL+avAVhQ5AXwpegOTQWGWoIDH1nNFgrNJI5PZuZrl9LH6+KocoKEPzGxtHmsYZJowsa6p2Bym3R/AwE7ect9jvIchfqSy+6Mx30StyXzXcQ60jKRAUf7nO48NwoGpOj8+tdm02WcexiiW3qvGzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768383481; c=relaxed/simple;
	bh=Q3JGsxGqTxa+quR/k2suvxodmwTgProYPmNagDneJYY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MMAvHJ9hTvfuTdPCpvXQtncL81khubixcDFBxrhJL6xM2Qi8HT5TR0jJyb4zWbY7wrbk9FJIlZ1kEkr15WSBliPgPRgVt7tyjyJvSK27ZwVk/ZCQTt+m041GJQpB8ymW29AQ/xmxasOU7CwYzPQssVUWKJGQ+lYoPU8DH35mTZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZIR3aNnG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LYLEoJ6W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E7jAEB2587358
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 09:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RhhbnWDSKAq3cY01bhquUpPCOlQ2BxpDupyc8QFMtqM=; b=ZIR3aNnGGldnQyYj
	UhaMs10N5GTIacsoOSvFIWOeLuRRwZ5lobaveKIaeJqCzbLnTbjlFbEnlU2937KW
	0YqvSPUNXI9VDRqIFskq+hODjYuz/Pg79uq6nLJae8XoAxJmyBo84agJAN+fZSEv
	Jg4J27UNoujc8JxEC0JkAOnJXhnBqMnXG5sGh0khnD5AUy6AEAnXFSJBpjJqpNxH
	IE8I5ccvOt4NcHW7BNECeGDM9cUwz8PEEKi6QL/X7ypTLNF6fVQNDpe1B72KbrQG
	ZDTojSWdrqhF3TEmt2bw/W+4FQb47Bm8usqHOPq/sWjccDAxe0Nvwx+LaqrHU0Xm
	U3uedQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnymsswgt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 09:37:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5014f383effso245171cf.3
        for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 01:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768383478; x=1768988278; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RhhbnWDSKAq3cY01bhquUpPCOlQ2BxpDupyc8QFMtqM=;
        b=LYLEoJ6W1Zga9eDRzkzQFVws0A0D89mZZb7FNR8UFvv03ZnQM4DhSuGyRFQJQGiReG
         389fy5MdYiFc794pzu/N2q5JJH8Ztlls+h9c/l1/5gL2jMJBHj/yG++3QhiWB81dVAg7
         qBJDs+tPdjfnvaO7t7aarHeV/orBTRGeHVoRtsx8A1xsDBVLEoa5eQ1sAYkEQvYIAlLY
         Llt/Yl1mP0eC1tf49iQ5/kcAHJekvS0CjlROIVNHvgKeU6bvmi8D43QszZqi2VG8zGtT
         /RqPmioXI55xpPKhnnvaPKIkOE1A3M0/QB+SY8x7YTBs8ZlIqsEl4/GyYdFbYD2xQKsk
         XuMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768383478; x=1768988278;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RhhbnWDSKAq3cY01bhquUpPCOlQ2BxpDupyc8QFMtqM=;
        b=ahpYNh22JSpTCbM4jXim8sHdwOrKx86Du8r9vOG5G65vB0Jsv/AmLt0yrb26WqqDma
         5veSVxgNJ3B62qrjlT62vT94jMGswvQk4zsQakUk4P+1qDe+jSrYQx2GUo4KD9btNqTR
         MGHyhKFx1vG6ZC12BYRaZ02+bDzhXVDU1KCMZw4VDwtNB8uWMXfBUUOiR/9s6OKi8fjg
         crhZ0ES1fD6kAVtDRw08MMGNdEByek1u+btUCfMN6jYrGcM7KeuEiLlnHkMA0nXRAAEd
         MOxI47v7/UaO76k+/Aj5ArG33dLx0r7A3Es5vqK0CPAtEmvl7pICnE8/LrCrdjZbJGpm
         oJtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZETyspI7I+rnDYpViGZ3RpwSL7lfIFndlafT33LFhsaIsV7vft0QouZjjR6033V4FMpvwyA6L6T/OCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0xGQmGPnSAFMeLX1jWvlSlXcC/zuZRlEUhSCbfms5ZBBm2h2m
	spNzRpMk5LYEQ1BHyNPjxy5HjMlLghyeWoZCzo1CZscyPFBuzNfJQQbT+NEmo8Dnc7thcmp2Yja
	Sdm0xC19ciJdaRIYAtqxjPYrrwdKGQ3Y5rK4OhkRJwF/xCISgSuwNOGUEkne6mX8xIw==
X-Gm-Gg: AY/fxX5RIh/McvZqRut7aEOaxlEL2cFKuoX8rZUsH4ENbE3QfhVtqBflRtP+xATYXQl
	bt1ZLB80XSgQk4LsaUsi6LGjsObOttPiHkGZbMDoLB+BZ/Y6j1W/yC1cLLaumlxh+ous7pQqTpF
	hKyDXQ5+3vFgkJP8p2nj3h8ZbMK3bWqM/Uwqy/BgrUIWNACteYNvweQzlOPdCgrG7Fzuv7Yq3Yd
	z/JLNiqLaGEZL9MubzciwZU07JFbwfohUk1McMuPCd32jSaAKOF8lAfESyRwqreI+/96hKDHklX
	j/Iozgak30k6UoshyiKHUsExdMLmzVgd3uk3IfcXMBpMZXkLcPtoCMS5GddUST/AXgS07bGUnzB
	G9aLW1XvjKAv5E+lIVBHhUE6flZs/lSqGba9izNiBo6vgNK+kfciNinF2YthqTAs0rto=
X-Received: by 2002:ac8:7d85:0:b0:4ff:b754:3a52 with SMTP id d75a77b69052e-5014816e52emr21627151cf.0.1768383478300;
        Wed, 14 Jan 2026 01:37:58 -0800 (PST)
X-Received: by 2002:ac8:7d85:0:b0:4ff:b754:3a52 with SMTP id d75a77b69052e-5014816e52emr21626971cf.0.1768383477873;
        Wed, 14 Jan 2026 01:37:57 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507b8c3f89sm22240499a12.5.2026.01.14.01.37.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 01:37:57 -0800 (PST)
Message-ID: <44d2ba08-e760-4f7d-bd87-6ef3a5415ebb@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 10:37:55 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/11] soc: qcom: ubwc: add helper to get min_acc
 length
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
 <20260113-iris-ubwc-v2-2-4346a6ef07a9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260113-iris-ubwc-v2-2-4346a6ef07a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA3OCBTYWx0ZWRfX7/Ihu5Xb3y+J
 AFVzZ8560duIX3VYsZ7CZC0nJzqAfP2t7Xf76IujVDsVE9tzT2Yj1vt4pqMqm8NfEEhhOdIL1j2
 G+EPt1BuFNvce1hjWJVShoD1krXPNxUaqToXxREXk6KwF0zgnf+DvC8ZJE1JrI48lg+HKSWQl4+
 /+snBCx4c+5I/nrent/RuZJlIV+F6P19zm7OIdxV1LH76ehOyg+WyeJh0FW71UeyQO6WHczfEO/
 offnQ23ABbwmI2YUwkRRvW6tqxUXJt6lK652MW9yBImwXEV11QZllGDQ/K7i94oB+FCdkUQ2MUz
 4kHJXRDZ19J1zFQEOSesYtMKfDC0pgigbX1X4nIF3RR3cj7MEJ0bJifFLuhOzNWQhSKRzpCNsvn
 yb18S5zTuqAeZ5kcDjNbX68PGekG5+LhnIpbEOQL95Lacdgc/hblyl5gXwAUvYuA/vgsU2ot1RK
 FXMd4yzkE+p8YW/pCug==
X-Proofpoint-GUID: ttGxHtu3rDVTrkvH41Klp1XPzLiwtw5r
X-Proofpoint-ORIG-GUID: ttGxHtu3rDVTrkvH41Klp1XPzLiwtw5r
X-Authority-Analysis: v=2.4 cv=RuDI7SmK c=1 sm=1 tr=0 ts=696763f7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=4J1ihs_Kgnsqm2W37X4A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140078

On 1/13/26 5:57 PM, Dmitry Baryshkov wrote:
> MDSS and GPU drivers use different approaches to get min_acc length.
> Add helper function that can be used by all the drivers.
> 
> The helper reflects our current best guess, it blindly copies the
> approach adopted by the MDSS drivers and it matches current values
> selected by the GPU driver.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


