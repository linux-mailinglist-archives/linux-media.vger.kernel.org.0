Return-Path: <linux-media+bounces-35439-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFE9AE0EC1
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 22:53:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 251F94A1239
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DBE025D8E9;
	Thu, 19 Jun 2025 20:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nCG28X/y"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E90A195B1A
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 20:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750366424; cv=none; b=LavpzL0+l4ZydWoL+E+JSId3pbfSTxSGoHefWh+IpDUisJQbbv/rnaJyd4orryeUYA8r2ExjXyLbzGmodjd2vVNAdSaEbPs9rlnkPG8DvbSsCQtjSQ2mkQO0f/4YOooq6Aeo1yspheUt6QpbQUnFkDpHqe5OETO3joqZ8ORWcxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750366424; c=relaxed/simple;
	bh=O7SEft5ZodFpZ+NzpqfkPUaFRACFj8cIYOOxG4CF50o=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h8xMuoYVD8F5Wn08k0dEU2JBo9Wjml2EabGLcUERNW3MyWZrKalLyG7SdSwjDBG8nfoJ7AMVGRq3AgooJe2/NiQjqE/CgYdW34KTdcaULghKTLWL2m5jWLM3+/ogBRcg9xiHH4/FdPoWHn5K1xIxMkNeOJqcEu6NH83HFprmt+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nCG28X/y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JEtNsD022295
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 20:53:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iPu5zYQef5SPsWhI914gghzkM1C1M/oubhZ9KqWFCz4=; b=nCG28X/y+8bLLCch
	cgoo/nS7X0ykawRtavoUN0mXAl/l57jMpogrBWx717EJpHaFJijUGNhreGXe66+y
	7oYMMt4LevcUmjElsdUVbdUXXPgP2528WzktvhrfUI9uhmMcgoSvcDgPKdsUquL0
	PVwYusZb9BdvQW1mm03X0k3u5PFff5VK/0vjKn3ZWAIo0Mk2GyGQMQOOCd5wbID/
	4eW6H91i2tlJbMlGfo9x5oZs1LiANWL9905y5kHQvknjy9xXh0JmplLTF6nCPZA9
	ZsoNHCIXR4863zoAWjxjyseU7xL1cFl9y9UA81vCQPIrIeHy3179N567bB9DXKM5
	8bRZqA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791ens4v5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 20:53:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d15c975968so170196585a.2
        for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 13:53:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750366421; x=1750971221;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iPu5zYQef5SPsWhI914gghzkM1C1M/oubhZ9KqWFCz4=;
        b=Kf8d+IQGxmk/Jb6Oeb16YiYPbaE5xQtzYG3nkrDR0IkO6V8bgsMpSUvk0XcGddVttk
         hywNso1yrgwipmb7gl2MGSCssC0bmq5OBPutmn4cA9wjELCpa03JOk6+fEOT9rb3syGO
         Aa4kISgDt0efklWLZyYZnHgeRtwykP8sxVUSHuwkHEnl0ZKlxnCo17McC2Iw68ad59Wq
         M1Mkj7L/Ca/rxVMyKc9MEw1oVnKcUroZgX5d80oljwWpcy9BS0BoRgnYfL2MteqJahzQ
         JvxVnJ5cBPARqVcBV5M8YRhK1KzqI8VRrjg7FPyEFL5iXH/8+2LANYu6WQGQoDcVeNRN
         u9MA==
X-Forwarded-Encrypted: i=1; AJvYcCVNy3Whp7OiL1fvpA8l94ROqU2st9y44KKyEBEiaqGd3R04/pDtNCGdE2sF/0SKDH0e1gfTZ05hIt4RYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZBMcKrc8ozmbdwEniNjb+qnpK5R7Q7gI6innqbEGe4+/TUQ4G
	WTYz8jMK+CuKSEFVrKzl/yzw11YQIM7+I8v+5RatodYT4wfwxy32F3FYjJ+MSaV1sfmgIpr3ghQ
	5lv3DijvPVd9SISTYywH9On0VVvTlQK/hUr5yGKoj9J++uZrluxAayvk9efSrxY44fg==
X-Gm-Gg: ASbGncvJ7kUmALqYyOeyhDz1RWf2m0XbGvmU84QDP1kgsoQq4XqrmLu/wFb7EEp7jHn
	PAyh8d6fdqCaGwpB4rzQlyKyulQIejI8VHXLdsWVj+yWaO9SUhfCJIJcobOG82hIP90Ax3i5Xbk
	NBbDgaQ3Gim+6h4LypQDD5vE8msyW5JsaNCnQ20RvDrvq60q/kOXiwfUxat0Bw5hX3AObkVvsUC
	eOzBhYht8nEe0ak7FZh1PMlOlOSnU+GPCtpuE6d5uEmYfjcGHdo5M5lqeRgPlLsUFoAvFawPt22
	g8R0wJwoKcfspmOl3CkAsLfDXxVtkyK8hwsJe31VtVNTQdFSNsMSGTGkdw==
X-Received: by 2002:a05:620a:448e:b0:7c9:3085:f848 with SMTP id af79cd13be357-7d3f98dbe63mr92534585a.13.1750366420907;
        Thu, 19 Jun 2025 13:53:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlujupLgvSs5a5AyaIHRjZX3uRjpvevuHi2JVJwJp+anGxQJPJMrz4BjOqmrjUIgdSGcb3Jw==
X-Received: by 2002:a05:620a:448e:b0:7c9:3085:f848 with SMTP id af79cd13be357-7d3f98dbe63mr92532085a.13.1750366420525;
        Thu, 19 Jun 2025 13:53:40 -0700 (PDT)
Received: from trex (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d1192680sm301118f8f.95.2025.06.19.13.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 13:53:39 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Thu, 19 Jun 2025 22:53:38 +0200
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        stanimir.k.varbanov@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 5/7] media: venus: hfi_plat_v6_lite: Populate decode
 capabilities
Message-ID: <aFR40iuTd6BQfQBF@trex>
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
 <20250619142012.1768981-1-jorge.ramirez@oss.qualcomm.com>
 <20250619142012.1768981-6-jorge.ramirez@oss.qualcomm.com>
 <85b2ade8-7283-46cf-9246-f441511ed7c7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <85b2ade8-7283-46cf-9246-f441511ed7c7@linaro.org>
X-Proofpoint-ORIG-GUID: DQfBFhzVpUxdj2Rdid8ZnC4w3fJnAV2R
X-Authority-Analysis: v=2.4 cv=D6RHKuRj c=1 sm=1 tr=0 ts=685478d5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=znBxSAuDsvdLRzVMNjAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: DQfBFhzVpUxdj2Rdid8ZnC4w3fJnAV2R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDE3MSBTYWx0ZWRfX1D31FiYaZ+Rd
 hE2jXyVwWXHjdeAaw366il54yWHmgS2LPP6X3PTBWmGDmsXPibpfW9vnQN+YrMRP4aK29+TyMNO
 kGrHZejRoFPlYCBc7bBLWQnXUKn00U1ZeOCyW5bOuF2NdCxqCRWpkvJbdOxLVhARu8aJgyrd7bh
 Eu4lkDNmc4SvSTbdPWHYgAmoyH0vMI0Xov5su7tWQypnGYTkjVQ2wFfMrO6wLimN1EO2jPuAagq
 o3SscmWrCwW+nJHTS5slTUsmU371EwyWWUYpmuHanD61GAdTl47DjFbfYKgPI6Ind/n0owO7Nov
 anUmjBiwRtOgXak0mRTMqbuRppTRmZvQE/l6pkMh0A0HD4z/nTfHLHIgbh51Gx7rFrMD7GSBHTF
 ST14a+90xbmQtPURtPO1LnptlircZEWQI/YGc1wJcIohSWPqvic1gKbFkltGMJW51LNlwLsX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_07,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506190171

On 19/06/25 20:47:50, Bryan O'Donoghue wrote:
> On 19/06/2025 15:20, Jorge Ramirez-Ortiz wrote:
> > +static const struct hfi_platform_codec_freq_data codec_freq_data[] = {
> > +	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_DEC, 440, 0, 440 },
> > +	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_DEC, 440, 0, 440 },
> > +	{ V4L2_PIX_FMT_VP9, VIDC_SESSION_TYPE_DEC, 440, 0, 440 },
> > +};
> 
> This looks off, why is there no TYPE_ENC ?

yes

> 
> You're declaring the encoder in patch 6/7 - what's going on here ?

right, so at this stage, only decode support is being enabled, as
mentioned in the cover letter and reflected in the series. Patch 6/7
acknowledges that the hardware does support encoding, but the driver is
not enabling it yet.

I'm currently investigating an issue that causes a reboot during
encoding, and I plan to submit encoder support once that is resolved —
likely in the coming weeks.

Splitting the series this way should allow decode support to land
without delay, while encoder enablement can follow as a separate,
self-contained update. I hope this is acceptable.

> 
> ---
> bod

