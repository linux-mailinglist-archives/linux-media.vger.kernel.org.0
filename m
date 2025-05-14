Return-Path: <linux-media+bounces-32427-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A37AB6051
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 02:59:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF2744A450F
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 00:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DE5E136337;
	Wed, 14 May 2025 00:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oVPfuWvc"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C7C1EEE6
	for <linux-media@vger.kernel.org>; Wed, 14 May 2025 00:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747184362; cv=none; b=p2CaRdjpla6b1F5KY3UsbreKxVgGqNxOQqGyAbZAcndIL7zCGNLASZjSq8HP50NV6WI5Yvn9cU/2VN0fk6/2Zx/P6DXSMM4nRXE8Wm2d+8Da7/yAc0XKl0AN9WihWhU/ZhAwGdskNRwinIsTHPjFomVNICl/yAaA7Wc5sh6ZHYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747184362; c=relaxed/simple;
	bh=PfUaRwWLE7xuBYYWZ9RhZCbng+fAOgq6pjlUuOjLmyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OtbT9iOeDMuTp9BNibNOg2GdFK/Bmmj7xPoDxvHMyGtdIFxZMmoh+80JzoE8B7958HiOj7EylkzGmZuo4bG1ZBEyGv9L4YrgL6crQrYyHo5XvD7AYbdXmTRXLPt31qfAMwdHkSu2FALRK+c3URFPhoKQrV54piVza/L56hH6lpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oVPfuWvc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DIRbSS029323
	for <linux-media@vger.kernel.org>; Wed, 14 May 2025 00:59:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tTxcl01PEmLXwG3vhnhNAzbg
	xBv5KPSQLGu4R6f6OxM=; b=oVPfuWvcLSYlrZU2GlSuiaiibHQb0rWQbCq40ZwD
	ZATrGTlEomBFL2X/tus1rxQnhDxO9fX2Ax9nH0mvz9AVUlLX6Iij2bLvHgX+tgIZ
	DCqdYov05bmLFC5vX4ADmAWdzZ7b75xZfDg/A9b/c2OrP4+YVe+RnHUm2zbKd6ha
	xhrIItutQq9VGmZ+gnqNPQqBnN216lbhLui4WpQW/AvbscW4egXMALgBdgnKvn3l
	PpNSOssRqAaO7tMf+N9vjOsTiwjoD2X79dwS23WQodtrf0j/vx5xpy03RdAG0Z59
	X2cVnu5XgNkaBeF2hV1Z1uYKJneJZRYnbIggXuyLCIHNuw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcngvbr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 14 May 2025 00:59:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5750ca8b2so888675885a.0
        for <linux-media@vger.kernel.org>; Tue, 13 May 2025 17:59:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747184358; x=1747789158;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tTxcl01PEmLXwG3vhnhNAzbgxBv5KPSQLGu4R6f6OxM=;
        b=UqznrrJP/TQU5U7ppGS7mbGXc4o9u5cY/zxrG15bK1TFKYUzxuQ46yHwKBeM9zLDiM
         iNYj3WYGj/L3+cV8VN/SO/3waJKovcKqF9mOilMKnWLumDmuphSMjTdCr0UxFBaM2T/S
         irhxvVtFJHgla9ruOtURdE8eGbUeCa0mLsqaZH8Cyq6s5wt1GXnBsLS0i4cOx0ygwwh3
         FQ+B7h5/j91LUUxn108vPcoviN5ZeOcGiDZUL+gMi5e6yPj/RNM/6aWD3w+6QlOBqTlS
         Xz2xYzeqnc+M0S0wU/qSkUiCWWsRH8/WMyWrnvVTYOWpKY/Q4Lj5xg+B6hV9SL2ZRc32
         5lGA==
X-Forwarded-Encrypted: i=1; AJvYcCUTorUFO2/bQuzsz5T1X+wuDyHotrsOYS+WOAoo4LRjrsynrpbJd8TPouh0Jz0Bkl+X86aNEy0BHsSK5A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy14B+OzhBx0cCa+2Fh6c2Ke9VmXUKH731+NtO17hJ9kM/04fx0
	C+leYlYKIvrxmS4SJnnUDIdPyiU5eUCXyD9OPSCIYe0ncfzlZqN8t/9cWTioiJ1A/utiGUaTXY7
	vAH6SvIVdqMemm4nGv8z7RSkPjoRuOu/senW/n496HnKAQr+JHhMJ9QAA8T+fEA==
X-Gm-Gg: ASbGncuunXPpwspbx25XNamDUw3oNYZ850+HFIggcRi0c2HX6qabyVvQSHhp3q/F0ql
	3+flyWVsIcWFjz+OxCdLjBZzTJeFE5SflJLmCrM2ERFu3kDppkHmT/lleSvaSlZCWW2NZsfJA4y
	Re2jrFxG88BufsKNHBcPGV+ZH36DIT549ZV+ylMwNtGj7hF6QaFrp/dKNA8ueHa23q8U8Nsmv25
	PquGu27jd5Gb4YlIj2nU4ci31EWGmClrgwBDSbWxK7oeZPc4Sw4OSGFkbx4aFoxXHt+Hnl1txIh
	kzE5icCtcROHT4UeND5YtCZ+9OZylDQgcTxTkxd7jmwJbThn4jp/4v72hbb13WnJFjtM44Gtr/g
	=
X-Received: by 2002:a05:620a:f0b:b0:7cc:c07d:e3d4 with SMTP id af79cd13be357-7cd288557b9mr224254285a.35.1747184358010;
        Tue, 13 May 2025 17:59:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYw9SE04klQRvkfoCB/RwP4rwfTjUfhHfUXv4t360h+A2UdXo2t9FLTB1i69oyPRdksmwASA==
X-Received: by 2002:a05:620a:f0b:b0:7cc:c07d:e3d4 with SMTP id af79cd13be357-7cd288557b9mr224251785a.35.1747184357622;
        Tue, 13 May 2025 17:59:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64b6fa1sm2047195e87.128.2025.05.13.17.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 17:59:16 -0700 (PDT)
Date: Wed, 14 May 2025 03:59:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: Re: [RFC PATCH] dt-bindings: phy: Add Qualcomm MIPI C-/D-PHY schema
 for CSIPHY IPs
Message-ID: <naoq2w2rrksdz3wjau43eaffawusymx6vwtazgszv6cwlur272@rctxn6pdahci>
References: <20250513143918.2572689-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513143918.2572689-1-vladimir.zapolskiy@linaro.org>
X-Proofpoint-ORIG-GUID: zyuekB1clLP7L-dCsuO2dJJPVbhk79P2
X-Authority-Analysis: v=2.4 cv=aIbwqa9m c=1 sm=1 tr=0 ts=6823eae6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=A3aN6VE87vRDyCXMWEIA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: zyuekB1clLP7L-dCsuO2dJJPVbhk79P2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDAwNiBTYWx0ZWRfX/0WQyV2cifcK
 rs3h+DtwbZYHOGh9CiENFaKJj86gOLTKsVIe+ORD3TDZpivvsQgxtCEglXp9jflUauRwas2xgkI
 zYTgnYLhc+cgjFehjuaDuFj3MA/sd3UKAkPbhXLMGT8rnwJcGfTdyB4QZnTDTbW0vVw9QBEiTU2
 UL3eumHBdVyfsrinvqXtZBuQ3uLB7owhomLOi7BUzKieHV/z8UHrB7RH/nELEB/sOrETw+3nTCT
 VeosG6kQ5Ajs5eToIbchEYaXnEpvvE/6KpP0s0ctgAkn6PvDgoS3ThmG8oTIzocgHqehWbZ6U0c
 oy1B7dgMLXKBbQR0SpSIVvm9XNp5nnHSvLrvvmEhYR0LubRVqBPLf3BoPtRa5A1MlLrUvUNQd+4
 OQsypsDIQg9rwp/EDVxV82aBnxoPWO21ny0ixIl4B7iQDWJUHgw49AF+qTHi7KyfpUYL5Zt+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140006

On Tue, May 13, 2025 at 05:39:18PM +0300, Vladimir Zapolskiy wrote:
> Add dt-binding schema for the CAMSS CSIPHY IPs, which provides
> MIPI C-/D-PHY interfaces on Qualcomm SoCs.

Are these currently a part of the main camss block? How do you plan to
handle backwards compatibility?

> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  .../devicetree/bindings/phy/qcom,csiphy.yaml  | 110 ++++++++++++++++++
>  1 file changed, 110 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,csiphy.yaml
> 

-- 
With best wishes
Dmitry

