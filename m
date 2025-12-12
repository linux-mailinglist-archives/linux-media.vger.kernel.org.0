Return-Path: <linux-media+bounces-48691-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BE6CB7D6D
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 05:10:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B8C3301EC7E
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 04:10:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 877102F49F0;
	Fri, 12 Dec 2025 04:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FknDMwOU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FGCOSTCf"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFC82E92B3
	for <linux-media@vger.kernel.org>; Fri, 12 Dec 2025 04:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765512643; cv=none; b=tHcHMguiM4bf85Pgc3eDVaa2DFRdcJB3baOq2hR6W+xUgRk/8B1G9NKvpuPQvbPu2G97Y82asaOyek/7ykwbV6kZjAxLiYkU7bdWFSDy9bdOwIsJgPTvkOmH2N16f0V8aYwU9xTrNWaTa2eLZORlJE31L/uk+ONPTz+DZJ6SXqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765512643; c=relaxed/simple;
	bh=CUsdKubT+VP51iisTwTL1TQHDmgHK/6IZOH+0IcDSG4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CFIhXcBueJn7G664S3DXbmmfBKbtL1PAJTXo9OPH0haFjT4BR+33vtMDd7ttSHN0x0TwiLW1z+OJeKyhV+3SWLrBE3Uy3k1Rku5a5oXZiNKGBzwHq/1z/RODk2IM9YYyddPj03w8H7YPcTbk97JRMJ/3I571uyAy4d76H7OSZ40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FknDMwOU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FGCOSTCf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BC2SH3x1862404
	for <linux-media@vger.kernel.org>; Fri, 12 Dec 2025 04:10:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZyPtkdX3bxUilLCqz+l4xzOF8e1T4rAC/6kPjcJWapU=; b=FknDMwOUTIPU+RA9
	wDz9T05R4nHwNqC67h8hm6NS6GcyGKV7qIIBsgy9OnutJnhwxrojypZ8wFcNBUGx
	s/yEG5Ud7r5bR3aj38Xwii92wIx6zZyuBJh5PnLyM0BQXybGlOXT1KheJdlGBtHr
	6WJJlRkJ5qeEXQU81sWisHMxLffDy1WFv/cQhOlHAufoXBOgqht2sXf6SZ9gmn8F
	IC30Q7L0zXcGtUIfMemTNYHcXHYr0dwE4AWcozZzw6OjjCnrUgqy4GbpGg3mhdUm
	lmCet8ftQQOxVBf3T+1F9DNBnI/BUABkxSg6U+EaAJJQREO3gaoIbtFbGrxFmVBJ
	gebb3Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ays4qkcuc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 12 Dec 2025 04:10:41 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7f66686710fso743232b3a.3
        for <linux-media@vger.kernel.org>; Thu, 11 Dec 2025 20:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765512640; x=1766117440; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZyPtkdX3bxUilLCqz+l4xzOF8e1T4rAC/6kPjcJWapU=;
        b=FGCOSTCfLCUF9n+OdIIFOwxsTYBTQn8Cta+85AHo7isEfgvYj9XFPwLW3WZZzHVweE
         EpW8gArGZPlQBpAdsJxJ6dgelphYpEAdrc3a/cdCt1jxnuF5sq6JlozJG1H1WiC2i9tt
         YuAX0H5Rds2situExl6OjViGWnjkBcRvlUQF25PY/QSlcMSgVoaEM6rRA2Kz2v7imyq+
         9iaJ/rZigq+1O5eWLr1aYV0P4ayo0gmTJzOd31pAboSfj+0d15blR/5eKpoZVo6Pyr0v
         MLJibVhZBJSG/TBZ/i2v0BIx/Ig0UiYEOerjU4FQ2CapN+XdZ4okQZdwUKGdVDwWANFu
         LdZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765512640; x=1766117440;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZyPtkdX3bxUilLCqz+l4xzOF8e1T4rAC/6kPjcJWapU=;
        b=WDz3awsnpUy16BJ0peKW0Amb9E3ZKWvvxYTzI7T4i/ONOXDTotY5oYvzkw9NxmaboV
         cwR0altIrqzhdznFLtywgtJplKXYFzmb4JEeKOcOvZKiu4xafDUgAdR1KihP0UiwqTin
         fLtD9AkQkgL/HMY7oyuNFS85FYCKliS2Pdp2hJPtFak5mNgm1qPUnLG6zpLnlthYDp2F
         Whof0XP1WnSNlByZsMqSATDRwYy5Dd6wIwzGFnRcoVU139d0Q0rKPeeXv1T7Jgs2T0oy
         97scsAdQ+lb4Ao3RpoA/iyfoQSnGa4HNqjt2Kk92cw11RgX8TfMwKDl2zYynqh3HYFw1
         /tsg==
X-Gm-Message-State: AOJu0Yy5X5ujKqNICkQuUrp2ka4tL7vXRcOB9Tzfuu1hQC2/9274i57V
	Ara63bh1n36Nka2FkxrwuBjediT6aX5DGZ1EL5Zal1upo3kF0QBej68kyXPxwmYPEAFJ5opLlkk
	ucIWgMhx56P9Eg6QEXrNWFddqhS908nJSjHm6QMFwY7cx3V3EJetCKQkuIWZin5hYaA==
X-Gm-Gg: AY/fxX5I6bm9FVdDvTUneKWmdMwwYNDxFsKg+qDhtZ+jaPE5lzcZqQMBumotJJGyCaQ
	EuiM0cWbql1YERidaZ1ZofWN+0Q6EOb3UEVPxvnJ+vwICZa6wNSa2AsYGJno+WomQ3fdfx3owUw
	7/C7rq6/IbUKnjWFRZShmTpKRPGEkeM/8B3WmBmscExWQQfyTPEReWWlBuoZjj4vhd1zlHPd2un
	1Jt7GiRLQEZzDZML87F7pj9WFqvteoM+xL7K0LCaB5SOIipy9K1gMssyxUMsiWpfP7G+A5jUVgu
	gvweRKpDnVZ9PnADqu0/LUC283GKngEaryyyCURsJG/9wvO2eYrdHVwvbuQSq+WLVzOxkZNpXNI
	MD+bAxN+xh1X0eFm//1UakDJbOyUAjm82xtKcGYpcBaj+
X-Received: by 2002:a05:6a00:2883:b0:7ad:9470:27a1 with SMTP id d2e1a72fcca58-7f667e15912mr906868b3a.28.1765512639975;
        Thu, 11 Dec 2025 20:10:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYBRxy3S9HL9yJtZUjTFs5oovm764BaCYG1LSGUFPuUXBV5vdAiMZ3IjXWeW2UvU5fxEc96Q==
X-Received: by 2002:a05:6a00:2883:b0:7ad:9470:27a1 with SMTP id d2e1a72fcca58-7f667e15912mr906839b3a.28.1765512639462;
        Thu, 11 Dec 2025 20:10:39 -0800 (PST)
Received: from [192.168.0.171] ([49.205.251.140])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f634c229b9sm740509b3a.43.2025.12.11.20.10.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Dec 2025 20:10:39 -0800 (PST)
Message-ID: <9892e02a-63ac-4cf2-b1d8-f37f6ed980aa@oss.qualcomm.com>
Date: Fri, 12 Dec 2025 09:40:35 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] media: venus: vdec: fix error state assignment for
 zero bytesused
To: Renjiang Han <renjiang.han@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251211-fix-error-state-v3-1-b429262d151c@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20251211-fix-error-state-v3-1-b429262d151c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZG7Mhhj9LCSYrf-oA3cEc93q_qW-uaay
X-Proofpoint-ORIG-GUID: ZG7Mhhj9LCSYrf-oA3cEc93q_qW-uaay
X-Authority-Analysis: v=2.4 cv=B/S0EetM c=1 sm=1 tr=0 ts=693b95c1 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=oHgmLS9T6KHqMfKxrEeemw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=hygMGN85jNpciXajp_8A:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEyMDAzMCBTYWx0ZWRfX5eBFTCItNvpz
 toPu4XDIe8RBZ/AgZrEwylRyQ7qhs2QK2vxEMDO4KYVte+rULFyMgGMH9UT531EAt9RteTWxcCr
 P/d3SpHnLTdwb7gY80RVH/LeWL+wHVDEHFjg3Ai2wnnB+UHjo94PythzSwp2xrXwGq6q2F3PZ1L
 IJDqr41UJHCPp1f68WP3Eq4U17sgIZ7eEZU9HwifM0rUeTMx4lRuDVKpyCX08HVNSZByONk1KWi
 Isa86VzbPypGbnHTz9vJ/VnFqhSVmCRKpMIqB39Vyhn9+pB6AuOQt0f8bmli/eMEtWgxq0i26m3
 BJ7aJH3xg3AiBqEDGCWUW26nbOs6uMCgoov5iYqjBjuKgP7K8U/jfiJjHeb7qJ9PLnbDF79UuDB
 sIjv+LHbE7tlFcYL1uyoCXq3PWoATA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_01,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512120030


On 12/11/2025 3:20 PM, Renjiang Han wrote:
> When hfi_session_flush is issued, all queued buffers are returned to
> the V4L2 driver. Some of these buffers are not processed and have
> bytesused = 0. Currently, the driver marks such buffers as error even
> during drain operations, which can incorrectly flag EOS buffers.
> 
> Only capture buffers with zero payload (and not EOS) should be marked
> with VB2_BUF_STATE_ERROR. The check is performed inside the non-EOS
> branch to ensure correct handling.
> 
> Fixes: 51df3c81ba10b ("media: venus: vdec: Mark flushed buffers with error state")
> Signed-off-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
> ---
> The error state assignment in the Venus vdec driver for Qualcomm
> platforms is updated to ensure that VB2_BUF_STATE_ERROR is applied
> only to non-EOS capture buffers with zero bytesused. Ensures false
> error reports do not occur during drain operations.
> ---
> Changes in v3:
> - 1, Update commit message.
> - 2, Move empty line between tags.
> - 3, Update cover letter message.
> - Link to v2: https://lore.kernel.org/r/20251208-fix-error-state-v2-1-255b62ee2eb6@oss.qualcomm.com
> 
> Changes in v2:
> - 1. Update commit message.
> - 2. Add a Fixes tag.
> - Link to v1: https://lore.kernel.org/r/20251126-fix-error-state-v1-1-34f943a8b165@oss.qualcomm.com
> ---
>   drivers/media/platform/qcom/venus/vdec.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 4a6641fdffcf79705893be58c7ec5cf485e2fab9..d0bd2d86a31f9a18cb68b08ba66affdf8fc5092d 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -1440,10 +1440,10 @@ static void vdec_buf_done(struct venus_inst *inst, unsigned int buf_type,
>   				inst->drain_active = false;
>   				inst->codec_state = VENUS_DEC_STATE_STOPPED;
>   			}
> +		} else {
> +			if (!bytesused)
> +				state = VB2_BUF_STATE_ERROR;
>   		}
> -
> -		if (!bytesused)
> -			state = VB2_BUF_STATE_ERROR;
>   	} else {
>   		vbuf->sequence = inst->sequence_out++;
>   	}
> 
> ---

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>


