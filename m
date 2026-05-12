Return-Path: <linux-media+bounces-61311-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHGRAXRtA2rF5gEAu9opvQ
	(envelope-from <linux-media+bounces-61311-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 20:12:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6014A526FF9
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 20:12:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5113230E161C
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 17:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 763933DD84A;
	Tue, 12 May 2026 17:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bBiZKzkg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QhQYbwqB"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4F73C0A18
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 17:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778608112; cv=none; b=PB0aA3vmd9GFQQWKuSyaR3LiMIhqLaiEP6GAd48INxIi5kAc18vBYO6c3V/sg1ifE2ye8DiFiu1zLxQgNB+25AzNYy7h5rOg2Ad4DNmMsGXzrrQTjfeAlX254JoYULGDGyToGqis4GXFKpg2L8+dteidYYAUfXs/EZmT6ok6JH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778608112; c=relaxed/simple;
	bh=q6deaHyTznLflz0PRZrxBlNsspIS0OUKdiX8b3/AF3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OD/SqQlAm5Nw46sOi8G4L94wnYWBWUZTV4gwIQadwxJBI7DjdHASicQemIj5CE3gU/YgBgfNjmonb8Od8LKVHxFOVEYW82EINuzN6U/hfqC1zgayPpK1nJomlmYYVGB9Z8MupuOd1wuWroelC7uVW5egCtgA3BvzT8wCHXxLEQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bBiZKzkg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QhQYbwqB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CCKvBs545069
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 17:48:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mDUyhDo/sco/C9b0xflaG8pr
	Jp8RrHZVIReC2Jh7DAM=; b=bBiZKzkg62ZXiofPWc/6PkVMMDruHlkVczMOvSB5
	imyxjKue6myBUZc9GOrOg28KlOF+bOAfR9jwidKy2hbhQIf/D5lxQ8Hz0o5+4deO
	lDOVSFcGRB4mq8b1m4W4GcP10d/k4x03KyYsRvDvRlH8g8PXn0SLktKFTo2W44r5
	btw/vE18+x+FREJX91zvOXMcLCujqdnNEMFkzMVYQzR1DfMCK+pgK+BJn/MpMMDA
	ncztieUH84AWYNN2vV+89+EaK38MCm2Nqq9FOtfKzd7MDD1fR9+TFgpxTjrshS7a
	ljeXMyUeygwlVRt3HHmQoB1e3Oz3LFMTgzxShksjuNammA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e444ss9eh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 17:48:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d5d1c2289so42788511cf.2
        for <linux-media@vger.kernel.org>; Tue, 12 May 2026 10:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778608110; x=1779212910; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mDUyhDo/sco/C9b0xflaG8prJp8RrHZVIReC2Jh7DAM=;
        b=QhQYbwqBbbh0ZwWDEVZvgETnreCNsmQjke7gf/jZfWfp/1Lkm5P/dspJM4c7OsrLdQ
         GcEZ8N72hfGWlciul6EokiNqrHOzJbaPZ6KEpBRm/e0EwqaDp/XRI1zjO5mRnSdboIPE
         EqxM8JHOnsUrroK+MtgSBMHU/c6OkSPXoF97IuRY2RJ1gRTaLlLCmygaiI2E1FN4C9w1
         LYhYMFZx+F1+lcdd8kVMewYsFBwd7HCZCAeaIw5ZfXTsnbnYQwI1WZUqjzLhf5NitBXU
         MsDOGVRvtc7f3NMomHNkms12y8TcncrveaBWv7pQYNOOxxA8IzmUEZPeIoUT6l7WXFQX
         MnmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778608110; x=1779212910;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mDUyhDo/sco/C9b0xflaG8prJp8RrHZVIReC2Jh7DAM=;
        b=N7JpUiN7euFJn6XAWWbLypK4buOXPo82PTw6S/4eleyqYS6soRl0/xKob/OA5ZjNuR
         ohPg+SToUNs0JjxWQahoUU5SWNXHmMA823MnE5sRDWrqvYggzEuoE+A8O3b9qaa4TJL1
         NbbbzM2dYPwCzsb33eB4yLHrnf5XpLSPLpkN4IZmIzOxYwTSHnrVx+IUerHJ0+/3hjox
         6Ir+8N7ubcSEneYquM/t2VHPNPqLkled2igPwXevJF16xWk8UwsWq4o+RQdrBDVsi9aD
         8Y+DyjZfPejB31jiNjcEV2ai/OcIzvUQPjGGblX1pYnP9By5BNh0WY63YKEflCAed9+Z
         u4Eg==
X-Forwarded-Encrypted: i=1; AFNElJ+RAMpmqgPuVzyJOohvAIiDmzS6gU+B/MgAmfEULLYvZ9OPySGkMQX1qa+qehyq7qmyQq74RYL3rMDiow==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAd5QW5Ycm2KrO8ipMOQI+wxAgo9u7AbCN3vbNGK8N6WGEE/Jq
	Npz/5dGVRFAh6KCOmStF8AJG/kTNKpd3xLOrxhUoOewlpDF4NgnlTyJnT5a6RaqXwfbjs7+m6nV
	sFYCuMQnK5w5D4Vq1YS/049sN0YW8RstjIEPlC5ixSWgha0qUEYwCgpz1Rafo91Ksfg==
X-Gm-Gg: Acq92OEJnUN05uGO1S5wJ9hOdiaszNlcFvbaxy39XXhymrJWBMkEy7/CefwaOWUDHBo
	oCrfgcBdtjen6ta5q85PwtRKX6X6gwYUXDlxgzowVCzXRN01iUoMeje2fkGjGdx0FuGJqW7tkEa
	7ahKHfNJRTws4NCSngicyRIg/moiYoTdNN19P5Jt19GwRIijtZUn+4LFHH+vMKjnPlCaRpdi8ci
	XdhsiNawFAIzRl8cxMz05+srDRkSCvczWk6aHdUs7jmt8HHWVtS9QNfihCN/mnier9CAJfrYkAb
	bArG1FXBpkNgvDrJ4Zfo1pk2AVFAB/RK6KFYTEtjXntRLkGC8ICfn0e7nQuNjnmW6eDbZch7LQR
	NccWcK/i7ImhUDLezAVy6MBqlmvzOs1pJH8vPqqlMqvgLRtzPwor3Og3+rFVu2phDjSAOYf5Q2a
	qi16m2C7H13LmJhRNCVaUoLhaeGIKFioSpiCw=
X-Received: by 2002:a05:622a:17c5:b0:50f:b1e6:a8f6 with SMTP id d75a77b69052e-5148e894a4amr284067011cf.26.1778608109807;
        Tue, 12 May 2026 10:48:29 -0700 (PDT)
X-Received: by 2002:a05:622a:17c5:b0:50f:b1e6:a8f6 with SMTP id d75a77b69052e-5148e894a4amr284066611cf.26.1778608109246;
        Tue, 12 May 2026 10:48:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f60db67esm34666791fa.24.2026.05.12.10.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 10:48:28 -0700 (PDT)
Date: Tue, 12 May 2026 20:48:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>, quic_qiweil@quicinc.com,
        quic_renjiang@quicinc.com
Subject: Re: [PATCH v6 5/6] media: qcom: iris: Add flip support for encoder
Message-ID: <qc4kxovb27ymjsk5mbim4g3vgg6y3q4vi45tpcnfjd4gnbvser@mwadgrokcomw>
References: <20251114-iris_encoder_enhancements-v6-0-d6d35a92635d@oss.qualcomm.com>
 <20251114-iris_encoder_enhancements-v6-5-d6d35a92635d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114-iris_encoder_enhancements-v6-5-d6d35a92635d@oss.qualcomm.com>
X-Proofpoint-GUID: I321BUY6DM4mYGgEaNCFdjF1XqCIdxlK
X-Authority-Analysis: v=2.4 cv=OcKoyBTY c=1 sm=1 tr=0 ts=6a0367ef cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=m-et6-tnyGGeQiwqTYsA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: I321BUY6DM4mYGgEaNCFdjF1XqCIdxlK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE4NSBTYWx0ZWRfXyOcoBkxkQhNQ
 T1+FJWs82gSKjqYUnRxiVU/J60ElZYlTBHP6G0RTEI2oXiJY2/2IglsbGjPh0nF4isg2tazF9rp
 q0VywO5l+OkwGsGWtk0g2x3WAIlUovnXFCLjUbHCJk+nFU33+001YDZ4jaisKfQ6TJSIS1QM4mv
 +At3pPEVPKOxdFjn1lAIBPbPEuDOyK78DwdYCxp4Q6x8HQ6blAeoDvnEwJYMmwDENnfDy5iDB0B
 bhDqN/3q1ygWwgCaj1XukThvxUqaFfyoOdyQfBDFg/lYjT3T8fKAAOCV6ISftV3DHkXI/CSaVyu
 vSif/mVW8w61i8ARzOr4iW74/5GvJjN1mXT4A1fW7fiZ+xb4k2VbbMRumy5EzEItLqjBJMWZ/4z
 vA3LxC8hYlzsQoNOO7bo6+hcf1/lGL+XzJjl7dEluZ+zzQIlr/5eumFIhL8+qDfwKP67cnILyLo
 ZJb338kKbKoAOnhqkZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120185
X-Rspamd-Queue-Id: 6014A526FF9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61311-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, Nov 14, 2025 at 11:09:02AM +0800, Wangao Wang wrote:
> Add support for V4L2_CID_HFLIP and V4L2_CID_VFLIP controls in encoder.
> 
> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c      | 27 ++++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  8 +++++++
>  .../platform/qcom/iris/iris_platform_common.h      |  2 ++
>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 22 ++++++++++++++++++
>  5 files changed, 60 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

