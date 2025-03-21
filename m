Return-Path: <linux-media+bounces-28589-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBFCA6C16A
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 18:27:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 61D561B630B4
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 17:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50C6622FE08;
	Fri, 21 Mar 2025 17:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i87AR01m"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DBB22FADE
	for <linux-media@vger.kernel.org>; Fri, 21 Mar 2025 17:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742577872; cv=none; b=PZT7c8kMTLaDUVTpRCw0ocuoDFe3f6ixOgVTKlVueq/WkHEBDl8NJmPNsVmpF5khtp7T9l3q/1G72f90Tkq9FB6t2yp19tk04DGa5hBn6vGC4s/HgsSsSPLglpRiYl/mI06y5UYNL654i5vzGUhFadJlvkShwPaAzGToyvodjJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742577872; c=relaxed/simple;
	bh=wmgWDqUJvlikxwYSBQGbNkTJck+p4wsSLylUsigCs9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e/McRjH/S/hurU6O454SnMuni6HYErawdkieQHNGZXug1KdBUB7Kx8hCu1ntDNXJseoe8PBxzRYOEZuLh2ll25cADh9pVzwqlYqOtUh/FC0XXDqv4Lo23XfX1vVQyIYuht/Ey2v96QBZVdrSPFLLcmzP972GA5vbKV+E59wGN/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i87AR01m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LCT7UY027372
	for <linux-media@vger.kernel.org>; Fri, 21 Mar 2025 17:24:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fmyEdbwSj/HfKYKw0u3nOMsS
	tnOViYSt8oyx8TwW7b8=; b=i87AR01mow3m5gEH55ckDnJpAaZZ9lHk5FbD2AR7
	EE2nqJ/KQXV21AcN8xGx7FtunGIgNEyalQdKUGgb0RgnD3PW6JrmlzPU9E84hrZy
	XomY/qV5A/MfVWn6bJz8O7LFG8Zks6wN/SuZwyQXzBCC8VPCx66w77HekUCX5Yvx
	yOU8WzLYBJh6qgJkVXCl7VEcHbK59Qpa74GiatPXjOS7vwhYs6cmhWn5i6SizOpI
	Ai4Ytx8H26+jXrR9AezXHFlEczRqqwIpPvbo+qOFgZEGvlZPklOymDq7c+9SP1Md
	bWxT6A1esgHoiTbkORG9jsg7dL+yxdq3bq/TSayQKY3/5Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45h854gsqe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 21 Mar 2025 17:24:30 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e19e09cc20so40393016d6.2
        for <linux-media@vger.kernel.org>; Fri, 21 Mar 2025 10:24:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742577869; x=1743182669;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fmyEdbwSj/HfKYKw0u3nOMsStnOViYSt8oyx8TwW7b8=;
        b=cWHFjEdIXVriQmEYOw2qh2/hjuRBJ3Sxz8bMh2yT9TzmZmkWEJlNefVJoSnzBTJotN
         RMUUl0s8CnFS0h90T+zXBOOkzoIHT97Kuaf7Ck5pi5YmIAPuJDUdpcCao4jc3QZQ4IR4
         YBTLAcj7uYLdIH67Dpaucu5sCe6UiintbLmtc4lkqN1t6DIybUL/n5pr9hz7cnLMXsoO
         lhi4OWSpg5LWELD9MVLbDq5JKsErs68o04bt8mDCB031PSuOJTBf0tEz5czPCUNxN6PQ
         bBSqR7TkvQkGC4ghoRrtFgWql38ynDs0CcedJRasbqbtNbmovvmFyLYNaT2NuoG9Df/c
         7IHg==
X-Forwarded-Encrypted: i=1; AJvYcCVKzB/RJzlj1xN/JJVPXhkWBiKIagBvm05ntxsDz4zqiWiUTwEyOLUVm44QFbYJ+7QwN7jGIXOHSDxcLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzjZwKy8Hy0l0Pv5biJqcn1Ax2I5lMRVVG/28sswFeFeUkB5ur
	P/kdF1MI/9X2+Rs4nn3d+cXpbSH687jJGSd3eIeYszGFydoTHBfc4LTgkgRoqV/1u//u8ZT+oVi
	JaMSg7P2XoIyVP0j115nqtZFboFYwG7h8j2fvhP2exPSYrYcdc4sDVBuXvPBMnw==
X-Gm-Gg: ASbGncvzv4yqi6N4OwoqNZov6VLM82MuUhIQDk7P/lbdll5YslXycKNsiEeiVAuG0oM
	c2J+ZIbVKyVLpGl002m+qX5fure+v0xaTWQSWLd135ibGlVnvBce1qBZ1XDmC+c1SnulX8p6kUl
	vd4RgsDrAzI3ZJwKM1o5iDsU27rxB4F/hDFbzNwJOq0GPmhZY2YJiN0+SOUDEuoRWDqlq+Sh94x
	HX0VEs1cSFkyRZfpav/Qqi4oMG9xfoUQJIBcENFVemREWp4U1kHvgk2IUdzkb/D7yCJ5l+Sjvpf
	KudeLKNshzxZ2oGPqD8dw9bTfcADP00ucOJX5l2bUQjlYPD6/jTZL5pjIOIyQvXo0iwZwButAUc
	MV/A=
X-Received: by 2002:a05:6214:d64:b0:6e8:9e8f:cfb with SMTP id 6a1803df08f44-6eb3f2e309bmr41689716d6.24.1742577869121;
        Fri, 21 Mar 2025 10:24:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYPBMkBWN8m5K5k3xpn/3XXm87TYAnHC/7fY88pVAc/I3QngrdnmwHHeW81kaD1vdN8OD9hw==
X-Received: by 2002:a05:6214:d64:b0:6e8:9e8f:cfb with SMTP id 6a1803df08f44-6eb3f2e309bmr41689466d6.24.1742577868651;
        Fri, 21 Mar 2025 10:24:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d8f38b1sm2966901fa.84.2025.03.21.10.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 10:24:27 -0700 (PDT)
Date: Fri, 21 Mar 2025 19:24:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sumit.garg@oss.qualcomm.com
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: sa8775p: add support for video
 node
Message-ID: <cp2uisloxbt3kxe2pnogyqwblp6cjg6srao6mzxozmwn2zmrlr@5vjgfeyosmza>
References: <20250320-dtbinding-v3-0-2a16fced51d5@quicinc.com>
 <20250320-dtbinding-v3-2-2a16fced51d5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320-dtbinding-v3-2-2a16fced51d5@quicinc.com>
X-Proofpoint-ORIG-GUID: FSl3cKV34s5-Zf6Mlbf25GTDAXEHcCqf
X-Authority-Analysis: v=2.4 cv=ZtHtK87G c=1 sm=1 tr=0 ts=67dda0ce cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=MV23zIJfk3Kbbaa4CC4A:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: FSl3cKV34s5-Zf6Mlbf25GTDAXEHcCqf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=788 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210127

On Thu, Mar 20, 2025 at 11:36:51PM +0530, Vikash Garodia wrote:
> Video node enables video on Qualcomm SA8775P platform.
> 
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 71 +++++++++++++++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

