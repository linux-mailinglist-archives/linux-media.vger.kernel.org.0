Return-Path: <linux-media+bounces-63744-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id R5KGDigWIWom/AAAu9opvQ
	(envelope-from <linux-media+bounces-63744-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 08:07:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD3263D266
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 08:07:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=e1yUMGRy;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=aHbe80z9;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63744-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63744-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F662305749E
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 06:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A8953D5253;
	Thu,  4 Jun 2026 06:01:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C612C3D45EA
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 06:01:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780552900; cv=none; b=b4VZ4kqH+2RiTUHtDZM8D8s4zFHMvJMFU+amgFbSGBSaf6OGtFinVKkEjN2RbuEQEFohQg7UYg+l9WQ9ObZZwUe2NIAMu0y2fN1DA8VTHL+j8ja7HIx0Yx6UjQppeZAmEduzrPicRMH2YyJRmIPyGp7BBBiQ3ccC/SGkjcqA4Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780552900; c=relaxed/simple;
	bh=Q9iml5+cIOrwPea5SWWDmv93aIkO2YViTlIqgmM6lfY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=tz8QPm8cA/iqfcW/liEw+coRt8vQduuVOkkvmJeGq5I2M2nscFoGT4YI1+gkTa7x6xnf7IgW0X6C/xeEr4hM9lIUNmKbto1omPtIsbaoSibw6UHkXW0bsJJQwKvV2sXBxDmR7gcy1soahy8njVHNmGlPm/ZcHhQ4+5ywTbQLaeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e1yUMGRy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aHbe80z9; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6545PkBl994674
	for <linux-media@vger.kernel.org>; Thu, 4 Jun 2026 06:01:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vgMcHXWLxHer1AzSTGACyC0V8RtVSpDnTYL35scTTkg=; b=e1yUMGRywVgFYjkY
	gnlvIpjwQ4xjPfqOZNqSFNz9farpk2wM3HhD2sWHIKZinUz1uuyiD4lRHjGPW5px
	UDAHrAmjU3ocksYS8PlGxyeY0+MRLn8g3t2QUiCa8zWvx6jWtyFOgp+sPQvzfTN2
	2wKkoFd28kPYiJyEQ00P0Z+NBoly8c90+Rfe64OPe0QFC4azwyAgwIcm0K+GPx2g
	VfzkwTTouFHskaFHpSh7WYzPdOurmShLxcdmraVtvQlJTlIHJRQ6iZ95LVklXPtG
	7o9zrTV1IP8acIdx/EBBYWXDjZlxIi/9kZ1gLLeNENhibGABpwBniBUPR6gUI5ID
	4rvLBA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek374r39p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 04 Jun 2026 06:01:37 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d97415004so715487a91.2
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 23:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780552897; x=1781157697; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vgMcHXWLxHer1AzSTGACyC0V8RtVSpDnTYL35scTTkg=;
        b=aHbe80z9sqOfp8gZibreCxEUGQwRl+JhFo7zMBTD4UW61p8gvSjevxEwU9ZHVg/2LG
         Kx2ZSvVGrDpEkAFovtQmpNTO4pEfvL9wvNQKEnfF1Xvn0KQZbRtqU8ubrwn3CK/Gvd8k
         c7f4qjk8XpCk4pm1jMkn079JQeTrzzOwEC1j2YSHgXwqcRMWBCbAsr5LjjBoHvv4JJsH
         l6Xbz2J59mVOSa/SabTVUr+auslmqDq7mfmLm7+L6IXwuhJUWudxI6CEcHc8W1NYjvSl
         S19tOOj82d8fWXrmUZ/VlV/i3EVvlFXnLHQwhUN0/o8JePJkafvpKR2XYJkMx2YfvE9u
         RUWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780552897; x=1781157697;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vgMcHXWLxHer1AzSTGACyC0V8RtVSpDnTYL35scTTkg=;
        b=ClCjApMDqZ9tvs/zY5SlkLrrharFC1bigwq3cNd3kJSmvdWxQglhW+OWLwjZRpCsHM
         UqiFehxUqWFiWiV85erQQhibIy8hdXIBDxf+L87AIyl5+tsuirA02zHYjSUxWVH0St3q
         1r8QwdWZr8nta3RmRPKAxz+AEOefxINiDxpSrUHGBLfKFCjeiWoAWr/uh26MtJ12HHP8
         JuOPRWx5OdkDXH0g8zmwk0wExwL3PO12DkdXYkCTOpc637+mSvOF0C8iCL+Rl0/CgkCG
         ZHnGCMNncD2iJuwdkEPxa0TTMYrn60D4iNlet8jyJQauhgBx752V6LodsiU1y9keFyFy
         06kA==
X-Gm-Message-State: AOJu0YwQGji6B+tPB0m2FprCIuOxTLVDg0nm7APdtuIcRyKM7WJgTwla
	7tzOH8a8o2sAbqXhkafJSkTYD04Bu7hhobzoyNQ+U6R+OojbWO7b27Uyw184FdKbKjDnmgOy/db
	ScRZv3pWQV6hYBDIVeCOsN2R75qw0OrwbivCkLUbilg4Q8Yz/QPN9lByiUWl//zc50w==
X-Gm-Gg: Acq92OFK3BB/Yl9NsoGDrShl/DVQ7YbEycVULRwqbNs4ccgJs8JNrOtVHQYDN2jcxD4
	o4AbtWsHMcZj8aL8eWTA70n9I6A3ZG4l8oYdeCXDBHxRzxxx8kfk9GSHBzlf7f976ygvA83oD9g
	/udIPQTMOs+9xoZ7l0sAamhnxZuHQBTVTb7+e2bJ5tlyavFeidVCJ1LBs9onNWkXzsfIgtbKNJG
	AoI7CVjjT+DaxDR357amRuhPwxIYqinOnnT+3Zyd7B1P8FY6HHRBTCXi+Y3aSl9qsUJDaSNJaCr
	iwY2f+1rBCA/qAE7KeqZraAT/Ax+mhmfe/4sIGMxdako3PFNcoSEYN9hnZITP2pIKSw+5WDmDXj
	HOx7GxJDRgX0eXzze/6/jvzPt9BAV4quvmLWqbc5CkM1vuQuW2OwFZQPi3yIN/CAu
X-Received: by 2002:a17:903:b08:b0:2c1:1aa7:b17e with SMTP id d9443c01a7336-2c1644a7572mr77698965ad.30.1780552896986;
        Wed, 03 Jun 2026 23:01:36 -0700 (PDT)
X-Received: by 2002:a17:903:b08:b0:2c1:1aa7:b17e with SMTP id d9443c01a7336-2c1644a7572mr77698345ad.30.1780552896372;
        Wed, 03 Jun 2026 23:01:36 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e0a2sm46755135ad.46.2026.06.03.23.01.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 23:01:35 -0700 (PDT)
Message-ID: <a17e8272-b8c9-e6b6-6f5f-adf3f0f91424@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 11:31:29 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] media: iris: Add support for Milos (VPU v2.0)
To: Alexander Koskovich <akoskovich@pm.me>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260529-milos-iris-v2-0-7a763d7195ae@pm.me>
 <20260529-milos-iris-v2-2-7a763d7195ae@pm.me>
Content-Language: en-US
In-Reply-To: <20260529-milos-iris-v2-2-7a763d7195ae@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA1NiBTYWx0ZWRfX1u6oFps1qHmX
 ax5sFuLPEzpSEC/CyqIRNHN64XPy/MvyKrlVFv074tVkO3QPISVS4FAkAvzVn2ksGxzH0z0KQeX
 WWwm/HfZjxxrbWKBr8AdZLMx/iIKcVxEqHsM7CYZzZdcvQfqmq6vz6EjgqbcFy8s783OM/c2Ys2
 er3hii59iw1vfhIj818WLSNPJXU7BzJ2KOF4CXiLxlxla9G8bLGFIyox9M/hjKYxsP5k7By+fL2
 blzxi6CGIyYmI+woqUCmn9bxWUzl1UhdLt1e/odGwMLNuBgOmfpSSPVyhkG/imRt4/MtEjtYwKG
 gd9K32kYuszqsdfeQrkhVCts/MN/klok5idGhdtN93LcraYs1OgtDW19YZDnKhnTWq2EKQjcA/B
 AwxErW56I0riKl1AmHZVtTudYRG/r1oEIPF16qVgio+QAyDPpAMs8S6YuCMnB/XYg0Nmpej5VLh
 b8QPJa+KxpVTMh/rNkg==
X-Proofpoint-GUID: oXv6XIWoWOrzeOjhzuQ7WYIfB6nj8zNA
X-Proofpoint-ORIG-GUID: oXv6XIWoWOrzeOjhzuQ7WYIfB6nj8zNA
X-Authority-Analysis: v=2.4 cv=eJsjSnp1 c=1 sm=1 tr=0 ts=6a2114c1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=WWx18bVetcVHrjZ2v5UA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040056
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63744-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pm.me:email,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:akoskovich@pm.me,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7CD3263D266


On 5/30/2026 2:28 AM, Alexander Koskovich wrote:
> Add support for the Milos Iris codec. This only supports the variant
> found on the SM7635-AB that has half of it's pipes disabled via efuse.
>
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  .../platform/qcom/iris/iris_platform_common.h      |   1 +
>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 106 ++++
>  .../media/platform/qcom/iris/iris_platform_milos.h | 655 +++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
>  4 files changed, 766 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 5a489917580e..c8a9f122952e 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -41,6 +41,7 @@ enum pipe_type {
>  	PIPE_4 = 4,
>  };
>  
> +extern const struct iris_platform_data milos_data;
>  extern const struct iris_platform_data qcs8300_data;
>  extern const struct iris_platform_data sc7280_data;
>  extern const struct iris_platform_data sm8250_data;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 5da90d47f9c6..1690e463c8ce 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c

This patch appears to be based on an older codebase. There are changes already
merged in this file prior to your submission. Please work on latest code base.

> @@ -12,6 +12,7 @@
>  #include "iris_vpu_buffer.h"
>  #include "iris_vpu_common.h"
>  
> +#include "iris_platform_milos.h"
>  #include "iris_platform_qcs8300.h"
>  #include "iris_platform_sm8650.h"
>  #include "iris_platform_sm8750.h"
> @@ -1317,3 +1318,108 @@ const struct iris_platform_data qcs8300_data = {
>  	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
>  	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
>  };
> +
> +/*
> + * Shares most of SM8550 data except:
> + * - vpu_ops to iris_vpu2_ops
> + * - icc_tbl to milos_icc_table
> + * - clk_rst_tbl to sm8650_clk_reset_table
> + * - opp_pd_tbl to milos_opp_pd_table
> + * - fwname to "qcom/vpu/vpu20_p2.mbn"
> + * - inst_iris_fmts to platform_fmts_milos_dec
> + * - inst_caps to platform_inst_cap_milos
> + * - inst_fw_caps_dec to inst_fw_cap_milos_dec
> + * - inst_fw_caps_enc to inst_fw_cap_milos_enc
> + * - ubwc_config to ubwc_config_milos
> + * - num_vpp_pipe to 2
> + * - max_core_mbpf scaled for 4k@30fps dec/enc
> + * - max_core_mbps scaled for 4k@30fps dec & 1080p@30 enc
> + */
> +const struct iris_platform_data milos_data = {
> +	.get_instance = iris_hfi_gen2_get_instance,
> +	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
> +	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
> +	.get_vpu_buffer_size = iris_vpu_buf_size,
> +	.vpu_ops = &iris_vpu2_ops,
> +	.set_preset_registers = iris_set_sm8550_preset_registers,
> +	.icc_tbl = milos_icc_table,
> +	.icc_tbl_size = ARRAY_SIZE(milos_icc_table),
> +	.clk_rst_tbl = sm8650_clk_reset_table,
> +	.clk_rst_tbl_size = ARRAY_SIZE(sm8650_clk_reset_table),
> +	.bw_tbl_dec = sm8550_bw_table_dec,
> +	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
> +	.pmdomain_tbl = sm8550_pmdomain_table,
> +	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
> +	.opp_pd_tbl = milos_opp_pd_table,
> +	.opp_pd_tbl_size = ARRAY_SIZE(milos_opp_pd_table),
> +	.clk_tbl = sm8550_clk_table,
> +	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
> +	.opp_clk_tbl = sm8550_opp_clk_table,
> +	/* Upper bound of DMA address range */
> +	.dma_mask = 0xe0000000 - 1,
> +	.fwname = "qcom/vpu/vpu20_p2.mbn",
> +	.pas_id = IRIS_PAS_ID,
> +	.inst_iris_fmts = platform_fmts_milos_dec,
> +	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_milos_dec),
> +	.inst_caps = &platform_inst_cap_milos,
> +	.inst_fw_caps_dec = inst_fw_cap_milos_dec,
> +	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_milos_dec),
> +	.inst_fw_caps_enc = inst_fw_cap_milos_enc,
> +	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_milos_enc),
> +	.tz_cp_config_data = tz_cp_config_sm8550,
> +	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
> +	.core_arch = VIDEO_ARCH_LX,
> +	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> +	.ubwc_config = &ubwc_config_milos,
> +	.num_vpp_pipe = 2,
> +	.max_session_count = 16,
> +	.max_core_mbpf = ((4096 * 2176) / 256) * 2,
> +	.max_core_mbps = ((3840 * 2176) / 256) * 30 + ((1920 * 1088) / 256) * 30,
> +	.dec_input_config_params_default =
> +		sm8550_vdec_input_config_params_default,
> +	.dec_input_config_params_default_size =
> +		ARRAY_SIZE(sm8550_vdec_input_config_params_default),
> +	.dec_input_config_params_hevc =
> +		sm8550_vdec_input_config_param_hevc,
> +	.dec_input_config_params_hevc_size =
> +		ARRAY_SIZE(sm8550_vdec_input_config_param_hevc),
> +	.dec_input_config_params_vp9 =
> +		sm8550_vdec_input_config_param_vp9,
> +	.dec_input_config_params_vp9_size =
> +		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
> +	.dec_output_config_params =
> +		sm8550_vdec_output_config_params,
> +	.dec_output_config_params_size =
> +		ARRAY_SIZE(sm8550_vdec_output_config_params),
> +
> +	.enc_input_config_params =
> +		sm8550_venc_input_config_params,
> +	.enc_input_config_params_size =
> +		ARRAY_SIZE(sm8550_venc_input_config_params),
> +	.enc_output_config_params =
> +		sm8550_venc_output_config_params,
> +	.enc_output_config_params_size =
> +		ARRAY_SIZE(sm8550_venc_output_config_params),
> +
> +	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
> +	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
> +	.dec_output_prop_avc = sm8550_vdec_subscribe_output_properties_avc,
> +	.dec_output_prop_avc_size =
> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_avc),
> +	.dec_output_prop_hevc = sm8550_vdec_subscribe_output_properties_hevc,
> +	.dec_output_prop_hevc_size =
> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_hevc),
> +	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
> +	.dec_output_prop_vp9_size =
> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
> +
> +	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
> +	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
> +	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
> +	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
> +
> +	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
> +	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
> +	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
> +	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
> +};
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_milos.h b/drivers/media/platform/qcom/iris/iris_platform_milos.h
> new file mode 100644
> index 000000000000..dacd3ad5aa7e
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_platform_milos.h
> @@ -0,0 +1,655 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __IRIS_PLATFORM_MILOS_H__
> +#define __IRIS_PLATFORM_MILOS_H__
> +
> +#define MILOS_V1_MAX_BITRATE	100000000
> +#define MILOS_V1_MAX_FPS	240
> +
> +static struct iris_fmt platform_fmts_milos_dec[] = {
> +	[IRIS_FMT_H264] = {
> +		.pixfmt = V4L2_PIX_FMT_H264,
> +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +	},
> +	[IRIS_FMT_HEVC] = {
> +		.pixfmt = V4L2_PIX_FMT_HEVC,
> +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +	},
> +	[IRIS_FMT_VP9] = {
> +		.pixfmt = V4L2_PIX_FMT_VP9,
> +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +	},
> +};
> +
> +static const struct platform_inst_fw_cap inst_fw_cap_milos_dec[] = {
> +	{
> +		.cap_id = PROFILE_H264,
> +		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
> +		.max = V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
> +				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
> +				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
> +				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH) |
> +				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH),
> +		.value = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> +		.hfi_id = HFI_PROP_PROFILE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_u32_enum,
> +	},
> +	{
> +		.cap_id = PROFILE_HEVC,
> +		.min = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
> +		.max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
> +		.value = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
> +		.hfi_id = HFI_PROP_PROFILE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_u32_enum,
> +	},
> +	{
> +		.cap_id = PROFILE_VP9,
> +		.min = V4L2_MPEG_VIDEO_VP9_PROFILE_0,
> +		.max = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_VP9_PROFILE_0) |
> +				BIT(V4L2_MPEG_VIDEO_VP9_PROFILE_2),
> +		.value = V4L2_MPEG_VIDEO_VP9_PROFILE_0,
> +		.hfi_id = HFI_PROP_PROFILE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_u32_enum,
> +	},
> +	{
> +		.cap_id = LEVEL_H264,
> +		.min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
> +		.max = V4L2_MPEG_VIDEO_H264_LEVEL_5_1,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1B) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_1) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_2) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_3) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_1) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_2) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_1) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_2) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_0) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_1) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_2) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_0) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_1),
> +		.value = V4L2_MPEG_VIDEO_H264_LEVEL_5_1,
> +		.hfi_id = HFI_PROP_LEVEL,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_u32_enum,
> +	},
> +	{
> +		.cap_id = LEVEL_HEVC,
> +		.min = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
> +		.max = V4L2_MPEG_VIDEO_HEVC_LEVEL_5,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_1) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5),
> +		.value = V4L2_MPEG_VIDEO_HEVC_LEVEL_5,
> +		.hfi_id = HFI_PROP_LEVEL,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_u32_enum,
> +	},
> +	{
> +		.cap_id = LEVEL_VP9,
> +		.min = V4L2_MPEG_VIDEO_VP9_LEVEL_1_0,
> +		.max = V4L2_MPEG_VIDEO_VP9_LEVEL_5_0,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_1_0) |
> +				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_1_1) |
> +				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_2_0) |
> +				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_2_1) |
> +				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_3_0) |
> +				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_3_1) |
> +				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_4_0) |
> +				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_4_1) |
> +				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_5_0),
> +		.value = V4L2_MPEG_VIDEO_VP9_LEVEL_5_0,
> +		.hfi_id = HFI_PROP_LEVEL,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_u32_enum,
> +	},
> +	{
> +		.cap_id = TIER,
> +		.min = V4L2_MPEG_VIDEO_HEVC_TIER_MAIN,
> +		.max = V4L2_MPEG_VIDEO_HEVC_TIER_HIGH,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_TIER_MAIN) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_TIER_HIGH),
> +		.value = V4L2_MPEG_VIDEO_HEVC_TIER_HIGH,
> +		.hfi_id = HFI_PROP_TIER,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_u32_enum,
> +	},
> +	{
> +		.cap_id = INPUT_BUF_HOST_MAX_COUNT,
> +		.min = DEFAULT_MAX_HOST_BUF_COUNT,
> +		.max = DEFAULT_MAX_HOST_BURST_BUF_COUNT,
> +		.step_or_mask = 1,
> +		.value = DEFAULT_MAX_HOST_BUF_COUNT,
> +		.hfi_id = HFI_PROP_BUFFER_HOST_MAX_COUNT,
> +		.flags = CAP_FLAG_INPUT_PORT,
> +		.set = iris_set_u32,
> +	},
> +	{
> +		.cap_id = STAGE,
> +		.min = STAGE_1,
> +		.max = STAGE_2,
> +		.step_or_mask = 1,
> +		.value = STAGE_2,
> +		.hfi_id = HFI_PROP_STAGE,
> +		.set = iris_set_stage,
> +	},
> +	{
> +		.cap_id = PIPE,
> +		/* .max, .min and .value are set via platform data */
> +		.step_or_mask = 1,
> +		.hfi_id = HFI_PROP_PIPE,
> +		.set = iris_set_pipe,
> +	},
> +	{
> +		.cap_id = POC,
> +		.min = 0,
> +		.max = 2,
> +		.step_or_mask = 1,
> +		.value = 1,
> +		.hfi_id = HFI_PROP_PIC_ORDER_CNT_TYPE,
> +	},
> +	{
> +		.cap_id = CODED_FRAMES,
> +		.min = CODED_FRAMES_PROGRESSIVE,
> +		.max = CODED_FRAMES_PROGRESSIVE,
> +		.step_or_mask = 0,
> +		.value = CODED_FRAMES_PROGRESSIVE,
> +		.hfi_id = HFI_PROP_CODED_FRAMES,
> +	},
> +	{
> +		.cap_id = BIT_DEPTH,
> +		.min = BIT_DEPTH_8,
> +		.max = BIT_DEPTH_8,
> +		.step_or_mask = 1,
> +		.value = BIT_DEPTH_8,
> +		.hfi_id = HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
> +	},
> +	{
> +		.cap_id = RAP_FRAME,
> +		.min = 0,
> +		.max = 1,
> +		.step_or_mask = 1,
> +		.value = 1,
> +		.hfi_id = HFI_PROP_DEC_START_FROM_RAP_FRAME,
> +		.flags = CAP_FLAG_INPUT_PORT,
> +		.set = iris_set_u32,
> +	},
> +};
> +
> +static const struct platform_inst_fw_cap inst_fw_cap_milos_enc[] = {
> +	{
> +		.cap_id = PROFILE_H264,
> +		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
> +		.max = V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
> +				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH) |
> +				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
> +				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
> +				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH),
> +		.value = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> +		.hfi_id = HFI_PROP_PROFILE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_profile,
> +	},
> +	{
> +		.cap_id = PROFILE_HEVC,
> +		.min = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
> +		.max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10),
> +		.value = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
> +		.hfi_id = HFI_PROP_PROFILE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_profile,
> +	},
> +	{
> +		.cap_id = LEVEL_H264,
> +		.min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
> +		.max = V4L2_MPEG_VIDEO_H264_LEVEL_5_1,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1B) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_1) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_2) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_3) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_1) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_2) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_1) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_2) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_0) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_1) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_2) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_0) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_1),
> +		.value = V4L2_MPEG_VIDEO_H264_LEVEL_5_0,
> +		.hfi_id = HFI_PROP_LEVEL,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_level,
> +	},
> +	{
> +		.cap_id = LEVEL_HEVC,
> +		.min = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
> +		.max = V4L2_MPEG_VIDEO_HEVC_LEVEL_5,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_1) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5),
> +		.value = V4L2_MPEG_VIDEO_HEVC_LEVEL_5,
> +		.hfi_id = HFI_PROP_LEVEL,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_level,
> +	},
> +	{
> +		.cap_id = STAGE,
> +		.min = STAGE_1,
> +		.max = STAGE_2,
> +		.step_or_mask = 1,
> +		.value = STAGE_2,
> +		.hfi_id = HFI_PROP_STAGE,
> +		.set = iris_set_stage,
> +	},
> +	{
> +		.cap_id = HEADER_MODE,
> +		.min = V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE,
> +		.max = V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE) |
> +				BIT(V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME),
> +		.value = V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
> +		.hfi_id = HFI_PROP_SEQ_HEADER_MODE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_header_mode_gen2,
> +	},
> +	{
> +		.cap_id = PREPEND_SPSPPS_TO_IDR,
> +		.min = 0,
> +		.max = 1,
> +		.step_or_mask = 1,
> +		.value = 0,
> +	},
> +	{
> +		.cap_id = BITRATE,
> +		.min = 1,
> +		.max = MILOS_V1_MAX_BITRATE,
> +		.step_or_mask = 1,
> +		.value = BITRATE_DEFAULT,
> +		.hfi_id = HFI_PROP_TOTAL_BITRATE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_bitrate,
> +	},
> +	{
> +		.cap_id = BITRATE_PEAK,
> +		.min = 1,
> +		.max = MILOS_V1_MAX_BITRATE,
> +		.step_or_mask = 1,
> +		.value = BITRATE_DEFAULT,
> +		.hfi_id = HFI_PROP_TOTAL_PEAK_BITRATE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_peak_bitrate,
> +	},
> +	{
> +		.cap_id = BITRATE_MODE,
> +		.min = V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
> +		.max = V4L2_MPEG_VIDEO_BITRATE_MODE_CBR,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_BITRATE_MODE_VBR) |
> +				BIT(V4L2_MPEG_VIDEO_BITRATE_MODE_CBR),
> +		.value = V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
> +		.hfi_id = HFI_PROP_RATE_CONTROL,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_bitrate_mode_gen2,
> +	},
> +	{
> +		.cap_id = FRAME_SKIP_MODE,
> +		.min = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
> +		.max = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED) |
> +				BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_LEVEL_LIMIT) |
> +				BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT),
> +		.value = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +	},
> +	{
> +		.cap_id = FRAME_RC_ENABLE,
> +		.min = 0,
> +		.max = 1,
> +		.step_or_mask = 1,
> +		.value = 1,
> +	},
> +	{
> +		.cap_id = GOP_SIZE,
> +		.min = 0,
> +		.max = INT_MAX,
> +		.step_or_mask = 1,
> +		.value = 2 * DEFAULT_FPS - 1,
> +		.hfi_id = HFI_PROP_MAX_GOP_FRAMES,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_u32,
> +	},
> +	{
> +		.cap_id = ENTROPY_MODE,
> +		.min = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC,
> +		.max = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC) |
> +				BIT(V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC),
> +		.value = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC,
> +		.hfi_id = HFI_PROP_CABAC_SESSION,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_entropy_mode_gen2,
> +	},
> +	{
> +		.cap_id = MIN_FRAME_QP_H264,
> +		.min = MIN_QP_8BIT,
> +		.max = MAX_QP,
> +		.step_or_mask = 1,
> +		.value = MIN_QP_8BIT,
> +		.hfi_id = HFI_PROP_MIN_QP_PACKED,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +		.set = iris_set_min_qp,
> +	},
> +	{
> +		.cap_id = MIN_FRAME_QP_HEVC,
> +		.min = MIN_QP_8BIT,
> +		.max = MAX_QP,
> +		.step_or_mask = 1,
> +		.value = MIN_QP_8BIT,
> +		.hfi_id = HFI_PROP_MIN_QP_PACKED,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +		.set = iris_set_min_qp,
> +	},
> +	{
> +		.cap_id = MAX_FRAME_QP_H264,
> +		.min = MIN_QP_8BIT,
> +		.max = MAX_QP,
> +		.step_or_mask = 1,
> +		.value = MAX_QP,
> +		.hfi_id = HFI_PROP_MAX_QP_PACKED,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +		.set = iris_set_max_qp,
> +	},
> +	{
> +		.cap_id = MAX_FRAME_QP_HEVC,
> +		.min = MIN_QP_8BIT,
> +		.max = MAX_QP,
> +		.step_or_mask = 1,
> +		.value = MAX_QP,
> +		.hfi_id = HFI_PROP_MAX_QP_PACKED,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +		.set = iris_set_max_qp,
> +	},
> +	{
> +		.cap_id = I_FRAME_MIN_QP_H264,
> +		.min = MIN_QP_8BIT,
> +		.max = MAX_QP,
> +		.step_or_mask = 1,
> +		.value = MIN_QP_8BIT,
> +	},
> +	{
> +		.cap_id = I_FRAME_MIN_QP_HEVC,
> +		.min = MIN_QP_8BIT,
> +		.max = MAX_QP,
> +		.step_or_mask = 1,
> +		.value = MIN_QP_8BIT,
> +	},
> +	{
> +		.cap_id = P_FRAME_MIN_QP_H264,
> +		.min = MIN_QP_8BIT,
> +		.max = MAX_QP,
> +		.step_or_mask = 1,
> +		.value = MIN_QP_8BIT,
> +	},
> +	{
> +		.cap_id = P_FRAME_MIN_QP_HEVC,
> +		.min = MIN_QP_8BIT,
> +		.max = MAX_QP,
> +		.step_or_mask = 1,
> +		.value = MIN_QP_8BIT,
> +	},
> +	{
> +		.cap_id = B_FRAME_MIN_QP_H264,
> +		.min = MIN_QP_8BIT,
> +		.max = MAX_QP,
> +		.step_or_mask = 1,
> +		.value = MIN_QP_8BIT,
> +	},
> +	{
> +		.cap_id = B_FRAME_MIN_QP_HEVC,
> +		.min = MIN_QP_8BIT,
> +		.max = MAX_QP,
> +		.step_or_mask = 1,
> +		.value = MIN_QP_8BIT,
> +	},
> +	{
> +		.cap_id = I_FRAME_MAX_QP_H264,
> +		.min = MIN_QP_8BIT,
> +		.max = MAX_QP,
> +		.step_or_mask = 1,
> +		.value = MAX_QP,
> +	},
> +	{
> +		.cap_id = I_FRAME_MAX_QP_HEVC,
> +		.min = MIN_QP_8BIT,
> +		.max = MAX_QP,
> +		.step_or_mask = 1,
> +		.value = MAX_QP,
> +	},
> +	{
> +		.cap_id = P_FRAME_MAX_QP_H264,
> +		.min = MIN_QP_8BIT,
> +		.max = MAX_QP,
> +		.step_or_mask = 1,
> +		.value = MAX_QP,
> +	},
> +	{
> +		.cap_id = P_FRAME_MAX_QP_HEVC,
> +		.min = MIN_QP_8BIT,
> +		.max = MAX_QP,
> +		.step_or_mask = 1,
> +		.value = MAX_QP,
> +	},
> +	{
> +		.cap_id = B_FRAME_MAX_QP_H264,
> +		.min = MIN_QP_8BIT,
> +		.max = MAX_QP,
> +		.step_or_mask = 1,
> +		.value = MAX_QP,
> +	},
> +	{
> +		.cap_id = B_FRAME_MAX_QP_HEVC,
> +		.min = MIN_QP_8BIT,
> +		.max = MAX_QP,
> +		.step_or_mask = 1,
> +		.value = MAX_QP,
> +	},
> +	{
> +		.cap_id = I_FRAME_QP_H264,
> +		.min = MIN_QP_8BIT,
> +		.max = MAX_QP,
> +		.step_or_mask = 1,
> +		.value = DEFAULT_QP,
> +		.hfi_id = HFI_PROP_QP_PACKED,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_frame_qp,
> +	},
> +	{
> +		.cap_id = I_FRAME_QP_HEVC,
> +		.min = MIN_QP_8BIT,
> +		.max = MAX_QP,
> +		.step_or_mask = 1,
> +		.value = DEFAULT_QP,
> +		.hfi_id = HFI_PROP_QP_PACKED,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_frame_qp,
> +	},
> +	{
> +		.cap_id = P_FRAME_QP_H264,
> +		.min = MIN_QP_8BIT,
> +		.max = MAX_QP,
> +		.step_or_mask = 1,
> +		.value = DEFAULT_QP,
> +		.hfi_id = HFI_PROP_QP_PACKED,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_frame_qp,
> +	},
> +	{
> +		.cap_id = P_FRAME_QP_HEVC,
> +		.min = MIN_QP_8BIT,
> +		.max = MAX_QP,
> +		.step_or_mask = 1,
> +		.value = DEFAULT_QP,
> +		.hfi_id = HFI_PROP_QP_PACKED,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_frame_qp,
> +	},
> +	{
> +		.cap_id = B_FRAME_QP_H264,
> +		.min = MIN_QP_8BIT,
> +		.max = MAX_QP,
> +		.step_or_mask = 1,
> +		.value = DEFAULT_QP,
> +		.hfi_id = HFI_PROP_QP_PACKED,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_frame_qp,
> +	},
> +	{
> +		.cap_id = B_FRAME_QP_HEVC,
> +		.min = MIN_QP_8BIT,
> +		.max = MAX_QP,
> +		.step_or_mask = 1,
> +		.value = DEFAULT_QP,
> +		.hfi_id = HFI_PROP_QP_PACKED,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_frame_qp,
> +	},
> +	{
> +		.cap_id = INPUT_BUF_HOST_MAX_COUNT,
> +		.min = DEFAULT_MAX_HOST_BUF_COUNT,
> +		.max = DEFAULT_MAX_HOST_BURST_BUF_COUNT,
> +		.step_or_mask = 1,
> +		.value = DEFAULT_MAX_HOST_BUF_COUNT,
> +		.hfi_id = HFI_PROP_BUFFER_HOST_MAX_COUNT,
> +		.flags = CAP_FLAG_INPUT_PORT,
> +		.set = iris_set_u32,
> +	},
> +	{
> +		.cap_id = OUTPUT_BUF_HOST_MAX_COUNT,
> +		.min = DEFAULT_MAX_HOST_BUF_COUNT,
> +		.max = DEFAULT_MAX_HOST_BURST_BUF_COUNT,
> +		.step_or_mask = 1,
> +		.value = DEFAULT_MAX_HOST_BUF_COUNT,
> +		.hfi_id = HFI_PROP_BUFFER_HOST_MAX_COUNT,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +		.set = iris_set_u32,
> +	},
> +	{
> +		.cap_id = ROTATION,
> +		.min = 0,
> +		.max = 270,
> +		.step_or_mask = 90,
> +		.value = 0,
> +		.hfi_id = HFI_PROP_ROTATION,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +		.set = iris_set_rotation,
> +	},
> +	{
> +		.cap_id = HFLIP,
> +		.min = 0,
> +		.max = 1,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.hfi_id = HFI_PROP_FLIP,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_flip,
> +	},
> +	{
> +		.cap_id = VFLIP,
> +		.min = 0,
> +		.max = 1,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.hfi_id = HFI_PROP_FLIP,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_flip,
> +	},
> +	{
> +		.cap_id = IR_TYPE,
> +		.min = V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM,
> +		.max = V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM,
> +		.step_or_mask = BIT(V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM),
> +		.value = V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +	},
> +	{
> +		.cap_id = IR_PERIOD,
> +		.min = 0,
> +		.max = INT_MAX,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.flags = CAP_FLAG_OUTPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_ir_period,
> +	},
> +};
> +
> +static struct platform_inst_caps platform_inst_cap_milos = {
> +	.min_frame_width = 96,
> +	.max_frame_width = 4096,
> +	.min_frame_height = 96,
> +	.max_frame_height = 4096,
> +	.max_mbpf = (4096 * 2176) / 256,
> +	.mb_cycles_vpp = 200,
> +	.mb_cycles_fw = 326389,
> +	.mb_cycles_fw_vpp = 44156,
> +	.num_comv = 0,
> +	.max_frame_rate = MILOS_V1_MAX_FPS,
> +	.max_operating_rate = MILOS_V1_MAX_FPS,
> +};
> +
> +static const struct icc_info milos_icc_table[] = {
> +	{ "cpu-cfg",    1000, 1000     },
> +	{ "video-mem",  1000, 10000000 },
> +};
> +
> +static const char * const milos_opp_pd_table[] = { "cx", "mx" };
> +
> +static struct ubwc_config_data ubwc_config_milos = {
> +	.max_channels = 8,
> +	.mal_length = 32,
> +	.highest_bank_bit = 15,
> +	.bank_swzl_level = 0,
> +	.bank_swz2_level = 1,
> +	.bank_swz3_level = 1,
> +	.bank_spreading = 1,
> +};
> +
> +#endif
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index ddaacda523ec..ff3f4f1dc2ff 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -348,6 +348,10 @@ static const struct dev_pm_ops iris_pm_ops = {
>  };
>  
>  static const struct of_device_id iris_dt_match[] = {
> +	{
> +		.compatible = "qcom,milos-iris",
> +		.data = &milos_data,
> +	},
>  	{
>  		.compatible = "qcom,qcs8300-iris",
>  		.data = &qcs8300_data,
>

