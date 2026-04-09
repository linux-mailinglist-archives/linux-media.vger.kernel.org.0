Return-Path: <linux-media+bounces-58302-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLvJMIEs12lVLQgAu9opvQ
	(envelope-from <linux-media+bounces-58302-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 06:35:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D623C633F
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 06:35:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 03AD23012E75
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 04:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C6E62D0C97;
	Thu,  9 Apr 2026 04:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FOo2tRZD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IN1cIeW9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D2F280CD2
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 04:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775709303; cv=none; b=nYeXtNbllWGpoM5euAgDJmnUrcLGkmRRud6gIMVOcE7NIK6X/z1+1qh4/fbjlTSZezLNJn/EcOywvBrvHa07m2lDK2INDQ52k62vOwGDjftBU/aQakQj27x4Oygt9JLXCrKn1RywOKhvCqEFR0uMS+fJTbphzqIQvgINw88OqH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775709303; c=relaxed/simple;
	bh=/3PVnkNEJBu8UpYRHginZn6Gu+xHUWTt2JjpCLExeUI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=mRJKsNGsro4Q+PWzFokV1qoLgqYRcPaku1mxA5I2JqAugOomaG40V2o2ZPdGEKCn9BsN39WG0PXwSd0HEx2QlzkZvncgAC4kEhPCDIoGatsd3diLMNPlOxAMFzPLMy94Y2Y9Zv+jnRsYuRFIGl/ZLa2Acx7BEgWF6lQVsay8H/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FOo2tRZD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IN1cIeW9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638NiZeG1071887
	for <linux-media@vger.kernel.org>; Thu, 9 Apr 2026 04:35:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3TQ3nJc8Zgbc7Vlc+IJU/Prc8BuFbBFSznb/lnz1yi4=; b=FOo2tRZDFu/XJ6ID
	I5FP7rCz5T6FLQjyydOYg6fqkzt1iBnAV4huJjSHSpM67VWyEn1S06nTHm2FJjvn
	RV+2MiWt2zuAYqIbPZTN15IpeSGeDjWVXLvEno5Z6ewtAnPpm4yuxCHBm21Dgjjg
	CoFe+zls/tqJK8I0x3NwQ4kT7vIiO9nhc0VEW7RM9iVDf6+XDOpglV7KqiBQ7JqU
	YihFMNy1btpAhRTU7P7qd7fWN4qN7WcI9Cc2NJVWuYZaKdrqHPfnQAFqcB95GoDc
	8cSXkcyFpugaZ5BAbad9mSywURn31Cy4lMSV8MuVbp3G1dqDNEV0zmaz7PO125Q5
	YfFo2A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddtb3ab1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Apr 2026 04:35:00 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-358e425c261so890940a91.3
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2026 21:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775709299; x=1776314099; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3TQ3nJc8Zgbc7Vlc+IJU/Prc8BuFbBFSznb/lnz1yi4=;
        b=IN1cIeW9y05tTLpJ+22hV+CnMz8jHpp7hcyDKOAbD7hMOPkS0WZrtsYyIeznVKsjqP
         mgwR+23VpY9/VEhbksfy82BPrbB1k9uAjZtpSeuKLg+Rl6zVvdUu8h3KRqNObO1JemGR
         R2fuUdVpNwiMyXeVI7M1NWDaXw73pnOfM50TEnhhEPAaJad0Yuw1kYv0beI+MoyU6Pno
         jQE5Mozc6XQjIDhVaDgQuhO2gjhlFgPAM5ui/VpvjKsREDrtTNuTZBPb8+f5IgOG3JNV
         vFTVo0JMgN+85/R8zEB9q4mUUZQC4PpOrM4Hsh2eeRTtwK3BB6Fm/GtS+5s2Dn4o4sIs
         PA1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775709299; x=1776314099;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3TQ3nJc8Zgbc7Vlc+IJU/Prc8BuFbBFSznb/lnz1yi4=;
        b=CbK3IFVQGc9+Ge7Yu9yMaA1CNYOhoNwotqkup2qncuU7Verzn5kHJcvTKba4NZXY4J
         S99xE6gL/q5v+l52+qcPVYOsXCOJhpe3ar/YxSdMk6QDuCRSI1Rb11fYj+n2ObU1xKbk
         iuhsTs4LVVtUdFdYVgxIKBikRNBWbZlQd2qv/JtJ5dH+ZDW0Afn1VHCoAbNjlKHZ/I9V
         2SpZ9F8t26WkJnUwSjVgZJfHHppPn5KlRlQvOHCsTMnaxON6Or9tJN1EgSM3UQ4QmdNA
         PCyp9Jw5OwU2GOp9SefvuMcqoCLtwJP5ogbnpW9gi+G+vVyqxyueZQbAXoE6R1gEs+p4
         ySaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWl5m6bW4APyCKSy3QGGS2f+f4oEdHQPxTFuhAHFNkWm1RmBcupLJBnrYFd4PbgGzQ0p3yCJrvWSJZoqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHfR8B4XjFi3amI6TlElvJ7Ds3HwXc3uZUhh/iSjK4ReP8Gskq
	+gZZDI5sqHwV6CpKsYUyLP1hN8kmhRWHosDPhC9r6PG6ZO5Z1i6qHaXl27SGBowkhCAyI2qJhzE
	MOtpTK6VTtT/uonI0QeXZNLSHTxaFjLPTbZkwW4T1fssFT6ikB+TFzWnDZyxuk7frBw==
X-Gm-Gg: AeBDievz4MWw+no48Aie3YzJv7CgwS15qnwn9Wspsg5mtBp+M1WT2vPnaGpzB8su0G3
	RWiuR5VnL5o9UdOqhW0p/Mc1pBOfV1eJSOu/7XFVSdM/f9awsc4RuqoCVMzRfLXu7MGZYLBF/sF
	obR01SAgRjjT7K1UNeE1cb5E4U8SrFkIG49vTm8svu6FwMYXSig/IVn/BNxPlxK9oWXw+8Wu8WZ
	8KAN0moYN87BNJo0T36DJqLSMqAl0gHXjyjX6oRys/bO7KiiWZ2vKNEdgo0pqjxYz8O7e6Rb144
	le2foOyBUAIkAcWLIovS+NgYPF0V1+PWtpkeiKRrTESVPfr089E9Nl45jmk4k6yxrCIJW7ajW0x
	UJU7XGR+GhXlkVrnUsEbtxOop4TJ4YPbY5uPMWyTpbpoNnKwcqnFvAA==
X-Received: by 2002:a17:90b:3805:b0:35a:1b43:dff1 with SMTP id 98e67ed59e1d1-35de68757c2mr22549951a91.12.1775709299216;
        Wed, 08 Apr 2026 21:34:59 -0700 (PDT)
X-Received: by 2002:a17:90b:3805:b0:35a:1b43:dff1 with SMTP id 98e67ed59e1d1-35de68757c2mr22549881a91.12.1775709298495;
        Wed, 08 Apr 2026 21:34:58 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749a348esm239948675ad.57.2026.04.08.21.34.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 21:34:58 -0700 (PDT)
Message-ID: <ac3be4be-7a84-87c8-62b0-bfc716645569@oss.qualcomm.com>
Date: Thu, 9 Apr 2026 10:04:51 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] media: iris: Add support for Milos (VPU v2.0)
To: Alexander Koskovich <akoskovich@pm.me>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260406-milos-iris-v1-0-17ed0167ba6f@pm.me>
 <20260406-milos-iris-v1-2-17ed0167ba6f@pm.me>
Content-Language: en-US
In-Reply-To: <20260406-milos-iris-v1-2-17ed0167ba6f@pm.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDAzOCBTYWx0ZWRfX/ZmVh9RaK7Te
 E6Ni2voOaHLVvmAFrC30xyy4WaMa/i8diV4yJlx0HT5hWczcdYmZHx06YYbcANBg2ceFbf/xxRu
 x/ddJVQlqfICpiGI3xoB2NAVQ9EZKsf7zTMTuEMqFcqVB7DWbpWqTmtRxaE8H8tRro+1PzomLl0
 pUaNabKRjLXR3YlNYTrrq6uGrs1MeB7yM84KTTO8Az/qosJgaQHZ/gRScofam56eIjZ7XXJBsBv
 R5cqBQbSz50S54hFU8c0/gAfQRzt0ju808pQPLSQ9JrNlsD5MIXDwAGwZ+fEI9Z77QysLetJXYY
 qsVimnWOW2AK9J1i3/S2J0Vd9i5CGAo8mzxUg1WFOYmNl6ewENBUigsc615jyJWJyixtSlpk04R
 mZmc8dUQEcSv6NLBES6ZdSL33qa740y87C8X2fmR4sEmlfhqC+60EwuGW7nSNipfQIjcA2uPk94
 rNTWqz0J7pFuH1JZkhw==
X-Authority-Analysis: v=2.4 cv=eKIjSnp1 c=1 sm=1 tr=0 ts=69d72c74 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=hKLiKgHPvkm7ywbYIQMA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: qmL4q-EgMB1Z5oWA57nS7s9lzkwe-CbX
X-Proofpoint-ORIG-GUID: qmL4q-EgMB1Z5oWA57nS7s9lzkwe-CbX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_01,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090038
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58302-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,pm.me:email,30fps:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.30:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 62D623C633F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/6/2026 3:49 PM, Alexander Koskovich wrote:
> Add support for the Milos Iris codec. This only supports the variant
> found on the SM7635-AB that has half of it's pipes disabled via efuse.
>
> Signed-off-by: Alexander Koskovich<akoskovich@pm.me>
> ---
>   .../platform/qcom/iris/iris_platform_common.h      |   1 +
>   .../media/platform/qcom/iris/iris_platform_gen2.c  | 106 ++++
>   .../media/platform/qcom/iris/iris_platform_milos.h | 655 +++++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
>   4 files changed, 766 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 5a489917580e..c8a9f122952e 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -41,6 +41,7 @@ enum pipe_type {
>   	PIPE_4 = 4,
>   };
>   
> +extern const struct iris_platform_data milos_data;
>   extern const struct iris_platform_data qcs8300_data;
>   extern const struct iris_platform_data sc7280_data;
>   extern const struct iris_platform_data sm8250_data;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 5da90d47f9c6..78cd4656b981 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -12,6 +12,7 @@
>   #include "iris_vpu_buffer.h"
>   #include "iris_vpu_common.h"
>   
> +#include "iris_platform_milos.h"
>   #include "iris_platform_qcs8300.h"
>   #include "iris_platform_sm8650.h"
>   #include "iris_platform_sm8750.h"
> @@ -1317,3 +1318,108 @@ const struct iris_platform_data qcs8300_data = {
>   	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
>   	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
>   };
> +
> +/*
> + * Shares most of SM8550 data except:
> + * - vpu_ops to iris_vpu2_ops
> + * - icc_tbl to milos_icc_table
> + * - clk_rst_tbl to sm8650_clk_reset_table
> + * - opp_pd_tbl to milos_opp_pd_table
> + * - fwname to "qcom/vpu/vpu20_2v.mbn"
> + * - inst_iris_fmts to platform_fmts_milos_dec
> + * - inst_caps to platform_inst_cap_milos
> + * - inst_fw_caps_dec to inst_fw_cap_milos_dec
> + * - inst_fw_caps_enc to inst_fw_cap_milos_enc
> + * - ubwc_config to ubwc_config_milos
> + * - num_vpp_pipe to 2
> + * - max_core_mbpf scaled for 4k@30fps dec/enc
> + * - max_core_mbps scaled for 4k@30fps dec & 1080p@30 enc
> + */
> +const struct iris_platform_data milos_data = {
> +	.get_instance = iris_hfi_gen2_get_instance,
> +	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
> +	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
> +	.get_vpu_buffer_size = iris_vpu_buf_size,
> +	.vpu_ops = &iris_vpu2_ops,
> +	.set_preset_registers = iris_set_sm8550_preset_registers,
> +	.icc_tbl = milos_icc_table,
> +	.icc_tbl_size = ARRAY_SIZE(milos_icc_table),
> +	.clk_rst_tbl = sm8650_clk_reset_table,
> +	.clk_rst_tbl_size = ARRAY_SIZE(sm8650_clk_reset_table),
> +	.bw_tbl_dec = sm8550_bw_table_dec,
> +	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
> +	.pmdomain_tbl = sm8550_pmdomain_table,
> +	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
> +	.opp_pd_tbl = milos_opp_pd_table,
> +	.opp_pd_tbl_size = ARRAY_SIZE(milos_opp_pd_table),
> +	.clk_tbl = sm8550_clk_table,
> +	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
> +	.opp_clk_tbl = sm8550_opp_clk_table,
> +	/* Upper bound of DMA address range */
> +	.dma_mask = 0xe0000000 - 1,
> +	.fwname = "qcom/vpu/vpu20_2v.mbn",

can you check how firmware names are added for earlier platforms.
It should be like this vpu20_p2.mbn

> +	.pas_id = IRIS_PAS_ID,
> +	.inst_iris_fmts = platform_fmts_milos_dec,
> +	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_milos_dec),
> +	.inst_caps = &platform_inst_cap_milos,
> +	.inst_fw_caps_dec = inst_fw_cap_milos_dec,
> +	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_milos_dec),
> +	.inst_fw_caps_enc = inst_fw_cap_milos_enc,
> +	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_milos_enc),
> +	.tz_cp_config_data = tz_cp_config_sm8550,
> +	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
> +	.core_arch = VIDEO_ARCH_LX,
> +	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> +	.ubwc_config = &ubwc_config_milos,
> +	.num_vpp_pipe = 2,
> +	.max_session_count = 16,
> +	.max_core_mbpf = ((4096 * 2176) / 256) * 2,
> +	.max_core_mbps = ((3840 * 2176) / 256) * 30 + ((1920 * 1088) / 256) * 30,
> +	.dec_input_config_params_default =
> +		sm8550_vdec_input_config_params_default,
> +	.dec_input_config_params_default_size =
> +		ARRAY_SIZE(sm8550_vdec_input_config_params_default),
> +	.dec_input_config_params_hevc =
> +		sm8550_vdec_input_config_param_hevc,
> +	.dec_input_config_params_hevc_size =
> +		ARRAY_SIZE(sm8550_vdec_input_config_param_hevc),
> +	.dec_input_config_params_vp9 =
> +		sm8550_vdec_input_config_param_vp9,
> +	.dec_input_config_params_vp9_size =
> +		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
> +	.dec_output_config_params =
> +		sm8550_vdec_output_config_params,
> +	.dec_output_config_params_size =
> +		ARRAY_SIZE(sm8550_vdec_output_config_params),
> +
> +	.enc_input_config_params =
> +		sm8550_venc_input_config_params,
> +	.enc_input_config_params_size =
> +		ARRAY_SIZE(sm8550_venc_input_config_params),
> +	.enc_output_config_params =
> +		sm8550_venc_output_config_params,
> +	.enc_output_config_params_size =
> +		ARRAY_SIZE(sm8550_venc_output_config_params),
> +
> +	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
> +	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
> +	.dec_output_prop_avc = sm8550_vdec_subscribe_output_properties_avc,
> +	.dec_output_prop_avc_size =
> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_avc),
> +	.dec_output_prop_hevc = sm8550_vdec_subscribe_output_properties_hevc,
> +	.dec_output_prop_hevc_size =
> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_hevc),
> +	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
> +	.dec_output_prop_vp9_size =
> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
> +
> +	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
> +	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
> +	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
> +	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
> +
> +	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
> +	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
> +	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
> +	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
> +};
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_milos.h b/drivers/media/platform/qcom/iris/iris_platform_milos.h
> new file mode 100644
> index 000000000000..dacd3ad5aa7e
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_platform_milos.h
> @@ -0,0 +1,655 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __IRIS_PLATFORM_MILOS_H__
> +#define __IRIS_PLATFORM_MILOS_H__
> +
> +#define MILOS_V1_MAX_BITRATE	100000000
> +#define MILOS_V1_MAX_FPS	240
> +
> +static struct iris_fmt platform_fmts_milos_dec[] = {
> +	[IRIS_FMT_H264] = {
> +		.pixfmt = V4L2_PIX_FMT_H264,
> +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +	},
> +	[IRIS_FMT_HEVC] = {
> +		.pixfmt = V4L2_PIX_FMT_HEVC,
> +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +	},
> +	[IRIS_FMT_VP9] = {
> +		.pixfmt = V4L2_PIX_FMT_VP9,
> +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +	},
> +};
> +
> +static const struct platform_inst_fw_cap inst_fw_cap_milos_dec[] = {
> +	{
> +		.cap_id = PROFILE_H264,
> +		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
> +		.max = V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
> +				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
> +				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
> +				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH) |
> +				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH),
> +		.value = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> +		.hfi_id = HFI_PROP_PROFILE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_u32_enum,
> +	},
> +	{
> +		.cap_id = PROFILE_HEVC,
> +		.min = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
> +		.max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
> +		.value = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
> +		.hfi_id = HFI_PROP_PROFILE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_u32_enum,
> +	},
> +	{
> +		.cap_id = PROFILE_VP9,
> +		.min = V4L2_MPEG_VIDEO_VP9_PROFILE_0,
> +		.max = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_VP9_PROFILE_0) |
> +				BIT(V4L2_MPEG_VIDEO_VP9_PROFILE_2),
> +		.value = V4L2_MPEG_VIDEO_VP9_PROFILE_0,
> +		.hfi_id = HFI_PROP_PROFILE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_u32_enum,
> +	},
> +	{
> +		.cap_id = LEVEL_H264,
> +		.min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
> +		.max = V4L2_MPEG_VIDEO_H264_LEVEL_5_1,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1B) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_1) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_2) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_3) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_1) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_2) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_1) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_2) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_0) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_1) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_2) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_0) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_1),
> +		.value = V4L2_MPEG_VIDEO_H264_LEVEL_5_1,
> +		.hfi_id = HFI_PROP_LEVEL,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_u32_enum,
> +	},
> +	{
> +		.cap_id = LEVEL_HEVC,
> +		.min = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
> +		.max = V4L2_MPEG_VIDEO_HEVC_LEVEL_5,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_1) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5),
> +		.value = V4L2_MPEG_VIDEO_HEVC_LEVEL_5,
> +		.hfi_id = HFI_PROP_LEVEL,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_u32_enum,
> +	},
> +	{
> +		.cap_id = LEVEL_VP9,
> +		.min = V4L2_MPEG_VIDEO_VP9_LEVEL_1_0,
> +		.max = V4L2_MPEG_VIDEO_VP9_LEVEL_5_0,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_1_0) |
> +				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_1_1) |
> +				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_2_0) |
> +				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_2_1) |
> +				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_3_0) |
> +				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_3_1) |
> +				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_4_0) |
> +				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_4_1) |
> +				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_5_0),
> +		.value = V4L2_MPEG_VIDEO_VP9_LEVEL_5_0,
> +		.hfi_id = HFI_PROP_LEVEL,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_u32_enum,
> +	},
> +	{
> +		.cap_id = TIER,
> +		.min = V4L2_MPEG_VIDEO_HEVC_TIER_MAIN,
> +		.max = V4L2_MPEG_VIDEO_HEVC_TIER_HIGH,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_TIER_MAIN) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_TIER_HIGH),
> +		.value = V4L2_MPEG_VIDEO_HEVC_TIER_HIGH,
> +		.hfi_id = HFI_PROP_TIER,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_u32_enum,
> +	},
> +	{
> +		.cap_id = INPUT_BUF_HOST_MAX_COUNT,
> +		.min = DEFAULT_MAX_HOST_BUF_COUNT,
> +		.max = DEFAULT_MAX_HOST_BURST_BUF_COUNT,
> +		.step_or_mask = 1,
> +		.value = DEFAULT_MAX_HOST_BUF_COUNT,
> +		.hfi_id = HFI_PROP_BUFFER_HOST_MAX_COUNT,
> +		.flags = CAP_FLAG_INPUT_PORT,
> +		.set = iris_set_u32,
> +	},
> +	{
> +		.cap_id = STAGE,
> +		.min = STAGE_1,
> +		.max = STAGE_2,
> +		.step_or_mask = 1,
> +		.value = STAGE_2,
> +		.hfi_id = HFI_PROP_STAGE,
> +		.set = iris_set_stage,
> +	},
> +	{
> +		.cap_id = PIPE,
> +		/* .max, .min and .value are set via platform data */
> +		.step_or_mask = 1,
> +		.hfi_id = HFI_PROP_PIPE,
> +		.set = iris_set_pipe,
> +	},
> +	{
> +		.cap_id = POC,
> +		.min = 0,
> +		.max = 2,
> +		.step_or_mask = 1,
> +		.value = 1,
> +		.hfi_id = HFI_PROP_PIC_ORDER_CNT_TYPE,
> +	},
> +	{
> +		.cap_id = CODED_FRAMES,
> +		.min = CODED_FRAMES_PROGRESSIVE,
> +		.max = CODED_FRAMES_PROGRESSIVE,
> +		.step_or_mask = 0,
> +		.value = CODED_FRAMES_PROGRESSIVE,
> +		.hfi_id = HFI_PROP_CODED_FRAMES,
> +	},
> +	{
> +		.cap_id = BIT_DEPTH,
> +		.min = BIT_DEPTH_8,
> +		.max = BIT_DEPTH_8,
> +		.step_or_mask = 1,
> +		.value = BIT_DEPTH_8,
> +		.hfi_id = HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
> +	},
> +	{
> +		.cap_id = RAP_FRAME,
> +		.min = 0,
> +		.max = 1,
> +		.step_or_mask = 1,
> +		.value = 1,
> +		.hfi_id = HFI_PROP_DEC_START_FROM_RAP_FRAME,
> +		.flags = CAP_FLAG_INPUT_PORT,
> +		.set = iris_set_u32,
> +	},
> +};
> +
> +static const struct platform_inst_fw_cap inst_fw_cap_milos_enc[] = {
> +	{
> +		.cap_id = PROFILE_H264,
> +		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
> +		.max = V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
> +				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH) |
> +				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
> +				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
> +				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH),
> +		.value = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> +		.hfi_id = HFI_PROP_PROFILE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_profile,
> +	},
> +	{
> +		.cap_id = PROFILE_HEVC,
> +		.min = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
> +		.max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10),
> +		.value = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
> +		.hfi_id = HFI_PROP_PROFILE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_profile,
> +	},
> +	{
> +		.cap_id = LEVEL_H264,
> +		.min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
> +		.max = V4L2_MPEG_VIDEO_H264_LEVEL_5_1,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1B) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_1) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_2) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_3) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_1) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_2) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_1) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_2) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_0) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_1) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_2) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_0) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_1),
> +		.value = V4L2_MPEG_VIDEO_H264_LEVEL_5_0,
> +		.hfi_id = HFI_PROP_LEVEL,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_level,
> +	},
> +	{
> +		.cap_id = LEVEL_HEVC,
> +		.min = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
> +		.max = V4L2_MPEG_VIDEO_HEVC_LEVEL_5,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_1) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5),
> +		.value = V4L2_MPEG_VIDEO_HEVC_LEVEL_5,
> +		.hfi_id = HFI_PROP_LEVEL,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_level,
> +	},
> +	{
> +		.cap_id = STAGE,
> +		.min = STAGE_1,
> +		.max = STAGE_2,
> +		.step_or_mask = 1,
> +		.value = STAGE_2,
> +		.hfi_id = HFI_PROP_STAGE,
> +		.set = iris_set_stage,
> +	},
> +	{
> +		.cap_id = HEADER_MODE,
> +		.min = V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE,
> +		.max = V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE) |
> +				BIT(V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME),
> +		.value = V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
> +		.hfi_id = HFI_PROP_SEQ_HEADER_MODE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_header_mode_gen2,
> +	},
> +	{
> +		.cap_id = PREPEND_SPSPPS_TO_IDR,
> +		.min = 0,
> +		.max = 1,
> +		.step_or_mask = 1,
> +		.value = 0,
> +	},
> +	{
> +		.cap_id = BITRATE,
> +		.min = 1,
> +		.max = MILOS_V1_MAX_BITRATE,
> +		.step_or_mask = 1,
> +		.value = BITRATE_DEFAULT,
> +		.hfi_id = HFI_PROP_TOTAL_BITRATE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_bitrate,
> +	},
> +	{
> +		.cap_id = BITRATE_PEAK,
> +		.min = 1,
> +		.max = MILOS_V1_MAX_BITRATE,
> +		.step_or_mask = 1,
> +		.value = BITRATE_DEFAULT,
> +		.hfi_id = HFI_PROP_TOTAL_PEAK_BITRATE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_peak_bitrate,
> +	},
> +	{
> +		.cap_id = BITRATE_MODE,
> +		.min = V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
> +		.max = V4L2_MPEG_VIDEO_BITRATE_MODE_CBR,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_BITRATE_MODE_VBR) |
> +				BIT(V4L2_MPEG_VIDEO_BITRATE_MODE_CBR),
> +		.value = V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
> +		.hfi_id = HFI_PROP_RATE_CONTROL,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_bitrate_mode_gen2,
> +	},
> +	{
> +		.cap_id = FRAME_SKIP_MODE,
> +		.min = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
> +		.max = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED) |
> +				BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_LEVEL_LIMIT) |
> +				BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT),
> +		.value = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +	},
> +	{
> +		.cap_id = FRAME_RC_ENABLE,
> +		.min = 0,
> +		.max = 1,
> +		.step_or_mask = 1,
> +		.value = 1,
> +	},
> +	{
> +		.cap_id = GOP_SIZE,
> +		.min = 0,
> +		.max = INT_MAX,
> +		.step_or_mask = 1,
> +		.value = 2 * DEFAULT_FPS - 1,
> +		.hfi_id = HFI_PROP_MAX_GOP_FRAMES,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_u32,
> +	},
> +	{
> +		.cap_id = ENTROPY_MODE,
> +		.min = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC,
> +		.max = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC) |
> +				BIT(V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC),
> +		.value = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC,
> +		.hfi_id = HFI_PROP_CABAC_SESSION,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_entropy_mode_gen2,
> +	},
> +	{
> +		.cap_id = MIN_FRAME_QP_H264,
> +		.min = MIN_QP_8BIT,
> +		.max = MAX_QP,
> +		.step_or_mask = 1,
> +		.value = MIN_QP_8BIT,
> +		.hfi_id = HFI_PROP_MIN_QP_PACKED,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +		.set = iris_set_min_qp,
> +	},
> +	{
> +		.cap_id = MIN_FRAME_QP_HEVC,
> +		.min = MIN_QP_8BIT,
> +		.max = MAX_QP,
> +		.step_or_mask = 1,
> +		.value = MIN_QP_8BIT,
> +		.hfi_id = HFI_PROP_MIN_QP_PACKED,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +		.set = iris_set_min_qp,
> +	},
> +	{
> +		.cap_id = MAX_FRAME_QP_H264,
> +		.min = MIN_QP_8BIT,
> +		.max = MAX_QP,
> +		.step_or_mask = 1,
> +		.value = MAX_QP,
> +		.hfi_id = HFI_PROP_MAX_QP_PACKED,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +		.set = iris_set_max_qp,
> +	},
> +	{
> +		.cap_id = MAX_FRAME_QP_HEVC,
> +		.min = MIN_QP_8BIT,
> +		.max = MAX_QP,
> +		.step_or_mask = 1,
> +		.value = MAX_QP,
> +		.hfi_id = HFI_PROP_MAX_QP_PACKED,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +		.set = iris_set_max_qp,
> +	},
> +	{
> +		.cap_id = I_FRAME_MIN_QP_H264,
> +		.min = MIN_QP_8BIT,
> +		.max = MAX_QP,
> +		.step_or_mask = 1,
> +		.value = MIN_QP_8BIT,
> +	},
> +	{
> +		.cap_id = I_FRAME_MIN_QP_HEVC,
> +		.min = MIN_QP_8BIT,
> +		.max = MAX_QP,
> +		.step_or_mask = 1,
> +		.value = MIN_QP_8BIT,
> +	},
> +	{
> +		.cap_id = P_FRAME_MIN_QP_H264,
> +		.min = MIN_QP_8BIT,
> +		.max = MAX_QP,
> +		.step_or_mask = 1,
> +		.value = MIN_QP_8BIT,
> +	},
> +	{
> +		.cap_id = P_FRAME_MIN_QP_HEVC,
> +		.min = MIN_QP_8BIT,
> +		.max = MAX_QP,
> +		.step_or_mask = 1,
> +		.value = MIN_QP_8BIT,
> +	},
> +	{
> +		.cap_id = B_FRAME_MIN_QP_H264,
> +		.min = MIN_QP_8BIT,
> +		.max = MAX_QP,
> +		.step_or_mask = 1,
> +		.value = MIN_QP_8BIT,
> +	},
> +	{
> +		.cap_id = B_FRAME_MIN_QP_HEVC,
> +		.min = MIN_QP_8BIT,
> +		.max = MAX_QP,
> +		.step_or_mask = 1,
> +		.value = MIN_QP_8BIT,
> +	},
> +	{
> +		.cap_id = I_FRAME_MAX_QP_H264,
> +		.min = MIN_QP_8BIT,
> +		.max = MAX_QP,
> +		.step_or_mask = 1,
> +		.value = MAX_QP,
> +	},
> +	{
> +		.cap_id = I_FRAME_MAX_QP_HEVC,
> +		.min = MIN_QP_8BIT,
> +		.max = MAX_QP,
> +		.step_or_mask = 1,
> +		.value = MAX_QP,
> +	},
> +	{
> +		.cap_id = P_FRAME_MAX_QP_H264,
> +		.min = MIN_QP_8BIT,
> +		.max = MAX_QP,
> +		.step_or_mask = 1,
> +		.value = MAX_QP,
> +	},
> +	{
> +		.cap_id = P_FRAME_MAX_QP_HEVC,
> +		.min = MIN_QP_8BIT,
> +		.max = MAX_QP,
> +		.step_or_mask = 1,
> +		.value = MAX_QP,
> +	},
> +	{
> +		.cap_id = B_FRAME_MAX_QP_H264,
> +		.min = MIN_QP_8BIT,
> +		.max = MAX_QP,
> +		.step_or_mask = 1,
> +		.value = MAX_QP,
> +	},
> +	{
> +		.cap_id = B_FRAME_MAX_QP_HEVC,
> +		.min = MIN_QP_8BIT,
> +		.max = MAX_QP,
> +		.step_or_mask = 1,
> +		.value = MAX_QP,
> +	},
> +	{
> +		.cap_id = I_FRAME_QP_H264,
> +		.min = MIN_QP_8BIT,
> +		.max = MAX_QP,
> +		.step_or_mask = 1,
> +		.value = DEFAULT_QP,
> +		.hfi_id = HFI_PROP_QP_PACKED,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_frame_qp,
> +	},
> +	{
> +		.cap_id = I_FRAME_QP_HEVC,
> +		.min = MIN_QP_8BIT,
> +		.max = MAX_QP,
> +		.step_or_mask = 1,
> +		.value = DEFAULT_QP,
> +		.hfi_id = HFI_PROP_QP_PACKED,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_frame_qp,
> +	},
> +	{
> +		.cap_id = P_FRAME_QP_H264,
> +		.min = MIN_QP_8BIT,
> +		.max = MAX_QP,
> +		.step_or_mask = 1,
> +		.value = DEFAULT_QP,
> +		.hfi_id = HFI_PROP_QP_PACKED,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_frame_qp,
> +	},
> +	{
> +		.cap_id = P_FRAME_QP_HEVC,
> +		.min = MIN_QP_8BIT,
> +		.max = MAX_QP,
> +		.step_or_mask = 1,
> +		.value = DEFAULT_QP,
> +		.hfi_id = HFI_PROP_QP_PACKED,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_frame_qp,
> +	},
> +	{
> +		.cap_id = B_FRAME_QP_H264,
> +		.min = MIN_QP_8BIT,
> +		.max = MAX_QP,
> +		.step_or_mask = 1,
> +		.value = DEFAULT_QP,
> +		.hfi_id = HFI_PROP_QP_PACKED,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_frame_qp,
> +	},
> +	{
> +		.cap_id = B_FRAME_QP_HEVC,
> +		.min = MIN_QP_8BIT,
> +		.max = MAX_QP,
> +		.step_or_mask = 1,
> +		.value = DEFAULT_QP,
> +		.hfi_id = HFI_PROP_QP_PACKED,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_frame_qp,
> +	},
> +	{
> +		.cap_id = INPUT_BUF_HOST_MAX_COUNT,
> +		.min = DEFAULT_MAX_HOST_BUF_COUNT,
> +		.max = DEFAULT_MAX_HOST_BURST_BUF_COUNT,
> +		.step_or_mask = 1,
> +		.value = DEFAULT_MAX_HOST_BUF_COUNT,
> +		.hfi_id = HFI_PROP_BUFFER_HOST_MAX_COUNT,
> +		.flags = CAP_FLAG_INPUT_PORT,
> +		.set = iris_set_u32,
> +	},
> +	{
> +		.cap_id = OUTPUT_BUF_HOST_MAX_COUNT,
> +		.min = DEFAULT_MAX_HOST_BUF_COUNT,
> +		.max = DEFAULT_MAX_HOST_BURST_BUF_COUNT,
> +		.step_or_mask = 1,
> +		.value = DEFAULT_MAX_HOST_BUF_COUNT,
> +		.hfi_id = HFI_PROP_BUFFER_HOST_MAX_COUNT,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +		.set = iris_set_u32,
> +	},
> +	{
> +		.cap_id = ROTATION,
> +		.min = 0,
> +		.max = 270,
> +		.step_or_mask = 90,
> +		.value = 0,
> +		.hfi_id = HFI_PROP_ROTATION,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +		.set = iris_set_rotation,
> +	},
> +	{
> +		.cap_id = HFLIP,
> +		.min = 0,
> +		.max = 1,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.hfi_id = HFI_PROP_FLIP,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_flip,
> +	},
> +	{
> +		.cap_id = VFLIP,
> +		.min = 0,
> +		.max = 1,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.hfi_id = HFI_PROP_FLIP,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_flip,
> +	},
> +	{
> +		.cap_id = IR_TYPE,
> +		.min = V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM,
> +		.max = V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM,
> +		.step_or_mask = BIT(V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM),
> +		.value = V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +	},
> +	{
> +		.cap_id = IR_PERIOD,
> +		.min = 0,
> +		.max = INT_MAX,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.flags = CAP_FLAG_OUTPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_ir_period,
> +	},
> +};
> +
> +static struct platform_inst_caps platform_inst_cap_milos = {
> +	.min_frame_width = 96,
> +	.max_frame_width = 4096,
> +	.min_frame_height = 96,
> +	.max_frame_height = 4096,
> +	.max_mbpf = (4096 * 2176) / 256,
> +	.mb_cycles_vpp = 200,
> +	.mb_cycles_fw = 326389,
> +	.mb_cycles_fw_vpp = 44156,
> +	.num_comv = 0,
> +	.max_frame_rate = MILOS_V1_MAX_FPS,
> +	.max_operating_rate = MILOS_V1_MAX_FPS,
> +};
> +
> +static const struct icc_info milos_icc_table[] = {
> +	{ "cpu-cfg",    1000, 1000     },
> +	{ "video-mem",  1000, 10000000 },
> +};
> +
> +static const char * const milos_opp_pd_table[] = { "cx", "mx" };
> +
> +static struct ubwc_config_data ubwc_config_milos = {
> +	.max_channels = 8,
> +	.mal_length = 32,
> +	.highest_bank_bit = 15,
> +	.bank_swzl_level = 0,
> +	.bank_swz2_level = 1,
> +	.bank_swz3_level = 1,
> +	.bank_spreading = 1,
> +};
> +
> +#endif
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index ddaacda523ec..ff3f4f1dc2ff 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -348,6 +348,10 @@ static const struct dev_pm_ops iris_pm_ops = {
>   };
>   
>   static const struct of_device_id iris_dt_match[] = {
> +	{
> +		.compatible = "qcom,milos-iris",
> +		.data = &milos_data,
> +	},
>   	{
>   		.compatible = "qcom,qcs8300-iris",
>   		.data = &qcs8300_data,
>

