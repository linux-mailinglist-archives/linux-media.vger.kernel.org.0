Return-Path: <linux-media+bounces-36619-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 97467AF5FDF
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 19:23:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2696B4A3457
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 17:23:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D62E30113E;
	Wed,  2 Jul 2025 17:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dBYZi5J3"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56ECB2D94A2;
	Wed,  2 Jul 2025 17:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751477017; cv=none; b=oUfn7ls4cu5OVnafOGQP4gtHn43QbXeQgxLKRAXkLjunOLzz+iUREgifpfaKkyNZhOlirEfOMAuW4o91ZpNw5BJvQkpPneER0KDGzL+lqZXnMD3EOyafUXsQm2npxgjywGUHkGxE3+Ts0tIaFUcSSN7PCcF10qDdt9fRcJhLsGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751477017; c=relaxed/simple;
	bh=jTL/BjnoYLrTDmFG5CUqBUofpw+g+e26oS+JFNgwAxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=g6hlVdRZunXm7Zq3NAr02j4T0ViRnrXFMYWf/yJjoj2gB9VphaoKZVYIEebmwfskDn6h9oEcW9FpDbrpR+OZu2SZ6CQrsgv/7nxAxfqd8bgoM0aOdvv5C9nOYNmrnUQei3OHk83JQC0iUs+MG8SH18Kv/U17uVSK2A+Iqc0pOdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dBYZi5J3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562D7ur0028446;
	Wed, 2 Jul 2025 17:23:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PP/Rlk2Qvw8fk9IfnwEARB/z987wF3uzfYQz7DCFvtw=; b=dBYZi5J34H579YGI
	+VFqoV62ahyzAhr6r+Q2q2WpV3YINr8GNIYPB8VHahRI9KgtFWoJ1oM1lSHSq089
	9dV273yVy/pwvW+xlbzJEPBlLgitOiTuUbaVSnDO4KWHGN00K9xEyZkdwS9tXC4O
	l7FBht/CWGetsuuTsEdStJKxkgZg5TbO4tcHFBnSpHm0OfsJLsXiiDAjblbVDURb
	K+0+9ooIrCIfGDTSAqWfbtvtn9sesjmVQ/JnRhMhGXEP2964D5a9gNXuSb/IakEO
	GejBPWl2dx9mT9P8G91orCwNMWNd0tzvuQlFjYw6usDx60omFSn02yH+0971YFT4
	0CWhQQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvwgpb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 17:23:28 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 562HNRYT000649
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Jul 2025 17:23:28 GMT
Received: from [10.50.58.161] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 2 Jul 2025
 10:23:24 -0700
Message-ID: <1f64ff29-e268-4323-fe0f-cad21f04eb94@quicinc.com>
Date: Wed, 2 Jul 2025 22:53:20 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] media: iris: Call correct power off callback in cleanup
 path
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        "Hans
 Verkuil" <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <stable@vger.kernel.org>
References: <20250702134158.210966-2-krzysztof.kozlowski@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250702134158.210966-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: R0Wk81rfsyaN98fsvWqBrsES9AHNExiH
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=68656b10 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=RHpiFe251XGUUtE-J_sA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: R0Wk81rfsyaN98fsvWqBrsES9AHNExiH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE0MyBTYWx0ZWRfX1MW7+LWzaTBs
 Y6YXDiHhXYL8Vsz2cPIAeopW6epFHhsUB409LXpoR+hof4wzATnXw+F318xG8tf6odOf9LVvdrF
 3k4YlQEodwbWo2fcEdD9ekBpmsCAXopT60L0b6iZwZhIL6ymx3afrMVUwFMmFSPe4i/fa9Xb9a4
 p+686H4dRIZKPU6ZocGQy7B9MeETrg1BJz1L4Xf44Lq94NCoBaOEWJSEGNgnpUg92smrYK04zWd
 8zTkGBEHA7aP0L2PO3KoMtAx+79n7VQk8KvJu9w0MhbY3btkslnC8tMiF62Dx9/Rsff8hA0jjJm
 sd0/1dkM8MJRqKxztqpAAd9c40aMjlGXu0NQ7pb+3PK34X5gAZg8zftrCAYXytUOrT6fFh5fFeC
 GHlf9vVZ3xR62CaWTKvIJ6Xi39Zk7HQ+gpk6Gnt4vrxC8Aqx7KhNkEFvRxlkD/5uMROJB7ys
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_02,2025-07-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=726 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020143


On 7/2/2025 7:11 PM, Krzysztof Kozlowski wrote:
> Driver implements different callbacks for the power off controller
> (.power_off_controller):
> 
>  - iris_vpu_power_off_controller,
>  - iris_vpu33_power_off_controller,
> 
> The generic wrapper for handling power off - iris_vpu_power_off() -
> calls them via 'iris_platform_data->vpu_ops', so shall the cleanup code
> in iris_vpu_power_on().
> 
> This makes also sense if looking at caller of iris_vpu_power_on(), which
> unwinds also with the wrapper calling respective platfortm code (unwinds
> with iris_vpu_power_off()).
> 
> Otherwise power off sequence on the newer VPU3.3 in error path is not
> complete.
> 
> Fixes: c69df5de4ac3 ("media: platform: qcom/iris: add power_off_controller to vpu_ops")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index 268e45acaa7c..42a7c53ce48e 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -359,7 +359,7 @@ int iris_vpu_power_on(struct iris_core *core)
>  	return 0;
>  
>  err_power_off_ctrl:
> -	iris_vpu_power_off_controller(core);
> +	core->iris_platform_data->vpu_ops->power_off_controller(core);
>  err_unvote_icc:
>  	iris_unset_icc_bw(core);
>  err:

Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>

