Return-Path: <linux-media+bounces-61493-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFF5JqjDBGoxNwIAu9opvQ
	(envelope-from <linux-media+bounces-61493-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 20:32:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B32D538FB9
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 20:32:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1CC5A3082B34
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 18:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEC0A3A75B7;
	Wed, 13 May 2026 18:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HW+HhnP+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LdT7ZP0d"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4F93921D0
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 18:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778696761; cv=none; b=GJJk17nTu6q39RGv48f0xbLIVNz/29lhxWMN91RHJG2tHuLnRYiatCHC/w9VVbj5Zt6ZbSYHyIk6U11dflwupHUpVkA8JuptV5Z0GPrlM0nJ1+PngmIeXluwUlWBiNYdHDGNEMUAvYYyrq6YwoWaCWrPBPBpYNLdXDwYfCaCFKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778696761; c=relaxed/simple;
	bh=7rnvyRlJhuUqIb2oFq7ELJ1mpCOYsn/9XpIh0Ol9Ujc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kA4iFYGYVZbA/rmN9kdZDVsOGI3AN6rtx3xbaPl5ku+ZeeXie683uHXTk2NfDwqlldywKehiQydDpW66jxNdXssG6QXSUQ1XYxFjAToBHehcS3lJXYhjOTptoeSCV9oSV/sLQ6bCm+NHpXQaJiOK0OTWG1Mt1guCCBJZO7DfgxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HW+HhnP+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LdT7ZP0d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DBmUfh2965306
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 18:25:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tzZbszvrmLucZ4gFsiU1bkMESXXLy06AymspFyubZyA=; b=HW+HhnP+KdOA4P9A
	cabJOyD2Jle8/bcceY1r8HZ9My1jMTRsWiOyCn9QUzkUs9Z4ZD0IVyy/VtLT1Bwg
	20HshiV5Qtc0Kl38U3KRxmVNwU5PaiyXmzhqFn6KJ/oSwyYXLbV7XXWNulWQG0aL
	k2iYWzNYDnwwVeskrKZdT7OV7A9e5ssWhZ6/Dpcln6T1Cycnjm/UO1nMPIIUwEK8
	ZtBtg9CS2x7QVTM/v2q8PjBcE7IVA6HJnUQBwauHNfrLby+5MFw4tjrTA9pSf57e
	kyNfhy24FVUkXRZBi0TZWGZR/ZSBh75+Bt0tYINTSv2aswqWwr+rp+ZHKbqjxBOK
	qBK14g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4ma5asad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 18:25:59 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b9a6d84522so134029845ad.2
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 11:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778696758; x=1779301558; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tzZbszvrmLucZ4gFsiU1bkMESXXLy06AymspFyubZyA=;
        b=LdT7ZP0dF0fQZdxILWKE8zverskU78fbZ4exmoU4QT+OboPErrr97U6oxEbNHp+uVG
         Nk1rYvshPOANDd3oN26u5lb9hfNZTo6dctZp+GDgQsmHNUsiXD1CSZjzoeSux83x6m1K
         goVI1sJ1OTXhlLysNtN/Ye9Iaw4SYduwzWxJOfOjmOqgxjx7oxg9J0qLnHLQnVjI6BNZ
         Yk0pCkKH2+F/0gtcqSipM2HAdB+nTWtwXDFHr3TogoZaZDGjoEGCk8VmJxMRnDWTIfda
         iseJ5Th1evEFV5Y5rr0bRFE67CDZEQeTl9ii6vMwvYRVH/vjnl/OCoBal+IZtn6rC2M7
         N8yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778696758; x=1779301558;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tzZbszvrmLucZ4gFsiU1bkMESXXLy06AymspFyubZyA=;
        b=BdXEPeD4tdDtXGmlPLsftEmVIVXSapYPOUMXtXc/JqNsfNDtzCbHHHqu8j9Jz3sQql
         m07oTfhF/EbWbLTRKMUrSOeNpLWl+M66OytmRuL5rAJBA0ustd2ZtyV/IsQi4hyNXyO3
         2fF3mgLW5W6U6B5xEn5hcIrlOl3zgoz2Mmy90fyaUCWDvBnPsVqlCdakO42cXGVa1N9C
         mpej8p8SzmBGFs2ATnvklDOk+Y6KSQahy8ZPESzXSCRXy8p0HRkTleMboQYFzhG/jMWv
         LlHbd5IxsNye26yIdIBwkf3tKFu7ODHzv0k3bqowsRnYw3aQofr8YSFI2yFRcUI+BfbD
         aD2w==
X-Gm-Message-State: AOJu0YzVM75o1aAbJRywGqgbL3w5hpYfJT7una/GZ4uhctyAFHCi/WJi
	GFncF5uZ5CtvD/uhwBozgWctS3gcCEYTp5xxkt/8TU1UPvHEPQd4R5tsafX2BmJZTrSPf7rLLCb
	weifvlFPWfczQTaRratkBYxZdwwAb9D2VP885STViLBx/XWVSYwUMppx5x5AiPdnznQ==
X-Gm-Gg: Acq92OHspRLLUrPs3GtCM28uNfn/nGsuRnEFKqMbW3iq18zZW8UKViFgY449mhOxVp6
	vLlpR4t41hIb+m04unuaDqjLUvSUZJ+uBpEJ9UWAmFjuHv21KQAEEMiF1a4G/q6ryNr+qVnGCY+
	hzUNxvwd4yYMz/QPUDlXDgKP68ywYgoMwsdgMt8mkMhl+g4SUGUw6YK+T78ePHW52dA91jLE0UO
	l5MImXc/g74SLffmsOcO2qJBKql0UYBXShYH9ZHZ6M6XCBim4zkXXAcYjJkfzpxP7wieqvYBayD
	5bgeHf/sfbX0pJMVGfs3OKzK5tEfoNbG6BR7q1ldQnm1HEa7xyKn44+RXif5K7UzaoT2DCjw2bA
	fr3wnCGn1bBAh8puIbmVU6KGuAMGnzAyXFQm9toDby0vfMK+3yInB2Oou
X-Received: by 2002:a17:902:ef11:b0:2bd:2051:13ed with SMTP id d9443c01a7336-2bd276f2e1dmr51757815ad.23.1778696758410;
        Wed, 13 May 2026 11:25:58 -0700 (PDT)
X-Received: by 2002:a17:902:ef11:b0:2bd:2051:13ed with SMTP id d9443c01a7336-2bd276f2e1dmr51757375ad.23.1778696757877;
        Wed, 13 May 2026 11:25:57 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.255.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d27083sm186116005ad.13.2026.05.13.11.25.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 11:25:57 -0700 (PDT)
Message-ID: <487a1bd7-3ce2-4a78-be18-f3d3469e1b93@oss.qualcomm.com>
Date: Wed, 13 May 2026 23:55:51 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] media: qcom: iris: add helpers for 8bit and 10bit
 formats
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
 <20260511-topic-sm8x50-iris-10bit-decoding-v3-1-7fc049b93042@linaro.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260511-topic-sm8x50-iris-10bit-decoding-v3-1-7fc049b93042@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4MyBTYWx0ZWRfX/2SGho4+g0w9
 hFo+sJZzMtzbJSSjoxoejNQtpG1H22xIiLZWVXKdEuiGDf5m5YPbuUAfIn5M7iLKACsMNPyS044
 WFcP6Zzk8e2pPq3Dt/HihFzBACmxGx77nFG5fnuYKZj//I6dsg1qVdOWII6LaMC+dfOgSb01KVU
 qYYt/tFHYjNLjNO/LVT7w6m7CpnxmpkjLS3YFKXd0aebo1nHOm4r0pRlClLLLs+HiVw7ScUdLMV
 Jrc9xL71dyCGak7v8pmwCQgE+/zcjI8p6Adp2SnbJ7MPgSf7Ydx69o0nDvprQg7UPIP/a2ThclN
 WejdZrojKDvYVl9qw3bD3++FBRgO0NFz35JFl1NQCNmh/unAAptZDmtCyM447bjYpu49WlYHhWW
 9fWKZvnDIGZPUVs3W9BuJzl4ZAoNvett2hdwHOyq+Twb7oKrdLXKq+/nWJ8GG4KBFEuia6OLS+U
 ox+Wyxni2EebYO3k3UQ==
X-Proofpoint-ORIG-GUID: IjjfJNa2MA4QhneTKRYeAqPASAnDNxwn
X-Authority-Analysis: v=2.4 cv=TJZ1jVla c=1 sm=1 tr=0 ts=6a04c237 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=6GFGFuPpdQFN+sW0UwB+2Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=1v4LsqrUVehaW6lpU9YA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: IjjfJNa2MA4QhneTKRYeAqPASAnDNxwn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130183
X-Rspamd-Queue-Id: 0B32D538FB9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61493-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/11/2026 2:50 PM, Neil Armstrong wrote:
> To simplify code checking for pixel formats, add helpers to
> check for 8bit and 10bit formats.
> 
> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/media/platform/qcom/iris/iris_utils.c | 12 ++++++++++++
>   drivers/media/platform/qcom/iris/iris_utils.h |  2 ++
>   2 files changed, 14 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
> index cfc5b576ec56..bdedd6bfa87a 100644
> --- a/drivers/media/platform/qcom/iris/iris_utils.c
> +++ b/drivers/media/platform/qcom/iris/iris_utils.c
> @@ -38,6 +38,18 @@ bool iris_split_mode_enabled(struct iris_inst *inst)
>   		inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC08C;
>   }
>   
> +bool iris_fmt_is_8bit(__u32 pixelformat)

u32 please, to maintain consistency with other

> +{
> +	return pixelformat == V4L2_PIX_FMT_NV12 ||
> +		pixelformat == V4L2_PIX_FMT_QC08C;
> +}
> +
> +bool iris_fmt_is_10bit(__u32 pixelformat)

same

> +{
> +	return pixelformat == V4L2_PIX_FMT_P010 ||
> +		pixelformat == V4L2_PIX_FMT_QC10C;
> +}
> +
>   void iris_helper_buffers_done(struct iris_inst *inst, unsigned int type,
>   			      enum vb2_buffer_state state)
>   {
> diff --git a/drivers/media/platform/qcom/iris/iris_utils.h b/drivers/media/platform/qcom/iris/iris_utils.h
> index b5705d156431..35337c5da005 100644
> --- a/drivers/media/platform/qcom/iris/iris_utils.h
> +++ b/drivers/media/platform/qcom/iris/iris_utils.h
> @@ -45,6 +45,8 @@ bool iris_res_is_less_than(u32 width, u32 height,
>   			   u32 ref_width, u32 ref_height);
>   int iris_get_mbpf(struct iris_inst *inst);
>   bool iris_split_mode_enabled(struct iris_inst *inst);
> +bool iris_fmt_is_8bit(__u32 pixelformat);
> +bool iris_fmt_is_10bit(__u32 pixelformat);
>   struct iris_inst *iris_get_instance(struct iris_core *core, u32 session_id);
>   void iris_helper_buffers_done(struct iris_inst *inst, unsigned int type,
>   			      enum vb2_buffer_state state);
> 

Regards,
Vikash

