Return-Path: <linux-media+bounces-37162-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F41AFD6F2
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 21:14:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B31261C24408
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 19:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB5252E6D18;
	Tue,  8 Jul 2025 19:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IgkXyHE8"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC4A2BE020
	for <linux-media@vger.kernel.org>; Tue,  8 Jul 2025 19:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752002088; cv=none; b=iE3vtHiU8BeVbyS3CWCHg581EDqAig2orXCCxeE5orYskFAKtVd0Y9lvQ/JnxMZYpoqS3lcOk4L2gCwRa6/vRBfjiZ6HeeCJ9WZJgAOayJjV99kVme07NU2d/3g70bRd12WXIKS/eHPLLUlmAXHVWIGJHzBqCdBRg4+KjKI33zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752002088; c=relaxed/simple;
	bh=yTOZAPMsoe5+fKbdKjOJ2dVMNlBbRsFkumzf5eTtik4=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FxzP1/VblImkuNY0xiaY3HfuTvX72pnOnXnpIxrAyrnAxEogkXUUfJQ07uuiqTtDCeI0psDExtiwULisO7hOGIrF5q0Jy6zWOT3enHUBbI66zhJEwWavY6dHDUlT3UsyN1YqGalxnM0awtNRQMfMFPHOqN02TX4HVxu+wUUBuDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IgkXyHE8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568InbhX017173
	for <linux-media@vger.kernel.org>; Tue, 8 Jul 2025 19:14:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=s6sweIibZzuLyvT7LgYCKqa8
	QknohbGZn8LFyjJmRHo=; b=IgkXyHE8bpD6wo8L986OyPyuh/veJE6qipX9ghlq
	F12Q11vqh35MnGL1tnAdyuQmuZ8aBfA1zUveUIoVrRGm+LwiXQLxahKuU7XtHlBU
	SGtu8UOyTxi14MNr9RC5oF/BwDVa911qUQsmEGIusw9tfMYeEgnHd3O2C1ss/gdg
	Nzye02ZZzhRdtE9xxiNwe8/MPIkYvwAgZnIhPFJ6UDhnSf+dBgwx9R2Y2JBNC/8V
	Ilath0S7BC2FeiTaEz3+gPk3WKz9zvDyagY33r3bYyAhR6Dl3IfylVD8OCQ59Egd
	e9Fa491z63FMikiacijdekuKJ8uwBeAA0htQ9rU1yE4LWQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pvtks1cj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 08 Jul 2025 19:14:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d399065d55so591952885a.1
        for <linux-media@vger.kernel.org>; Tue, 08 Jul 2025 12:14:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752002084; x=1752606884;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s6sweIibZzuLyvT7LgYCKqa8QknohbGZn8LFyjJmRHo=;
        b=PyuYIm9R31uPrSWygn1ON1uLS6A2bkfK7W9xgn+cI8jIfksf3FtuYsqQrriryKgFr/
         JS73DDk5/Evxz5/zuXNlmrueutyvF7Ix7BN2VYL9KiOj6TNyeOlrOzf2zma7NESbCvYy
         lyLCB0LQ0tVgigAV64n4w4h/kwymQES9PVd9+fgwGbuS8MehE19uJo99R6bRseGHNt6+
         +0FzbViYgeXzpDjOrvXOtl9kS6NNYuDhZWtrRMxBtL7MjPKbF0XZf2W0RZ7Oqeo+3zFF
         0lLmlj/3XByxqWfE64nVlSCCvM7TDR1Xpxbm95waseH2VY4pGTgyGl9klGS6FGJH1HFX
         NijQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZRFUPu1wkepH+Zdu3kets210RSvGR2Kvech50l4ZdWXf2SgKSl2GOLQzLhcenE6+kWeyTPRCIZkb7UQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9jR5dWdIb7kD3j1NdyFNaBezpMCc5IRu6dITxLmKK/JI2fsBg
	Qt+7DCwcQ0QgA2JXOefZDJFCR2YPOYncAJm00WMsuN/Ub6LIg1vycSG8vatpcjhwyw7gzhJImmf
	C0CJV8lvM6PKEGEoLYMIxtbe6yDSybcvJiDaVHL8LNmnEjBs3rYkkGTPvpNpla6oXbA==
X-Gm-Gg: ASbGncvENAJ4r5aIsVrZVC7uDfJcqLxSoG6NHbb6+2WtOoKnpEbaukvpNH72Hjp7xLP
	/wCJXX4mrHph9FLCMW3QETc4g6U+1Lo0yO39YmsLHqlIYfRROcOBW0BZnc1JoYrrqzztjXEVo89
	OhU12B8r0Ql6Xt0mkCUjN3EiLgscOzgCLVp+to8AIKuNrZI+bXLQtvjfi30AxpYLJZfLRr5RXWC
	ik2X4DlIJ6xeXbptr+35jdSk6ujV5D6PAJzzJJEqyZqCyYd/dOxej4fMmNXJkSa2i4WSXwnCLQP
	X8pBkJJDVdkqKnBbaYZOURiecfxrVLzisexBQMOoXU/hTtIxJuDb0Cw=
X-Received: by 2002:a05:620a:17a8:b0:7d4:4123:6609 with SMTP id af79cd13be357-7db48495343mr85709385a.39.1752002083425;
        Tue, 08 Jul 2025 12:14:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkrbyx6qD2iCJJQ7I74J3FC4AKUVc3hV41rPej6LTPGifAKMpwCEuISsqpaoLYMX2IZohJRw==
X-Received: by 2002:a05:620a:17a8:b0:7d4:4123:6609 with SMTP id af79cd13be357-7db48495343mr85705185a.39.1752002082914;
        Tue, 08 Jul 2025 12:14:42 -0700 (PDT)
Received: from trex (97.red-79-144-186.dynamicip.rima-tde.net. [79.144.186.97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b470f871casm13738302f8f.45.2025.07.08.12.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 12:14:42 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Tue, 8 Jul 2025 21:14:40 +0200
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>, krzk+dt@kernel.org,
        bryan.odonoghue@linaro.org, quic_vgarodia@quicinc.com,
        mchehab@kernel.org, robh@kernel.org, conor+dt@kernel.org,
        konradybcio@kernel.org, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/5] media: venus: vdec: AR50_LITE video core support
Message-ID: <aG1uINWPwvl505zG@trex>
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-3-jorge.ramirez@oss.qualcomm.com>
 <c0e8460d-1c94-d398-38a0-f63395256f27@quicinc.com>
 <aF62Msej5LvY51D6@trex>
 <8c7232a3-8c49-d77e-e8e4-6d86a33e2b42@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c7232a3-8c49-d77e-e8e4-6d86a33e2b42@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDE2MSBTYWx0ZWRfXxFUa/oFEjqvx
 W09KuK3kvc3USssyj+X69ZE1NhslBEmN1Em25WbQIq3UWQQJJETCDdhhisLdYRaLu7FjX85U+bS
 dno5caAO3M4AO9k1H3MSskPoUlnjc8TRfZp9zAm7RaIuwjm7a7m1ALnHYE8+sU9jo4hlVCTzVaL
 6RKqLIkVkReww6mzB1mHGzHxv7GTPEmk7lu6a3Dj6it/T+zQp1pvuVaxaToeeVouxv5N4Tldnao
 wptkMrGpY/uBFB03SxqPJ0FYcqLVuh2DJ8AFVFrESXo9UHdl4HLVAM+FgK5ObuG4+1svghzifvd
 KLWn82IugAmq0+EV4QfhsW7tOqUv8qfF8qjPp4vOuPWAwx5THPdLXEz7SEWc1zgpL8O41OQWUBm
 vleE7ODvTI1b0H4ZpllLjSYqRLEbDM5ZTkydrKmPgKeqVWAX7KlMMbjZupncpBUsKp1W4gFu
X-Authority-Analysis: v=2.4 cv=Vq0jA/2n c=1 sm=1 tr=0 ts=686d6e25 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=oX6B8lV6/A+qF9mARCc04Q==:17
 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=Ewo0kaykH6HURsZHw64A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ixXdr99kGkzfjskuJUHTIpJ3lkCIxnQH
X-Proofpoint-GUID: ixXdr99kGkzfjskuJUHTIpJ3lkCIxnQH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_05,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507080161

On 30/06/25 12:17:32, Dikshita Agarwal wrote:
> 
> 
> On 6/27/2025 8:48 PM, Jorge Ramirez wrote:
> > On 27/06/25 18:17:27, Dikshita Agarwal wrote:
> >>
> >>
> >> On 6/26/2025 7:29 PM, Jorge Ramirez-Ortiz wrote:
> >>> The AR50_LITE is a streamlined variant of the AR50 video core, designed
> >>> for power and cost-efficient platforms.
> >>>
> >>> It supports hardware-accelerated decoding of H.264, HEVC, and VP9
> >>> formats.
> >>>
> >>> Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> >>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> >>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> >>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> >>> ---
> >>>  drivers/media/platform/qcom/venus/core.c      | 11 ++-
> >>>  drivers/media/platform/qcom/venus/core.h      | 11 ++-
> >>>  drivers/media/platform/qcom/venus/firmware.c  |  8 +-
> >>>  drivers/media/platform/qcom/venus/helpers.c   | 80 +++++++++++++++++++
> >>>  drivers/media/platform/qcom/venus/helpers.h   |  2 +
> >>>  .../media/platform/qcom/venus/hfi_helper.h    | 10 ++-
> >>>  drivers/media/platform/qcom/venus/hfi_venus.c | 14 ++--
> >>>  .../media/platform/qcom/venus/pm_helpers.c    |  1 +
> >>>  drivers/media/platform/qcom/venus/vdec.c      | 15 ++--
> >>>  9 files changed, 128 insertions(+), 24 deletions(-)
> >>>
> >>> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> >>> index d305d74bb152..736ef53d988d 100644
> >>> --- a/drivers/media/platform/qcom/venus/core.c
> >>> +++ b/drivers/media/platform/qcom/venus/core.c
> >>> @@ -254,14 +254,19 @@ static int venus_enumerate_codecs(struct venus_core *core, u32 type)
> >>>  
> >>>  static void venus_assign_register_offsets(struct venus_core *core)
> >>>  {
> >>> -	if (IS_IRIS2(core) || IS_IRIS2_1(core)) {
> >>> -		core->vbif_base = core->base + VBIF_BASE;
> >>> +	if (IS_IRIS2(core) || IS_IRIS2_1(core) || IS_AR50_LITE(core)) {
> >>>  		core->cpu_base = core->base + CPU_BASE_V6;
> >>>  		core->cpu_cs_base = core->base + CPU_CS_BASE_V6;
> >>>  		core->cpu_ic_base = core->base + CPU_IC_BASE_V6;
> >>>  		core->wrapper_base = core->base + WRAPPER_BASE_V6;
> >>>  		core->wrapper_tz_base = core->base + WRAPPER_TZ_BASE_V6;
> >>> -		core->aon_base = core->base + AON_BASE_V6;
> >>> +		if (IS_AR50_LITE(core)) {
> >>> +			core->vbif_base = NULL;
> >>> +			core->aon_base = NULL;
> >>> +		} else {
> >>> +			core->vbif_base = core->base + VBIF_BASE;
> >>> +			core->aon_base = core->base + AON_BASE_V6;
> >>> +		}
> >>>  	} else {
> >>>  		core->vbif_base = core->base + VBIF_BASE;
> >>>  		core->cpu_base = core->base + CPU_BASE;
> >>> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> >>> index b412e0c5515a..e755a28e919b 100644
> >>> --- a/drivers/media/platform/qcom/venus/core.h
> >>> +++ b/drivers/media/platform/qcom/venus/core.h
> >>> @@ -382,6 +382,7 @@ enum venus_inst_modes {
> >>>   * @lock:	instance lock
> >>>   * @core:	a reference to the core struct
> >>>   * @clk_data:	clock data per core ID
> >>> + * @eosbufs:	a lit of EOS buffers
> >>>   * @dpbbufs:	a list of decoded picture buffers
> >>>   * @internalbufs:	a list of internal bufferes
> >>>   * @registeredbufs:	a list of registered capture bufferes
> >>> @@ -450,6 +451,7 @@ struct venus_inst {
> >>>  	struct mutex lock;
> >>>  	struct venus_core *core;
> >>>  	struct clock_data clk_data;
> >>> +	struct list_head eosbufs;
> >>>  	struct list_head dpbbufs;
> >>>  	struct list_head internalbufs;
> >>>  	struct list_head registeredbufs;
> >>> @@ -520,7 +522,14 @@ struct venus_inst {
> >>>  #define IS_V1(core)	((core)->res->hfi_version == HFI_VERSION_1XX)
> >>>  #define IS_V3(core)	((core)->res->hfi_version == HFI_VERSION_3XX)
> >>>  #define IS_V4(core)	((core)->res->hfi_version == HFI_VERSION_4XX)
> >>> -#define IS_V6(core)	((core)->res->hfi_version == HFI_VERSION_6XX)
> >>> +static inline bool IS_V6(struct venus_core *core)
> >>> +{
> >>> +	if (WARN_ON_ONCE(!core))
> >>> +		return false;
> >>> +
> >>> +	return core->res->hfi_version == HFI_VERSION_6XX ||
> >>> +	       core->res->hfi_version == HFI_VERSION_6XX_LITE;
> >>> +}
> >> It should be HFI_VERSION_4XX_LITE for AR50_LITE. 4XX represents SC7280 and
> >> SDM845 which are AR50.
> > 
> > ah good information - where is this documented? I never found this
> > information... I'd appreciate if you could confirm with some document
> > for future reference.
> > 
> >>>  
> >>>  #define IS_AR50(core)		((core)->res->vpu_version == VPU_VERSION_AR50)
> >>>  #define IS_AR50_LITE(core)	((core)->res->vpu_version == VPU_VERSION_AR50_LITE)
> >>> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> >>> index 66a18830e66d..f8dcef0426ac 100644
> >>> --- a/drivers/media/platform/qcom/venus/firmware.c
> >>> +++ b/drivers/media/platform/qcom/venus/firmware.c
> >>> @@ -30,7 +30,7 @@ static void venus_reset_cpu(struct venus_core *core)
> >>>  	u32 fw_size = core->fw.mapped_mem_size;
> >>>  	void __iomem *wrapper_base;
> >>>  
> >>> -	if (IS_IRIS2_1(core))
> >>> +	if (IS_IRIS2_1(core) || IS_AR50_LITE(core))
> >>>  		wrapper_base = core->wrapper_tz_base;
> >>>  	else
> >>>  		wrapper_base = core->wrapper_base;
> >>> @@ -42,7 +42,7 @@ static void venus_reset_cpu(struct venus_core *core)
> >>>  	writel(fw_size, wrapper_base + WRAPPER_NONPIX_START_ADDR);
> >>>  	writel(fw_size, wrapper_base + WRAPPER_NONPIX_END_ADDR);
> >>>  
> >>> -	if (IS_IRIS2_1(core)) {
> >>> +	if (IS_IRIS2_1(core) || IS_AR50_LITE(core)) {
> >>>  		/* Bring XTSS out of reset */
> >>>  		writel(0, wrapper_base + WRAPPER_TZ_XTSS_SW_RESET);
> >>>  	} else {
> >>> @@ -68,7 +68,7 @@ int venus_set_hw_state(struct venus_core *core, bool resume)
> >>>  	if (resume) {
> >>>  		venus_reset_cpu(core);
> >>>  	} else {
> >>> -		if (IS_IRIS2_1(core))
> >>> +		if (IS_IRIS2_1(core) || IS_AR50_LITE(core))
> >>>  			writel(WRAPPER_XTSS_SW_RESET_BIT,
> >>>  			       core->wrapper_tz_base + WRAPPER_TZ_XTSS_SW_RESET);
> >>>  		else
> >>> @@ -181,7 +181,7 @@ static int venus_shutdown_no_tz(struct venus_core *core)
> >>>  	void __iomem *wrapper_base = core->wrapper_base;
> >>>  	void __iomem *wrapper_tz_base = core->wrapper_tz_base;
> >>>  
> >>> -	if (IS_IRIS2_1(core)) {
> >>> +	if (IS_IRIS2_1(core) || IS_AR50_LITE(core)) {
> >>>  		/* Assert the reset to XTSS */
> >>>  		reg = readl(wrapper_tz_base + WRAPPER_TZ_XTSS_SW_RESET);
> >> No need to handle no-tz case. Pls drop.
> > 
> > ok
> > 
> >>>  		reg |= WRAPPER_XTSS_SW_RESET_BIT;
> >>> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> >>> index 8295542e1a7c..812bec9a05be 100644
> >>> --- a/drivers/media/platform/qcom/venus/helpers.c
> >>> +++ b/drivers/media/platform/qcom/venus/helpers.c
> >>> @@ -230,6 +230,79 @@ int venus_helper_alloc_dpb_bufs(struct venus_inst *inst)
> >>>  }
> >>>  EXPORT_SYMBOL_GPL(venus_helper_alloc_dpb_bufs);
> >>>  
> >>> +static void free_eos_buf(struct venus_inst *inst, struct intbuf *buf)
> >>> +{
> >>> +	list_del_init(&buf->list);
> >>> +	dma_free_attrs(inst->core->dev, buf->size, buf->va, buf->da,
> >>> +		       buf->attrs);
> >>> +	kfree(buf);
> >>> +}
> >>> +
> >>> +int venus_helper_free_eos_bufs(struct venus_inst *inst)
> >>> +{
> >>> +	struct intbuf *buf, *n;
> >>> +
> >>> +	list_for_each_entry_safe(buf, n, &inst->eosbufs, list) {
> >>> +		free_eos_buf(inst, buf);
> >>> +	}
> >>> +
> >>> +	if (list_empty(&inst->eosbufs))
> >>> +		INIT_LIST_HEAD(&inst->eosbufs);
> >>> +
> >>> +	return 0;
> >>> +}
> >>> +EXPORT_SYMBOL_GPL(venus_helper_free_eos_bufs);
> >>> +
> >>> +int venus_helper_alloc_eos_buf(struct venus_inst *inst,
> >>> +			       struct hfi_frame_data *data)
> >>> +{
> >>> +	struct venus_core *core = inst->core;
> >>> +	struct device *dev = core->dev;
> >>> +	struct intbuf *buf;
> >>> +	int ret = 0;
> >>> +
> >>> +	memset(data, 0, sizeof(*data));
> >>> +
> >>> +	data->buffer_type = HFI_BUFFER_INPUT;
> >>> +	data->flags = HFI_BUFFERFLAG_EOS;
> >>> +
> >>> +	if (IS_AR50_LITE(inst->core)) {
> >>> +		/* We must send valid sizes and addresses */
> >>> +		buf = kzalloc(sizeof(*buf), GFP_KERNEL);
> >>> +		if (!buf) {
> >>> +			ret = -ENOMEM;
> >>> +			goto fail;
> >>> +		}
> >>> +
> >>> +		buf->type = HFI_BUFFER_INPUT;
> >>> +		buf->size = SZ_4K;
> >>> +		buf->attrs = DMA_ATTR_NO_KERNEL_MAPPING;
> >>> +		buf->va = dma_alloc_attrs(dev, buf->size, &buf->da, GFP_KERNEL,
> >>> +					  buf->attrs);
> >>> +		if (!buf->va) {
> >>> +			ret = -ENOMEM;
> >>> +			goto fail;
> >>> +		}
> >>> +
> >>> +		list_add_tail(&buf->list, &inst->eosbufs);
> >>> +
> >>> +		data->alloc_len = buf->size;
> >>> +		data->device_addr = buf->da;
> >>> +
> >> why this special handling for eos buffer is needed for AR50_LITE?
> > 
> > this _fix_ was develope through testing: without it there is no EOS and
> > errors are reporting upon killing the player
> > 
> Would be better to see why there is no EOS from firmware,
> there shouldn't be the need to have a dma allocation for this dummy
> buffers, as there is no useful info in the buffer. Having the device
> address as 0 or 0xdeadb000 should be enough.
> 

hi dikshita,

I am still keeping this on v6 as per our internal discussions and
because v6 is quite different from v5 so wanted to provide early access
to users.

if the firwmare is fixed to address this issue on time, I might revert
the EOS page buffer. 

TIA
jorge

