Return-Path: <linux-media+bounces-28530-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C249A6A4A6
	for <lists+linux-media@lfdr.de>; Thu, 20 Mar 2025 12:16:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB1F68A2589
	for <lists+linux-media@lfdr.de>; Thu, 20 Mar 2025 11:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6D1421D58C;
	Thu, 20 Mar 2025 11:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J5ClOE2t"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE28B21D3E3
	for <linux-media@vger.kernel.org>; Thu, 20 Mar 2025 11:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742469346; cv=none; b=ZXbUorRhjVPMRAQbmwpap3yrZTxPla47ulSZvxnF4CoOrbc5zAONP8tpLwpEQiWrEI6c57R4N5v2j8XpqBoxElyBH3y5TNJ95i+BHetKpNWdTMGhQMpyQh6nDzHaTqB4WRkZpcrJFbmdIPlsWcyJlZ2/b1kdfvR62icam+e9BSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742469346; c=relaxed/simple;
	bh=8GeddQRYrZDi8Hn6C7CMbCI6u8Xy1d2P5T0zSy+S/Xw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CmeFfDAYTcE7xMCu5d1vMgvrSCxsF12SDDwbmKaMpl7CLFPADcfX8r7vyHixedsZTLVAPTmJECRTkJlDuBGI+9QKORhEwA1ro6JORXDFjGJzNhM9GkuowjH36L+fUSIFRd52Sat0/OCF2oXRfaIywNlT7zYm6iyULNJpQIefpXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J5ClOE2t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52K6ZBJp025453
	for <linux-media@vger.kernel.org>; Thu, 20 Mar 2025 11:15:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LViJEFSHQu4fEUHOMYV1gGdK
	UV6iZNYeAAORu+bVxSE=; b=J5ClOE2t2ddKY023LTxHu18K77h2+x0Rswoxb8AT
	TlFGt1I66/OuHvUm8rZDxGUr2Qnny6x6Bcr4WksTEWIRF1bqwXEkUta6TLunoEXh
	Wb1wVaTh0NZWbzVs0nLn9CDhpHcLrGNjuPA9V/7McGRP0emEhUgmMc9PmkdWlTMu
	rfFwp90ApRaNLXHZ68tbVWWlZ/IHOhWAE7Y5nrIEd19w7+QFVbiLkrKTqI9jPK6O
	zpp4Rfpqq/UJK2FKtZs29izAxNJgrVrM+K+MkCRTI6DZ8r4o0qXQLkhP1VKDXH2z
	ciix8C+vEkDchmYhF0osyuRgHyIr0J5aANK3TH6WWdywEA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45g15y2q7e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 20 Mar 2025 11:15:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c0b9242877so115174485a.3
        for <linux-media@vger.kernel.org>; Thu, 20 Mar 2025 04:15:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742469339; x=1743074139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LViJEFSHQu4fEUHOMYV1gGdKUV6iZNYeAAORu+bVxSE=;
        b=eGqf5I4vmNDMO+ESlEto8ZjQoxApgX/g/QYX1+S3E8WvwFR0pU8lxE4rZZ/2St1Kkh
         fMi6WiT93oYzFsyYduREW7mqasJS60LjZBSYyGlU3n6b7KGE7z8ElsOVyN9R3SGtQdG8
         YZjWVo1pFc9C1Ssci9APq7bRswKJ2czC6Llqt85OYPYDtfvazm937rcoEi3c8eLiAMWH
         h9CXwIYUD0LpyJjXDK7eo4BLAjBWYyvXftfPDiRse+R2XCNaOKNRjJhy/aTZv/D/yZ0d
         12rrDHvHbxTG0Dwzy0aDwApaC4+35ZKQyins5jgfRKxLq1k4baRSyfYxOHEkwdFtcznU
         9TAA==
X-Forwarded-Encrypted: i=1; AJvYcCW6GVicKWjUNMbDqSiRpU4aG8BulKEQRvNBzP+CUp+JKy6nJyoQDGbc0HZrIOuz48f2Xw86G9bVzyNRuw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2nQSc6QRwTvV7tiwPgbrlWfwEfjnFHPYBFa82X+eJRR34cR1+
	6hJ9c3pdEuA+RgjOMZgzHGBrKRMTUUDb/sw+Y1UfB+Gx8GDwMYXFMWXhBpk/ZugbNRZePZyr32R
	LGBxWBcctLXWP/OtfLJ16qpi/FTbscgHxHvW+whC3pN2rhGrBYpTz84HnGr73Iw==
X-Gm-Gg: ASbGncvhli/ja7JvUWlBI4LOukCkLmkbcGD9SwWf3AOYJi9JSj6nsGEekvHmykITrka
	J5BqW4xni5oXC7FilOgH2TOihG48uLUorMk4ARFaFTzVrfZSTEB5apO+yAtN8Cqr4vS1a78d3O/
	Vb26/AHcaSsHhG33840k1g56AyqdCVfhcpnbbvKfYovobcmQ9hJmYcw4H0JefWXZN6cwY6GKzGq
	a4d8G74onvFFDOy3cAdFFbOkz1nTPRsdbYzU5fwW2C0zWvsP7uOn5MeGCi9WgqNmGTLIEES909h
	hx9s3fC96tktPOnMTcOrg79MZWljzRiGupatt59mLrzBRUGM3Hm/IhAnEAobTBJH6g/d8fjPJpC
	qLEI=
X-Received: by 2002:a05:620a:4409:b0:7c5:562d:ccfa with SMTP id af79cd13be357-7c5a8469324mr1058962985a.36.1742469338402;
        Thu, 20 Mar 2025 04:15:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFB1D9oYjTuzcj8GT6lqyA6rvN2jK+uWXGS3E204rCKsZ1C8vP4wn7sMsblG886rNS9kUJl/A==
X-Received: by 2002:a05:620a:4409:b0:7c5:562d:ccfa with SMTP id af79cd13be357-7c5a8469324mr1058959385a.36.1742469338088;
        Thu, 20 Mar 2025 04:15:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f1c253dsm26168511fa.80.2025.03.20.04.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 04:15:36 -0700 (PDT)
Date: Thu, 20 Mar 2025 13:15:34 +0200
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
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sa8775p-ride: enable video
Message-ID: <js4dmf3it42mhiqvjk46fxo5nbxfqzqlmkaqmnqqvgbbi3p5rg@myaillyf5evh>
References: <20250320-dtbinding-v2-0-8d8eaa4e76cc@quicinc.com>
 <20250320-dtbinding-v2-3-8d8eaa4e76cc@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320-dtbinding-v2-3-8d8eaa4e76cc@quicinc.com>
X-Proofpoint-GUID: Ja728tl43MaoIKrUm-BncAud0M-Tusbn
X-Proofpoint-ORIG-GUID: Ja728tl43MaoIKrUm-BncAud0M-Tusbn
X-Authority-Analysis: v=2.4 cv=VaD3PEp9 c=1 sm=1 tr=0 ts=67dbf8db cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=zU-VzGr7wih_uMZSifcA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_03,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=972 phishscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200068

On Thu, Mar 20, 2025 at 08:24:31AM +0530, Vikash Garodia wrote:
> Enable video nodes on the sa8775p-ride board and point to the
> appropriate firmware files.
> 
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> index 175f8b1e3b2ded15fc3265ac8c26b14473b618f6..2b3d0876dc7f270dbd24081b698ce80e2c27a174 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> @@ -1038,3 +1038,8 @@ &usb_2_hsphy {
>  &xo_board_clk {
>  	clock-frequency = <38400000>;
>  };
> +
> +&iris {
> +	firmware-name = "qcom/vpu/vpu30_p4_s6.mbn";
> +	status = "okay";

Nit: please add empty line before status line. With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> +};
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

