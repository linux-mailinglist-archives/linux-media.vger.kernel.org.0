Return-Path: <linux-media+bounces-43883-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE6DBC2F57
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 01:35:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E61E19A0AB3
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 23:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D260423F42D;
	Tue,  7 Oct 2025 23:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vm1IWkU8"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9828B21D3CA
	for <linux-media@vger.kernel.org>; Tue,  7 Oct 2025 23:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759880124; cv=none; b=a/7uKK2G58pv6jMny+yB6IT/tZdpUjetbrf9bPs+n+yE7Mj0qWRzGAnUVzXDa8KxtDCc4n5OdNF3zsTzon6egGFdE5Ppgbbo2fYdvUae8+og37dWDhWjOvklschS0TS3cU/wfmtYDCib08LKUpRJWEF+dpeotBB32qDKgXzx0Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759880124; c=relaxed/simple;
	bh=EPStAec2fJeedNbavFDgNAE7lMGq7OM5kFHtxn2IjX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=opco+6eBI3cYG9eTqXPciZdvWMalP6ToZAD8yhk2T0gm5VVElU4PxXITOnSXKooDwRLDGWTJkWAiPKuOIvNrzC8aWtk155rpFtsfmxKg/SFVEhVwNQdkWIVnfcBTwO4bXpT13vHIbJjfuEh0g+gDeIcGe8jBq1kUwWAcnHczVMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vm1IWkU8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ET7cc031516
	for <linux-media@vger.kernel.org>; Tue, 7 Oct 2025 23:35:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Q/RNWE4WPtVrD0A2Ri7p7e+w
	iyovyIg8BoY3vYsiarM=; b=Vm1IWkU89TG3gnNUZB0zty0IDY+1zCXI9YBZ7BVL
	r0swwCvhIKwaF9d9SfYU+DszpGqPtq2oyCrpa4NzqAEK71Q1UgWwMfpjvb7YPBom
	jnHA5WN0IVDR3NR53wY4+vr85k2N93JbRd8J2JdYNIMqxWolH7jg1hM1qP4BnGQF
	wHcC1NPBdiJb4AJlAPiqG6FBCPTpd9isLnPhUZviJbamrGhDrlgJrmzhAfbAQVhu
	XNLjpdglk9vkDAMBAo+V9GHhvGvmHLtbXqIF3EROp5CI/vgkibXZhQwUe5/rBxPG
	gtQBI+ZUGjxN1T7BsQkfEScIOXyw3X8C0Y43pF2dcnJONQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtk70vqh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 07 Oct 2025 23:35:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4dfc05dec2fso262638831cf.3
        for <linux-media@vger.kernel.org>; Tue, 07 Oct 2025 16:35:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759880114; x=1760484914;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q/RNWE4WPtVrD0A2Ri7p7e+wiyovyIg8BoY3vYsiarM=;
        b=QDwayV1P/e+ufXRU85/pgbfTG5IeakjhSfGpe7wbvtZqMna/n20PsKka81Ymmbkw7k
         +3S8S6xb29dM71QupeVAOBLvBM3KyaoHOHMJQBKN2IUSMqmjlbVg+y/Q5l4fK26CWeGo
         U66YAqLztxDdvM3cOep84wmOnCINne9Sas/tZnKHqHlgjLvwiwkbYZA8/aeO9IDN/PCH
         lycbexp3+4Ytw9iBalEJ/46EkKd1n4nR0ApWVBSyEIWI/U6ox9VdsGNFk0tKR88uLpzR
         tDEaAOFIW0rf8eJw/oiRlCz0uilbQVK2vilAhCfyHLDg7IZm4QRxtpJoHjCRjSyJLnId
         wgeA==
X-Forwarded-Encrypted: i=1; AJvYcCV/wWKqcIih34eFuDXBiNzCQGUTkY056k0t9PHzx78fkxHt7A6wxlSYv721jlneUYGlwwj1h4Y6RPsadg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhj/rFUr01RzzHmbnZocvF8HDg9GntmBqi7sQsYzUdiTI4FLUq
	HUgH7XBfBogp8pk/7w9EvTUYFFKDle71/TT4NyfQAUz3BV1I2TZRw4LN70RJTHTB6118IEy2StG
	ouW0FH60QpAZ+VRkrPQ9sBr2i7/X6MC8H4G95Ul4ONqNgx4cANbWUDI7huU+4dRRjhg==
X-Gm-Gg: ASbGncsKfGXDWuQ2LvS2KdF4f/z6S+xG8qACXhOxnHVp+7qSTVPOYS3J9RFUHh272jZ
	6CGDibxSuinqQyqZNVC7YJCBpKD8dKEyiICJtH8KbsCdvVisEou/FKCeZ1v9vI5RmzVMphovyNu
	ILu0NiFqOthXiPk/fYdnzv0+jAivd5BImLcuNT5pZKiYTy5aNw+0k+rgSlfMzWFQPBPgSlz9ObX
	jUeL3LHTNe6KKuHFvxVIS3SydhV87GuTVz0pPAyk6VcCjMwOSEvnT2AB8bqOy692us1loGwRb6z
	Idk0V29M3HFbGs078aufddZI86HUkXcrJTuDAV+ol1t6IWk9XZQzxKpqfy4e8yMcBYPkZdztRjT
	UwsMSHNlV+0uF6Lha1nZIhNqYofikRvSEkj7Uj0nL36Y2D4mzd6Mn1HtbOA==
X-Received: by 2002:ac8:5d05:0:b0:4b7:8d26:5068 with SMTP id d75a77b69052e-4e6eaccbd0dmr21852491cf.17.1759880114424;
        Tue, 07 Oct 2025 16:35:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9r2FTZlq6TMwmbswYafC+KqPkgoA4YCMEpp5X9qCpqlC6TV6kgalC38X0LAXDHJu/FxN2Jw==
X-Received: by 2002:ac8:5d05:0:b0:4b7:8d26:5068 with SMTP id d75a77b69052e-4e6eaccbd0dmr21852291cf.17.1759880114009;
        Tue, 07 Oct 2025 16:35:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-375f3b64437sm14497351fa.37.2025.10.07.16.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 16:35:11 -0700 (PDT)
Date: Wed, 8 Oct 2025 02:35:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: media: qcom: iris: crashes on SM8250 / RB5 board
Message-ID: <yjbx7sjosfp5yqinm6tjcvz75ttttyfuh334hkxfxngkes536r@2jzoqioeehkp>
References: <rs3olaoudntfrnsgpg4nivtnyrdfqsvb3flnr6mcejih3me6zd@udzutvmmkj45>
 <4e1eb99b-05d6-4ab9-9e0f-b2a2b01012ed@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e1eb99b-05d6-4ab9-9e0f-b2a2b01012ed@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxNyBTYWx0ZWRfX1Idz7kS543Sm
 NWNo4o4npq2EEqBhGgbhQ1+sm4sA9Vm/Zwz0/Rj374XDfmgdt5HDlNHX2LHdx6ttg0CtaSfzCrF
 q5uWjkWNlWM3WOhSg9/a1kbxnNuH2+tBaXkbBrmhTskehTwt6TI4rWB7PbZHOILvzdGNoYcvtXO
 mAWMCjO1262NIQCVE7gE2UKZK1xouOOVKcDXprz2QaYJOJ7Zsi2SY7Ldn6I4sB6SDmUG63vm3Q4
 puO+J5x2GPKYUjE6ArHmktPrwwCtvqMuvbVKDADCN7XOvVPdkWxvjPErDLCaxcm/fbA3NyVGNq6
 ta3aEU+n3AX/NX00xmT7YHMixZeMl1ryWVbm1DxCHhQ4sEJ4nXMxnM/7JaZBJyytsk/qrerP2wy
 /6ZEWssU7SQWv7ED+HZtSDMKx5tlkg==
X-Authority-Analysis: v=2.4 cv=do3Wylg4 c=1 sm=1 tr=0 ts=68e5a3b9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=7lvPcvWaT-PTCA-fBnMA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-GUID: hKoyozI--65LUwNibyuRq0a0HxDnAseS
X-Proofpoint-ORIG-GUID: hKoyozI--65LUwNibyuRq0a0HxDnAseS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040017

On Tue, Oct 07, 2025 at 11:18:41PM +0100, Bryan O'Donoghue wrote:
> On 07/10/2025 20:34, Dmitry Baryshkov wrote:
> > Hello,
> > 
> > I've tried running fluster testsuite against the Iris driver on the
> > Qualcomm Robotics RB5 (QRB5165 / SM8250) and I noticed several
> > instabilities:
> > 
> > The following VP9 tests cause the board to reset badly:
> > 
> >              vp90-2-05-resize.ivf
> >              vp90-2-18-resize.ivf
> >              vp90-2-21-resize_inter_640x360_5_1-2.webm
> >              vp90-2-21-resize_inter_640x360_5_3-4.webm
> >              vp90-2-21-resize_inter_640x360_7_1-2.webm
> >              vp90-2-21-resize_inter_640x360_7_3-4.webm
> > 
> > Testing H.265 with JCT-VC-HEVC_V1 passes with -j 1, but quickly resets
> > the board with 8 paralell jobs (the fluster's default on that device).
> > 
> > Neither H.265 nor VP9 testsuites crash if I use Venus driver.
> > 
> 
> Sounds like we are failing to vote for something. My own smoketest for this
> was h264 encode/decode and fluster.
> 
> Out of curiosity, what happens at higher resolutions say 1080p ?

There are 1080p testcases that pass, so it's not a question of the
resolution.

-- 
With best wishes
Dmitry

