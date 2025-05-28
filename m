Return-Path: <linux-media+bounces-33555-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF85AC7183
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 21:27:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60CB51BC5372
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 19:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C7AE21D3E7;
	Wed, 28 May 2025 19:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fmzNirXZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B75521CC56
	for <linux-media@vger.kernel.org>; Wed, 28 May 2025 19:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748460452; cv=none; b=NKskalEoN12DvHB7H/zzf9B6ZVdNuCgrfFe+hmh32ZYZATDaRIUh9BZl+GjLxDJ5iUQLOdXaBHYJdSKATI96DTN0y8IlduhHPNqClwFhkxy870sgYsXvfaprFHuQS+9uJoJPtiU3PIrwVe97qayZVPFUkW3Ywn6sEloP7FUSxKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748460452; c=relaxed/simple;
	bh=Xn1FKEJLv5D8pFVsWrE9ZqQAzj3W2hMUw/eULkExvVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jNYewCV3/SdojFOH0NmwenemMqc5knsNAJTfFpk6dTdbskNkn8mzowgrnNpkbs4vBi2Um4HAZrdAe02ab2jSQDQs03axtA9hKG7Om6f35bUurpY5lXKj9163lqXeg2y3hf965qqzlI7HgmZmH3289lTmsb2aoTpXRU1qqFe3zW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fmzNirXZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SEnE9m028909
	for <linux-media@vger.kernel.org>; Wed, 28 May 2025 19:27:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vappqUOIevOsLclXr9ODpZ9f
	RqMbtiuDh6sBRBORQbE=; b=fmzNirXZ6FyEDMBnoFgsH0PUrLkYHh0K/PWCX78G
	YhCdS7s4lUaRBzPpPUGWuDELd1MwkPxuYcMvtfp/T1s5yM1nAaHlSBDRLda2Y50F
	3uN7V9CKQpi5h0cMRga6R4ioaOUALHJ5rj6ojcG2JI7MSqqyqzRx+UI877PrI4jo
	KxHwFT+ocGF7JUVjwYMeuWqfKNKjCh4VV4obdqGVbK1myr2NbtLdB4Qj0hl+G9Q4
	tn5WSgztOJ1oshpwlXlkcW69vSEr4xqJiiXIsEl9HPJjKVlg5K+fRlWFQ9Pn7goT
	q6RTMy04G2YOb2mOOzJNo8s5EwCPHfESDsi/uMw2Qqj56g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46whuf3r2v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 28 May 2025 19:27:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7cd06c31ad6so194209685a.0
        for <linux-media@vger.kernel.org>; Wed, 28 May 2025 12:27:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748460448; x=1749065248;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vappqUOIevOsLclXr9ODpZ9fRqMbtiuDh6sBRBORQbE=;
        b=wuyGo5U7DqK9zqwiN6255TsFSL0nxzT58GFzZUQj3dncastWB8m+S/bEP4DdatOnrd
         v2xPFuWBCuIEmlehUujl2E3pNWn34jHx2d5KGKirgY3F4kuf0c0u6/X/RH98qOvEHoUW
         JiQz1xu5kBsn9BjiIhVgp8uRAt21IIaNj3pf6biJxtkN6eTyKbD1g/WPr8ZtHggEqAbA
         +wlBFOMpQWhkC/EsnL5cZTbMOBXS7NzRN7EugJvV0AUH2Pcs9M2yD47djasEFQkPLOZT
         479g1Y3bOkAJT8n3c4yQQhZtFUL8E/xdSkxl+ThNgS2rOpZt3g19iOv0v46RiqEofaVg
         5+AQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCFUa0ar/yTVkk/nNp7hUKCfF5dEb4ZMVBY1pnLJY2/FARDYpdDZ0OIWyP5DdVVOaRsvUBqU/2b+L55Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1TcL44MT49qOsIWKtTJgvvbh4BwgENjXvxGVkVDWTAeBwlIEh
	Bqruy3ETo6Ntk54dkUlS6eomfL3hzByStXCSw50194qchVf5mtYZMnUpeL6Mep6XtfaU2+j0OHM
	F6p0+tnAo29/8sZKWknMtX7F2I80Dyj6sQX97p9fqNNS7VjEu/yidrnQeSBMRxHlnvA==
X-Gm-Gg: ASbGncsyJyi1bUO1uyxxxSn06yhbqUFh7tFJa+96+1Zhvx8OFH1bH5M9Xs9Fbu+KbEk
	95dYm/XDDjjjcMSZmqLLcXFDmtW2bVEhXn9f+/2zUKTaTuMks5RnCJAsVbGA7ZT9XvRoNBV1RM0
	xKW5coakCydUs7ymj/mVlkmfytARw0tYfQk8467VLgOTUiHSnZfM3x3ESMFBoX46hjrrmEVj3w0
	raw28eOBXqgNzc1CG/xgkqxIkQN9X7D56NvXwQ9Bn+vAgQ54dstm9KhdVZlcTIKYBrgq1uK9n3x
	hA7C4QQTTV8t8po2d1kUt8gRqjLcqSSLIQXkLg4SPOlt8+eM4hNRs9+rbLYL/kC7AxfyYomILrg
	=
X-Received: by 2002:a05:620a:1a23:b0:7ce:eb15:6f7d with SMTP id af79cd13be357-7d0987d636emr112820285a.20.1748460447669;
        Wed, 28 May 2025 12:27:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsnngm+Izjr1ofjAwabPE98EDhFCUUgnxCLZ5MClGgAAgXgIfJXNwHrbGpGcDTWLEBS94kKQ==
X-Received: by 2002:a05:620a:1a23:b0:7ce:eb15:6f7d with SMTP id af79cd13be357-7d0987d636emr112815385a.20.1748460447219;
        Wed, 28 May 2025 12:27:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f6b25a5sm404947e87.211.2025.05.28.12.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 12:27:26 -0700 (PDT)
Date: Wed, 28 May 2025 22:27:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Renjiang Han <quic_renjiang@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v4 1/2] venus: pm_helpers: add compatibility for
 dev_pm_genpd_set_hwmode on V4
Message-ID: <zewub4somwmi6jvym5m44t6cumeonv2pcrtsntbkujlznotefp@bhfrerykhfqu>
References: <20250218-switch_gdsc_mode-v4-0-546f6c925ae0@quicinc.com>
 <20250218-switch_gdsc_mode-v4-1-546f6c925ae0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218-switch_gdsc_mode-v4-1-546f6c925ae0@quicinc.com>
X-Authority-Analysis: v=2.4 cv=OslPyz/t c=1 sm=1 tr=0 ts=683763a1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=gF5d3Xu8TQ-Je0CE9tcA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: N5LLxMD_CTAcwj5TmRsVjQnvtPB-tq9a
X-Proofpoint-GUID: N5LLxMD_CTAcwj5TmRsVjQnvtPB-tq9a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDE3MCBTYWx0ZWRfX0kkUydBvnLZu
 ww+x3chykg4TeB69yCiIbqUbTQ01tPuv9p06ChB4mjasoGclQ0bgRUn+P5HoavTfXQywPQe8b47
 YUwY8qDFwuaNI6Ie+/zuh9DAuCKU7m9Xlsbdbc+t6LPWqgHgWsBB6AUT9lZXTR0QL27Pn2OsCC5
 /5yZusP+/w3fxhRDq0Op1ZhCWQMu7xP6kRgGN345cc4V7OPoD+CMm3Bx0/HRDfy2VtFSFWvk7QD
 rILg42AqbX1LoXIKV7aenb0pBR1DSq0fgn+x+Zq2eVZzdStHHgFFyyoItKOUNze7ZVNToThRZmO
 SgmEKX0rY5osDLBUcNC7PdmkQJMqyEDLFa+F5UuGbFnP4Vgx9Yo/XGh9gpT5aF/zqz/fFfTae5Z
 PTf2ttULXx6A+B05PvhBAtVOyFtJup5WClplMKzaoIXPNhWvgRIkw/ZdPKnFoKLBUKDl1TDC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280170

On Tue, Feb 18, 2025 at 04:03:20PM +0530, Renjiang Han wrote:
> There are two ways to switch GDSC mode. One is to write the POWER_CONTROL
> register and the other is to use dev_pm_genpd_set_hwmode(). However, they
> rely on different clock driver flags. dev_pm_genpd_set_hwmode() depends on
> the HW_CTRL_TRIGGER flag and POWER_CONTROL register depends on the HW_CTRL
> flag.
> 
> By default, the dev_pm_genpd_set_hwmode() is used to switch the GDSC mode.
> If it fails and dev_pm_genpd_set_hwmode() returns -EOPNOTSUPP, it means
> that the clock driver uses the HW_CTRL flag. At this time, the GDSC mode
> is switched to write the POWER_CONTROL register.
> 
> Clock driver is using HW_CTRL_TRIGGER flag with V6. So hwmode_dev is
> always true on using V6 platform. Conversely, if hwmode_dev is false, this
> platform must be not using V6. Therefore, replace IS_V6 in poweroff_coreid
> with hwmode_dev. Also, with HW_CTRL_TRIGGER flag, the vcodec gdsc gets
> enabled in SW mode by default. Therefore, before disabling the GDSC, GDSC
> should be switched to SW mode so that GDSC gets enabled in SW mode in the
> next enable.
> 
> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> ---
>  drivers/media/platform/qcom/venus/core.h       |  2 ++
>  drivers/media/platform/qcom/venus/pm_helpers.c | 38 ++++++++++++++------------
>  2 files changed, 23 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 43532543292280be15adf688fc0c30f44e207c7f..0ccce89d3f54cf685ecce5b339a51e44f6ea3704 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -168,6 +168,7 @@ struct venus_format {
>   * @root:	debugfs root directory
>   * @venus_ver:	the venus firmware version
>   * @dump_core:	a flag indicating that a core dump is required
> + * @hwmode_dev:	a flag indicating that HW_CTRL_TRIGGER is used in clock driver
>   */
>  struct venus_core {
>  	void __iomem *base;
> @@ -230,6 +231,7 @@ struct venus_core {
>  		u32 rev;
>  	} venus_ver;
>  	unsigned long dump_core;
> +	bool hwmode_dev;
>  };
>  
>  struct vdec_controls {
> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
> index 33a5a659c0ada0ca97eebb5522c5f349f95c49c7..409aa9bd0b5d099c993eedb03177ec5ed918b4a0 100644
> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
> @@ -412,9 +412,17 @@ static int vcodec_control_v4(struct venus_core *core, u32 coreid, bool enable)
>  	u32 val;
>  	int ret;
>  
> -	if (IS_V6(core))
> -		return dev_pm_genpd_set_hwmode(core->pmdomains->pd_devs[coreid], !enable);
> -	else if (coreid == VIDC_CORE_ID_1) {
> +	ret = dev_pm_genpd_set_hwmode(core->pmdomains->pd_devs[coreid], !enable);
> +	if (ret == -EOPNOTSUPP) {
> +		core->hwmode_dev = false;
> +		goto legacy;
> +	}
> +
> +	core->hwmode_dev = true;
> +	return ret;
> +
> +legacy:
> +	if (coreid == VIDC_CORE_ID_1) {
>  		ctrl = core->wrapper_base + WRAPPER_VCODEC0_MMCC_POWER_CONTROL;
>  		stat = core->wrapper_base + WRAPPER_VCODEC0_MMCC_POWER_STATUS;
>  	} else {
> @@ -450,7 +458,7 @@ static int poweroff_coreid(struct venus_core *core, unsigned int coreid_mask)
>  
>  		vcodec_clks_disable(core, core->vcodec0_clks);
>  
> -		if (!IS_V6(core)) {
> +		if (!core->hwmode_dev) {
>  			ret = vcodec_control_v4(core, VIDC_CORE_ID_1, false);
>  			if (ret)
>  				return ret;
> @@ -468,7 +476,7 @@ static int poweroff_coreid(struct venus_core *core, unsigned int coreid_mask)
>  
>  		vcodec_clks_disable(core, core->vcodec1_clks);
>  
> -		if (!IS_V6(core)) {
> +		if (!core->hwmode_dev) {
>  			ret = vcodec_control_v4(core, VIDC_CORE_ID_2, false);
>  			if (ret)
>  				return ret;
> @@ -491,11 +499,9 @@ static int poweron_coreid(struct venus_core *core, unsigned int coreid_mask)
>  		if (ret < 0)
>  			return ret;
>  
> -		if (!IS_V6(core)) {
> -			ret = vcodec_control_v4(core, VIDC_CORE_ID_1, true);
> -			if (ret)
> -				return ret;
> -		}
> +		ret = vcodec_control_v4(core, VIDC_CORE_ID_1, true);
> +		if (ret)
> +			return ret;
>  
>  		ret = vcodec_clks_enable(core, core->vcodec0_clks);
>  		if (ret)
> @@ -511,11 +517,9 @@ static int poweron_coreid(struct venus_core *core, unsigned int coreid_mask)
>  		if (ret < 0)
>  			return ret;
>  
> -		if (!IS_V6(core)) {
> -			ret = vcodec_control_v4(core, VIDC_CORE_ID_2, true);
> -			if (ret)
> -				return ret;
> -		}
> +		ret = vcodec_control_v4(core, VIDC_CORE_ID_2, true);
> +		if (ret)
> +			return ret;
>  
>  		ret = vcodec_clks_enable(core, core->vcodec1_clks);
>  		if (ret)
> @@ -811,7 +815,7 @@ static int vdec_power_v4(struct device *dev, int on)
>  	else
>  		vcodec_clks_disable(core, core->vcodec0_clks);
>  
> -	vcodec_control_v4(core, VIDC_CORE_ID_1, false);
> +	ret = vcodec_control_v4(core, VIDC_CORE_ID_1, false);


return vcodec_control_v4(...);

>  
>  	return ret;
>  }
> @@ -856,7 +860,7 @@ static int venc_power_v4(struct device *dev, int on)
>  	else
>  		vcodec_clks_disable(core, core->vcodec1_clks);
>  
> -	vcodec_control_v4(core, VIDC_CORE_ID_2, false);
> +	ret = vcodec_control_v4(core, VIDC_CORE_ID_2, false);

And here.

>  
>  	return ret;
>  }
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

