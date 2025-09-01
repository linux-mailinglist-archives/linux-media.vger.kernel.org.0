Return-Path: <linux-media+bounces-41395-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2035B3DAB5
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 09:04:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBFC5176D7C
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 07:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A604D25A631;
	Mon,  1 Sep 2025 07:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iJmMVV23"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAF7212556
	for <linux-media@vger.kernel.org>; Mon,  1 Sep 2025 07:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756710264; cv=none; b=IgY8A613+J7CEQyyRKgs3Ov+ojsp/bOZIziOO3xeRtqXVPvfrxVEH8mucBWosuLeSzTwI19BCOhsHTaWaPlrFnbJ+9c/RDwNmZzyVuVxF4iMl0NCOVvSKqr1Th62geKTS7bZJbKLXcHccjcv956x2onECgLdNclXzXd8pOrljpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756710264; c=relaxed/simple;
	bh=YQQja4iUtJHXPXqCeYJ+scYMPKaUF31XRBIpLGv+MVo=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ElsoANJH7vUj/e2kj7wNjFPjYh3k/S37+CIWfLeJI5Iz2sstg7LygCt2gXWmU/cmFLtEcm8KM3z0NyPh1/PK5KL0BweDzMsWoa90RMbr9P6RBtwkrYa191F9WN4LsVtvFf/I1v088jnVTqdxmQ1tpwhdy8zyLWOdzSSea9VRFMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iJmMVV23; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57VLegxm010504
	for <linux-media@vger.kernel.org>; Mon, 1 Sep 2025 07:04:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uE/VNkcgGxZg4bxQlLZeMWOe
	wUFLCRZiFuXlOiXNv1U=; b=iJmMVV235PJ2DI5K/4eQ6JgpV3SSRnZyjitjk7cU
	2AZffpc036zKPFrgeAp5AL6If7/ui0xW9uER4orHBNFBV/PwMjEn8M+Vywct8Uk/
	1jdn/nQC44yFg7bj74WdpkBp1YL1/64fV7Jk3fmvvMinn3UVls8Ts+fTPlLCWp1h
	+35WSsZ/mpns9bHdJKXosfeHZn86qiUgpHs2nHjYCu/lJA6j8GEygHVcqmdsCWtz
	auZ70UOnHvghC1Vf1HJhVuTx/DtP5PHbQqHlSurqMBJ3xWMCzg26TMyywYjnrPAE
	tOYgHHU8v702HXmu6mATziJaA+E0vmiplNtGNzEMgQJEzw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urvyumbc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 01 Sep 2025 07:04:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b311db2c76so335371cf.2
        for <linux-media@vger.kernel.org>; Mon, 01 Sep 2025 00:04:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756710260; x=1757315060;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uE/VNkcgGxZg4bxQlLZeMWOewUFLCRZiFuXlOiXNv1U=;
        b=MA5yuy4aKgKV3mVPJTtpBUOmG9B0uYQy4StxoBBxyw9QwcZyysmb1bjjon5pl3R5oL
         Ay97VuCEc+wsjgZPhfeWNTdwLcBME6/ULIv+TU8jM+1a7GSz5muC1gd5OAqrDWzEuxcG
         UibQJgg9Dea01eY7c676MBeLaUkK7u/KHzro4dMit9WUtz8K//IdmFqhbMDPO7tBKClP
         aYfIiyb3ZhnvrAjVvqbD+RX0KpxU/sCS6uP3QSE1pHlEFbtVUfpYUj9p/bvGWeb2ADbQ
         YJPeKOa47Himaq42gUVgJ7BoUvAfAOrywPllRfJLuGvswMUCo3PspCYtdOZkpCMufrO3
         1ACA==
X-Forwarded-Encrypted: i=1; AJvYcCXVznD+x8Z+H8AwCL+OYwUpmJy2+sc4hoyE745wemMxWZdn77c++Jeh9CluXClsOhg0N6SgJunvasmVqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXNnRQ01p/b+6QP1OU+Owuz+x1u2KujB8pwKoVEssbLNBvC0RB
	0RjMXYf7fvyg6yMuwdL/cDS8GN24lGui2lT6ne63+yK0UBIetsmeqx7SWFJJ85jlQOJ8tGEyTRk
	2bbIbtZRE+/d+0eoAqqDzufND+jg3gFgtGLoo0ytS0Cb9+7yr3Dvfh+XkWshHC2XPqA==
X-Gm-Gg: ASbGncuiDbJlHAElLCNIS8OooHqiFP+NZ1I+UYfEaMYSd9VQIiH1WFxF/bESVcWD0/Q
	f5D+5yyFTqPT+OX6VGYSxzCGPf6Wu8wTvZcAjUqxyiQWf2DgfLJv07nCLLVVkotL0DgsOJHK4Ax
	r0fc0ZqzLp0cU0z3LrXzWWXxfcl4qCKHDTduGuphGKrqjhgGq+8kIiTi7DTTMfgaGus9jtsJsKt
	b1Dw2lm2lAkAK4WTPQjXuGbxiR6Y9UJH/FiwcuDEbqtzYsvR4ydd81CPLb2UnDrF2CA9jl+safK
	pRA/MUuKtEzvtg2auBqb0V1mPMxd7WF6jkm26uTDuALztoW9krY4GiuXA6e1hFP6rg17Irry
X-Received: by 2002:ac8:59d4:0:b0:4b3:105:dd0e with SMTP id d75a77b69052e-4b31dcdedb0mr80691211cf.84.1756710259957;
        Mon, 01 Sep 2025 00:04:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqvOZBx3Up1SuKrEC/9nId/pjz1oZkJwt75SFpF3nCz39S6DR/EG0bjfp1bmFvrrEdfYgIiw==
X-Received: by 2002:ac8:59d4:0:b0:4b3:105:dd0e with SMTP id d75a77b69052e-4b31dcdedb0mr80690791cf.84.1756710259236;
        Mon, 01 Sep 2025 00:04:19 -0700 (PDT)
Received: from trex (104.red-81-38-137.dynamicip.rima-tde.net. [81.38.137.104])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d7330e4bc9sm2100837f8f.10.2025.09.01.00.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 00:04:18 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 1 Sep 2025 09:04:13 +0200
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Cc: quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com,
        bryan.odonoghue@linaro.org, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 2/8] media: venus: Define minimum valid firmware
 version
Message-ID: <aLVFbbcqPBFJRrFO@trex>
References: <20250814085248.2371130-1-jorge.ramirez@oss.qualcomm.com>
 <20250814085248.2371130-3-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814085248.2371130-3-jorge.ramirez@oss.qualcomm.com>
X-Proofpoint-GUID: bHP3Pb0u8GSJXwqIb4iCfTm__BAEabUw
X-Proofpoint-ORIG-GUID: bHP3Pb0u8GSJXwqIb4iCfTm__BAEabUw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX9DMH0EZHHE0+
 7QFpQHB95kTOp8pXxA4OhtcR9/7OUQEp4k3lkeEXAEbrpJ1u3ti5ksUZ73kH96jXAFmU+KKW6Y+
 wDnlA4bOj0mFDNGm/kMxqT9zl3t2INAuHbqYiTJ7PJuH7ZBzwyfvZy11NRaUv32Wq4Qjej1m0rj
 eYvF3lbs5tAydymNOIvvpw4ibgDJIq6zlTMd5GfP9zh20YYghrSLnDidMGWQ75KUNL6jFDamVBb
 4Bk11S9i703f9RfpMzRW13LE08r6fzYwvIBaEsNFr01T4LAXEcroSezWG0kJV7sXyB/CYf2TFjK
 Zpjr06k41wM5xzb2iQkYCIQBdVuqbh+dw4ohssxOCyx1ji2MaAwDdQRXsRKYKgWHmNtPrF8iSJf
 LROiO89m
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b54575 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=b7LKs1oZe9YjeUNSp5ep0A==:17
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=bUZi_dX1JFjbleUUZmwA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027

On 14/08/25 10:52:42, Jorge Ramirez-Ortiz wrote:
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


could I get some feedback on this patch please ?

TIA


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
> -- 
> 2.34.1
> 

