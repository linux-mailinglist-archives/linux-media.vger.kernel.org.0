Return-Path: <linux-media+bounces-29978-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDDEA84D66
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 21:45:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A70174A731D
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 19:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27BA61E7C0E;
	Thu, 10 Apr 2025 19:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jrTsBVS4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3245F6EB79
	for <linux-media@vger.kernel.org>; Thu, 10 Apr 2025 19:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744314250; cv=none; b=j7iNJ+yl4Re9NeSEtdKJEbawxcOkDnO3IW9TT08P6C3XKiAOLA40ggMSSmZ7cUxLEriKsg7i9dI5VrLSL4ER9EaRnMPpwb6X2u28U7CaOsOYrh8iz7lXGQNYB1oLUxwNjh+Kp8xZ462/+BxrC3Pa6cvQP8+4cJzK4W0OSWA0+H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744314250; c=relaxed/simple;
	bh=iMsdDLXheF8MRz+4l0Yir4tgR3MOExzWlGax/sLIrVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fv2kZe6GG8H5wK0tKndrx5UGGEBmqHkMX/SdLDZOv097dNN4Ckd70e+01K/cO+B8XhY3zhCO9V+KgwQ+zfPd9M/AodlNL9CkByOrNdeW4qsJ4H6FQNl6kXGVOtI1ERlqmex4OjWSfVyD56D5MORKsNZrk4+6Uzv5m3q4gzf7W0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jrTsBVS4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AG11c9013861
	for <linux-media@vger.kernel.org>; Thu, 10 Apr 2025 19:44:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PZm0qqgS5dTG7oCRmAuLkE5p
	HlURp9VF4PXmAQpOQA8=; b=jrTsBVS4kK+l+2V83qmi5UfEscnaEuyvCKWxr/E9
	YrAJ2ykybUVRjY1dIyYRhHir3HHM+cXScju49r/96bW5aSl8Qk3jiq/kDpFCagyK
	u51msUMUidkU0dvyTAmpr+v/fdFkUHHylP8KUGP2ypdWvkVMsNy/QeN/7Jjk8a+I
	yl+VXDrihEZsb4/Jvt8YJTcXfLR94gSk5jGkH4zqLomjhkfce9+I0Dflxfuohdhg
	g3STC047JWrBgpNuz/JUPelYPqI61ZMDPJF4y+q+PyPwXh/HuNecoLiJJMOkFUUP
	hrslaynksnQaPuG8ssB0q2MLRZ9R71rc9uDED7Irewx/+g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbeg753-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 10 Apr 2025 19:44:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c0c1025adbso249234285a.1
        for <linux-media@vger.kernel.org>; Thu, 10 Apr 2025 12:44:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744314247; x=1744919047;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZm0qqgS5dTG7oCRmAuLkE5pHlURp9VF4PXmAQpOQA8=;
        b=Zy8y4QKstoBHvOFIQaECcxMPgjhukBE3D6+BBek2ID7QWGJPD59Ol7Eqax54U065Xf
         X7pqdjoOrkTyy/YqmuxGr7BS6S0gg30JE8DlaPzi3qai1Rr+jWoMciLu3Zd87m9sy6Uw
         pq7NTqQ6yNWmV9uQVEi5D3RYnwE/2Y93UJozT2SUZf8K9fKAyqkY8r2eC93+3A2qZ9D7
         /IexvzAR94kWr7oKPXMyfH8Lto+ODJaILFVUuK7eWheMU5ZMg4kCR4IdCzdmikxE4NEM
         QhCWJIxHfl4GJE2d+FiamlsJo/x/Jk73EXGYJ9ViAooIJtiCUFPOIZ2QDXNm7qyfPF91
         dBMA==
X-Forwarded-Encrypted: i=1; AJvYcCUkbky2WA1C90vTJdrJ4pUIXUqDWiVWpN9WpsVlmHEMa2JdZrNZXZ5o6Cv18nY7g9YyVZh86TpmD/oBlA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBoebM2AnjFrl8dRi47e5gXGmHVrqipndYVK5NzW0oYvvXJxAJ
	7dont7m0ooAXSbQZ2YT/ol/v5pKR5its9lCqPbWr06MT8WjQ6m6AqLw1t4rjEaqG4aMTdP7gH7V
	3WGNJklT6xO98t1IQsz9DciTWJ2+YkN94eupoCgV2IzIDOE1pFkHwVI5mHoGNiA==
X-Gm-Gg: ASbGnctZgxh4an/g+YhfIjhSW2izxYzdyl8wapFF/qSjv2VkWz7b74mh3bTbIymEoMG
	dUKZx30a1/27WSpk+4DkdnIBrYflcLwztQ0DYYk6I3EkfojRoERUIbjeF4JC/s3NQ+q7Qj3n6Qh
	6lpLYBHH/nQQ4LxnP/2NTGNJZDU7kfUq3oiKNEn1Wl3zHTZimSZGvEcoh3SEoKfvMgqkQWjMboX
	PsD7J8PhiBtIgLzZtn87zPIenCrqQ0xqJrp4ku3Tk1x/nH1+pjPSQN0fKU9s0QutogaiuorYgSg
	mxHlLra8ug3j584pHJsJy8h96Lw/MkQV7ypzMM8FQSlCD1l9fcAzlGkiO9naJ1tMMohK3iRhMOk
	=
X-Received: by 2002:a05:620a:4484:b0:7c5:4b91:6a39 with SMTP id af79cd13be357-7c7af12ec95mr31545485a.33.1744314246980;
        Thu, 10 Apr 2025 12:44:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/AtswoZH0U6ZdBxJQfiEwZm4aVhqnq1sZshU8lrm5+ua8KiXU0Tcl7YdGDm/CpynyS+kVcA==
X-Received: by 2002:a05:620a:4484:b0:7c5:4b91:6a39 with SMTP id af79cd13be357-7c7af12ec95mr31542185a.33.1744314246699;
        Thu, 10 Apr 2025 12:44:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d2386absm228473e87.87.2025.04.10.12.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 12:44:05 -0700 (PDT)
Date: Thu, 10 Apr 2025 22:44:04 +0300
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
Message-ID: <vhfuhjruok7gupoeo2uloe525k7oycd5gkh67zzz4wbiwrczpt@i3qknymfu4px>
References: <20250410-topic-sm8x50-upstream-iris-catalog-v5-0-44a431574c25@linaro.org>
 <20250410-topic-sm8x50-upstream-iris-catalog-v5-1-44a431574c25@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410-topic-sm8x50-upstream-iris-catalog-v5-1-44a431574c25@linaro.org>
X-Proofpoint-GUID: bgj__5DC7ROjjOketqfHzENCRQau52t8
X-Authority-Analysis: v=2.4 cv=T7OMT+KQ c=1 sm=1 tr=0 ts=67f81f88 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=w-EXFu6-wi7iOCDdWgUA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: bgj__5DC7ROjjOketqfHzENCRQau52t8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_06,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100143

On Thu, Apr 10, 2025 at 06:30:00PM +0200, Neil Armstrong wrote:
> Re-organize the platform support core into a gen1 catalog C file
> declaring common platform structure and include platform headers
> containing platform specific entries and iris_platform_data
> structure.
> 
> The goal is to share most of the structure while having
> clear and separate per-SoC catalog files.
> 
> The organization is based on the current drm/msm dpu1 catalog
> entries.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/media/platform/qcom/iris/Makefile          |  2 +-
>  .../media/platform/qcom/iris/iris_catalog_gen1.c   | 83 ++++++++++++++++++++++
>  ...ris_platform_sm8250.c => iris_catalog_sm8250.h} | 80 ++-------------------

I'd suggest _not_ to follow DPU here. I like the per-generation files,
but please consider keeping platform files as separate C files too.

>  3 files changed, 89 insertions(+), 76 deletions(-)
> 

-- 
With best wishes
Dmitry

