Return-Path: <linux-media+bounces-64119-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PvtlFeRVJmolVAIAu9opvQ
	(envelope-from <linux-media+bounces-64119-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 07:40:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3764652DF2
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 07:40:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="R/74z34k";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=aEkqJLPY;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64119-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64119-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C6C93037E40
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 05:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38163374722;
	Mon,  8 Jun 2026 05:38:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512F136F8EF
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 05:38:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780897124; cv=none; b=CpAbcF33FF3kOmqsHbDMyKa9fR8BhkgTRXU7IwZfzdO2kXKU3jlfE0iPG6UdgsZU0U6gatgdedf6NqDh2siLxujkT6cFVySYbJg7o/9EItu98He4pcw7mA2L8maw0SEhaaxM2oqTa5RgWXBMJzNe3dHtXCt/XwiTFuv11HaYl0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780897124; c=relaxed/simple;
	bh=KPGNczJBcKa5n33vVRzqAOS+owv898/wiOzqL1lwvJo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Bh6hWuO38yT0cf1IB/SFumeV97SorvK4wPus8JHr3Ai7KMgHOH/OU3IFBUxZVlZ6aV/t7iZAJ5/vdXd9K49RiYD3vhKEGPlHbNx4KNxS09RPvkXDjuOZhLRlRtkZB3CvQ8ias5AwpGtdCP9vHGubQsoiKKbMcsr3Anq1qjVOrDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R/74z34k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aEkqJLPY; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580FN212023416
	for <linux-media@vger.kernel.org>; Mon, 8 Jun 2026 05:38:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	39xli6mKUWevjHUp1QKqTq7XuCw/7UBNPDjl33iPSHY=; b=R/74z34kdgk+lspY
	cvCfWHOUmQ/FCfyIHkIrokwHJbXNwGxX9/kryqdNtUAsNpf2yOaj2WhYRgh9BeLK
	G3MkHrq6Uf0uE8aZNaMj3SYR5+4aXDIFSyBKLe8aAtK6RVDv78BdV4HIXhSs+92K
	LQRjiJjez9zU5F7AdkXPlMpkvAQJbeo1sO/MlYY3X40UzM+3+YUlpxkKW9r967ku
	E3iQPVY18iz04JzLBps2E/iCIPG/ZHgolhz+7rCYlnU+IJqJeW/3SCRab/Vja5Ha
	EoyjZvI/obskK/fRATpFTTfh1XNhw+Ov+UZgtA5cRlpvQYdoFnKSYWbB+GSseUWS
	hQbhLQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embmre29n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 05:38:40 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c85807671b1so1953376a12.2
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 22:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780897120; x=1781501920; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=39xli6mKUWevjHUp1QKqTq7XuCw/7UBNPDjl33iPSHY=;
        b=aEkqJLPYtFrpdpXp3YMc9DGjg25qR0yU8WYx0jbeOXyvOB5g0jwaK+vDweLWdD3DZ5
         lwt0GuMmrsJBj5DMjro9XQ8+PNQu/40xcGNIXYU3uU5E8WWVJ1Ws3FH9EMRpxQHsCbue
         CrwWRAxnCDO2+GeWZOQlM4Pp0q/P0jo1jAgR1XzQH8vmyeu0aHHkI9RooQLfMRtCuhQh
         /QWuZRm1ofx74dAo6eOJ2nVyEC5YnQT1J7R5HaFui49iHAFxYq8dnvds+D4dWTu5qIJN
         IPvUuLGmwtzQ030MTnrLICcC2ERPih7BuWgNSTGJlBBQCTA5BohDLhxrw8gNA9Ve3C5+
         H6iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780897120; x=1781501920;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=39xli6mKUWevjHUp1QKqTq7XuCw/7UBNPDjl33iPSHY=;
        b=iAxvMT3ibjyDra07kG2iRCL8NacO/KEcrLqWsSpNlPRNSGP2fptGkKruwiz1enwddy
         eZy5v3nfUxh9+yiqs8J3BfatmV+oeJNTakl7P1r3K807S9zLQWvAzn5QIOydtngXKCXC
         qvmT2uXYh9hzOXWk8P5Ay2Y5vHc2dxxdLVsnrK2va6xTBBVO6BuribxTjjN0Wv4EJRcM
         sqk23ndKyP59zo5wEG6hclTN6qcutjA9eHyFf85RWq2cIshZAZ5/3d36ABa1yHFZRoy9
         WTSLSuzJZY50zq5bwcRT3YhDs+O52q4jSuwMg8BO49RAr5cJus4WpeB+R8VII1tKHvPs
         ae1w==
X-Forwarded-Encrypted: i=1; AFNElJ/5Fc/kvJ+URxqkKsO+7W+pBJ7jmWYr1IPfqPO/vCIp9MfzfeYsApHRh8z629LSicbUB3obNIi9K7OYuw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw74eckmUnjw1mz1oVmOJZSv/+5oezXjImWr8aff4UY7T8Ddq4V
	KficbERoL1E/yQs/Gic1ICc1139DIPhZlljkwYKvHIqJaUQ1gop69ue+L9MJfHzwV9C0Tfnk4nd
	BzcmS/kIUGzZ2qSPCN4yEQ7t8bKLiRI3+QSw+sYv7dhRCTYER1VAd9+TENItXa5CtyA==
X-Gm-Gg: Acq92OEqXq+2EbpK1VXZarr78HHdP8LuKGOIyCpvFMuNnZi3Rby+cvq3f6EmqJT/hBr
	QT6JpNnAxaF5+dbHuAEhQBoc+3S/0KsTZfrd483MRCtNIJkj9KvT2eA9aPA1BpdEMsYs0Q6EfKC
	FhIbgFL8papK30cZhOm5T9pNT6hyDcEMC2Yv0MBI/RBqTzm1pMoNduj/7sPEUT4ZxnRkUFz6sYK
	GIgtIpvcouCHudDaGRFix5yIjikTEh6G7evDhZJn121/NMysSzIYPwdoi63VrpyNhsUnSFVyL0u
	aWTujJOBBYa0uqqhCjcLv0iV8glIZ+lfF9b7m1h9Tr58x/DiAh2noszQVEFKezLqGINrqEAN0Gg
	rjHVimoBVBgJRPJTEpuUQkWWmn2OmA14T6JsNJKdMs9cfrJ5tO5yjcsEiZ9cDjaoS
X-Received: by 2002:a05:6a21:3998:b0:3b4:8549:4fe4 with SMTP id adf61e73a8af0-3b4ccd750a5mr15789211637.18.1780897119650;
        Sun, 07 Jun 2026 22:38:39 -0700 (PDT)
X-Received: by 2002:a05:6a21:3998:b0:3b4:8549:4fe4 with SMTP id adf61e73a8af0-3b4ccd750a5mr15789167637.18.1780897119168;
        Sun, 07 Jun 2026 22:38:39 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0a4afdsm16652381a12.19.2026.06.07.22.38.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 22:38:38 -0700 (PDT)
Message-ID: <e0650526-a616-8155-26ae-642790a43084@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:08:35 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v7 05/12] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260603-glymur-v7-5-afaa55d11fe0@oss.qualcomm.com>
 <20260603143923.58E1E1F00893@smtp.kernel.org>
Content-Language: en-US
In-Reply-To: <20260603143923.58E1E1F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA0OSBTYWx0ZWRfXyAWW7PQK7PS0
 D0F/lBEBepYBMPmGOyt0ueGiEnGH8qanGJROTcKEu6YfLJSjpmc/7U7kbM+kSs0lxJ4HBso5e2R
 NcYk3cRsj0knNngPpg62nJ8ZG0+AN37pmosrPmCCa/NqyBKra4jMyIpTxDCaTfLkKUHC3P7tErC
 fcrZ4IT+ishAjvlZ2O/9+OCaSe0ihLuc+7+GGxIti0hjA1Qi9A+behqawBhnL0E40PTpiKSX0Kg
 fzHmVBPBCAZBWvHmtcvcKCjGtuYUw9cyyim7x/UXMMs7+GG2FLsqtO426gRRWLR2Z7b4uzErG7Z
 o5CAMjFIrtcB6wTyQBpS5rXsxt9o4gmCW7Qed7709+2V2BQMQ5I8GOXopjZaAMwPAEE+jjxQPbW
 eYOVP9bpRCn7m8u/8J6VKZR2U7Aw01ParVknUfBWQi/E3BU3RlT/IGRG8EIsvEQrtgZGwiBbQt7
 9+oEbaOxF4bRG6QHHvg==
X-Authority-Analysis: v=2.4 cv=B5eJFutM c=1 sm=1 tr=0 ts=6a265561 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QttUXbZITexGozAVDd4A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: 1zZAUAS2A1awhV2DHgQU4iI5gjKEyX0P
X-Proofpoint-ORIG-GUID: 1zZAUAS2A1awhV2DHgQU4iI5gjKEyX0P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080049
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64119-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sashiko-reviews@lists.linux.dev,m:robh@kernel.org,m:conor+dt@kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A3764652DF2


On 6/3/2026 8:09 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
>
> New issues:
> - [High] Unconditional devm_qcom_scm_pas_context_alloc of pas_ctx causes a memory leak during repeated iris_core_init failures.
> - [High] Double invocation of qcom_scm_pas_shutdown in the qcom_scm_mem_protect_video_var error path.
> - [High] PAS metadata memory is permanently leaked upon every firmware load.
> - [Medium] iris_fw_unload() skips iris_fw_iommu_unmap() if qcom_scm_pas_shutdown() fails, leaking the IOMMU mapping.
>
> Pre-existing issues:
> - [High] The sys_error_handler delayed work is never canceled during driver removal, risking use-after-free and locking crashes.
> --
>
> commit 85711dbb43a8f02c3f39064784fe37381f80c2c5
> Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>
> media: iris: Enable Secure PAS support with IOMMU managed by Linux
>
> On platforms without a hypervisor, Linux drives the firmware loading and
> authentication steps directly. This commit extends the Iris driver to support
> Secure Peripheral Authentication Service (PAS) on such platforms by creating
> the firmware context device and mapping the IOMMU when the firmware device
> SID is present.
>
> Link: https://lore.kernel.org/lkml/20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com/
>
>> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
>> index 1a476146d7580..8bdc9273036ce 100644
>> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
>> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> [ ... ]
>
>> @@ -30,14 +34,18 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>>  	if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
>>  		return -EINVAL;
>>  
>> -	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
>> +	ret = of_reserved_mem_region_to_resource(core->dev->of_node, 0, &res);
>>  	if (ret)
>>  		return ret;
>>  
>>  	mem_phys = res.start;
>>  	res_size = resource_size(&res);
>>  
>> -	ret = request_firmware(&firmware, fw_name, dev);
>> +	pas_ctx = devm_qcom_scm_pas_context_alloc(fw_dev, IRIS_PAS_ID, mem_phys, res_size);
> [Severity: High]
> Does this unconditional devm_qcom_scm_pas_context_alloc() cause a memory leak
> during repeated iris_core_init() failures?
>
> If a subsequent step in the firmware load fails (e.g., request_firmware()
> returning an error), iris_core_init() returns an error, but the device remains
> bound.
>
> Because iris_core_init() is called upon opening the V4L2 device, userspace
> could repeatedly open the device, failing each time and allocating a new
> pas_ctx without freeing the previous one.

If the dedicated firmware device is not there, will check and skip the repeated
allocations.

>> +	if (IS_ERR(pas_ctx))
>> +		return PTR_ERR(pas_ctx);
>> +
>> +	ret = request_firmware(&firmware, fw_name, fw_dev);
>>  	if (ret)
>>  		return ret;
> [ ... ]
>
>> @@ -77,13 +115,13 @@ int iris_fw_load(struct iris_core *core)
>>  	ret = iris_load_fw_to_memory(core, fwpath);
>>  	if (ret) {
>>  		dev_err(core->dev, "firmware download failed\n");
>> -		return -ENOMEM;
>> +		return ret;
>>  	}
>>  
>> -	ret = qcom_scm_pas_auth_and_reset(IRIS_PAS_ID);
>> +	ret = qcom_scm_pas_prepare_and_auth_reset(core->pas_ctx);
> [Severity: High]
> Does this permanently leak the PAS metadata memory upon every successful
> firmware load?
>
> qcom_mdt_pas_load() delegates to qcom_scm_pas_init_image(), which allocates
> DMA or TZ memory for the firmware metadata (ELF header and hashes).
>
> The SCM API requires the caller to free this memory using
> qcom_scm_pas_metadata_release() once authentication is complete. 
>
> It appears the iris driver never invokes this release function.

This is discussed here [1] and finalized that no changes needed in this patch.
[1]
https://lore.kernel.org/all/20260415074140.46bg27tzbuyzjq3d@hu-mojha-hyd.qualcomm.com/

>>  	if (ret)  {
>>  		dev_err(core->dev, "auth and reset failed: %d\n", ret);
>> -		return ret;
>> +		goto err_unmap;
>>  	}
>>  
>>  	for (i = 0; i < core->iris_platform_data->tz_cp_config_data_size; i++) {
> [ ... ]
>
>> @@ -95,16 +133,31 @@ int iris_fw_load(struct iris_core *core)
>>  		if (ret) {
>>  			dev_err(core->dev, "qcom_scm_mem_protect_video_var failed: %d\n", ret);
>>  			qcom_scm_pas_shutdown(IRIS_PAS_ID);
>> -			return ret;
>> +			goto err_pas_shutdown;
>>  		}
>>  	}
>>  
>> +	return 0;
>> +
>> +err_pas_shutdown:
>> +	qcom_scm_pas_shutdown(core->pas_ctx->pas_id);
> [Severity: High]
> Does this result in a double invocation of qcom_scm_pas_shutdown() on the
> qcom_scm_mem_protect_video_var() error path?
>
> The code calls qcom_scm_pas_shutdown(IRIS_PAS_ID) explicitly before jumping to
> the err_pas_shutdown label, which calls qcom_scm_pas_shutdown() again.
>
> Since core->pas_ctx->pas_id is initialized to IRIS_PAS_ID, this results in the
> shutdown function being called twice consecutively for the same PAS ID, which
> could trigger TrustZone errors or corrupt Secure Monitor state.

It was missed during rebase and resolving merge conflicts in the previous
series. Will fix in next revision.

>> +err_unmap:
>> +	iris_fw_iommu_unmap(core);
>> +
>>  	return ret;
>>  }
>>  
>>  int iris_fw_unload(struct iris_core *core)
>>  {
>> -	return qcom_scm_pas_shutdown(IRIS_PAS_ID);
>> +	int ret;
>> +
>> +	ret = qcom_scm_pas_shutdown(core->pas_ctx->pas_id);
>> +	if (ret)
>> +		return ret;
> [Severity: Medium]
> Will this early return skip the required IOMMU unmap logic if
> qcom_scm_pas_shutdown() fails?
>
> Since the caller (iris_core_deinit()) ignores the return value of
> iris_fw_unload(), the driver proceeds with teardown while permanently leaking
> the firmware's IOMMU IOVA mapping.
>
> Software resource cleanup should likely continue even if a hardware/SCM
> command fails.
>
>> +
>> +	iris_fw_iommu_unmap(core);
>> +
>> +	return ret;
>>  }
> [Severity: High]
> This is a pre-existing issue, but I noticed that the sys_error_handler delayed
> work is never canceled during driver removal.
>
> Looking at iris_remove() in drivers/media/platform/qcom/iris/iris_probe.c:
>
> static void iris_remove(struct platform_device *pdev)
> {
>     ...
>
> The driver initializes core->sys_error_handler on a delayed workqueue in
> iris_probe(), but iris_remove() unregisters devices and destroys core->lock
> without calling cancel_delayed_work_sync(&core->sys_error_handler).
>
> If the delayed work executes concurrently with or after iris_remove(), will it
> access freed driver state and attempt to acquire the destroyed mutex, leading
> to a use-after-free?

This is not introduced with this patch.
Will check this pre-existing issue and will post another series for this fixes
if required.


