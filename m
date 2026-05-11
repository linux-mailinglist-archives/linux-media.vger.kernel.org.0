Return-Path: <linux-media+bounces-61044-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKaxI5luAWqPZAEAu9opvQ
	(envelope-from <linux-media+bounces-61044-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 07:52:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E23C05084B2
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 07:52:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1198E3016CB7
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 05:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06D1737B007;
	Mon, 11 May 2026 05:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MKRQJQIX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aB6bbaMb"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E5A378D94
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 05:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778478732; cv=none; b=DYNImxEwLe0qzmDSf5XN/5sL3ORDVlsG3f+S1eqJ6B6NzBTCDWekWBHTfQJJwO05Ou0PvZtklEfii/HPozAai4Xl88HRot0fXDcAtu1yqNZMRJt+6H7H8+0MmIPgOV/1Sdt/FUrN9v+YOo9dgctU8wH2YSTIuSkfNMA48z1fj1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778478732; c=relaxed/simple;
	bh=gEygSniM1pwb1d5rEaDZ2qpWQGQVXMOGcEOj7g0O7IU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W4Vu3kiE3jCOnAlvNcLnzG3/2X0JsHf0GMuKQAt22numQsASETlpAm41cR2bR0Kx1zJ4f8bmdfjrhRys8H6LSvANoFeuLUGEdadBJACM9+kN1ul7BMAjW9dYAYK2S57fD2qRwohgwYFHXb6kYUbN+ORLuOWElDWEScJNlTCCc2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MKRQJQIX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aB6bbaMb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64ALsupv439441
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 05:52:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bvnm4K8l7T6NPyyBPovwsigFHLr+oEtTC7vrT+0xgto=; b=MKRQJQIX2JUTzPCx
	8Y2pzj0LgpMtau0ftlz/Vipjpl1U53aO+tONxgAjzzawcI3wcKHPtyV+LmnGU7+m
	VKAiMoB/qDM3Nvd0Q3f1axUa0sq3GNfvPzUMdgP6IWirvXgSv1hG3r8qWYEPuEsR
	04HAX4DXLx9XyDbZ9b6tVhXOGxQzZtkFRaNOcXhraYSuzx59T0tILDg9u7THcHAu
	47AqDLDX2qxuBMwnR3jLqN2sj824KG2b8InEgmRk+AjX3yl68/9hDhuNmcnXu+3A
	JprXAAxHnYzieZUlGWq4ugJARxuF1TThluAVTD7Q5lRCHcmie6HaQD42Wm1cZmxB
	isnmUg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1wpeckp3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 05:52:09 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-365bba50e82so3817713a91.0
        for <linux-media@vger.kernel.org>; Sun, 10 May 2026 22:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778478729; x=1779083529; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bvnm4K8l7T6NPyyBPovwsigFHLr+oEtTC7vrT+0xgto=;
        b=aB6bbaMbp2ubPqLlNQdY4EsgHg5VgtMtlFHiUBolxAClpHR9JEmXEspuvoYDk5nC88
         1/XfAr7vTkhAVpyV//UtnThwjnIecNWvIEEpggoePRW/MqHY8aNW2ncP+Ql0bh4r3B0b
         EqnGUhYZKh9EAp7K3TOC16oR+uxdtWzKB6MUZ9Z5ojBLIGc+GkRcO1C1QcudqKYc4sZ1
         DFG0hLtnfvx0NXJAhfZAv2eFRNUJaINAbnGQFoaBdaroB3O51ZG9cOvYaJF/RZsg1KVt
         JNsi3zFMZEx2eod2jTKBps2WurRI8onXvX/iRir75Ea98BrFGInMi/QX/wvczdDCJQyx
         AfcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778478729; x=1779083529;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bvnm4K8l7T6NPyyBPovwsigFHLr+oEtTC7vrT+0xgto=;
        b=Ws1edPT1eNYc+NRSyOFxZGmNU8KGVoqiO4dWs0YdaAptP+K0jI8YC/8BXxTlirGHyz
         lvgEFQGeMqb36GA0GLDzpluvQWIEuALscW33rgdv4OGUUJRvf6WTL7spFEyyIQXMLMYl
         j1tF5aMb+UEaFK8uVL5DRXwP0bk0OwkxGVh3OOH+tL5TCA+mGC4zGVUEemB3a1wRikFB
         NDmU4kb1PUWdfcCwvq6XAiowlsBIlYzKa7/OzyLG8uYESb9iZwEvYBpcMN2KT57AaEut
         4FSw9MEY2WtDSjlBu2UnaL4UDtyCGXaTNX4N4IpjrwxbhMREgsP+lsdJxyKgKft0sY59
         eEAw==
X-Gm-Message-State: AOJu0Yxsezo2EEX+u9Y/ww7qsVz73nAPPEtTjadVfhTnRN+QebG4YjxG
	CLyiKormwC85WOqakbxHQROjAn2rPzF5I6fvXh80A7nE2PJUt+VkRiyhE4tRtbHUJLeFCFyCnl/
	wFilrJLliilqCisIkvDV/F3nELGJsK0+b2ouWdfcI0I6gWgTCgAHTV17PLU0MNdpwaQ==
X-Gm-Gg: Acq92OGU8COK1QeEYmtTJSK4c5TWNEcKTVdPR6p2uFsrZnX6+xKbIaBQNFZStaqRzHb
	QQ9RW+fS5bzmgWXITguz1zb2Lqkw14PFcGVF3qiWr6rCwxO3IJhmqdxjgLHUwFGrx/aKOi4HR3D
	dHU9sQftFqTBAfKyrEO7zOh1RDNxARIAjjhPEOsxw+2uFdjCVEYhU9alOmv4t0GZ6QMTUDK+FIL
	Xwt38iRz0P2a7Hz8t7ZhNuOdOM8OuLDCVrZeBhFsfon9vbE83tNcLvAqLq9/6J1Nk2FnDsOhfRY
	yXk8QYUafeDdfTEx7Ld7uD8L7QJSaCcqrz05UNq7PkdoCOBeBkj3T2K77JnTlf5F+EdoroBsrMB
	B21wCVGGO09QzU0p9WOUNoCXkwHNQL6ts9ogeC/UlRqcnlxEh6q1Ntw==
X-Received: by 2002:a17:90b:3c0a:b0:367:e244:4c40 with SMTP id 98e67ed59e1d1-367e24450c9mr7642003a91.26.1778478729062;
        Sun, 10 May 2026 22:52:09 -0700 (PDT)
X-Received: by 2002:a17:90b:3c0a:b0:367:e244:4c40 with SMTP id 98e67ed59e1d1-367e24450c9mr7641978a91.26.1778478728584;
        Sun, 10 May 2026 22:52:08 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d683fb92sm6113862a91.12.2026.05.10.22.52.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 May 2026 22:52:08 -0700 (PDT)
Message-ID: <b473e703-17ea-1cb6-8efc-697ecb7779a3@oss.qualcomm.com>
Date: Mon, 11 May 2026 11:22:01 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 05/16] media: iris: add vpu op hook to disable ARP buffer
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
 <20260507-iris-ar50lt-v1-5-d22cccedc3e2@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-5-d22cccedc3e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NCc7gYrlQz7AOl6vnGfNbgUD-In2xD9-
X-Proofpoint-ORIG-GUID: NCc7gYrlQz7AOl6vnGfNbgUD-In2xD9-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA2MiBTYWx0ZWRfX+8YChCGc4iXQ
 h5MoZoafmKDJSDtwQm9J+h5x56XIRVOfMVccbHkiBQYEHro09G7U30FYMb3OM4r73U/BZkZEzI8
 crdEwC+soQkP+Z3OVV8Ycl9h+YNc2CDeg5r+NjuKfyW6AIswZPXvkGqWBPeB0htSRJbQeiOzl2D
 8vaD7g1EhsLjwuYnDtjI/Dqk5QD9B7sjsEhmi88ArumTC0kf/AJW82Apc4SYN2VzSNkbYEgzmlX
 P89xuUHgiZ7L+piyx2SAik5pzmgN2GUdoYqmJLLMl7hIe/mtiRGX3ZlKqqLzgjGvjgsMZS7FctS
 n1I4aAjubaYoYufvkPCOVcDRfg73MEYF45bAzJ5OKpi6eGTtYsgNxF8mV6C+c1oIdpoFY1/Jt//
 cO7blmdoSEWX/Tz7hYw8/HycQc5EYirzLJHlTaBK/ZWFRhh9S5WsiwUFFrK31KNFK7Nhzb2qAKD
 tiUAW08UslMcH4ziI/g==
X-Authority-Analysis: v=2.4 cv=EeD4hvmC c=1 sm=1 tr=0 ts=6a016e89 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=EBYp1ujtl4tFS5Gl5KcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110062
X-Rspamd-Queue-Id: E23C05084B2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-61044-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/7/2026 12:12 PM, Dmitry Baryshkov wrote:
> @@ -144,6 +144,7 @@ int iris_hfi_pm_suspend(struct iris_core *core)
>  
>  int iris_hfi_pm_resume(struct iris_core *core)
>  {
> +	const struct vpu_ops *vpu_ops = core->iris_platform_data->vpu_ops;
>  	const struct iris_hfi_sys_ops *ops = core->hfi_sys_ops;
>  	int ret;
>  
> @@ -163,6 +164,9 @@ int iris_hfi_pm_resume(struct iris_core *core)
>  	if (ret)
>  		goto err_suspend_hw;
>  
> +	if (vpu_ops->disable_arp)
> +		vpu_ops->disable_arp(core);
> +
>  	ret = ops->sys_interframe_powercollapse(core);
>  	if (ret)
>  		goto err_suspend_hw;
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> index 9151545065cd..71d96921ed37 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> @@ -24,6 +24,7 @@ struct vpu_ops {
>  	int (*set_hwmode)(struct iris_core *core);
>  	void (*set_preset_registers)(struct iris_core *core);
>  	void (*interrupt_init)(struct iris_core *core);
> +	void (*disable_arp)(struct iris_core *core);
>  };
>  
>  int iris_vpu_boot_firmware(struct iris_core *core);

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


