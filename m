Return-Path: <linux-media+bounces-48615-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 740FCCB4BF2
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 06:18:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F9EB302176D
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 05:16:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22ABE17555;
	Thu, 11 Dec 2025 05:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R6vLDzGe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cvScKcOH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BFF2874FF
	for <linux-media@vger.kernel.org>; Thu, 11 Dec 2025 05:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765430199; cv=none; b=KaFZMFrTjkz3fKig+Wrsid6HysDASbi2W/fPiihYjS9JahtmmwmrCbj8U9x6SpdxwLv1frb6LWnbNtKrcrhu+qpoAcHD7glGZxlySp4dbbiMWIQNcUvrmI/V3iIawekS7w/KtDm7sUbxHGvG0FkgjIzZbhfvODunLjvDiUn/QGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765430199; c=relaxed/simple;
	bh=RSMy5KgESJbvLSPLrzgpFHOuVXXnqHZI8OL36ABoOyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ggiy/D9GjJ4DxK3hTZ1zR5iSeMXXRDdoUh0+OkNe/PmBq9kHvlHWs4wKxbKb+afhpy4GDSD/bcllxZT8YZL6ZSAojVru4bjdsYA6sGiXO9jGMAkBo6lX8rG6ZWDB+YYVWaoX9IUAGgSVYwOkvVCf7gciTGD5RHbRqeQDp9StfT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R6vLDzGe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cvScKcOH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BALP3i33726241
	for <linux-media@vger.kernel.org>; Thu, 11 Dec 2025 05:16:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iC64GZYTP0ExJ/XDQw8it7Ll
	jnTS1uU1C1vmg7w7aMQ=; b=R6vLDzGeKJ7fuWfq8iCqBLPrnPm02FCx8DIeztJl
	fxi5NIka3u5/QMWlND9UN6VpNk3+Gx9WRas+jzgUVKAcT1ZT1JskD3tUwFa0jxKk
	3jonYrXiiao47L2lgkvFKWZEiaztAj71+vFoD7nWTqCytqQPUENntUupCDCsT+r6
	9P9m5zUelzE4+NLFOUHo/a6HX1L+NAgxSRoGl35FZm7Fcq56hbfUIwAIuvQAyeLe
	xrm6lOc+BGF0XNVZ+2WwKrFvDySHnOyX9pyeA9FmbojhYCxnCDp0HfXjhtDFxQQ/
	DIJlny440F54yiPMM3EHYc7wvuZTOziXmmW/ujok8FrAxg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ayg0ps6hh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 11 Dec 2025 05:16:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee09211413so14066171cf.2
        for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 21:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765430194; x=1766034994; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iC64GZYTP0ExJ/XDQw8it7LljnTS1uU1C1vmg7w7aMQ=;
        b=cvScKcOHdEVb+cv//IvRxkppVFk0LSAt9XkRd5h6ksp6c7ZIP8KpPFDvSiND9tDjD3
         8uL0RxClOffMM4W21IPfKZnfOLxUDVYdBInD+X1Gkus2yzKXKYZib5S8hBfQLcsSI/O/
         Wd7U0l3cj+X7AsbIWQvdp5uO/dOmEqlocmM5bRzoBD7+5yMAxiWeid6GrcLgmyY4NU0y
         gqXoZ/sYxqYnAWsVHB/NuTaJaWryG1zwrcOwWlyuZZLeKGKcA3cj1wWWov88rHG/Kwxb
         czaQKJY8ZNSpTYaOeyp4rtpdZGtwV/5YzqtLx5gUUg1C6j2HBpSrIyEVFVJSCLzyfFrE
         7PWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765430194; x=1766034994;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iC64GZYTP0ExJ/XDQw8it7LljnTS1uU1C1vmg7w7aMQ=;
        b=sm4snAlzl4uavwQfFXkDrqPXNDULtOLbO4I/g9ldehy6g/VsAHF5VX4tvJjxzWn9zk
         2g2YeW+FY8cuT7+UjspTMIuweApJ8mEx4xAw4sIhZ56aVRxfxvmsV5NTqTFQpzOPXol/
         UZTuye4d7GJ16FO4Xr5g8PtvQazqZYMr5XOVJXjyqImzLgq3L6VpqwofushsWmPa6/V3
         zJYEiArYQXuUZ03BpBjjaqE/W54HJMaTMkVD3c8mYiHwI9ayyJYEQzHcRxl4Xqi54hg/
         HoVo0jzofJUqG8Sm78nsNiHaxJL8DllLQHhKqgS5VHF0Vzuu0991kODM8k2nYleChIYU
         FStg==
X-Forwarded-Encrypted: i=1; AJvYcCVlKkcLcI5ce20zywDIOwi9bRv12BoasrfBv0LpbVK3jwp/4fd2/OXtau8uIs+kur4NtAyVCp8WRiY0mQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvoG1frYGrDMMKCDHRSCOVpEyFzlXUdXOON+RAbIwBGa620DmU
	EwyrQHTJB+6vsgiX0Muo7VyQVot+3boCHWs8UPUxNIGsL0rpckv89/U1hbuaJ3QiI7LfgKkzkVa
	4G5d7YyBGd+nsINga31veLjA1iAqYgpOErr/zV2Cmthj//p+yV/oYOobpBgzuISWU+w==
X-Gm-Gg: AY/fxX7MP8FgGx9fJCv40Yg2wrAfNbeYUATq6o23TCsvfP9HHWlEQanRcVvLzZRtAVm
	0WY+TDjd4kYYbV0yLTFVCCeNYTmFiKmslUkQDQPUceC9J9869OL47rocgDMPhD/oRF2xGCD9sFE
	d9AOJPXQHLrrgSBxlA8+9RGwQpWLrlGTUu0JJufy7Agu8RnkaE0UJ5A9wBEAL4lSCVT5oG7iaDd
	Kt3lcXWcfsht0ahIpVejM/c+VmkWYIn1Dh2pq1q7SyiH53xS6W9SEzRyiaMCJZ/zf0GO9UDh04q
	1Tujiv1mqzXLKozWCcoYGCODY0+d/OsTDLqoD0Zu0+8uq1vUa5DT3UXoLCcAykrYGEZ40UJvEqi
	/v/wkYIPz/hV4a9x3aE+JFEDD33rSxMuOY0wK1VF3r1wU/rzvAT9aFlroQTN0NJ8bvV0kPlbP8j
	1IpVgHNS4vWz3UeLL7vPwhxcI=
X-Received: by 2002:a05:622a:1e19:b0:4ee:1ed1:43c6 with SMTP id d75a77b69052e-4f1b19b88c5mr54294091cf.10.1765430194542;
        Wed, 10 Dec 2025 21:16:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwd9oLeFDljFaCQeRHzACMAkn+4FkG8O1G7wq3ItraCp5oly9VXU3f4nhxQ9Ma4hvYTao8VA==
X-Received: by 2002:a05:622a:1e19:b0:4ee:1ed1:43c6 with SMTP id d75a77b69052e-4f1b19b88c5mr54293851cf.10.1765430194070;
        Wed, 10 Dec 2025 21:16:34 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-598f3199e93sm522084e87.96.2025.12.10.21.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 21:16:33 -0800 (PST)
Date: Thu, 11 Dec 2025 07:16:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, Robert Mader <robert.mader@collabora.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: sdm670-google-sargo: add imx355
 front camera
Message-ID: <wwpqaecvz42jopgaboasbh353ieelctpvgo3yj6y5tnxoem5oz@j5sbx3yxntot>
References: <20251211014846.16602-1-mailingradian@gmail.com>
 <20251211014846.16602-6-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211014846.16602-6-mailingradian@gmail.com>
X-Proofpoint-ORIG-GUID: epxYxZjUYYa6oOAS6jt4Z48SKcve0LZL
X-Authority-Analysis: v=2.4 cv=b46/I9Gx c=1 sm=1 tr=0 ts=693a53b3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QX4gbG5DAAAA:8 a=pGLkceISAAAA:8 a=He3dl_zFzQSlanp4l3sA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDAzNSBTYWx0ZWRfX/PoVrVZqHUfy
 iDtMgcuwncpT4SzXT+1cnZZ9nNMebrWdqXDBAvtJopct+rcrloZm3hjvx8btBUw0BZx3PiCugAi
 cP/7Rz5lu0vYjpOy4cHvHBuRR5FSalZwEJiv95KPXqvi7Rzh2yikAywkDUkvl74HwsUfMMSRXo8
 F0n5NOHB19UI53V7s+scLtiE6FCDzMo3eiMbtAQOUtVhbN0yRCigp2DBPgK66YURxvT+DSmhxtJ
 UN3VT1ZdKTKpghP+l+zdTgsBLG5YQd/SQ7AxAHIsb6fKYxRqkZJzheDWgOnWTG1BA4q7+DfShiV
 YmwKnaGG+RpNJEI0J/ulLHBY4x+v7Hc7ylDXyrYF7BvWLPJT+sEGjTxXT36n9m9P4i4L0v2VmuM
 o6cQEYG+pdGPPFp9GHWAZqBTNM0zhA==
X-Proofpoint-GUID: epxYxZjUYYa6oOAS6jt4Z48SKcve0LZL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110035

On Wed, Dec 10, 2025 at 08:48:46PM -0500, Richard Acayan wrote:
> The Sony IMX355 is the front camera on the Pixel 3a, mounted in portrait
> mode. It is connected to CSIPHY1 and CCI I2C1, and uses MCLK2. Add
> support for it.
> 
> Co-developed-by: Robert Mader <robert.mader@collabora.com>
> Signed-off-by: Robert Mader <robert.mader@collabora.com>
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  .../boot/dts/qcom/sdm670-google-sargo.dts     | 107 ++++++++++++++++++
>  1 file changed, 107 insertions(+)
> 
> @@ -392,6 +420,64 @@ vreg_bob: bob {
>  	};
>  };
>  
> +&camss {
> +	vdda-phy-supply = <&vreg_l1a_1p225>;
> +	vdda-pll-supply = <&vreg_s6a_0p87>;
> +
> +	status = "okay";
> +
> +	ports {
> +		port@1 {
> +			camss_endpoint1: endpoint {
> +				clock-lanes = <7>;
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&cam_front_endpoint>;
> +			};
> +		};
> +	};

This would be much better:

  &camss_endpoint1: {
      clock-lanes, data-lanes, remote-endpoint here
  };


> +};

-- 
With best wishes
Dmitry

