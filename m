Return-Path: <linux-media+bounces-43276-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0F9BA5596
	for <lists+linux-media@lfdr.de>; Sat, 27 Sep 2025 00:37:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54ED91B25043
	for <lists+linux-media@lfdr.de>; Fri, 26 Sep 2025 22:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D19428E5F3;
	Fri, 26 Sep 2025 22:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CQiNTdtY"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5E672639
	for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 22:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758926210; cv=none; b=ecMc91ZCW8tc6pB9x7GJGccgX7XWYyGkS1oJMvHHAoS1Bvx8xg6gpetlqHnOpMDWLY1x+sUoduFKmZSFLXPXHsHmKKqf48cOsVLDHLTjq9qsoBjMjoOLMQzMqeNu3KyxHluRlihHycfVrWatSG6tjb2WIBOVfbaLKcHp5K+7lig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758926210; c=relaxed/simple;
	bh=LtDarIZoiT8w0O5sJbCrOHrzGdFAgoPYvGGnch7FhWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sfawZyoKh17IymG/wSI/B8naZF6qgeJBcsHYVRHXP/7bVWZIqBT21TZ0Ss0kbO+i2cZ871S3stE15SR/6SmcJCz0hILRcEPDBcITcujZakdwryuarL00C9j8K87l7Q3UAVkpevCYgskSZfXvDYC1yZdZa9VhVxPUMWqf05TBHzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CQiNTdtY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QEX39c031244
	for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 22:36:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZLSUvcCXErFMAa2Q2lMIRtHl
	4lWxdH0fa1UAKAdTCQI=; b=CQiNTdtY95/oqBY14jdxzCB/FODcD14EBxyK92e9
	pYgq7LkBwEWHJECiVY9S5MBspcP7Hr1XpT66Qd5ElEeoRiFhNu5W83wLIYG8KDTn
	1CsI/9TQfPEvvRcXVeXoFYvbYsXgWSYvxhC/Pq6AUZangYhEYcmJT9ccCRPfzcba
	OjLezSP5ux8960lM6KZ9cPs9Sa4gyFkfDgnQRia0wrNjrsD5A3ciD+Ij4BBSHolD
	G0vWer46rUVY+9bAv/hfnHo+VdtVRRR77QOSfspIT9M3pnnlw4Mo6CBxdQguQZqd
	N3PbZ6xEz5WEq6IwNGX2njmSa3+V7ommfa/dChqPwQOC+w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db34mb5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 22:36:48 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-792f273fd58so42984726d6.0
        for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 15:36:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758926207; x=1759531007;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZLSUvcCXErFMAa2Q2lMIRtHl4lWxdH0fa1UAKAdTCQI=;
        b=IChON6+burXXP8izift0OUYAeL79j1rBpNv3ciZh0cKMueVPhmyBQDudar26Vf/x/Q
         bcakQpZ5BkV5zv+U1ftugdxKouufbaap55dQfUAF8gDUX8OrT/lptFW2G5XFcNb33+/X
         AnxzPDQqh+pFMYhT5ju2QZeWB1HbxdfJmqEUGY25MdCOXd/30nGKdDxwT4YtQAEpYoBG
         drD8neWjg4x9YGnlNakTnXwWbPo87APpWcwFx9pL7ZrHQiFtCdD9NnbWyOwfWQ3kd9VV
         6+rfn3KSq5/r5JBZnhEOhQ04fV7ya8D/bYg7tOWjBiDQHhUnccU5m291MSJAp7dy7eh6
         Caig==
X-Forwarded-Encrypted: i=1; AJvYcCUatc8FCk3jm4vXJ2JN2lbr/Daeng6oEyEV/jsxJQSDodPgoUvm+o3I2sBGqYIhqddfxcuXCgvaWr6wag==@vger.kernel.org
X-Gm-Message-State: AOJu0YyozRVFIMhWJGauxLvQATZAquHKXKt5ys3dLqwsjRKFnAp5/icU
	fLtdbIuY4KAkwWBtNyUrT6T4yUwrpIVBD7pOuJagiStDYIgy7vlOdLqNKgPn8X0FTOuxVZ8hdcZ
	Ngc6lf+9PaakvgEDhcaRDpy6QQUyp251D8Rn1Zy1Tgre4oKqWdi4LOOAHfYLKMKsWjQ==
X-Gm-Gg: ASbGnct1d4d3zFkQ9ModFrpLLcN2tlB9dcsnreHffL0wZqAyH1meob776sz9mK/iO4Y
	HOOYEF9UZc2xDxw/RcXZv4OzvFID3oM+pAklQqdIXErAfS1TTNvinV2u6ZNyFT6cxRMWr+gO2gi
	qr/Uz8ymXnzibftz/Kxir7J9sByXdyPNc0MJYuRGbrz8ZR6i2ZMVYvg0l8J0UwW+zOtc4u66ZwX
	tkk+ys4xDu39W0uT+A5DCnBluZRIAGeNCzATe1Lg+fQhDgfm/dcGMiRPuz62QBqwMzPcAfxX/Es
	XE31ygoB4gM9QYbYeSA/eFGttHCedp/UT3GHkNVK/uw0XnqiriAKt5SB3D+wB6bqtUOqAlgG5LU
	8Ox0d9FPXxACkrbCnDfEbOzUWMfViRmwvHdZW7Af0erOqIJ/Hjs+f
X-Received: by 2002:a05:622a:a956:10b0:4b4:8dfb:33c3 with SMTP id d75a77b69052e-4dae3c29955mr91817611cf.59.1758926207266;
        Fri, 26 Sep 2025 15:36:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbe1wxhgonW447Fgu4TmABd4aTg5zyqFc7Zo18GRYrwhFmA693k/yaZQWV+62ImRcaYWFxNw==
X-Received: by 2002:a05:622a:a956:10b0:4b4:8dfb:33c3 with SMTP id d75a77b69052e-4dae3c29955mr91817311cf.59.1758926206763;
        Fri, 26 Sep 2025 15:36:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58316656973sm2136641e87.89.2025.09.26.15.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 15:36:44 -0700 (PDT)
Date: Sat, 27 Sep 2025 01:36:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, quic_vtanuku@quicinc.com
Subject: Re: [PATCH v8 2/2] i2c: i2c-qcom-geni: Add Block event interrupt
 support
Message-ID: <of4bwtpgxib3emdltnnlzy74yips4znmjy37hzdljhssikt37q@m6guijrjuxpt>
References: <20250925120035.2844283-1-jyothi.seerapu@oss.qualcomm.com>
 <20250925120035.2844283-3-jyothi.seerapu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925120035.2844283-3-jyothi.seerapu@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MiBTYWx0ZWRfX8uSUSNpJ9PCp
 d0q4f2Mg4INjfV7E/4r7n9B9MEd0Ub+h+IsDOBTRLHs5Zb2W9zsrOJGmVyJwTWXPYnB+/ssJNl7
 v0qAPUeOv31ctnL5iV5sq6+EfvkQ59V6Mf4zi6viiY4/BwBzSNNMFNnHdGz0GGRHyyEVHr6Siz4
 cBDgAHs5zz2Yekpxh/B9R2Rh3IXErtfQwP7ldQwHWvGccAPuk8I7B/u/js4Qql1KtsSNQjo4QVj
 Y17DGwnE8VlMRU6TOKNzmIQoM0f+yPYwKEs8vnZ9qSBlVXUCUErFHbfH9TEGVy8fcTKv0p2x1K9
 GyB0EuJN71BKgojYGGDhdKm/YyF96CUuK28ic6eudcwpptO015hNcjUPHTC2yQJv4LgiAWMxS48
 uVCHgOspqBv0QV/08MSO4Z/fT+SRrA==
X-Authority-Analysis: v=2.4 cv=Hb0ZjyE8 c=1 sm=1 tr=0 ts=68d71580 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=fvgdV2PV7z-sFcuOFeoA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: qaE2T5FyI-Rz2aFd4VYypKPifE_dE1cY
X-Proofpoint-GUID: qaE2T5FyI-Rz2aFd4VYypKPifE_dE1cY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_08,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250172

On Thu, Sep 25, 2025 at 05:30:35PM +0530, Jyothi Kumar Seerapu wrote:
> From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> 
> The I2C driver gets an interrupt upon transfer completion.
> When handling multiple messages in a single transfer, this
> results in N interrupts for N messages, leading to significant
> software interrupt latency.
> 
> To mitigate this latency, utilize Block Event Interrupt (BEI)
> mechanism. Enabling BEI instructs the hardware to prevent interrupt
> generation and BEI is disabled when an interrupt is necessary.
> 
> Large I2C transfer can be divided into chunks of messages internally.
> Interrupts are not expected for the messages for which BEI bit set,
> only the last message triggers an interrupt, indicating the completion of
> N messages. This BEI mechanism enhances overall transfer efficiency.
> 
> BEI optimizations are currently implemented for I2C write transfers only,
> as there is no use case for multiple I2C read messages in a single transfer
> at this time.
> 
> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> ---
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

