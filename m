Return-Path: <linux-media+bounces-60974-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHZ9JJBL/mllowAAu9opvQ
	(envelope-from <linux-media+bounces-60974-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 22:46:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F35544FB9B8
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 22:46:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E35C3067967
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 20:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50A8E41B34C;
	Fri,  8 May 2026 20:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GN3hF0OX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MnFaw7oL"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36BC41B36A
	for <linux-media@vger.kernel.org>; Fri,  8 May 2026 20:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778273063; cv=none; b=HyJHqCfrTVsR7EPWBwhsnOe2rj4p+n6Z6Q26J9lAdOkdors4lOvViH8lXyEjPTMHSatDWMiZGhaU6OFZlFq03OE0PndsZyIp/BNejA14tpEWJx4i0s6D42TkwQqyJFQoK/vm6z78LvvL34DxrDGAeB7odlD1F19T4IRoPDEtRCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778273063; c=relaxed/simple;
	bh=xXBXLALnQQpqIelGpaQ2A2ZXv69kEOo6bLBLRaf0CrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bH6v4LBvKXrzYUoEMrYEejgAUVrRrmSE1WgaGzHl7dRIfZskPkrxno6xTeQnff/f5Mbrdc1fzp6xQa5zDUuXHGVwLB0rI1lWBt8Q+yMdKjyeqsL2wCUpD+xMnWhU87S+qnSM61ViwPR65A51ytlMU7P8OM9to8tgV3ABMVNH8Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GN3hF0OX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MnFaw7oL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648JiKuE852123
	for <linux-media@vger.kernel.org>; Fri, 8 May 2026 20:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HQ4XC0WgCiVUN3vXF0uBzg+A
	WrS/4icMyVTQbw3jZcI=; b=GN3hF0OXrueqoS0k8acV31IwAGzpA6xqsp3YP1vI
	LtaCse5XUUmBy+mB4dkL2rV5vvInJuBsSoOILzyteLA1YE7AdIcidHqAXj7layf6
	3At9brAbNuUZ1/lHHrGfGYekc0zFMMObZg/x8+drW3JiyAsuln6urCzowpjVcOZj
	FNm7Sv9bQplh4La8g5mz7l9FhU8pcsS+unBKhYiPp+9puhYZJ0bY6fNYvgPU02pl
	qOc0oRJo0jcJvecI3c1huE4hxD6iXwZVbG1fNhG707vtpqlcRFmap+vTb78TXF7D
	OgYpvdWwAYRd3Zkb5X8SQImqcV00GsAcPRqDGkxV+k2UrA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1fpthvkw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 08 May 2026 20:44:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fb6d713ddso41568931cf.1
        for <linux-media@vger.kernel.org>; Fri, 08 May 2026 13:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778273059; x=1778877859; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HQ4XC0WgCiVUN3vXF0uBzg+AWrS/4icMyVTQbw3jZcI=;
        b=MnFaw7oLoe26wsB9ZeHowVRf2OZngd9nJktIKdoVZWa9WFemQ2WNvEHD4zS3457a9f
         RwOyu72yFokXjoCoiE4f5IO46l1yExIJmJ74rwJjRW/I/fv0RYm7KdZSkxwg9TUs1cQy
         vXscBH1oSUHkMjNWd3SavsMS/44YXfp9UHWF9H7lxyew574w+msmc1d2siVS/j/RptrW
         6gEt/YY+l/Jxx5B0FOEzeeIRMx8XTvPDHNFHlnoXqZePYvo3RVBe+9HATs4/NIVDP6bn
         Ar+sbXQP33lyqOKa8d7nvU+tlYmr91AacvRA15U1uJQSqynHcbYYO5hwg5JMj2rjpuq6
         Q7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778273059; x=1778877859;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HQ4XC0WgCiVUN3vXF0uBzg+AWrS/4icMyVTQbw3jZcI=;
        b=o21idIFqBikCD9n0syfiNyQiSbwIZlRLui1pQZl3tW4sa1OX04zXGd70UQjK7Wfdxr
         6IZ0IeyO+JavfzVe3pFBoqEtxE0M46+KUoK8kezMtMLdP+BM2kTJ6BuyTul4b44fWUmC
         I5ITPtdkAgMxBmpZbg2qRe39d09rvvETFKE47BIhXgTGSpzVCffOokPMkGAMf6vhtoqz
         IE+J4wAe8wRvPkwos0Czz2xH2VA5AQSd5JdrK5clQPFGz5AMr/AlWmIEcJysCQZcRSOm
         NGmip/o+gm/puo1sVf8tMttmTFA3lIx0Q8IpZ+p6JvM8v/G+oZHmnGsDudYyypuOumRf
         PhiQ==
X-Forwarded-Encrypted: i=1; AFNElJ/fv8Q/f4sFRhJfg+za15T8p2rKMaKml8tUCdf1AeSRQBjTwxzE5wf2nZlIIqbRePcFmRr2vlhduG2PnA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxR3I4J9ogr8yhYw2BND1bpOGsZLYHZgldghGbfQHOH+ugZf8Aj
	g+DADdBqerQH5/o+Jdb/zghIvgh3naHghh49B55ituvbgFtc4fY7X1D0ejqSlozcrsuwgAaMe5A
	fb6CxIvH+6qYW3oGPzYwbLePuBZ+TDXIuwabwq7hND7420Rvxz3nsWR0+zXmPs7Dyiw==
X-Gm-Gg: AeBDietZC8Uy822KFUwVyVy3bbRrTMq5IiTT/9VhVHzSamODrh5tow5v7NoVjkXreU4
	Js/d7en+vEAL4qMAUaaI2FLS2faaVqF4b3peu0G8mz5dY7GpwHFLKanDAwcCRatKsd+Rd/X63Ti
	WE11zxeOtU7rUb4Z6nVj77K9BbZr7DJu43DCWKuTmsn8RAs0q4eycLFn0cU7sHyf0hxZ9u3tibT
	FZMjMZNtwDEO9Or04bPyNc0c0wj7RQPlNe9KirqodH/ldcsgIsHXrZDkXdu0JAQr8eKxWhe+Nrm
	zW8FnF9hKAa052I1WMhz7gndoebGRrHDtQDnRUs0pin3x/a1G8GqXo+eUW4JBUlGUJvE+Z9Ws6B
	aMhLZRc4tPKrsMMvifvgFXGqzvpMYBycWSVyhpWOL3XdqzLThr9nfD9hHklwJjgEiDZ9T642rPS
	1B3mfIfn81bwUItr7Mof5WQXlIJ6yzrhrTdHE=
X-Received: by 2002:a05:622a:620a:b0:50f:783d:fbf9 with SMTP id d75a77b69052e-514621c7782mr198775151cf.49.1778273058817;
        Fri, 08 May 2026 13:44:18 -0700 (PDT)
X-Received: by 2002:a05:622a:620a:b0:50f:783d:fbf9 with SMTP id d75a77b69052e-514621c7782mr198774501cf.49.1778273058201;
        Fri, 08 May 2026 13:44:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a956b1efsm781085e87.75.2026.05.08.13.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 13:44:16 -0700 (PDT)
Date: Fri, 8 May 2026 23:44:14 +0300
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
Subject: Re: [PATCH v5 09/14] media: iris: Use power domain type to look up
 pd_devs index
Message-ID: <pkd26h6alzddoky4bfnc3ljwlgxoodcyjo6blreuourlkg7mdl@qkg2jtdcjh7m>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-9-7fbb340c5dbd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509-glymur-v5-9-7fbb340c5dbd@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: TDuIpfP9EBF6yDw27BjjIVm2BsE0wigA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDIwNSBTYWx0ZWRfX30pHgZOZnUN8
 +vbYG0WmzNjNAzJ+GNj4z1pbnMSrSmQ6JwRxQfy8j0dIUFwGmIRxO0EG0dzaFqTfdnXXT0nuozL
 vqXHxirV5CGsDyhtGfx+td1OGwHQPlWdQC22bwgRHIMseYzWaWNTkU8TwfQf9/bFhGi0BaFkFfd
 xP1dFTFp+0UlNZgFLSlIP7R74PxWPX68xGcMprxyGQxZG6OrVh/EV6p96uujaxpR4PX0tPAA0o8
 AOiMsryRkw5Lajo4dzU3wHP0Ou+C+OPIpenmxmj5ZV1aDfOSoNWQbXyHCU2ngku3m/Fy42L2Txi
 mNrKA+DCyfMpOnRs6nF5q3BB6iVDC6QKly6EQBOIyRvZo8su6fkn+6El6EH/1kIbTwhkh8+MNi8
 YoDN1hFXg06OR8WR30moy1Q1VhBgpeCO91ZJi0rgdNB319g19Ya7XQ4sWfrHiHFvX5tDzjCi0Oz
 6X0YmdwImTmByKqLx+Q==
X-Proofpoint-GUID: TDuIpfP9EBF6yDw27BjjIVm2BsE0wigA
X-Authority-Analysis: v=2.4 cv=IYi3n2qa c=1 sm=1 tr=0 ts=69fe4b23 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=QKxl4C4cXmFcUc4JAxgA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080205
X-Rspamd-Queue-Id: F35544FB9B8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60974-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sat, May 09, 2026 at 12:29:58AM +0530, Vishnu Reddy wrote:
> The pmdomain_tbl was a array of strings holding only the power domain
> names. Callers had to pass a pd_devs[] pointer indexed directly by the
> platform_pm_domain_type enum value to iris_enable_power_domains() and
> iris_disable_power_domains().
> 
> A future platform may need to introduce a new enum value that aliases
> an existing one (e.g. IRIS_VCODEC1_POWER_DOMAIN aliasing the
> IRIS_VPP0_HW_POWER_DOMAIN on Glymur), which would break the assumption

Why do they alias so? Or what do you mean by aliasing? Why VCODEC1 is
the same as VPP0? Do you mean that the index in DT would match?

> that enum values map 1:1 to pd_devs[] indices.
> 
> To fix this, replace the string array with a new struct platform_pd_data
> that pairs each power domain name with its platform_pm_domain_type. Add
> a helper iris_get_pd_index_by_type() that walks this table and returns
> the correct pd_devs[] index for a given type.

This looks like leaking too many platform details into the
not-so-generic code.

> 
> Update iris_enable_power_domains() and iris_disable_power_domains()
> to accept a platform_pm_domain_type instead of a struct device pointer.
> They now call the helper internally to resolve the index, removing the
> need for callers to do the index lookup themselves.
> 
> This prepares the driver for adding new platforms where power domain enum
> values cannot be used directly as pd_devs[] indices.
> 
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  .../platform/qcom/iris/iris_platform_common.h      |  9 +++-
>  .../media/platform/qcom/iris/iris_platform_gen1.c  | 18 +++++---
>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 24 ++++++----
>  drivers/media/platform/qcom/iris/iris_probe.c      |  4 +-
>  drivers/media/platform/qcom/iris/iris_resources.c  | 43 +++++++++++++++++-
>  drivers/media/platform/qcom/iris/iris_resources.h  |  6 ++-
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      |  7 ++-
>  drivers/media/platform/qcom/iris/iris_vpu4x.c      | 52 ++++++++--------------
>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 23 +++++-----
>  9 files changed, 115 insertions(+), 71 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 30e9d4d288c6..7d59e6364e9d 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -212,6 +212,12 @@ enum platform_pm_domain_type {
>  	IRIS_APV_HW_POWER_DOMAIN,
>  };
>  
> +struct platform_pd_data {
> +	enum platform_pm_domain_type *pd_types;
> +	const char **pd_names;
> +	u32 pd_count;
> +};
> +
>  struct iris_platform_data {
>  	void (*init_hfi_command_ops)(struct iris_core *core);
>  	void (*init_hfi_response_ops)(struct iris_core *core);
> @@ -225,8 +231,7 @@ struct iris_platform_data {
>  	unsigned int icc_tbl_size;
>  	const struct bw_info *bw_tbl_dec;
>  	unsigned int bw_tbl_dec_size;
> -	const char * const *pmdomain_tbl;
> -	unsigned int pmdomain_tbl_size;
> +	const struct platform_pd_data *pmdomain_tbl;
>  	const char * const *opp_pd_tbl;
>  	unsigned int opp_pd_tbl_size;
>  	const struct platform_clk_data *clk_tbl;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> index be6a631f8ede..0ec73783bc10 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> @@ -279,7 +279,17 @@ static const struct bw_info sm8250_bw_table_dec[] = {
>  	{ ((1920 * 1080) / 256) * 30,  416000 },
>  };
>  
> -static const char * const sm8250_pmdomain_table[] = { "venus", "vcodec0" };
> +static const struct platform_pd_data sm8250_pmdomain_table = {
> +	.pd_types = (enum platform_pm_domain_type []) {
> +		IRIS_CTRL_POWER_DOMAIN,
> +		IRIS_VCODEC_POWER_DOMAIN,
> +	},
> +	.pd_names = (const char *[]) {
> +		"venus",
> +		"vcodec0",
> +	},
> +	.pd_count = 2,
> +};
>  
>  static const char * const sm8250_opp_pd_table[] = { "mx" };
>  
> @@ -350,8 +360,7 @@ const struct iris_platform_data sm8250_data = {
>  	.clk_rst_tbl_size = ARRAY_SIZE(sm8250_clk_reset_table),
>  	.bw_tbl_dec = sm8250_bw_table_dec,
>  	.bw_tbl_dec_size = ARRAY_SIZE(sm8250_bw_table_dec),
> -	.pmdomain_tbl = sm8250_pmdomain_table,
> -	.pmdomain_tbl_size = ARRAY_SIZE(sm8250_pmdomain_table),
> +	.pmdomain_tbl = &sm8250_pmdomain_table,
>  	.opp_pd_tbl = sm8250_opp_pd_table,
>  	.opp_pd_tbl_size = ARRAY_SIZE(sm8250_opp_pd_table),
>  	.clk_tbl = sm8250_clk_table,
> @@ -403,8 +412,7 @@ const struct iris_platform_data sc7280_data = {
>  	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
>  	.bw_tbl_dec = sc7280_bw_table_dec,
>  	.bw_tbl_dec_size = ARRAY_SIZE(sc7280_bw_table_dec),
> -	.pmdomain_tbl = sm8250_pmdomain_table,
> -	.pmdomain_tbl_size = ARRAY_SIZE(sm8250_pmdomain_table),
> +	.pmdomain_tbl = &sm8250_pmdomain_table,
>  	.opp_pd_tbl = sc7280_opp_pd_table,
>  	.opp_pd_tbl_size = ARRAY_SIZE(sc7280_opp_pd_table),
>  	.clk_tbl = sc7280_clk_table,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 47c6b650f0b4..5862c89a4971 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -775,7 +775,17 @@ static const struct bw_info sm8550_bw_table_dec[] = {
>  	{ ((1920 * 1080) / 256) * 30,  294000 },
>  };
>  
> -static const char * const sm8550_pmdomain_table[] = { "venus", "vcodec0" };
> +static const struct platform_pd_data sm8550_pmdomain_table = {
> +	.pd_types = (enum platform_pm_domain_type []) {
> +		IRIS_CTRL_POWER_DOMAIN,
> +		IRIS_VCODEC_POWER_DOMAIN,
> +	},
> +	.pd_names = (const char *[]) {
> +		"venus",
> +		"vcodec0",
> +	},
> +	.pd_count = 2,
> +};
>  
>  static const char * const sm8550_opp_pd_table[] = { "mxc", "mmcx" };
>  
> @@ -934,8 +944,7 @@ const struct iris_platform_data sm8550_data = {
>  	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
>  	.bw_tbl_dec = sm8550_bw_table_dec,
>  	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
> -	.pmdomain_tbl = sm8550_pmdomain_table,
> -	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
> +	.pmdomain_tbl = &sm8550_pmdomain_table,
>  	.opp_pd_tbl = sm8550_opp_pd_table,
>  	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
>  	.clk_tbl = sm8550_clk_table,
> @@ -1039,8 +1048,7 @@ const struct iris_platform_data sm8650_data = {
>  	.controller_rst_tbl_size = ARRAY_SIZE(sm8650_controller_reset_table),
>  	.bw_tbl_dec = sm8550_bw_table_dec,
>  	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
> -	.pmdomain_tbl = sm8550_pmdomain_table,
> -	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
> +	.pmdomain_tbl = &sm8550_pmdomain_table,
>  	.opp_pd_tbl = sm8550_opp_pd_table,
>  	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
>  	.clk_tbl = sm8550_clk_table,
> @@ -1135,8 +1143,7 @@ const struct iris_platform_data sm8750_data = {
>  	.clk_rst_tbl_size = ARRAY_SIZE(sm8750_clk_reset_table),
>  	.bw_tbl_dec = sm8550_bw_table_dec,
>  	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
> -	.pmdomain_tbl = sm8550_pmdomain_table,
> -	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
> +	.pmdomain_tbl = &sm8550_pmdomain_table,
>  	.opp_pd_tbl = sm8550_opp_pd_table,
>  	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
>  	.clk_tbl = sm8750_clk_table,
> @@ -1235,8 +1242,7 @@ const struct iris_platform_data qcs8300_data = {
>  	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
>  	.bw_tbl_dec = sm8550_bw_table_dec,
>  	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
> -	.pmdomain_tbl = sm8550_pmdomain_table,
> -	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
> +	.pmdomain_tbl = &sm8550_pmdomain_table,
>  	.opp_pd_tbl = sm8550_opp_pd_table,
>  	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
>  	.clk_tbl = sm8550_clk_table,
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index 34751912f871..34c981be9bc1 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -43,8 +43,8 @@ static int iris_init_power_domains(struct iris_core *core)
>  	int ret;
>  
>  	struct dev_pm_domain_attach_data iris_pd_data = {
> -		.pd_names = core->iris_platform_data->pmdomain_tbl,
> -		.num_pd_names = core->iris_platform_data->pmdomain_tbl_size,
> +		.pd_names = core->iris_platform_data->pmdomain_tbl->pd_names,
> +		.num_pd_names = core->iris_platform_data->pmdomain_tbl->pd_count,
>  		.pd_flags = PD_FLAG_NO_DEV_LINK,
>  	};
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
> index 773f6548370a..cc61dc038598 100644
> --- a/drivers/media/platform/qcom/iris/iris_resources.c
> +++ b/drivers/media/platform/qcom/iris/iris_resources.c
> @@ -70,10 +70,42 @@ int iris_opp_set_rate(struct device *dev, unsigned long freq)
>  	return dev_pm_opp_set_opp(dev, opp);
>  }
>  
> -int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev)
> +static int iris_get_pd_index_by_type(struct iris_core *core, enum platform_pm_domain_type pd_type)
>  {
> +	const struct platform_pd_data *pd_tbl;
> +	u32 i;
> +
> +	pd_tbl = core->iris_platform_data->pmdomain_tbl;
> +
> +	for (i = 0; i < pd_tbl->pd_count; i++) {
> +		if (pd_tbl->pd_types[i] == pd_type)
> +			return i;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +int iris_genpd_set_hwmode(struct iris_core *core, enum platform_pm_domain_type pd_type, bool hwmode)
> +{
> +	int pd_index = iris_get_pd_index_by_type(core, pd_type);
> +
> +	if (pd_index < 0)
> +		return pd_index;
> +
> +	return dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[pd_index], hwmode);
> +}
> +
> +int iris_enable_power_domains(struct iris_core *core, enum platform_pm_domain_type pd_type)
> +{
> +	int pd_index = iris_get_pd_index_by_type(core, pd_type);
> +	struct device *pd_dev;
>  	int ret;
>  
> +	if (pd_index < 0)
> +		return pd_index;
> +
> +	pd_dev = core->pmdomain_tbl->pd_devs[pd_index];
> +

As you are touching this code... It looks like the original intent of
this function was to enable all power domains in a single run (thus it
has the iris_opp_set_rate() call. Now we are are calling this function
multiple times and still setting the clock rate to the max all the
times. Please break it down, so that we bump the OPP performance point
only once, before the first bump of the power domains. Another option
would be to restore the behaviour and enable all domains at once.

>  	ret = iris_opp_set_rate(core->dev, ULONG_MAX);
>  	if (ret)
>  		return ret;
> @@ -85,10 +117,17 @@ int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev)
>  	return ret;
>  }
>  
> -int iris_disable_power_domains(struct iris_core *core, struct device *pd_dev)
> +int iris_disable_power_domains(struct iris_core *core, enum platform_pm_domain_type pd_type)

The same here.

>  {
> +	int pd_index = iris_get_pd_index_by_type(core, pd_type);
> +	struct device *pd_dev;
>  	int ret;
>  
> +	if (pd_index < 0)
> +		return pd_index;
> +
> +	pd_dev = core->pmdomain_tbl->pd_devs[pd_index];
> +
>  	ret = iris_opp_set_rate(core->dev, 0);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/media/platform/qcom/iris/iris_resources.h b/drivers/media/platform/qcom/iris/iris_resources.h
> index 6bfbd2dc6db0..d5692e4694b1 100644
> --- a/drivers/media/platform/qcom/iris/iris_resources.h
> +++ b/drivers/media/platform/qcom/iris/iris_resources.h
> @@ -9,11 +9,13 @@
>  struct iris_core;
>  
>  int iris_opp_set_rate(struct device *dev, unsigned long freq);
> -int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev);
> -int iris_disable_power_domains(struct iris_core *core, struct device *pd_dev);
> +int iris_enable_power_domains(struct iris_core *core, enum platform_pm_domain_type pd_type);
> +int iris_disable_power_domains(struct iris_core *core, enum platform_pm_domain_type pd_type);
>  int iris_unset_icc_bw(struct iris_core *core);
>  int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw);
>  int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type clk_type);
>  int iris_prepare_enable_clock(struct iris_core *core, enum platform_clk_type clk_type);
> +int iris_genpd_set_hwmode(struct iris_core *core, enum platform_pm_domain_type pd_type,
> +			  bool hwmode);
>  
>  #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> index 834194cb5513..13fbb21c2182 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> @@ -208,7 +208,7 @@ static int iris_vpu33_power_off_controller(struct iris_core *core)
>  	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
>  
>  disable_power:
> -	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
> +	iris_disable_power_domains(core, IRIS_CTRL_POWER_DOMAIN);
>  	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
>  
>  	return 0;
> @@ -218,8 +218,7 @@ static int iris_vpu35_power_on_hw(struct iris_core *core)
>  {
>  	int ret;
>  
> -	ret = iris_enable_power_domains(core,
> -					core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
> +	ret = iris_enable_power_domains(core, IRIS_VCODEC_POWER_DOMAIN);
>  	if (ret)
>  		return ret;
>  
> @@ -242,7 +241,7 @@ static int iris_vpu35_power_on_hw(struct iris_core *core)
>  err_disable_axi_clk:
>  	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
>  err_disable_power:
> -	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
> +	iris_disable_power_domains(core, IRIS_VCODEC_POWER_DOMAIN);
>  
>  	return ret;
>  }
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/media/platform/qcom/iris/iris_vpu4x.c
> index 92c0b06bbbff..bf7ad4e7cb8a 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
> @@ -27,28 +27,24 @@ static int iris_vpu4x_genpd_set_hwmode(struct iris_core *core, bool hw_mode, u32
>  {
>  	int ret;
>  
> -	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN],
> -				      hw_mode);
> +	ret = iris_genpd_set_hwmode(core, IRIS_VCODEC_POWER_DOMAIN, hw_mode);
>  	if (ret)
>  		return ret;
>  
>  	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT)) {
> -		ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs
> -					      [IRIS_VPP0_HW_POWER_DOMAIN], hw_mode);
> +		ret = iris_genpd_set_hwmode(core, IRIS_VPP0_HW_POWER_DOMAIN, hw_mode);
>  		if (ret)
>  			goto restore_hw_domain_mode;
>  	}
>  
>  	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT)) {
> -		ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs
> -					      [IRIS_VPP1_HW_POWER_DOMAIN], hw_mode);
> +		ret = iris_genpd_set_hwmode(core, IRIS_VPP1_HW_POWER_DOMAIN, hw_mode);
>  		if (ret)
>  			goto restore_vpp0_domain_mode;
>  	}
>  
>  	if (!(efuse_value & DISABLE_VIDEO_APV_BIT)) {
> -		ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs
> -					      [IRIS_APV_HW_POWER_DOMAIN], hw_mode);
> +		ret = iris_genpd_set_hwmode(core, IRIS_APV_HW_POWER_DOMAIN, hw_mode);
>  		if (ret)
>  			goto restore_vpp1_domain_mode;
>  	}
> @@ -57,14 +53,12 @@ static int iris_vpu4x_genpd_set_hwmode(struct iris_core *core, bool hw_mode, u32
>  
>  restore_vpp1_domain_mode:
>  	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT))
> -		dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VPP1_HW_POWER_DOMAIN],
> -					!hw_mode);
> +		iris_genpd_set_hwmode(core, IRIS_VPP1_HW_POWER_DOMAIN, !hw_mode);
>  restore_vpp0_domain_mode:
>  	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT))
> -		dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VPP0_HW_POWER_DOMAIN],
> -					!hw_mode);
> +		iris_genpd_set_hwmode(core, IRIS_VPP0_HW_POWER_DOMAIN, !hw_mode);
>  restore_hw_domain_mode:
> -	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN], !hw_mode);
> +	iris_genpd_set_hwmode(core, IRIS_VCODEC_POWER_DOMAIN, !hw_mode);
>  
>  	return ret;
>  }
> @@ -73,8 +67,7 @@ static int iris_vpu4x_power_on_apv(struct iris_core *core)
>  {
>  	int ret;
>  
> -	ret = iris_enable_power_domains(core,
> -					core->pmdomain_tbl->pd_devs[IRIS_APV_HW_POWER_DOMAIN]);
> +	ret = iris_enable_power_domains(core, IRIS_APV_HW_POWER_DOMAIN);
>  	if (ret)
>  		return ret;
>  
> @@ -85,7 +78,7 @@ static int iris_vpu4x_power_on_apv(struct iris_core *core)
>  	return 0;
>  
>  disable_apv_hw_power_domain:
> -	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_APV_HW_POWER_DOMAIN]);
> +	iris_disable_power_domains(core, IRIS_APV_HW_POWER_DOMAIN);
>  
>  	return ret;
>  }
> @@ -140,7 +133,7 @@ static void iris_vpu4x_power_off_apv(struct iris_core *core)
>  
>  disable_clocks_and_power:
>  	iris_disable_unprepare_clock(core, IRIS_APV_HW_CLK);
> -	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_APV_HW_POWER_DOMAIN]);
> +	iris_disable_power_domains(core, IRIS_APV_HW_POWER_DOMAIN);
>  }
>  
>  static void iris_vpu4x_ahb_sync_reset_apv(struct iris_core *core)
> @@ -227,21 +220,18 @@ static int iris_vpu4x_power_on_hardware(struct iris_core *core)
>  	u32 efuse_value = readl(core->reg_base + WRAPPER_EFUSE_MONITOR);
>  	int ret;
>  
> -	ret = iris_enable_power_domains(core,
> -					core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
> +	ret = iris_enable_power_domains(core, IRIS_VCODEC_POWER_DOMAIN);
>  	if (ret)
>  		return ret;
>  
>  	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT)) {
> -		ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs
> -						[IRIS_VPP0_HW_POWER_DOMAIN]);
> +		ret = iris_enable_power_domains(core, IRIS_VPP0_HW_POWER_DOMAIN);
>  		if (ret)
>  			goto disable_hw_power_domain;
>  	}
>  
>  	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT)) {
> -		ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs
> -						[IRIS_VPP1_HW_POWER_DOMAIN]);
> +		ret = iris_enable_power_domains(core, IRIS_VPP1_HW_POWER_DOMAIN);
>  		if (ret)
>  			goto disable_vpp0_power_domain;
>  	}
> @@ -262,14 +252,12 @@ static int iris_vpu4x_power_on_hardware(struct iris_core *core)
>  	iris_vpu4x_disable_hardware_clocks(core, efuse_value);
>  disable_vpp1_power_domain:
>  	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT))
> -		iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs
> -						[IRIS_VPP1_HW_POWER_DOMAIN]);
> +		iris_disable_power_domains(core, IRIS_VPP1_HW_POWER_DOMAIN);
>  disable_vpp0_power_domain:
>  	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT))
> -		iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs
> -						[IRIS_VPP0_HW_POWER_DOMAIN]);
> +		iris_disable_power_domains(core, IRIS_VPP0_HW_POWER_DOMAIN);
>  disable_hw_power_domain:
> -	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
> +	iris_disable_power_domains(core, IRIS_VCODEC_POWER_DOMAIN);
>  
>  	return ret;
>  }
> @@ -340,14 +328,12 @@ static void iris_vpu4x_power_off_hardware(struct iris_core *core)
>  	iris_vpu4x_disable_hardware_clocks(core, efuse_value);
>  
>  	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT))
> -		iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs
> -					   [IRIS_VPP1_HW_POWER_DOMAIN]);
> +		iris_disable_power_domains(core, IRIS_VPP1_HW_POWER_DOMAIN);
>  
>  	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT))
> -		iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs
> -					   [IRIS_VPP0_HW_POWER_DOMAIN]);
> +		iris_disable_power_domains(core, IRIS_VPP0_HW_POWER_DOMAIN);
>  
> -	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
> +	iris_disable_power_domains(core, IRIS_VCODEC_POWER_DOMAIN);
>  }
>  
>  static int iris_vpu4x_set_hwmode(struct iris_core *core)
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index 73c094bc4311..2593c04decb0 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -214,15 +214,15 @@ int iris_vpu_power_off_controller(struct iris_core *core)
>  	iris_disable_unprepare_clock(core, IRIS_AHB_CLK);
>  	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
>  	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
> -	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
> +	iris_disable_power_domains(core, IRIS_CTRL_POWER_DOMAIN);
>  
>  	return 0;
>  }
>  
>  void iris_vpu_power_off_hw(struct iris_core *core)
>  {
> -	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN], false);
> -	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
> +	iris_genpd_set_hwmode(core, IRIS_VCODEC_POWER_DOMAIN, false);
> +	iris_disable_power_domains(core, IRIS_VCODEC_POWER_DOMAIN);
>  	iris_disable_unprepare_clock(core, IRIS_VCODEC_AHB_CLK);
>  	iris_disable_unprepare_clock(core, IRIS_VCODEC_CLK);
>  }
> @@ -243,7 +243,7 @@ int iris_vpu_power_on_controller(struct iris_core *core)
>  	u32 rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
>  	int ret;
>  
> -	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
> +	ret = iris_enable_power_domains(core, IRIS_CTRL_POWER_DOMAIN);
>  	if (ret)
>  		return ret;
>  
> @@ -270,7 +270,7 @@ int iris_vpu_power_on_controller(struct iris_core *core)
>  err_disable_axi_clock:
>  	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
>  err_disable_power:
> -	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
> +	iris_disable_power_domains(core, IRIS_CTRL_POWER_DOMAIN);
>  
>  	return ret;
>  }
> @@ -279,8 +279,7 @@ int iris_vpu_power_on_hw(struct iris_core *core)
>  {
>  	int ret;
>  
> -	ret = iris_enable_power_domains(core,
> -					core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
> +	ret = iris_enable_power_domains(core, IRIS_VCODEC_POWER_DOMAIN);
>  	if (ret)
>  		return ret;
>  
> @@ -297,14 +296,14 @@ int iris_vpu_power_on_hw(struct iris_core *core)
>  err_disable_hw_clock:
>  	iris_disable_unprepare_clock(core, IRIS_VCODEC_CLK);
>  err_disable_power:
> -	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
> +	iris_disable_power_domains(core, IRIS_VCODEC_POWER_DOMAIN);
>  
>  	return ret;
>  }
>  
>  int iris_vpu_set_hwmode(struct iris_core *core)
>  {
> -	return dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN], true);
> +	return iris_genpd_set_hwmode(core, IRIS_VCODEC_POWER_DOMAIN, true);
>  }
>  
>  int iris_vpu_switch_to_hwmode(struct iris_core *core)
> @@ -369,7 +368,7 @@ int iris_vpu35_vpu4x_power_off_controller(struct iris_core *core)
>  	iris_disable_unprepare_clock(core, IRIS_CTRL_FREERUN_CLK);
>  	iris_disable_unprepare_clock(core, IRIS_AXI_CTRL_CLK);
>  
> -	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
> +	iris_disable_power_domains(core, IRIS_CTRL_POWER_DOMAIN);
>  
>  	reset_control_bulk_reset(clk_rst_tbl_size, core->resets);
>  
> @@ -380,7 +379,7 @@ int iris_vpu35_vpu4x_power_on_controller(struct iris_core *core)
>  {
>  	int ret;
>  
> -	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
> +	ret = iris_enable_power_domains(core, IRIS_CTRL_POWER_DOMAIN);
>  	if (ret)
>  		return ret;
>  
> @@ -403,7 +402,7 @@ int iris_vpu35_vpu4x_power_on_controller(struct iris_core *core)
>  err_disable_axi1_clk:
>  	iris_disable_unprepare_clock(core, IRIS_AXI_CTRL_CLK);
>  err_disable_power:
> -	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
> +	iris_disable_power_domains(core, IRIS_CTRL_POWER_DOMAIN);
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

