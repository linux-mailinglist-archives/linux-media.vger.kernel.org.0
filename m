Return-Path: <linux-media+bounces-48008-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAF4C9A558
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 07:35:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D9EA3A4CB3
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 06:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A958B301485;
	Tue,  2 Dec 2025 06:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PLi/7kpn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EXI6dz8j"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8376D21D3CC
	for <linux-media@vger.kernel.org>; Tue,  2 Dec 2025 06:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764657325; cv=none; b=rBFIJReZO8EK9QzAh7KK3qn3uQljmPyopDgMIr2e6wfgIjT0skqkC/vlVsKjbd5tqTFk4conM8uZpa7RIg2jIwGEH9EIXD5Q4rLgShKyuZPUrzYYIvM8zBn2C3dN0B43XoZVQlSfKGDMZQqsfpDH467a9OxlW6Zh6LKkuYkMnUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764657325; c=relaxed/simple;
	bh=ankNTt4neXOcPc9gnzhoIk3xndCsYDDRUnulh5w1llo=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=QTZ5gleDPlJPZSJlADrofi9/yGF0rzUUqlqh6ZnAl4mpBAzU0meryupUksUkrjRDcyQln58TILWa/GHU2mN8OD29ObZK9MoVrvfYmw8rago1BgGM79rVlUbrOG1cD8vk4cL+K2E5CRYxa1uCTRyeFQME+JsCRSu2nbEvhCEVaKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PLi/7kpn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EXI6dz8j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1KAS1d1741933
	for <linux-media@vger.kernel.org>; Tue, 2 Dec 2025 06:35:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9taXAkv/HCL/GxtpivIx6rAO9Nhr3mG7qvCltfnBsLI=; b=PLi/7kpnj6cxlxWh
	d69wX/letR+dM/SQStD2vN0OwL8jbiDb76f0vDb72vnHcLVZJGeTXzSxgsmNGmmM
	4Qq/0kjWMFxV3sX6/rHlszao5qdn6qB53SX4ErKnbFshTbHeyQ1lqJCC4twhCNyO
	reIKCXklho4Sf1yLMhArCLGBrTc3nWfJxuWIQZaVgXjYF2oDvZlGrY4BPdU6D5O4
	aOfS8zfts0X3EVhErVjlUK01zhS8vIHwUaStNP1Cd3T8bsc7J0+zjjvoV5itHGak
	TK3nOWJW6xEjzqFZghd9ybOGwtd4nNFnjAqXA7Ydw0ZWp0tBLC7lfMGukkAFCYcT
	RDjXuQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ashtksk3v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 02 Dec 2025 06:35:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29557f43d56so56631355ad.3
        for <linux-media@vger.kernel.org>; Mon, 01 Dec 2025 22:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764657320; x=1765262120; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9taXAkv/HCL/GxtpivIx6rAO9Nhr3mG7qvCltfnBsLI=;
        b=EXI6dz8jD5rkAnpKE0pl9HrnifT4PUK/RKN+U2Ti/gqUs9QAw6wlEneSrOmo7Vb1ds
         AY0frn6l1IScak78iMoC8GBdpvQSv8awEO0onw0JYGEkvn5eUze6JckOzDKuwBaUJDxA
         B4gQ19F5xGgCdjdUZDjiTHPluFu1ckFKnxPvk5n41g4O9Qu0sGlkQGqTHNsFIEXekdPO
         /PT5MuonVv2hO3SCQ4ZBltHMFxLZeYXR5oRW08wTrk054SEqw7JQKzKeLiSIl82p8B9a
         XEZZGdzn63Ov9cplGY3gCkIzEgy86PIvCQgjqKKG+AQ8oPusJp5kbm+xuWcJ1xDKFawV
         drhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764657320; x=1765262120;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9taXAkv/HCL/GxtpivIx6rAO9Nhr3mG7qvCltfnBsLI=;
        b=fbzARhkKjia6OJhBwdnoCw9e51uLO4TsWPx1FZ4tLBDv1s+CudD5qH3Hgdk+qi9BBx
         AiZ/UbnzJrXeEj/yC4cdYM2oj/wtSzeTXDBoRvlddH2vuIJ4iE3C5DQXOzdZb/fZ+2Ie
         dvLZmVLnyFT3UqiN3MBoagYl1iAV6Lsg0AAYZ4pOwJYrmsvMwhtqLvFQOg1lF6v5Nnpi
         SDr6HqeJndfWLkD1GTxc78cJjWfhiqPo+FoiCqRr5qGYUSeIRXNCX+ub8cwhCMjhBwcM
         ZxO/+bwwvaAjkwsKoteP6gdWRuYictFAcKtGzGfwn3pSVWgrinyTBVe/JpKYc+fU9qWV
         QzIw==
X-Forwarded-Encrypted: i=1; AJvYcCU7Bc4KlDolY54F+2s77zXiC3hb+5g64GdUEe3vwY2cEqteXRytRzgce+rbRxHk7XRIXNNfJOHq+ekbSg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgv+Q8ls49qmErcP9cj/D7bY+AzGAAcCeE/U5viY4JExzKWHFK
	q4NsWiZ42wINDE/lUMCGp6CrnpH4H/usR/Ho7pFz4+FlfiwOy3lQRfDp8P7zwf5SdMlJFp1DCzu
	yqQtc2yhu5VxfycmG70TQRu0RsE+vps/JFScwoSOU2YigwNdESmy7IzmhGsp4mNR1xQ==
X-Gm-Gg: ASbGncvGCWtFRH10iDumDskB2DGBW0z1CTWfH4KEwqS3vVuLiH83b+GJyUYrgs27vsS
	aAi1ZAgbYG/HEchAf3X+VbmeR4+JwczSCKr8dEoIsmmuJx8W/2HRUL+WJBZM6/BGQj9kRww1Gqe
	IxIfK1aUvihtlu0UIJs+4zvDdnm2UMU4IqFcL1r9AD4Qv3W5lI3rUzYkK5aL8hpKy4CIhrSJvVl
	Y143F3HMveqRkYoAOKn9AJiksdP7QrT0BbWLiok/kiQs2GzXX0n89z8Ewv+Ejoa9KJOBvyXHbp5
	Gxx8l4AqiNnTohlnMv5aPGWYMoEFRyvpCQ90IFkhBv6FRsOXCav1tBkoq/HNE9cJ1NoBWO9dEXQ
	hEIkolnby1DXskIs4VhDnQUrzI56MMNvsFIsLO0Pawp4FWIE64JyYwCUH0yS9GKI8LHXIrsZSNf
	VNa6o=
X-Received: by 2002:a17:902:ef51:b0:297:e575:cc5d with SMTP id d9443c01a7336-29bab141bc7mr345435935ad.35.1764657320557;
        Mon, 01 Dec 2025 22:35:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGAAR4obs5E14wU8UmfWdKbVA2VsDO97CAfbLrhjF0gXIPJcW1X1uyl7T+CY3mCzNHNzJeJXg==
X-Received: by 2002:a17:902:ef51:b0:297:e575:cc5d with SMTP id d9443c01a7336-29bab141bc7mr345435685ad.35.1764657320032;
        Mon, 01 Dec 2025 22:35:20 -0800 (PST)
Received: from [10.249.18.58] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce445927sm143810745ad.37.2025.12.01.22.35.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 22:35:19 -0800 (PST)
Message-ID: <99609312-bd69-4506-be80-9c6aca6a10ad@oss.qualcomm.com>
Date: Tue, 2 Dec 2025 14:35:15 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com, quic_qiweil@quicinc.com,
        Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] media: qcom: iris: Add intra refresh support for gen1
 encoder
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20251127-batch2_iris_encoder_enhancements-v1-0-5ea78e2de2ae@oss.qualcomm.com>
 <54pZM7wO84wvdB_kwjNvPB0WMjjfGPPtDLg2eXpiGDYgz1N43hG2Z8TLP-nbVVhCwW-77N_i4K4QunzrO8HtKw==@protonmail.internalid>
 <20251127-batch2_iris_encoder_enhancements-v1-1-5ea78e2de2ae@oss.qualcomm.com>
 <0e00467c-6d24-43f0-8a66-72160631d2fc@kernel.org>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <0e00467c-6d24-43f0-8a66-72160631d2fc@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: MKCuzbnC4BjaarLZ8IPKDb8sxAIChleK
X-Proofpoint-ORIG-GUID: MKCuzbnC4BjaarLZ8IPKDb8sxAIChleK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA1MSBTYWx0ZWRfX+Sr6vC5VfmIu
 3tl1YryL6B1P41104sjbfrU7Q7i+eBk5yn+W9dwcyoH+t5oudjUA4FvfnJPZCWu8zDZ4Zun+VH/
 cWpMMf3NGrLWuAU52Yi+HJbvsgmMpyuXrwJKtziv1nJ+KMj625DdODhQKqR1w9ZDWj91D5QgvRK
 Sl/QqcZhNCNap8EkuZMlFs9CSdf3FgnbPhpE0Ku3I4SvCA15LBmWN+xXVsCfcQ0CjZlXrzths/S
 KDNeVdRCVFkK2oaj68nblMI62WkS+Wnh6GjWfc4KriudlGUshbKRx6K5dQrdCQdDftykILxJTve
 0lHOkpzO/imrbV6nGH7vSs/T7iwzfVnoqwW5ZtrVryOVd/7BuuoEa1TSD21QxIdzYMVY0YS7pDR
 chMSuoh2V92GFLZHEPwBcH86WuTZDw==
X-Authority-Analysis: v=2.4 cv=DL2CIiNb c=1 sm=1 tr=0 ts=692e88aa cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=PgoIHAgY8_GuLWmOGKAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020051



On 2025/11/27 18:35, Bryan O'Donoghue wrote:
> On 27/11/2025 07:44, Wangao Wang wrote:
>> +    hfi_val.mbs = fmt->width * fmt->height;
>> +    hfi_val.mbs /= 16 * 16;
> 
> 256
> 
> But why ? Also why express it as 16 * 16 ?
> 
>> +    if (hfi_val.mbs % ir_period)
>> +        hfi_val.mbs++;
>> +    hfi_val.mbs /= ir_period;
> 
> This code deserves some commentary.
> 
> ---
> bod

16 * 16 is the size of a macroblock.

Here, we first calculate the total number of macroblocks in one frame, 
then determine the number of macroblocks that need intra refresh in each 
frame based on the ir_period. All macroblocks must be refreshed within a 
single ir_period.

However, there is an issue: the macroblock sizes for AVC and HEVC are 
different. I will address this in a later patch and add comments 
accordingly.

-- 
Best Regards,
Wangao


