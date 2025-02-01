Return-Path: <linux-media+bounces-25520-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 58471A24A60
	for <lists+linux-media@lfdr.de>; Sat,  1 Feb 2025 17:27:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D20A41885F39
	for <lists+linux-media@lfdr.de>; Sat,  1 Feb 2025 16:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 519BC1C5F28;
	Sat,  1 Feb 2025 16:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VhQ1AMM4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63C21C5D62
	for <linux-media@vger.kernel.org>; Sat,  1 Feb 2025 16:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738427225; cv=none; b=G+69wuqjS0km0EuP1l95WSJL9U2CbF2yDjvGW21XDakMlJJHmY6watOPr9hzo4q7dvFj+UDu4lS9AzPX78kz1XWZCO9elSlYtkdwbgVtZGBKjVxLnBxlErvisiEXLa6AYCwkT1CpdpibgmYIOB/M3LIqoYV/BrgjpbOPnjS1Q+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738427225; c=relaxed/simple;
	bh=Yxhl8LZFj20FOUDFn3DFSQ8NRNktMewV2d+gewSUVqw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MuJzH1e1d0GMHzckl6LHGgP3ziwwWYrsaYxME6rjFrw15pLPQUbWzBuA2SVEol9X+rsv3uG3l1T4MmvP5IGluQlfeMKL2KRXSfe1+Rxy8g7/nPq5ISfmca0HGHWIM42FsIQFso1YzYZorCqSssgYUx+8qcgXpCMGRTozXW1HH7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VhQ1AMM4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 511FmaSb027694
	for <linux-media@vger.kernel.org>; Sat, 1 Feb 2025 16:27:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EKll0OTr+FAupnplWAio3axMf3LjnLIqeSqJawk3ocA=; b=VhQ1AMM467Pl8oY5
	p3ZdQQMO7ryoJNf9YdmC+UGRXztIfWG93qejsXbeyw3Lt4ceUfE+KTVwgD/HG0HM
	8ZReaItoewDJtWMWUNtqjtJyZ+Tv09cbiY8f2N8KTTtuoLj2j1DpQG1aRNbi0JVe
	bOjHMk7uGp4wIGHEaXweZklqbNhULpMNPhTzgxj+FIdvnIT7C7axtvoptPUJpxBX
	sRALm57UoGkoD/qgbauZuce10ofcC+ZpTJeE38J8AiuGmvqmRGMDrsbGGgtCLeJH
	fBF3z4H0Iq6tm07wgMxOnp6OnznW1Ss14HJ/whocFpPxMT5iaxGYuB0iH1uUAngr
	fFhWDg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44hd5y152d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 01 Feb 2025 16:27:01 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6d8e8153104so3997386d6.0
        for <linux-media@vger.kernel.org>; Sat, 01 Feb 2025 08:27:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738427220; x=1739032020;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EKll0OTr+FAupnplWAio3axMf3LjnLIqeSqJawk3ocA=;
        b=QnVM6EGHTs8SvSYonkp95GcbY9wUDpb1AfdPaSag2vVJxsqjTl5r4XGXYPvKI/mf8h
         5toqrGPxGTqX6e1gNTDKzWUuXNFhYrcd7jbOqhK9TtK1Ph0XREF1uYuzOAhoo4adgRKM
         IQumv5rxho4dsdPmVnRwjKSISgSXS5bzUAvpbcNmnU/JdBarKNvTK+05cRgklC4xI1ed
         WOOofEPEvlM1Jkc0EtUxTeYSOJj97z6f1xXRDpUwtrdr6SMOTzDWp9wuDdMCE7hgpQOH
         K0J419eefvHXYgw3UYsND/8ZRcxoIKOqhFAPbHLmJqiAbcLsIqFJHi98/aiZIPyVuLu0
         84+w==
X-Forwarded-Encrypted: i=1; AJvYcCWDWQIxGgus3kzdBvNbeQ0UG0x9r+FLgzkSCNoOmBxVuL4JtL+CmugzwoXA9WTs/71Ra7yoorkGI13oGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCfMMGexZyx4PiyK6w46NcByUeAJYt3Ro07sxDDVVSZs5bcBaG
	QgmJJPfbUnl8WKJRJ7gpq+pDteoCnIGi0CdY/ppiCKV+87UAqkvPe+ZMD4WcYd7kPVJvi4LUQKV
	l80cZh/AXDMZJzuMKD9RO8LrdAUpcn8WiPE/O79J1flAAzbXE8kahbgl0nvMEVw==
X-Gm-Gg: ASbGncs/P0c2eHzx1hO3YydKQ3oCpFtk7wX5qrTyIxyfaoYyQYH50bK6g8gKozHSogA
	Xv5rf7UdlnJt5yzkdGp3t6C9z0G046ZA+cPQUO+91VjNcJ6wU7rrhKNW0gf2GP+sMHj1Cv/7KKs
	EfhLiFoD9WnB6Ltd3K0eHO7mPuU+hK77vkhjljvUL7SZ1t4zWo9U0Krq24eVEUSe20RukjDUEe0
	LQAjHTGy+UtJGtRbUeeho61PAJamcxeLMY8l0V4gIZv8ttvD+lPMx/jC2+TPKKRZeHkDJS5dTOj
	KcAnYvnGnVTjiYsPVz+LwMqW/tK+QiTnMI0bYd8FVex6lcKPofG74iAvSt0=
X-Received: by 2002:a05:620a:29d2:b0:7b8:5629:5d58 with SMTP id af79cd13be357-7bffcce5683mr798966485a.4.1738427220694;
        Sat, 01 Feb 2025 08:27:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGW5dCt57KxB3QTUkH/DtBPukVEDHPBWvCI3vtS5HPPpewERxqmhT5SNUKe1IVKv5OIuqLK2g==
X-Received: by 2002:a05:620a:29d2:b0:7b8:5629:5d58 with SMTP id af79cd13be357-7bffcce5683mr798963885a.4.1738427220201;
        Sat, 01 Feb 2025 08:27:00 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc7240487csm4570605a12.34.2025.02.01.08.26.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2025 08:26:59 -0800 (PST)
Message-ID: <80ca597a-3d85-40d0-a04d-4bb8ca91b687@oss.qualcomm.com>
Date: Sat, 1 Feb 2025 17:26:56 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/2] arm64: dts: qcom:
 qcs6490-rb3gen2-vision-mezzanine: Add vision mezzanine
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
        todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        akapatra@quicinc.com, hariramp@quicinc.com, andersson@kernel.org,
        konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20250121125010.1853269-1-quic_vikramsa@quicinc.com>
 <20250121125010.1853269-3-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250121125010.1853269-3-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: goiMxTGZ50lb2oG5n7Ceo4Ku7NqdOrH1
X-Proofpoint-ORIG-GUID: goiMxTGZ50lb2oG5n7Ceo4Ku7NqdOrH1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-01_07,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 phishscore=0 mlxscore=0 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=739 adultscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502010142

On 21.01.2025 1:50 PM, Vikram Sharma wrote:
> The Vision Mezzanine for the RB3 ships with an imx577 camera sensor.
> Enable the IMX577 on the vision mezzanine.
> 
> An example media-ctl pipeline for the imx577 is:
> 
> media-ctl --reset
> media-ctl -v -V '"imx577 '17-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
> media-ctl -V '"msm_csiphy3":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -l '"msm_csiphy3":1->"msm_csid0":0[1]'
> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> 
> yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0
> 
> Signed-off-by: Hariram Purushothaman <quic_hariramp@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---


> +&tlmm {
> +	cam2_default: cam2-default-state {
> +		mclk-pins {
> +			pins = "gpio67";
> +			function = "cam_mclk";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};

If you don't plan on adding more pins there, drop mclk-pins{} and put the
properties directly under the cam2-default-state node, similarly below

with that


Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> +	};
> +
> +	cam2_suspend: cam2-suspend-state {
> +		mclk-pins {
> +			pins = "gpio67";
> +			function = "cam_mclk";
> +			drive-strength = <2>;
> +			bias-pull-down;
> +		};
> +	};
> +};

