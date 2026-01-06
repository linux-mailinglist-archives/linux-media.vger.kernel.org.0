Return-Path: <linux-media+bounces-50063-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48913CFAC8C
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 20:49:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B143B311A750
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 19:27:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D2DE363C40;
	Tue,  6 Jan 2026 18:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c7I9pxfw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QeUK8ZmB"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEE43624C3
	for <linux-media@vger.kernel.org>; Tue,  6 Jan 2026 18:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767723794; cv=none; b=dgbIB8PbFnSObdsMCTc2soKe5AouGDAgqOYwtObM/vjWJCXiDGsQrUiHvL78Mb7PbmyJdmpHq1hHReLpFX13/BPVKiq+/Z9hwDxB8I76F/k21lr3QIrHjHEL2Rb94S7/z50fBjJEsGFo8JGqSArI3zWtKtjhxG4LwdwnM7lObAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767723794; c=relaxed/simple;
	bh=f9TlxRT9rvC0hlEWuOkdtUiQeEM6Pel/7EGZBRfrXJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oMIw9xYRx55evBQpy/GoaOSbSFEU29dVsABBVtUWE1g4Si8sQKSKLzZe/R560X/TCRETzKDXbbgdYw/t5+U38OJDNLxK0cjxD1BUdaJ6SdmZEsPUw54FFpMBWJTXbFJ/ieWba27WgGIwWIvZ177rk2KY+k+FHdNHQx8LIlxGZe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c7I9pxfw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QeUK8ZmB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606H1XV4822844
	for <linux-media@vger.kernel.org>; Tue, 6 Jan 2026 18:23:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=H6b2JxB1173oCI8iM+PjDJVx
	B3Kk+Q+MqMhzz29nX24=; b=c7I9pxfwElq9rVTekH2oECKFm4GgkrNZ1ZzC/w2q
	jCshehjPbHan9u7X1m3BJ7tDrnnc1vyXaBkux7D9ny0fozixuleD0imnSKtGeuOU
	acVacXtz/LqTIyo17c7TfTSOdRSdDuN0oVwe9Pvmp0D2oqdSTZAKht3HSC/rEFk7
	rl8+e7OYq2iO4a9RNrpME6viCJpZaMIYnTFQnrn4rcTBvqw3qwbHWACUKE4H/9+Y
	upfO+mbyWl48KK9knNsn7M+R0aIYHZ3Mz1x5Y7MXiIJSeffpb2/DTNJ+DeTQnAgr
	ldGga23WgKx9M0TrgRTla7bQpqVc0XgjKXqoMTzKdBXvzg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh6e808r0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 18:23:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee3dfe072dso30381991cf.2
        for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 10:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767723791; x=1768328591; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H6b2JxB1173oCI8iM+PjDJVxB3Kk+Q+MqMhzz29nX24=;
        b=QeUK8ZmBSnGw4MO4MwOPCkJghU6CcaLN40mDxrOTfXc8tTHbXdw2qzrFMi3d4c0YjQ
         A2PjAEzPh/8mLzUzUCGkr8WcSnpxcDCm+iVn/u6dbfzyYP+yT4zAc75wHER55ieeTtwp
         ycTJ32x3B0MLGza9oaureDQQ29eLimWTPkOhvwZV6MpiI8L62nWon+0mXlnoE5rRBTIJ
         DSzZ+qLgBi0i+D+xbhB5nvJFLqP4zOVCdoi27F2lXMbDRKfJSmXWDMwZusdUqMbBGrBP
         lOM4tmWNlqhIKttrne4XIViy2C9JHwntHWSYXSAqdai7PkYHXc2EVSqYmn2tMZfw7u7Q
         ocLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767723791; x=1768328591;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H6b2JxB1173oCI8iM+PjDJVxB3Kk+Q+MqMhzz29nX24=;
        b=tNtWKZ3gU9ufa24pNBSQTr8ag8uee/BmAlG77BH5XB+s6audvMmZ1gDD8993yKgG3x
         39cjT5l/kRsg7JzuMUd3ljv2ZrWtp50zCx1GS5PFy2r0evYMd9NtYpntg2OA6ZclzlfM
         rRV5Aagj9P4XMDZ2iYRmr87PfzVbei1nUkHox6ekFsqfYznpI+jJn5IoGfIkJbjEMT6P
         H3izZlN05iIsBlDHo7Riq1gRapDr8tZ9fpnH/Q94xkNl8Hc04D9yKo7dsNTI2dnLTVib
         Qnak590HwZ49epDTRhbo+fJ67DXtWz7Pr8cjrCbTTsFLfsLuxUfhRo9VOVf6x60IoVkq
         Sedg==
X-Forwarded-Encrypted: i=1; AJvYcCUjKzNon7tdqobk3AdklPZSzw7AHi2+CFZhMVy+DomPYY79+QYWmF8Xtx5WiwomPdpU6kDwYcLh5Zohrw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1tpq74infc36bvc2i36b33sJUtYB5fIlzYqv02aSpjoyFqtPm
	1LjPhlBmZTCI2fetEb7yF0P6V108oZoSyG+jz8HJrXNWL2hL6+NfiS4d594U/CKnJEHrnSfzqYo
	XfmI6bq2mMGueE0CUXVshYDLqkUtXSdoybjoyIVSTn2LoyXsm2TRv8d5zCCSXinrZIb8wqOSTqQ
	==
X-Gm-Gg: AY/fxX5DNFta0F1bG0QRxmNRhTS56/UZpB2mWbiC+/q5TYAU4hCkfZTTbGtfSIHfrxX
	C1DEKHNq6PIy7+db9gIzVtbgBzE9kKBV3qlIhMqh+FHqmzG4b5H6YZ+jFXP5dYMwm6t7J5TdMcH
	QHX81thGhOS2San+CuUrE99CG1YMMFspqTGA5C7xyDxgvemw1EBfUadhPMtNRwo8EfCnRdHPMPr
	aP8glopW+u9dcCV3O7QCs2hF3VczZ8GBIcozwCX7TyAG2wHy07i0pkGekP03XXj3dfUzops+eG6
	pY53Y0YTuWCsYpD4uMdp0i8JYAjJIVtpdj+3Qs+RU2kP1NCks5wD1NEbrT/V2xFFMdUmqGr+6KH
	aocimXuB6R4QsUriqOD2GCnfo8CAY0qmQxeQj0hD4VYDWnUefKayXvJRHllHUYd517TmgFfjHu1
	WdZiWHvLF0I2ZG9iw+HUsqbQo=
X-Received: by 2002:ac8:5746:0:b0:4ed:42a2:1293 with SMTP id d75a77b69052e-4ffa769fc96mr57250361cf.1.1767723790902;
        Tue, 06 Jan 2026 10:23:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHAZjmwHkb6x979cBiP8hvqPchXkRrIP2+pImdPuIe5/Ktbf/46OuXXNUdlI4G7PoYgGi38RA==
X-Received: by 2002:ac8:5746:0:b0:4ed:42a2:1293 with SMTP id d75a77b69052e-4ffa769fc96mr57249891cf.1.1767723790440;
        Tue, 06 Jan 2026 10:23:10 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb8dadd1sm6115241fa.34.2026.01.06.10.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 10:23:08 -0800 (PST)
Date: Tue, 6 Jan 2026 20:23:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: talos-evk-camera: Add DT overlay
Message-ID: <ndexzb5bo2rxjsj7jkf3bevbb6vmtjpuuhxbonpf3v5csxnjtu@sotufkkvfc4r>
References: <20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com>
 <20260106-sm6150_evk-v2-4-bb112cb83d74@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106-sm6150_evk-v2-4-bb112cb83d74@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDE1OSBTYWx0ZWRfXxA55fETUES+a
 PfHjpnNWDyl2uh0OZ7dxTEaaFTBbbWUf9VKsM3IvqX7ZzonAggchB+stStwYGdYP9z3J8MWQETK
 CmbKJpY7Url7T/2AAJaIk3XRmDVux0HOU8RB2dBcQQ9FFBoaw4ZrTX48OROTR3AkD5O0sxxw5LL
 91m71i38myLxZjfq+r/zi1Uk+ujqiSrH3NxaMVhZ2uubWeXV+j2dbqB5vgLRYvV6OFjXeXscN64
 /d3qvhxPMfJSptz1Oni5aJmJ8sq+klsqwBnejee6CS0F29iSY1jLkqwhkqn59EDXKTR5LAE00Dj
 j/gs/MoAtpJ6XzBHx4JN67MPT+N0dnTc0mjX82MSuAfJqayRVz8fVa/T64prq86Hvz+Gbo6DnIF
 d8dsJmq2MbeJMRTF8Li/HOw1M88wd0nbOA34EgcBF4usAoyBDJZ8z07DrocqOcLU4S8slTbPGYA
 osnN/8jpekokjJGKrSg==
X-Authority-Analysis: v=2.4 cv=F45at6hN c=1 sm=1 tr=0 ts=695d5310 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=IdMp0vDf30minsVrjOEA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: PsSMkAmIUwYNnBF0ufdr0tQeAxbc3lQ4
X-Proofpoint-GUID: PsSMkAmIUwYNnBF0ufdr0tQeAxbc3lQ4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060159

On Tue, Jan 06, 2026 at 05:39:56PM +0800, Wenmeng Liu wrote:
> Enable IMX577 via CCI on Taloss EVK Core Kit.
> 
> The Talos EVK board does not include a camera sensor
> by default, this overlay reflects the possibility of
> attaching an optional camera sensor.
> For this reason, the camera sensor configuration is
> placed in talos-evk-camera.dtso, rather than
> modifying the base talos-evk.dts.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile              |  2 +
>  arch/arm64/boot/dts/qcom/talos-evk-camera.dtso | 63 ++++++++++++++++++++++++++

Is it possible to attach other sensors? If so, overlay name should
depicit which sensors are attached (compare this to the RBn boards where
specifying "vision kit" defines all sensors attached to the device).

>  2 files changed, 65 insertions(+)
> 

-- 
With best wishes
Dmitry

