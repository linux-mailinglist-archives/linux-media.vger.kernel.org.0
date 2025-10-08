Return-Path: <linux-media+bounces-44013-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11354BC671D
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 21:15:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04FBC404054
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 19:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8147A4A06;
	Wed,  8 Oct 2025 19:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GlxKPARb"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F961799F
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 19:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759950923; cv=none; b=B+QvxpC6FuBfL5FA6wSSJzKZQhXCMCk+WtELlGEA3gzBbkiUYSMAxsZOxD5wEX8DV0PHVzz9oVdfUiVARiK/w8IKFu78pqV2+GEGfKadCtWUbvHtnSPfiG4u7rb4as/G2qCLwV+8ZPr5p2hEu7ytzHxKKAnwzKX3S2vCLtCOUB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759950923; c=relaxed/simple;
	bh=hyslDlshQM6LDluVpR6VxhY8TVKC1YHa3wlo89Z5Vrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=amDtL1RbcOZe+IBHETRbUyOu/ykfNhyCBGYyRak5gZm/LR1zGH9Tq5SSTjUZQOXq7YQk5AsVI62N43HpoJmD83gKqvFbQTf2wkInwZgp7toUjkKRdMPmgvQ2QwMmQ6GltZF3/IahR867y5QSzXeBlklNrhRHFN+fbV+PHCNx/7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GlxKPARb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5NFV014407
	for <linux-media@vger.kernel.org>; Wed, 8 Oct 2025 19:15:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rClisPK/TxSFKRv6Q0Cr14NR
	DtDvjkB0ari9poTtf4Y=; b=GlxKPARb3V0hqEX43/6dhucPy/J1pg+m0mq1lMrT
	2VIHUhUqwNaW/dCXlaNtKhxK2ylNmm4i+/hHcaixnhEFF3MFmmjnZSRlt8iCvb3Y
	BUUF8eoa2d5fmi5v3SRiJ/l1rTI629uV4I9cCwxVzh5ltLV7pmlYj5xTlnOOGySU
	Nj4iGWOr3Dg/dxLhTYhEY8MXywGgT/6LiCiFFd42oQy2XRhOFo/++iJpdcIoRCNs
	zMtXWMFC/ESUrDz3s0vZ8WQdIk65xY65ssCWWHi5Qb9Px1yOXCmxUWuUYYScT/FX
	konUeWFoR9ryzrcRqg0iBd4Lz/sFy5AFRZ9o64BiRBkYGQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4u0bu5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 19:15:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4d77ae03937so5283641cf.3
        for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 12:15:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759950920; x=1760555720;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rClisPK/TxSFKRv6Q0Cr14NRDtDvjkB0ari9poTtf4Y=;
        b=QaeGxdgI8xZ3/DisDxLJUnLJHo9GzI+QtOD2aOZaPr+RUjHe9WoShu0B64aNNsu6Ha
         Xsd4acEI8ubuIMk5VjvCATaYzx2UJidznfbNomJmx7s1ZOsxyUZKhVWO8SZy6uFQnC/B
         HYLFF1xVEF7U6FQ8oNFqRJg59Kwm3/u9cnrbG+iZQLydG5RPcOxJWTrB77K/sT4hE1qh
         RYtaOL4nWIbAdN8fYaXDl7szqgwTbP/XxenOjVAzr2nr8JVGX+TW9uzDpfdTbqt2kPQY
         M3aDo2/16ByJ2Yr/LEbYAAu8LF5awrX/lCCmSLqBTO0XTLgJ+4Qj//KEt++yxIlrPbJv
         XTgA==
X-Forwarded-Encrypted: i=1; AJvYcCXt/6jUuoFpT6q4JVKqDCwDZkImVo5d0I0zqwsi7ufJTHvTAYp2/lam/j55//LZzaKg2H1tyAjEQPf5Vw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwauL+nMLOKVnNWjXXEKQlynxm6X1qqmc3ld+KQWixyYB5dJO43
	X8tahCubkmtn3OU4JZSiZOVcN6mvWKlt91Lzk3zaAfmSoczIeOqXOtr+iyisKXXa0/asAaa3u4Y
	xH1PCmWB0d/SvK6DZ6HyDxza8BD6EDQwsVsvbzi29oxICeHIk9tQUL4BnUMFsUn3mQw==
X-Gm-Gg: ASbGncuel8ONUuzLd1earENdhF/JNgB21V1pEiFlibXYPlFzhSxkrLRksUyybKklV0N
	v2DZQ2c8kpvwGDGMLnSrgZuZYuV9vNOFpvI/VjHwCcI7v/V5rGbERjLJt/esREUSmviXxzIUrch
	+f17ea2KIIeKBbD2GczwRXy1W8uoq6eYAdckh6/pBZhMuCHEHRCet4gp/98ftHCpuCknWC8h0Li
	5WPgkkrzMd5ebSrT/GJTZvgzVHY7yoJYvNyYaBIBRFHZO4HakBavs3oJ3IEJRmj8XYoYER4pLwr
	XsHVQskUNNSt8dDDPq0zHd/cOOHTxIimahhSX8Zl1SlbDSd+fZ8zRzdcK4kjOIsUtOF8jYIKz1J
	pNw8jugi7EV0IBKWzjl+jyAIfSzqR7p9DI53PAMKvJjPp6+vR6PEcmiXW7g==
X-Received: by 2002:a05:622a:2617:b0:4dd:2916:7980 with SMTP id d75a77b69052e-4e6eacdac81mr73922171cf.2.1759950920148;
        Wed, 08 Oct 2025 12:15:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4rMJuDQ11cU0fEePDen159WkUOlwxGWhLHakggUGwUJweQQyEA6jLWCQf2NLDMt7yQE0LfA==
X-Received: by 2002:a05:622a:2617:b0:4dd:2916:7980 with SMTP id d75a77b69052e-4e6eacdac81mr73921421cf.2.1759950919569;
        Wed, 08 Oct 2025 12:15:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5907adaaf59sm266158e87.85.2025.10.08.12.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 12:15:18 -0700 (PDT)
Date: Wed, 8 Oct 2025 22:15:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/8] media: iris: remove duplicateion between generic
 gen2 data and qcs8300
Message-ID: <aqoeloznoaggj7wge4wzajtinff6zjxp4hgqq2jqyt7ah5xggv@5gmn5qcgk2ko>
References: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
 <20251008-iris-sc7280-v1-5-def050ba5e1f@oss.qualcomm.com>
 <e335be9f-641e-4835-8b9f-69398b131b7a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e335be9f-641e-4835-8b9f-69398b131b7a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Vrcuwu2n c=1 sm=1 tr=0 ts=68e6b849 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=HR2MuO_p39cwD0E3uXEA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: SDShoX7KqmkcCfAR2jAV2LylVH-O21CE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX4vF6mpyLtGq/
 Gy0+8IIQhJT+Aak1CDmPQbnaqwOzKRYAux3Op+USOh03lAn1xPJIyIU7lnhzUk5g0uvghndZCZd
 8KJ+B0MDdcKgZuv37uc/gzB+8c08ZKIuFgY39PkaSqdpdEBF9kBDgJIed+um7jxzhBVaSwBBYjw
 KBiiKYcLSRed1p9+1E2i8kwFqH3oN08Ux1UXC2eRbxHoohXAZ3zLWc4vjLvahy0RYNZf8HqJ69L
 eW0iE0qgHMbkQRkx1BM4VmG5T9IT12MhI7JTojPJQKUyb0EO75/mXF52oFPPbfz8u1r8tA/6zko
 So+ioBewxqJkgrCenfuERvbUX3Ahhr5iBemt/l4ixisNyXPJeg6hPKy22kDjPo6IBicO7+kN7RG
 QRKLjm8P8mi0Afp3Fp6TFqL6xt2ILQ==
X-Proofpoint-ORIG-GUID: SDShoX7KqmkcCfAR2jAV2LylVH-O21CE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1015 adultscore=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Wed, Oct 08, 2025 at 10:07:47AM +0200, Konrad Dybcio wrote:
> On 10/8/25 6:33 AM, Dmitry Baryshkov wrote:
> > Now as we have removed PIPE value from inst_fw_caps_dec there should be
> > no difference between inst_fw_caps of QCS8300 and SM8550+. Drop the
> > QCS8300-specific tables and use generic one instead.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +static struct platform_inst_caps platform_inst_cap_qcs8300 = {
> > +	.min_frame_width = 96,
> > +	.max_frame_width = 4096,
> > +	.min_frame_height = 96,
> > +	.max_frame_height = 4096,
> > +	.max_mbpf = (4096 * 2176) / 256,
> > +	.mb_cycles_vpp = 200,
> > +	.mb_cycles_fw = 326389,
> > +	.mb_cycles_fw_vpp = 44156,
> > +	.num_comv = 0,
> > +	.max_frame_rate = MAXIMUM_FPS,
> > +	.max_operating_rate = MAXIMUM_FPS,
> > +};
> > +
> >  const struct iris_platform_data qcs8300_data = {
> >  	.get_instance = iris_hfi_gen2_get_instance,
> >  	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
> > @@ -1022,10 +1030,10 @@ const struct iris_platform_data qcs8300_data = {
> >  	.fwname = "qcom/vpu/vpu30_p4_s6.mbn",
> >  	.pas_id = IRIS_PAS_ID,
> >  	.inst_caps = &platform_inst_cap_qcs8300,
> > -	.inst_fw_caps_dec = inst_fw_cap_qcs8300_dec,
> > -	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_qcs8300_dec),
> > -	.inst_fw_caps_enc = inst_fw_cap_qcs8300_enc,
> > -	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_qcs8300_enc),
> > +	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
> > +	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
> > +	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
> > +	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
> 
> 8550 enc data has a .set() under a number of caps (was qcs8300 tested?)

Welcome to a non-conflict merge issue. Commit d22037f3fd33 ("media:
iris: Set platform capabilities to firmware for encoder video device")
added .set callbacks, while commit 6bdfa3f947a7 ("media: iris: Add
platform-specific capabilities for encoder video device") extended
QCS8300 config. Nobody noticed that the second file should also be
updated, which is yet another reason for merging those two structures.

> and also additionally defines:
> 
>  * INPUT_BUF_HOST_MAX_COUNT
>  * OUTPUT_BUF_HOST_MAX_COUNT

Good question. I hope the defaults should be fine...

> 
> values of which should probably be cross-checked (they say "DEFAULT"
> so it's probably OK, but just so you know)
> 
> dec is 1 : 1
> 
> Konrad

-- 
With best wishes
Dmitry

