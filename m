Return-Path: <linux-media+bounces-60976-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOktE/VO/mllowAAu9opvQ
	(envelope-from <linux-media+bounces-60976-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 23:00:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CACF4FBB71
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 23:00:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F32A73035F0F
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 21:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69E67421A1C;
	Fri,  8 May 2026 21:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vfak/H7Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jIhmsa9C"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FF2309DB1
	for <linux-media@vger.kernel.org>; Fri,  8 May 2026 21:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778274032; cv=none; b=kQ//9gCGL8pgwwdu3qt4EAp2mYrMIQX0gF00tEtYH5USCxT5nYK/4AmIu0ndbkdrTzlbeFRf1m6Ql6NEi7JnRZKZo5msRNUd4jht+JDY+Vwoq+D50xYjwGAkyZ2reVHUgXmj6WyfyClmNUcAzw3OvAQsVNNycpEUSErda2/D2/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778274032; c=relaxed/simple;
	bh=c9zeXhrVaU09ZzWijg4iKloX/ug+0m5V407uh+todWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T+P6/ajQUbGFPXtau9+i7oPEgoAk0qqDrOBhkH3dFmGMhbvt00TqqGbxKU4hsKQkZtL9TIrzcEHYL8TXN4TJMrIOvMGmcaqGC4lqxeDLjHYgXUTTCyllV7x2n+dn9ZxE2o2s0B0pdOkV13mQ5mRbU52a+SG9pl1Nyk7G1GEgGqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vfak/H7Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jIhmsa9C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648KLS4v852109
	for <linux-media@vger.kernel.org>; Fri, 8 May 2026 21:00:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SHePhORSjPoP2RD8TjQQUWYG
	etXBS0Lyj+VrmGrpR9M=; b=Vfak/H7Qd63KIjTX23Cazt3xwnG6rXinC4ok5hOG
	3VlXp1RCD5fpHEMLTr6Vmiz6QYYnihcUOFVgh9R3PFE9+WVfX2V1aLChANnYM20v
	/tb/+bQrGiYiVitK4gezhUX2lr3hFuqVWrgXd5++GbWxo7En6i4Yrcz9lJEMZWWM
	GNrhoujjuTRIgTycMORTwisoIIszS+IoTOYBQ3S/IZ32iOUPNaree2fJINqBpxpW
	DTphzq0bi5//b+07ryvwsoqLp2FV0Tt6SWvDcyI7UHVtxmUwqBNzuUBCs14X27iT
	4sVC2Yp3wT+d6mQwaDRnBl1roE6wYYr2l8T1ZHY0DpECmA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1fpthx23-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 08 May 2026 21:00:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d5d1c2289so57527701cf.2
        for <linux-media@vger.kernel.org>; Fri, 08 May 2026 14:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778274028; x=1778878828; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SHePhORSjPoP2RD8TjQQUWYGetXBS0Lyj+VrmGrpR9M=;
        b=jIhmsa9CdoXl3uLdPxQPQpEfigSjf9fn2ZMDIjNX0Ji6U0iDr9XemDmpR3XE0SYePx
         SY68xfWtgRtTk4YEZizTklN+50jhxeyqP6BBUUvRrch1bpjpE0PSsSyai3S6ZNJq/1Jq
         UYnbw6qyifrgm9u/jn/h3m2AnIp2/zAarJADFJpIxd5J30RatWoSWdiw80rol+akkpvj
         dAbLmjf9WqxMd4nK2AzRJmOk0NSSWR+KDMWtD5jP+WHBtqoY79urHhpx9m9ycVuTgqLO
         IMHz199W/5mW53oWYpz62WktLKUB+BuSyjXAQUJIfBhTNjB218siBIFV0lBENrExqYNR
         g7vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778274028; x=1778878828;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SHePhORSjPoP2RD8TjQQUWYGetXBS0Lyj+VrmGrpR9M=;
        b=MRd4LwWxuYRkGpD9BEQxMjiVHEGut8sdTE4ajRO2MZSCgil2qAtVXUrPYC4R4V/rnU
         VY3YhGnjW0j7X6WepzLRKUtspSzIRp153P9e4QU68Nv+0vUntoGVIBg6SuIfk3L65e6T
         2JmG4vSvrJRrhvWmmnloy+107aeCY2XO8ZsUDfOGvjaE0JVTLQajsaFvFu1QAKmBnNX2
         LVHopXksiiZM9HR6QToOW0oCA9HGl8ITDNZBaXyjd+Uzlmgddrbszfpnn1qekD/jCHF8
         vyVMKFjqkVioE0PmWk2GpoGE6nO0G/n8tvK9zqX3OTkiTOQ3WdRwDKmueR5nzFSPvnxY
         Z8wA==
X-Forwarded-Encrypted: i=1; AFNElJ/TQMEIxHrDWOpPWQSiarcOr/3LQz+8h3R9pRnMsObRGCIlhTOj2SIvPXqn7XYjqSbQ57gsHrI1Ef0MZg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj5w6bv6bJMKez9FyhKUklcThzfhyO0fnJw70mIcyLTbDQeuX1
	KiyrvXNkHnkzZ7Wl+hd6Nmeg+DrDJjOqPh7ZtlA7OsppMV92LzVh3CZXiAfvbeMX8orhSHRvQi8
	8Z7HtGUNMh8zbYQQ1KzVWCT/BesDTQryT3IzCcy91Rn6f7AOUZhMtrXsG6b8SpELgrA==
X-Gm-Gg: AeBDievyCSUotP9X6vYoL/X2KxqVz8fQSnkg01aS8i5h4Miy8N4NQvtsUAdZ5Sau6mM
	pedfN3NsM7pWrIu/e4mZwvQ5nFmjioytg68XACtBLgvb3eo/lWsD82++eYR7Ve5XL7kVX1R/LSk
	ZmAudGohf1umIBLkTZVJkk6Q5QUmy5+JHSiVrA5thhxg7Vl/rdfErOBfAPkwl7uW4apKoEpTkEC
	VpQth9VfXPCBTSyI2xlHwytq3Saz+UXay9Z6piEi+pQE1Dq3RUxdfkhotiFJn3SBX6jdEYbjYnq
	u1OQKhOdfBUcaEIGFmIWb084riPOH02+hVyt3cZY/NbDvzXUXhvd0cbdDgGzQQ2M02BhsVvbe0T
	hzxPlhlg2qTSQkXvHWaXTSf/r/zNgVgkcWqMfzJVB0535v156e5W/v/FW96nCxCQ1KE/NEX4n0f
	O94mpbHdFqHociA9mZYSkezeLjzhULYKsgaVI=
X-Received: by 2002:a05:622a:4a86:b0:50f:ca25:fb48 with SMTP id d75a77b69052e-5148e9d2bacmr57454181cf.55.1778274027678;
        Fri, 08 May 2026 14:00:27 -0700 (PDT)
X-Received: by 2002:a05:622a:4a86:b0:50f:ca25:fb48 with SMTP id d75a77b69052e-5148e9d2bacmr57452921cf.55.1778274026896;
        Fri, 08 May 2026 14:00:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a951552dsm783337e87.6.2026.05.08.14.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 14:00:25 -0700 (PDT)
Date: Sat, 9 May 2026 00:00:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 11/14] media: iris: Add support to select core for
 dual core platforms
Message-ID: <qodaq4xoi6whna4phhrfbdfanfm43y7vmg4qxjuke5m3qgxozn@h2ot2a7w36xh>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-11-7fbb340c5dbd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509-glymur-v5-11-7fbb340c5dbd@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: QqzyWfLSGeaMYzoLVKsvNZtp_QkAbyQs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDIwNyBTYWx0ZWRfX0yFyu/Y4/RHX
 iqpM/mLkjUkBdcK5L9TsRCgs61RhJjdVAcdGn+Mc6N3V9+jXedw1K6sfLYDH1kepk41J1Vm63gI
 QTuaYuAgh6guTCbSP4u+3RvJsoHnKgSqPNg1QQ+h3kU2dt3Um2aEgxdYh1WTObECK9peGNXewMB
 5iPG1k3sjkPRlP9avEmEHu9E5sCvuXfI/R/MnoMUFhG79kTO1bFjut6mSX+0PM4duW34IrvzYfo
 WD/sjON+1wSBdFE6s/W6jbIJm0RkwRqYBz2/63q3rDSQDOMc6tbyewZBEBY2wPEEJbyGMoNoU8y
 oi8OsRX055ygZI28EQDu6IcVokDnZLuQctsFXEoMRivZCeC+yvynDjUNQQgcQcbXq2Ut9akOicp
 J1hj4lK+N4lOlqAPw/UPd84MTt/ivgK4sNouhwN58WDjjsSlAV2TDN0OsWxNUWFjPQ3vP/7ytah
 25wV87Bxa6EzGx8w1oA==
X-Proofpoint-GUID: QqzyWfLSGeaMYzoLVKsvNZtp_QkAbyQs
X-Authority-Analysis: v=2.4 cv=IYi3n2qa c=1 sm=1 tr=0 ts=69fe4eec cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=fkCez9G6P6hGpiuCVw4A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080207
X-Rspamd-Queue-Id: 0CACF4FBB71
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60976-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sat, May 09, 2026 at 12:30:00AM +0530, Vishnu Reddy wrote:
> On platforms with dual vcodec cores, select the hardware core for a
> session based on current load. Assign the session to vcodec0 if its
> MBPF/MBPS capacity allows it, otherwise assign to vcodec1. Communicate
> the selected core to firmware using the new HFI_PROP_CORE_ID property.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_common.c     | 10 +++
>  drivers/media/platform/qcom/iris/iris_common.h     |  1 +
>  drivers/media/platform/qcom/iris/iris_core.h       |  5 ++
>  drivers/media/platform/qcom/iris/iris_hfi_common.h |  1 +
>  .../platform/qcom/iris/iris_hfi_gen2_command.c     | 19 ++++++
>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
>  drivers/media/platform/qcom/iris/iris_instance.h   |  2 +
>  .../platform/qcom/iris/iris_platform_common.h      |  1 +
>  drivers/media/platform/qcom/iris/iris_power.c      | 11 ++--
>  drivers/media/platform/qcom/iris/iris_utils.c      | 75 ++++++++++++++++------
>  drivers/media/platform/qcom/iris/iris_vb2.c        |  4 ++
>  drivers/media/platform/qcom/iris/iris_vidc.c       |  6 +-
>  12 files changed, 113 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_common.c b/drivers/media/platform/qcom/iris/iris_common.c
> index 7f1c7fe144f7..3b3fc482e194 100644
> --- a/drivers/media/platform/qcom/iris/iris_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_common.c
> @@ -46,6 +46,16 @@ void iris_set_ts_metadata(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
>  	inst->metadata_idx++;
>  }
>  
> +int iris_set_core_id(struct iris_inst *inst)
> +{
> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +
> +	if (!inst->core->iris_platform_data->dual_core)
> +		return 0;
> +
> +	return hfi_ops->session_set_core_id(inst, inst->core_id);
> +}
> +
>  int iris_process_streamon_input(struct iris_inst *inst)
>  {
>  	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> diff --git a/drivers/media/platform/qcom/iris/iris_common.h b/drivers/media/platform/qcom/iris/iris_common.h
> index b2a27b781c9a..34e32c60f768 100644
> --- a/drivers/media/platform/qcom/iris/iris_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_common.h
> @@ -11,6 +11,7 @@ struct iris_buffer;
>  
>  int iris_vb2_buffer_to_driver(struct vb2_buffer *vb2, struct iris_buffer *buf);
>  void iris_set_ts_metadata(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf);
> +int iris_set_core_id(struct iris_inst *inst);
>  int iris_process_streamon_input(struct iris_inst *inst);
>  int iris_process_streamon_output(struct iris_inst *inst);
>  int iris_session_streamoff(struct iris_inst *inst, u32 plane);
> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> index b396c8cf595e..54a8649841e4 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.h
> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> @@ -30,6 +30,11 @@ enum domain_type {
>  	DECODER	= BIT(1),
>  };
>  
> +enum iris_vcodec_core_id {
> +	IRIS_VCODEC0 = 1,
> +	IRIS_VCODEC1,
> +};
> +
>  /**
>   * struct iris_core - holds core parameters valid for all instances
>   *
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> index 3edb5ae582b4..fbaf852a6b99 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> @@ -124,6 +124,7 @@ struct iris_hfi_command_ops {
>  	int (*session_drain)(struct iris_inst *inst, u32 plane);
>  	int (*session_resume_drain)(struct iris_inst *inst, u32 plane);
>  	int (*session_close)(struct iris_inst *inst);
> +	int (*session_set_core_id)(struct iris_inst *inst, u32 core_id);
>  };
>  
>  struct iris_hfi_response_ops {
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index 30bfd90d423b..9d9fae587297 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -1300,6 +1300,24 @@ static int iris_hfi_gen2_session_release_buffer(struct iris_inst *inst, struct i
>  					inst_hfi_gen2->packet->size);
>  }
>  
> +static int iris_hfi_gen2_set_core_id(struct iris_inst *inst, u32 core_id)
> +{
> +	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
> +	u32 payload = core_id;
> +
> +	iris_hfi_gen2_packet_session_command(inst,
> +					     HFI_PROP_CORE_ID,
> +					     HFI_HOST_FLAGS_NONE,
> +					     HFI_PORT_NONE,
> +					     inst->session_id,
> +					     HFI_PAYLOAD_U32,
> +					     &payload,
> +					     sizeof(u32));
> +
> +	return iris_hfi_queue_cmd_write(inst->core, inst_hfi_gen2->packet,
> +					inst_hfi_gen2->packet->size);
> +}
> +
>  static const struct iris_hfi_command_ops iris_hfi_gen2_command_ops = {
>  	.sys_init = iris_hfi_gen2_sys_init,
>  	.sys_image_version = iris_hfi_gen2_sys_image_version,
> @@ -1317,6 +1335,7 @@ static const struct iris_hfi_command_ops iris_hfi_gen2_command_ops = {
>  	.session_drain = iris_hfi_gen2_session_drain,
>  	.session_resume_drain = iris_hfi_gen2_session_resume_drain,
>  	.session_close = iris_hfi_gen2_session_close,
> +	.session_set_core_id = iris_hfi_gen2_set_core_id,
>  };
>  
>  void iris_hfi_gen2_command_ops_init(struct iris_core *core)
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> index cecf771c55dd..600e9dc07669 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> @@ -56,6 +56,7 @@
>  #define HFI_PROP_BUFFER_HOST_MAX_COUNT		0x03000123
>  #define HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT	0x03000124
>  #define HFI_PROP_PIC_ORDER_CNT_TYPE		0x03000128
> +#define HFI_PROP_CORE_ID			0x030001a9
>  
>  enum hfi_rate_control {
>  	HFI_RC_VBR_CFR		= 0x00000000,
> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
> index 16965150f427..dd341ca5be57 100644
> --- a/drivers/media/platform/qcom/iris/iris_instance.h
> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
> @@ -37,6 +37,7 @@ struct iris_fmt {
>   *
>   * @list: used for attach an instance to the core
>   * @core: pointer to core structure
> + * @core_id: specifies the hardware core on which the session runs
>   * @session_id: id of current video session
>   * @ctx_q_lock: lock to serialize queues related ioctls
>   * @lock: lock to seralise forward and reverse threads
> @@ -79,6 +80,7 @@ struct iris_fmt {
>  struct iris_inst {
>  	struct list_head		list;
>  	struct iris_core		*core;
> +	u32				core_id;
>  	u32				session_id;
>  	struct mutex			ctx_q_lock;/* lock to serialize queues related ioctls */
>  	struct mutex			lock; /* lock to serialize forward and reverse threads */
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 8995136ad29e..502d7099085c 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -258,6 +258,7 @@ struct iris_platform_data {
>  	const struct tz_cp_config *tz_cp_config_data;
>  	u32 tz_cp_config_data_size;
>  	u32 core_arch;
> +	bool dual_core;
>  	u32 hw_response_timeout;
>  	struct ubwc_config_data *ubwc_config;
>  	u32 num_vpp_pipe;
> diff --git a/drivers/media/platform/qcom/iris/iris_power.c b/drivers/media/platform/qcom/iris/iris_power.c
> index 91aa21d4070e..b72ce5b596b8 100644
> --- a/drivers/media/platform/qcom/iris/iris_power.c
> +++ b/drivers/media/platform/qcom/iris/iris_power.c
> @@ -77,9 +77,9 @@ static int iris_vote_interconnects(struct iris_inst *inst)
>  
>  static int iris_set_clocks(struct iris_inst *inst)
>  {
> +	u64 vcodec0_freq = 0, vcodec1_freq = 0;
>  	struct iris_core *core = inst->core;
>  	struct iris_inst *instance;
> -	u64 freq = 0;
>  	int ret;
>  
>  	mutex_lock(&core->lock);
> @@ -87,11 +87,14 @@ static int iris_set_clocks(struct iris_inst *inst)
>  		if (!instance->max_input_data_size)
>  			continue;
>  
> -		freq += instance->power.min_freq;
> +		if (instance->core_id == IRIS_VCODEC0)
> +			vcodec0_freq += instance->power.min_freq;
> +		else
> +			vcodec1_freq += instance->power.min_freq;
>  	}
>  
> -	core->power.clk_freq = freq;
> -	ret = iris_opp_set_rate(core->dev, freq);
> +	core->power.clk_freq = max(vcodec0_freq, vcodec1_freq);
> +	ret = iris_opp_set_rate(core->dev, core->power.clk_freq);
>  	mutex_unlock(&core->lock);
>  
>  	return ret;
> diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
> index cfc5b576ec56..da8a89d3dd41 100644
> --- a/drivers/media/platform/qcom/iris/iris_utils.c
> +++ b/drivers/media/platform/qcom/iris/iris_utils.c
> @@ -90,40 +90,79 @@ struct iris_inst *iris_get_instance(struct iris_core *core, u32 session_id)
>  	return NULL;
>  }
>  
> -int iris_check_core_mbpf(struct iris_inst *inst)
> +static u32 iris_get_mbps(struct iris_inst *inst)
>  {
> -	struct iris_core *core = inst->core;
> +	u32 fps = max(inst->frame_rate, inst->operating_rate);
> +
> +	return iris_get_mbpf(inst) * fps;
> +}
> +
> +static int iris_check_and_assign_core(struct iris_inst *inst, bool mbpf)
> +{
> +	const struct iris_platform_data *platform_data = inst->core->iris_platform_data;
> +	u32 max_load = mbpf ? platform_data->max_core_mbpf : platform_data->max_core_mbps;
> +	u32 max_session_cnt = platform_data->max_session_count;
> +	u32 core0_session_cnt = 0, core1_session_cnt = 0;
> +	bool dual_core = platform_data->dual_core;

num_cores

> +	u32 core0_load = 0, core1_load = 0;
> +	bool select_core0, select_core1;
>  	struct iris_inst *instance;
> -	u32 total_mbpf = 0;
> +	u32 load, new_load;
>  
> -	mutex_lock(&core->lock);
> -	list_for_each_entry(instance, &core->instances, list)
> -		total_mbpf += iris_get_mbpf(instance);
> -	mutex_unlock(&core->lock);
> +	inst->core_id = 0;
>  
> -	if (total_mbpf > core->iris_platform_data->max_core_mbpf)
> +	list_for_each_entry(instance, &inst->core->instances, list) {
> +		load = mbpf ? iris_get_mbpf(instance) : iris_get_mbps(instance);
> +
> +		if (instance->core_id == IRIS_VCODEC0) {
> +			core0_load += load;
> +			core0_session_cnt++;
> +		} else if (instance->core_id == IRIS_VCODEC1) {
> +			core1_load += load;
> +			core1_session_cnt++;

Arrays, please.

> +		}
> +	}
> +
> +	new_load = mbpf ? iris_get_mbpf(inst) : iris_get_mbps(inst);
> +
> +	select_core0 = core0_load + new_load <= max_load && core0_session_cnt < max_session_cnt;
> +	select_core1 = dual_core && core1_load + new_load <= max_load &&
> +		     core1_session_cnt < max_session_cnt;
> +
> +	if (select_core0 && select_core1)
> +		inst->core_id = (core0_load <= core1_load) ? IRIS_VCODEC0 : IRIS_VCODEC1;
> +	else if (select_core0)
> +		inst->core_id = IRIS_VCODEC0;
> +	else if (select_core1)
> +		inst->core_id = IRIS_VCODEC1;
> +	else
>  		return -ENOMEM;
>  
>  	return 0;
>  }
>  
> -int iris_check_core_mbps(struct iris_inst *inst)
> +int iris_check_core_mbpf(struct iris_inst *inst)
>  {
>  	struct iris_core *core = inst->core;
> -	struct iris_inst *instance;
> -	u32 total_mbps = 0, fps = 0;
> +	int ret;
>  
>  	mutex_lock(&core->lock);
> -	list_for_each_entry(instance, &core->instances, list) {
> -		fps = max(instance->frame_rate, instance->operating_rate);
> -		total_mbps += iris_get_mbpf(instance) * fps;
> -	}
> +	ret = iris_check_and_assign_core(inst, true);
>  	mutex_unlock(&core->lock);
>  
> -	if (total_mbps > core->iris_platform_data->max_core_mbps)
> -		return -ENOMEM;
> +	return ret;
> +}
>  
> -	return 0;
> +int iris_check_core_mbps(struct iris_inst *inst)
> +{
> +	struct iris_core *core = inst->core;
> +	int ret;
> +
> +	mutex_lock(&core->lock);
> +	ret = iris_check_and_assign_core(inst, false);
> +	mutex_unlock(&core->lock);
> +
> +	return ret;
>  }
>  
>  bool is_rotation_90_or_270(struct iris_inst *inst)
> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
> index bf0b8400996e..5a05f7d65501 100644
> --- a/drivers/media/platform/qcom/iris/iris_vb2.c
> +++ b/drivers/media/platform/qcom/iris/iris_vb2.c
> @@ -176,6 +176,10 @@ int iris_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
>  	if (ret)
>  		goto error;
>  
> +	ret = iris_set_core_id(inst);
> +	if (ret)
> +		goto error;
> +
>  	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
>  		if (inst->domain == DECODER)
>  			ret = iris_vdec_streamon_input(inst);
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
> index 5eb1786b0737..a1ce3cd524a3 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -41,16 +41,20 @@ static void iris_v4l2_fh_deinit(struct iris_inst *inst, struct file *filp)
>  
>  static void iris_add_session(struct iris_inst *inst)
>  {
> +	u32 max_session_count = inst->core->iris_platform_data->max_session_count;
>  	struct iris_core *core = inst->core;
>  	struct iris_inst *iter;
>  	u32 count = 0;
>  
> +	if (inst->core->iris_platform_data->dual_core)
> +		max_session_count *= 2;

max_session_count *= num_cores.

> +
>  	mutex_lock(&core->lock);
>  
>  	list_for_each_entry(iter, &core->instances, list)
>  		count++;
>  
> -	if (count < core->iris_platform_data->max_session_count)
> +	if (count < max_session_count)
>  		list_add_tail(&inst->list, &core->instances);
>  
>  	mutex_unlock(&core->lock);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

