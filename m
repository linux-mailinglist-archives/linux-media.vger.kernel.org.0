Return-Path: <linux-media+bounces-58962-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNsmMPHf4WkBzgAAu9opvQ
	(envelope-from <linux-media+bounces-58962-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 09:23:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA92417DE5
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 09:23:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9DA0D3024020
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 07:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7951322B88;
	Fri, 17 Apr 2026 07:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PSuI4xNK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jD+6mpzO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B19331A46
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 07:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776410602; cv=none; b=oBY9kA5TUhMLqKIzE98iPhseN92KIdjE6JIdtWxgRygGkJDNric950h2krHRFvNoYD3cn9bg8m/MPpHX++PD+DMnSVG1jfbvAPA3NHiogVFvkKOAOY8DfjWo4IQtxb8vfc30llRtfm3/i6Aypmh/ElgbycGDbx6oVv+nKO0nJUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776410602; c=relaxed/simple;
	bh=zAO4yiZIspj/B9kX9m52ii9BBdRAiIgRVZAlZgVeJ64=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A1VNwZdyaugWxm/lh5TF8Ba7Xw7B+B+r9+bU0FraPZ4KNtt9Dip3HMk2Lkba92vbgqmUHUZx9XG7E9DvNvEs07Vxxd1kQl5Ax5Z41PO+ZaeXjMpCez0pDgNsy1OSwbnVKCtXbyOOsGO6XFKUJNX+MAqry2wwe5D1G7K3GmoJrxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PSuI4xNK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jD+6mpzO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H44Lbb1323662
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 07:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	njJoLDDTMciPrudwZKOk2MghYIVD6S5mzTyqW4fpstw=; b=PSuI4xNKAwKmlDIb
	cvFoOa4IT4KA0EEWhdZR6Cj3HvFkW5Ap25EcMghv82WI0qTsE8sf8F9fRq0tR4p/
	FC3T+wy7MN6cEQs+fY+PjACYAim8+XBQ5HJexM2WvmmWUxcFO2ves81nm/VcB2Fa
	FBpb3xoLO6CjRaAKg7kc5/oPeGyTuFYyVwmWptLPj0q0Ko5asUPywPFn+bcJG9rp
	sjKdWUWvHYTT2aoIzPZcXjtiwjX4tHbtSDf3ETfRbZFM79/Y0u8L1w5hDHgwh8CV
	6IUcBD2N2FJGwExtqzLfNWBneUAZ4f2qls7Hj4nazcYnFUy4kSYxaf8fxCqdaMHp
	iHS+ww==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkdgy0hpj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 07:23:20 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b24a00d12cso4626285ad.1
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 00:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776410599; x=1777015399; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=njJoLDDTMciPrudwZKOk2MghYIVD6S5mzTyqW4fpstw=;
        b=jD+6mpzOLybvcscxHooDn5EJlq5YvjyeRlMwOk+796bXr4W0v4mvoDcs9+PdJQDi9S
         HlaAYwiJxT/XslSmkt6ZbJc7drSB09fTtSkqFloZOOOeiyCHBvkPWDqs9h99SzaEZKIq
         6+QEFE+9qAe4U9aE4MCN1U3GaPO0ffOHUhINYr24hcAVnmh3TTWwff44vmO9pcPj0sVZ
         hFd+WPnS4FJaNMrB9sjg5DTBWhtYhdnrbGwvoKm4i4JlIMG7285cv94xyYFJfPHiedcR
         e4fFVdHSsOZ3djJs0W/S3nj0BslkRI6Wkjpi4K2fSLkX+DJhtUSLFtGwjE+idM6asS+Y
         +gwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776410599; x=1777015399;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=njJoLDDTMciPrudwZKOk2MghYIVD6S5mzTyqW4fpstw=;
        b=AR6ZbKSF+gopXjyNdhJe45lvks9OrKFSFB0th5EDQypJeom3fRra14xgyWG79JcfHN
         196TlNDPiRWdBh8snVzv/K8o+lWHn2Hgi7ZiijIoDO42R9oMWCTeqqbplsf37sFw2vn1
         IwbVLSWrHbgmng/fG27ukXBXy98t/1FaYI2jLNzHlCTX6pN5zDHTWQfTa6IFnBm8kzqS
         ptXYkHMOYnt0aDdqdmi3KHYc2OLRc9btPYMPbiU9qXhFbky806o9UpSDvU6G92IM+16/
         ZqcPJZVc8PvjpsPnq0FogxbPcgEVjzLO0tWYBkpA4fJxLgkL07HJxQmL1mX9G8z9wFd0
         U+KA==
X-Gm-Message-State: AOJu0Yyz/0Puz9Q/09NEWGtmD6amXoRmjiw5cKWSItM3z6zftZRz1zlb
	vbBewt37qb4W15PxKf33nTZwnBk7gtwzkfRGwxaNj9ecUDn+IFipN0OKBOjuXxeA8vibvS1BM4a
	PCgGzweBZmkSLM8ccsmXkK7DS+T2b/jR9DDnRCP4JN/1NcabF6hSiI7KcoWUY30utRw==
X-Gm-Gg: AeBDiesHS65/nA942FowLvjgEkCYgx3rfxdyUd69S6G593i8xuuN4Lkmepg8XHc2Qgf
	mYtp8bLKyZ9wTcaDKKl0MQFBe1zLYJgTcRu85nLIAapU2gN4Rnj9C6im+hIu1m38SIjVwJ6WEfz
	YqrwwtCrPx55pvTnKDR9/Ho2oahrHwOfQyst0K/1+pOpQJ4Vwt3N+bUHhJFGpzLSLT/BskqDkZ1
	Hq999oZJBsYNyqm2eNnMFivQEjy28JHKsqbc2W5/n5GZXpSKOMc02oiz51FvR4VIOs2K5dnAgCF
	fj9GJOoTAiSHuJyBMvC9C4OLSK1hRKuB3AiDXQeCUnDf5mVNqKTjvsPTgWHenQqnnnfSJTryMML
	5X8ZIJFfofvURDHiQi5KVOKOo5U7jn7ojZS4BKASxfMY7OOUB67c8NKfGLmksulWr
X-Received: by 2002:a17:902:d30b:b0:2b0:673a:7c90 with SMTP id d9443c01a7336-2b5f9f50051mr11957125ad.28.1776410599555;
        Fri, 17 Apr 2026 00:23:19 -0700 (PDT)
X-Received: by 2002:a17:902:d30b:b0:2b0:673a:7c90 with SMTP id d9443c01a7336-2b5f9f50051mr11956935ad.28.1776410599091;
        Fri, 17 Apr 2026 00:23:19 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.231.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab4cc47sm10964765ad.82.2026.04.17.00.23.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 00:23:18 -0700 (PDT)
Message-ID: <7ca67466-51d7-0003-47c6-9d0e6518745e@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 12:53:14 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH RFC 3/7] media: qcom: iris: add helpers for 8bit and 10bit
 formats
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org>
 <20260408-topic-sm8x50-iris-10bit-decoding-v1-3-428c1ec2e3f3@linaro.org>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260408-topic-sm8x50-iris-10bit-decoding-v1-3-428c1ec2e3f3@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: K_YEfIcxyl-aeWWFtU1DZjiWMXRMWOEd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDA3MiBTYWx0ZWRfX8CzukDkPfquH
 6+mFvqYnqhK4q1/LrA92IeTquoG2/LzEfuYE6CntmLKIHoyoGWmyrkE9JwFqN6wzHaZTZZTJVs7
 UC/nz2ZeB/KRLDIuSyJ6v4Ndx++T0UfDi7k+cS9ZC3shfbfWy6fYzcKj0mko8gSreNEhrQ7aS73
 M8Rf+UWmLzlPZu7V577f4EURLqdZsCLpoZw682/2lBQUrWxrmFY0wbTzC3vkpqFvbE2PL+3n8mr
 zYl7zFSA3Uc53RdNai/hSzw6ijbAS73rp5WJMEm+jn8ZsmTXqpNXhrPOxYN8GrUG1ILn+CGP1C+
 rzbiTYOMKYoZuOUmFutGptrq+p4Uk+0uGm8+na9JVNjRHwuEWWeN5FWa4RIXyqNEG9H7421a0tO
 sCCkhnxCAsmR26Clwl3Ho+UFyRHUDc7P+PvJgcMIqcWZarwsSWSM20cyqvEtiiEPAxtooA/p8eS
 SRX1ob057MpAflMxtSQ==
X-Authority-Analysis: v=2.4 cv=GN041ONK c=1 sm=1 tr=0 ts=69e1dfe8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=llJV7PLoYzplBNayqe3woA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=o9wjZkula7dpSB38lCoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: K_YEfIcxyl-aeWWFtU1DZjiWMXRMWOEd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170072
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58962-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8DA92417DE5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/8/2026 10:13 PM, Neil Armstrong wrote:
> To simplify code checking for pixel formats, add helpers to
> check for 8bit and 10bit formats.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/media/platform/qcom/iris/iris_utils.c | 12 ++++++++++++
>  drivers/media/platform/qcom/iris/iris_utils.h |  2 ++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
> index 26f51a0ccd04..c75dcb8e671e 100644
> --- a/drivers/media/platform/qcom/iris/iris_utils.c
> +++ b/drivers/media/platform/qcom/iris/iris_utils.c
> @@ -40,6 +40,18 @@ bool iris_split_mode_enabled(struct iris_inst *inst)
>  		inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC10C;
>  }
>  
> +bool iris_fmt_is_8bit(__u32 pixelformat)
> +{
> +	return pixelformat == V4L2_PIX_FMT_NV12 ||
> +		pixelformat == V4L2_PIX_FMT_QC08C;
> +}
> +
> +bool iris_fmt_is_10bit(__u32 pixelformat)
> +{
> +	return pixelformat == V4L2_PIX_FMT_P010 ||
> +		pixelformat == V4L2_PIX_FMT_QC10C;
> +}

A similar check is required in the current first patch of the series. So
you can move this patch earlier in the series?

Thanks,
Dikshita


