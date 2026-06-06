Return-Path: <linux-media+bounces-63996-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6vf7FNfNI2oGzAEAu9opvQ
	(envelope-from <linux-media+bounces-63996-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 09:35:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FF264CDB7
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 09:35:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=O4edS4FB;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=B1ZKZuNs;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63996-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63996-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 782833028F00
	for <lists+linux-media@lfdr.de>; Sat,  6 Jun 2026 07:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19AD42798F3;
	Sat,  6 Jun 2026 07:35:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9497D25D530
	for <linux-media@vger.kernel.org>; Sat,  6 Jun 2026 07:35:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780731322; cv=none; b=VYn6yd4RGEZS3GuKwVRwugqIcK6T/+VpOxl+PzhccTtRN80QUaEODK+1eksCfqXEmurRO+HrdllfaHsepgGoR/+Kx8QCihPG2KTM9EVmSxNUSCkK5h7Fr/ortOHZIrO2Nk6GcPQMq6hP2PSZ6HE9qZeu+gO/9NxH88C4VEwnC0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780731322; c=relaxed/simple;
	bh=/oDCS3eOUgngfS7/IU3V1g33L6zvRMNLrNAeONBh+dY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qt6tz6jX4mIar5JypRrCes6M+RzgMjBS6ni9ytcpc5ZpTP96BzNuvOuSIOVIoTV7Qp4CTVG0mD002w+wzit2dX3jyA5PE+W8zICPY1B696Cv5U+LTGV3GvavrsY3Jsy4e+MRQzmmdG2cUGLhNLvHARe/AMR42ZZJ6yjKt0BG8Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O4edS4FB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B1ZKZuNs; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656631Y1613029
	for <linux-media@vger.kernel.org>; Sat, 6 Jun 2026 07:35:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2X4zrvGrRxpvhXWxOp6gjbBk
	hg/3kjiMxAtkmz08Tqc=; b=O4edS4FBoF0pm7jdho1tOlp9XgJ6+pWx8A/Lu+9z
	ZVrr1g0quPggPG7pbNVtzhUMgstl9rAYVJ2QeOqWK7ch9ncui2i1czYxDIAd683+
	sA1IlNEbtavZXWIXhO4j0bGCGN+eUaL3QC4QTvf75h8zD4uuyw7XlLqM02XMdtod
	S7sTU5ehBHYd1eNNqlGb3adjwCNBvUo6fDWl++JEku1mI/k1gs6oKJB+kTGCl1u+
	q9DQ/QWd/macb+LuA8G9nhvzC58rCx4W8W92Yw+9I3zYGjeFvcEC7Daxux7QVK5c
	nX5tZg8/yap61swjz3U1jXa2vVK8XtlZgpJGH5bXf7//7Q==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emavf0r81-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 06 Jun 2026 07:35:19 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6c6dc39a6afso1670249137.3
        for <linux-media@vger.kernel.org>; Sat, 06 Jun 2026 00:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780731319; x=1781336119; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2X4zrvGrRxpvhXWxOp6gjbBkhg/3kjiMxAtkmz08Tqc=;
        b=B1ZKZuNsJ73epr1HEcpk5UGRf2EBGGt+cfm+LUfBB4TgJhHRvkc8hiW59/4etISX/8
         A1MZSegM0Osz45z9NyKzwP0i6V63Ov4O3oQT17aLtZygYe8VdbRhVeLfhCPyaEAea1je
         tS1c/LiwYYahiVACEW2ZFX2cbyC6vMC0Ybl829m7HkG5jsTvb+6J8baE8v6G8EuhqXZg
         yQuwGmBmi7y6H5VqGCth6zYrqSSEg14ibHWq9ReeXXvpZrvdBW2WJxAeYDGRbR3ro3HD
         cxmfLy0n63tU5kCDFIqbaSDhiTL19pSdjSxkeb+EYIQY+tSJ3v6hObGkTlUDSJXJW3m4
         IqGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780731319; x=1781336119;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2X4zrvGrRxpvhXWxOp6gjbBkhg/3kjiMxAtkmz08Tqc=;
        b=iS5B+hjXw9FHHjX6NUWp4VzUiu8Kaa9e09dN0M3f3enb9/+owIPXE7my68nUSMLKUr
         tRtA5BEoA7wYppT/+J0w7SGzT9fpBONCTXXuXS31/ZoSJPwTQxKqxaug3htGNQQPq8FO
         +0xJ2C7a4Ral3dTU6UkaVKaNOV1WCxnh1L3m3LBAwydSmNg9TQvWGo/nbAkbS6cGBip4
         5+E4CAJPWoig+4mTnLg1d2zPu4kqwGqeeUI9SuU2/kDNFDpeTjS99iR0DYr1hodpPXDu
         47MKfydItAT2QF8eACLr3jF7XjdMh/JHhyzvNuaWKMs9veocXyyX+tkKZuToiKZdrdMl
         N31w==
X-Forwarded-Encrypted: i=1; AFNElJ8I3JQCohs95L6oHbhXLaEyjo46hwUvTXAjwfYxO7Et+9XRN2NqWcnKji0WO1Bpy94ZSnp6ba3bv/ROWg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm9zGmXVxGt3zuYxMtUETsI+dU2w04qhud3rajrQOciz9umvoG
	fPUEaENc+aszvvMd72C1Jnw8MLxGVjZdwzBCdea1m+dpP8eX25NXg96aInhkp7JzE7igceS3bEh
	TV6NeoYelIgvvCWXwohKpFrh3JGVDROP/I8pKmeqVaV63U2mHwE7anThVlzzlMCzcJw==
X-Gm-Gg: Acq92OEohD4IwWQ5Z0JouxSNFfrp20FyZlvBeHipnKV+S//we0i1cu1IQfwUEyapE+E
	ac0L+PLcgUgw8cPo1QSqyPOPoOqAM9393HmzlkS81nD6csmhpUb+B3QWulNiFsX5wLINBkLWRgq
	VaJupet5ZInH6W2xVwhiPDfDDuVa0bi6nWBu8TlRxfNJ/6wZjUg5ERK5Ie2hkhy182vZ7M4ap1i
	kYQ3cr3FVfM8IBELeYyjj5oR+Ono/W5KSUDuExh1v3urjncIT0HmHCclE2XQ1dE+RZpUeD090ad
	gfsgJ9Q+r1nvBb89gF92xSaCdtz1+XWqcYwVhnAl/5sqNaTQ6z2d42EvFxIBNBfQVJma5DzLA8K
	2zJK5GoHGBQUMW+ofmJ1S3j3QVbAWHk9sbhUYQ1EovuPZ+nN4Zh8rWCgBzWSM/s1e5d3fGMqhhM
	wjX5mIUEdFjiie7QabJY8oRyiFrAvGViygBma/GZA745wHcg==
X-Received: by 2002:a05:6102:4485:b0:66b:a0d7:abc4 with SMTP id ada2fe7eead31-6fee79766bamr3658490137.0.1780731318841;
        Sat, 06 Jun 2026 00:35:18 -0700 (PDT)
X-Received: by 2002:a05:6102:4485:b0:66b:a0d7:abc4 with SMTP id ada2fe7eead31-6fee79766bamr3658483137.0.1780731318393;
        Sat, 06 Jun 2026 00:35:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b99ca90sm2341905e87.84.2026.06.06.00.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 00:35:17 -0700 (PDT)
Date: Sat, 6 Jun 2026 10:35:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ruoyu Wang <ruoyuw560@gmail.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: iris: check decoder format allocations
Message-ID: <6nsm3ijxlxfw5n7cyntfo2hx7zppnttne6xvmnywe7ydfw372l@rmubfdchimj7>
References: <20260606040736.13-1-ruoyuw560@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260606040736.13-1-ruoyuw560@gmail.com>
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a23cdb7 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8
 a=U62o5wFZXXwz9zNoNkkA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: OOtcisGxRABDOmRHkMwat6IGcqIzabdB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDA3MyBTYWx0ZWRfXxACTKf+H61MN
 o7h/MUBroOx5vjE/1CqT4RGG4bXObiQ6+7BLN34BOmKDzAPtkf0CI1ovkpxYyKsyI45IBkAS+jX
 jATy3oHAMp1/w99qjnWozW8Rd/XB/jS3vIB6LDaUnMWZiVzYGL+ynYIFBUQFzftmxRFrgQ7rw2A
 ZXxcndMDn9Y0Qx8/fHAQUjd4vYIE0gPp4DWABb0qcghbFzFdasvy1XJdGX7XBJcsE2le/+yd0oj
 Tn9+/zTZftAJaICZoClxlgABcD4QhB7aULi10IIetqzftFah03lzy+MqdNttNoSvYh9b6xKzQYj
 SfHj4eZYbVz8ILnAh8CQ/uL/PxhbaWMC4SSa8U02TPmWHKGYPBnOKVxbsB6IVHwmq08637FTjgc
 UDHrDeNLHgM2uW7dA0KwQ2psQbt0IljlYdJpvd4Q9lLTUSfpUFgtOgwfxQL2o1/NtNjXtTVbqMh
 R+iGZYL5VnPwoKdZrvQ==
X-Proofpoint-GUID: OOtcisGxRABDOmRHkMwat6IGcqIzabdB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060073
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63996-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,qualcomm.com:dkim,rmubfdchimj7:mid];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ruoyuw560@gmail.com,m:quic_vgarodia@quicinc.com,m:quic_dikshita@quicinc.com,m:abhinav.kumar@linux.dev,m:bryan.odonoghue@linaro.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A6FF264CDB7

On Sat, Jun 06, 2026 at 12:07:36PM +0800, Ruoyu Wang wrote:
> iris_vdec_inst_init() allocates the source and destination v4l2_format
> structures and then immediately writes fields through inst->fmt_src and
> inst->fmt_dst. Either allocation can fail, leading to a NULL pointer
> dereference during instance initialization.
> 
> Check both allocations before initializing the formats. Free any partial
> allocation, clear the instance pointers so later cleanup does not see
> dangling values, and return -ENOMEM so the open path can unwind the
> instance.
> 
> Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vdec.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index 99d544e2af4f9..dd18079a9ea5f 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -23,6 +23,13 @@ int iris_vdec_inst_init(struct iris_inst *inst)
>  
>  	inst->fmt_src = kzalloc_obj(*inst->fmt_src);
>  	inst->fmt_dst = kzalloc_obj(*inst->fmt_dst);
> +	if (!inst->fmt_src || !inst->fmt_dst) {
> +		kfree(inst->fmt_src);
> +		kfree(inst->fmt_dst);
> +		inst->fmt_src = NULL;
> +		inst->fmt_dst = NULL;
> +		return -ENOMEM;
> +	}

I'd rather see the check for the allocated objects before they are
assigned to the fields in the instance.

>  
>  	inst->fw_min_count = MIN_BUFFERS;
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

