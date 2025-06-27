Return-Path: <linux-media+bounces-36108-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D75CAEBBA5
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 17:26:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D0DAE7B1B9A
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 15:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 595E42E9EB3;
	Fri, 27 Jun 2025 15:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G9ppgmZW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72B62E8DFC
	for <linux-media@vger.kernel.org>; Fri, 27 Jun 2025 15:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751037969; cv=none; b=GsMDf66xvFIFO4OIaqSkU1X6xGI4PZW3mgafAZUwR31iimwS+dllJqka5PiOGKa/T1wC6Pqz4rFPeycPVnvRlhGi1CUjIev5kwG/uPAL4vuu2tz7AzrtZY09tH7xq26/xN9PnhmCJQMM4xReE1fp6TGCpxqX0C4RXhVB99BkO+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751037969; c=relaxed/simple;
	bh=taoSPky+guart2ZjtUwJOtqHpWtE0mRQE4yUix56uCg=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lhsg1ikTM0uTZV4dAMn/kbv4+qAWnV3BDrjm5z5tyKkvmiPPpM4/EuxOGbrWmpTEJG4yJzZ29F+R+Kai+qyvUIqk/Jugky4wK5PIYzIRS6NZ192ETj0YVMfu6Ysib64/zRiEpoP6abiHNsiTNQfIYwsaPUTAVXWAuF18v/OFC3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G9ppgmZW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RBgsNB014540
	for <linux-media@vger.kernel.org>; Fri, 27 Jun 2025 15:26:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1/mfnkq0rkWoaLc1sY0wCwrm
	qzPtDr53rpM64BpF2JE=; b=G9ppgmZW6qAiAZxiueFUFjjH1EKFJ5+yDcI9y14x
	vJ9ccdkFBSXMpHowCAO8/He5EYPHueSOc5tLJ5JIvBa4I+4uX6ejl9CvMT8lRlnz
	k5wQatPNqXmOVWMvofbahedwSmeEyFFOgr1gshMSjsSJR2AFHOap7BQn6lTCih/b
	X6SamYrLo/Iwp6XVETHNJWWuz+ksVD0F46FvK0IIMEdePAZ45aRDbucgm7XH7+jc
	hdzmkrydVUjjB2wGVAMda9xe2oVZNri6HiWyfqRk66c0t1a9loQn89NVjhttsOzC
	vmxpy0ePFCpvYOLvGDWchOqBHJZOf9TYllPql46pKzEf2w==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcn1350-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Jun 2025 15:26:06 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-60f3442c58cso2177743eaf.0
        for <linux-media@vger.kernel.org>; Fri, 27 Jun 2025 08:26:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751037965; x=1751642765;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1/mfnkq0rkWoaLc1sY0wCwrmqzPtDr53rpM64BpF2JE=;
        b=iRvLZ3jLa2Ac2Pbwty+bhRJ89udzbrCTI0MsbqdKQXPDF9B8HyP1KBkfETDo8VfNuH
         07exGdew4/VkbMxm8xMXDDdYi4B4v9Sf11MXxuRBqxxMB4dTRwbc3DE7LG36EJlBT95R
         EpUscbMRe0KhPWk9c4At83RE2GKWmKq38F0FTgNzcnzIHlptVxoYW+NpqYJAQdHWYSSy
         u4Z4M/cZQzPNAtcOU5QX7Q3+gc5W63eJVcGzL9VtnF+X5OiVI5XIm1dL7JWNwbaFqeht
         ncqPYu//uo1Y/lweZL453fKm3VIC0AEV3zl7pchqFlXy1B3oLoYSwK39hD6FagLLoc+v
         UCFg==
X-Forwarded-Encrypted: i=1; AJvYcCW/f/dbEAvGyvPIx1Lgc7Nt0rl0Fd3+tFiAqfzD7NuqUiHE2kp3qlefKhoPnAQMVcPkG6A7X6W8o7pTfw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/hGsIeL9glAuYDumA7ZT46MyQF4VKMM+cc82FqSG82BllxInW
	zHn0oZoD0TiXqR72btAguJr48ERP4Q6enSz5pxct7800p1EXqwfWmhsyffLXVmLyeTgE5qksKMo
	R16MQwJ603WQOhYyxiLZ97dgbn2B1EVrvegc3phliy6A03LWJ1hu7BQEKHm7RjNBJth7jYLtsaw
	==
X-Gm-Gg: ASbGncsLPKu+gbHt+0KPm9QnONpgxOHsg1duENVFvvO/vqJflh2cFYqZ10N23YrbvO+
	vO17SQASO1oPNpG/bclr3LifKjbd3Mhv9ax49e57jRhGsToz0WYahfgbAKLHg9uP95AZNctAR6N
	Evs7WsiKMf6aezoSDFTJGKPLJddMQ5q1wxPh38JaMwkggD24JEfVAB14kZE2TaKQNsxpGRKlrhL
	9J7U0KFtQ0V/Dkzv3SnoAOjxi7uu+hmi6qIBU4+rQtWRK3XaqF9DuDsVKeW/C19Lql4wVdMYXuy
	WYitKJKp+O4xpvEmXMJWjESa+guNotMLxutYllTomKsenlXTASgxdP0Eng==
X-Received: by 2002:a05:6870:4f0c:b0:2d4:ce45:6983 with SMTP id 586e51a60fabf-2efed4c2c78mr2272934fac.10.1751037965434;
        Fri, 27 Jun 2025 08:26:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHlmyoHSo41lE1BEkyGuEOBXXTMe3ltedij0Hgalu4rxLM+56fiHgXghK8vx1ZfqZlWoP5qA==
X-Received: by 2002:a05:620a:2b96:b0:7c7:a5c9:d109 with SMTP id af79cd13be357-7d443a0d4dbmr478140585a.50.1751037492817;
        Fri, 27 Jun 2025 08:18:12 -0700 (PDT)
Received: from trex (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52bd5sm2974073f8f.59.2025.06.27.08.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 08:18:12 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Fri, 27 Jun 2025 17:18:10 +0200
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, krzk+dt@kernel.org,
        bryan.odonoghue@linaro.org, quic_vgarodia@quicinc.com,
        mchehab@kernel.org, robh@kernel.org, conor+dt@kernel.org,
        konradybcio@kernel.org, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/5] media: venus: vdec: AR50_LITE video core support
Message-ID: <aF62Msej5LvY51D6@trex>
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-3-jorge.ramirez@oss.qualcomm.com>
 <c0e8460d-1c94-d398-38a0-f63395256f27@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0e8460d-1c94-d398-38a0-f63395256f27@quicinc.com>
X-Proofpoint-GUID: bxNUIpnbMqzDKkFyc6d-ZlZyEmt4DzAR
X-Proofpoint-ORIG-GUID: bxNUIpnbMqzDKkFyc6d-ZlZyEmt4DzAR
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=685eb80e cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=N0dErutTcvIHiEIC11gA:9 a=CjuIK1q_8ugA:10 a=WZGXeFmKUf7gPmL3hEjn:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyNSBTYWx0ZWRfXzHQPP997eKsb
 VfKG82hbt8qRXEToTy76zNRORY+niEteZU7cGOlqovHOuBavt7iLb47UZDJqi/GGAGSebr9pVae
 UU9Hw0rs9Tdjr0e+kVRXZAxBYaBPO0f3vRkMaMqobXshxdGcomnPSY/wBn7Yj5a1A4TK/wrjZAW
 qeubGX6X7mYwvipoeDbbMKhAiqL0rohb7joVY97ylOxgA+JkKK0sKwW7oqucvd81zCa44g+b7TW
 uX1mhYqxLvfPnv3sttemsfw3SfOjNvD3G0Hyvv4BJHZtXCacMs4dYkls9EoRo9VqksWzX3llfi/
 XiIkWmhyOiEE6snhJD/wH4EvjXhtlwQysPnB68z49xQ1oWVetoSmfhGg1jZl4P8YUHO7NkxqAcH
 hTB22WBaKOl15+MOVkOspXpCjt8YjPc037QakDf9qrW46PzuwrVv8QUjPJvizfWRTUWHJ+JU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270125

On 27/06/25 18:17:27, Dikshita Agarwal wrote:
> 
> 
> On 6/26/2025 7:29 PM, Jorge Ramirez-Ortiz wrote:
> > The AR50_LITE is a streamlined variant of the AR50 video core, designed
> > for power and cost-efficient platforms.
> > 
> > It supports hardware-accelerated decoding of H.264, HEVC, and VP9
> > formats.
> > 
> > Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > ---
> >  drivers/media/platform/qcom/venus/core.c      | 11 ++-
> >  drivers/media/platform/qcom/venus/core.h      | 11 ++-
> >  drivers/media/platform/qcom/venus/firmware.c  |  8 +-
> >  drivers/media/platform/qcom/venus/helpers.c   | 80 +++++++++++++++++++
> >  drivers/media/platform/qcom/venus/helpers.h   |  2 +
> >  .../media/platform/qcom/venus/hfi_helper.h    | 10 ++-
> >  drivers/media/platform/qcom/venus/hfi_venus.c | 14 ++--
> >  .../media/platform/qcom/venus/pm_helpers.c    |  1 +
> >  drivers/media/platform/qcom/venus/vdec.c      | 15 ++--
> >  9 files changed, 128 insertions(+), 24 deletions(-)
> > 
> > diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> > index d305d74bb152..736ef53d988d 100644
> > --- a/drivers/media/platform/qcom/venus/core.c
> > +++ b/drivers/media/platform/qcom/venus/core.c
> > @@ -254,14 +254,19 @@ static int venus_enumerate_codecs(struct venus_core *core, u32 type)
> >  
> >  static void venus_assign_register_offsets(struct venus_core *core)
> >  {
> > -	if (IS_IRIS2(core) || IS_IRIS2_1(core)) {
> > -		core->vbif_base = core->base + VBIF_BASE;
> > +	if (IS_IRIS2(core) || IS_IRIS2_1(core) || IS_AR50_LITE(core)) {
> >  		core->cpu_base = core->base + CPU_BASE_V6;
> >  		core->cpu_cs_base = core->base + CPU_CS_BASE_V6;
> >  		core->cpu_ic_base = core->base + CPU_IC_BASE_V6;
> >  		core->wrapper_base = core->base + WRAPPER_BASE_V6;
> >  		core->wrapper_tz_base = core->base + WRAPPER_TZ_BASE_V6;
> > -		core->aon_base = core->base + AON_BASE_V6;
> > +		if (IS_AR50_LITE(core)) {
> > +			core->vbif_base = NULL;
> > +			core->aon_base = NULL;
> > +		} else {
> > +			core->vbif_base = core->base + VBIF_BASE;
> > +			core->aon_base = core->base + AON_BASE_V6;
> > +		}
> >  	} else {
> >  		core->vbif_base = core->base + VBIF_BASE;
> >  		core->cpu_base = core->base + CPU_BASE;
> > diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> > index b412e0c5515a..e755a28e919b 100644
> > --- a/drivers/media/platform/qcom/venus/core.h
> > +++ b/drivers/media/platform/qcom/venus/core.h
> > @@ -382,6 +382,7 @@ enum venus_inst_modes {
> >   * @lock:	instance lock
> >   * @core:	a reference to the core struct
> >   * @clk_data:	clock data per core ID
> > + * @eosbufs:	a lit of EOS buffers
> >   * @dpbbufs:	a list of decoded picture buffers
> >   * @internalbufs:	a list of internal bufferes
> >   * @registeredbufs:	a list of registered capture bufferes
> > @@ -450,6 +451,7 @@ struct venus_inst {
> >  	struct mutex lock;
> >  	struct venus_core *core;
> >  	struct clock_data clk_data;
> > +	struct list_head eosbufs;
> >  	struct list_head dpbbufs;
> >  	struct list_head internalbufs;
> >  	struct list_head registeredbufs;
> > @@ -520,7 +522,14 @@ struct venus_inst {
> >  #define IS_V1(core)	((core)->res->hfi_version == HFI_VERSION_1XX)
> >  #define IS_V3(core)	((core)->res->hfi_version == HFI_VERSION_3XX)
> >  #define IS_V4(core)	((core)->res->hfi_version == HFI_VERSION_4XX)
> > -#define IS_V6(core)	((core)->res->hfi_version == HFI_VERSION_6XX)
> > +static inline bool IS_V6(struct venus_core *core)
> > +{
> > +	if (WARN_ON_ONCE(!core))
> > +		return false;
> > +
> > +	return core->res->hfi_version == HFI_VERSION_6XX ||
> > +	       core->res->hfi_version == HFI_VERSION_6XX_LITE;
> > +}
> It should be HFI_VERSION_4XX_LITE for AR50_LITE. 4XX represents SC7280 and
> SDM845 which are AR50.

ah good information - where is this documented? I never found this
information... I'd appreciate if you could confirm with some document
for future reference.

> >  
> >  #define IS_AR50(core)		((core)->res->vpu_version == VPU_VERSION_AR50)
> >  #define IS_AR50_LITE(core)	((core)->res->vpu_version == VPU_VERSION_AR50_LITE)
> > diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> > index 66a18830e66d..f8dcef0426ac 100644
> > --- a/drivers/media/platform/qcom/venus/firmware.c
> > +++ b/drivers/media/platform/qcom/venus/firmware.c
> > @@ -30,7 +30,7 @@ static void venus_reset_cpu(struct venus_core *core)
> >  	u32 fw_size = core->fw.mapped_mem_size;
> >  	void __iomem *wrapper_base;
> >  
> > -	if (IS_IRIS2_1(core))
> > +	if (IS_IRIS2_1(core) || IS_AR50_LITE(core))
> >  		wrapper_base = core->wrapper_tz_base;
> >  	else
> >  		wrapper_base = core->wrapper_base;
> > @@ -42,7 +42,7 @@ static void venus_reset_cpu(struct venus_core *core)
> >  	writel(fw_size, wrapper_base + WRAPPER_NONPIX_START_ADDR);
> >  	writel(fw_size, wrapper_base + WRAPPER_NONPIX_END_ADDR);
> >  
> > -	if (IS_IRIS2_1(core)) {
> > +	if (IS_IRIS2_1(core) || IS_AR50_LITE(core)) {
> >  		/* Bring XTSS out of reset */
> >  		writel(0, wrapper_base + WRAPPER_TZ_XTSS_SW_RESET);
> >  	} else {
> > @@ -68,7 +68,7 @@ int venus_set_hw_state(struct venus_core *core, bool resume)
> >  	if (resume) {
> >  		venus_reset_cpu(core);
> >  	} else {
> > -		if (IS_IRIS2_1(core))
> > +		if (IS_IRIS2_1(core) || IS_AR50_LITE(core))
> >  			writel(WRAPPER_XTSS_SW_RESET_BIT,
> >  			       core->wrapper_tz_base + WRAPPER_TZ_XTSS_SW_RESET);
> >  		else
> > @@ -181,7 +181,7 @@ static int venus_shutdown_no_tz(struct venus_core *core)
> >  	void __iomem *wrapper_base = core->wrapper_base;
> >  	void __iomem *wrapper_tz_base = core->wrapper_tz_base;
> >  
> > -	if (IS_IRIS2_1(core)) {
> > +	if (IS_IRIS2_1(core) || IS_AR50_LITE(core)) {
> >  		/* Assert the reset to XTSS */
> >  		reg = readl(wrapper_tz_base + WRAPPER_TZ_XTSS_SW_RESET);
> No need to handle no-tz case. Pls drop.

ok

> >  		reg |= WRAPPER_XTSS_SW_RESET_BIT;
> > diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> > index 8295542e1a7c..812bec9a05be 100644
> > --- a/drivers/media/platform/qcom/venus/helpers.c
> > +++ b/drivers/media/platform/qcom/venus/helpers.c
> > @@ -230,6 +230,79 @@ int venus_helper_alloc_dpb_bufs(struct venus_inst *inst)
> >  }
> >  EXPORT_SYMBOL_GPL(venus_helper_alloc_dpb_bufs);
> >  
> > +static void free_eos_buf(struct venus_inst *inst, struct intbuf *buf)
> > +{
> > +	list_del_init(&buf->list);
> > +	dma_free_attrs(inst->core->dev, buf->size, buf->va, buf->da,
> > +		       buf->attrs);
> > +	kfree(buf);
> > +}
> > +
> > +int venus_helper_free_eos_bufs(struct venus_inst *inst)
> > +{
> > +	struct intbuf *buf, *n;
> > +
> > +	list_for_each_entry_safe(buf, n, &inst->eosbufs, list) {
> > +		free_eos_buf(inst, buf);
> > +	}
> > +
> > +	if (list_empty(&inst->eosbufs))
> > +		INIT_LIST_HEAD(&inst->eosbufs);
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(venus_helper_free_eos_bufs);
> > +
> > +int venus_helper_alloc_eos_buf(struct venus_inst *inst,
> > +			       struct hfi_frame_data *data)
> > +{
> > +	struct venus_core *core = inst->core;
> > +	struct device *dev = core->dev;
> > +	struct intbuf *buf;
> > +	int ret = 0;
> > +
> > +	memset(data, 0, sizeof(*data));
> > +
> > +	data->buffer_type = HFI_BUFFER_INPUT;
> > +	data->flags = HFI_BUFFERFLAG_EOS;
> > +
> > +	if (IS_AR50_LITE(inst->core)) {
> > +		/* We must send valid sizes and addresses */
> > +		buf = kzalloc(sizeof(*buf), GFP_KERNEL);
> > +		if (!buf) {
> > +			ret = -ENOMEM;
> > +			goto fail;
> > +		}
> > +
> > +		buf->type = HFI_BUFFER_INPUT;
> > +		buf->size = SZ_4K;
> > +		buf->attrs = DMA_ATTR_NO_KERNEL_MAPPING;
> > +		buf->va = dma_alloc_attrs(dev, buf->size, &buf->da, GFP_KERNEL,
> > +					  buf->attrs);
> > +		if (!buf->va) {
> > +			ret = -ENOMEM;
> > +			goto fail;
> > +		}
> > +
> > +		list_add_tail(&buf->list, &inst->eosbufs);
> > +
> > +		data->alloc_len = buf->size;
> > +		data->device_addr = buf->da;
> > +
> why this special handling for eos buffer is needed for AR50_LITE?

this _fix_ was develope through testing: without it there is no EOS and
errors are reporting upon killing the player


> > +	} else if (IS_V6(inst->core) &&
> > +		   is_fw_rev_or_older(inst->core, 1, 0, 87)) {
> > +		data->device_addr = 0;
> > +	} else {
> > +		data->device_addr = 0xdeadb000;
> > +	}
> > +
> > +	return 0;
> > +fail:
> > +	kfree(buf);
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(venus_helper_alloc_eos_buf);
> > +
> >  static int intbufs_set_buffer(struct venus_inst *inst, u32 type)
> >  {
> >  	struct venus_core *core = inst->core;
> > @@ -630,6 +703,13 @@ static int platform_get_bufreq(struct venus_inst *inst, u32 buftype,
> >  	if (!hfi_plat || !hfi_plat->bufreq)
> >  		return -EINVAL;
> >  
> > +	/* Firmware buffer requirements for internal buffers only */
> > +	if (IS_AR50_LITE(inst->core))
> > +		if (buftype != HFI_BUFFER_INPUT &&
> > +		    buftype != HFI_BUFFER_OUTPUT &&
> > +		    buftype != HFI_BUFFER_OUTPUT2)
> > +			return -EINVAL;
> > +
> why this check is needed here? Buffer requirements for all buffer types
> should come from firmware for all V4 based targets.

because I used V6 as you saw earlier.

> >  	params.version = version;
> >  	params.num_vpp_pipes = inst->core->res->num_vpp_pipes;
> >  
> > diff --git a/drivers/media/platform/qcom/venus/helpers.h b/drivers/media/platform/qcom/venus/helpers.h
> > index 358e4f39c9c0..bf55fe3b8747 100644
> > --- a/drivers/media/platform/qcom/venus/helpers.h
> > +++ b/drivers/media/platform/qcom/venus/helpers.h
> > @@ -58,6 +58,8 @@ int venus_helper_get_out_fmts(struct venus_inst *inst, u32 fmt, u32 *out_fmt,
> >  bool venus_helper_check_format(struct venus_inst *inst, u32 v4l2_pixfmt);
> >  int venus_helper_alloc_dpb_bufs(struct venus_inst *inst);
> >  int venus_helper_free_dpb_bufs(struct venus_inst *inst);
> > +int venus_helper_alloc_eos_buf(struct venus_inst *inst, struct hfi_frame_data *data);
> > +int venus_helper_free_eos_bufs(struct venus_inst *inst);
> >  int venus_helper_intbufs_alloc(struct venus_inst *inst);
> >  int venus_helper_intbufs_free(struct venus_inst *inst);
> >  int venus_helper_intbufs_realloc(struct venus_inst *inst);
> > diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
> > index f44059f19505..128ddf8e3cd5 100644
> > --- a/drivers/media/platform/qcom/venus/hfi_helper.h
> > +++ b/drivers/media/platform/qcom/venus/hfi_helper.h
> > @@ -397,13 +397,16 @@
> >  #define HFI_BUFFER_INTERNAL_PERSIST_1		0x5
> >  #define HFI_BUFFER_INTERNAL_SCRATCH(ver)	\
> >  	(((ver) == HFI_VERSION_4XX ||		\
> > -	(ver) == HFI_VERSION_6XX) ? 0x6 : 0x1000001)
> > +	(ver) == HFI_VERSION_6XX || (ver) == HFI_VERSION_6XX_LITE) \
> > +	? 0x6 : 0x1000001)
> >  #define HFI_BUFFER_INTERNAL_SCRATCH_1(ver)	\
> >  	(((ver) == HFI_VERSION_4XX ||		\
> > -	(ver) == HFI_VERSION_6XX) ? 0x7 : 0x1000005)
> > +	(ver) == HFI_VERSION_6XX || (ver) == HFI_VERSION_6XX_LITE) \
> > +	? 0x7 : 0x1000005)
> >  #define HFI_BUFFER_INTERNAL_SCRATCH_2(ver)	\
> >  	(((ver) == HFI_VERSION_4XX ||		\
> > -	(ver) == HFI_VERSION_6XX) ? 0x8 : 0x1000006)
> > +	(ver) == HFI_VERSION_6XX || (ver) == HFI_VERSION_6XX_LITE) \
> > +	? 0x8 : 0x1000006)
> >  #define HFI_BUFFER_EXTRADATA_INPUT(ver)		\
> >  	(((ver) == HFI_VERSION_4XX) ? 0xc : 0x1000002)
> >  #define HFI_BUFFER_EXTRADATA_OUTPUT(ver)	\
> > @@ -561,6 +564,7 @@ enum hfi_version {
> >  	HFI_VERSION_3XX,
> >  	HFI_VERSION_4XX,
> >  	HFI_VERSION_6XX,
> > +	HFI_VERSION_6XX_LITE,
> s/HFI_VERSION_6XX_LITE/HFI_VERSION_4XX_LITE.
> update all applicable places.

sure, I'll validate that - I remember starting with V4 but it didnt
work so switched to 6xx. I'll try again.


> >  };
> >  
> >  struct hfi_buffer_info {
> > diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
> > index b5f2ea879950..302776bf8fe6 100644
> > --- a/drivers/media/platform/qcom/venus/hfi_venus.c
> > +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
> > @@ -497,7 +497,7 @@ static int venus_boot_core(struct venus_hfi_device *hdev)
> >  	if (count >= max_tries)
> >  		ret = -ETIMEDOUT;
> >  
> > -	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core)) {
> > +	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core) || IS_AR50_LITE(hdev->core)) {
> >  		writel(0x1, cpu_cs_base + CPU_CS_H2XSOFTINTEN_V6);
> >  		writel(0x0, cpu_cs_base + CPU_CS_X2RPMH_V6);
> CPU_CS_X2RPMH_V6 is not needed for AR50_LITE, pls drop.
> >  	}
> > @@ -565,6 +565,9 @@ static int venus_halt_axi(struct venus_hfi_device *hdev)
> >  	u32 mask_val;
> >  	int ret;
> >  
> > +	if (IS_AR50_LITE(hdev->core))
> > +		return 0;
> > +
> >  	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core)) {
> >  		writel(0x3, cpu_cs_base + CPU_CS_X2RPMH_V6);
> >  
> > @@ -1134,7 +1137,8 @@ static irqreturn_t venus_isr(struct venus_core *core)
> >  	wrapper_base = hdev->core->wrapper_base;
> >  
> >  	status = readl(wrapper_base + WRAPPER_INTR_STATUS);
> > -	if (IS_IRIS2(core) || IS_IRIS2_1(core)) {
> > +
> > +	if (IS_IRIS2(core) || IS_IRIS2_1(core) || IS_AR50_LITE(core)) {
> >  		if (status & WRAPPER_INTR_STATUS_A2H_MASK ||
> >  		    status & WRAPPER_INTR_STATUS_A2HWD_MASK_V6 ||
> WD mask is incorrect, pls fix.
> >  		    status & CPU_CS_SCIACMDARG0_INIT_IDLE_MSG_MASK)
> > @@ -1146,7 +1150,7 @@ static irqreturn_t venus_isr(struct venus_core *core)
> >  			hdev->irq_status = status;
> >  	}
> >  	writel(1, cpu_cs_base + CPU_CS_A2HSOFTINTCLR);
> > -	if (!(IS_IRIS2(core) || IS_IRIS2_1(core)))
> > +	if (!(IS_IRIS2(core) || IS_IRIS2_1(core) || IS_AR50_LITE(core)))
> >  		writel(status, wrapper_base + WRAPPER_INTR_CLEAR);
> >  
> >  	return IRQ_WAKE_THREAD;
> > @@ -1531,7 +1535,7 @@ static bool venus_cpu_and_video_core_idle(struct venus_hfi_device *hdev)
> >  	void __iomem *cpu_cs_base = hdev->core->cpu_cs_base;
> >  	u32 ctrl_status, cpu_status;
> >  
> > -	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core))
> > +	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core) || IS_AR50_LITE(hdev->core))
> >  		cpu_status = readl(wrapper_tz_base + WRAPPER_TZ_CPU_STATUS_V6);
> >  	else
> >  		cpu_status = readl(wrapper_base + WRAPPER_CPU_STATUS);
> > @@ -1551,7 +1555,7 @@ static bool venus_cpu_idle_and_pc_ready(struct venus_hfi_device *hdev)
> >  	void __iomem *cpu_cs_base = hdev->core->cpu_cs_base;
> >  	u32 ctrl_status, cpu_status;
> >  
> > -	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core))
> > +	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core) || IS_AR50_LITE(hdev->core))
> >  		cpu_status = readl(wrapper_tz_base + WRAPPER_TZ_CPU_STATUS_V6);
> >  	else
> >  		cpu_status = readl(wrapper_base + WRAPPER_CPU_STATUS);
> > diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
> > index 409aa9bd0b5d..5d9dfe3fd043 100644
> > --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> > +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
> > @@ -1168,6 +1168,7 @@ const struct venus_pm_ops *venus_pm_get(enum hfi_version version)
> >  		return &pm_ops_v3;
> >  	case HFI_VERSION_4XX:
> >  	case HFI_VERSION_6XX:
> > +	case HFI_VERSION_6XX_LITE:
> s/HFI_VERSION_6XX_LITE/HFI_VERSION_4XX_LITE

yep

> 
> Thanks,
> Dikshita
> >  		return &pm_ops_v4;
> >  	}
> >  
> > diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> > index 99ce5fd41577..87c7901b280e 100644
> > --- a/drivers/media/platform/qcom/venus/vdec.c
> > +++ b/drivers/media/platform/qcom/venus/vdec.c
> > @@ -550,7 +550,7 @@ vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
> >  {
> >  	struct venus_inst *inst = to_inst(file);
> >  	struct vb2_queue *dst_vq;
> > -	struct hfi_frame_data fdata = {0};
> > +	struct hfi_frame_data fdata;
> >  	int ret;
> >  
> >  	ret = v4l2_m2m_ioctl_try_decoder_cmd(file, fh, cmd);
> > @@ -561,18 +561,15 @@ vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
> >  
> >  	if (cmd->cmd == V4L2_DEC_CMD_STOP) {
> >  		/*
> > -		 * Implement V4L2_DEC_CMD_STOP by enqueue an empty buffer on
> > +		 * Implement V4L2_DEC_CMD_STOP by enqueue a buffer on
> >  		 * decoder input to signal EOS.
> >  		 */
> >  		if (!(inst->streamon_out && inst->streamon_cap))
> >  			goto unlock;
> >  
> > -		fdata.buffer_type = HFI_BUFFER_INPUT;
> > -		fdata.flags |= HFI_BUFFERFLAG_EOS;
> > -		if (IS_V6(inst->core) && is_fw_rev_or_older(inst->core, 1, 0, 87))
> > -			fdata.device_addr = 0;
> > -		else
> > -			fdata.device_addr = 0xdeadb000;
> > +		ret = venus_helper_alloc_eos_buf(inst, &fdata);
> > +		if (ret)
> > +			goto unlock;
> >  
> >  		ret = hfi_session_process_buf(inst, &fdata);
> >  
> > @@ -1332,6 +1329,7 @@ static void vdec_session_release(struct venus_inst *inst)
> >  		hfi_session_abort(inst);
> >  
> >  	venus_helper_free_dpb_bufs(inst);
> > +	venus_helper_free_eos_bufs(inst);
> >  	venus_pm_load_scale(inst);
> >  	INIT_LIST_HEAD(&inst->registeredbufs);
> >  	mutex_unlock(&inst->lock);
> > @@ -1682,6 +1680,7 @@ static int vdec_open(struct file *file)
> >  	if (!inst)
> >  		return -ENOMEM;
> >  
> > +	INIT_LIST_HEAD(&inst->eosbufs);
> >  	INIT_LIST_HEAD(&inst->dpbbufs);
> >  	INIT_LIST_HEAD(&inst->registeredbufs);
> >  	INIT_LIST_HEAD(&inst->internalbufs);

