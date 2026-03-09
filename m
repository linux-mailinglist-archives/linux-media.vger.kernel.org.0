Return-Path: <linux-media+bounces-54940-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIyNJxurrmntHQIAu9opvQ
	(envelope-from <linux-media+bounces-54940-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 12:12:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3DF237ACE
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 12:12:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6A8843030D29
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 11:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0646396D3A;
	Mon,  9 Mar 2026 11:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ndND8U47";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JmgXZFZC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF17396B9C
	for <linux-media@vger.kernel.org>; Mon,  9 Mar 2026 11:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773054731; cv=none; b=JvRmmrYay2p7DFEDF+sAcZpicgYBkRosJ/CrRbE6DlJQfAkv0aZq23uOGz4zBeu14Y32Q+20CNcsS+r2AX4k05tosgyTFHcle0PfrKV3qYbprZQ9RdX0FqayAm7Ri/kDaUVqqE7sZQmfTiYz2PpB3QetADXQH+7Aq1JIvCZin64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773054731; c=relaxed/simple;
	bh=OuHFg6n+t/u5kuFLvyToVx+McTnAWkewnxqHpf3spvo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iAl4M7saNUob0OtpNZdPie6eVdTYAGbKJo3swDR2VIwwsskI7uz3fyZgHeJcBSmy2Xxb8P2dE0h/jzKJZfRPXdRcl09PG8M21TzD919r/+o64os7TGpCCzCGqZ6j7jHfGOigMTPyKNh+aH/OuYUJ/QwfN91hhvTvYnhWvwRSlHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ndND8U47; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JmgXZFZC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6298DWdM3014716
	for <linux-media@vger.kernel.org>; Mon, 9 Mar 2026 11:12:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FkG+10e6oO4Py4qSJRMKwPKKQj5z9wloxJqalTImsRI=; b=ndND8U47UjlvF27O
	jB6jMXuMC1kCPp6L5sjjehMJVOcDmdfZN9xuY43ks200L+ppH0n2PE2w7xYOdidr
	HBfihpbdwwAhKqUfW/HxseYsKezcmSPuVHT6qhc7MCAymGDXsqqxLruY3+9y5lJR
	ecARhqU/EsBTPhCi5JopP1gO+5V4XrovHCLTtqJeJZdhdAGYFKpiWeFIeFBQXAFv
	75aCXiue+HCCV/HRTgiWq+rzY4wdf+auAvAgkrWiP1sAV8FogY25/E76uN+2beD3
	bocD1FeoZ6pDgIS3wwWrgPAY+Y8NfVSizFM6iRMpfAAjnBpF8MaBMY8AwEf5A1Fk
	zXnMZQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crbkxw57r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 09 Mar 2026 11:12:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70cb31bcdso761601185a.1
        for <linux-media@vger.kernel.org>; Mon, 09 Mar 2026 04:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773054728; x=1773659528; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FkG+10e6oO4Py4qSJRMKwPKKQj5z9wloxJqalTImsRI=;
        b=JmgXZFZCv2BAGtNdCNfTTGmj6shIHrkqdchHnA+KzJ/ypYLASh5bt3o/BHZeNt3P9j
         5x4RhJxmAR7D2HYOqzgxNtedPSpYf7NRXYWtoJhAza7tFMyDUF4uL4B8X707DsGLgFeL
         dwUl1lxBclhtj+d4FUSjqC6aNzQ7SWI9VMWGfD++z01EcGUNh8qOcuYnG2U9FWLWo0tZ
         QKWvQQwi2ZtDcKnvc+rEj2oB9WTKH4rmuUcHl3JLnOkS98n3e0aH89qR7YgdEYdkWWGH
         4YLw+WNzV2ULEguiXPKGhAbvCG1NUt1RJJG0NVaDnzNKWlrw6hvkxwTryUrhOxw6vuXS
         tBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773054728; x=1773659528;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FkG+10e6oO4Py4qSJRMKwPKKQj5z9wloxJqalTImsRI=;
        b=VekNaiGTn8mNLz4ZtWL3t2EFLVBRuR9hk6LleeZaOtxOmX03xy88g6hg74OhmrLJKw
         xis8cfs3kamHOclGBmlW2GnZKCNpQlR+5zf4cNgWPeDE4Flx1mcxebk2AVdwe0BIGX/t
         CidNEj44MOBUMcgHhPuUWcSYaD0zjVUOhYRTjvSz0vGfsgk0CCgyzZYhacT175dWDfMK
         ICeB3RLIONxetQB9U7Qb4Tt3KyK6AYHbEOLQJvO3Iarjpk6eFBESdezisjF2Fbf4YLu7
         wEsWKqJsSluuRcZRnC1w1sLXX2xEnTWivrruKbNqVa3YiNMzUpxFeLvU3WTXXm/nztxE
         Pd3Q==
X-Gm-Message-State: AOJu0Yz/JyIv2c9r0pHqCwjJ5k7jWyyoefuSxp+UN/CqpnDgVqlbJ3Nh
	6KfS1Gl71PRp+VeccXkHvqQnx0+vaEuVq8OoEjz9utCMH75IYekRxMmOO/aNq8s85HONHEf+wJt
	caoZUxEZA8cZhV29vJWPOltjlTgu8E5XUM8AzU72rzTk+oYUxC2xQu+q7dAiPUGR7Wy/fC9BWvA
	==
X-Gm-Gg: ATEYQzzI1n51ICQTjIPJKilAUBj9HGMHPLgL3mWCgjJn0i2Zpie0UIVRrfn1Z6NFisS
	Ex5TEGJ6pxb8uMVbSkGZPTjUPzy3ZKPC6V9oF+8Su9vft/GK9KN4/+VvUZw+tPfp6BKa4APEH8m
	wLy7Ip866l4qOrtjkrbEAZAnLr1BVHu5SatqppOXYIZOzD+XwY2/AJSBi7oO1hNSDgCjnH6OPlo
	pJ3Ei7+zJO7dmGDeUXC3pe/68rbwvLYBr3fDDEPBqiuWw7j+WYx7CazvE3Sbp71jWxx0gXq9UNP
	V2oI43NmT6O/fLNjHOrDdgGGBRGfRpwmPwQADoVnmVXxEdBvbI6+AlxjbyEnH3WcGcXpnI9RLk8
	anZmGH1xNfMNrl4dPp1gUPhrSuMvkSWyUFFZKOps914Ctf5AmpVAM2BFXZBzNxis8iG5f4+QTcq
	PAXVI=
X-Received: by 2002:a05:620a:890a:b0:8cd:7271:65e4 with SMTP id af79cd13be357-8cd7271686emr777840885a.10.1773054728331;
        Mon, 09 Mar 2026 04:12:08 -0700 (PDT)
X-Received: by 2002:a05:620a:890a:b0:8cd:7271:65e4 with SMTP id af79cd13be357-8cd7271686emr777837485a.10.1773054727913;
        Mon, 09 Mar 2026 04:12:07 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b96da58b66dsm247943266b.42.2026.03.09.04.12.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 04:12:07 -0700 (PDT)
Message-ID: <0a31ea01-11c7-4470-a4f1-85e7f863d834@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 12:12:05 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] media: camss: vfe: Make PIX BPL alignment
 format-based on CAMSS_2290
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, bryan.odonoghue@linaro.org,
        vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org
References: <20260306160006.1513177-1-loic.poulain@oss.qualcomm.com>
 <20260306160006.1513177-4-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260306160006.1513177-4-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwMiBTYWx0ZWRfX+Tn0NZWpWOVy
 Jz5joVDK2H8ieRE11A7Li6Gr3vltVS8lXGFRIRu7HNAMHrrhZezTfwhkxGwFuLRizID+Q13UbWq
 jcjJeLHrwiEvl7u3Uu28KjhlEB+QyiJ7z7hxo5Qxy2sQlb3GGZrBECpud4zbuASb/RhoX9+VhUW
 06222/PAKqPssY+hfy2q1ts2yPm+90fS2yGZQxW2XZyPgjo35vXBkGsRzHWbpjNbcXq+HaiPqcp
 j9JIgbq9vElDt7k2BSYacTvMZQwUWv5ShxdTamzefl+F1OpDEtzCMGVDoLPOd73chDFbuNN0994
 yUOSqToUOZFU261YsMoofo8e42MmfAMnIu4YU/u+GeIroZ06FaLT2l6F+ej4yqtHOphKK+3apdQ
 vm/rjrRHbH8vGYnKjK3keD3JolXIt9cvD4OGR8RiXg5xQ8R7nZfS3Ms6VtyGlTAPOYe0Fe4Twot
 iMm7x1cJ+GZ/ej5QUVA==
X-Proofpoint-ORIG-GUID: 9annBFRuKId3WxYjEe06tWPPaR19iTAR
X-Proofpoint-GUID: 9annBFRuKId3WxYjEe06tWPPaR19iTAR
X-Authority-Analysis: v=2.4 cv=LOprgZW9 c=1 sm=1 tr=0 ts=69aeab09 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=C1iuyIOyw383eEmvdYgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090102
X-Rspamd-Queue-Id: 1A3DF237ACE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-54940-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.949];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/6/26 5:00 PM, Loic Poulain wrote:
> Split the VFE bytes-per-line (BPL) alignment logic into separate
> helpers for RDI and PIX paths. RDI is usually aligned on RDI write
> engine bus constraint such as 64-bit or 128-bit. But PIX engine
> is usually (at least on platform I looked at) based on pixel format.
> 
> On CAMSS_2290, PIX BPL alignment is set to 0 to indicate that the
> alignment must be derived from the pixel format. This allows the
> pipeline to use camss_format_get_bpl_alignment().
> 
> For other platforms, retain the legacy PIX default (16 bytes), until
> PIX is properly tested/enabled.
> 
> A future improvement would be to remove platform-specific conditionals
> from the VFE code and move the alignment requirements into the
> per-platform VFE resource data.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/camss/camss-vfe.c | 28 ++++++++++++++++---
>  1 file changed, 24 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 9c7ad8aa4058..c174c7d706e2 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -1996,7 +1996,7 @@ static const struct media_entity_operations vfe_media_ops = {
>  	.link_validate = v4l2_subdev_link_validate,
>  };
>  
> -static int vfe_bpl_align(struct vfe_device *vfe)
> +static int vfe_bpl_align_rdi(struct vfe_device *vfe)
>  {
>  	int ret = 8;
>  
> @@ -2019,6 +2019,25 @@ static int vfe_bpl_align(struct vfe_device *vfe)
>  	return ret;
>  }
>  
> +static int vfe_bpl_align_pix(struct vfe_device *vfe)
> +{
> +	int ret = 16;
> +
> +	switch (vfe->camss->res->version) {
> +	case CAMSS_2290:
> +		/* The alignment/bpl depends solely on the pixel format and is
> +		 * computed dynamically in camss_format_get_bpl_alignment().

The immediate question to ask is whether this will be the case for all
other platforms, i.e. whether video->bpl_alignment will ever be nonzero
in patch 3

Konrad

