Return-Path: <linux-media+bounces-37473-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E76B01A9B
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 13:33:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A7B1560D88
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 11:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B232528C033;
	Fri, 11 Jul 2025 11:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CvIz7+4g"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64263283141
	for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 11:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752233614; cv=none; b=AlFNcz8DCdhwr4WodJFyUmecKNAfR/eo56oudmOuo0kx/1qg+TmFrrwN3QF4+CbV9TjR4tW3FOnwO/sNVuGYqRL/hVxPJIXR4zutb1uJykHfrIAj5YVMI6sVpNg/QLquX1AW1xpDw++ya7J3MEKSnwFk0VhLFTj489bLj+2Drk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752233614; c=relaxed/simple;
	bh=EwQjI8MnTvPTBqU//ZqZnKU+OSO9+/lyAirDRR/spS8=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AezSyZRFMju9m0RoJnY9XQZRvCDNrCBHcLiDI7DBDY4D7AelFu/XoYr8nWIZ5OtP+qQIYT39LDGrbqNRPFs8AMZV+rFJ7TDSv+uvPWcV0LmGfAh3+B8cg3imUTfs12y3Oat99GnlDYceZxrZoPYmDur2ak2/RIzPbaVq9d4DcJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CvIz7+4g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BB7xnW012030
	for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 11:33:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KHI0tjV5CMC6f/xhGzS9zzi6
	aRBkHdOUCa58RJ34Wr4=; b=CvIz7+4g7q7RXlT+VKFB4NFk4sS0OlPLHeRV7Jc2
	f5AcuuT1EyM+fjE4xGrdoQAIZBCtq+jXWeJXuWF/JG1NZTwF5oZymO4ZqmSvq5PK
	/UhoeP3GIz8OrPxmqFnOHc2s+56g9hpyE4t79Bf4eSlyR95wQkfloTxSeu1OmD7s
	RYEE0fXoSjijf+kJfiPJFQPJo3FMbAQ7jVOgr5pSC6W6rU+VuMV41iUym78Xf8J3
	aAbbJ72/rtYID7CRax03fbE0zG0epvGTeS9Mc63OQwZEhYUj7guu6huJ8ZY5lgPp
	NsH7xZasVdipipzzn+aVwqdLyXoANMGJ/i7LCACHYKPGhQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47sm9e0ct1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 11:33:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7dfd0a5d8a8so72624385a.1
        for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 04:33:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752233610; x=1752838410;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHI0tjV5CMC6f/xhGzS9zzi6aRBkHdOUCa58RJ34Wr4=;
        b=cpAMU/mf9ABjswU+z59mGjqvkdmkoQnBc3Fh7o0IfEd2aWf8UhG6eQtxStY9o5Yqbv
         p04aWPSFGIEIiMSt37CYaQQgmA3liiNQjcGc5bn/erDUKNnbiUyTkQORqB48C0qv0yPs
         OSPuCCuxXXvoBTD2/j+CMHq51NMqaumzVFpbszmea/FeiO6VkAyLL9dga5EkwiDz+QPd
         IwC1qqxlmGPFHmf3ZkngqPiT1MOcZ6z4PTHpt+5NhbNVxlmNwBqO/r1XBE8ax//Pcsob
         CEEeo4l4NdVfnoccmj6ctdNi/25zn4+rkWY+hFlqpgoBqTWbAUrNzMJC3Ff36LzgwKLi
         Vdvw==
X-Forwarded-Encrypted: i=1; AJvYcCXvR3VSwzMynnE8kConbxam3kOtiwMz3eD3/XcY2kuRJlTqC5Skba4RQSnNi7ILm1f7+Mix3ORAv1q8Yg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7AH/i0XvkkIl3b8ylnDjAy4RdLsmJtRkUioP5zXqRxlt9EfMq
	AN4DhWJXlJW4RbS9CHNUHIsCpH8wC4J6MZSV+aHyY1IFrS7+Ey5t2FyRYXwevGr3DQxXxR0dFb9
	b1Zmjzr7iCfDBl4orLVodSmJjihBWKtk1OuxKcfdWrVprO83WjaHEExB6jZ5VeJFo6A==
X-Gm-Gg: ASbGnctfK0CO4jANpKuub40ZDRkaWzZasEwhcWohJpkYDke8zmFygOC7iwqdxPR6WfZ
	vAJVNXGS9YH2Eq55He3uKITZ9S7Fk9OVswpl6h8yISB1zi0ctXXuDS0mmpLfZmB9S1k1Of7uoqr
	4n5M4/8uSYeYL8Zhl7VhlsMt2yEAbqIBZqjWHchmYkSBlzCsiIFZgegGmDNaDH5VC5JkxXBrjRK
	06N5YX0SXy+s+6KgUjtYvhoL+8zoSwgYvB8lSFhM0PgTkBRjexetMCkSxxxpnO6ef/gLL1RKvhR
	WTzkAU0MMH81ZGYnMrwBMfiEpca8ZCSf/r3kIN148qwG3Gt10wANAw0bBleUE2i4L0kblGDbgw8
	=
X-Received: by 2002:a05:620a:172c:b0:7d5:e3c8:b580 with SMTP id af79cd13be357-7de04fafb47mr403205385a.17.1752233610065;
        Fri, 11 Jul 2025 04:33:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXybY2FXJvGwe5+kvYDZa8EWlXkVD4DxRLu7XCO2hhPf93QL4th9Vo5HhzzGCy8uGCX3yu5Q==
X-Received: by 2002:a05:620a:172c:b0:7d5:e3c8:b580 with SMTP id af79cd13be357-7de04fafb47mr403199785a.17.1752233609418;
        Fri, 11 Jul 2025 04:33:29 -0700 (PDT)
Received: from trex (153.red-79-144-197.dynamicip.rima-tde.net. [79.144.197.153])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d5062119sm85985365e9.18.2025.07.11.04.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 04:33:28 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Fri, 11 Jul 2025 13:33:27 +0200
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>, krzk+dt@kernel.org,
        bryan.odonoghue@linaro.org, quic_vgarodia@quicinc.com,
        mchehab@kernel.org, robh@kernel.org, conor+dt@kernel.org,
        konradybcio@kernel.org, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/5] media: venus: vdec: AR50_LITE video core support
Message-ID: <aHD2h9/LqSZ4ru6K@trex>
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-3-jorge.ramirez@oss.qualcomm.com>
 <c0e8460d-1c94-d398-38a0-f63395256f27@quicinc.com>
 <aF62Msej5LvY51D6@trex>
 <8c7232a3-8c49-d77e-e8e4-6d86a33e2b42@quicinc.com>
 <aG1uINWPwvl505zG@trex>
 <55125121-5349-3b8b-2e81-29eec95d8337@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55125121-5349-3b8b-2e81-29eec95d8337@quicinc.com>
X-Proofpoint-GUID: 7Snd4JAlh8Ewj19C95qkyAQMkoBfu-BW
X-Authority-Analysis: v=2.4 cv=W7k4VQWk c=1 sm=1 tr=0 ts=6870f68b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Ki5fnJvzvo7yLsyA0quaxQ==:17
 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=yvcqnb2xCap4B2vlBTUA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 7Snd4JAlh8Ewj19C95qkyAQMkoBfu-BW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA4MSBTYWx0ZWRfX2g0oTDS9YCQC
 456FVqt+yidilQ/I7011GLV4+cUHmybdOn3TpNHYFe3kYEAbDzWcazYxGExhlepYumi3mBuyE/v
 hareOYaoqUplbyGzNPIXmv8aLgBqsmKiLHs6ajQB6j9NKX54q93Nae1FhHP7e8NNS/R0sP62617
 PunspwcUJRqvQC8ofGAnRpIjWq7/m8plputt8lnUXxpAsifZT8XsspzSG7ICLOHFkEdpLK71dF7
 BoJx4cIQrcoWsaNLg28Cs4mpcrI7fONsEcfrPmJEmM1itsVUU6WrYLimZW8LukDyOL57x1lSxqe
 PRb6tgwPDRZw1Rd6tl284DUcUdZuVhvr2L5DI4Cj9Wvp75H+rRDfYs7aHc7/EvKMNeefR36Qnkx
 L5KhELE2eIRGNxCH1kTLYtZBqCeWHfjOz4UFAVkFfxiclLC3Az8kQH2n0+5vwPGP0DURvpfs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 malwarescore=0 mlxscore=0
 adultscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110081

On 10/07/25 14:25:33, Dikshita Agarwal wrote:
> 
> 
> On 7/9/2025 12:44 AM, Jorge Ramirez wrote:
> > On 30/06/25 12:17:32, Dikshita Agarwal wrote:
> >>
> >>
> >> On 6/27/2025 8:48 PM, Jorge Ramirez wrote:
> >>> On 27/06/25 18:17:27, Dikshita Agarwal wrote:
> >>>>
> >>>>
> >>>> On 6/26/2025 7:29 PM, Jorge Ramirez-Ortiz wrote:
> >>>>> The AR50_LITE is a streamlined variant of the AR50 video core, designed
> >>>>> for power and cost-efficient platforms.
> >>>>>
> >>>>> It supports hardware-accelerated decoding of H.264, HEVC, and VP9
> >>>>> formats.
> >>>>>
> >>>>> Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> >>>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> >>>>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> >>>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> >>>>> ---
> >>>>>  drivers/media/platform/qcom/venus/core.c      | 11 ++-
> >>>>>  drivers/media/platform/qcom/venus/core.h      | 11 ++-
> >>>>>  drivers/media/platform/qcom/venus/firmware.c  |  8 +-
> >>>>>  drivers/media/platform/qcom/venus/helpers.c   | 80 +++++++++++++++++++
> >>>>>  drivers/media/platform/qcom/venus/helpers.h   |  2 +
> >>>>>  .../media/platform/qcom/venus/hfi_helper.h    | 10 ++-
> >>>>>  drivers/media/platform/qcom/venus/hfi_venus.c | 14 ++--
> >>>>>  .../media/platform/qcom/venus/pm_helpers.c    |  1 +
> >>>>>  drivers/media/platform/qcom/venus/vdec.c      | 15 ++--
> >>>>>  9 files changed, 128 insertions(+), 24 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> >>>>> index d305d74bb152..736ef53d988d 100644
> >>>>> --- a/drivers/media/platform/qcom/venus/core.c
> >>>>> +++ b/drivers/media/platform/qcom/venus/core.c
> >>>>> @@ -254,14 +254,19 @@ static int venus_enumerate_codecs(struct venus_core *core, u32 type)
> >>>>>  
> >>>>>  static void venus_assign_register_offsets(struct venus_core *core)
> >>>>>  {
> >>>>> -	if (IS_IRIS2(core) || IS_IRIS2_1(core)) {
> >>>>> -		core->vbif_base = core->base + VBIF_BASE;
> >>>>> +	if (IS_IRIS2(core) || IS_IRIS2_1(core) || IS_AR50_LITE(core)) {
> >>>>>  		core->cpu_base = core->base + CPU_BASE_V6;
> >>>>>  		core->cpu_cs_base = core->base + CPU_CS_BASE_V6;
> >>>>>  		core->cpu_ic_base = core->base + CPU_IC_BASE_V6;
> >>>>>  		core->wrapper_base = core->base + WRAPPER_BASE_V6;
> >>>>>  		core->wrapper_tz_base = core->base + WRAPPER_TZ_BASE_V6;
> >>>>> -		core->aon_base = core->base + AON_BASE_V6;
> >>>>> +		if (IS_AR50_LITE(core)) {
> >>>>> +			core->vbif_base = NULL;
> >>>>> +			core->aon_base = NULL;
> >>>>> +		} else {
> >>>>> +			core->vbif_base = core->base + VBIF_BASE;
> >>>>> +			core->aon_base = core->base + AON_BASE_V6;
> >>>>> +		}
> >>>>>  	} else {
> >>>>>  		core->vbif_base = core->base + VBIF_BASE;
> >>>>>  		core->cpu_base = core->base + CPU_BASE;
> >>>>> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> >>>>> index b412e0c5515a..e755a28e919b 100644
> >>>>> --- a/drivers/media/platform/qcom/venus/core.h
> >>>>> +++ b/drivers/media/platform/qcom/venus/core.h
> >>>>> @@ -382,6 +382,7 @@ enum venus_inst_modes {
> >>>>>   * @lock:	instance lock
> >>>>>   * @core:	a reference to the core struct
> >>>>>   * @clk_data:	clock data per core ID
> >>>>> + * @eosbufs:	a lit of EOS buffers
> >>>>>   * @dpbbufs:	a list of decoded picture buffers
> >>>>>   * @internalbufs:	a list of internal bufferes
> >>>>>   * @registeredbufs:	a list of registered capture bufferes
> >>>>> @@ -450,6 +451,7 @@ struct venus_inst {
> >>>>>  	struct mutex lock;
> >>>>>  	struct venus_core *core;
> >>>>>  	struct clock_data clk_data;
> >>>>> +	struct list_head eosbufs;
> >>>>>  	struct list_head dpbbufs;
> >>>>>  	struct list_head internalbufs;
> >>>>>  	struct list_head registeredbufs;
> >>>>> @@ -520,7 +522,14 @@ struct venus_inst {
> >>>>>  #define IS_V1(core)	((core)->res->hfi_version == HFI_VERSION_1XX)
> >>>>>  #define IS_V3(core)	((core)->res->hfi_version == HFI_VERSION_3XX)
> >>>>>  #define IS_V4(core)	((core)->res->hfi_version == HFI_VERSION_4XX)
> >>>>> -#define IS_V6(core)	((core)->res->hfi_version == HFI_VERSION_6XX)
> >>>>> +static inline bool IS_V6(struct venus_core *core)
> >>>>> +{
> >>>>> +	if (WARN_ON_ONCE(!core))
> >>>>> +		return false;
> >>>>> +
> >>>>> +	return core->res->hfi_version == HFI_VERSION_6XX ||
> >>>>> +	       core->res->hfi_version == HFI_VERSION_6XX_LITE;
> >>>>> +}
> >>>> It should be HFI_VERSION_4XX_LITE for AR50_LITE. 4XX represents SC7280 and
> >>>> SDM845 which are AR50.
> >>>
> >>> ah good information - where is this documented? I never found this
> >>> information... I'd appreciate if you could confirm with some document
> >>> for future reference.
> >>>
> >>>>>  
> >>>>>  #define IS_AR50(core)		((core)->res->vpu_version == VPU_VERSION_AR50)
> >>>>>  #define IS_AR50_LITE(core)	((core)->res->vpu_version == VPU_VERSION_AR50_LITE)
> >>>>> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> >>>>> index 66a18830e66d..f8dcef0426ac 100644
> >>>>> --- a/drivers/media/platform/qcom/venus/firmware.c
> >>>>> +++ b/drivers/media/platform/qcom/venus/firmware.c
> >>>>> @@ -30,7 +30,7 @@ static void venus_reset_cpu(struct venus_core *core)
> >>>>>  	u32 fw_size = core->fw.mapped_mem_size;
> >>>>>  	void __iomem *wrapper_base;
> >>>>>  
> >>>>> -	if (IS_IRIS2_1(core))
> >>>>> +	if (IS_IRIS2_1(core) || IS_AR50_LITE(core))
> >>>>>  		wrapper_base = core->wrapper_tz_base;
> >>>>>  	else
> >>>>>  		wrapper_base = core->wrapper_base;
> >>>>> @@ -42,7 +42,7 @@ static void venus_reset_cpu(struct venus_core *core)
> >>>>>  	writel(fw_size, wrapper_base + WRAPPER_NONPIX_START_ADDR);
> >>>>>  	writel(fw_size, wrapper_base + WRAPPER_NONPIX_END_ADDR);
> >>>>>  
> >>>>> -	if (IS_IRIS2_1(core)) {
> >>>>> +	if (IS_IRIS2_1(core) || IS_AR50_LITE(core)) {
> >>>>>  		/* Bring XTSS out of reset */
> >>>>>  		writel(0, wrapper_base + WRAPPER_TZ_XTSS_SW_RESET);
> >>>>>  	} else {
> >>>>> @@ -68,7 +68,7 @@ int venus_set_hw_state(struct venus_core *core, bool resume)
> >>>>>  	if (resume) {
> >>>>>  		venus_reset_cpu(core);
> >>>>>  	} else {
> >>>>> -		if (IS_IRIS2_1(core))
> >>>>> +		if (IS_IRIS2_1(core) || IS_AR50_LITE(core))
> >>>>>  			writel(WRAPPER_XTSS_SW_RESET_BIT,
> >>>>>  			       core->wrapper_tz_base + WRAPPER_TZ_XTSS_SW_RESET);
> >>>>>  		else
> >>>>> @@ -181,7 +181,7 @@ static int venus_shutdown_no_tz(struct venus_core *core)
> >>>>>  	void __iomem *wrapper_base = core->wrapper_base;
> >>>>>  	void __iomem *wrapper_tz_base = core->wrapper_tz_base;
> >>>>>  
> >>>>> -	if (IS_IRIS2_1(core)) {
> >>>>> +	if (IS_IRIS2_1(core) || IS_AR50_LITE(core)) {
> >>>>>  		/* Assert the reset to XTSS */
> >>>>>  		reg = readl(wrapper_tz_base + WRAPPER_TZ_XTSS_SW_RESET);
> >>>> No need to handle no-tz case. Pls drop.
> >>>
> >>> ok
> >>>
> >>>>>  		reg |= WRAPPER_XTSS_SW_RESET_BIT;
> >>>>> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> >>>>> index 8295542e1a7c..812bec9a05be 100644
> >>>>> --- a/drivers/media/platform/qcom/venus/helpers.c
> >>>>> +++ b/drivers/media/platform/qcom/venus/helpers.c
> >>>>> @@ -230,6 +230,79 @@ int venus_helper_alloc_dpb_bufs(struct venus_inst *inst)
> >>>>>  }
> >>>>>  EXPORT_SYMBOL_GPL(venus_helper_alloc_dpb_bufs);
> >>>>>  
> >>>>> +static void free_eos_buf(struct venus_inst *inst, struct intbuf *buf)
> >>>>> +{
> >>>>> +	list_del_init(&buf->list);
> >>>>> +	dma_free_attrs(inst->core->dev, buf->size, buf->va, buf->da,
> >>>>> +		       buf->attrs);
> >>>>> +	kfree(buf);
> >>>>> +}
> >>>>> +
> >>>>> +int venus_helper_free_eos_bufs(struct venus_inst *inst)
> >>>>> +{
> >>>>> +	struct intbuf *buf, *n;
> >>>>> +
> >>>>> +	list_for_each_entry_safe(buf, n, &inst->eosbufs, list) {
> >>>>> +		free_eos_buf(inst, buf);
> >>>>> +	}
> >>>>> +
> >>>>> +	if (list_empty(&inst->eosbufs))
> >>>>> +		INIT_LIST_HEAD(&inst->eosbufs);
> >>>>> +
> >>>>> +	return 0;
> >>>>> +}
> >>>>> +EXPORT_SYMBOL_GPL(venus_helper_free_eos_bufs);
> >>>>> +
> >>>>> +int venus_helper_alloc_eos_buf(struct venus_inst *inst,
> >>>>> +			       struct hfi_frame_data *data)
> >>>>> +{
> >>>>> +	struct venus_core *core = inst->core;
> >>>>> +	struct device *dev = core->dev;
> >>>>> +	struct intbuf *buf;
> >>>>> +	int ret = 0;
> >>>>> +
> >>>>> +	memset(data, 0, sizeof(*data));
> >>>>> +
> >>>>> +	data->buffer_type = HFI_BUFFER_INPUT;
> >>>>> +	data->flags = HFI_BUFFERFLAG_EOS;
> >>>>> +
> >>>>> +	if (IS_AR50_LITE(inst->core)) {
> >>>>> +		/* We must send valid sizes and addresses */
> >>>>> +		buf = kzalloc(sizeof(*buf), GFP_KERNEL);
> >>>>> +		if (!buf) {
> >>>>> +			ret = -ENOMEM;
> >>>>> +			goto fail;
> >>>>> +		}
> >>>>> +
> >>>>> +		buf->type = HFI_BUFFER_INPUT;
> >>>>> +		buf->size = SZ_4K;
> >>>>> +		buf->attrs = DMA_ATTR_NO_KERNEL_MAPPING;
> >>>>> +		buf->va = dma_alloc_attrs(dev, buf->size, &buf->da, GFP_KERNEL,
> >>>>> +					  buf->attrs);
> >>>>> +		if (!buf->va) {
> >>>>> +			ret = -ENOMEM;
> >>>>> +			goto fail;
> >>>>> +		}
> >>>>> +
> >>>>> +		list_add_tail(&buf->list, &inst->eosbufs);
> >>>>> +
> >>>>> +		data->alloc_len = buf->size;
> >>>>> +		data->device_addr = buf->da;
> >>>>> +
> >>>> why this special handling for eos buffer is needed for AR50_LITE?
> >>>
> >>> this _fix_ was develope through testing: without it there is no EOS and
> >>> errors are reporting upon killing the player
> >>>
> >> Would be better to see why there is no EOS from firmware,
> >> there shouldn't be the need to have a dma allocation for this dummy
> >> buffers, as there is no useful info in the buffer. Having the device
> >> address as 0 or 0xdeadb000 should be enough.
> >>
> > 
> > hi dikshita,
> > 
> > I am still keeping this on v6 as per our internal discussions and
> > because v6 is quite different from v5 so wanted to provide early access
> > to users.
> > 
> > if the firwmare is fixed to address this issue on time, I might revert
> > the EOS page buffer. 
> > 
> I'd prefer to resolve this via correct EOS handling or gain clarity on why
> AR50_LITE requires special treatment, instead of proceeding with new patch
> sets built around this design.
>
Fully agree.

However this patch is the actual proper implementation - it follows the
HFI spec - while the current code upstream is not.

We should revert over time the current implementation to avoid hitting
issues when the firmware stops checking for things like 0xdeadb000.


