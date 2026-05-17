Return-Path: <linux-media+bounces-61862-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFR1O5T/CWqqvwQAu9opvQ
	(envelope-from <linux-media+bounces-61862-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 19:49:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D37B9562C68
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 19:49:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0B3D9300515E
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 17:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61B513CBE7E;
	Sun, 17 May 2026 17:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZAx3RNV9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V6NIYEwz"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C544A3CAE7D
	for <linux-media@vger.kernel.org>; Sun, 17 May 2026 17:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779040132; cv=none; b=pJFis93tMttePqRoS8VZJUqHtaLoOTu/wCbAjlbNFwmjA5MtU+fbYBQ7EXvZLMBjKeUy30INEawJFl5EKFIOz70OMD8FEzZ1Sw/BLhZlHfuRLJSwdcncWjOw6NoUAFnghWnfqgs7s5baG4his44585egjCJii7qFLa5CgIVS9DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779040132; c=relaxed/simple;
	bh=LH31HdscTScQYadkTVUyNbrfZEMAWXcUK9ZjS2AH6/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HAsQySQOeAe0tCBD+RuuxxZrE1SU9irMgKFPnzPW8Hc0XroNjd/YeRaJwoIztNYE31A9N/IAIQBBt6pTGveaJo90uhJBl75sLucgBfUt61EQcBGGKxwaA7gNAOt+tFKIaes7E03I5CDAy/1JLroR44jezyT8qCjeGdYuj4wjVOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZAx3RNV9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V6NIYEwz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64GJi2oS120053
	for <linux-media@vger.kernel.org>; Sun, 17 May 2026 17:48:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lpHY7oihfb3amRFxiPEd1m3a
	03YdGFnYGYRDDtzyi7M=; b=ZAx3RNV97QNDaeDPBm0eQJO93jOxwpMPGzb/TJah
	dqsXoFDz51gjgpaSU8N7Qzp+AUA2My/19D6jWfO4UdtlZMVXDiUakPU1Ou3UfRaz
	ezSxF5WpCIwrtk0hinjywm2KTy9ROpY892QaKlyHKuaSAPGfH2J36oRJZA5cC9GC
	l0MsRguIRvO7luEi7zN1PiUnz7iddvoYHEr18Nn/7+tkGp3xaLi1kBJPfVqVfX1I
	tnwFwth+FR6U4sMg7cpfckuxWhhE0ko3IlG6rAfQo0QcygceqSX/l51jCphWDY6X
	vMlkZWddo7/fLJ/oFbO23EFnxIIiULneRW5J2nvgs+UpAA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gwmbatt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 17 May 2026 17:48:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-90fb1490e2cso404429685a.2
        for <linux-media@vger.kernel.org>; Sun, 17 May 2026 10:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779040127; x=1779644927; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lpHY7oihfb3amRFxiPEd1m3a03YdGFnYGYRDDtzyi7M=;
        b=V6NIYEwz9NvzjEcbllGkLk/HclKJdR85CukSlw2AUcSGSK8ANIOkQ1ZPl+MYzlLW/j
         5w+NQgn3eZVLc4/9bd4/bIBFz2yRUpBgu4TUUQFR5Xi2ioCbU0YdSh5pSSwyqS3o6eTS
         bsECC9znCWMPUX66+nqx7wVducKfd03lTmOxh2XhDdlwmRpWunyxMdEIHuSqLP/a6AnH
         kOTpx0+lYFSv5fHmdjJakztWB2XbdRZPFkLtC1RMmLBm2XFuO86U1V6+R0Z6bsZSeXWJ
         X5W91IxsEsZ9SetFuFxJKeGb04EMZlEqDlqcQUhe2Jx4SpSvZ5c8fTtSb8xcaTcSEDNT
         xSAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779040127; x=1779644927;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lpHY7oihfb3amRFxiPEd1m3a03YdGFnYGYRDDtzyi7M=;
        b=iR8svcSwMvf9emZyw+CHlPh/tPN+1NYw30NOn0+DMAvg3jNxPm6k5c71tomPdpdFSn
         ghNoMMNXLcf4dpmAw6ejm16OHwUc9JqP36bIEX8E5jgpC2YFdngnLW3hypzsbuXjaWDe
         ZzPemnV61j2k9SiLFUW18tOdZNKrDAQEtHPB1OoQqUOEthKr8U4LnTxKpUzk/08RRgM2
         xz2ha/an+tWj8fFvpFHwRs/SZuA/ps5IfcZt4CoupUxGq/o4/flpCK/f6BURQBsQNc62
         hgiC6x/JoP1IAG1D6iemjMeHk5iEN0X5vRnPSTOkEjdky8fzQeM36VXr61Ha7a4wuOlQ
         Euzw==
X-Forwarded-Encrypted: i=1; AFNElJ8nKR0SdOp+pZ1zRoZ2kiGbPePkfGx4h0zpdek8OGmvd1RrLXbM5+V7TJ0C4cERJbR787uTSu9X5g/FrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwX2xfmlvvgjnG1wZ20WwpeG6W8gYM563Wi63pvSky223fqU6L
	7Z9VrshtvmozaTVke9s5UiV1+bHo5fVaLykwyEqq6PiXAlTYAAoYSGLS8wgxdSNKLTGQF7VigH4
	BOGoEwFQUtmXD1XSFsfnwMHTiZvNBOrzp5nY3Fz8suXccYA4YRpnfhIFyvbM9EoMpmg==
X-Gm-Gg: Acq92OFV4fvfjERtkPGPQGBTPG8TL9shoERvKDRU/K2bwoKhiQdg3bmzHxsuiKg0KBf
	UmfjFxlryw3GHy5oztN+uuGZF2czIe0pQBCppLfkef8HJUk0VPoJJBQ4VQNQ/26+pdETIp/D3+k
	SnV6J5sb90c7CDfgmGUAL6fS2CjuLqkk24R748hABAQJLIu1PGTo8Osljckk4YYWQlUKIXv0sLr
	CFkVsSxkKYOK9JroY3fKSL/aUTvCMpSBW6qMUobLVH/gH46uNFAhvRyqEB6vVvmpTQmYQGacq6M
	kE76/p61czADBmoINEI8UzIzWu6uv0LVJOze0jREDPWq6eqnd42PwuCKnE6eDmiJ8rVWuViIyzd
	EPeb0mHdopI9UvTMGHOYmIS48hTyK2KsWYxOifjT8/yuDsAJCEN+doz0p+3v0MtxmV782AHhP6c
	rjbKdvYgvQmw2y2WpB6YF6h70pA4BDyc1+Kj0=
X-Received: by 2002:a05:620a:2685:b0:908:e262:52c3 with SMTP id af79cd13be357-911cef034cdmr1880918685a.46.1779040127343;
        Sun, 17 May 2026 10:48:47 -0700 (PDT)
X-Received: by 2002:a05:620a:2685:b0:908:e262:52c3 with SMTP id af79cd13be357-911cef034cdmr1880915585a.46.1779040126788;
        Sun, 17 May 2026 10:48:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c797sm2804811e87.8.2026.05.17.10.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 10:48:45 -0700 (PDT)
Date: Sun, 17 May 2026 20:48:43 +0300
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
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 09/14] media: iris: Use power domain type to look up
 pd_devs index
Message-ID: <bh6g3vne2cnknvpeus3fmwjgyqk4ngstdn5fkvju72rd23lqey@ip2gt4hoqqmd>
References: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
 <20260515-glymur-v6-9-f6a99cb43a24@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515-glymur-v6-9-f6a99cb43a24@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 9RaY6V_MbjAgvSz01PwWonv4zf0HkFCi
X-Proofpoint-GUID: 9RaY6V_MbjAgvSz01PwWonv4zf0HkFCi
X-Authority-Analysis: v=2.4 cv=W/AIkxWk c=1 sm=1 tr=0 ts=6a09ff7f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=wVukXIzjBZceI6JPWPsA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE5MiBTYWx0ZWRfX0QWiJ5n6a8mI
 dLqxquLZ+xOxcv31EuGAhQAzkytnIVqF+O0P/9uEffhUH5xpkEAyAENs373yqUpmL8QbeSORUfw
 OHeHJ7+yuzVKeBRYHGlFIsUdiq5/aBReRfeJWfYyLVwP0d7rbLQFeYukVGlGkWcPO/v+nhfSTuL
 CCGOnS/J/qTuzso3dMCOiVWORLPAaxEOoEgFjtMyvH6KgJ6wqaHU0KosAb+nJ6LAfjkkFY+nSJU
 hdkL6d/Q2QNVUjbL7s+HYELVyrsd08QeOrjmaNou6tRFBjDzxLf9GLIEU/6UthkuEagFV8XtQ3w
 wjyeLOclqQW8huVXxt94eRxRst6d0J8AoeWFOQnZPfHRtnPo/qSigvo1pNNouiMzaCks0kfYUnv
 oIGkBg79CfZhpxk87t0qojyoxYUJ8wJbgJSVChfn7qIZLiRGiMcusZHyUlUkNwUooqHe889hXvc
 f22R7/H2sW/ZNo5f47Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170192
X-Rspamd-Queue-Id: D37B9562C68
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61862-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,linaro.org,gmail.com,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 04:51:24PM +0530, Vishnu Reddy wrote:
> The pmdomain_tbl was a array of strings holding only the power domain
> names. Callers had to pass a pd_devs[] pointer indexed directly by the
> platform_pm_domain_type enum value to iris_enable_power_domains() and
> iris_disable_power_domains().
> 
> A future platform may need to introduce a new enum value that aliases
> an existing one (e.g. IRIS_VCODEC1_POWER_DOMAIN aliasing the
> IRIS_VPP0_HW_POWER_DOMAIN on Glymur), which would break the assumption
> that enum values map 1:1 to pd_devs[] indices.
> 
> To fix this, replace the string array with a new struct platform_pd_data
> that pairs each power domain name with its platform_pm_domain_type. Add
> a helper iris_get_pd_index_by_type() that walks this table and returns
> the correct pd_devs[] index for a given type.
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
>  .../media/platform/qcom/iris/iris_platform_vpu2.c  | 18 +++++---
>  .../media/platform/qcom/iris/iris_platform_vpu3x.c | 24 ++++++----
>  drivers/media/platform/qcom/iris/iris_probe.c      |  4 +-
>  drivers/media/platform/qcom/iris/iris_resources.c  | 43 +++++++++++++++++-
>  drivers/media/platform/qcom/iris/iris_resources.h  |  6 ++-
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      |  7 ++-
>  drivers/media/platform/qcom/iris/iris_vpu4x.c      | 52 ++++++++--------------
>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 23 +++++-----
>  9 files changed, 115 insertions(+), 71 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 07cc0ce25b84..1d757cb8e9e1 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -70,6 +70,12 @@ struct platform_clk_data {
>  	const char *clk_name;
>  };
>  
> +struct platform_pd_data {
> +	enum platform_pm_domain_type *pd_types;
> +	const char * const *pd_names;
> +	u32 pd_count;
> +};
> +
>  struct tz_cp_config {
>  	u32 cp_start;
>  	u32 cp_size;
> @@ -270,8 +276,7 @@ struct iris_platform_data {
>  	unsigned int icc_tbl_size;
>  	const struct bw_info *bw_tbl_dec;
>  	unsigned int bw_tbl_dec_size;
> -	const char * const *pmdomain_tbl;
> -	unsigned int pmdomain_tbl_size;
> +	const struct platform_pd_data *pmdomain_tbl;
>  	const char * const *opp_pd_tbl;
>  	unsigned int opp_pd_tbl_size;
>  	const struct platform_clk_data *clk_tbl;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> index 41986af8313b..bcf873829fd3 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> @@ -62,7 +62,17 @@ static const struct icc_info iris_icc_info_vpu2[] = {
>  
>  static const char * const iris_clk_reset_table_vpu2[] = { "bus", "core" };
>  
> -static const char * const iris_pmdomain_table_vpu2[] = { "venus", "vcodec0" };
> +static const struct platform_pd_data iris_pmdomain_table_vpu2 = {
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

I still don't think it is a good idea. You are using these lookup and
indirection to make _platform_ code take care about _platform_
specifics by the price of complicating the core and the core structures.

Instead it looks like it's time to push power domain handling to
platform code and then hopefully drop all IRIS_foo_POWER_DOMAIN enums.

I'm pretty sure that the clocks would also need to follow that approach.
There should be no need to bother the core code to introduce the
platform-specific clock type. It all needs to be handled in the
platform callback and platform-specific data structures.

>  
>  static const struct tz_cp_config tz_cp_config_vpu2[] = {
>  	{
> 

-- 
With best wishes
Dmitry

