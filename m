Return-Path: <linux-media+bounces-30106-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D5CA8793E
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 09:43:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A931B1893C89
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 07:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9165C261381;
	Mon, 14 Apr 2025 07:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W4ZbHdgl"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C0425F961
	for <linux-media@vger.kernel.org>; Mon, 14 Apr 2025 07:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744616398; cv=none; b=nToU/2vr+TwxzdInLUauMZ9fBwqAKq3knVh7OfD8+wT+bccvR5YByL6XU2JQ1DqwDjDmEuDGh+tN0kfEFNS2O9FlVnKeJlAhkoYruoocFXUZLfvWZrhPrxVgd3Kt1vHYec2BO3Mo39smQfS60U3SyWVT/8GeoelaxmABbzN6MYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744616398; c=relaxed/simple;
	bh=qF5ht6cdPU1r0V+kQK5l0Co8aSKuRHlVK07MOUtDLZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XjQ6ILxLDuto7OWtWSVUxY9V0dqNUlpNMRl6Uw3cuu9MrVOaAArzEaI1LDpdX1o1hx4gPA3GWJJS6GxBK4s9J2jN3DwIwFuENRBRXe0X4hgkbNnDwIO1TmW/r8682YgLAiHi0PUG+f1OoPbsYSM0QNLVuN4xVpJ63suqwLuHZ3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W4ZbHdgl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53DINfER013731
	for <linux-media@vger.kernel.org>; Mon, 14 Apr 2025 07:39:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MmJ+Fq4K5UDpd363d47aRJm/
	X4ZqL75ahdqCEORaDrU=; b=W4ZbHdgl8auni3N8HY/TTNAmdqBWtinh2beNY+na
	ypPePIHizYMpmkfW7P4Vr5/k5fMIpeW9kDjwPBMSgX4ngDGNYazo/oWB/AlVOpkP
	v9K2u+zlTXb0JgLm/6Zl80VhvPa4jBAJscuxr4Htr/7XoYaWBMcIlrVF3ZWasxaT
	E/DUqyvPwCDke4pD7hmgYGvgTYNQwF7MfFhX1IzaNOBs9L+VJfzLj3v/07GZ9KWO
	QdNNXJQlxckrRe/+5WQnX27iRiyAOooDvyXKSIjLDdGennuPsQlK99LNUNR5FUhF
	5uX3KRlmVkctFVpg+Zx8WfgxPdMRXqJXtW5oM8qf90876A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8wbnhv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 14 Apr 2025 07:39:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c793d573b2so756279285a.1
        for <linux-media@vger.kernel.org>; Mon, 14 Apr 2025 00:39:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744616393; x=1745221193;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MmJ+Fq4K5UDpd363d47aRJm/X4ZqL75ahdqCEORaDrU=;
        b=EuV9q8CYH5tNmrKGZPaBlgKbF/iSGQBOPk3yhRsyFN6RoMOz+eD1SWvHKxsNu+/Lal
         KdlPh1EdnITf5Q5gHGNNgr8hFr8JpvmBK+nw6XEDcpYasgFxEwfDPMWIbpfNpVDjqyVW
         /YBfU6BymPn54AhEi/2yNYXs9JEk+/Gr31B3VvKE//yIM/86tD+DIkTxFpUFcGgliMCa
         9efHxPTJ92Ox6jJymBQT1bb1JiX8gc6F5XGHGoVI4pfMaJnUPBxCyWCh3bbW5oHKNVCN
         lVYmj0YWhgDL3rgZSGfVpWSb0vAWo8gJYpXDFlm96+H5J2S0i+9yelIFBIhcSGKK89Ue
         ptxg==
X-Forwarded-Encrypted: i=1; AJvYcCUWRmgMdXcFPTHGgpipFLZ92+QkWlGCjp/QEK7ZG6TWmaMf6o8HVtYWHKiozM+BjyNjzkLeWn6pYSkOjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFn4kVrrNX4u48rBn48wzGYGqLKsZkWr6SkV6bPFk1fNeAgpSh
	xTWIWNLSyCPn12E6urkiSlQC95Wx5J5OASQOylpYMAi4ebLZ1z2p7Nt4HcM3ntwJR7rfap1Sit3
	Dej5quCD6kjwYnjvbHMnOYWzU0do7GjZ79QI8ACIPSc/pRa0YVyVKaB/MsChgFw==
X-Gm-Gg: ASbGncuArtQmRAcRhSq4X/ukXQ42CGNRsH+wPmwnpJeGQE8A5fK/5RaYb7JqO3/JgTK
	3OQqeA+YvgM7SOiGkPO0cM5GdnL1ICA96uMuSwp19yR/jwvDZRyMqnGil59BKiL1ee5Zo4p1URV
	f93JNgTZEySzhgUa5UMk+9UCgeWbsbHeiihNWyll3kJdb2ZGHe0rhUzjxevPf15dskPVh25FHQF
	DKNznuohtikfUdEq3QnrrzmpnyevmlPwPTx59m0QvJNffZfFDcmEcZrYfJhH/h/rmrc3qIBrdjv
	G47ZEQsEyi3o9xC46OPM+BFNct4bjZNlYoIupbPEC1Synr93sLiXYLtMwWHUPOfFO4t6unfleFA
	=
X-Received: by 2002:a05:620a:2a0f:b0:7c7:6667:ade5 with SMTP id af79cd13be357-7c7af0e0de5mr1678090685a.27.1744616393061;
        Mon, 14 Apr 2025 00:39:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWB8yJJCQ+1aExZQAKcvLDgxwXWq3sPKi6sM39R0/E6aSC84IG/VhxIYGxrQIc/6fwCKflGg==
X-Received: by 2002:a05:620a:2a0f:b0:7c7:6667:ade5 with SMTP id af79cd13be357-7c7af0e0de5mr1678088085a.27.1744616392568;
        Mon, 14 Apr 2025 00:39:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465f7affsm15992091fa.92.2025.04.14.00.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 00:39:51 -0700 (PDT)
Date: Mon, 14 Apr 2025 10:39:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH RFC v5 1/8] media: qcom: iris: move sm8250 to gen1 catalog
Message-ID: <gkgd7gelin2hbkm2ltsifibxs6laluc66yx5k5uupfa2p4sswc@ypkyrj25njew>
References: <20250410-topic-sm8x50-upstream-iris-catalog-v5-0-44a431574c25@linaro.org>
 <20250410-topic-sm8x50-upstream-iris-catalog-v5-1-44a431574c25@linaro.org>
 <vhfuhjruok7gupoeo2uloe525k7oycd5gkh67zzz4wbiwrczpt@i3qknymfu4px>
 <f637965b-dff5-45d4-b6be-de8c68c6c397@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f637965b-dff5-45d4-b6be-de8c68c6c397@linaro.org>
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=67fcbbc9 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=Eqk6DaCM9aLN9NpnsfwA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 0tbKOa4bab6rlVOsn2LHNs_vF0mKhSnZ
X-Proofpoint-GUID: 0tbKOa4bab6rlVOsn2LHNs_vF0mKhSnZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140053

On Fri, Apr 11, 2025 at 10:14:02AM +0200, Neil Armstrong wrote:
> On 10/04/2025 21:44, Dmitry Baryshkov wrote:
> > On Thu, Apr 10, 2025 at 06:30:00PM +0200, Neil Armstrong wrote:
> > > Re-organize the platform support core into a gen1 catalog C file
> > > declaring common platform structure and include platform headers
> > > containing platform specific entries and iris_platform_data
> > > structure.
> > > 
> > > The goal is to share most of the structure while having
> > > clear and separate per-SoC catalog files.
> > > 
> > > The organization is based on the current drm/msm dpu1 catalog
> > > entries.
> > > 
> > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > ---
> > >   drivers/media/platform/qcom/iris/Makefile          |  2 +-
> > >   .../media/platform/qcom/iris/iris_catalog_gen1.c   | 83 ++++++++++++++++++++++
> > >   ...ris_platform_sm8250.c => iris_catalog_sm8250.h} | 80 ++-------------------
> > 
> > I'd suggest _not_ to follow DPU here. I like the per-generation files,
> > but please consider keeping platform files as separate C files too.
> 
> This would duplicate all tables, do we really want this ?

No. Keep the tables that are shared in iris_catalog_gen1.c, keep
platform data in iris_catalog_sm8250.c and iris_catalog_sm8550.c (and
later iris_catalog_sm8650.c)

> 
> I want just to add SM8650 support, not to entirely rework the
> whole iris driver.
> 
> Neil
> 
> > 
> > >   3 files changed, 89 insertions(+), 76 deletions(-)
> > > 
> > 
> 

-- 
With best wishes
Dmitry

