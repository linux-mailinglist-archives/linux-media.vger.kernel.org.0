Return-Path: <linux-media+bounces-41411-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B93D2B3DF22
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 11:56:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86C1A16E114
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 09:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2845330DEBA;
	Mon,  1 Sep 2025 09:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HJdU9Jgk"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C352A30C608;
	Mon,  1 Sep 2025 09:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756720609; cv=none; b=udt3rW1cs44pnTt4tvtqCNjdrIEmRPLRhVlEA1D0GObWcvAXtY7K0BkIaK/MDV4OCcIGdAUAvpoWvYPUjSPJgmg0Zs5xD3qgYl8l4eVV+pqLOGLa2e9l/bGdtD5NNrEw/uU2ADGpttacJv0yMGIbfyOX/Q34EuzEky99F3kKV5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756720609; c=relaxed/simple;
	bh=XYuUf/IGiF9vEN2NrEy1mjOIE3uiMeT6u92FHKswQUw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NUdte06jYoSiuK83MXiSZBYENkt0aKj6P+CDtXDIpDepKXoQRJALiL0Q2lV5K000nckDH6+6l1ub/0AT2gBlkXbJA6bG7LxYyPDwYBr9GJjAxE2NWUlMn2QqRNkx3tgRC2oB3FXEtTcwNPOYwvWoixrDjoNMEPwPebM+nLr+r+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HJdU9Jgk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5819eQoS010979;
	Mon, 1 Sep 2025 09:56:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/g4oflENPVaR+DlCgUOy/m3KfGTkpDmgfblkN/H6dy4=; b=HJdU9JgkRjUnbFbQ
	jXorGBwD+wjWN6K/WCdFI0EGi/Qz2xB8eoxCejErkFOTO5GCYdoiVKELO7745KV6
	N1Gis36hTyH+lBugXp/0wY4JH/CHlX4JCfnIRPTTz7IknPngMfcAHa1G3b04oE89
	Bs0k/YolEKZfiI9kRcY7by6pLzM6yDrc+mkRR2tq/y7s+yenpl/KRkAzqkoF3cCt
	8VimM7QIY+OXT2+PK2kaZ0guY4lT5NcFCJQebkGemJQmI1he+aaBOSuXE/3eNXtq
	BA8p/XXKHNDuVWWn2G/ULZEpbHE6r9PnJyZK4vaPXke9WensOybZBVpt0hVlW249
	dHJPmw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk8v6xx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Sep 2025 09:56:36 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5819uZpE018301
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 1 Sep 2025 09:56:35 GMT
Received: from [10.204.66.35] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Mon, 1 Sep
 2025 02:56:30 -0700
Message-ID: <af4eba15-ea0c-4c56-9b0c-b53454ee5926@quicinc.com>
Date: Mon, 1 Sep 2025 15:26:21 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/9] media: qcom: camss: Add support for VFE 690
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_svankada@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250703171938.3606998-1-quic_vikramsa@quicinc.com>
 <20250703171938.3606998-9-quic_vikramsa@quicinc.com>
 <498db18b-f6bc-4678-9d70-7741e3025185@linaro.org>
Content-Language: en-US
From: Vikram Sharma <quic_vikramsa@quicinc.com>
In-Reply-To: <498db18b-f6bc-4678-9d70-7741e3025185@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HLxhf4iuiI4NMt6gRfjBgo1g860f2fmi
X-Proofpoint-ORIG-GUID: HLxhf4iuiI4NMt6gRfjBgo1g860f2fmi
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68b56dd4 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=l7lVQcmziEWSzHc1fZEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfX269iPiLeKAsE
 EQlQIUv00hkz/x+awTYbjeMGR89huePYe9wh7nu9LGFgZmpTqkP3sPENWHAh1jXs+GJhiY4y8pB
 mlaAsY80lijRC1VVVDpH14+5kI4xolfy1P1bCeetyvtL2lQjZ2aGi+cANTb3Ad5ExoHrbkOfGNi
 I3DO48sRD4OmTBi7YZwIY67orYoKnfSjVfXziwzZDwQv77/xeLQVAQEIWlAG1zcPBMxc+WM13Za
 vVvPEVOe+M04Ib7igdnV4mYtZAQ0Be666EpCGz+9xSMKkQOjC44/ObJPDdHhVuLggzW9xLqogcP
 4kf/kwDX+yDd+XDnRMh18jk0d5JWxEYphNn0fjpClNcTua15xz5j6XzCPP+DBXy1iwg1GoqA56d
 EqffzhQr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042


On 9/1/2025 2:34 PM, Bryan O'Donoghue wrote:
> On 03/07/2025 18:19, Vikram Sharma wrote:
>> +        !strcmp(clock->name, "camnoc_axi"));
>
> This is causing a regression on other platforms because they define 
> camnnoc_axi but not @ the rate of the pixel clock.
>
> In fact its not very obvious why the CAMNOC AXI would want to have a 
> pixel clock applied to the interconnect fabric.
>
> The following resolves the regression for me. I can either merge with 
> this change or I'll have to drop the VFE690 changes until you come 
> back with something else.
Hi Bryan,

updating camnoc axi to 400Mhz was required for TPG test case.
As of now you can Merge VFE patch with below change.

Meanwhile I will work on an alternative approach to set camnoc_axi and 
submit as a separate patch.

>
> ➜ deckard@sagittarius-a  ~/Development/qualcomm/qlt-kernel 
> git:(aaa8b5ab704f3) ✗ git diff
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c 
> b/drivers/media/platform/qcom/camss/camss-vfe.c
> index e969de74818f1..1aa0ba5ad8d60 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -913,8 +913,7 @@ static int vfe_match_clock_names(struct vfe_device 
> *vfe,
>
>         return (!strcmp(clock->name, vfe_name) ||
>                 !strcmp(clock->name, vfe_lite_name) ||
> -               !strcmp(clock->name, "vfe_lite") ||
> -               !strcmp(clock->name, "camnoc_axi"));
> +               !strcmp(clock->name, "vfe_lite"));
>
> ---
> bod

Best regards,

Vikram

>

