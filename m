Return-Path: <linux-media+bounces-48507-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4642FCB169C
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 00:16:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A59231CFCC1
	for <lists+linux-media@lfdr.de>; Tue,  9 Dec 2025 23:11:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CCCA301007;
	Tue,  9 Dec 2025 23:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bZbS+9a5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W2IybT3o"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBC82FE56E
	for <linux-media@vger.kernel.org>; Tue,  9 Dec 2025 23:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765321870; cv=none; b=C0pPrMN4zdBmiJB2ajXv5iEdrewFHW4XPzb3LuD4nCum5hc1pF+2ngvNSVtW6kdNO9k6mPhNdAK/4J3bBL5Axpl7Fd+NXIABQcF+nERbxk6tsXr/wJSJmCXChJE1MjxkPamSQhho8caDxb2wvKYaN654yDTCUbdvNWKx9tahc6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765321870; c=relaxed/simple;
	bh=MhkpASt5l10aurNOjDLlz2wtvPKwrcC1uBpOQPScKDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lGH+NT1LOYAllVVQda//ScXGRpsKpu/MpTSzFPRgH2+M4XGJEHiQNEIA7Fzg1ZlBj6Tvp6B7e+zXXMej+u9FWy4gFxWLttBljX+SPzzdi/J6ay4bm2vRQcHgIoFUcYaePu7EY61yjy41rZ9gURWj1a9KpAeVsqUXxG8UXy3jir8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bZbS+9a5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W2IybT3o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B9NAonh1209299
	for <linux-media@vger.kernel.org>; Tue, 9 Dec 2025 23:11:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1MVhjZYrpu5/DsI2NAerOjuK
	7CbZ8xrgWcGB0Hd1TE4=; b=bZbS+9a57SEBakknRS9vyt3UomhB4knWJz0A0U+2
	6pzz9vTHZIVGvzmrPkL1MawjkS0uohVuwQW9KeD0oXTiwwOCPGRV38z4CcKNBlln
	XFIEvHSb+ySlzEeu5Z+yRuc/aqnAAAutuDcKezzk+7qOossF1ruTJP/jVUWZExDn
	4q7VWyxhyDLSbmzjHZs6dU6tLDvG3PIHGueW48+eZYXEVqOAOyxLy0u2Wjt7xPkT
	JLq76qS9zJs4agBZ93xcrvDNZRuCuwsTrtk0lw4kw5fDx2kXlBukZOzYWYN7LJWL
	Y5U4qm9R06PpTrIbdeFRMcT6rqDvRFZsm5X/kjtpyrsPRQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axvm6842p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 09 Dec 2025 23:11:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4eff973c491so139118931cf.1
        for <linux-media@vger.kernel.org>; Tue, 09 Dec 2025 15:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765321864; x=1765926664; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1MVhjZYrpu5/DsI2NAerOjuK7CbZ8xrgWcGB0Hd1TE4=;
        b=W2IybT3o8ULHuNXLDzRlTmxEglFGUhlbOiqr1zOyA4TkLA1Y5yOA7+LsIv7AcOXT98
         XRGGZ/NsYuzwv+CMTwqDJbR5SG+kjauKiIZmOcLabkbnSxfR593BA2Qxu59h6o/wXTft
         hu/GG7eCY0E8oT8rpakwNy2i6kqqH/IHvacF2Q0ZsGUYiSEKQDxkGm9tuDpJPfD+0iAh
         HKBcEVF0Qb2I02s6AVhiUqPZtafddyZsy5OEzkdU/FyNObnvEQUjlEi3TyY169sGvrxK
         eamdcdL9l+0/n0zJeWsOl6v5nCrv8Np+jLwEfMRpXMI2mbjxkFA+I3WGfP2X1fokbmDM
         b+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765321864; x=1765926664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1MVhjZYrpu5/DsI2NAerOjuK7CbZ8xrgWcGB0Hd1TE4=;
        b=a9WxxrvBT33Bs8N7Qcg+z1MeSHJPbrId4rwosiOJGUBflChGmtqajy2jIpsum79ZEG
         3v2jn/9DwEGm2PuWWleooMqwSmPvDSmdgzWyewLFFArb6hUmKkMdZHFVSSNhL4BYT//Y
         nXUzWd8/y8WtLnMUyNcZ5peTz8VXRZS73TZQyJz4cWAWOIfLm7yvo0uLrdItFre/Lj1D
         EmFkD4MXXqDMimbJBsTElrT06uuk+PVF8aUx8/t20MHamPEFqBBRy24rJqiY/h7rXClt
         S8ANzqUXBH2znRkdEpV/uKsNc8UXbF+VrYnrmJ80vJAMo8FtR8YRF4QD9MW8cIJFB86j
         SnYA==
X-Forwarded-Encrypted: i=1; AJvYcCVPP44hAzLJOvlyHruFtlzxs8w0XnnWwaDUm5mSTePdCy5YcilJzIQvjL5kbvFY7ykaz8uOjNekOAJ3ng==@vger.kernel.org
X-Gm-Message-State: AOJu0YxynIrRgQJZGagTStioYK1aIsz9hAo5Y3GRAfe6EpCSZSGXrCKJ
	/pX3fGl3YHRyAqefnppPn4qLCkGAEi51X825/Zds7qEMRT0oLBmS7f6LNGZFXoUp60TmqDQdqtF
	V1DisVClEbTqrizbpfgiE7lAMTjrIASVl4V2Xh7u9WpKmsthg6fujPNF5/KkLJt3tcO2q423HJA
	==
X-Gm-Gg: ASbGncsuRBIGQSLDSxsOvVUJmMvl+CX5L7kZ3zB89v+Rlfn3KMmSP9B+TKFmnd0XJFp
	q2jK7RqY6BGJSHCvzBKDKmHnzKR/w1ZCmiq4A12nTrswarg6dJM18O3HHKT+KWsMVrxbpjcJ8L8
	DyS8cxY34licX8yxHZGu4HJaJncdtInbo7mINVP+3/80y24MWHqoRO0M79aIoJ0RtPmDPuQ1O15
	OE551IvmCIOE07Nc26TrEbmtbpqsEXbwo/xjGcyGcJNk26sE6wwNzcYir/icDH0Z2bTelpHN5rZ
	rGp+z75YittH0noPy7uNYDCZJpDyWoBR4gFWhj/cjKRKcUxAuZ1W3BXDZD9FMdznjnhtBoAeRAR
	YcECYO9+L6qGpFxXZMxE3UiFzeO8POx90XM12bdAc4fPzc3EV8gt7b9r7pLDBHifB4hvx9KzCOF
	QzRbS6FbGUGGnLjVuBWeHFcoQ=
X-Received: by 2002:a05:622a:4a10:b0:4ed:2ec5:acbf with SMTP id d75a77b69052e-4f1b1a1a4dbmr5920681cf.24.1765321864392;
        Tue, 09 Dec 2025 15:11:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXI7sFNjhsMYecIBhESAaEYvQvz8XHBF8ROwChrDsch1ulMb/mCCpMe5XarDLV1JMkjfWong==
X-Received: by 2002:a05:622a:4a10:b0:4ed:2ec5:acbf with SMTP id d75a77b69052e-4f1b1a1a4dbmr5920361cf.24.1765321863970;
        Tue, 09 Dec 2025 15:11:03 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-598dedf4912sm3420625e87.76.2025.12.09.15.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 15:11:02 -0800 (PST)
Date: Wed, 10 Dec 2025 01:11:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Renjiang Han <renjiang.han@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: venus: vdec: fix error state assignment for
 zero bytesused
Message-ID: <bqu2hcyy6nbjlzcrowcq4i4bwdycfidgl5l4ocbr4rcanhsi3l@lsyb6h3sn55b>
References: <20251208-fix-error-state-v2-1-255b62ee2eb6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208-fix-error-state-v2-1-255b62ee2eb6@oss.qualcomm.com>
X-Proofpoint-GUID: L8fli7mqiZKjZ8Gol0hN1TjZHssvYwQS
X-Proofpoint-ORIG-GUID: L8fli7mqiZKjZ8Gol0hN1TjZHssvYwQS
X-Authority-Analysis: v=2.4 cv=Ztbg6t7G c=1 sm=1 tr=0 ts=6938ac89 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hygMGN85jNpciXajp_8A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDE4MiBTYWx0ZWRfX3PacZFAasBpg
 KVIEP+q0CHtDE7hircTEL1izUOpWxywTNKM9ZlCMXLUB7yENFfRzgYGKEXWDUZawaNh0qpvjiD9
 jYqId1rtg5hpy6jl7GPFBd5C8qEB0niKqC/Fu6vRCwBovJicDKqIj1CfXxl8BjFZzvr0Z8wleSW
 2cn1kkqD+V+j5PcH/jYwcFtQFYfrWcVw90CurKKVmjEh91sQt+bIYrAgXit+WpFR859ZpmNWI1E
 v1NvaDQDTF+KJaMPxF2E1IAs/6z/6dkRikoTg5itkup5z9dFgYtQERgvwYOFX1L0be6vSbS9FoD
 x5E9VC1atnb3BajTT1ZRbtYIawzBubp1uH3V8bT9bn4+RKOpMmQFOP5XGAsAc/nPybQIs7X/oW8
 GKmvD2eCQ35ZHZ1RQ+lufR3GpFgkXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090182

On Mon, Dec 08, 2025 at 09:03:42AM +0530, Renjiang Han wrote:
> When hfi_session_flush is issued, all queued buffers are returned to
> the V4L2 driver. Some of these buffers are not processed and have
> bytesused = 0. Currently, the driver marks such buffers as error even
> during drain operations, which can incorrectly flag EOS buffers.
> 
> This patch moves the zero-bytesused check inside the non-EOS branch

Documentation/process/submitting-patches.rst, "This patch".

> so that only capture buffers with zero payload (and not EOS) are
> marked with VB2_BUF_STATE_ERROR.
> 
> Fixes: 51df3c81ba10b ("media: venus: vdec: Mark flushed buffers with error state")
> 
> Signed-off-by: Renjiang Han <renjiang.han@oss.qualcomm.com>

No empty lines between tags.

> ---
> This patch refines the error state assignment logic in the Venus vdec
> driver for Qualcomm platforms. Specifically, it ensures that the buffer
> state is only set to VB2_BUF_STATE_ERROR for non-EOS capture buffers
> with zero bytesused, preventing false error reporting during drain
> operations.
> ---
> Changes in v2:
> - 1. Update commit message.
> - 2. Add a Fixes tag.
> - Link to v1: https://lore.kernel.org/r/20251126-fix-error-state-v1-1-34f943a8b165@oss.qualcomm.com
> ---
>  drivers/media/platform/qcom/venus/vdec.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 4a6641fdffcf79705893be58c7ec5cf485e2fab9..d0bd2d86a31f9a18cb68b08ba66affdf8fc5092d 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -1440,10 +1440,10 @@ static void vdec_buf_done(struct venus_inst *inst, unsigned int buf_type,
>  				inst->drain_active = false;
>  				inst->codec_state = VENUS_DEC_STATE_STOPPED;
>  			}
> +		} else {
> +			if (!bytesused)
> +				state = VB2_BUF_STATE_ERROR;
>  		}
> -
> -		if (!bytesused)
> -			state = VB2_BUF_STATE_ERROR;
>  	} else {
>  		vbuf->sequence = inst->sequence_out++;
>  	}
> 
> ---
> base-commit: 663d0d1af3faefe673cabf4b6b077149a87ad71f
> change-id: 20251126-fix-error-state-24183a8538cd
> 
> Best regards,
> -- 
> Renjiang Han <renjiang.han@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

