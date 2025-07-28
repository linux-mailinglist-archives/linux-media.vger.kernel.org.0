Return-Path: <linux-media+bounces-38533-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A385DB137AA
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 11:40:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDA5C1792A7
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 09:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F23C25392D;
	Mon, 28 Jul 2025 09:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T5V8P7It"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494AA22ACE3
	for <linux-media@vger.kernel.org>; Mon, 28 Jul 2025 09:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753695605; cv=none; b=PBY/F9CSx/NbLk2FoO9IruJefPH/BXq4FtLtf9fwM+6r/nTnsPDhFM/g9mznKE0S3yUI5tXHuXOfZMWLSFYpe6EIbU5LXeL78tW44Z//bgD/UnQpDHIFu0M2Aw+CSES0xYXcX5K+ZGacVP7hc051xMc9tOmoA2eGvowyn4z54Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753695605; c=relaxed/simple;
	bh=QiOeBrAIdjrellCMOaNYCha7F5wS46M1LiivABH2puc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eE9nhrXDDpCPWB8EwZNbHYU/eGVGY16PdXnZceuT5IwDcDph8AduDgB/5Wxt6bPir1YaZgpwxIMwoQGT/15Mz/+5zWET5QMzST9HfSR76ymGUP6JF2fjzbwAT7kQINFUoYmSSsxfAGwn0hyzYipNW6j+hMUQ3bzA/W9e9iBQaNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T5V8P7It; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56S4rQCH025160
	for <linux-media@vger.kernel.org>; Mon, 28 Jul 2025 09:40:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oFB3vG6oMDSksw+IqlEzE+5W
	vTvnqjVwd3/y/mOq5Y4=; b=T5V8P7It8OhjF0CIKXRDa6KThqdnW/9ojBQXNTKg
	w55P/G0u/d6gHVqyWSpcirmZyfECTukbdy6anyJecWkpIjq0cS09/b8hIzXcq+FD
	mKG4hWT2gyZVTHavL+UPeQi0UunHhIMvYcuEYfrvIXxid8v8ePZv7/npSq9pxVYP
	OWduBbOYfpHLh1VUIRT51TMIPM/1ZNLCRPmNe+LUQTw1/of0x4WF4OH3n2iV8UUu
	LZ56X43pLPiv0sd8fEGIMKIsZZ20xws++qwU3NHGSyKxLKuVB/SC5ATuE/tKh0lh
	/4gx8s7V07QX1r1MmBtdhq68S53D4ck4mV7KHi0a+xCnTg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484nytv7j1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 28 Jul 2025 09:40:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e34399a08fso1119861085a.1
        for <linux-media@vger.kernel.org>; Mon, 28 Jul 2025 02:40:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753695602; x=1754300402;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oFB3vG6oMDSksw+IqlEzE+5WvTvnqjVwd3/y/mOq5Y4=;
        b=Dsz5fL3Op96AY7+of2ry4mOlejgpfXA7ktp7Bx/xwnyz7sCKJSyDzOG5Z/qsscRIjK
         Cy3WN47AGMuko/K74NisZZth+BEyaVmLJMl0boxmN+taNFdLqR1KyfAl5/tG+QEAoUCn
         +umPfSAozLn99L3iTrriKB4idVgZGZ8S/17lJzO0TzY8CR5r2KdNBhYPt59aIVx51wg0
         AeunxhMCc2nLNyp8xNitvv5slwUrzPbvc1TO5fmHAvGvUPxP4fr0GxljxKE/S/2FjmSt
         lttMAwfQIRf1nie9JoStKnsPX4rTFdVetzlsA6qcjpJCeeqdV2pEtQ72fcx5OrEIDsPx
         N/MA==
X-Forwarded-Encrypted: i=1; AJvYcCWrtBj/PkO00q0QxfQRu3WG0iJ6+WiSknIanQ02drInJruYhqKrdaOWDsw3rvxKMnnMo9RpLZdXcTCnig==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWSFBBNI1IGF7ebC6xVjieJsAti4JfjvMAlgdz78cMtdhjJqJh
	ToQA62xyqqel710QKIae4Ud7HuOtex1/yJXjd4S3sOSk7wuW6HQDORszg2LjFCpf0Ya67R/Csd1
	Gj6J7VyJvkvdjbS/rtgDs0buN2Tx1BDqJog3fbcFhqe8wgAb8Yj5OEQjf0bujK5ptIg==
X-Gm-Gg: ASbGncsMhVSIwXsDYSShOvloxDS5gl/6XtwHGEGJDJavmo2NXeGrhy6p7Gytf0Fi50M
	tZmIOWfDVvuVOOobO4Tdvd6/0+9mZUwAZa3PYT3AZF6svMYKzL+AccL40xlWNOW6WOmCy8ubUpr
	DGEStR0fNonL2WGi/a7z+IBh60ndVUqEs2JrjHGDFsY/WlCgwSZZgHMVV2BqdXdD6h0qQtxGNFO
	nnfxLoNQpibBC+D82CaYMPxxUh9AN52/uIchxrBWkpUFs4Cls+BeZdmA0YpS9RNzbnfjG5/8QV4
	ZRSmHrN/Hz0BOn5hQRx8rMPkztzs2XVp0tvdzBwcOWZ/wsISQlnFFGkufjBF3ioPX0zRAMP7x7r
	l5Dlkn7famsODrTjKc1ayHhzfMtxxZMSZjtE8y5xp9oyyrf5bXeEG
X-Received: by 2002:a05:620a:d87:b0:7e0:2c05:6b9f with SMTP id af79cd13be357-7e63bf84f20mr1494156585a.16.1753695602086;
        Mon, 28 Jul 2025 02:40:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFh9YvZXA5UIvwUmMAvvJ/c4paHn9tAvNskBJAWiyrfPCKv85m6T5ST1rY+bjPyFBgbZApBiw==
X-Received: by 2002:a05:620a:d87:b0:7e0:2c05:6b9f with SMTP id af79cd13be357-7e63bf84f20mr1494154585a.16.1753695601548;
        Mon, 28 Jul 2025 02:40:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-331f4278c27sm10815401fa.76.2025.07.28.02.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 02:40:00 -0700 (PDT)
Date: Mon, 28 Jul 2025 12:39:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Cc: quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com,
        bryan.odonoghue@linaro.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        mchehab@kernel.org, andersson@kernel.org, conor+dt@kernel.org,
        amit.kucheria@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 5/7] media: venus: core: Add qcm2290 DT compatible and
 resource data
Message-ID: <gr63jb6yoovm52l6a3h53scnhgkg7xoda6lond26dduy6seg3o@knyd7qavg7yj>
References: <20250715204749.2189875-1-jorge.ramirez@oss.qualcomm.com>
 <20250715204749.2189875-6-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715204749.2189875-6-jorge.ramirez@oss.qualcomm.com>
X-Proofpoint-GUID: AG1CfqDlLB-tI2GGKzZBkJV6lbFaVP0t
X-Proofpoint-ORIG-GUID: AG1CfqDlLB-tI2GGKzZBkJV6lbFaVP0t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDA2OSBTYWx0ZWRfX8S9iQep22LOr
 Y+d5pY1/6tF5U9xKDAE2kSWM5cjUJSaSfaJNjjuRYvz4TIkfYw69K6gXmTax2pgJaLVPCCc0wEE
 AhuoVDE2dcYSFQ6r2q5qk8/xMW98en6jQwwsn/3Av+ok8+P57axicRFmiQgOXTCeWkk9pcPL+ab
 IjJv8bLyEyT9xyUt7pcus9RqWLQxbfsssG9wgXBnMdAa0SpGziP3wa6IJP6+mJn7fFeeYgMzxbg
 zzNWhohA+0j4mRiY6PCOxY2bMeUWE0ZvJJY0g0sg0WOzF6Eh5jRxJ8+vsGYbhVeCWZpg6ASRVAR
 bKzciq7AAcoCIIDtpFoZljmKtxi4ZHo2wdmB4Kc1ksuZufn33+piRZxjLM1K1C+m1+LHKg4K66W
 HWTC2Di8owo31oPUHsCf0Krjx0wh6/L263nprzAFsJrFItn+NaYJxCvUS7QEIu4hz877ReFx
X-Authority-Analysis: v=2.4 cv=CLoqXQrD c=1 sm=1 tr=0 ts=68874573 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=fNMmvbdrdlD2suN_VgQA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507280069

On Tue, Jul 15, 2025 at 10:47:47PM +0200, Jorge Ramirez-Ortiz wrote:
> Add a qcm2290 compatible binding to the Cenus core.

Nit: Venus.

> 
> The maximum concurrency is video decode at 1920x1080 (FullHD) with video
> encode at 1280x720 (HD).
> 
> The encoder is not available to firmware versions below 6.0.54 due to an
> internal requirement for secure buffers.
> 
> The bandwidth tables incorporate a conservative safety margin to ensure
> stability under peak DDR and interconnect load conditions.
> 
> Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/core.c | 51 ++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)

-- 
With best wishes
Dmitry

