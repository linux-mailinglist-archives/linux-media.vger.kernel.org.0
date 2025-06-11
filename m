Return-Path: <linux-media+bounces-34498-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF85DAD5028
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 11:40:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6745916DB4F
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 09:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2EF025F961;
	Wed, 11 Jun 2025 09:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="E5ZhuLox"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83529242D90;
	Wed, 11 Jun 2025 09:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749634800; cv=none; b=UvnVuTSfJahwxHPj3gXJKudMUu9H9RQXoseFtTAF+Wkff4gqdulX/xnD+fqzoZ6UDmGqgbzco6OupdgmOShgZ+kHIKW/x7gcQP9c+oovQ0l3T3GxSpmQNahYaJcnrPWC/737ukmF4AjtZNAneab4TAVUCjRJQPY+OHuWjkibLv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749634800; c=relaxed/simple;
	bh=WqoGafln+7FperWTCGCHOW05uCz41nHkE1cz45ZlgtA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bXl85EiWj4ybNJye7nHs0sQDLYZqsrUo65iB5vUQn/0toUB66gcTVnGfDBD+eZuarMkVBB26wI7qOtyr9sY0s92xfsBPrVwYeel3TshFxJORmtrOzQftoL4vkm0udqAibZiJC7v5ELXaw1LHR/fw0nFiGZI3S7QcfPtEJtR50JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=E5ZhuLox; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DD82023919;
	Wed, 11 Jun 2025 09:39:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XwQM9qqqoO7U5Z+l4qQLkY9bopanOmB0vao/Vd7bkag=; b=E5ZhuLox5J5ocwv6
	RC7jhwu5a+TvnimRGo+ZJdnAmVx2tlmbJDynk5AbCn3JGPNP0fzVFtUfdIqjAN6M
	wXXV265ZbTBmvHFmz32QPMOOiq/jok+aS48BSFUootHj3szdUSVCboFnc1Nj9rWZ
	Ix1KUypV7BVOF0d9c4/deWz2Hqj0Ia1HmO/URFD6/6arhzj54MmtBbHzo97BbrCR
	KRx8IXuZfrY5OZbPXYLs0KUIIPGcN2W9ZuQhYNuuS6Isx/v2WVeL/tb7Aie9Q4e4
	B7Ta3wRC3KhuXXkF5DQq98YauUYF+4nvyqj6jlakAkbQxR5DI8ujj9eAA+NZlcmh
	TgL0ag==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2tf2vf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jun 2025 09:39:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55B9dp00010846
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jun 2025 09:39:51 GMT
Received: from [10.50.30.75] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 11 Jun
 2025 02:39:49 -0700
Message-ID: <9485fe7a-49f3-8cd0-5085-76a9d133045a@quicinc.com>
Date: Wed, 11 Jun 2025 15:09:46 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] media: iris: Fix opp scaling of power domains
Content-Language: en-US
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250611-iris-opp-fix-v1-1-424caec41158@oss.qualcomm.com>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <20250611-iris-opp-fix-v1-1-424caec41158@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -GuxHknpWWUj4nVCDumxsou2mEWezlmz
X-Authority-Analysis: v=2.4 cv=GoxC+l1C c=1 sm=1 tr=0 ts=68494ee8 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=cnNNxmBRD2D--d2aX-gA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: -GuxHknpWWUj4nVCDumxsou2mEWezlmz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDA4MiBTYWx0ZWRfXx89wAVd+NBgb
 Uf0a4qNZf8EdsmXAmZPNK225+eL1Nwev8Ud5Pk8UbJUBm2INWbYq403F0b8tyTxIwIPjEQ6LWGP
 v9fsxqrcjhuepUseyeohtEr+LVSDq9h5fQRy4fuHSbA5zMbnlUAyRttwPvMsXjAlYeTHeTo7wL9
 SP0vIq/blx5VeIPkTc8mY/LJihtMZz8MnjljzGZK0ATf9Mf6yV1ibsEdzvx5XklEoUIusWg5/j2
 0TYDd9MdRRkIO9OUYM3ZUcHULt2C450mCZQx8TG/cHU0NOHS9zEjflNxR8HeCyzl1wF+e+psqCQ
 2iiqMRHufIeDfpNv4CFfWI5TR8H5Q0uVIYW6juKsLCIerQY2ilgelrhz+xJ65z7EwqDn1h0U0G+
 S6Yw46DNKwD2qsMrC/kG/2fd1xJ2lDuXy7H80vb/O9hGdrAZPFEKiWom+DdCmBfJJUmKu6uq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_04,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110082



On 6/11/2025 11:13 AM, Akhil P Oommen wrote:
> Pass PD_FLAG_REQUIRED_OPP flag to allow opp framework to scale the rpmpd
> power domains.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>

Thanks,
Dikshita
> ---
> Found this issue while reviewing the Iris source and only compile tested.
> ---
>  drivers/media/platform/qcom/iris/iris_probe.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index 9a7ce142f7007ffcda0bd422c1983f2374bb0d92..4e6e92357968d7419f114cc0ffa9b571bad19e46 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -53,7 +53,7 @@ static int iris_init_power_domains(struct iris_core *core)
>  	struct dev_pm_domain_attach_data iris_opp_pd_data = {
>  		.pd_names = core->iris_platform_data->opp_pd_tbl,
>  		.num_pd_names = core->iris_platform_data->opp_pd_tbl_size,
> -		.pd_flags = PD_FLAG_DEV_LINK_ON,
> +		.pd_flags = PD_FLAG_DEV_LINK_ON | PD_FLAG_REQUIRED_OPP,
>  	};
>  
>  	ret = devm_pm_domain_attach_list(core->dev, &iris_pd_data, &core->pmdomain_tbl);
> 
> ---
> base-commit: d9946fe286439c2aeaa7953b8c316efe5b83d515
> change-id: 20250527-iris-opp-fix-3ef2591c032a
> 
> Best regards,

