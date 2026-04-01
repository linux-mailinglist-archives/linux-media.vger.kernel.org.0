Return-Path: <linux-media+bounces-57875-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFn8KskRzWnzZwYAu9opvQ
	(envelope-from <linux-media+bounces-57875-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 14:38:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 951E737A8B9
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 14:38:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 30786301BDEF
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 12:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABA094070F9;
	Wed,  1 Apr 2026 12:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CxwuYgYs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KJcH17nM"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7582405ACD
	for <linux-media@vger.kernel.org>; Wed,  1 Apr 2026 12:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775047058; cv=none; b=EMW28aId5CdZjIf6i+AJ+ttll1K7t+2FaPJkwHG8pUjZUdHbYAcBd27qTZIgclrL4four29uyh0H8sAIGagy0/a25VSLNUEBFiLaumrjz9hiv8gZNSpanhqI0G+xPIv50hkI65HnDh4Bc8kGAwdhR2RwXBQ1jS3K6Icijz3gbt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775047058; c=relaxed/simple;
	bh=TGA5aCMXaSAI8RMbhXiGZEtXoIu/pxzT+2wjOAP+y2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KC2dlvtaKyU1RXow9/ZlhncNFjVc+87kW45yQR/iTSg17siYCvhpT1lcTfpU3bdKm5HnYxlz3uFU4TzqKxLeB2D/Ep2+6n9ptyraD9DhF+lK2hze4+Lfq01G81TaJcZPjzlnq4h43F8UfXacoSrvZm/nDrb53m6VLV6HO2Gku2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CxwuYgYs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KJcH17nM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631CRSoU3103964
	for <linux-media@vger.kernel.org>; Wed, 1 Apr 2026 12:37:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dHmrayuupAbWR1nXTuc7V5jAOdSiiDscuyTOuUjPB/U=; b=CxwuYgYsHLutlCxJ
	i0HsKbQqmMAfzp3aWUZjYbxNGpYnRt4eSQE2lFqESpPVllQKabCsTJsicLZjyZeZ
	YGMsiXMmBI7pL9wb8qY4QkHhkTIKFB6ZFzEuJXPKu9xri7VzaFjFEuPm6sjTcFm4
	dQTKGJgzzSlS5JOg6CoFcU7Fy4ae9pUKCVyyz/EkltfwF1pb7FARAdfBCUKO3UvW
	mju7aICOlIOplUtJLZjCl3D3BXdT5RkNey8WWRZYi69C1jAuL9l3snEob8Mfeykg
	eRt4At6g6N2hQPCg76cah+D3hnQ4mOsyngsv0QD28FLfB8GUNdfR3Uv6BeYhSl4I
	RP3QKQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8js24d7x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 12:37:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b242b9359aso44201265ad.0
        for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 05:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775047054; x=1775651854; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dHmrayuupAbWR1nXTuc7V5jAOdSiiDscuyTOuUjPB/U=;
        b=KJcH17nMbMqqWM+lgoyLSSOK58lcGhFru7S/10qMCcOrKOHs/w9jNnOfMXyR1bux/7
         2hymOccDP3cWzYpm9XrtfFUI3erg94PKQkkyk1LaQVAXrUJqyLgvXKPrBIfwUBkabyZk
         YaISQrSqwMRtUDpP8Whh/Na00ElTikd6EBd83H4eLE0puVMwpXLflVlHqBBc6PtmU43J
         l1Rm0EH+nV4n2p0k4wPu+1ZcbeXNwYtdG1By7/YQRVQ0ChCmDIebgEoVpElJqd9w4YpN
         RuclFVkQS/Kt+Q3U+TBYs5y1z+ezZoLI/J4Wq/lsH5e7nk/QXFXNB8inX0pIuqeppmJn
         WNAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775047054; x=1775651854;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dHmrayuupAbWR1nXTuc7V5jAOdSiiDscuyTOuUjPB/U=;
        b=SC3ngtQ6meTdhVT/+8nxD/5vHJI1NhmTKJ5RymADRqkJC95mxNL53rh0KfV3y1Y8aj
         kAWh+wbkJbzeexUV+yLNe5WGCQ/YxeNG5CHAIJxzmZmLo/JnGc0D3bXQlGRi7amJBbJS
         jLiu7oBHwMpdDZcj3rtI8qmTUzdhWJQQ0oe1jE17em+vTpdVZM6KLKNExLZA8SZC7S1A
         O3P0ygqGn6JWmr7s8VFvMwcWmdv61L6cCyInSiOuYZNWG+AcbPKVOAJyz0qhMAjAelD5
         Yf5oIaConjE0FlHxmOSExg22xbhxKO51EbiYMowqkTiuBoD/93o+RV/XS3Rnf9G248Mn
         SurA==
X-Gm-Message-State: AOJu0YyaPXCsnP+MCST1mx+yslh1pQTo1Pdwj650DgsMv/j1EGPlX7mK
	DlKFFvw3sMc8jcWpYCTCzZLqj+ddH/2r3xo42frG76B+JKuhybWr4NKR9+deQ2nI8h0mxEAIVX3
	kfUg0EqKANHf3++Kss6QaKUUXZED1bqV6xLRGuuj8UK/UAgTWFCniqQuYKvXvRhTCcA==
X-Gm-Gg: ATEYQzw9RSsy+X1ZvQ3QwRCxXw50DsupTJ8+EOP/Iuyhz+VlU588IjU6EIwfXi9RSnI
	cjmUQOJbpr4txjsbKdYZedoW9m9CBJZN/xaVBOtdUTBWuAlPXy3KPHj1b4LCuCFoPzAQHbAoSBc
	ZsCbsP2yg8TpIeLaSjWiclHgRlIIKS4MN5pfS2r6n23TJ6LqJFzOmSewfELzhWm0rjIjFO15zJO
	15iJTU12J5yHpvmnaRFTD5DNngE0Gb4R/b7Aw+soTNmWwiOmd4SInqKa6Q8j7vc4UntcFhR4Acy
	RbY9AoG9r6+tr6NScX0a9JVVsdVa1JUsFWHOyIZ9ujTIOZQBPen5cZKofveAsXGyYYP7v/nvtBi
	niW/tzsFtzuSewp8dR6kSrSHaJwVMpKi5u+7Epo2Uv+KG+OrdG7LVpQ==
X-Received: by 2002:a05:6300:2189:b0:398:98f2:743d with SMTP id adf61e73a8af0-39ef77862bemr3431640637.57.1775047054225;
        Wed, 01 Apr 2026 05:37:34 -0700 (PDT)
X-Received: by 2002:a05:6300:2189:b0:398:98f2:743d with SMTP id adf61e73a8af0-39ef77862bemr3431607637.57.1775047053723;
        Wed, 01 Apr 2026 05:37:33 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.233.247])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c769179e30dsm12438450a12.20.2026.04.01.05.37.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 05:37:33 -0700 (PDT)
Message-ID: <9bfaf15e-99c8-a98e-d0df-9df86872bfe8@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 18:07:27 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 2/5] media: iris: Add hardware power on/off ops for
 X1P42100
Content-Language: en-US
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com>
 <20260401-enable_iris_on_purwa-v4-2-ca784552a3e9@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260401-enable_iris_on_purwa-v4-2-ca784552a3e9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: iXfyomPrlyRgUvkTkNDJ_vWCVIrkSzDu
X-Authority-Analysis: v=2.4 cv=XfqEDY55 c=1 sm=1 tr=0 ts=69cd118f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=5/Y9Gi2N1OwmQbPtUd2E/A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=dXMAQJrOHHfgTcScUBoA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDExNSBTYWx0ZWRfX+AVMZ0aU57Tm
 HqnvPDIdOvkVp2jjEun4ZQA50e0sndMnyq7dpLYb9mDzKneqSCCEeUcJfHQCeTFM6t6p6HHJRO/
 OasrP2h34HNOavgpJWTGdy+ALSmOkmVDIfDQ/4ptvSUh1P9p6I8lusEOabBT1kR44SzXb2MPits
 7Pv8GEOKRTztFm5ML3Xko/xOri5XaHwpcQ7QhUJckuLlmGIU7/7OTil9kdQJHO5DxxCsauOtI2g
 chi6jW/hMYLgZdDO+AIh/dWYUuW19HigxqVwrZ3Fv1lgVcCIw8eYDawVx5ryFPE+KJWLC3JyS5o
 q/eKtHz0ZV4VJhJqsbPPfjKEA2IYJKJwmeuCO9sGXl78z/2Ku6auR/x9Apg4ij2wtK79ilYd0pZ
 DYfekMmdThbKPcNmoAoyAZNqbi7LmJ9NtkSungOUrER9Ll6U/3Kd7z0i3AMmLAohjDQ8vX/YQRO
 /RpIY+yZmz8zxwmjTNg==
X-Proofpoint-GUID: iXfyomPrlyRgUvkTkNDJ_vWCVIrkSzDu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010115
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-57875-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 951E737A8B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/1/2026 3:54 PM, Wangao Wang wrote:
> On X1P42100 the Iris block has an extra BSE clock. Wire this clock into
> the power on/off sequence.
> 
> The BSE clock is used to drive the Bin Stream Engine, which is a sub-block
> of the video codec hardware responsible for bitstream-level processing. It
> is required to be enabled separately from the core clock to ensure proper
> codec operation.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 46 ++++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_vpu_common.h |  1 +
>  2 files changed, 47 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> index fe4423b951b1e9e31d06dffc69d18071cc985731..e6a62b3ca78efeefa2eed267636789a6b405689f 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> @@ -71,6 +71,44 @@ static void iris_vpu3_power_off_hardware(struct iris_core *core)
>  	iris_vpu_power_off_hw(core);
>  }
>  
> +static int iris_vpu3_purwa_power_on_hw(struct iris_core *core)
> +{
> +	int ret;
> +
> +	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
> +	if (ret)
> +		return ret;
> +
> +	ret = iris_prepare_enable_clock(core, IRIS_HW_CLK);
> +	if (ret)
> +		goto err_disable_power;
> +
> +	ret = iris_prepare_enable_clock(core, IRIS_BSE_HW_CLK);
> +	if (ret)
> +		goto err_disable_hw_clock;
> +
> +	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
> +	if (ret)
> +		goto err_disable_bse_hw_clock;
> +
> +	return 0;
> +
> +err_disable_bse_hw_clock:
> +	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
> +err_disable_hw_clock:
> +	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
> +err_disable_power:
> +	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
> +
> +	return ret;
> +}
> +
> +static void iris_vpu3_purwa_power_off_hardware(struct iris_core *core)
> +{
> +	iris_vpu3_power_off_hardware(core);

this will eventually call iris_vpu_power_off_hw which would try to disable
IRIS_HW_AHB_CLK which is not applicable to purwa I think, will that not
create any issue?

Other than this, change LGTM.

Thanks,
Dikshita
> +	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
> +}
> +
>  static void iris_vpu33_power_off_hardware(struct iris_core *core)
>  {
>  	bool handshake_done = false, handshake_busy = false;
> @@ -268,6 +306,14 @@ const struct vpu_ops iris_vpu3_ops = {
>  	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
>  };
>  
> +const struct vpu_ops iris_vpu3_purwa_ops = {
> +	.power_off_hw = iris_vpu3_purwa_power_off_hardware,
> +	.power_on_hw = iris_vpu3_purwa_power_on_hw,
> +	.power_off_controller = iris_vpu_power_off_controller,
> +	.power_on_controller = iris_vpu_power_on_controller,
> +	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
> +};
> +
>  const struct vpu_ops iris_vpu33_ops = {
>  	.power_off_hw = iris_vpu33_power_off_hardware,
>  	.power_on_hw = iris_vpu_power_on_hw,
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> index f6dffc613b822341fb21e12de6b1395202f62cde..88a23cbdc06c5b38b4c8db67718cbd538f0e0721 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> @@ -10,6 +10,7 @@ struct iris_core;
>  
>  extern const struct vpu_ops iris_vpu2_ops;
>  extern const struct vpu_ops iris_vpu3_ops;
> +extern const struct vpu_ops iris_vpu3_purwa_ops;
>  extern const struct vpu_ops iris_vpu33_ops;
>  extern const struct vpu_ops iris_vpu35_ops;
>  extern const struct vpu_ops iris_vpu4x_ops;
> 

