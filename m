Return-Path: <linux-media+bounces-29774-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 18635A82C27
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 18:18:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58D924A17BD
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 16:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64B0B25E457;
	Wed,  9 Apr 2025 16:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="B/rx5/JP"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C4825291E;
	Wed,  9 Apr 2025 16:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744215110; cv=none; b=Xdcskx5N3VJcGgyvSlhfHXGhmCKh5Oz84PXTniZ2E5uuue5DbwOHP0DxB2w99cfxYyR+z1eJqLwbIIJ4NBPipzDQj08+VYtVPAjz1OOR6ySvOaKjXDGwizo681I3vW1OLTjA4Qx4OCPwOFndpdobYw7DJt97fjeaTDSNmcpYAEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744215110; c=relaxed/simple;
	bh=SOt/CFi1QiyqKnESz/YdCWfrhyhPQInzpR3x42DBcxE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WvcG1R4mR25pyuOBJLCnx8Z2P6GbCujE0VKW8ihGtXIiu7X4Txr5A/zGJdpe+cTaF2OwXMyB1PSbPU8/OY7CxP8k9A2q2SRewN9eYvHvBI+nfYOisLtOakbqdw9WzWZGT/WDJHCLZeCP2fJ3XqcbzlQLhGzJUSeugRZJKOQaz+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=B/rx5/JP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53990uxk006865;
	Wed, 9 Apr 2025 16:11:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XXwUDlQWx/Utjz+xFTN2fvOi5jYALPdD8+MrVwah8A8=; b=B/rx5/JPdjBxsG+U
	X5XoTURq4hOH+4xUyonHLnFOvPS+GlxtXVleseObQhgT1z7D3jSmC6xbXGE0PPVh
	fIhrAqqfvcIjn2jIAtpZ+4AXNE9beR1E5Wwu8HUwSriVXMX4+7hf8QiWHXoIyBky
	OIWJoLXf9LPXZWQRJiL8/6txAWUP4homhQUCnGoxufKhLeCEmNtLcfGOJvfzGWIm
	O7hew3G6qQxIf3Cv/5WfnyDTFyKXtqXbj38TJFH9swURLB1tLO8Dexgqo+PsOtWT
	saHC8qeID5m6tfVIV0ix/k1VdirU5ZxT22ahj0GvBS04wSu9e6cFlmlpvCu/sEsE
	doftOw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twg3kxgx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 16:11:39 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 539GBcTR007745
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Apr 2025 16:11:38 GMT
Received: from [10.216.18.165] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 9 Apr 2025
 09:11:34 -0700
Message-ID: <902ed546-4335-26a9-27aa-56a543108b22@quicinc.com>
Date: Wed, 9 Apr 2025 21:41:31 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 4/6] media: platform: qcom/iris: rename iris_vpu3 to
 iris_vpu3x
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>
References: <20250409-topic-sm8x50-iris-v10-v4-0-40e411594285@linaro.org>
 <20250409-topic-sm8x50-iris-v10-v4-4-40e411594285@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250409-topic-sm8x50-iris-v10-v4-4-40e411594285@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: kbTkeGp3dH3-n5oqDxNJl1HQfmcZGAfK
X-Proofpoint-ORIG-GUID: kbTkeGp3dH3-n5oqDxNJl1HQfmcZGAfK
X-Authority-Analysis: v=2.4 cv=I/9lRMgg c=1 sm=1 tr=0 ts=67f69c3b cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=2ECtzDhs6wtSefyIrJgA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_05,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090103


On 4/9/2025 8:08 PM, Neil Armstrong wrote:
> The vpu33 HW is very close to vpu3, and shares most of the
> operations, so rename file to vpu3x since we'll handle all vpu3
> variants in it.
> 
> Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x1e Dell
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/media/platform/qcom/iris/Makefile                      | 2 +-
>  drivers/media/platform/qcom/iris/{iris_vpu3.c => iris_vpu3x.c} | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> index 35390534534e93f4617c1036a05ca0921567ba1d..473aaf655448180ade917e642289677fc1277f99 100644
> --- a/drivers/media/platform/qcom/iris/Makefile
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -20,7 +20,7 @@ qcom-iris-objs += \
>               iris_vb2.o \
>               iris_vdec.o \
>               iris_vpu2.o \
> -             iris_vpu3.o \
> +             iris_vpu3x.o \
>               iris_vpu_buffer.o \
>               iris_vpu_common.o \
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> similarity index 100%
> rename from drivers/media/platform/qcom/iris/iris_vpu3.c
> rename to drivers/media/platform/qcom/iris/iris_vpu3x.c

Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>

