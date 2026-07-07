Return-Path: <linux-media+bounces-66822-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yiREIp7CTGoopQEAu9opvQ
	(envelope-from <linux-media+bounces-66822-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 11:10:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEF07198C5
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 11:10:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=n4mRFohz;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Vv8ODFGJ;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66822-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66822-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E80723055D14
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 09:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC159330668;
	Tue,  7 Jul 2026 09:09:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FE438F927
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 09:09:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783415366; cv=none; b=naC4D363FuJLzuscxd5In8NcEvkmn+I4AWkLBUi86S+1l6jSpDvgE1xidA687CXEHq4BeujucD3zhvmxB4LqFf5Tav1kPQLrgig6VywaCoGb+hLQ6qEqQzZG0pUCqA/eI8I2VOvcTegBk/+zVbkiMjy8EUk8mbFWL9JZ0Qu8GZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783415366; c=relaxed/simple;
	bh=ZjIq8ms6DgPyFt63proaPZOnpHgwcqJnrRTOark6I68=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M0kgo7Kix/7Iilo8L60Nxeqxtp2wrkuYedZQxTXC4boMmq14r527E/9/6xCmkED56n15AdbC/dECN7VP2AznGgS367aOIL237JYQIgPFuPIqFNawH7QN3EzOJd0uXkQvhL6k3a2mBS9/sRwnRcy04jXEcMlhdgwQmAJptZP5aNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n4mRFohz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vv8ODFGJ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678E2U33070557
	for <linux-media@vger.kernel.org>; Tue, 7 Jul 2026 09:09:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9hAjrt5nnoYq/p1FQyjrhb8o2fPRkgaWySDGjphpGK0=; b=n4mRFohze28BMRTr
	2rqL9m2tfUtPuZf5lRG2nAxBTJKe11YMAFBbLoKS6JubHX1DQ3ZB7Ixf+ELa7jyv
	6ubg3fmiYVwcDIzDdEmahQERgYwLHAeYB+lZs/AvxZpgLPkc12xDlw1JUys1LGSF
	P71Y3FWQSQvoVH5f+Zatpbcgj7eg3tSP8PUpkFBduVIO+7ssU4UlwNUGIlpvmDLs
	16c7CIfXKuHCd7gWnze18skZChzy31cgLcWGV8XYloOuqQsRFqLzuit47faQISgk
	5Ku5ltz/kRMTDvk7tHLaWw+ezRho/BPYZJbJlf6tdZ9cveMlR1KraGdKq96bpu7S
	ihFplw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8sm8h6tc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 09:09:24 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c889d1eebafso9747555a12.0
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 02:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783415363; x=1784020163; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9hAjrt5nnoYq/p1FQyjrhb8o2fPRkgaWySDGjphpGK0=;
        b=Vv8ODFGJtmLHQLd3sR72SoetAwJDKSpgQJzbV65WJIrj1IAMJHAxW/+V6CAjVpYbf6
         nJ8tEJj6X+RThvde8mhL9Yph/FvNegE2iDCvRdpQknPcWGQ+UsICjP7ZSlSyoBMIYwHC
         t/nfTGv9wV7plOIcZ73FD2mvWZL+TRrPQhP7lamzfLY+EAhlqeDj23GIatBhGY1SNfsB
         wHGAaZvcgPX7ry2oWjoyr3uawLITEzADUg389uayuk3asfCjCg81N4LOb+LYvTm6NrLc
         HU/JXRhEKHX+OxCu0VJM/xMkjUV8YHXC28ywV8sKGvul8OBLiWd19gUZxhd9gUsRSKkZ
         vSAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783415363; x=1784020163;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9hAjrt5nnoYq/p1FQyjrhb8o2fPRkgaWySDGjphpGK0=;
        b=U1uNTmlKDjdwqXcMvsKYyhwNzwRhu/P5fLYj9p6krUEMw+bj2oFN3d1+Nbk3QK/DFr
         WLIn469poQhttWZRFc+4LTqndDnmsUQ0XnAVPt5ttQRkJlIeSdJb9teUGFuBPJRS3gqx
         esLWifJFz5WPCe8AJ59P3ZBXHVgc7W1tRCKW8Lp344Lbe094LrrPO2k2FehB4unt2O0m
         pCoEI84Q/mDU+SwwUd+RvXiqvnERvmgWJ45l48ZqcHg7wqm78cc6uWLHm2RaHxKwMVHs
         vpVYf1+2gYtVgHDt/Xr64p2WB9YAFZOSv1eazSR5rM2DQnvDGsYSch9Ofwzimec7AipV
         9YFA==
X-Forwarded-Encrypted: i=1; AHgh+RrxUjfGD033C/ZD2Ch47zMC/Cq2qYuGuC6jRnF6TWtwtJoLL2PQdFNMgWYUawNmTpoNRK2Y7xMF4Tn5Aw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUiSAJL4zuc5QJwQQbhciGRRuZ3y3jrOe3ukwHfuvS0sIlDQAI
	qFNf1mqO9s+6rdqeJtUwLnUIq5HegsFAg30UarDCtRD7TCZ2cIfF5iEtgD3zt7c0UEKJmMYjBeV
	bLrTIIA6RmVhxLhWujthSILMI+oBpMdzKWQZpaG9PF+grbIY3AvM5pRJtftslObdq6A==
X-Gm-Gg: AfdE7cm0UqGd3wxFP1JRdvawMJMlhoB6RhNZjbttml5Y0ZLiX0Di6MthYcsxmCmjjH/
	RKNbOo3y2Nc8VSBgeAs5XNb8GoePa/WPkugrNLcV/yX7YljDuJsONa0ANrckZC9eGUNKNIG4Y17
	NrWYERFRZbxGQLFTWUuYG0T+Nssrn1MwYEGHfo9cg8dLLe3XLlm2p/CppJiL/OwgEXnvFH4vTsf
	2C1sQfKji4JTdhAWVj6dpu9Tk0a0k7VuaO8k/19Oxvu/8qSw+BdoZpuzriPfS8FJOR5qSVBPDnz
	FUd105Ky1jPuS5gJCHdgRdNDE8QnnfRJcimvnadtQNOKR5emlJO3IyFEVd4aqwDB9gxb1oSarta
	GDWYA4QSwPuceGPZPw+t1rdvqv3hY7DyEgXMRnBHvGrrU
X-Received: by 2002:a05:6a21:3997:b0:3c0:9c1b:d0b8 with SMTP id adf61e73a8af0-3c09c1bd3famr2563353637.67.1783415363462;
        Tue, 07 Jul 2026 02:09:23 -0700 (PDT)
X-Received: by 2002:a05:6a21:3997:b0:3c0:9c1b:d0b8 with SMTP id adf61e73a8af0-3c09c1bd3famr2563284637.67.1783415362738;
        Tue, 07 Jul 2026 02:09:22 -0700 (PDT)
Received: from [10.204.101.214] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659c865asm6435355c88.11.2026.07.07.02.09.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 02:09:21 -0700 (PDT)
Message-ID: <77aca547-1afd-494d-a2ec-35ba9b4d37f5@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 14:39:16 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: iris: disable time-delta-based rate control
 for VBR
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Gourav Kumar <gouravk@qti.qualcomm.com>
References: <20260707-qc10c_fix_and_disable_time_delta_based_rc-v1-0-33fa130bc535@oss.qualcomm.com>
 <20260707-qc10c_fix_and_disable_time_delta_based_rc-v1-2-33fa130bc535@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260707-qc10c_fix_and_disable_time_delta_based_rc-v1-2-33fa130bc535@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA4OCBTYWx0ZWRfXxCKQJJt7nFk0
 zySa2stjldle7xBrON+SVLfEELi5B3wWA42uzY0Nz+d+veo7E1324e2xXfdzmaFdNMZs3rjlpuU
 RyjOdp/yBlISh7r8gr/kMvuFEfFSU03tnox44V6aKe8G8bnMB0iNJiDP4UFxNlDajJ1MT6MOk6d
 tAkv20TMRV/y/INr/7l/aZ2zQH2R7aYCRzxT+2/48ppkQTso3syXmk7lIXHNlCcq6ODXg3k8PCa
 giluV4PSwNELBTLAxiS4iWT5nG60xV07NzaS2uWyu+gvOsGH3YtfIt4Tnxf0UzUzoHDcHjZkzB5
 0KWs1E3gJGC3IMjyVihwo2Jn42jk5zSyS7Nm8DXZNPYQYPvhh8Y1U4lYZ4CnSe1MzgqXk8axAHp
 380klR6BMufkgsew4wJRTctDWeVRUBsQMqKDEm1CWiUaKtLwUGlxv/w9c5kqKMEGVPGnY9oFh5E
 ekFKjYJ7Nle8C08K1Jw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA4OCBTYWx0ZWRfX0ftV22SpW7zg
 WPH/QlQ80jSGUNNsCBpAA4DjxXbpyJNVe/7VnoWmkBX6aqBHR8waM4ZHbpyebcFnjhUmTVOOq5n
 gtTZ3z+1VUc9KsW+KpRW2Cvy5XxTQIw=
X-Proofpoint-GUID: DyTIuYOCvRGjtLszvCEGAHYZvsDRgmtp
X-Authority-Analysis: v=2.4 cv=UvdT8ewB c=1 sm=1 tr=0 ts=6a4cc244 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Ce3FUQhJh8VfwZ4kZc0A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: DyTIuYOCvRGjtLszvCEGAHYZvsDRgmtp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070088
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66822-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:busanna.reddy@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:bryan.odonoghue@linaro.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gouravk@qti.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EDEF07198C5


On 7/7/2026 12:05 PM, Vishnu Reddy wrote:
> From: Gourav Kumar <gouravk@qti.qualcomm.com>
> 
> The iris encoder driver was not sending
> HFI_PROP_TIME_DELTA_BASED_RATE_CONTROL to the firmware during encoder
> initialization. Without this property, the firmware defaults to
> time-delta-based rate control (enabled), which calculates the output
> bitrate from actual frame timing rather than following the configured
> bitrate target.
> 
> This caused variable bitrate (VBR) encoding to produce ~5x configured
> bitrate. For example, with video_bitrate=896000 (896 Kbps), the output
> is ~4.4 Mbps instead of the expected ~896 Kbps.
> 
> Time-delta-based rate control is designed for variable frame rate (VFR)
> scenarios where the encoder adapts to actual frame timing. However, when
> an application explicitly configures a bitrate target, the firmware must
> follow that target regardless of frame timing.
> 

same here, we can drop the new empty lines

> Fix this by adding the TIME_DELTA_BASED_RC capability with a default value
> of 0 (disabled) and sending HFI_PROP_TIME_DELTA_BASED_RATE_CONTROL = 0 to
> the firmware during stream-on, allowing the firmware to use the configured
> bitrate as the target.
> 
> Signed-off-by: Gourav Kumar <gouravk@qti.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_ctrls.c         | 19 +++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_ctrls.h         |  1 +
>   drivers/media/platform/qcom/iris/iris_hfi_gen2.c      | 10 ++++++++++
>   .../media/platform/qcom/iris/iris_hfi_gen2_defines.h  |  1 +
>   .../media/platform/qcom/iris/iris_platform_common.h   |  1 +
>   5 files changed, 32 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index 10e33b8a73f6..f6136e655b98 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -1477,6 +1477,25 @@ int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_typ
>   					     &bitrate, sizeof(u32));
>   }
>   
> +int iris_set_time_delta_based_rc(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
> +	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	u32 value = inst->fw_caps[cap_id].value;
> +
> +	/*
> +	 * Disable time-delta-based rate control (value = 0).
> +	 * This overrides the firmware's default (enabled), ensuring the
> +	 * firmware uses the configured bitrate target rather than calculating
> +	 * bitrate from frame timing.
> +	 */
> +	return hfi_ops->session_set_property(inst, hfi_id,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, cap_id),
> +					     HFI_PAYLOAD_U32,
> +					     &value, sizeof(u32));
> +}
> +
>   int iris_set_properties(struct iris_inst *inst, u32 plane)
>   {
>   	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
> index 3c462ec9190b..10e046722ad3 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.h
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
> @@ -47,6 +47,7 @@ int iris_set_layer_type(struct iris_inst *inst, enum platform_inst_fw_cap_type c
>   int iris_set_layer_count_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>   int iris_set_layer_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>   int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_time_delta_based_rc(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>   int iris_set_properties(struct iris_inst *inst, u32 plane);
>   
>   #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> index acc0ed8adda1..d119ad599c31 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> @@ -416,6 +416,16 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {

targets other than the one using inst_fw_cap_sm8550_enc ?


>   		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
>   		.set = iris_set_bitrate_mode_gen2,
>   	},
> +	{
> +		.cap_id = TIME_DELTA_BASED_RC,
> +		.min = 0,
> +		.max = 1,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.hfi_id = HFI_PROP_TIME_DELTA_BASED_RATE_CONTROL,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +		.set = iris_set_time_delta_based_rc,
> +	},
>   	{
>   		.cap_id = FRAME_SKIP_MODE,
>   		.min = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> index 776b21cd11b2..8766d9e49611 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> @@ -67,6 +67,7 @@ enum hfi_rate_control {
>   };
>   
>   #define HFI_PROP_RATE_CONTROL			0x0300012a
> +#define HFI_PROP_TIME_DELTA_BASED_RATE_CONTROL	0x0300012b
>   #define HFI_PROP_QP_PACKED			0x0300012e
>   #define HFI_PROP_MIN_QP_PACKED			0x0300012f
>   #define HFI_PROP_MAX_QP_PACKED			0x03000130
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index c9256f2323dc..99dc6d5c72ba 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -183,6 +183,7 @@ enum platform_inst_fw_cap_type {
>   	LAYER3_BITRATE_HEVC,
>   	LAYER4_BITRATE_HEVC,
>   	LAYER5_BITRATE_HEVC,
> +	TIME_DELTA_BASED_RC,
>   	INST_FW_CAP_MAX,
>   };
>   
> 

Regards,
Vikash


