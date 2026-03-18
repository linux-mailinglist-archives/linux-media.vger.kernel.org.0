Return-Path: <linux-media+bounces-56186-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNlMKH9rumnRWQIAu9opvQ
	(envelope-from <linux-media+bounces-56186-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 10:08:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 048EC2B8AAB
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 10:08:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE67A301A92D
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 09:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E004F39E177;
	Wed, 18 Mar 2026 09:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZuhnP2iC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GEO7HUne"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B88735D604
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 09:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773824738; cv=none; b=al53juXbW3m9c2zd0N/il7Zv3e+xPu0sM6ciO7X1Y+19RDsnhFTYJCzJIdSKZSyadVdjznqDM7Iw9vbSQO30rNHUl+ur+DS4Fdb3DmB/af7m0scu7fEMK1WCg70Z9aUiUc6XegYq3MpWhDVMnWxRLVHeTwshgn4uKEnLLZt8WOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773824738; c=relaxed/simple;
	bh=9sLPdfZdOTRGWkdHWAt4deRhUQbSXz3/+uenBwBgRH8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ta96CBnQAvGMq/4yu7QCnwDWeP+pljT0VdnYJZmaukJ4OoMAeaJL2Cxfooy50vcvOKbc9PvBgVPS7ePl6EBZgxJ6L2+DcP2WlDk5YehYAcghq3HAhkyAHe/nrOzTPbGcZui2BgmLILpEcs6iypifsT6yzXT6+x4FK8ABsfcrsuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZuhnP2iC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GEO7HUne; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I8JuYe1049602
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 09:05:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BMDtEQ0NH96TVBLji2qMk3/V2u0vd9jPzqt2rV4TdqM=; b=ZuhnP2iCJCvDVGmL
	DADwgaXrWKJVf0KgZV8BSCT6O4zDnbWbpdMPsZxHO8zJ+ceYk8ALdw7Jaf4x7C6d
	BhDJnY3I4UYHFOdkAvplecE3KrAaGvIgCfc0o9G7OKR1VaZcE/bB+n+YizTfvVhZ
	Ln/JdjckJ8Z2a9rO4qmXvdb9JbvLiC3+TTc9NJ2b0qCwBfh1zcaryo2l2Beyc2Kv
	7mcYjaRp97Gy5X34Tro3hnQ1VJu7j2mXAsm6LrXl/fi44smzzPakHX8t5zczITKX
	lC+TKpoSuDAHDuZiQcpxM6EaKo3kkyDWMVgauuqEyiujZoaY+yuygO9mXN9iDba5
	BK8VOw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyj4ehs5j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 09:05:36 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae4b96c259so12432195ad.1
        for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 02:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773824736; x=1774429536; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BMDtEQ0NH96TVBLji2qMk3/V2u0vd9jPzqt2rV4TdqM=;
        b=GEO7HUnemi+Bv6PJ+VRF7o5s2bo22dl2wzIlhjPc6mFflU8H44ZvW/xGZ/UhkZvLHD
         ExtU96S2K68wNTJ0FDBt9KVrFlroSuefPzoeIiKIEWDoEOoL1aIENLfePbxLUMVhuJm2
         tnx68Bu3QaQHqdCDnLgqJ7lsm8lIRJ7EBettNAQepiyFFKIEdxkIv4fcME68ULI5bqxq
         xM/UwqiGsJ8p/jnLUpau2DZI+QgNsXjfjU3YjzSy3OhPZam7EV+f8G4UqRTMBspfcJuT
         OnFIn6caQtcms5mbtV6lKCekzFbB65u2p0+h5FZyn4MUinaeZTqRzhzqQnTfo3knLJ0T
         9+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773824736; x=1774429536;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BMDtEQ0NH96TVBLji2qMk3/V2u0vd9jPzqt2rV4TdqM=;
        b=mRkWsniRDpG60m0eNYA2vspwbV0qnqxM7CraE63TzQer6LtaNC6sih+do8m6KspD7E
         TEmu6kwoNUmOgpe5vQNyDLFCtwABpgpYJd63KSr/i854/0vCtvLXst4SBGX3SEghHgkC
         uXxitke9JXmx6WGJM+oRtdlUzMsWuOIU2mCZ6tpvjVQQtD2CjHm+dwilrrgM741OeWlS
         Xhi4t0KOfH7t+polAq9mrNwBI5rKyhVto/3HmBAUTB4lvE2cApt7TM4doAWurfMv0Eyn
         ChlWpQStCFe4hvmYmtDCpBV0hW721+66cPOGaCb8ufcPDNbtYF5r8GLsDhlS73SBy7J4
         1jcw==
X-Gm-Message-State: AOJu0YxTszyg1YZrLLrNcgcn1uScYGG5pZQnpS8stxZGhhcANmuX3Bvg
	Wwkzq4KjENLync0D3Ra9sKH5rA4CJD2IN9w8Yii06CLQrh45xRUbfdaC3alnj32FLKCBr93eYAA
	dRiZ3qrypR3KxQH4hqzzd7D+LwjgpY3/Mus5XhrbKRvHyKsVECi7jFROiSHs2s6rmPfAbXSGdcw
	==
X-Gm-Gg: ATEYQzw5qluRNMlTkybC7laqMwSxAMC+nAHmAupDgg0J9dQa2mPzoZFiuztzERsqqEu
	hoZBRLg4SLiC+pV8yrBLOdTo3jibzW7lc8RCxEDfhhBgh/Gugk7m594NwJPQwVVd0GF75LzLp59
	aQC2YIq69XA1daEq/LEIEP8mtCVqfgeHk02m4adqZo196/ReX9FdFG21h0PjExztGeMhknAckIJ
	VUZnY/VogYlXSeF8Ik5Tc+bty10XhGXWe/FaWYjT5GhZrZEz/eGj68crH5cGAIZH/dbY0DI5QzQ
	PiWAZbZpKVcGBMj0aAZLuXOLRdjs/sYytZjOxyFJVY4zdeQ1Grc6POx+tY7mBWRGYJ0+KR4bv52
	RttGYeXVCB9OHOo9NvtPexS1IW4XFPQyX9GG0Al1iFT9ejdi5mTX4Ew==
X-Received: by 2002:a17:902:7443:b0:2b0:6ba2:3d78 with SMTP id d9443c01a7336-2b06ba240a8mr22925215ad.3.1773824735447;
        Wed, 18 Mar 2026 02:05:35 -0700 (PDT)
X-Received: by 2002:a17:902:7443:b0:2b0:6ba2:3d78 with SMTP id d9443c01a7336-2b06ba240a8mr22924965ad.3.1773824734948;
        Wed, 18 Mar 2026 02:05:34 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e603937sm19944875ad.57.2026.03.18.02.05.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 02:05:34 -0700 (PDT)
Message-ID: <3ee87252-6b90-a389-0621-5b0b8d2f87ff@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 14:35:30 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v7 7/8] media: qcom: iris: split firmware_data from raw
 platform data
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260316-iris-platform-data-v7-0-fc79f003f51c@oss.qualcomm.com>
 <20260316-iris-platform-data-v7-7-fc79f003f51c@oss.qualcomm.com>
Content-Language: en-US
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260316-iris-platform-data-v7-7-fc79f003f51c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T4+BjvKQ c=1 sm=1 tr=0 ts=69ba6ae0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=RgczR8+8wRjDfzPIf2UjDw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=lkyXAShNmXRLqkyLKQ8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA3NiBTYWx0ZWRfX15zUVBPkX23Q
 ZIhCp2DQ566agZCNfR216ZJiVrX9J8a+HMASmHxtVq0npsLScw6lG7TT9xLTDKu/9eqscDcYvL+
 7L1//kGWYQoVfRL8OiJ3UABnQK5ECwP3kc/TKwK89VUPC18UN3inAtLwgjqHZ6E/y3AFGiXfF7e
 3RWduZQcREVhugypnNpv2Kev5w5ZLe85z9SRjdsvMAWEeng2iB1KQba2kJd7n5brN3z/dV0j4u3
 gPzT2z1XP+oI0ZzXWdJ85ORYvgdzODM04lSjPkbkkE0H2CaNb6RRs/13gHm9QqcBYwJyShqusiE
 1MKfo2qOMPfMVR0MD3+0vGn7W6JdTTBAAY+3nLGJ/5fsrsYzbA+WbCnSLnHc/lOipFl14oRdvfA
 iJWQJj4ATDNVAIJsvaaRsX8P8EN0GG3/pOm7+iYX3nJ00wEPH6kXZlc5taI+ehvQdBUgseVaVZV
 vSAKgmHWPIolwu3PJYw==
X-Proofpoint-GUID: Lg9U2xgvbRqGi98GzeaGhqQw3nhqV--o
X-Proofpoint-ORIG-GUID: Lg9U2xgvbRqGi98GzeaGhqQw3nhqV--o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180076
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-56186-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 048EC2B8AAB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/17/2026 12:24 AM, Dmitry Baryshkov wrote:
> Having firmware-related fields in platform data results in the tying
> platform data to the HFI firmware data rather than the actual hardware.
> For example, SM8450 uses Gen2 firmware, so currently its platform data
> should be placed next to the other gen2 platforms, although it has the
> VPU2.0 core, similar to the one found on SM8250 and SC7280 and so the
> hardware-specific platform data is also close to those devices.
> 
> Split firmware data to a separate struct, separating hardware-related
> data from the firmware interfaces.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_buffer.c     |  82 +++----
>  drivers/media/platform/qcom/iris/iris_core.h       |   2 +
>  drivers/media/platform/qcom/iris/iris_ctrls.c      |   8 +-
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |   8 +-
>  .../platform/qcom/iris/iris_hfi_gen2_command.c     |  66 +++---
>  .../platform/qcom/iris/iris_platform_common.h      |  82 ++++---
>  .../media/platform/qcom/iris/iris_platform_gen1.c  |  67 +++---
>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 246 ++++-----------------
>  drivers/media/platform/qcom/iris/iris_probe.c      |   3 +-
>  drivers/media/platform/qcom/iris/iris_vidc.c       |  10 +-
>  10 files changed, 205 insertions(+), 369 deletions(-)
> 

<snip>

> -struct iris_platform_data {
> +struct iris_firmware_data {
>  	void (*init_hfi_ops)(struct iris_core *core);
> -	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
> -	const struct vpu_ops *vpu_ops;
> -	const struct icc_info *icc_tbl;
> -	unsigned int icc_tbl_size;
> -	const struct bw_info *bw_tbl_dec;
> -	unsigned int bw_tbl_dec_size;
> -	const char * const *pmdomain_tbl;
> -	unsigned int pmdomain_tbl_size;
> -	const char * const *opp_pd_tbl;
> -	unsigned int opp_pd_tbl_size;
> -	const struct platform_clk_data *clk_tbl;
> -	const char * const *opp_clk_tbl;
> -	unsigned int clk_tbl_size;
> -	const char * const *clk_rst_tbl;
> -	unsigned int clk_rst_tbl_size;
> -	const char * const *controller_rst_tbl;
> -	unsigned int controller_rst_tbl_size;
> -	u64 dma_mask;
> -	const char *fwname;
> -	struct iris_fmt *inst_iris_fmts;
> -	u32 inst_iris_fmts_size;
> -	struct platform_inst_caps *inst_caps;
> +
>  	const struct platform_inst_fw_cap *inst_fw_caps_dec;
>  	u32 inst_fw_caps_dec_size;
>  	const struct platform_inst_fw_cap *inst_fw_caps_enc;
>  	u32 inst_fw_caps_enc_size;
> -	const struct tz_cp_config *tz_cp_config_data;
> -	u32 tz_cp_config_data_size;
> -	u32 core_arch;

This can also be tied to firmware data as this is required to be set for
Gen2 only and is 0 for Gen1.

Thanks,
Dikshita

