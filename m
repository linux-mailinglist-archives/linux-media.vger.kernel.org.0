Return-Path: <linux-media+bounces-31293-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92770AA0894
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 12:30:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60B0F3B46E4
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 10:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 258DF2BE0FF;
	Tue, 29 Apr 2025 10:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="m5vG2her"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002DC1FDA8C;
	Tue, 29 Apr 2025 10:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745922620; cv=none; b=Vc1uKO6asDkmp0zBHK1Az7pVLNBXp9NRsMZxQjwgjWgCV8AyDbgt+hpjLAE+iFUqd3NUfP20kc83Gd2mkI2SfncjT9uie07QX1BDH1NjpbrAe3FIc16+GAUG68dTvM9C53TdZLpNLBH1YGFp7CVxYOI69z8CdIcRRA+9GKnYvII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745922620; c=relaxed/simple;
	bh=lgyXItV2Bu+riV/9ewEdodHmjcO4qdizNxdMcwNkozc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Pi2fQ/sPDiOUSy70dgconqxrWw1Ak2pylW2LBWBBY7GNyQfOt1A0rhg2908m6nb+YpIQ/kn5df4NXJLKRk30CYqjp76I03zSMCdh9wt6vDEVZ2lr43Hf6rurPnr76HBoZ1vX8UAcIyW4UoXVtOkaYdoyYRb472gD11A1GwpTBJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=m5vG2her; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T9lCKU015307;
	Tue, 29 Apr 2025 10:30:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bokXI+hybh6ma1h0DymYjEygB6zRvyEC3U/pIpaD5Is=; b=m5vG2herLhY3GlJh
	pRbCVEDzhp9Z7WvxuYXaKdq86bOgMz0SrXgUExbDQq1PYTPshN5lfXhDu3dQVmDW
	ivo2h7B9X51Vze366ppArHCVfQSxcbEFHV1dHu8FliFqiTF+T9Ek5jdQJLlpvFy4
	Kio+jmyeryB6hi3DX/SikP3R1WIYkq2omYrdlFyeWNZ9efS8WnIPiKVnV5msE3AN
	q/GXkgqtocqYFrHrILu7TmhuH3RCzlzuagZeMSGt7Qti/IMRf30Ok8eai9p6mvej
	Q6kzvAo1Qp/Hd5bhfUH2YSKk0Nhrh+MKn1LJV1vUG4jPqxVF9XOyaiBzakIqWgMd
	HAkGMQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qjwv5f6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 10:30:13 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53TAUCi8029498
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 10:30:12 GMT
Received: from [10.50.27.172] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Apr
 2025 03:30:07 -0700
Message-ID: <95da19b8-a909-288d-69bc-8bf00d802c80@quicinc.com>
Date: Tue, 29 Apr 2025 16:00:03 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 13/23] media: iris: Fix missing function pointer
 initialization
Content-Language: en-US
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <stable@vger.kernel.org>
References: <20250428-qcom-iris-hevc-vp9-v2-0-3a6013ecb8a5@quicinc.com>
 <20250428-qcom-iris-hevc-vp9-v2-13-3a6013ecb8a5@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250428-qcom-iris-hevc-vp9-v2-13-3a6013ecb8a5@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _byHaITyWOg59otUsoGj12pjNGx4Jm1q
X-Proofpoint-GUID: _byHaITyWOg59otUsoGj12pjNGx4Jm1q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA3NyBTYWx0ZWRfX0GCqcX3HcC9e n7p55z3mekh7pCVqHicfNVPFPmHmAlzw52gOvDW71uNt/ZM3wMak9DxYXdwDuGGKe2BaR2kGyBr xieKF8mDs/VA/uDRDgbxH88mKF+YhBmQpzuYq75qEm6B6lJLNq4pgPxFZtPzrghodDNqx1SNOJC
 y0gRLDL2W7tyqmoiCqcFyPg5oC800nNhLTulfdjVleCviHKQ7lv1ioH+60vWXRe2JCAcEmIRHuI ccp+aRyl97VpfT/dCQgkBxUZSS7TedfZI2jfKzzmgNCpxpGshAUi/kRlUTaAhr6BhAy3WxMT1uX wiGVkqv/9SxWggmRRXvRzpkG4CPuZDgdl/y1hVQyhST9PDN0r8KGJ0wRbLNHGiwDRpirt6AoLYx
 7oD3d2uKu0zubegJdjeZhiElKewPLgp8asAhIgaIlEQzn0rYMMLUnLbJdHGOQvLazXALAwqp
X-Authority-Analysis: v=2.4 cv=c/urQQ9l c=1 sm=1 tr=0 ts=6810aa35 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=1AEiwiRWklCkw4qv2JAA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 phishscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290077


On 4/28/2025 2:59 PM, Dikshita Agarwal wrote:
> The function pointers responsible for setting firmware properties were
> never initialized in the instance capability structure, causing it to
> remain NULL. As a result, the firmware properties were not being set
> correctly.
> 
> Fix this by properly assigning the function pointers from the core
> capability to the instance capability, ensuring that the properties are
> correctly applied to the firmware.
> 
> Cc: stable@vger.kernel.org
> Fixes: 3a19d7b9e08b ("media: iris: implement set properties to firmware during streamon")
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index 915de101fcba..13f5cf0d0e8a 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -157,6 +157,7 @@ void iris_session_init_caps(struct iris_core *core)
>  		core->inst_fw_caps[cap_id].value = caps[i].value;
>  		core->inst_fw_caps[cap_id].flags = caps[i].flags;
>  		core->inst_fw_caps[cap_id].hfi_id = caps[i].hfi_id;
> +		core->inst_fw_caps[cap_id].set = caps[i].set;
>  	}
>  }
>  
> 
Would certainly make encoder fail later without this.

Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>

