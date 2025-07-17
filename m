Return-Path: <linux-media+bounces-37944-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DADB08575
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 08:52:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56D593BC7C9
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 06:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 409C6219A8A;
	Thu, 17 Jul 2025 06:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JnatKgWr"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0A820ADEE
	for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 06:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752735120; cv=none; b=H8p1K69b2fo4Kyl9kPZXJF7ZKTcefsaGhYCHoqzmCuLTml7yDca+OkGabEyZIdSSkNexUI+t+JWZC6bkJeDH9vh/tJVwgE30zAUur7fk1OHJVimMSRYtHKe15aj6sjXqCpgZ49ubRvx7+/2yVnX1joTG1PCjfBFk873cKSPa5rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752735120; c=relaxed/simple;
	bh=xTfpokh+eM0H7vAUTJOWN2GUKk3IEDrRn1bH73Hrt1M=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dcEPceeIcYjsvTSQXVdRK2JqUKdR9v2fbFxOY22KsK6MHjH5cOfBzcoqv5WbDfIrp98vVkM6LMUly1J5Ju6Co6brLFYrxxFu+gTwE9E1bdjOZkLD1iBYp+gvTK8n7geuIzLFjAhjIOxPYv7I7Oe8+xJT4bU8un5xMRsP7P+lSe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JnatKgWr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56H4Y7sZ028124
	for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 06:51:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=q9sPxZbJPv/UCPRDIroL0FL6
	33a28OgGsC/135RRF34=; b=JnatKgWrnpG0FqyRAv4PD44/v8jlAIrUHm7I5mwC
	kVxNwKPXaSbSxYJODfnJzAFn4mg9NeLY8h9dKTRCGp0zofn/JY31K5j3QVeMi686
	2CRiTlnpoveFrEWHFIduz6W207nAj10jqsCCqgHcNLQ+zlC9eu8hf0XgAzoYl3xq
	JHQdSxIz1U8njPCljOtNuYm2KlDF9XFE8gcRIgtUkmhh3AEm5/olvKBR8NfPw0gI
	GTk/ASYnFzzvC0i40ZxNMWqgdtMv2vOnmasYDA68spdP4591gUnzpM1DQFfPcd6H
	M34z/bL0u6IxLozqB9sWd3F28Of+L60Fi3T0gRgzwDRkQA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wnh5xuak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 06:51:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e095227f5dso95240485a.1
        for <linux-media@vger.kernel.org>; Wed, 16 Jul 2025 23:51:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752735116; x=1753339916;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q9sPxZbJPv/UCPRDIroL0FL633a28OgGsC/135RRF34=;
        b=RXuOVdsGjJJIMjmJ/BeLP5PCXED+hQqk0rZKDt2RgltjlCkR8dkGjYuiQcfj0Q6rCd
         p0bA5tWOsXlBzNEY6MFO7l253B9KrJKGzas7Ui4Ubuc/CBy7FSap4RpfZVDm5gDr8Wp9
         lAR/0PKqHDid1Ha/DM9acFFIjzY2pR7//NzzuF0wf8oWntUpOTP+VewbvSFTcnZRVGHr
         5hpMYRiYVSk5Jz15YQO6WAYwLZNW1zodDVptg7foJIhO/U2Ux5W9mtCpuD9WlmnQZHw3
         9N6xTZHalLd8NCLr9H7QIQV35djJJdHqPAQPCuiX+UbuvE9l8ZV+LO/DOkHQpOIx9MWe
         59sA==
X-Forwarded-Encrypted: i=1; AJvYcCV1XXKrFv5DfdEer6xtW9Kva6oISCfA116Ma+ioEhErYXNcYh4XzLWK1+oL4OtltRuEzhMfp/lVOx3A0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf9aivMjUIDvXeNSmiX3YqzIj0t3JQVun9SXc+5ZeQrx0WJfTj
	5iemljyGmFNqa8c9MedCCf+gmdnxiZh39d4ayOTobiRuvUJgRBjdChjb52bbT+ZUfZlPmsP2bZD
	7ZrrzbCde7Op7uvjum6/BrX1huNlAr/WhPqhFoXpg1fjppEkCtQkhH7Uh8lReC6hyQg==
X-Gm-Gg: ASbGncs6j/HheNVkctyPEls20K8kZbqWCVhMAqd8DmAMl9ptAAf/TaNs/Ar7PMJChPB
	6AlXy/HZxJqu2liD5nABziePqJnMMrhqBd+mR+MvzJyKot4+ESDrhWtcWeLcOZXpKqhIAqiDmHG
	wFqRUWkDcnG99N7ztPIkx3eLV5AEUsdBj83P104KvilTqqAzlIMjorPBmue+a3kneT5vS7AvgGm
	qiv9dksCgzGFS+vROhcgw6+/z9OZk7wp8oYqg7+6fIZwkHd9vNdyAfmPEUqb5GWnQtXBGnNrP+h
	7+l8EUoCUsd4Bn+C60CwMeG0rLgX9S24lcnB1OilhTW/tPKHpWkS8Dge9X1aYy20i7z3ai55y5I
	=
X-Received: by 2002:a05:620a:4606:b0:7e3:2b48:7a83 with SMTP id af79cd13be357-7e342b5bd3cmr750104785a.39.1752735115891;
        Wed, 16 Jul 2025 23:51:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVfrBEr4ilxky/eDf4VZ8EjlWDAXKMdDdNkfwskeQj3T1yecsUXR+JjMCV9BPPVRtGb8bPIQ==
X-Received: by 2002:a05:620a:4606:b0:7e3:2b48:7a83 with SMTP id af79cd13be357-7e342b5bd3cmr750102785a.39.1752735115303;
        Wed, 16 Jul 2025 23:51:55 -0700 (PDT)
Received: from trex (153.red-79-144-197.dynamicip.rima-tde.net. [79.144.197.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b612db7060sm2146179f8f.52.2025.07.16.23.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 23:51:54 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Thu, 17 Jul 2025 08:51:53 +0200
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com,
        krzk+dt@kernel.org, konradybcio@kernel.org, mchehab@kernel.org,
        andersson@kernel.org, conor+dt@kernel.org,
        amit.kucheria@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/7] media: venus: Conditionally register codec nodes
 based on firmware version
Message-ID: <aHidibqhMyexExXJ@trex>
References: <20250715204749.2189875-1-jorge.ramirez@oss.qualcomm.com>
 <20250715204749.2189875-3-jorge.ramirez@oss.qualcomm.com>
 <2fd0d1a7-70ee-43ac-af84-d2321c40e8f8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2fd0d1a7-70ee-43ac-af84-d2321c40e8f8@linaro.org>
X-Authority-Analysis: v=2.4 cv=dKimmPZb c=1 sm=1 tr=0 ts=68789d8d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Ki5fnJvzvo7yLsyA0quaxQ==:17
 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=QkW7CUjfO7Dj9zUrQigA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: yCMcVia6AGGmaHt9QgnTeUWsy41SWwDx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDA1OCBTYWx0ZWRfXx6KiAqIeI0XV
 f/xP8geSilrfr/ybBdk91lkBdNrYIaYnFXkGyh0PeWbwlWA+TxkjYIFngi4rI1eem9vJJVEw6zf
 wwsPVJxd5RexlO0TMjMSWNk9qGi5OAA61PbocThKyWxuuF4QV3C0tMD3Upx8DTVoN3ZV1Mlw1iZ
 osqMN2JApSZDqMUXrtyTzujJXvRssvzijaWcj8JeG9reSt6pD+wUadgKibDPL8Whjz1lyaVnGq5
 Ql4AWcP70TRwxwtEuXAFb6hh3zI+cfuU6WxXAoj8bx1PWCkK11YGFg34gnb/5UJQBAF6UvHGpqX
 nIGRwp9AySDjA6hk8kqAX26XpJ9rUn7W6s5VZ5F6IRKmhaCizzkxFUVG7ldlWbSRwzlXs3W93U1
 0Eq05vcLnm/NHN1qK8njrGuMH5ld0gQTurm0A2rjGa+c2U6dMGVWfE+YPDdB67dcvZ2Wraw7
X-Proofpoint-ORIG-GUID: yCMcVia6AGGmaHt9QgnTeUWsy41SWwDx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 spamscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170058

On 17/07/25 00:37:33, Bryan O'Donoghue wrote:
> On 15/07/2025 21:47, Jorge Ramirez-Ortiz wrote:
> > The encoding and decoding capabilities of a VPU can vary depending on the
> > firmware version in use.
> > 
> > This commit adds support for platforms with OF_DYNAMIC enabled to
> > conditionally skip the creation of codec device nodes at runtime if the
> > loaded firmware does not support the corresponding functionality.
> > 
> > Note that the driver becomes aware of the firmware version only after the
> > HFI layer has been initialized.
> > 
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > ---
> >   drivers/media/platform/qcom/venus/core.c | 76 +++++++++++++++---------
> >   drivers/media/platform/qcom/venus/core.h |  8 +++
> >   2 files changed, 57 insertions(+), 27 deletions(-)
> > 
> > diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> > index 4c049c694d9c..b7d6745b6124 100644
> > --- a/drivers/media/platform/qcom/venus/core.c
> > +++ b/drivers/media/platform/qcom/venus/core.c
> > @@ -28,6 +28,15 @@
> >   #include "pm_helpers.h"
> >   #include "hfi_venus_io.h"
> > +static inline bool venus_fw_supports_codec(struct venus_core *core,
> > +					   const struct venus_min_fw *ver)
> > +{
> > +	if (!ver)
> > +		return true;
> > +
> > +	return is_fw_rev_or_newer(core, ver->major, ver->minor, ver->rev);
> > +}
> > +
> >   static void venus_coredump(struct venus_core *core)
> >   {
> >   	struct device *dev;
> > @@ -103,7 +112,9 @@ static void venus_sys_error_handler(struct work_struct *work)
> >   	core->state = CORE_UNINIT;
> >   	for (i = 0; i < max_attempts; i++) {
> > -		if (!pm_runtime_active(core->dev_dec) && !pm_runtime_active(core->dev_enc))
> > +		/* Not both nodes might be available */
> 
> "Neither node available" the latter for preference.

what about "One or both nodes may be unavailable" ?

> 
> > +		if ((!core->dev_dec || !pm_runtime_active(core->dev_dec)) &&
> > +		    (!core->dev_enc || !pm_runtime_active(core->dev_enc)))
> 
> Is this change about registration or is it a fix trying to sneak in under
> the radar ?

I think this functionality - the ability to enable or disable individual
encode/decode nodes based on firmware capabilities - should be standard
across multimedia drivers.

For example, on the AR50_LITE platform, the _current_ driver/firmware
combo does not support encoding as it requires secure buffer handling
which is not yet implemented in the kernel (changes to iommu, etc)

So, rather than disabling Venus entirely, I think it makes sense to
expose the decoder node, which remains fully functional and unaffected
by the secure buffer requirement.

Hence this commit (so yeah, I am not trying to sneak a fix, I swear!) 

> 
> >   			break;
> >   		msleep(10);
> >   	}
> > @@ -202,7 +213,8 @@ static u32 to_v4l2_codec_type(u32 codec)
> >   	}
> >   }
> > -static int venus_enumerate_codecs(struct venus_core *core, u32 type)
> > +static int venus_enumerate_codecs(struct venus_core *core, u32 type,
> > +				  const struct venus_min_fw *ver)
> >   {
> >   	const struct hfi_inst_ops dummy_ops = {};
> >   	struct venus_inst *inst;
> > @@ -213,6 +225,9 @@ static int venus_enumerate_codecs(struct venus_core *core, u32 type)
> >   	if (core->res->hfi_version != HFI_VERSION_1XX)
> >   		return 0;
> > +	if (!venus_fw_supports_codec(core, ver))
> > +		return 0;
> Its not really a codec you're checking there, its a version.
> 
> The name should reflect that.

but the check isn't just about the firmware version: it is about whether
the firmware in use supports a specific coded based on the firmware
version knowledge built in the driver.

so really, while the logic involves a version check, it is really about
the codec capability.

I could rename it as is_codec_enabled_by_fw() if the current naming is
not clear.

> 
> > +
> >   	inst = kzalloc(sizeof(*inst), GFP_KERNEL);
> >   	if (!inst)
> >   		return -ENOMEM;
> > @@ -288,14 +303,14 @@ static irqreturn_t venus_isr_thread(int irq, void *dev_id)
> >   #if defined(CONFIG_OF_DYNAMIC)
> >   static int venus_add_video_core(struct venus_core *core, const char *node_name,
> > -				const char *compat)
> > +				const char *compat, const struct venus_min_fw *ver)
> >   {
> >   	struct of_changeset *ocs = core->ocs;
> >   	struct device *dev = core->dev;
> >   	struct device_node *np, *enp;
> >   	int ret;
> > -	if (!node_name)
> > +	if (!node_name || !venus_fw_supports_codec(core, ver))
> >   		return 0;
> >   	enp = of_find_node_by_name(dev->of_node, node_name);
> > @@ -330,11 +345,13 @@ static int venus_add_dynamic_nodes(struct venus_core *core)
> >   	of_changeset_init(core->ocs);
> > -	ret = venus_add_video_core(core, core->res->dec_nodename, "venus-decoder");
> > +	ret = venus_add_video_core(core, core->res->dec_nodename, "venus-decoder",
> > +				   core->res->dec_minfw);
> >   	if (ret)
> >   		goto err;
> > -	ret = venus_add_video_core(core, core->res->enc_nodename, "venus-encoder");
> > +	ret = venus_add_video_core(core, core->res->enc_nodename, "venus-encoder",
> > +				   core->res->enc_minfw);
> >   	if (ret)
> >   		goto err;
> > @@ -363,6 +380,9 @@ static void venus_remove_dynamic_nodes(struct venus_core *core)
> >   #else
> >   static int venus_add_dynamic_nodes(struct venus_core *core)
> >   {
> > +	WARN_ONCE(core->res->enc_minfw || core->res->dec_minfw,
> > +		  "Feature not supported");
> > +
> >   	return 0;
> >   }
> > @@ -432,7 +452,7 @@ static int venus_probe(struct platform_device *pdev)
> >   					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> >   					"venus", core);
> >   	if (ret)
> > -		goto err_core_put;
> > +		goto err_hfi_destroy;
> >   	venus_assign_register_offsets(core);
> > @@ -448,19 +468,9 @@ static int venus_probe(struct platform_device *pdev)
> >   	if (ret < 0)
> >   		goto err_runtime_disable;
> > -	if (core->res->dec_nodename || core->res->enc_nodename) {
> > -		ret = venus_add_dynamic_nodes(core);
> > -		if (ret)
> > -			goto err_runtime_disable;
> > -	}
> > -
> > -	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
> > -	if (ret)
> > -		goto err_remove_dynamic_nodes;
> > -
> >   	ret = venus_firmware_init(core);
> >   	if (ret)
> > -		goto err_of_depopulate;
> > +		goto err_runtime_disable;
> >   	ret = venus_boot(core);
> >   	if (ret)
> > @@ -474,34 +484,46 @@ static int venus_probe(struct platform_device *pdev)
> >   	if (ret)
> >   		goto err_venus_shutdown;
> > -	ret = venus_enumerate_codecs(core, VIDC_SESSION_TYPE_DEC);
> > +	if (core->res->dec_nodename || core->res->enc_nodename) {
> > +		ret = venus_add_dynamic_nodes(core);
> > +		if (ret)
> > +			goto err_core_deinit;
> > +	}
> > +
> > +	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
> >   	if (ret)
> > -		goto err_core_deinit;
> > +		goto err_remove_dynamic_nodes;
> > +
> > +	ret = venus_enumerate_codecs(core, VIDC_SESSION_TYPE_DEC,
> > +				     core->res->dec_minfw);
> > +	if (ret)
> > +		goto err_of_depopulate;
> > -	ret = venus_enumerate_codecs(core, VIDC_SESSION_TYPE_ENC);
> > +	ret = venus_enumerate_codecs(core, VIDC_SESSION_TYPE_ENC,
> > +				     core->res->enc_minfw);
> >   	if (ret)
> > -		goto err_core_deinit;
> > +		goto err_of_depopulate;
> >   	ret = pm_runtime_put_sync(dev);
> >   	if (ret) {
> >   		pm_runtime_get_noresume(dev);
> > -		goto err_core_deinit;
> > +		goto err_of_depopulate;
> >   	}
> >   	venus_dbgfs_init(core);
> >   	return 0;
> > +err_of_depopulate:
> > +	of_platform_depopulate(dev);
> > +err_remove_dynamic_nodes:
> > +	venus_remove_dynamic_nodes(core);
> >   err_core_deinit:
> >   	hfi_core_deinit(core, false);
> >   err_venus_shutdown:
> >   	venus_shutdown(core);
> >   err_firmware_deinit:
> >   	venus_firmware_deinit(core);
> > -err_of_depopulate:
> > -	of_platform_depopulate(dev);
> > -err_remove_dynamic_nodes:
> > -	venus_remove_dynamic_nodes(core);
> >   err_runtime_disable:
> >   	pm_runtime_put_noidle(dev);
> >   	pm_runtime_disable(dev);
> > diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> > index 5b1ba1c69adb..3af8386b78be 100644
> > --- a/drivers/media/platform/qcom/venus/core.h
> > +++ b/drivers/media/platform/qcom/venus/core.h
> > @@ -50,6 +50,12 @@ struct bw_tbl {
> >   	u32 peak_10bit;
> >   };
> > +struct venus_min_fw {
> > +	u32 major;
> > +	u32 minor;
> > +	u32 rev;
> > +};
> 
> I'd call this venus_firmware_version

I guess you right- doing so will enable future extensibility if we need
to do some different version checks. ok.

> 
> > +
> >   enum vpu_version {
> >   	VPU_VERSION_AR50,
> >   	VPU_VERSION_AR50_LITE,
> > @@ -92,6 +98,8 @@ struct venus_resources {
> >   	u32 cp_nonpixel_start;
> >   	u32 cp_nonpixel_size;
> >   	const char *fwname;
> > +	const struct venus_min_fw *enc_minfw;
> > +	const struct venus_min_fw *dec_minfw;
> 
> and then I'd do as you have done here, indicate that the struct
> venus_firmware_version is a *enc_min_fw_ver;

ack

> 
> >   	const char *enc_nodename;
> >   	const char *dec_nodename;
> >   };

