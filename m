Return-Path: <linux-media+bounces-33515-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 115E4AC680A
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 13:04:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 743B81BC7295
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 11:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19D0F27876A;
	Wed, 28 May 2025 11:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EgA0yIdl"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE34D2459D8
	for <linux-media@vger.kernel.org>; Wed, 28 May 2025 11:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748430260; cv=none; b=HXc6/ffXan52r9X6RlUdsuQ1kv8GWFvLRLQCdiBp/Ze++TCHlyvnRUW1MJ46EABCECeQS6hCPl3g1EC3C8A5DFDV9CsgYKSWuGu41OljF5+Z75n9z+ACScCxvKk+OxGzesCIbbOPMhqGVxU3sfk9XYnW0IDmOeBA3o5bWF+YqA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748430260; c=relaxed/simple;
	bh=riQtv7nBcYcJJkZrsW58H8At7TEIUV7pDVxb2GsgEmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tc+O7NlevpLkhOIsrSeHauvdh3k3lJRgdu85nPDA1d5DrK1zovHrFQc8z2/i4GIJTadSbxDQ0x3gXuWij+5Y4X/orAwIsaTxil7oR/AmdOBidK0PXFnT27cWo/glg/u6ZrUl9SKnVCAhbdw+sN3iluAovBxQdKh+JdSlZ1NNPoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EgA0yIdl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S9hk3j009795
	for <linux-media@vger.kernel.org>; Wed, 28 May 2025 11:04:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WBsyeat3wl3WwBotOVfTmQNG
	LpvBr+fBrkq380ZI68c=; b=EgA0yIdl8RcX2Cj4+Lq4jHOnMqJ3ywL5nriTjlYQ
	Q+pA5n+d5CnLWOcXy2v0PGBCcRvB50AKkOBtq3dnO7DSX0Se8DRdUzax8ymWZ70o
	4f67tPxxKNVXVj7nyimPPcRM3P1nXo/PrlKcARAR99o3+ZJz26euxy/H3AKTelKC
	qqc6swMlt2VYZSXl1zQawK+B038ThJ0WhWbXKcx4FpFxog3lX5lNBTutyEYC1gpv
	vn0FNUNtGrflXeUxvQDfcTWblN15/BCgZZpxdD6buISDApufZCIusSHq1OD4FYZi
	k4E4LPeJylSKYVjlI3R2b3BpvqfKek+Rvf4MZ58NoHWwTQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46x03mr67s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 28 May 2025 11:04:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7ceb5b5140eso801242585a.2
        for <linux-media@vger.kernel.org>; Wed, 28 May 2025 04:04:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748430255; x=1749035055;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WBsyeat3wl3WwBotOVfTmQNGLpvBr+fBrkq380ZI68c=;
        b=LxihKX4eeciyu93+BJvOwkMSEEyJMCZdxb24dzzlK+hy74slqGvWa+qIBbu1nEWHx/
         Ff3KDDbjvIuw6K66HJfTlw3Udm6EqmPsBV5G8l0PGZa4wRLnS+Tu3u++SmOk995YPOHg
         hbZLoVNhkS6QGa7Z3iTy+ltVtvhEgbe0d9b8falBw7mWLI5VhKRvny3dfNz2XRVYfNCg
         yqIyqHVJDri1W+CR2eeU8Q1iQTKiSGjvw182yPc+XCYs8iViF/Ddkp7zBVF1jkshPYYa
         eswlEyYzbavoiRHNa/zvyS5zqraty21XHVJ/Y/w+OJS0etwuxvSvhSOA4E54pUlVGMW6
         GnwA==
X-Forwarded-Encrypted: i=1; AJvYcCUHik7kWLemc9+//g3Wx9LWS+D+8gGfmuVp4tOER53W/n+tTvntfl5msZT+kmPdGZpZfmBuWf9mFCsDoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRUhoLfc6oakNxVhO5iw3AvIrCQRsGpPRBkGWocMgU4lXiryKX
	PuO8cenVPQ1risUXO2HMWZtrMRbSe0FVif1sRcM57EsZV4ocbhZXlvCF7qu/ZK5QphXnKar1mYj
	Flm/70WOjpagALWX4koIPUNe9JduavxL0OS2LC4HFO4NCn/v93pTuJUPVoR3FqQ1nNg==
X-Gm-Gg: ASbGncvWmLZ6RFDIPwGdwDUycEfJfezjD8oyu646XuEpL1jZChAHhiUBK3BAHkB0dSh
	m4XlwJYiBDJF5lbadY73APND0LTeHeG9U5jqBf++0YVNsxxM+GVBM1LsJN11kV3Sx/lPYiZH1Kv
	yf2HHwYbu4Y7Wmo7v+aNtWlrHHWvbsnmMqT8N8kiyvQ6CGq0/Ev6lJqXwdyQip9hiRx9XsaS9tZ
	p+wu1pPYpg0SQU82YMIoBFizG1y3Z7GKAx+JDgaioF0IrTxABUibCXUdOM5jF83fC3BjKEmtSeH
	4zQJqA05DJOL5wRMUJNf1mf0X74F4+YvvLWsgOm+bQobWW9P/m6JvSX4bC544dbvdZJJiFkN9fU
	=
X-Received: by 2002:a05:620a:28c2:b0:7c5:5d4b:e62f with SMTP id af79cd13be357-7ceecc2b4eemr2502093485a.43.1748430255225;
        Wed, 28 May 2025 04:04:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG10UZJ7QoYyXLSVHNCzvi96Bk8bbljVwgKTscsPit6mUHckIdBl5B8wYFznELJjPcvrLyuhw==
X-Received: by 2002:a05:620a:28c2:b0:7c5:5d4b:e62f with SMTP id af79cd13be357-7ceecc2b4eemr2502087985a.43.1748430254788;
        Wed, 28 May 2025 04:04:14 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f629746sm236497e87.56.2025.05.28.04.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 04:04:13 -0700 (PDT)
Date: Wed, 28 May 2025 14:04:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Renjiang Han <quic_renjiang@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v7 2/3] arm64: dts: qcom: qcs615: add venus node to
 devicetree
Message-ID: <idc4476ibh4geraklzpas5536jnwvbp6xhjjaajcdcwxicorrf@myh7kyz77rxy>
References: <20250527-add-venus-for-qcs615-v7-0-cca26e2768e3@quicinc.com>
 <20250527-add-venus-for-qcs615-v7-2-cca26e2768e3@quicinc.com>
 <429b4c99-b312-4015-8678-0371eac86de4@oss.qualcomm.com>
 <6a9e7daf-c0df-42db-b02d-96d9893afcde@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a9e7daf-c0df-42db-b02d-96d9893afcde@quicinc.com>
X-Proofpoint-GUID: S7p215dUEn7dfZTIIGV89174m_Ourp3H
X-Authority-Analysis: v=2.4 cv=FuAF/3rq c=1 sm=1 tr=0 ts=6836edb0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=DEnfwTRa2Hw7pMDRkAkA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: S7p215dUEn7dfZTIIGV89174m_Ourp3H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA5NiBTYWx0ZWRfX2A5i4XXOMtRk
 fj3EkBIVa+D+CLeiP3FkWw0cLK9JImYTVa9+JyIiqtFNwM5n0F9p9tnnCPrUNm+t4uYJ587XzmM
 GZvqSWP1IPB6S7i1Xs7DHrfAWoP4T6oMr33ySHVzr5KoeFVZAs0rT7+6Eni1emtfkBs3b68lCro
 0UjxVsOdbxw/lN7iclTAhVEGmVen7etu2qi2ViNNSKIco7+M3S8v4lO9BrJ+Yt4LqUmeGZ5R1WI
 tULTL8L/r6iHWQtsLBdSYLfrF8mrBqUVFbpbqsPQYmjKCVw46PnlWh6Qaz8f045g8t92dv+itrZ
 ZMCE2IGkwu1uOxeWDpt0lPk0AN6Lubzj74C4/f8IuLdzCdAvXZ1nNRkATTs5ftY12Fu4jj6zfvS
 RQa+uQT5cD06kcb9Acg7nVHII+1GhLf0KLTGOFR82hosJ4b4c/cPG0zH29qL3PuM7W+RZk6F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_05,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 mlxlogscore=814 mlxscore=0 impostorscore=0
 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280096

On Wed, May 28, 2025 at 05:13:06PM +0800, Renjiang Han wrote:
> 
> On 5/27/2025 9:57 PM, Konrad Dybcio wrote:
> > On 5/27/25 5:32 AM, Renjiang Han wrote:
> > > Add the venus node to the devicetree for the qcs615 platform to enable
> > > video functionality. The qcs615 platform currently lacks video
> > > functionality due to the absence of the venus node. Fallback to sc7180 due
> > > to the same video core.
> > > 
> > > Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> > > ---
> > [...]
> > 
> > > +			interconnect-names = "video-mem",
> > > +					     "cpu-cfg";
> > > +
> > > +			iommus = <&apps_smmu 0xe40 0x20>;
> > fwiw docs mention 0xe60 0x20 (which result in the exact same resulting sid)
> OK. Will update it with next version.

How would you update this?

-- 
With best wishes
Dmitry

