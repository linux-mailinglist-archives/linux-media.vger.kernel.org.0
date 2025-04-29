Return-Path: <linux-media+bounces-31296-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C4EAA08AD
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 12:34:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EAF9A7AA711
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 10:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39F252BEC35;
	Tue, 29 Apr 2025 10:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="m3KjNz7O"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAE6277007;
	Tue, 29 Apr 2025 10:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745922883; cv=none; b=rYGZZ3ZVc0tKyd0UbC8eK/nXJjwEQ3UTLf4iV0QGV/dgxX+/tLAyt3VY0/lYGm4dRk7HAo/frPRT6GW1fTafv4XgeNKLYGGDlNctF3q/7rncREX6i6/zgXuTlJqgAd7Am4fsek9rYqRw1oTzWj8xrWL6GOnj+uftdYVxkaTVJjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745922883; c=relaxed/simple;
	bh=13pVkFHXl1WuK0KD0n60SQxGHA+mvkMJHdDHkuM4JFA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=G1Za+wvfgXfOkeQMjGQlnqZ2+uSzI1Lux6HT+jCN9I6tniCs9oJQ0nKLQqKXeDVn+EtLJnCN3huRW7qv+NIICujVcCHWzEQuL8RYCw48mdaz/hY6ilJBlLlbktevPLAReZVVDRMzOdLxuoRD6v3GWPimUByWzPHwk3cZ3e4a+SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=m3KjNz7O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TACaXo023472;
	Tue, 29 Apr 2025 10:34:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jAaEXl8RwZfNO+yFe1l2ou0KclnPK7UGTUpOeTk+FGQ=; b=m3KjNz7O4pBFOhJa
	qykEDiO0gE/+5p3zLwu9rSFvAqsFqhaGxDTxdSDmPTpnb0HpdqAIY3lm4SpvgVh0
	eFSWbV5JFS5s6nzVruO5j4/E9h/O2t6FsD8QYmCPcj9H0XBov5JOdaIyL6YZSD1z
	isQYvZCbAHy+jORNmm0QBmUKMP35bLW4hLf9cmT4apqivWpifw6VxEbuwYl9WBfW
	pZuT2vGETz8JkPuL3zmM6mkpNMQ7HkZwR5wNo58G/pX0nH1FRkmmbWCs/PBi7Ns6
	K+aq8XOSazc4ohhHmLtG67VUfnGCyCDp+TWpR5x46ALg1mfgLkY7vNrPauTBYmMv
	mR7+1g==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qq5kc0k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 10:34:37 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53TAYaYY006154
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 10:34:36 GMT
Received: from [10.50.27.172] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Apr
 2025 03:34:31 -0700
Message-ID: <17de7cb5-94a2-44c4-b306-e18e983f9d84@quicinc.com>
Date: Tue, 29 Apr 2025 16:04:28 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 16/23] media: iris: Add a comment to explain usage of
 MBPS
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
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20250428-qcom-iris-hevc-vp9-v2-0-3a6013ecb8a5@quicinc.com>
 <20250428-qcom-iris-hevc-vp9-v2-16-3a6013ecb8a5@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250428-qcom-iris-hevc-vp9-v2-16-3a6013ecb8a5@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: YaRFnu5uEKWoYz9Qtko599MH_Y8hD592
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA3OCBTYWx0ZWRfX/hkaYrHVlpcu 9Mk+YRYFcwrLSBtJhHe7dA0oeuwaI2L5HAChrsORRDmHkENt7aiCfk4nISdwRFVyY8H5t9Q+jeQ EaS2F8xB7Q47wUeba+YO+DqxSGjR8C4mdC1aXEFuIGwaD82o9LWuFP9weCq9q/+gYthXnSdUF8Q
 SMZnLI30JRWj3rgHpFFwOtvT6yx8USFgOTd7gwL1SmHEfaY/dbYrNGm0al2uLZX3THPg/RaBn9O Ik7Dogy4XFM9siobz8QgyiAqpLKeW73yTJ77E9Q8pmzgU5yzKoip03a3KNtoIhIQi2A0ly1RR/B XfJtH2qTprsHQlqyRxfifT1juXilpbE7EBeUOO4hHbCpoQZH9JYrOK8YfwEd7jU66u9y3dHGBKw
 Vt/aZv/DeZj4k1hvugza5pHGMhuCWuhR3hy++U14GxVAAj72cMGWtG98RW+x9DIZt/wbeBu+
X-Authority-Analysis: v=2.4 cv=QP1oRhLL c=1 sm=1 tr=0 ts=6810ab3d cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=QJ3uBZxdJ3uNz1fmWwwA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: YaRFnu5uEKWoYz9Qtko599MH_Y8hD592
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 adultscore=0 mlxscore=0
 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290078


On 4/28/2025 2:59 PM, Dikshita Agarwal wrote:
> Add a comment to explain usage of MBPS and define a macro for 8K
> resolution for better readability
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/iris/iris_platform_common.h | 2 ++
>  drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 4 ++--
>  drivers/media/platform/qcom/iris/iris_platform_sm8250.c | 2 +-
>  3 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 1dab276431c7..3e0ae87526a0 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -21,6 +21,7 @@ struct iris_inst;
>  #define DEFAULT_MAX_HOST_BUF_COUNT		64
>  #define DEFAULT_MAX_HOST_BURST_BUF_COUNT	256
>  #define DEFAULT_FPS				30
> +#define NUM_MBS_8K				((8192 * 4352) / 256)
>  
>  enum stage_type {
>  	STAGE_1 = 1,
> @@ -172,6 +173,7 @@ struct iris_platform_data {
>  	struct ubwc_config_data *ubwc_config;
>  	u32 num_vpp_pipe;
>  	u32 max_session_count;
> +	/* max number of macroblocks per frame supported */
>  	u32 max_core_mbpf;
>  	const u32 *input_config_params;
>  	unsigned int input_config_params_size;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 1e69ba15db0f..deb7037e8e86 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -248,7 +248,7 @@ struct iris_platform_data sm8550_data = {
>  	.ubwc_config = &ubwc_config_sm8550,
>  	.num_vpp_pipe = 4,
>  	.max_session_count = 16,
> -	.max_core_mbpf = ((8192 * 4352) / 256) * 2,
> +	.max_core_mbpf = NUM_MBS_8K * 2,
>  	.input_config_params =
>  		sm8550_vdec_input_config_params,
>  	.input_config_params_size =
> @@ -308,7 +308,7 @@ struct iris_platform_data sm8650_data = {
>  	.ubwc_config = &ubwc_config_sm8550,
>  	.num_vpp_pipe = 4,
>  	.max_session_count = 16,
> -	.max_core_mbpf = ((8192 * 4352) / 256) * 2,
> +	.max_core_mbpf = NUM_MBS_8K * 2,
>  	.input_config_params =
>  		sm8550_vdec_input_config_params,
>  	.input_config_params_size =
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> index 543fa2661539..8183e4e95fa4 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> @@ -127,7 +127,7 @@ struct iris_platform_data sm8250_data = {
>  	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
>  	.num_vpp_pipe = 4,
>  	.max_session_count = 16,
> -	.max_core_mbpf = (8192 * 4352) / 256,
> +	.max_core_mbpf = NUM_MBS_8K,
>  	.input_config_params =
>  		sm8250_vdec_input_config_param_default,
>  	.input_config_params_size =
> 
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>

