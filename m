Return-Path: <linux-media+bounces-41396-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 894ABB3DB0D
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 09:31:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF12F3AC2F7
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 07:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6CA126E704;
	Mon,  1 Sep 2025 07:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VzD8lfgc"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3BA26C39F
	for <linux-media@vger.kernel.org>; Mon,  1 Sep 2025 07:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756711887; cv=none; b=iTqwAtk27yTqy1QoYdkjueNyqNA0xDMCJskN6cyeG67Pt8xrLYcivkEm6eyGeOU2ovOHmrdfQfEnTvvJUEqqVmNLbXaKCQm2BV8Ha+/mHIG6R/TmPrTYrLVkTUWlMMx78PWtNtbhPwrnMMfxM23w3qSGoDtwEjnW2nUwoae+eHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756711887; c=relaxed/simple;
	bh=8xocM8Mh7uA/SB5IMjDbGvPsDrVY9V8klO3GIYoop1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U3gaPocf7BlNWS8+g/W5T9y13UFXpvo6ErPimq6xV+rqMMflq7hiaoYEdIK++8gm9wE4Et8YT5KLs4aFaiq7WGVZr6zN6jwOGWSDR12xGyjjelRoTXq4TouNw8P4Wu1TYdNN4fEchl3IUXnivC5yPPq319m/qk90+7JpTiQxgMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VzD8lfgc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57VNRDb4021586
	for <linux-media@vger.kernel.org>; Mon, 1 Sep 2025 07:31:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vZq4vWDlAyDOhzkGL59aS4g8pR5uZ416YLXPx7NWjJ8=; b=VzD8lfgcCLRHfdwR
	apn6u1v0drvx+2WoRZ6bOr7gK++dUELA/2X0H3Gtjn9/yC2HqRvgFWaRiwk+dLvf
	fH1JEUlURV682871KB8KvC2QOuULaOqz85x4X2IVorQFQelBIZOFflRK2WEtND/O
	vNoWJD37xNmJy8QAev2PayoW8HtUxMlKEuffBMUfqkhDeiGPQTDZpD+RnG3Dys6c
	nL4VbNQUzJSlAWUKqOKtJx7u44ykaK5UXjvC+uevyFVHf63+XOQjbJgkhcO00DUj
	hp64gZ849WNRoU913dlZQS35UMUG+/JuE//wYJs8iP7TJyVcBDHYs6UtDrsyY4Av
	ZFPkkQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ush2uqga-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 01 Sep 2025 07:31:24 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-248942647c5so56312415ad.0
        for <linux-media@vger.kernel.org>; Mon, 01 Sep 2025 00:31:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756711884; x=1757316684;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vZq4vWDlAyDOhzkGL59aS4g8pR5uZ416YLXPx7NWjJ8=;
        b=pekQtzZ4oSayAEhOpXZJhWGl2Wa9bZ3K0h90VUdJymNfhT9b5AMUh9vUZQEFJA5iCB
         19etwLhZE1xaiTZHoO6Ehb8m+kCFC/+lwCMTUy83aqWsgtYwioF5Yagxx1WKeHTjKisw
         DCznXdYPmN2+Kn+cnxuikkkCLRvWBbvESHPmdoVEmxVbde/Cbq1TZFiNhXFrVWsW1cfX
         MYJvnC2JsxYQWC4rbLb2MgCHKsDd3TEJfX1Kx902emU8z6bcdjpChoC/b2IGEneMOWkx
         2it1b+FGrfmJGeDEB63XZgNJ7Qf2WkFTYAVn2XSiPqYz/Ru0SU8AJPXg1j6XWDjHcR7t
         4a/A==
X-Gm-Message-State: AOJu0Ywv0iLpmSrRabsyDY1b6HrpvS7A/oBlgZqpd5Z9JtbHRfuH8kKF
	u9pzt2gdRgwB2ur/aVj6SQcInlqwlaUIvc954+dGn1qP7jWKxLRV+vMuA0oPx8aSz6cbmg9uN/b
	mH1XQs2Y/TwQ2lwf16AP7DBmNHV98TBE+WRZXn3AzKBzLyn6UQ4TBALG9d50q4NnwOFL4L2U9/d
	kv
X-Gm-Gg: ASbGncvxwUgnSHhJDDy17C1Xq0Bk4FpL/dH/LKUv9HWsm7GX0y8cK1KXqvig2UBfs+m
	FOJxHjZoukCBBspoDiHyV+j3Y2hLecsocS1itIcSd0VKU6p9m8fLQz5l+0EMEizSKKpCjCDRfsU
	Oqh068tzLRnE4zOxUuKlL38WBHlKeKJTnBmGRJ4Mn192WpIwIhjKtYFTYw8jgfue896E9EmglZb
	L8FLqcTFcUFcSI2cCJybprSybEjIA/jp1IwzLXR4cSbwwaL4uJuR4x0c7ATmVApzvVI9dnaNe+g
	SHug4d8K965GjDV42drFkh15IVhyZgzQMfeompLXAppq9jGZWLl3SdH4ZOxQQfOD8vLz9EIq2w=
	=
X-Received: by 2002:a17:903:2287:b0:246:b5a3:134 with SMTP id d9443c01a7336-2493ef5007amr94224315ad.14.1756711883664;
        Mon, 01 Sep 2025 00:31:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZ8c8KeaxHBzQX0z2NKK2C3foPJJTViRCi4XZSWKSONnNgivBSmPLWbz0mMgs5MJSB81C3Ag==
X-Received: by 2002:a17:903:2287:b0:246:b5a3:134 with SMTP id d9443c01a7336-2493ef5007amr94223765ad.14.1756711883125;
        Mon, 01 Sep 2025 00:31:23 -0700 (PDT)
Received: from [10.0.0.86] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-249066e0326sm95557345ad.143.2025.09.01.00.31.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 00:31:22 -0700 (PDT)
Message-ID: <a5991924-0bda-317e-bfbc-30a852604559@oss.qualcomm.com>
Date: Mon, 1 Sep 2025 13:01:04 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v10 2/8] media: venus: Define minimum valid firmware
 version
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        quic_vgarodia@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250814085248.2371130-1-jorge.ramirez@oss.qualcomm.com>
 <20250814085248.2371130-3-jorge.ramirez@oss.qualcomm.com>
Content-Language: en-US
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20250814085248.2371130-3-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfX9tIRQGBqCPVd
 sH/lp4Z6D5sSYeH7aE6K+Ut0Gyhq4//dCA2vFI4au5gkPWBpJjQ773bcRbL294S7hq48IvEKp10
 uYBIoBwt5fkDAHlvrAj0tZ59mQ+zIeaA1LdFnpDfoR+W6llYVqdtsAXxi24aiNLtFERPws6j3up
 qPPdNgdvTFcTvLe9WwjZjLD8z48tiqYEvAS3Us+5j0nYUrZjWMIn7uPhOwb/u36uIVsaWmQ2wd2
 LRiINuhzyeJGne0++WdOo8eeouVs4jgNMOunnatsKSx/Jd5KA0gMBzCi3oa3WYfb2RxjF3F+B0X
 yK1ETRNYW6gqoRUmUSC+CogTaxIedV6ovmnUJFWpXcEvUStG2yfFoiSTEDIMlz0SXQQ+TVihwAZ
 MbrPEHYN
X-Proofpoint-ORIG-GUID: HavyiosNTGucSGj8XrMKWDdurN6tnKtI
X-Proofpoint-GUID: HavyiosNTGucSGj8XrMKWDdurN6tnKtI
X-Authority-Analysis: v=2.4 cv=M9NNKzws c=1 sm=1 tr=0 ts=68b54bcc cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=bUZi_dX1JFjbleUUZmwA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1011 suspectscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300032



On 8/14/2025 2:22 PM, Jorge Ramirez-Ortiz wrote:
> Add support for specifying the minimum firmware version required for
> correct operation.
> 
> When set, the driver compares this value against the version reported by
> the firmware: if the firmware is older than required, driver
> initialization will fail.
> 
> The version check is performed before creating dynamic device tree
> nodes, to avoid the need for reverting nodes on failure.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/venus/core.c     | 40 +++++++++++---------
>  drivers/media/platform/qcom/venus/core.h     | 13 ++++---
>  drivers/media/platform/qcom/venus/firmware.c | 20 ++++++++++
>  drivers/media/platform/qcom/venus/firmware.h |  1 +
>  drivers/media/platform/qcom/venus/hfi_msgs.c | 11 +++++-
>  5 files changed, 61 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 90de29f166ad..5d76e50234f6 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -448,19 +448,9 @@ static int venus_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		goto err_runtime_disable;
>  
> -	if (core->res->dec_nodename || core->res->enc_nodename) {
> -		ret = venus_add_dynamic_nodes(core);
> -		if (ret)
> -			goto err_runtime_disable;
> -	}
> -
> -	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
> -	if (ret)
> -		goto err_remove_dynamic_nodes;
> -
>  	ret = venus_firmware_init(core);
>  	if (ret)
> -		goto err_of_depopulate;
> +		goto err_runtime_disable;
>  
>  	ret = venus_boot(core);
>  	if (ret)
> @@ -474,34 +464,48 @@ static int venus_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_venus_shutdown;
>  
> -	ret = venus_enumerate_codecs(core, VIDC_SESSION_TYPE_DEC);
> +	ret = venus_firmware_check(core);
>  	if (ret)
>  		goto err_core_deinit;
>  
> +	if (core->res->dec_nodename || core->res->enc_nodename) {
> +		ret = venus_add_dynamic_nodes(core);
> +		if (ret)
> +			goto err_core_deinit;
> +	}
> +
> +	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
> +	if (ret)
> +		goto err_remove_dynamic_nodes;
> +
> +	ret = venus_enumerate_codecs(core, VIDC_SESSION_TYPE_DEC);
> +	if (ret)
> +		goto err_of_depopulate;
> +
>  	ret = venus_enumerate_codecs(core, VIDC_SESSION_TYPE_ENC);
>  	if (ret)
> -		goto err_core_deinit;
> +		goto err_of_depopulate;
>  
>  	ret = pm_runtime_put_sync(dev);
>  	if (ret) {
>  		pm_runtime_get_noresume(dev);
> -		goto err_core_deinit;
> +		goto err_of_depopulate;
>  	}
>  
>  	venus_dbgfs_init(core);
>  
>  	return 0;
>  
> +err_of_depopulate:
> +	of_platform_depopulate(dev);
> +err_remove_dynamic_nodes:
> +	venus_remove_dynamic_nodes(core);
>  err_core_deinit:
>  	hfi_core_deinit(core, false);
>  err_venus_shutdown:
>  	venus_shutdown(core);
>  err_firmware_deinit:
>  	venus_firmware_deinit(core);
> -err_of_depopulate:
> -	of_platform_depopulate(dev);
> -err_remove_dynamic_nodes:
> -	venus_remove_dynamic_nodes(core);
>  err_runtime_disable:
>  	pm_runtime_put_noidle(dev);
>  	pm_runtime_disable(dev);
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index db7b69b91db5..58da4752569a 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -58,6 +58,12 @@ enum vpu_version {
>  	VPU_VERSION_IRIS2_1,
>  };
>  
> +struct firmware_version {
> +	u32 major;
> +	u32 minor;
> +	u32 rev;
> +};
> +
>  struct venus_resources {
>  	u64 dma_mask;
>  	const struct freq_tbl *freq_tbl;
> @@ -94,6 +100,7 @@ struct venus_resources {
>  	const char *fwname;
>  	const char *enc_nodename;
>  	const char *dec_nodename;
> +	const struct firmware_version *min_fw;
>  };
>  
>  enum venus_fmt {
> @@ -231,11 +238,7 @@ struct venus_core {
>  	unsigned int core0_usage_count;
>  	unsigned int core1_usage_count;
>  	struct dentry *root;
> -	struct venus_img_version {
> -		u32 major;
> -		u32 minor;
> -		u32 rev;
> -	} venus_ver;
> +	struct firmware_version venus_ver;
>  	unsigned long dump_core;
>  	struct of_changeset *ocs;
>  	bool hwmode_dev;
> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> index 66a18830e66d..3666675ae298 100644
> --- a/drivers/media/platform/qcom/venus/firmware.c
> +++ b/drivers/media/platform/qcom/venus/firmware.c
> @@ -280,6 +280,26 @@ int venus_shutdown(struct venus_core *core)
>  	return ret;
>  }
>  
> +int venus_firmware_check(struct venus_core *core)
> +{
> +	const struct firmware_version *req = core->res->min_fw;
> +	const struct firmware_version *run = &core->venus_ver;
> +
> +	if (!req)
> +		return 0;
> +
> +	if (!is_fw_rev_or_newer(core, req->major, req->minor, req->rev))
> +		goto error;
> +
> +	return 0;
> +error:
> +	dev_err(core->dev, "Firmware v%d.%d.%d < v%d.%d.%d\n",
> +		run->major, run->minor, run->rev,
> +		req->major, req->minor, req->rev);
> +
> +	return -EINVAL;
> +}
> +
>  int venus_firmware_init(struct venus_core *core)
>  {
>  	struct platform_device_info info;
> diff --git a/drivers/media/platform/qcom/venus/firmware.h b/drivers/media/platform/qcom/venus/firmware.h
> index aaccd847fa30..ead39e3797f0 100644
> --- a/drivers/media/platform/qcom/venus/firmware.h
> +++ b/drivers/media/platform/qcom/venus/firmware.h
> @@ -9,6 +9,7 @@ struct device;
>  
>  int venus_firmware_init(struct venus_core *core);
>  void venus_firmware_deinit(struct venus_core *core);
> +int venus_firmware_check(struct venus_core *core);
>  int venus_boot(struct venus_core *core);
>  int venus_shutdown(struct venus_core *core);
>  int venus_set_hw_state(struct venus_core *core, bool suspend);
> diff --git a/drivers/media/platform/qcom/venus/hfi_msgs.c b/drivers/media/platform/qcom/venus/hfi_msgs.c
> index cf0d97cbc463..47b99d5b5af7 100644
> --- a/drivers/media/platform/qcom/venus/hfi_msgs.c
> +++ b/drivers/media/platform/qcom/venus/hfi_msgs.c
> @@ -277,7 +277,12 @@ static void hfi_sys_init_done(struct venus_core *core, struct venus_inst *inst,
>  
>  done:
>  	core->error = error;
> -	complete(&core->done);
> +	/*
> +	 * Since core_init could ask for the firmware version to be validated,
> +	 * completion might have to wait until the version is retrieved.
> +	 */
> +	if (!core->res->min_fw)
> +		complete(&core->done);
>  }
>  
>  static void
> @@ -328,6 +333,10 @@ sys_get_prop_image_version(struct venus_core *core,
>  	if (!IS_ERR(smem_tbl_ptr) && smem_blk_sz >= SMEM_IMG_OFFSET_VENUS + VER_STR_SZ)
>  		memcpy(smem_tbl_ptr + SMEM_IMG_OFFSET_VENUS,
>  		       img_ver, VER_STR_SZ);
> +
> +	/* core_init could have had to wait for a version check */
> +	if (core->res->min_fw)
> +		complete(&core->done);
>  }
>  
>  static void hfi_sys_property_info(struct venus_core *core,

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

