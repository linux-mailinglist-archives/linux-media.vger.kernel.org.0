Return-Path: <linux-media+bounces-36834-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B28FAAF91A3
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 13:32:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2417D1CA5078
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 11:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BC542D0C97;
	Fri,  4 Jul 2025 11:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DQHc7R8C"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB49184524;
	Fri,  4 Jul 2025 11:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751628763; cv=none; b=PNMsBdRFhQaDvWv0BMH1frhhyHVk0LHDlZ+eSUBoPCXcsdwAwcA5xto9YbyxX3OhH1XKhcp4OKKU9bMajWezcMeqFLVHBqWLPi/jL9vTWf2hX0f2cC4NRRpVmfDSncLFVGncM4sAEksD60M8c2ry3H2YIxWF14YGGSyJgeiZ3JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751628763; c=relaxed/simple;
	bh=J/0vq2ZoK2QG2Gtlt5KoL+rfuVd8z9RZpvDx12P9vsA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Q7oSzk2OO8NV6ij0/jVV4ZuRHnorJNOrg/LdrfhncmZtTthDUSM4g+ftklXLgvB0n7CqpaACo8d99yK3wOFZDTK8hysei7bLuI9INOm/qt9qJP5wVekOs6Ay8ERBYFNu56PID1QxzbMtLAMa6in49BaPZt4V1z3/xUZ5hr/cIEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DQHc7R8C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5645iBLC018568;
	Fri, 4 Jul 2025 11:31:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2C1tL1cyUjmdUt5666UxjttpvYe1I2PpGbZ0Gq7p9u0=; b=DQHc7R8C6yKFEVK/
	6IboEgwHcO3cocNXxQqLXFhnT2HU/ASiS1aEsWxKDNo96h0JIevrTyWfg0BzweZS
	uxasC4MbRMOBokwc7WL105SP5o8CF9e9jhIjI17G2WK8gsie3QbpNsr5d7Qn43Jr
	vDUT/NZGrHTAa2LUHRqFupSTjLZRN/kq/hP/yem0y2tQtKym33+fthgb6rah7y8C
	Q68Jg4Q6vVUVFlnS0Rhx00T+JrvHESixRuV6u9g0ruedJQMQD1Lhm/w8ESdmPE1L
	hRBgMIeruYtmoc9U8Ky1I7CIQ8s6kg5w/hLlDE1b2o8xE1i+uIYRjpsCbGa40iei
	NDLwjg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxuupq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 11:31:09 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 564BV8lC008382
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Jul 2025 11:31:08 GMT
Received: from [10.50.59.132] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 4 Jul
 2025 04:30:55 -0700
Message-ID: <edfd0bd9-e2b0-93ef-a573-2f2a3ae8d810@quicinc.com>
Date: Fri, 4 Jul 2025 17:00:48 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 41/80] media: Remove redundant pm_runtime_mark_last_busy()
 calls
Content-Language: en-US
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tommaso Merciai
	<tomm.merciai@gmail.com>,
        Martin Hecht <mhecht73@gmail.com>,
        "Mauro Carvalho
 Chehab" <mchehab@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Alain
 Volmat <alain.volmat@foss.st.com>,
        Dave Stevenson
	<dave.stevenson@raspberrypi.com>,
        Kieran Bingham
	<kieran.bingham@ideasonboard.com>,
        Umang Jain <umang.jain@ideasonboard.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>,
        Michael Riesch
	<michael.riesch@collabora.com>,
        Mikhail Rudenko <mike.rudenko@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Jacopo Mondi
	<jacopo.mondi@ideasonboard.com>,
        Nicholas Roth <nicholas@rothemail.net>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot
	<sylvain.petinot@foss.st.com>,
        Paul Elder <paul.elder@ideasonboard.com>,
        "Matt Ranostay" <matt@ranostay.sg>,
        Nas Chung <nas.chung@chipsnmedia.com>,
        "Jackson Lee" <jackson.lee@chipsnmedia.com>,
        Dmitry Osipenko
	<digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan
 Hunter <jonathanh@nvidia.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        "Abhinav Kumar" <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Raspberry Pi Kernel Maintenance
	<kernel-list@raspberrypi.com>,
        Florian Fainelli
	<florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list
	<bcm-kernel-feedback-list@broadcom.com>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>,
        Benjamin Gaignard
	<benjamin.gaignard@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Sean Young <sean@mess.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Matthias Fend
	<matthias.fend@emfend.at>,
        Marco Felsch <m.felsch@pengutronix.de>,
        "Tomi
 Valkeinen" <tomi.valkeinen@ideasonboard.com>,
        Ricardo Ribalda
	<ribalda@chromium.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-rpi-kernel@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-rockchip@lists.infradead.org>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
 <20250704075431.3220262-1-sakari.ailus@linux.intel.com>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <20250704075431.3220262-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA4OCBTYWx0ZWRfX94SUNz9Zog9s
 241uiCiS8OVAytLuDJY25SN5WBo2A15VpvTMJToQUJBTBD5tSk4brYdb7zaZPtNru1KP2D7ucOI
 MP7OoWwNRfSp2vZyGAhRtK+GWPKPTC8CYcaz3pJrf0bvbPF0p6Tg6lQG8kNVwjM1v/lwgpbm1sI
 9W3lBD8vDg9u5BhiyrHx5ES5xCkubkQOLvlAYhlLN0xeAziKI1O0M/r0b5MHvmDpyLTQ/s38Dus
 XjjluoWlT5f2jJF+Y1Ri81wN8xu6nn2AJfKF+gtxVeKeSC6SS29JcpLv2ONoxL/lbwrkxGfP05S
 WrLFk95oIfphsWUlPaLpl9uKyc9zZz6KR54Jmd1IWdNNg8BmRm8DRjzYRKFQFU3BwFHPABy84mN
 k7jN9W2mHATSPb7ZegYBV/S0C/iK3zQm+yZ/iqD+JuVLZ4pubHA+BceFQgNCaautkqWZ1okn
X-Proofpoint-GUID: L0pLOEq6Xr5MYWPfr9s13YUNZ-ZnYjRo
X-Proofpoint-ORIG-GUID: L0pLOEq6Xr5MYWPfr9s13YUNZ-ZnYjRo
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=6867bb7d cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=COk6AnOGAAAA:8 a=PTLqzckoA416w6NZUygA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040088



On 7/4/2025 1:24 PM, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> The cover letter of the set can be found here
> <URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.
> 
> In brief, this patch depends on PM runtime patches adding marking the last
> busy timestamp in autosuspend related functions. The patches are here, on
> rc2:
> 
>         git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
>                 pm-runtime-6.17-rc1
> 
>  drivers/media/i2c/alvium-csi2.c                          | 1 -
>  drivers/media/i2c/ccs/ccs-core.c                         | 4 ----
>  drivers/media/i2c/dw9768.c                               | 1 -
>  drivers/media/i2c/gc0308.c                               | 3 ---
>  drivers/media/i2c/gc2145.c                               | 3 ---
>  drivers/media/i2c/imx219.c                               | 2 --
>  drivers/media/i2c/imx283.c                               | 3 ---
>  drivers/media/i2c/imx290.c                               | 3 ---
>  drivers/media/i2c/imx296.c                               | 1 -
>  drivers/media/i2c/imx415.c                               | 1 -
>  drivers/media/i2c/mt9m114.c                              | 6 ------
>  drivers/media/i2c/ov4689.c                               | 3 ---
>  drivers/media/i2c/ov5640.c                               | 4 ----
>  drivers/media/i2c/ov5645.c                               | 3 ---
>  drivers/media/i2c/ov64a40.c                              | 4 ----
>  drivers/media/i2c/ov8858.c                               | 2 --
>  drivers/media/i2c/st-mipid02.c                           | 2 --
>  drivers/media/i2c/tc358746.c                             | 5 -----
>  drivers/media/i2c/thp7312.c                              | 4 ----
>  drivers/media/i2c/vd55g1.c                               | 4 ----
>  drivers/media/i2c/vd56g3.c                               | 4 ----
>  drivers/media/i2c/video-i2c.c                            | 4 ----
>  drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c | 4 ----
>  drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c | 5 -----
>  drivers/media/platform/nvidia/tegra-vde/h264.c           | 2 --
>  drivers/media/platform/qcom/iris/iris_hfi_queue.c        | 1 -
>  drivers/media/platform/raspberrypi/pisp_be/pisp_be.c     | 2 --
>  drivers/media/platform/verisilicon/hantro_drv.c          | 1 -
>  drivers/media/rc/gpio-ir-recv.c                          | 1 -
>  29 files changed, 83 deletions(-)
> 
[snip]> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
> index fac7df0c4d1a..0b37f9b76da5 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
> @@ -142,7 +142,6 @@ int iris_hfi_queue_cmd_write(struct iris_core *core, void *pkt, u32 pkt_size)
>  	}
>  	mutex_unlock(&core->lock);
>  
> -	pm_runtime_mark_last_busy(core->dev);
>  	pm_runtime_put_autosuspend(core->dev);
>  
>  	return 0;
Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>

Thanks,
Dikshita

