Return-Path: <linux-media+bounces-44717-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB6FBE3027
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 13:07:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1CD494FB199
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 11:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26DF730DEA3;
	Thu, 16 Oct 2025 11:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XydH7KLN"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D5330C34B
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 11:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760612798; cv=none; b=Xa7ThqztDsyKjDtMHZdIAiP7LKQDPTiEa5dooG5ne2tt1zO1QWCPDuySWMmqgvBd0BddSNp9AGI0pqLtabExglsR1Xw+bw6xG5S1V4cJ7ek17qK1H1cGorowRarl/roTdr7F6ulx5BrZ1xyCkfz8Tx3yubgi+GydqzZTcS3b8U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760612798; c=relaxed/simple;
	bh=iI6eQ4euIxUTVZlbEdBV/FiJUARLVqwn8IEP/AlBu6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EowzyUfI00gxVIvJ4rWrjRkHAJ0cLdVJVoRkx4J/h4MsuIDKyief+3sAVlqF9X1QIMB7GJFL7ViFiE8EzBCLmLkAqfd9VzkG5Zg5vu04YleNEsUvRzzaAZc/Fu50Sc9wMRPqqKSHUW/SNFe9q3CSGltV45hXlMuoLoox9/isUuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XydH7KLN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59G759RE016057
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 11:06:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5NX/KLfr6t5fxcfNm5GK/I/J8ryOwP+n8K6WCLUYwtQ=; b=XydH7KLNQXS3z9pE
	oNVUd6au1qgh8Z+8G1nxvAex6w2gdkOQtWxRP12mXABHT2Qyf0cDLFSVzoFsgl2P
	R6Tp4q5x2Li3LZlas6FUhGeCNZAiM9oEtShv1GEaRRxHQ6jQwRchPYzsM7CC/0cN
	4u8nDz9UXZ+s3c9Q8IdDGpcVwOofqxNYOht5F2i26300mqEp6IcD4g3CpcQRrNMN
	hMoCkXDuA/lbMSD8tsWwEIfx+cNduJ/wXF9Dpn1LSVXoNy55D8uE2LfOzU/JZpD5
	GJpGscRlsqqUcndUCXdFmVJ/1PGDf2WOqLwykS6OmnyCXrO5Atw/qp3VdEwLywBN
	OG3LyQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5r5u0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 11:06:35 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b557abaad02so833740a12.3
        for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 04:06:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760612795; x=1761217595;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5NX/KLfr6t5fxcfNm5GK/I/J8ryOwP+n8K6WCLUYwtQ=;
        b=teNIU0SlIsPgLcqyV85QojbDJeba7+Zu/fQsSlakLKqMB+aQZhImPArUULvOgwJ16h
         jZp2C6e1Gr+E+P+0fX8mpqqAUa55VDYzVL0NCYtkR2/8ulV7EhWkh9/ASY4MRSF2DkwZ
         EkPty/ghbVvOs0LOXFKMYDaWdw1PWQ9btneWBG53q3KdciGSvHLYL5DwVCSE/ZOT9lP1
         E+0Gu+vBP3nmTrVk+KRQBziyjPb5/TGd0DfaskmfNaSkZAheRyDw/H5Q8prBPS5oZA5Q
         Ul7kFUa8uyacfzsnRuu+QN7FQUBfXKtLJ03Q95KhK8222uocO02UpAwf/CZTxWCFkrnD
         jxQg==
X-Gm-Message-State: AOJu0Yxa2xqojV3n+oF8TMzuxXn5e+S/gLphW0+4uUz8+TjRRqok0XqI
	T3/RD5yvg7HTgWKMTzUAiEFrFyGZ2vAlQR9KbcRJ0TY/TVKVxAxVNgMUIUeNC7p/gCWf50y5z0W
	8crwLQEnJML405gNEqY7+ql+qbsnWkxnXaWlvwCzDgW2X1Ta4NNeEKbg4++DTLYRi2A==
X-Gm-Gg: ASbGncu6owSNMBCvpD9J3+7IimI/MaG6FVhUiJfTs2Q9t5LHreINn33GfB+pxjxEDvh
	7prNZqmlayHqWMHqLvhUtDSwFvTvVUT0Ew3wGJeqVqXzj/lhqwi94r+o5IcLyIgJPMd3aJ0COYs
	ctCrJb/ASef7CL74/Z9Tl5zBAYMB2IQyPWfWUhnfFYDpvhKEeON5jL0C5jDTuS0fng7PBdKzE+B
	zmMmozdndYRklSFYVd7+VXsUbSCyihJ/RYse/FiZZbm3chSmUtBYGx+QGlh8zoVD+4JVROy/KbJ
	vYXWszPR/VPQiOQIxURhCxhaqt8DgQFhWYltrnlXBCU6XlFxjzJ5TbtPsOEju3DZEh86SMq/R4N
	tPPr8bL1TOSvancb4S0m2QrEHdntwDow=
X-Received: by 2002:a17:903:ac3:b0:272:dee1:c133 with SMTP id d9443c01a7336-2902723facfmr345507355ad.22.1760612794637;
        Thu, 16 Oct 2025 04:06:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/f/UbBVTHNDnGQhsb4+5hS3Sdx511yYCmnD+b86Jeb5QRzKzVrfCSD7m5ae31hSWsHCva3Q==
X-Received: by 2002:a17:903:ac3:b0:272:dee1:c133 with SMTP id d9443c01a7336-2902723facfmr345507005ad.22.1760612794142;
        Thu, 16 Oct 2025 04:06:34 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099b0249asm26376145ad.109.2025.10.16.04.06.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 04:06:33 -0700 (PDT)
Message-ID: <d2e0935c-4794-e5de-4baf-7ac7c323eca9@oss.qualcomm.com>
Date: Thu, 16 Oct 2025 16:36:29 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1] media: qcom: iris: Add sanity check for stop streaming
Content-Language: en-US
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        vikash.garodia@oss.qualcomm.com, abhinav.kumar@linux.dev,
        bod@kernel.org, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_qiweil@quicinc.com,
        quic_renjiang@quicinc.com
References: <20251016072517.4845-1-wangao.wang@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251016072517.4845-1-wangao.wang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pI2RbCg9fCw5nrO3LJ1u-PL7uRH-XcbC
X-Proofpoint-ORIG-GUID: pI2RbCg9fCw5nrO3LJ1u-PL7uRH-XcbC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfX8LFEutJWORlM
 HC/oXF34l6CG3IpT0tkOroaCw5gaaU2Su7XdPGDIfCxuOnHJkYc6RsOiDBHvWtX/55ORRoyAmVI
 kT21gCae3lHoiUMihA1RZVw18QPOfr/PIR+VJQoWVGTVrrGjDOTjqqATgLQbRdjMwAmfXS4SZOZ
 cxE7WeW/OHY6ZI3dC7mlOBt5w+fcuysiro4L8g3T4KlFZnkUhI9sDRoss8C9e6My4QGSYqkYEYE
 o8FXl9HTTXAJoy3rHFzTuEZ4SVEm4XIMkbI+GIL9qa35xUrCmYqweRo1Z//b/NFv42HgWH4tDjH
 +W2lQFOkdBqZBHe8baP2xmTW/OtsBJDhOkOHvEHSDaG9kJnJ7e5XcS3v9AutR4FOTYCYCwve27o
 /u9NDpbwgN8qaYgL3yj469u20HFEJg==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68f0d1bb cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=8kNo1vfqJQJ2e38LGaYA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020



On 10/16/2025 12:55 PM, Wangao Wang wrote:
> Add sanity check in iris_vb2_stop_streaming. If inst->state is
> already IRIS_INST_ERROR, we should skip the stream_off operation
> because it would still send packets to the firmware.
> 
> In iris_vdec_kill_session, inst->state is set to IRIS_INST_ERROR
> and session_close is executed, which will kfree(inst_hfi_gen2->packet).
> If stop_streaming is called afterward, it will cause a crash.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vb2.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
> index 139b821f7952..c1647fb4f0cc 100644
> --- a/drivers/media/platform/qcom/iris/iris_vb2.c
> +++ b/drivers/media/platform/qcom/iris/iris_vb2.c
> @@ -231,16 +231,20 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
>  		return;
>  
>  	mutex_lock(&inst->lock);
> +	if (inst->state == IRIS_INST_ERROR) {
> +		ret = -EBUSY;

ret is only used to trigger a state change to ERROR in this void API. Since
the instance is already in ERROR state, assigning ret = -EBUSY is redundant
and has no functional impact.

Thanks,
Dikshita
> +		goto error;
> +	}
>  
>  	if (!V4L2_TYPE_IS_OUTPUT(q->type) &&
>  	    !V4L2_TYPE_IS_CAPTURE(q->type))
> -		goto exit;
> +		goto error;
>  
>  	ret = iris_session_streamoff(inst, q->type);
>  	if (ret)
> -		goto exit;
> +		goto error;
>  
> -exit:
> +error:
>  	iris_helper_buffers_done(inst, q->type, VB2_BUF_STATE_ERROR);
>  	if (ret)
>  		iris_inst_change_state(inst, IRIS_INST_ERROR);

