Return-Path: <linux-media+bounces-43074-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C71B9ADE2
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 18:23:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E07851637F7
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 16:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6241D313557;
	Wed, 24 Sep 2025 16:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U0YFVFyz"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CE130B527
	for <linux-media@vger.kernel.org>; Wed, 24 Sep 2025 16:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758730991; cv=none; b=T5X1eTKpf/rpGuiUbD7LnJsmdYcaP4lWZvBXM5+FNfSOsbt+y/V3GUS0HQLrwb7/Osa2a6VUlwzpEd4ZfWhEA8umxbvycy1wSnjD5hcsjQabUGvpcM4FL7AEA6Lfx1jyD+UsZN+tpsDkU7UhZn/en1cBeyyv8BX4JX2pXZNN4ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758730991; c=relaxed/simple;
	bh=zUueWCM8ict+rLozoOxPbbm0q8MBoAPzg0bpGPz4sDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZrpxcekBws40zyx09BcrX6R5qAzlZ092/5TJHk0znvuSnfaRrUXQOaM+QOpMHl9/XMobkuij+JwxfFqt8uXivRccP63XM0MzdRHzM9Cajk4gH+be+IUc89b7ttngDkBbKI5xY1KSXFY1UlamcasSqzIFNVTkXNyitV/0Z4oHLOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U0YFVFyz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCSwjZ025075
	for <linux-media@vger.kernel.org>; Wed, 24 Sep 2025 16:23:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6coObAzgNCI/EcrDoNSkY1HJ
	fP/PJs9gN8G0/T8LMk4=; b=U0YFVFyzKuzqOZOobuRKZ6cXyT18cbYwhjcenIxv
	WvI8zAFQLMPg2bEPhLbJY97VcAzHV1k27euX5ePrKoxulbGyKykaVS49wBUbXImX
	QM3Vb75vu99f5FmG1D0Xkf8PIVNEBjZibY3oJ8sPw4zEUDwUSyG8fJ9ieqXlyIx6
	70YEygTVHRvfYbYwWBiDkBYjLP16xswZCrNi9Vl/pVi1pwtagsgW6yqF9L5VxhWI
	kEYuPIQ3jA8shwB61Y6dFHj+EMO6mlubF1hBDRsNkZTIz2rYaGTyFLYwxgIecnP9
	z++7fxxl0p85bbwzeYiyFxaSZBXMPAa4xsxHoOd/5e503Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyewc5y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 24 Sep 2025 16:23:09 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b633847b94so344641cf.3
        for <linux-media@vger.kernel.org>; Wed, 24 Sep 2025 09:23:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758730988; x=1759335788;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6coObAzgNCI/EcrDoNSkY1HJfP/PJs9gN8G0/T8LMk4=;
        b=RpRAiE+sLdZAmvAlIkcmb0RD4l9jEDlaNm9ZL7dJGC0kqNfspRufIZtVV+MlM3n6QO
         hW/F2oGDBPqAFx15vLFMRcmU+EdwYfZ0WMNA2dMRmCr0H/vvmmDCtO3tubYETZGcbwq1
         Rl5SVAU1D3jtEFo3wzUk0uHkLk0JfiBGlSqvjLvlOD/h2vMOBSS9DOOZ8U68F/cQ37v4
         tVtPYf1ZUS8JpXEeNKH581PtTUNrWuUPcOoKm8txGzAyFbLef0hpv4M278tbFnGGeAlE
         8xOJclNF9asFO5WG2xELPDXGZNI0rxyEfGKh5vZWKQNcZ+1KZHVdfcFKXhPtdf83Tg8t
         kteA==
X-Forwarded-Encrypted: i=1; AJvYcCWsR23Mk4rYmcUD3rLqqFiSPba7ahbOwr1JBABOXmxWXDR0MCwCLAwm+oTLABQY0EWMDon8HfFAZGnaWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtvdCPY5icSLfUggpPEAASPH1I15PSka+ZtYKYlNc8XGc0mMuy
	2Rwk9M4hnsLfcJ1M4F/O53ZnRNiUhLWIrUZVqLLhTigYVBrRvv2SzEsjB3b33czgHtwWw2c7Kgt
	dkM10CHzg2XQUtj08PAjyCd8/1gzYEa5pjHtux8EaA73NBo1S8Px1L4sNxoO30Qi/jw==
X-Gm-Gg: ASbGnctAZ4X+xI3o/GPZR8U6Hr08Am+hTX3Rwue4USsEHo21F2N1JY5LfhQSeshq5Y0
	tQAgkIpoU0crvZoSq4+48ckpycdSMKRW1KVTpO5443xlpXD4L8DOQuIHOt+uBA3jRH2c/mbFk8s
	qgiXQBimTPwAj8w21qQIMKLIQmYvK9a/ithjOXbm4po27uY7kcrbbcq9R7hsn9iyQgah9YLX8oO
	1p+Q2iTfTaeD2J8c5FtR2ScBJWUz4zwaXVaPjiJ91MekoxFftOYGHu+8+6RhvusYGtM5vQWpY3X
	7ZOdVhuDDzK9tQoYienGMcawyAO2haS08MA29QmSTOq6vAsvA52HMrUBITL0MBhog8T1SItUSol
	VdoFpQBb/JQ/EhditLctLq0m7lpNSdQt/1zFVGPn3aKhLNBEt+ddd
X-Received: by 2002:ac8:7fcf:0:b0:4cc:87b4:d3c8 with SMTP id d75a77b69052e-4da4b42c98bmr6065721cf.41.1758730987830;
        Wed, 24 Sep 2025 09:23:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQ3sVN2Q4IouFn/l1phqaVapcGnG+wwiXU4CXRgU3gqt/Vwdm/CaF7/6E2XN/vz6pVrShJ+w==
X-Received: by 2002:ac8:7fcf:0:b0:4cc:87b4:d3c8 with SMTP id d75a77b69052e-4da4b42c98bmr6064891cf.41.1758730987087;
        Wed, 24 Sep 2025 09:23:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-57f504e8bbdsm2212455e87.133.2025.09.24.09.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 09:23:06 -0700 (PDT)
Date: Wed, 24 Sep 2025 19:23:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: iris: Add support for QC08C format for decoder
Message-ID: <n67nom6bo2hskdn5k2bhbbhna2ew3viccsvvxqddzkbhmr6xfb@sn5abn2vto3z>
References: <20250919-video-iris-ubwc-enable-v1-0-000d11edafd8@oss.qualcomm.com>
 <20250919-video-iris-ubwc-enable-v1-1-000d11edafd8@oss.qualcomm.com>
 <d2qkd3k7pv7cv3rf76nf3wxedqagg7egz7q2vipiddxzbac5oj@rva7gymbaof7>
 <81932285-b007-7cdf-a28d-21131a26eb85@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81932285-b007-7cdf-a28d-21131a26eb85@oss.qualcomm.com>
X-Proofpoint-GUID: lZOs8SOOWFfAgzl0SFERvpPiwXNCw9i9
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d41aed cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=iYGp-hpNWl0ZV_AQIN0A:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfX/mRmNEnwXO0X
 XWXKafFyo06DeuxtgzETPzObef4ML3QXz/IzqjLD2vjY0gaykhtTTDYS+NHp7AAKcF3rITFaK79
 QVxZg8dh+/wM7DrKoFClId/OWK6TBKSBsDntgw6exoa+9Zd0oNJwNQ2QWdQT0uyLKbcILdXVjJv
 iytL9MYRGCh6xLFKMaN95yjVQoq0CbHWHoY4xHMZDBoOlbXtt6vYgIYs33S/+rtmN+r6YpSIc8Q
 ebUPG4RCRAt+CkJNW7LMUBuq3ZRY+IfDvXQm5W+QOPHL0ovpUu99aHMIlXWq62bM5vRu52W2bLI
 KyThi+L+o9/Ftm8YYum9AqfGSVJSv7RXfCW+KGyHxcujIvI/K5KwTZFdmCyPdEvKv2QCGXOpOAp
 WKbqnVKc
X-Proofpoint-ORIG-GUID: lZOs8SOOWFfAgzl0SFERvpPiwXNCw9i9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_04,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004

On Wed, Sep 24, 2025 at 04:24:07PM +0530, Dikshita Agarwal wrote:
> 
> 
> On 9/19/2025 10:24 PM, Dmitry Baryshkov wrote:
> > On Fri, Sep 19, 2025 at 09:17:16PM +0530, Dikshita Agarwal wrote:
> >> Introduce handling for the QC08C format in the decoder.
> >> Update format checks and configuration to enable decoding of QC08C
> >> streams.
> > 
> > What is QC08C? Is it supported on all devices?
> 
> It's qualcomm specific compressed format, it's defined here
> https://elixir.bootlin.com/linux/v6.17-rc2/source/include/uapi/linux/videodev2.h#L820
> 
> And Yes, it's supported on all Qualcomm devices supported by iris driver.

Is it going to be supported by all platforms that are going to be
migrated from Venus to Iris?

Is it just NV12 + UBWC or something else?

> 
> > 
> >>
> >> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> >> ---
> >>  drivers/media/platform/qcom/iris/iris_buffer.c     |  5 +-
> >>  .../platform/qcom/iris/iris_hfi_gen1_command.c     | 12 +++--
> >>  .../platform/qcom/iris/iris_hfi_gen2_command.c     | 18 ++++++-
> >>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
> >>  drivers/media/platform/qcom/iris/iris_instance.h   |  7 ++-
> >>  .../media/platform/qcom/iris/iris_platform_gen2.c  |  1 +
> >>  drivers/media/platform/qcom/iris/iris_utils.c      |  3 +-
> >>  drivers/media/platform/qcom/iris/iris_vdec.c       | 61 ++++++++++++++++++----
> >>  8 files changed, 89 insertions(+), 19 deletions(-)
> >>
> >> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
> >> index 5982d7adefeab80905478b32cddba7bd4651a691..11134f75c26dd1f6c92ba72fbf4e56e41a72de64 100644
> >> --- a/drivers/media/platform/qcom/iris/iris_instance.h
> >> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
> >> @@ -15,12 +15,17 @@
> >>  #define DEFAULT_WIDTH 320
> >>  #define DEFAULT_HEIGHT 240
> >>  
> >> -enum iris_fmt_type {
> >> +enum iris_fmt_type_out {
> >>  	IRIS_FMT_H264,
> >>  	IRIS_FMT_HEVC,
> >>  	IRIS_FMT_VP9,
> >>  };
> >>  
> >> +enum iris_fmt_type_cap {
> >> +	IRIS_FMT_NV12,
> >> +	IRIS_FMT_UBWC,
> > 
> > UBWC is not a format on its own, it's a modifier of the format. Please
> > come up with a better naming.
> 
> Sure, will rename this to IRIS_FMT_QC08C inline with v4l2 definition.

Ack.


-- 
With best wishes
Dmitry

