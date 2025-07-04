Return-Path: <linux-media+bounces-36835-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B7663AF91C5
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 13:46:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0365A7B1BCC
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 11:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90B772D4B7A;
	Fri,  4 Jul 2025 11:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kO/L6UIE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559F92C324A;
	Fri,  4 Jul 2025 11:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751629537; cv=none; b=FBi0VzTmlkbUDE4OQl21XMKBNiekLLGwRczsIbWTbGOeirdyncvJXqAThTfvhbOZXTbFXvpFmyXlISzsqV2LXVJadrhI3aMr5t+ziyRraFoY8Skh/fTR3gvCR3y4g/uMIi9fhCUtRH8OFG1H6Uj/am80hWU3SejMVi3qb+aruNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751629537; c=relaxed/simple;
	bh=8Lm8EinxKy29VfyJhyg4qpmyMRPuG3+Tf65PH5MpVE0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=C9Cej2PWuQsBsYfB+JLJoVCqkgILLTaO6nQG0ziWWZowCG4tmRHz4Bcnqfy83gbFS1/p9UKnFAaBc/Qw/8QSxRtWfDv7TRhXXuTCGY3xpKl6tv6Hvv5E+L//D51jCXkdjZhwC/5OTMTj5Qr0JcXGaN+sA1DkNcPi239CGQmuF4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kO/L6UIE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564AQcWH010069;
	Fri, 4 Jul 2025 11:45:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hhwfG2/qXmK5VF5WxedDgSt51TdPX/671+N316jbrE0=; b=kO/L6UIEJDljpXyq
	w7Fr6Nsx53B8EZCiXaemUCH83CLs6Wb1O0o0cvVrKJ0d9xfy7o89+h6Kw1eD8U2i
	W/GBq+e98wcrG9t+9jpJ8Z1cQYC3v9xsFwYhKWRJdFi4lZhatz0kN/3HIHWskUwK
	T4FOKsNWoGHBGn+8Se3nq5jKrkP5j6oWjUaHXx6qNK3z44Lv+txtH9PeS9KVLZyU
	BLnM82UgerDTYs0+FcnwpWIZNVQn2MLC7AZvkUTPaHQcj1xlxVRlGP56A827JLZg
	7OUJtCdM2T3RYbLf9l83/p3CdzxtKWFkFY5Q41J1l78/qpw3VX8JR6BqPgp9uLbJ
	n1fzrw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pd6w07pk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 11:45:24 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 564BjNJh026051
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Jul 2025 11:45:23 GMT
Received: from [10.50.59.132] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 4 Jul
 2025 04:45:20 -0700
Message-ID: <ebcd8ffa-9065-36ee-bba2-d7aa22dcd99e@quicinc.com>
Date: Fri, 4 Jul 2025 17:15:14 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] media: Use of_reserved_mem_region_to_resource() for
 "memory-region"
Content-Language: en-US
To: "Rob Herring (Arm)" <robh@kernel.org>, Ming Qian <ming.qian@nxp.com>,
        "Zhou Peng" <eagle.zhou@nxp.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Vikash Garodia" <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20250703183451.2074066-1-robh@kernel.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <20250703183451.2074066-1-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA5MCBTYWx0ZWRfX5xRgOG8u11IF
 dyINP7AtQQmE8uj0rHqX+t+O9F04Elkz4woeYL8+k8vmc7iIAK+2ZmDFPC/n4MnukENtYp+KS71
 wLyNVAjR5vhhyuAFPsw0Maj80PlzpGCRlg88N/Zauvku+vwrFo8bllbnJVkyVXWRb8ykFYa+tRY
 NZ1hhlRUWD1/js1eXTpm/KJqtaDP+6aC1poxIKlxZ993SF3PPkLIq9gLC4qQoGY5TD/55C64p0D
 LaDAJR7vfKhpGXCcKMni2muHdUHp5MOTgti85X5Oj9e5X9fivoX2T/Ru0/B+Zn+gSmGmwnXc6DK
 YIPkEhYFWqYePWZ2ipf4Rqahh7QxgvXXxJEvY/it1+GSRxIWjMMlCEI3Cvc0GIV4e8TVbARL8Bv
 gMXP7U7gfzn8bS8RQzkYwGEA4hw/rpa3khqzsCDSUBFddYA6StZ3zuDQFoeE3L3opOsIvNZp
X-Proofpoint-GUID: S-KmDRCGHvwIK3qAEkGZs7twGMN8_8w2
X-Authority-Analysis: v=2.4 cv=UPrdHDfy c=1 sm=1 tr=0 ts=6867bed4 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=t1V6AOtiM5Ey4iYayGMA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: S-KmDRCGHvwIK3qAEkGZs7twGMN8_8w2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 malwarescore=0 mlxscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040090



On 7/4/2025 12:04 AM, Rob Herring (Arm) wrote:
> Use the newly added of_reserved_mem_region_to_resource() function to
> handle "memory-region" properties.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  drivers/media/platform/amphion/vpu_core.c     | 40 +++++--------------
>  .../media/platform/qcom/iris/iris_firmware.c  | 18 +++------
>  drivers/media/platform/qcom/venus/firmware.c  | 19 +++------
>  3 files changed, 21 insertions(+), 56 deletions(-)
> 

[snip]

>  
> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> index f1b5cd56db32..40448429ba97 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> @@ -19,8 +19,7 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>  	u32 pas_id = core->iris_platform_data->pas_id;
>  	const struct firmware *firmware = NULL;
>  	struct device *dev = core->dev;
> -	struct reserved_mem *rmem;
> -	struct device_node *node;
> +	struct resource res;
>  	phys_addr_t mem_phys;
>  	size_t res_size;
>  	ssize_t fw_size;
> @@ -30,17 +29,12 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>  	if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
>  		return -EINVAL;
>  
> -	node = of_parse_phandle(dev->of_node, "memory-region", 0);
> -	if (!node)
> -		return -EINVAL;
> -
> -	rmem = of_reserved_mem_lookup(node);
> -	of_node_put(node);
> -	if (!rmem)
> -		return -EINVAL;
> +	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
> +	if (ret)
> +		return ret;
>  
> -	mem_phys = rmem->base;
> -	res_size = rmem->size;
> +	mem_phys = res.start;
> +	res_size = resource_size(&res);
>  
>  	ret = request_firmware(&firmware, fw_name, dev);
>  	if (ret)
> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> index 66a18830e66d..37c0fd52333e 100644
> --- a/drivers/media/platform/qcom/venus/firmware.c
> +++ b/drivers/media/platform/qcom/venus/firmware.c
> @@ -9,7 +9,6 @@
>  #include <linux/iommu.h>
>  #include <linux/io.h>
>  #include <linux/of.h>
> -#include <linux/of_address.h>
>  #include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  #include <linux/of_device.h>
> @@ -83,8 +82,7 @@ static int venus_load_fw(struct venus_core *core, const char *fwname,
>  			 phys_addr_t *mem_phys, size_t *mem_size)
>  {
>  	const struct firmware *mdt;
> -	struct reserved_mem *rmem;
> -	struct device_node *node;
> +	struct resource res;
>  	struct device *dev;
>  	ssize_t fw_size;
>  	void *mem_va;
> @@ -94,15 +92,8 @@ static int venus_load_fw(struct venus_core *core, const char *fwname,
>  	*mem_size = 0;
>  
>  	dev = core->dev;
> -	node = of_parse_phandle(dev->of_node, "memory-region", 0);
> -	if (!node) {
> -		dev_err(dev, "no memory-region specified\n");
> -		return -EINVAL;
> -	}
> -
> -	rmem = of_reserved_mem_lookup(node);
> -	of_node_put(node);
> -	if (!rmem) {
> +	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
> +	if (ret) {
>  		dev_err(dev, "failed to lookup reserved memory-region\n");
>  		return -EINVAL;
>  	}
> @@ -117,8 +108,8 @@ static int venus_load_fw(struct venus_core *core, const char *fwname,
>  		goto err_release_fw;
>  	}
>  
> -	*mem_phys = rmem->base;
> -	*mem_size = rmem->size;
> +	*mem_phys = res.start;
> +	*mem_size = resource_size(&res);
>  
>  	if (*mem_size < fw_size || fw_size > VENUS_FW_MEM_SIZE) {
>  		ret = -EINVAL;

Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>

Thanks,
Dikshita

