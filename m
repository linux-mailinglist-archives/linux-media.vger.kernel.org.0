Return-Path: <linux-media+bounces-58706-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eL5kKJDi3WnrkgkAu9opvQ
	(envelope-from <linux-media+bounces-58706-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 08:45:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E943F6312
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 08:45:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A7A3305DA67
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 06:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35EAC36F429;
	Tue, 14 Apr 2026 06:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ASFrB9Zj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PZnbzTBb"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74BF36E495
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 06:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776148740; cv=none; b=ZFdHEBpFRYsd/4bTQ2omwO3HGc9vZLW0EHSmMXtL8qgwSKXIBwK9U5SqhCIZ90UCgQj4Z7/tTIA3g8nanBBxKaXjUACS4aJL/MaEjDY7wRWYBbzDagwN8okE56R2c+SW3G38Cepjg5Jevq7cphxL6JI8goS0Xua/CE8CyZyGyRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776148740; c=relaxed/simple;
	bh=DtbGk7k4Mht1v+X/oA64yyN7ZpSmiywmjOZx+/x00Zw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B1xWXZGU0a15TosgMAP31uCzjHVtwsN5i07cjNYV2Z9XQnc3Qwi0QnmkNTqdA8eJPgZpbx0VniPVqxCV3azQxG8C5DZCK/Rw8RO6wQeYzlC3vwwQokgjZMwSRoA/RO6OePDF/Pg4nuB3HfamENGogFk0JDg84RUIEYahdt01tP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ASFrB9Zj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PZnbzTBb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6XLfb3681515
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 06:38:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wA7ItPVNJyk9xUMa9WVh9ZNh
	UhHR+dQxj0+bgCPDySs=; b=ASFrB9ZjHkwxa+VnkkIKUFiNr49M/8eozLaLXmyp
	pVxN4DgCfylWqyuP8EARamVAgIAFc8MuVxokzcInuV+zECO68wi/o3nM8VJcmTbK
	dc/pgqSl55utLJTg75BzUaU1+d5xHDwiIDF7PPyKlWEjsSdF14gSPPvpM457u5+i
	7bZefu1o34+SKtxshAdpXCunFM77GYBP0EZc/mpNfcd4yB7jMkXsxDzxYGmteyfk
	srb2M7iZ6kLBnYnDIOtOU6KUtrvcvgtFfuccR2DvtSH4PWDYPg//iAG5sz4CkBcC
	2Spfceh22DQU+lfRDYFO5ToKs8fcm/nY9PgL6Z3kfhp/Dw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh87d1c4b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 06:38:57 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c7422397574so6062352a12.0
        for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 23:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776148737; x=1776753537; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wA7ItPVNJyk9xUMa9WVh9ZNhUhHR+dQxj0+bgCPDySs=;
        b=PZnbzTBb49rpJIjQ3HD+m2NBXWvQ+He9buRz2cWBYCITEwAt+X0khQKIX2xWSeO5HB
         rKWZ+1ul1WYrhs8lQDA81UcKqMPUxvSYwu76dvpQRLx2YcYEKFQGZYbj3kKfpwkSK8KJ
         euVdCH4Pu0BT96jJtgNCBvPFBpb84amYilcMhXc0ksStp7YZutOipRYOc7IMVdEaubQV
         p/bnuyeH5vrZMlrLqOlGziBg/KYqk0fP+yAI9wHHhOnwWnJtXk9pP6tg8Wf04wpBnLZ4
         fgL3nKR9HoxxK/4LiGB3wD8AUOMoj9knoNgeBfhcf++7ihFQNNnLD4DD7Mve83vK58J0
         7UEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776148737; x=1776753537;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wA7ItPVNJyk9xUMa9WVh9ZNhUhHR+dQxj0+bgCPDySs=;
        b=FOqpKDvXvsdoQSFf0YY9iMPz2eU7DiBfGBZJWfE0DYU1qjWZmftCZBuhQp9B6oj7oR
         U1Jf9C1uUIlekeJUraWqI8u765sHFkfPkYUgJP1LfgzCqIlX4OwbYPPNOqNeoqxyzIWe
         8R4kyk2l6XKYNJlIovi2sCypSaI0f7E8lMR/WkrYgsidT5+i+IfXAL8x2eAG/yun+2VT
         15bXo5TlclD69Wf4i0IHhIFFLQH/cq4nl4FRfqeGBbc9Gw1UFEGKnlAqioYYvZH7pH8H
         Tg3etfxQDSFP6OiuY2W4aJZLKNfhIK0recQmIIfI3xfktE6G7Y4N+ULf0vAoksyModJE
         aJbA==
X-Forwarded-Encrypted: i=1; AFNElJ9OZC/sBQnYi1jnu3Crei5a0LsqcCFjW2823y8ZPni+zKxhtZJnL7PF7UkrkN+Qt307JOpkcjj+qCD5iw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYdRtQabuVOSQMafQNf99N6aT+0KmjzZrgParn3G98Lemjjwc3
	/TjUBLAnlmaDJFEEGLq0cWQBaHkUuXEixDksV4AMNhSix95o0N+qK2hngmpsIj/LAmDFMABlIJ9
	/IMHUTePE0OnYh5jJrFz8k6EBll3i9KHEkSNjgApJbl+hxx1DDVQDuNXZM3ptTgldkg==
X-Gm-Gg: AeBDieuOqFzDQ4AQDJEhH9LR8G/1UAHySjonsUYN69Iirq+bXo8daTpeRUBtw5espum
	4hkF/fGFwBi8/o07ebf3Xs9y0NVMV+gi1xjAdaRlErp2DVmQQuvURxLIiH/WAYCdrM/DDxpXJ27
	pZkhVJ2GBK+o9OEearXqsN5ZH9oh8PFbq9+DdIFHdCpxRTC03XMCsYxeNmM/Dc83+YQvkWO6rko
	CvDjsG3jjSLkP5QIWgEvJuem5gZyb8RpHEU7OyuCUgSadeA5lr6ArfIlteht9wWlNqdxG02Mjmk
	Up3yj1BVFSl5YNVldskXH87RCRPiBIJYqCtiNnd7n2cQpMVUrvegpJ4b55TEMXHZVszE3gPC3Yl
	06dzqyCviEh7zP3aH2Jj5h+WxeK0cEdAQWxc+Wskss1OIlDFn
X-Received: by 2002:a05:6a00:399c:b0:82d:2086:de2a with SMTP id d2e1a72fcca58-82f0c2a761emr17590632b3a.35.1776148736565;
        Mon, 13 Apr 2026 23:38:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:399c:b0:82d:2086:de2a with SMTP id d2e1a72fcca58-82f0c2a761emr17590579b3a.35.1776148735877;
        Mon, 13 Apr 2026 23:38:55 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0f8a7501sm13379162b3a.50.2026.04.13.23.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 23:38:55 -0700 (PDT)
Date: Tue, 14 Apr 2026 12:08:46 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [PATCH 07/11] media: iris: Rename clock and power domain macros
 to use vcodec prefix
Message-ID: <20260414063846.fixumrttkfqwydch@hu-mojha-hyd.qualcomm.com>
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-7-7d3d1cf57b16@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414-glymur-v1-7-7d3d1cf57b16@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA2MCBTYWx0ZWRfXzPOuaqC3IP49
 tfgHGqBCk4kFrxXt5CpoARATiEelF+aFeSb79kIGeG5Ia/Rq95e0EeZNutuKvJm9epMeq7fI4bt
 v6IhnhuU3lcHiHGr4lzOcetXfQL1rpGxKsBIFKZrCOUOLg6i2zHULkLklbPMtk0Nveh19L1Xged
 olCZasEIDEJZmZJFNRBHcLqfDo/n6pOcXgs2JDiRm1giODJ5GSjN35lU0FL1WlDwKt7bxcdZJtI
 LvuSkBlHYOuBokKzN5L/PrrWLtUjHRYBKjmnyQnNwF/Z9ZrBrdZYIZSsjHryFY1i32/Yz4mtZHW
 npygdiQurKVC5seE37acorcO68WgRrr1BU0Nn3luEXF96Jh+H/6NwrlNJMzT7jzbxpsj5c7lupw
 hEFaQfb+bIBuM2UgFGcmJ5AWcifBNl5fChTRfKl36LfrMcpsZgFNA5f/cKzyrZlLQysnzxt77A5
 1B1MT+1d13DguK1F/UQ==
X-Authority-Analysis: v=2.4 cv=N+8Z0W9B c=1 sm=1 tr=0 ts=69dde101 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=JHE2Tk9p9Fz13fLrjUoA:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: bxnMm5ymlb3GFhohlH6N_bMv6AGcR9ys
X-Proofpoint-ORIG-GUID: bxnMm5ymlb3GFhohlH6N_bMv6AGcR9ys
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140060
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58706-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hu-mojha-hyd.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D8E943F6312
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 10:30:03AM +0530, Vishnu Reddy wrote:
> The current clock and power domain enum names are too generic. Rename
> them with a vcodec prefix to make the names more meaningful and to easily
> accommodate vcodec1 enums for the secondary core in the following patches.

patches ?

> 
> This patch only renames the macros and does not introduce any functional
> changes.

"this patch" or "patches" are not preferred.. write the commit text in
imperative mood..

> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  .../platform/qcom/iris/iris_platform_common.h      | 12 ++++----
>  .../media/platform/qcom/iris/iris_platform_gen1.c  |  6 ++--
>  .../media/platform/qcom/iris/iris_platform_gen2.c  |  6 ++--
>  .../platform/qcom/iris/iris_platform_sc7280.h      | 10 +++----
>  .../platform/qcom/iris/iris_platform_sm8750.h      | 12 ++++----
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 25 ++++++++--------
>  drivers/media/platform/qcom/iris/iris_vpu4x.c      | 30 ++++++++++---------
>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 35 +++++++++++-----------
>  8 files changed, 70 insertions(+), 66 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 55ff6137d9a9..30e9d4d288c6 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -49,14 +49,14 @@ extern const struct iris_platform_data sm8650_data;
>  extern const struct iris_platform_data sm8750_data;
>  
>  enum platform_clk_type {
> -	IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI clocks */
> +	IRIS_AXI_VCODEC_CLK,
>  	IRIS_CTRL_CLK,
>  	IRIS_AHB_CLK,
> -	IRIS_HW_CLK,
> -	IRIS_HW_AHB_CLK,
> -	IRIS_AXI1_CLK,
> +	IRIS_VCODEC_CLK,
> +	IRIS_VCODEC_AHB_CLK,
> +	IRIS_AXI_CTRL_CLK,
>  	IRIS_CTRL_FREERUN_CLK,
> -	IRIS_HW_FREERUN_CLK,
> +	IRIS_VCODEC_FREERUN_CLK,
>  	IRIS_BSE_HW_CLK,
>  	IRIS_VPP0_HW_CLK,
>  	IRIS_VPP1_HW_CLK,
> @@ -206,7 +206,7 @@ struct icc_vote_data {
>  
>  enum platform_pm_domain_type {
>  	IRIS_CTRL_POWER_DOMAIN,
> -	IRIS_HW_POWER_DOMAIN,
> +	IRIS_VCODEC_POWER_DOMAIN,
>  	IRIS_VPP0_HW_POWER_DOMAIN,
>  	IRIS_VPP1_HW_POWER_DOMAIN,
>  	IRIS_APV_HW_POWER_DOMAIN,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> index df8e6bf9430e..be6a631f8ede 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> @@ -284,9 +284,9 @@ static const char * const sm8250_pmdomain_table[] = { "venus", "vcodec0" };
>  static const char * const sm8250_opp_pd_table[] = { "mx" };
>  
>  static const struct platform_clk_data sm8250_clk_table[] = {
> -	{IRIS_AXI_CLK,  "iface"        },
> -	{IRIS_CTRL_CLK, "core"         },
> -	{IRIS_HW_CLK,   "vcodec0_core" },
> +	{IRIS_AXI_VCODEC_CLK,	"iface"		},
> +	{IRIS_CTRL_CLK,		"core"		},
> +	{IRIS_VCODEC_CLK,	"vcodec0_core"	},
>  };
>  
>  static const char * const sm8250_opp_clk_table[] = {
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 5da90d47f9c6..47c6b650f0b4 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -780,9 +780,9 @@ static const char * const sm8550_pmdomain_table[] = { "venus", "vcodec0" };
>  static const char * const sm8550_opp_pd_table[] = { "mxc", "mmcx" };
>  
>  static const struct platform_clk_data sm8550_clk_table[] = {
> -	{IRIS_AXI_CLK,  "iface"        },
> -	{IRIS_CTRL_CLK, "core"         },
> -	{IRIS_HW_CLK,   "vcodec0_core" },
> +	{IRIS_AXI_VCODEC_CLK,	"iface"		},
> +	{IRIS_CTRL_CLK,		"core"		},
> +	{IRIS_VCODEC_CLK,	"vcodec0_core"	},
>  };
>  
>  static const char * const sm8550_opp_clk_table[] = {
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sc7280.h b/drivers/media/platform/qcom/iris/iris_platform_sc7280.h
> index 0ec8f334df67..6b783e524b81 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_sc7280.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sc7280.h
> @@ -16,11 +16,11 @@ static const struct bw_info sc7280_bw_table_dec[] = {
>  static const char * const sc7280_opp_pd_table[] = { "cx" };
>  
>  static const struct platform_clk_data sc7280_clk_table[] = {
> -	{IRIS_CTRL_CLK,    "core"         },
> -	{IRIS_AXI_CLK,     "iface"        },
> -	{IRIS_AHB_CLK,     "bus"          },
> -	{IRIS_HW_CLK,      "vcodec_core"  },
> -	{IRIS_HW_AHB_CLK,  "vcodec_bus"   },
> +	{IRIS_CTRL_CLK,		"core"		},
> +	{IRIS_AXI_VCODEC_CLK,	"iface"		},
> +	{IRIS_AHB_CLK,		"bus"		},
> +	{IRIS_VCODEC_CLK,	"vcodec_core"	},
> +	{IRIS_VCODEC_AHB_CLK,	"vcodec_bus"	},
>  };
>  
>  static const char * const sc7280_opp_clk_table[] = {
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8750.h b/drivers/media/platform/qcom/iris/iris_platform_sm8750.h
> index 719056656a5b..f843f13251c5 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8750.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8750.h
> @@ -11,12 +11,12 @@ static const char * const sm8750_clk_reset_table[] = {
>  };
>  
>  static const struct platform_clk_data sm8750_clk_table[] = {
> -	{IRIS_AXI_CLK,		"iface"			},
> -	{IRIS_CTRL_CLK,		"core"			},
> -	{IRIS_HW_CLK,		"vcodec0_core"		},
> -	{IRIS_AXI1_CLK,		"iface1"		},
> -	{IRIS_CTRL_FREERUN_CLK,	"core_freerun"		},
> -	{IRIS_HW_FREERUN_CLK,	"vcodec0_core_freerun"	},
> +	{IRIS_AXI_VCODEC_CLK,		"iface"			},
> +	{IRIS_CTRL_CLK,			"core"			},
> +	{IRIS_VCODEC_CLK,		"vcodec0_core"		},
> +	{IRIS_AXI_CTRL_CLK,		"iface1"		},
> +	{IRIS_CTRL_FREERUN_CLK,		"core_freerun"		},
> +	{IRIS_VCODEC_FREERUN_CLK,	"vcodec0_core_freerun"	},
>  };
>  
>  #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> index fe4423b951b1..1f0a3a47d87f 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> @@ -209,7 +209,7 @@ static int iris_vpu33_power_off_controller(struct iris_core *core)
>  
>  disable_power:
>  	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
> -	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
>  
>  	return 0;
>  }
> @@ -218,36 +218,37 @@ static int iris_vpu35_power_on_hw(struct iris_core *core)
>  {
>  	int ret;
>  
> -	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
> +	ret = iris_enable_power_domains(core,
> +					core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
>  	if (ret)
>  		return ret;
>  
> -	ret = iris_prepare_enable_clock(core, IRIS_AXI_CLK);
> +	ret = iris_prepare_enable_clock(core, IRIS_AXI_VCODEC_CLK);
>  	if (ret)
>  		goto err_disable_power;
>  
> -	ret = iris_prepare_enable_clock(core, IRIS_HW_FREERUN_CLK);
> +	ret = iris_prepare_enable_clock(core, IRIS_VCODEC_FREERUN_CLK);
>  	if (ret)
>  		goto err_disable_axi_clk;
>  
> -	ret = iris_prepare_enable_clock(core, IRIS_HW_CLK);
> +	ret = iris_prepare_enable_clock(core, IRIS_VCODEC_CLK);
>  	if (ret)
>  		goto err_disable_hw_free_clk;
>  
> -	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
> +	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN], true);
>  	if (ret)
>  		goto err_disable_hw_clk;
>  
>  	return 0;
>  
>  err_disable_hw_clk:
> -	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_VCODEC_CLK);
>  err_disable_hw_free_clk:
> -	iris_disable_unprepare_clock(core, IRIS_HW_FREERUN_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_VCODEC_FREERUN_CLK);
>  err_disable_axi_clk:
> -	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
>  err_disable_power:
> -	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
> +	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
>  
>  	return ret;
>  }
> @@ -256,8 +257,8 @@ static void iris_vpu35_power_off_hw(struct iris_core *core)
>  {
>  	iris_vpu33_power_off_hardware(core);
>  
> -	iris_disable_unprepare_clock(core, IRIS_HW_FREERUN_CLK);
> -	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_VCODEC_FREERUN_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
>  }
>  
>  const struct vpu_ops iris_vpu3_ops = {
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/media/platform/qcom/iris/iris_vpu4x.c
> index a8db02ce5c5e..4082d331d2f3 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
> @@ -27,7 +27,8 @@ static int iris_vpu4x_genpd_set_hwmode(struct iris_core *core, bool hw_mode, u32
>  {
>  	int ret;
>  
> -	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], hw_mode);
> +	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN],
> +				      hw_mode);
>  	if (ret)
>  		return ret;
>  
> @@ -63,7 +64,7 @@ static int iris_vpu4x_genpd_set_hwmode(struct iris_core *core, bool hw_mode, u32
>  		dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VPP0_HW_POWER_DOMAIN],
>  					!hw_mode);
>  restore_hw_domain_mode:
> -	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], !hw_mode);
> +	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN], !hw_mode);
>  
>  	return ret;
>  }
> @@ -162,15 +163,15 @@ static int iris_vpu4x_enable_hardware_clocks(struct iris_core *core, u32 efuse_v
>  {
>  	int ret;
>  
> -	ret = iris_prepare_enable_clock(core, IRIS_AXI_CLK);
> +	ret = iris_prepare_enable_clock(core, IRIS_AXI_VCODEC_CLK);
>  	if (ret)
>  		return ret;
>  
> -	ret = iris_prepare_enable_clock(core, IRIS_HW_FREERUN_CLK);
> +	ret = iris_prepare_enable_clock(core, IRIS_VCODEC_FREERUN_CLK);
>  	if (ret)
>  		goto disable_axi_clock;
>  
> -	ret = iris_prepare_enable_clock(core, IRIS_HW_CLK);
> +	ret = iris_prepare_enable_clock(core, IRIS_VCODEC_CLK);
>  	if (ret)
>  		goto disable_hw_free_run_clock;
>  
> @@ -198,11 +199,11 @@ static int iris_vpu4x_enable_hardware_clocks(struct iris_core *core, u32 efuse_v
>  disable_bse_hw_clock:
>  	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
>  disable_hw_clock:
> -	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_VCODEC_CLK);
>  disable_hw_free_run_clock:
> -	iris_disable_unprepare_clock(core, IRIS_HW_FREERUN_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_VCODEC_FREERUN_CLK);
>  disable_axi_clock:
> -	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
>  
>  	return ret;
>  }
> @@ -216,9 +217,9 @@ static void iris_vpu4x_disable_hardware_clocks(struct iris_core *core, u32 efuse
>  		iris_disable_unprepare_clock(core, IRIS_VPP0_HW_CLK);
>  
>  	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
> -	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
> -	iris_disable_unprepare_clock(core, IRIS_HW_FREERUN_CLK);
> -	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_VCODEC_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_VCODEC_FREERUN_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
>  }
>  
>  static int iris_vpu4x_power_on_hardware(struct iris_core *core)
> @@ -226,7 +227,8 @@ static int iris_vpu4x_power_on_hardware(struct iris_core *core)
>  	u32 efuse_value = readl(core->reg_base + WRAPPER_EFUSE_MONITOR);
>  	int ret;
>  
> -	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
> +	ret = iris_enable_power_domains(core,
> +					core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
>  	if (ret)
>  		return ret;
>  
> @@ -278,7 +280,7 @@ static int iris_vpu4x_power_on_hardware(struct iris_core *core)
>  		iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs
>  						[IRIS_VPP0_HW_POWER_DOMAIN]);
>  disable_hw_power_domain:
> -	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
> +	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
>  
>  	return ret;
>  }
> @@ -356,7 +358,7 @@ static void iris_vpu4x_power_off_hardware(struct iris_core *core)
>  		iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs
>  					   [IRIS_VPP0_HW_POWER_DOMAIN]);
>  
> -	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
> +	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
>  }
>  
>  const struct vpu_ops iris_vpu4x_ops = {
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index bfd1e762c38e..006fd3ffc752 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -213,7 +213,7 @@ int iris_vpu_power_off_controller(struct iris_core *core)
>  disable_power:
>  	iris_disable_unprepare_clock(core, IRIS_AHB_CLK);
>  	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
> -	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
>  	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
>  
>  	return 0;
> @@ -221,10 +221,10 @@ int iris_vpu_power_off_controller(struct iris_core *core)
>  
>  void iris_vpu_power_off_hw(struct iris_core *core)
>  {
> -	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], false);
> -	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
> -	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
> -	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
> +	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN], false);
> +	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
> +	iris_disable_unprepare_clock(core, IRIS_VCODEC_AHB_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_VCODEC_CLK);
>  }
>  
>  void iris_vpu_power_off(struct iris_core *core)
> @@ -251,7 +251,7 @@ int iris_vpu_power_on_controller(struct iris_core *core)
>  	if (ret)
>  		goto err_disable_power;
>  
> -	ret = iris_prepare_enable_clock(core, IRIS_AXI_CLK);
> +	ret = iris_prepare_enable_clock(core, IRIS_AXI_VCODEC_CLK);
>  	if (ret)
>  		goto err_disable_power;
>  
> @@ -268,7 +268,7 @@ int iris_vpu_power_on_controller(struct iris_core *core)
>  err_disable_ctrl_clock:
>  	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
>  err_disable_axi_clock:
> -	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
>  err_disable_power:
>  	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
>  
> @@ -279,30 +279,31 @@ int iris_vpu_power_on_hw(struct iris_core *core)
>  {
>  	int ret;
>  
> -	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
> +	ret = iris_enable_power_domains(core,
> +					core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
>  	if (ret)
>  		return ret;
>  
> -	ret = iris_prepare_enable_clock(core, IRIS_HW_CLK);
> +	ret = iris_prepare_enable_clock(core, IRIS_VCODEC_CLK);
>  	if (ret)
>  		goto err_disable_power;
>  
> -	ret = iris_prepare_enable_clock(core, IRIS_HW_AHB_CLK);
> +	ret = iris_prepare_enable_clock(core, IRIS_VCODEC_AHB_CLK);
>  	if (ret && ret != -ENOENT)
>  		goto err_disable_hw_clock;
>  
> -	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
> +	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN], true);
>  	if (ret)
>  		goto err_disable_hw_ahb_clock;
>  
>  	return 0;
>  
>  err_disable_hw_ahb_clock:
> -	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_VCODEC_AHB_CLK);
>  err_disable_hw_clock:
> -	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_VCODEC_CLK);
>  err_disable_power:
> -	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
> +	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
>  
>  	return ret;
>  }
> @@ -362,7 +363,7 @@ int iris_vpu35_vpu4x_power_off_controller(struct iris_core *core)
>  disable_power:
>  	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
>  	iris_disable_unprepare_clock(core, IRIS_CTRL_FREERUN_CLK);
> -	iris_disable_unprepare_clock(core, IRIS_AXI1_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_AXI_CTRL_CLK);
>  
>  	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
>  
> @@ -379,7 +380,7 @@ int iris_vpu35_vpu4x_power_on_controller(struct iris_core *core)
>  	if (ret)
>  		return ret;
>  
> -	ret = iris_prepare_enable_clock(core, IRIS_AXI1_CLK);
> +	ret = iris_prepare_enable_clock(core, IRIS_AXI_CTRL_CLK);
>  	if (ret)
>  		goto err_disable_power;
>  
> @@ -396,7 +397,7 @@ int iris_vpu35_vpu4x_power_on_controller(struct iris_core *core)
>  err_disable_ctrl_free_clk:
>  	iris_disable_unprepare_clock(core, IRIS_CTRL_FREERUN_CLK);
>  err_disable_axi1_clk:
> -	iris_disable_unprepare_clock(core, IRIS_AXI1_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_AXI_CTRL_CLK);
>  err_disable_power:
>  	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
>  
> 
> -- 
> 2.34.1
> 

-- 
-Mukesh Ojha

