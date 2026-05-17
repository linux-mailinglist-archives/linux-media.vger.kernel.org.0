Return-Path: <linux-media+bounces-61860-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHGdIGX9CWpPvwQAu9opvQ
	(envelope-from <linux-media+bounces-61860-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 19:39:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F1B562A91
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 19:39:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9BF430574AE
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 17:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 005CF3CA4B8;
	Sun, 17 May 2026 17:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QYoMJOgo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J8Pr02zi"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2EB3C6A2B
	for <linux-media@vger.kernel.org>; Sun, 17 May 2026 17:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779039317; cv=none; b=BYOj4Uum8w9z35Lj5UNUqsvdojF0sXhsUt2K6X3gdAVk6YBF24xCsARDToU+EiBzKpQKBmFTpbJeaQUcckWoq2ILe7oCFDfhdDlvFDubKagKTZVA+sbQV5SwcFXsqx+KWys5Qe6N0c95Fi+T5FzGC1lGU/2eK0cOC3oU9jVD04o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779039317; c=relaxed/simple;
	bh=JJVvs8EUaddgUJ9aXVzqVHjbQkgsNK68CrmK7RkmTJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CKsPK70gCF/Fwr7vYNhVRt2YeMSTXXQZ2nvSxPzFwWq/hR1tjTFsMSUSB097ClCm8jfviN/JR/lzegSYu371QVG3kjBPKnx1UoHonOxlt01E7NllZ34svCA56NTADGClPS9vHhGOZ8Or07+B8+GRwvl0aqOLSfYoXHnHui3x400=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QYoMJOgo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J8Pr02zi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H6jtfi4083010
	for <linux-media@vger.kernel.org>; Sun, 17 May 2026 17:35:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ge/u/FoxPMtAYYqSHirTxFEl
	gHYs0GUb9O+1nJcyRys=; b=QYoMJOgoYozrIjeSBncJR/hfIYTkMgRtZKu5qLJs
	+XC5RQx2VqcM30rG84WKVK8vlBWLZbAvkR+XL5zZy/5nHpXagKt9AF4Vo60BLQBR
	8w2jzdIahHL5IKCvKMBlfT1h4HRxDALhIacbBcSZyUShSDW0WH8aBDECtjldAs9t
	HsQplNamxhnJrS8rviHXZZkaAC0gim7CIigQt4Who4/9dW51S0GoXT/pi3HIWjiI
	KZ2Ngvh6otsR5hvIepXk8OmQQHjlDnmnZfTtbQtI/SFVKCnZJSIxqLXHpJb/lb9u
	+8/dq12yT6B2RoVJt5YspVT7TGetIotsjxUQKhylgty0SA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0qb9rq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 17 May 2026 17:35:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5162ee45a77so43658111cf.1
        for <linux-media@vger.kernel.org>; Sun, 17 May 2026 10:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779039314; x=1779644114; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ge/u/FoxPMtAYYqSHirTxFElgHYs0GUb9O+1nJcyRys=;
        b=J8Pr02zi2rt/8b09zgqG/QB2VXpVsOPXAWVuonVBYSLROA8cRcbI8Grbm/y1CkGHnD
         WT2fhaoV+DqZnzCnNaRRB1mOC7ns9VrS7dJr1H16yECU4Me38JsRyeYYDlKObt/2g/qx
         VW2S4I9DYpiuBXKxALdXORsFmobf6s+C2z0ssPcAK3Qqn66rYJzynK3vkm8HorRqrLws
         9/FIQaC2KgbpDa+51ZQhWe7iy4XfHGAgs/KnQ/OR+jKY4i75lBHoU6L1aB9YL5GQoTRz
         3fwN3DUXTloIslLqWwaxUu0x9j3Z+QCvVhJVYdWVAyiGjLUYHhTgM6A36aYF0ALetrIA
         Ne0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779039314; x=1779644114;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ge/u/FoxPMtAYYqSHirTxFElgHYs0GUb9O+1nJcyRys=;
        b=c1SSEX5bYuMMJBJlQKM0ymupVsCAqIQHGHlHgkL09pPbyN7rphebO0df4bSgLn1m5I
         qp1VfJe3wLtAY2KMZP7CZRx5SwlzMlwX7U/PejkC9rvEr1Y8lPdwRaTcDcRUiWLaFHcW
         skBkrdSvi9zLYhCP4RVwC9r17NktRcTnpeR8lK8bhVayPJxd2B9Q879/Pou0DmjDCkOI
         32gkhymzhZnk58lbz+qavh01I/gxinGM+OqOFxFXVUEy9oXgNY7JhqvBQFhcl8CIYw93
         Ars1lYgWGipGLmNtAP4oo1k4QHt8M0QCoXDzyaJwHNLEhHqcL8uRrUUXRz6GemtRAdxS
         /S4A==
X-Forwarded-Encrypted: i=1; AFNElJ+xP+iAHzr6/eds1bwN7CogC+t3SKE3MFV39Ly5aJBKAmQMfG2lHP8K+ms5MKcX2t7ZL+KiPqIW/eTRng==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrQby/BbVYUXu/A1bpTRC6CcSHkGr+pVpI+WuUVrvFwsMas723
	ePZOQgBE/WKuz43UvlxrrvryVjIwLs8Es0vZAr39arJE/0wFT/L2WJWDB5Ml8G4d9+0TwAWO/Z3
	VIkPdoEgd2S9kzRHZmQpbl17vgpcs4Rlj5xdjF9LhCyyCVJ5MhSRkltF+gypY7iPBog==
X-Gm-Gg: Acq92OEI4WkGTER8yJUMyCdOmhbOa1PzOt/LCxFw9DqsPxt0HOy4smw1FBux11tj2JG
	Nwj/X9XQHyOYgaWU/E+SntHrgP6LZC851tbYXQwl1II4Ngxm0OVnT8AfSqd0PJiEGtdbzd8XHRl
	kXTmfEr1uxALBIaHMyES6nkLcxQYQEbY55bey3N30PNVNQTBvUuGxnYzQQkqRYT5raYkBFK9d74
	o1vsDQ2NvkT7jc2h9e9f1L5DTNR1LRhvrBlIZaTR4NarPWvp+X20eYDcdKni3eC1+Hm6zv2+6pA
	OVaXBsLr2xIWJhW4CmUp/HTDwJiWAgGn1f6woN+/cWcTYL7WVljtyTpbk1VGynKYqH81qGVOIPk
	VXap91/Rom+Tr9bfkM3pbfJE5oXMmDasuye5w2kfqIx4oG1v2zSzUwqXoJZpHI9WTEAdLlIzxwH
	0uMlKs3M+8gCKLDhN40VXN3aB4ZWvphWzi6Pw=
X-Received: by 2002:a05:622a:28c:b0:512:e813:7ce8 with SMTP id d75a77b69052e-5165a2674admr179787041cf.54.1779039314157;
        Sun, 17 May 2026 10:35:14 -0700 (PDT)
X-Received: by 2002:a05:622a:28c:b0:512:e813:7ce8 with SMTP id d75a77b69052e-5165a2674admr179786551cf.54.1779039313601;
        Sun, 17 May 2026 10:35:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a91e2b6d78sm2783884e87.82.2026.05.17.10.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 10:35:12 -0700 (PDT)
Date: Sun, 17 May 2026 20:35:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 06/14] media: iris: Add context bank hooks for
 platform specific initialization
Message-ID: <sqjbcmcy3wohzdiftb36i7ztfyt2k7mnxkrzxk5yuocpe7kfy6@ev2ouxxnf6cc>
References: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
 <20260515-glymur-v6-6-f6a99cb43a24@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515-glymur-v6-6-f6a99cb43a24@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: oJQnhtcd80a_CULa-mlvxfTt3kEGDKBf
X-Proofpoint-GUID: oJQnhtcd80a_CULa-mlvxfTt3kEGDKBf
X-Authority-Analysis: v=2.4 cv=fIMJG5ae c=1 sm=1 tr=0 ts=6a09fc52 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=KYVELAUBrDEXRFeio5oA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE4OSBTYWx0ZWRfX9ncq/i01z8Ar
 0xrSHUDxgnX3chOY0CCiGuUW0dxbB1h3JsrKCHJul03Iz+kFJgi2StPFI0GUdsLSpkLhBdF5r35
 yKv+6I4jrEECip6yZxawOJcJHf2CxjqcQtfsqd0XBhozPSOs2k16/RbdzWPPMQDRe2boXBdwK46
 KGnx6hu/vQBg6kIouKnO3p9mBO3wpRFXd6D5WIs4udga1mnhdwZexvD3bKkac2YL69rygxSkGie
 RcMvzLSMZFJ1kgjC49uS9DamhkheH/hwv5HkEIaOMJ0xtgjZKq5JSCs/+E2fUzNtg4tyylnef05
 0OoHeTcLOukfnVqjnc8U+SWDWLsLldCvVrbSTuXsYK18600oHPxWHO/dg8ARQCjExZV5EGmCXd/
 5wU9KtD+B8+SpAhVZCH/zzj6r8+G3krSyG8zrB57vWF86kD1t2VLSfFEd4QeoRUIer0JhotgUPZ
 TxNxgZWg5/pVxqUbPEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170189
X-Rspamd-Queue-Id: C9F1B562A91
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61860-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,linaro.org,gmail.com,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 04:51:21PM +0530, Vishnu Reddy wrote:
> The Glymur platform requires a dedicated firmware context bank device
> which is mapped to the firmware stream ID to load the firmware.

Why is it required on Glymur? Is it _only_ on Glymur?

> Add init and deinit hooks in the platform data for context bank setup.
> These hooks allow platform specific code to initialize and tear down
> context banks.
> 
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  .../platform/qcom/iris/iris_platform_common.h      |  2 ++
>  drivers/media/platform/qcom/iris/iris_probe.c      | 23 +++++++++++++++++++++-
>  2 files changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 6a108173be35..84fc68128c70 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -263,6 +263,8 @@ struct iris_platform_data {
>  	 */
>  	const struct iris_firmware_desc *firmware_desc;
>  
> +	int (*init_cb_devs)(struct iris_core *core);
> +	void (*deinit_cb_devs)(struct iris_core *core);

Why are they being added directly to iris_platform_data? Why not the
vpu_ops?

>  	const struct vpu_ops *vpu_ops;
>  	const struct icc_info *icc_tbl;
>  	unsigned int icc_tbl_size;

-- 
With best wishes
Dmitry

