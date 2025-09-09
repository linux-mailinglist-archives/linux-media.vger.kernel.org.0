Return-Path: <linux-media+bounces-42117-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBB3B4FE8B
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 16:02:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08F231B23A1C
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 14:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDFA9229B38;
	Tue,  9 Sep 2025 14:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cWzlZ2CX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E038818C2C
	for <linux-media@vger.kernel.org>; Tue,  9 Sep 2025 14:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757426524; cv=none; b=GS+IYxXjiRKs+U8/6mD79MJglBwLDNxgsjQ99DMyqwqkkddNHLBhp37hkCVyCfx8ltT9T0Y3PS3jHhnidynD94QJVwdmr2RgDSizmElotw53rDK/m5gJJkz5h4mDJcmePooRPDKVXcNFE0wKFYsjTv5QAazdUFqUkDaFXCFRXBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757426524; c=relaxed/simple;
	bh=SKFCckqprHkjCOnclksylqPnY+SvrnqhRqe7pMrdZDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WxnPXCX16u7JMGuGl+xjCqSSDf/LCwsxUod6gnlMcgxyK9yqtDC+kuKPPQd2OhVosbst/Bcfpoz6JH4wZcZMiSOqTpAObDiOQ4iJ6igAfglwF9amoHq57B6ZVUFYoTaAjfIQtC4QkgNRNmOSsP5DsBOK/gd435WG24cnVrV0eZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cWzlZ2CX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LoUp020516
	for <linux-media@vger.kernel.org>; Tue, 9 Sep 2025 14:02:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9B1kQb1T0UY6CATcPtK/c+w8
	8VXB7tYmHIDUsbEh6cw=; b=cWzlZ2CXdbwfse41ZXIbaRErWR8Y5sCPurxEUwVd
	YWhAZCgktvv9YMAF6NVErZCYsp1wkWLw+AX3mLOAo7nNNEXsOPRuxBA1VJGk2eEa
	UyC/bLydqe3gsWTPcRUP0fV1RHDvi/Lp4ACdRc+TcNIJMOjs+cY2iRZ3RNW4yt/y
	5wJroWh6r/H/SLaI1jougP7sAQPt1nCmf5+049v2eAW+M3oKg7PBkMbdX5FPElTj
	mGDHKrmRpqPd4362UsgaexfB+3WroQeMUnnCyEwuU5JQUGmXemksDKMGvZdi9U7D
	+XAyQ2bCW64NRW6Sz4Xl84P4uPtKtvK4S+rurdTXRCljeQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc24euc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 09 Sep 2025 14:02:01 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-534c8d5d97bso556463137.2
        for <linux-media@vger.kernel.org>; Tue, 09 Sep 2025 07:02:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757426521; x=1758031321;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9B1kQb1T0UY6CATcPtK/c+w88VXB7tYmHIDUsbEh6cw=;
        b=H4qxKItHPHvuWLJPr5nxQAoJIgPWz9TUKWFHl7FGypMVv3kmbSU3utYF8Tmch90G5y
         Y7CCvKYpBczBZOzz5Bnjxn4MFhoBiVK20rYrC0MDz1TiI6IuaUjZROKA156sgVhIIZVR
         Of4mlg9I6y8S0nbLlgsFof1pgk5WlMtskr/zzlm3y518LXbPivvETDO7KPeCbIID7zg4
         eKiShVRbkRpbxor9XaZ/c9qlHTyXtnpRTtvZyOhui/7AKrS1k6ahJE7iDUN8A7Ik7HT1
         yzKsr0l4rvEBzjPSZ1JVM/ENvvPmsuJpPpuF+72YIwPoRcuASB5UxMupXP3I2gpCdxgC
         13tA==
X-Forwarded-Encrypted: i=1; AJvYcCWPzj4aZIs7lx5Mz621+XLKvASfW3w/5SMbz76sDcvcIAl7dx7Ko2DQGyugXYrq3eN7PY2+g2+5K9mD9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVvfOzY3eN0JMD39Ov85siIA2QQjZ27QzQ/vJVW/8wfiLw6fbi
	PtrpYc4gcKCjDI/U6b6IkStYB2R5mFozD+RnM0w/A4I9xpbLpUs/JXkuBA9P56s3w3hQZG55HOS
	jKjGeTrZk7Si7E8QbD/z14EVDRZyMW0FdevDu4b3lReRrTWG8c+LZ/fOUjgvNT0rL4Q==
X-Gm-Gg: ASbGnctXRCWiQeXBCTeDMprhYc8T5/3CFTYogoUyG9sQMwGE1eWJT/uUT0HQbAHZYDM
	dWveOoubJOLb+pgrsRgBqCmOfd+Zg/Nv2B+fsnPX2w+m7vFXMIIb0qBIpVvHBDLQObwyTjbRCAO
	9IylX0FOELVxJsyccb/EhNl9ms68+bfAdFEtwW6g+JNihUE16Ffyl3NNU4sROm+OArEXSmC/j6/
	Vtz7eQzemJL8QY3lGLgSvhE5LM0b8dFRdZ0mKhVTgGaWe0vLXX0CcgCAXcHF79rOR2wWp5cFAry
	Z86X2EQ3QJrCyqL7YUXSQUlBANlOveQfdMZsgUBJI+ltKX05YlvGnXTrb33GEclD0gGbKrF87rP
	4/+vjkiymMv6cBhCEfcNQT/UiF00PyjzBfGd38UW/XDG9fm8FBrs0
X-Received: by 2002:a05:6102:644a:b0:4fc:eda:abd8 with SMTP id ada2fe7eead31-53d13a4ae5dmr2295358137.24.1757426520477;
        Tue, 09 Sep 2025 07:02:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEL84NEi5zzLfmvA6uWURA/n95r+KLG5Ks00UXmw2/s0p20cMz2peYilnoYQd9/RRTYJAcA+Q==
X-Received: by 2002:a05:6102:644a:b0:4fc:eda:abd8 with SMTP id ada2fe7eead31-53d13a4ae5dmr2295275137.24.1757426519750;
        Tue, 09 Sep 2025 07:01:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56818067eb7sm537728e87.106.2025.09.09.07.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 07:01:58 -0700 (PDT)
Date: Tue, 9 Sep 2025 17:01:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: bryan.odonoghue@linaro.org, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org, linux-arm-kernel@lists.infradead.org,
        quic_svankada@quicinc.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ravi Shankar <quic_rshankar@quicinc.com>,
        Vishal Verma <quic_vishverm@quicinc.com>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: monaco-evk-camera: Add DT overlay
Message-ID: <w54mpkzk7irjb7m5jiouxhj77czj4ex72oqioaph4o5qhcsay2@qjolctktsu4s>
References: <20250909114241.840842-1-quic_vikramsa@quicinc.com>
 <20250909114241.840842-4-quic_vikramsa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909114241.840842-4-quic_vikramsa@quicinc.com>
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68c03359 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=xh7zYxaUke6ZEiU0VLUA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: iiHJubyt1On-bEGotxWg0WvbO8ldkgPc
X-Proofpoint-GUID: iiHJubyt1On-bEGotxWg0WvbO8ldkgPc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfX9agY83p19B00
 whpwB0P1edrYgyf6638tiChTpCTbxHu2GDUU2kR+Sfe7LLWg3w4RL/C/zrG3devI8A84z8Yn4YU
 AtYH79MOQtdUBXs46l3mkUO5ohWd7zJp8qmWJjm1tQH5XT9OyHewbGeKnX54b3Wbh2SmGizRRL9
 VCqMlRUcXMppLKCOtg7yMs1cbSrvkLau+tH3VWJb2CUOpejTIP/AXNYsRxtRBg2qPSafafRwUem
 QNuqqYKNqTDmcvk8x8HMD3nAWFGM5QTzOjVeIgGAMGHqNiN+r8CVOXHekaK/fkTwW6BU5vfZeJ3
 Kevcep7kXHArCoH6YXDKBj8GovOcsp9GavP1gWbrr4Px6scmnjV01LcbK95ILWGtxdmPe7CITsT
 +pC2hRer
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094

On Tue, Sep 09, 2025 at 05:12:40PM +0530, Vikram Sharma wrote:
> From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> 
> Enable IMX577 sensor using the CCI1 interface on Monaco EVK.
> Camera reset is controlled through an I2C expander,
> and power supply is managed via tlmm GPIO74.

Why is done as an overlay? Is it a seprate mezzanine?

> 
> Co-developed-by: Ravi Shankar <quic_rshankar@quicinc.com>
> Signed-off-by: Ravi Shankar <quic_rshankar@quicinc.com>
> Co-developed-by: Vishal Verma <quic_vishverm@quicinc.com>
> Signed-off-by: Vishal Verma <quic_vishverm@quicinc.com>
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |  4 +
>  .../boot/dts/qcom/monaco-evk-camera.dtso      | 98 +++++++++++++++++++
>  2 files changed, 102 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-camera.dtso
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-camera.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-camera.dtso
> new file mode 100644
> index 000000000000..5831b4de6eca
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/monaco-evk-camera.dtso
> @@ -0,0 +1,98 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +/* Camera Sensor overlay on top of Monaco EVK Core Kit */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/clock/qcom,sa8775p-camcc.h>
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&{/} {

Is this a different product than just Monaco EVK?


> +	vreg_cam1_2p8: vreg_cam1_2p8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_cam1_2p8";
> +		startup-delay-us = <10000>;
> +		enable-active-high;
> +		gpio = <&tlmm 74 GPIO_ACTIVE_HIGH>;
> +	};
> +};
> +

-- 
With best wishes
Dmitry

