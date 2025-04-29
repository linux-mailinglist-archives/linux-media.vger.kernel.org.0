Return-Path: <linux-media+bounces-31294-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 888C9AA0899
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 12:31:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C012D5A43FD
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 10:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAFAE1FDA8C;
	Tue, 29 Apr 2025 10:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="npr4iHht"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B988F77;
	Tue, 29 Apr 2025 10:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745922694; cv=none; b=MZGMF4QxKl+fObiFsrcMEZVE3jcl1yhay1e7Af8Wr16X55qsl9W8VZAA2Cs7V72kB8MGyQ8xqfe0qH0khD13rg1l+/ZcL8lLKfSwocZuSqBliWTkI/2R1sV/Yh35fSJ/6fp3XQLoSsQNtEpWICWy3SsY/RgRixEyXqVuRx83zFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745922694; c=relaxed/simple;
	bh=E72IkalazZSH9hmLoh8WOuFfHOJ9Y7cbGMxlWZDqlaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=t/5N9BnD7wFOULiJnD6TmdBwhx9MNVDXdV2MkXBInL7zUXB6HiiJCxHDIY/P/WmRmn+D/WAkdevOTOe+j/cf59dRh+76JCm4N80z6cJ3I/evGsEMCOMCN/vN2YK0ScR/b3ST9g38LUxMyIrLCNdvrNhBK1mOwx7yNxw56pnP0Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=npr4iHht; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T9l2Ah011871;
	Tue, 29 Apr 2025 10:31:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	62H73I4+pk5Umqg8rnvLzTJpE7bmIFq2jzdCc1OA+z4=; b=npr4iHhtuT3+slqw
	DNZFEtvQ00NYmUF+GEm52rGoJsVueDptHoI21pv1hLKnTnQJk5bGbXdyP/0cQ7AH
	7m+skW6VSGOIPmc1DturlCxbl+AMJfxuMV9mQ6N9j2UZno2MS7lAAfkKgeBu1o/p
	oFd/3a90wXdaGv9fUW7gm7NBsxU6yhL9dEzwohvWkh+cIgBdWTupgJL4nyUd7ZES
	OS4fn/Y7nQNL/3LQPUO680k1eBfjFrDeEMcpF9ow5aOjH2MVkPUqISv8HnN5vg0o
	ni4ePklhhqAErRLOGCYg0g+oxEkk1iPEztuLyda2FLwmsoepird8/ioHbksCIh8p
	4gUu7A==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468pg9c813-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 10:31:26 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53TAVPaA000748
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 10:31:25 GMT
Received: from [10.50.27.172] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Apr
 2025 03:31:19 -0700
Message-ID: <6f913d1a-bcbb-e620-a761-676e38bdd1b8@quicinc.com>
Date: Tue, 29 Apr 2025 16:01:17 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 14/23] media: iris: Fix NULL pointer dereference
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
        <20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org>,
        <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>,
        <stable@vger.kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>
References: <20250428-qcom-iris-hevc-vp9-v2-0-3a6013ecb8a5@quicinc.com>
 <20250428-qcom-iris-hevc-vp9-v2-14-3a6013ecb8a5@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250428-qcom-iris-hevc-vp9-v2-14-3a6013ecb8a5@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ZpvtK87G c=1 sm=1 tr=0 ts=6810aa7e cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=Ge1I_e8bFEkiASVbsqMA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: tQfmm9M7hcs9hhOC6imbGR8A_09jxIKa
X-Proofpoint-GUID: tQfmm9M7hcs9hhOC6imbGR8A_09jxIKa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA3OCBTYWx0ZWRfX/rrdyDmeRD2l Rsnd1RxGoe+VLxofoYJABHv83OWo7LaqsanMvh76zpRunZMkDkCDVLrmJka5lzCMI7JarF75o2R CSQ16h5V+srcIEBv0iVawdyY6w51h/OxCu9G+InulopvR3+96DehrhE47gjvc7mlTmK2DOw9cAq
 pdV084pI2dITP5G9l9sDPXsLixzLKw7aNJLz3haqJ+DAFu4DtrYNVTNR8LHw+EENmUYisk05pof AWItrC5clxcMzzv9FiTENuXhQmg/VRDrruUts6GjvePSFgXKkQ/GLT5pJxovxkNwh4KiZE9uMCk w7yM6QsOcqFqu1f4SXWWD+LuJxgK+HfjhY6HycPktitgFTFOpak9gQay7Nsa5rw/6Sxc8k2rePO
 M5g50AbWclRHaOkmZibBwIJzRDBRDyAlWW/1aMS4ngnZy5xVlLuTUjNvomC1hGAv0jTygpmX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290078



On 4/28/2025 2:59 PM, Dikshita Agarwal wrote:
> A warning reported by smatch indicated a possible null pointer
> dereference where one of the arguments to API
> "iris_hfi_gen2_handle_system_error" could sometimes be null.
> 
> To fix this, add a check to validate that the argument passed is not
> null before accessing its members.
> 
> Cc: stable@vger.kernel.org
> Fixes: fb583a214337 ("media: iris: introduce host firmware interface with necessary hooks")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/linux-media/634cc9b8-f099-4b54-8556-d879fb2b5169@stanley.mountain/
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index 1ed798d31a3f..cba71b5db943 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -267,7 +267,8 @@ static int iris_hfi_gen2_handle_system_error(struct iris_core *core,
>  {
>  	struct iris_inst *instance;
>  
> -	dev_err(core->dev, "received system error of type %#x\n", pkt->type);
> +	if (pkt)
> +		dev_err(core->dev, "received system error of type %#x\n", pkt->type);
>  
>  	core->state = IRIS_CORE_ERROR;
>  
> 
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>

