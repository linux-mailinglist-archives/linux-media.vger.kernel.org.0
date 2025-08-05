Return-Path: <linux-media+bounces-38942-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BB8B1B604
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 16:12:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D5C5175936
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 14:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAC0027F75C;
	Tue,  5 Aug 2025 14:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jAIMma6C"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E1327FB26
	for <linux-media@vger.kernel.org>; Tue,  5 Aug 2025 14:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754402721; cv=none; b=WIGT3SeyjjcFtb3RGegE9V8OW7eC46PrbX+HlTED3FxFGgY0HnwQB66JtL+KbgnqbNPNKtMq9S+B2kQf3ORJpB3UJ81gJquCY+pvdfDGK1sfOG2mws7jciae8TdlWskg843phnX24aS2yap3Z7wSfNuDLL0hCrGwkF5klVNrbWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754402721; c=relaxed/simple;
	bh=8J5cuWTNGNmnCmEFZreVGaQl+BFghG3/wBWhuX49l00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AkirU9oBIjFa+sXXGYLtEVasGEfvMEJkni+VhUY/liy8VNbGRkOXDm8AEbOaiY+s7Ki3XZnUrc7SnkuIqwrSxLmVWMtz7wnZLq6dYxJMr8vaS4igr8ym989lK8CfNsyzqaThnBbtvc6NzzoHZW1jenl4DimqvA3b6YmDIdpeJss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jAIMma6C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575DJCcN004376
	for <linux-media@vger.kernel.org>; Tue, 5 Aug 2025 14:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y8GWTLsDapJ06m9sj6GKQ34d
	0P33lgkh1NvaX1OZEs4=; b=jAIMma6CYw3JK3nfFf0Da2hkIb7nPW1Jh4bDgmtD
	5iw1pkAPLrNmwsi+f6MHzF+yZXpcqvNA+nivsWmTgTGBYZsyFEGHnZ6Z0C5WgLKo
	+UrsaTVsR3Hc2lBXoCXlKiULAlsfBm+nhYZSLvLhM1MECxBSCQIzQYtwqEhwEkkm
	SUHpQ9vVYlxAcPlFzel/7M8ThaizvIwdTPXXqqsufHLPnMeTT1EilxP+W6ZJKsHc
	C5z7N2AdRpr1WurFIipApsqpmD7uelP8DxdCKqXMZ8N9XgDUpIs4ptV4JDZ+vh3u
	eD4BQr9Qvh4D+WvpvJMBklk1m668AibdG7HQg3pQ7LjOIA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489byc8p9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 05 Aug 2025 14:05:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-31f322718faso4505881a91.0
        for <linux-media@vger.kernel.org>; Tue, 05 Aug 2025 07:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754402716; x=1755007516;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y8GWTLsDapJ06m9sj6GKQ34d0P33lgkh1NvaX1OZEs4=;
        b=B/Cf8aguz2QUMqBPK2hlIuV9mNx/YhxsYjubQVb+t8c8QJEfqmbk/6Dcc1Dkk4wzXQ
         v4U7IJPWVS+r1D501uAlBuIkqOLqfZCQ/ffrzWfgZ+WA3b+fJ+gSso33HV1vg9uZefCC
         2U6CRCThccRoMQ/GfJR7rrKycK8RqZ7qK0HSX/RoeH9wfmnRnU1d69Y6MLxzNtt5EMNu
         fhUyBMrgInOoX1fSB0Bo0lnv344Ru5stE9wM7ptwSpOm5bHETOEHxAMZflkyqF+E4Dos
         uktT+8/ljB66pfuruGrYqMq0xZ1SvHzAhYBmIC//nrSan0B+UkFzDHofM/J2ZX/NHCqT
         zSEQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2jMvqrERppgKtmDBrji3YYU1sYtRyfSirE3QB9iN3PCjLKkA1m1WoejITobkutSAG66Xd1d7eUwW0cw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwejOIj10ZMJNa8EvfzGqf9Th116JZwoLsscFRcZecceVEuYnra
	j0aAZf5j8jufyRMZjGsizK52AnBjd0C8vjJgHzkvHi5S2jk+1kZYr0GGVEXK+K6aNXV3HY8ErvI
	dKUE9PxTID1rtjYaqLJUi4gpyjXAswBfRUNHeWy+ckfGCGDN8KrWbjp1eczC4w8/8mA==
X-Gm-Gg: ASbGnctORd78XNUw07xPqyFtEz+gX9aLbAA67s3Ko+EHBSUKY9m8Bt8IDdD1p/ZDMgO
	2+VhyibGlaHn3wyRsvTVeax0Fj7L8BQK1YyW9YQzLE1WgpnHhNmSRac778LqW95eVh8XQvBkuy9
	MilIKQEYMV1Eqb3hix47x+Pz7pzaihszDT8cV6fbd9kIyv5Ur1PJCaqjrJ9PmXGzIhUxj/1Tqxp
	8rrifbc/xkIfuhvfwKorfPtpinafkIf+M8rsnD0X8fn8E2xvUPttAuVLYu6Su5XQrAivzXMjoii
	obAOHnzJ8YtaQBykYS9bRabHEueVHSrinZfrminUxXXLjgd8M69Yd03xdbi8PJY3/Yo=
X-Received: by 2002:a17:90b:3e8a:b0:321:3715:993 with SMTP id 98e67ed59e1d1-32137150ad5mr11688582a91.14.1754402715876;
        Tue, 05 Aug 2025 07:05:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjmfwajEFNC0n/4JWnoR261FA5nFMX6Yqgmg9OjOOyA6BAlGJkbJzfB308KbNyUV9w099bVQ==
X-Received: by 2002:a17:90b:3e8a:b0:321:3715:993 with SMTP id 98e67ed59e1d1-32137150ad5mr11688449a91.14.1754402714757;
        Tue, 05 Aug 2025 07:05:14 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-321611d846esm369077a91.8.2025.08.05.07.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 07:05:13 -0700 (PDT)
Date: Tue, 5 Aug 2025 19:35:06 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] soc: qcom: mdt_loader: Remove pas id parameter
Message-ID: <20250805140506.b6d2x5berkss3it3@hu-mojha-hyd.qualcomm.com>
Mail-Followup-To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
References: <20250804-mdtloader-changes-v1-0-5e74629a2241@oss.qualcomm.com>
 <20250804-mdtloader-changes-v1-2-5e74629a2241@oss.qualcomm.com>
 <658d7d55-fd5e-42cb-bc5d-abcc0b47a168@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <658d7d55-fd5e-42cb-bc5d-abcc0b47a168@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: GVPnu82qpqF0pk4z_uNF0ULE04AHmd7l
X-Authority-Analysis: v=2.4 cv=Y6D4sgeN c=1 sm=1 tr=0 ts=68920f9d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=9ZXyijcKk7BvzWFVFWYA:9
 a=CjuIK1q_8ugA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: GVPnu82qpqF0pk4z_uNF0ULE04AHmd7l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDEwMiBTYWx0ZWRfXyXSRBCurbFUQ
 N5sk/jxXjofvsEzzLi8WAPvEwwKuCE/SMEmx8KCqNx8G2b8wmzOc6SNumjBHUpD4tWWFKhZVb4B
 +jSVXJmUh7xff48iPU7EpdJZa0fFmvL3VSAWE5cn/ep6Upv3HJnfgMAUjggyQq+bb8FEKOVwbgJ
 TiavCRWtJLjcyCT2wqPFTHGFOxk8P3JJYYmK9PHShDC6CP3BIOJpRzOirgpb8ijdobbyENlToWi
 1fdhENpFCUbzfIB/YVZod0qWLaSmlzMd/ZA7J95dwEX3+i9/IoEimkVAchomclAYsaz/Avyv8AK
 C/TSQDlHktUfA+0pwAa1X5rN1VlR6l7cYVQPA1rtp56GuNvLMg19FUc4IT5jsve+D5PrCIXNSiU
 swM4B8ex9gvlhs1b+dLznOP5Q7f7dWOD7HDn8qWbJ3Z3ewo8YpZ3CJq5yAq8cHWHSWZv6yk3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=875 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508050102

On Mon, Aug 04, 2025 at 07:17:02AM -0700, Jeff Johnson wrote:
> On 8/4/2025 5:41 AM, Mukesh Ojha wrote:
> > pas id is not used in qcom_mdt_load_no_init() and it should not
> > be used as it is non-PAS specific function and has no relation
> > to PAS specific mechanism.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  drivers/media/platform/qcom/venus/firmware.c |  4 ++--
> >  drivers/net/wireless/ath/ath12k/ahb.c        |  2 +-
> >  drivers/remoteproc/qcom_q6v5_adsp.c          |  2 +-
> >  drivers/remoteproc/qcom_q6v5_pas.c           |  7 +++----
> >  drivers/remoteproc/qcom_q6v5_wcss.c          |  2 +-
> >  drivers/soc/qcom/mdt_loader.c                | 14 ++++++--------
> >  include/linux/soc/qcom/mdt_loader.h          |  7 +++----
> >  7 files changed, 17 insertions(+), 21 deletions(-)
> 
> Since this patch touches files which go through different maintainers, do you
> have a plan on how this will be merged?

I am hoping,  Bjorn should be ok to take this into his tree ?

> 
> I can ack the drivers/net/wireless/ath change once I know how it will be handled.

Going to send v2, please ack it, once we have confirmation on the above
question.

-Mukesh

> 
> /jeff

