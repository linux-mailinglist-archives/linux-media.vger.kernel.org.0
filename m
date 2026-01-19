Return-Path: <linux-media+bounces-51011-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BF036D3A094
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 08:51:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EABAB303B7F5
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 07:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1927338581;
	Mon, 19 Jan 2026 07:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MFZqcpE+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eEmC+GKD"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3CF29D291
	for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 07:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768808840; cv=none; b=tPfXFOwkx5yth0FZedrwq1KfB1B7FhHb/iwfnR/w4s1bvobyWrPMuOKBchPRCCyZUn3IF4IUgQ3/9Fl4KWmll6pBhzGViw14/E17fc7yZ83MP90mfyQqJczmRo0b26EkUdHZa3lrlLBJsR+pQb5a6d8pZAidJEfaJB/qu1ODlnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768808840; c=relaxed/simple;
	bh=Tgf0VcYCUtXe89uTM2OBa7p9iDOCoptnLiS/HmHmi3w=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=e3own27CP2GjATL/yCKVyxIa86RYr7Nm/GD0tgkfQBj2QG0RreAnKCm3/qZ6ITntuyXA3jF/sixwZ0sxXG6kFQac9LhuggvO9551voMsbFEcGe6FsmERasSgk+LhttHlQ9aOS109BnLjJntPIpSSnuKlIs+u5VTYJCNaD+q3Wb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MFZqcpE+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eEmC+GKD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J7hYAN039971
	for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 07:47:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GZ85mfqi41v4PyjN22gGAFMq8Pfu7GHfOSwVNtysSmo=; b=MFZqcpE+zDEkEljI
	eS3BEc+8YC8hC5WU6VnV2ZzFhUuBJIXceZxk4u1aUyaGZV7MVHM3TI/qgvDE3TVx
	d2VLbsmSY36B1G9MQMuHKAjTNgB1uIwlTu9k3oL+AXpELUMyDvEI8sGuMU9dgtSS
	b8jpEFgeQjIoorAOs8PyPxVgfkqWdnRhxUY25I/B8jK5yc8hCEJqgu3xqH6OHT3t
	X5fo/GvUdPtKdt1AtEuCHVWpb+s1JjXXVoHrqjPf6RUP8ahBjE/3D7PiO2Ufh/Ff
	TPkzm0JN7KKXihH0z/MRxItTixDSc1SrU9N7lzb3zX80yIN9yB/haU+8o5ha1foE
	DsoV1Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsgfr80aa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 07:47:17 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c337375d953so2344843a12.3
        for <linux-media@vger.kernel.org>; Sun, 18 Jan 2026 23:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768808837; x=1769413637; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GZ85mfqi41v4PyjN22gGAFMq8Pfu7GHfOSwVNtysSmo=;
        b=eEmC+GKDuMAowLjdRh4EGFhYBFtQ1GPPIWNZDpFRqUkmWROR+iNgXRaoZ7e9y1Q1N3
         zRUMmIp76i/ZTY9iuwGCVVFxCmRoN0su1iZ3Suqo1JvJ74K7baLsoilDyAyeUwmkW8ce
         QDZ6cNfmzi0Yus1lFSaZMusRwOqdfoeYnpWqqpfq4PF3qtH3yOzIAk+g0uYury7Is9C/
         iQhhX8Q+QCEhw8Oa+c48RfRzbso8GTFj4CFbD8T5feZMC/DBBpP+L5wyu4rW1krBWoQX
         1fvhxCABdyXFbkARaPUKTAKf8Nt5BEPq0LfRPiN6jdeHedt73HE13O6a8qTXwITqIxB5
         9kUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768808837; x=1769413637;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GZ85mfqi41v4PyjN22gGAFMq8Pfu7GHfOSwVNtysSmo=;
        b=lSvSlR+FPdgPK+ce8lAUxigpyVvzDWqBBZd0UvAY3YW1pgbKj/KwKwDFYbZ03TKmbm
         KVHdPTw2gOsHCrjbqWf4KUq8Gg7IAdMZRz8vy6GDw18XCmVnrUCmGgjz69gKejtFE6jF
         LtrhOpE3PPi42FrnvOJQ6z1Lvb6/9ZOmpHvBmUSe61JheBzC/uhCr+YSHSRa81ydmkRO
         yXvIhEnuIHPSVqABOY0/1QAsS/+4vFILZKUFYbuqOag2BNN/2fbYjmu2CiMuknO5rfiB
         gu48VMNfd6m6F3W5kICMoi/rc9SlNNbgNaW3cD9gCqPueSqRjNojc72nqrgQgN1mlj9Z
         V1Pw==
X-Forwarded-Encrypted: i=1; AJvYcCW9vJ+maOLpgf1Vgy4r4qOi15pEXW+s8sJEYTULdOWn8T80QHv/+W2i7CGbEojqbBjz9hAVAC4HiU8Y/w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+k4fRPbF5DGaXCJ16s3OK6xKPhrMOBJVssvHQIWVcOXMBx5U7
	wf6IHTlxjTUDhopZRyLl9gQv4Tkcz9RmeUflPBNGGkxeDYQcM/V2DWP9W6yGQq+R94uhfMHPeOm
	qjSyINmKCsMmTyeXj2JacHhYl6xUcVb7IsEv3No+2AsSH1VETUDW2Zn/D/NvngboJZw==
X-Gm-Gg: AY/fxX732o1oKh9idYED5frXxA+oYxNAy9ldCeI3dRu8dkqUnkMgckjL7bv9KfWn4MD
	4ih1ihjQgXaPkUyPxwN8WYg2nd7d9Y4lvuwfNKoHsTlwTIKP825P79cPrgatk5R1K1KNpkowx3w
	ZnfixVmOdvaiaQGuqBWT5gC4hNPjmPmGq8pDJpmCATyNo5q2BJOyoggkZlIuzXqgGTCCwnzVigA
	60M7VVbVKaqxWFi/kE2MOvISwIyrOZ0kcqspfmuCtC6CZ4QXnJJjpnwaAmc5gVUJBhzNxs/TJj4
	8WAyhbjgB3sp42q1CzGm1F/nFcfihZNF/D7YgNc5yEeNtCtAYyXLFUNIR2yk0a7sGtsfPcxNGff
	pSlKrtAtqg6Q81KgSfwDM/yGgDhZgvY1pWX7N5W4eBZCYy4crbd5Q+r3ZUATjyHrSnRbgweGv+C
	rwcA==
X-Received: by 2002:a05:6300:6199:b0:364:14f4:5205 with SMTP id adf61e73a8af0-38e00bc01aemr10040415637.1.1768808836734;
        Sun, 18 Jan 2026 23:47:16 -0800 (PST)
X-Received: by 2002:a05:6300:6199:b0:364:14f4:5205 with SMTP id adf61e73a8af0-38e00bc01aemr10040382637.1.1768808836236;
        Sun, 18 Jan 2026 23:47:16 -0800 (PST)
Received: from [10.249.8.62] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf2330d4sm8657224a12.5.2026.01.18.23.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jan 2026 23:47:15 -0800 (PST)
Message-ID: <08675c7f-3875-4335-8dab-eb0044d42b38@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 15:47:08 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v3 0/9] media: iris: migrate to using global UBWC config
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
References: <20260116-iris-ubwc-v3-0-662ac0e0761f@oss.qualcomm.com>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <20260116-iris-ubwc-v3-0-662ac0e0761f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cZU2i5cHg_Nyp27ru-U9fxTkv-bOmB1D
X-Proofpoint-GUID: cZU2i5cHg_Nyp27ru-U9fxTkv-bOmB1D
X-Authority-Analysis: v=2.4 cv=c4OmgB9l c=1 sm=1 tr=0 ts=696de185 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=RKnW3nVSh4YJs2QzWIQA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA2MiBTYWx0ZWRfXwNSa/fLCnVsl
 hUNDasGkNOL/WVSsmgUWyi22Njg3HmbE2zkirHvpcxIazaiRhIcf3U6d7DvW8HTvHf21rghq8oJ
 qH2O5GLeOyyNjgpEJiHuLL0SBlOTk8oggokPm3fy4Ku7rSaflp5nwukYWoDzgGjzsVMHX7LmNdV
 Uee+tZznLO1RnVLGqpJ8YaqRBAdnzWDk+ogUBgKx+sN2UmPVhNNOSqcvqulz7Q54PuRZC9zhMm7
 vy3VophMoezbM+DWDZy9oWLyTakkVQow1I74lgX6OaUDSy3/oA6MNpv/hPtLwiDvzHfZ+RLbxqZ
 Pv+vWgGageRp44d883tJe0zRzvxmgC/zEJWlRG7yguJNGbmf8BXDYBYyLG173mXmr2Yo0h/OBqX
 CXDSr9UUJ+DhyilfEUor9/a34B7lYeM8jXLGsPk+MD0p1FMVruTIouBz3zGwWYmR/81r/j+VOSl
 KdOxoHiS/5r6Jxpmxcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190062



On 2026/1/16 15:27, Dmitry Baryshkov wrote:
> Having UBWC configuration in the driver is error prone. For example, the
> driver specifies fixed values for HBB, while the actual value might
> depend on the DDR type. Stop defining UBWC data in the iris driver and
> use the global UBWC configuration registry.
> 
> Merge strategy: either merge SoC bits directly through the media tree
> (with Bjorn's ack) or merge to the media tree through the immutable tag.
> The drm patches will follow depending on the way the SoC patches are
> merged.
> 
> Note: the patches are compile-tested only because of the lack of the
> Gen2 hardware at hand.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Changes in v3:
> - Dropped applied and unrelated patches (they will be posted separately)
> - Include printk.h, decoupling the series from fix picked up by Bjorn
> - Introduced additional helpers to retrieve the data.
> - Link to v2: https://lore.kernel.org/r/20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com
> 
> Changes in v2:
> - Extended the commit message and added a comment for the min_acc length
>    helper (Konrad)
> - Link to v1: https://lore.kernel.org/r/20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com
> 
> ---
> Dmitry Baryshkov (9):
>        soc: qcom: ubwc: add helper to get min_acc length
>        soc: qcom: ubwc: add helpers to get programmable values
>        media: iris: retrieve UBWC platform configuration
>        media: iris: don't specify min_acc_length in the source code
>        media: iris: don't specify highest_bank_bit in the source code
>        media: iris: don't specify ubwc_swizzle in the source code
>        media: iris: don't specify bank_spreading in the source code
>        media: iris: don't specify max_channels in the source code
>        media: iris: drop remnants of UBWC configuration
> 
>   drivers/media/platform/qcom/iris/Kconfig           |  1 +
>   drivers/media/platform/qcom/iris/iris_core.h       |  4 ++++
>   .../platform/qcom/iris/iris_hfi_gen2_packet.c      | 18 ++++++++++------
>   .../platform/qcom/iris/iris_platform_common.h      | 11 ----------
>   .../media/platform/qcom/iris/iris_platform_gen2.c  | 14 ------------
>   drivers/media/platform/qcom/iris/iris_probe.c      |  5 +++++
>   include/linux/soc/qcom/ubwc.h                      | 25 ++++++++++++++++++++++
>   7 files changed, 46 insertions(+), 32 deletions(-)
> ---
> base-commit: b775e489bec70895b7ef6b66927886bbac79598f
> change-id: 20260110-iris-ubwc-06f64cbb31ae
> 
> Best regards,

Tested the v2 patch series on Lemans and Monaco.
Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>

-- 
Best Regards,
Wangao


