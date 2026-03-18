Return-Path: <linux-media+bounces-56195-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJc1G5l/ummTWwIAu9opvQ
	(envelope-from <linux-media+bounces-56195-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 11:34:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8382B9F94
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 11:34:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2D6DD30080B8
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 10:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD3A2365A0F;
	Wed, 18 Mar 2026 10:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RL9l5bPA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VAeq5G5a"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F13836EA9F
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 10:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773829997; cv=none; b=Rhr6v2jPW3oSl9bWvDVAuAjvVT4Ij8vwsWqhsxPN9LL8MNmEqS9Hu9hRQ05rV3EiE96bdf01cker4CmCV+01LXXFS9wlrNV93l1hR2bu5jzjC2US3KIUkNdE5KBONxSB9zlBt3wBmQW7SMr7HAf4vDVsP+iQy7H5xEMaFM8HLR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773829997; c=relaxed/simple;
	bh=fHT07WGvsF5oyKJPCxxx+aAXOYyKPsTUTXwpeKqag3w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KCUe8ucfBS9u+biLb4sZ79XJeGniVavVDaieXXiaoFoKWLkF1glb8Ay+gzPug83S6boCZ2L/htF9GTwTXov4kW/7zxn0pr9UZQQHYoC+H7+mWzLeZ5ejro25jJp7RZf26sgYsQ+VgmHH8px6V8Eeu7Ij/K8aU7GNSfwpomRMQWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RL9l5bPA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VAeq5G5a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I8G16U1050312
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 10:33:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6K+3Nv2mtVzd2XCCEAvRvSqh92obrJDkBtTqu9w2Q7Q=; b=RL9l5bPAcn2R0LtZ
	IKpeE74hQoYbrp9z+/HcGBTKg7GICKcpjQBlHntYm96WdkeFOWY5r6IX/g7glbGh
	4O83s+dYGBu2RczoFdwT/0U8Qd0MF5Nj2A8so03iu4MNxc8bTUiNd+PRgfgsYALf
	/HLQw8ZZyriU5Oq9xn7U8XE2xV0usgRQUD1L/XrXmIBprRJwzXhpRRsL9pRiDio8
	1uP4FXEUukxpGl8hZl+47Y0nMOnhjS6aaaLrDGMa8qWOJMmPjI8y4CeHlTq63xGz
	D1lVF2xQ1JyRd9ufONyLGuK74Eeqn3qkfpsCRKRHd3bHev39gYnAj1X2L/J88Pai
	rHVZQg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyj4ej37f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 10:33:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b061868724so156265855ad.1
        for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 03:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773829993; x=1774434793; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6K+3Nv2mtVzd2XCCEAvRvSqh92obrJDkBtTqu9w2Q7Q=;
        b=VAeq5G5auBlht4Yo+vI1jvzBskIhaJxmsG2M+4BDX4oeIFshjAgAaAjz/8xcTpRrEh
         YzaGhT+BAdT4j2Y+KvvuUlZo5rHb9Gx/hRNFnV8hWwPOt4B1j5Yqj0D11rdffinuK+mC
         NdnWLNfUf9rl+sk+6pDU6jfrUyfk1jN1JgmB06mNL1JRmTOX3W6B8KkQ9JJDbPjxaolS
         7MH4RtnOaWOjRaKjN6jHRfsSOe05hxt38efFLdHVGk+N0sU7u5sLI2OvJDNUEPbPrRgw
         kNs3nZxbDluRd5ohXWRZRgIR5SAztZeS1tvpGnA4EF3gJIQrCrtEtwpss1eHqLTj3BHX
         izLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773829993; x=1774434793;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6K+3Nv2mtVzd2XCCEAvRvSqh92obrJDkBtTqu9w2Q7Q=;
        b=jMPjYyHSn0TpGX+lAT9cs2ve44YhYkmxv3HRLev2xtRzHqz0DoEpIIOGTG0aNulCpp
         liBR6uOM5L5enQIbtYBvfieE6oU8hdTcpq7yjXnvt62rVRg/TcRjqqUcmlpBpOEFNg0G
         KFcQIToL1H0+lmm09ZV7ekZZn1oynZzaUZyxS9N4X9SL+GrDLrv4qWaD9XQHOti5M95S
         ApTCp1bPOi9Gh2/hE1B/V+/fxAwv7Bbs3UN78ReVu4O+ZME3u9qxYNZcCxQxNclkuAl2
         iSjwYhF+JfkdnqRXO3bqwp7DLq/Sc/w0d26bZIr1GoW4O+smDFwB2WZgmp+LjxRn8qiH
         sVTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVP0J9K2occFkkpW4xgVG0LcDPTYqmT/uPoclLy1Ne0scnI2U5C+PJ3yKBjTw389a+j3Ps787sOInuFnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZFmQnObm/KWizZXP/q0q9HCSysF5cfzJpgAzk3clSo7sY6VTr
	GSnbiZ2rvkEyhOCDroXSU9/qNp4BKvgqOxnmXj1yrvI5neXOd6fgi1O5kLuH5uw3iKlHznBFeTj
	IQgMAu/FIzlg9XdoRciSfjvXtf4H1rci+y4iuyGDMNDNehAPy32ZGCBCySx5Ips8qxw==
X-Gm-Gg: ATEYQzxnIty5wbSHaM4vdPfy7mhrSfeFeTGpJ+2IOag0cKYffB7ftCEnkDEt9CQmfKy
	hiHLV0TLetYFkfa0IJIwHayCQhk6J1qJMv82X8KOJg75yplZpNBkf+1+hiTZaFNrsNKx+hQB3yX
	Jbe2CEy+lNEjwkhNToaPgAJvS+FUqYuYiIlc8qlVj7AbKV9D5iJewbUFFPQUjC95HMbVnG127tw
	6uiaTY9MeUH2x3TOCcKCOHgP5xEBX0kLsKNjkAgHCwEKLc1i2pjAkGjYDlQ3RUOlDGRYZ7M/ngw
	WfaJ0jkYJjDcvAbLIsrZcYQZiJr35JX/3n6/6b5ZRQKAH/Gl1ihnChQkH6Pb8MJLYCzwXq+fIUg
	4sn7uzFfqedx5icYLjfkRzD6e4pfkh2mBZZolBA8lYpwJZrr3d/jxdA==
X-Received: by 2002:a17:903:1986:b0:2b0:6140:aa65 with SMTP id d9443c01a7336-2b06e3ca13amr28724965ad.30.1773829992783;
        Wed, 18 Mar 2026 03:33:12 -0700 (PDT)
X-Received: by 2002:a17:903:1986:b0:2b0:6140:aa65 with SMTP id d9443c01a7336-2b06e3ca13amr28724725ad.30.1773829992350;
        Wed, 18 Mar 2026 03:33:12 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e605108sm30601495ad.60.2026.03.18.03.33.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 03:33:11 -0700 (PDT)
Message-ID: <eff4fb4b-d857-5c0b-2285-946806e8e4cf@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 16:03:07 +0530
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
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260316-iris-platform-data-v7-0-fc79f003f51c@oss.qualcomm.com>
 <20260316-iris-platform-data-v7-7-fc79f003f51c@oss.qualcomm.com>
 <3ee87252-6b90-a389-0621-5b0b8d2f87ff@oss.qualcomm.com>
 <yhkio67g2ka222lq72w5cmftczdsiugws3ykpcxuhdrhu54oh5@gjazz3j5lci4>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <yhkio67g2ka222lq72w5cmftczdsiugws3ykpcxuhdrhu54oh5@gjazz3j5lci4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T4+BjvKQ c=1 sm=1 tr=0 ts=69ba7f69 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=RgczR8+8wRjDfzPIf2UjDw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=DwhbU6C3bo7Dc5u7oEUA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA4OSBTYWx0ZWRfX/c6CgzkRUBsd
 CUqn1K2YGqZaaxiDMzdrZjH43A8PdPlb6UrqAXINLinVJ8axaSbVFgzxXpCrkVjqlB/8V6AZlzk
 KuKieAYWLxtx3/ACh4JtMcWbpO7J94m5RlFiv9dxaMXm7HYgEq1oQZEtfzk5v+sNcNSbPDPeyzr
 nQ3/bF2xwmJJTSGL4THAaf+jNxWDywJ4tAnKTAAdon+0iGLMB3MtI0HMcgFbmgzhZnhrGUjRgVY
 AVWeVVMJA+mlT9JAZtEpwp1n+mNB/6MhiElN9LtS0WjmjlXn8cIuD+CLjZhQ4wsmpkl+aVCorqD
 6KvslcNKDEtH42IJPMCUuaYz+G78sGgCdmZeNlmcQSVmY05jw3pmL6IhN/fzrTrQH0g7V2CDffk
 woYO1XjsL3K5dMGZdk3JTjhRJ4+gsHR3dBl6TD+cOMFMlf3e01GqpH4I85vUTQ2HwCgu43r7VDC
 dts4ofs5RgMW17kvpZA==
X-Proofpoint-GUID: YNlErslJGWZPwuobLtWOYOZ3Bj6q8NnW
X-Proofpoint-ORIG-GUID: YNlErslJGWZPwuobLtWOYOZ3Bj6q8NnW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180089
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56195-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6C8382B9F94
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/18/2026 3:59 PM, Dmitry Baryshkov wrote:
> On Wed, Mar 18, 2026 at 02:35:30PM +0530, Dikshita Agarwal wrote:
>>
>>
>> On 3/17/2026 12:24 AM, Dmitry Baryshkov wrote:
>>> Having firmware-related fields in platform data results in the tying
>>> platform data to the HFI firmware data rather than the actual hardware.
>>> For example, SM8450 uses Gen2 firmware, so currently its platform data
>>> should be placed next to the other gen2 platforms, although it has the
>>> VPU2.0 core, similar to the one found on SM8250 and SC7280 and so the
>>> hardware-specific platform data is also close to those devices.
>>>
>>> Split firmware data to a separate struct, separating hardware-related
>>> data from the firmware interfaces.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>>  drivers/media/platform/qcom/iris/iris_buffer.c     |  82 +++----
>>>  drivers/media/platform/qcom/iris/iris_core.h       |   2 +
>>>  drivers/media/platform/qcom/iris/iris_ctrls.c      |   8 +-
>>>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |   8 +-
>>>  .../platform/qcom/iris/iris_hfi_gen2_command.c     |  66 +++---
>>>  .../platform/qcom/iris/iris_platform_common.h      |  82 ++++---
>>>  .../media/platform/qcom/iris/iris_platform_gen1.c  |  67 +++---
>>>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 246 ++++-----------------
>>>  drivers/media/platform/qcom/iris/iris_probe.c      |   3 +-
>>>  drivers/media/platform/qcom/iris/iris_vidc.c       |  10 +-
>>>  10 files changed, 205 insertions(+), 369 deletions(-)
>>>
>>
>> <snip>
>>
>>> -struct iris_platform_data {
>>> +struct iris_firmware_data {
>>>  	void (*init_hfi_ops)(struct iris_core *core);
>>> -	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
>>> -	const struct vpu_ops *vpu_ops;
>>> -	const struct icc_info *icc_tbl;
>>> -	unsigned int icc_tbl_size;
>>> -	const struct bw_info *bw_tbl_dec;
>>> -	unsigned int bw_tbl_dec_size;
>>> -	const char * const *pmdomain_tbl;
>>> -	unsigned int pmdomain_tbl_size;
>>> -	const char * const *opp_pd_tbl;
>>> -	unsigned int opp_pd_tbl_size;
>>> -	const struct platform_clk_data *clk_tbl;
>>> -	const char * const *opp_clk_tbl;
>>> -	unsigned int clk_tbl_size;
>>> -	const char * const *clk_rst_tbl;
>>> -	unsigned int clk_rst_tbl_size;
>>> -	const char * const *controller_rst_tbl;
>>> -	unsigned int controller_rst_tbl_size;
>>> -	u64 dma_mask;
>>> -	const char *fwname;
>>> -	struct iris_fmt *inst_iris_fmts;
>>> -	u32 inst_iris_fmts_size;
>>> -	struct platform_inst_caps *inst_caps;
>>> +
>>>  	const struct platform_inst_fw_cap *inst_fw_caps_dec;
>>>  	u32 inst_fw_caps_dec_size;
>>>  	const struct platform_inst_fw_cap *inst_fw_caps_enc;
>>>  	u32 inst_fw_caps_enc_size;
>>> -	const struct tz_cp_config *tz_cp_config_data;
>>> -	u32 tz_cp_config_data_size;
>>> -	u32 core_arch;
>>
>> This can also be tied to firmware data as this is required to be set for
>> Gen2 only and is 0 for Gen1.
> 
> Will it differ between platforms?

Nope, same for all platforms with HFI Gen2.

Thanks,
Dikshita
> 

