Return-Path: <linux-media+bounces-64125-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HSFwMmxWJmpBVAIAu9opvQ
	(envelope-from <linux-media+bounces-64125-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 07:43:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C99F652E34
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 07:43:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TYgtH6H5;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Iui3Mqmo;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64125-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64125-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93F1C300B122
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 05:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF16F379C2C;
	Mon,  8 Jun 2026 05:41:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE844071C6
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 05:41:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780897274; cv=none; b=bPn7+iVNSsj07IAMNAbDxb1v2DPy2jNnGuvRNSVGGkyKuht/dBECLEjJXVggPyEfyuOwrVFtTbceFWwDUTqyG6RPD0MCmGHibJF+/Kg1mR3BfgJEUcrMdDhZMQHhjUBg1AzPOYQXxdkygm55zfZ7vcgtUQAuUQLXLGesut/Vofs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780897274; c=relaxed/simple;
	bh=FJZJQj2R0WY4ADQJTBzk96MDj+UUFqh5UCbQFgrXHOM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Px3tfO1OiA0I3BMdgg7Lw5WpDa1mTte7RJNGXQsfUUbzEEKWgIUGQO0xHg3nO7hxPzIt393j9VRC6j1RSZcj2JlLpiq2HiSMvzdYyJu8pQdzsDIND+KH5Eld5x9qysxAQ5GYnO7AyuEaecVLiXVBzeJ2XVbNYNL44Ba3H/yfIRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TYgtH6H5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Iui3Mqmo; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580F1Md1958523
	for <linux-media@vger.kernel.org>; Mon, 8 Jun 2026 05:41:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z8AqFka/ah6llbSOKh5lQK3FxpLYZzfgVcN9OPM22xg=; b=TYgtH6H5gIPyGS4c
	rT7mKiV0p6JI9OzJc8XvjpsvsTHKrQiqWdiTmqqygYfUJfJ2oJIq56SREB4BfX78
	vObtqXvSDbkx965dckH3qLF4u9mFnhCp4OLVNaM+P6gKLBeDnw7QLfetVJ5j/h6L
	ct/zM0kGTlXwxPumXiZSdg9kWLZgMZ87ckR5/bLMj7togwVQlHxSsCCb2Iqc05fr
	MmQ/dQG5li4LXwUMOjvlAChNqTG7yRn7e/apt8FPn/WRizspf/JQBmOUHfVNzydn
	l/nVobsFc+OHujhRtWEGKxN9i/4cREMambXEOYwdSP5jxXDNAgH1XOsUR3/eQTp5
	ZPQrAQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embx6dx1d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 05:41:11 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0c32faa62so73207105ad.2
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 22:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780897271; x=1781502071; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z8AqFka/ah6llbSOKh5lQK3FxpLYZzfgVcN9OPM22xg=;
        b=Iui3Mqmo4/NaMjNp+De7lrVgFieS4gWeauc7DjeiT7mh3qDYiIKVbCt2uJ+4jvpMFc
         gZOHIG6srX1Hv95UolV7YZac45/CcMcQo2qSkIOvF+3WunoSK03kUcQJ8hVmloNRymDN
         9h1DZ0BPWxlotG2/MaaYGwQu87LOKCNnfsfxe/QEEs4eL8yrR6OBTWTWl5abP9z7mANy
         7fMek5BmDNFOxv34y33DYKFFDT8JoDI8LWhg4v+rWzl0GKc1pjklq1huVvj18RRW78eY
         ZIqGaumHu4L4a404C/sXM13HGTrqBaqviSJ47qH0H/NIqJifRTZvGaWkypBQkfTrqR9L
         0w9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780897271; x=1781502071;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z8AqFka/ah6llbSOKh5lQK3FxpLYZzfgVcN9OPM22xg=;
        b=TGkxnyAUgvsPXP74yRQ44B6iuF4OEtJzDPyHU7LUXqIxFycnhkW9bL8KB7QtvYJvda
         Yd3L0E7hfB+hHR3M/4qCHyjPwkhMfdYeDr9TpxXmD/AbtRqY89GGIks/pls8z7IE1Jj1
         nGUrgI+7OMe/3PpRFyhZq/GNpj4FTNI8fuggwNTfQqG9vRXr/XqBxdAZznkCmNbYcsap
         gu7ZwYg569cF0mSNy74bCfSCm34yUVeoMjnJ+9DwO7e/DkW4xJTyCSy5zhIoJSfvks6V
         MsZtrtW5nQmnCtBKbNcTpT8VTzeejfFkIKF+moDMlrm/8Izon/w2Zp/zDGZKGICmBGXv
         ke+g==
X-Gm-Message-State: AOJu0Yya69OEBFDnpZk0yJMZCeB/HSLMJleXzzw9IvHr6qccpnl6+aD+
	/7lAt87pviIcXASUQDtvLh9ix4+xXn/mqhXiH31vIdW8xft2hheavnEGknOk5ajJqsuWwg44w1M
	qhJQGK4yE4ItkG6GnDR+kRy+j7K998o+FqCOHGJo6DqLMzOIqD+3NM8ZaSn+uXHB3b2e9q8caLA
	==
X-Gm-Gg: Acq92OGpExdV7GMqSigqxkSiZCg6q6NZLTrcf87aHPgNFN/WJns8pHC+CwI3Ndek1aW
	M4c549ydHRDwxNFxp56dFFw0H5gpaxd5qDE9HqYMcAI6XUTFmWubxb9scnMvuCH0XLamw2nXJC3
	i7LSN8M8aFXTqZDLeO7wd+QzLQD0OFQkUqEzLQI2tx77raBeRTJYVWKFA2QVes1fp30QrytHsng
	3utaHAsRqL6MZjvxAmGf9ike7gtfa2AwPcduF5F/OrhC/sWV8r9j/KQDKTRIn60fO8WM4tKSWoC
	7EzStME05d6gAG2+NoVNY/KSqF9tzaD+fPKVz91W4tPEicvlUdcvSjopQX7zuJJl+MK3Iapek68
	PdSowdSX5v1Gx93KDPEak72NyE+hi7OcMwDt4akNKJwos1C7GYL4i+XxC6v4q0qkI
X-Received: by 2002:a17:902:f70f:b0:2bf:356f:4e0c with SMTP id d9443c01a7336-2c1e80d2996mr173997445ad.1.1780897270682;
        Sun, 07 Jun 2026 22:41:10 -0700 (PDT)
X-Received: by 2002:a17:902:f70f:b0:2bf:356f:4e0c with SMTP id d9443c01a7336-2c1e80d2996mr173997065ad.1.1780897270201;
        Sun, 07 Jun 2026 22:41:10 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c249aeb62csm42888625ad.68.2026.06.07.22.41.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 22:41:09 -0700 (PDT)
Message-ID: <820d88f6-23a1-6371-b0ac-90b13c493ab3@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:11:06 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v7 10/12] media: iris: Add platform data for glymur
To: sashiko-reviews@lists.linux.dev
Cc: linux-media@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org
References: <20260603-glymur-v7-10-afaa55d11fe0@oss.qualcomm.com>
 <20260603144621.5230C1F00893@smtp.kernel.org>
Content-Language: en-US
In-Reply-To: <20260603144621.5230C1F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cvmrVV4i c=1 sm=1 tr=0 ts=6a2655f7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UNkTylL0TICJFbUdM8kA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA0OSBTYWx0ZWRfX4mWWfT0Fq2Zt
 R2OFdAr2M86klK84hPzN556dMPSx4+h1S6y+8QYmGIpI1NBCM8GoWWKEXgmFWf+9eKHyMtTjvro
 L3Xz+o587XmFSMm91343pLIrQWNWrObm4zx6UKzM3/luW7IlKtDTAPJlXgaWY70d8aBoXzGLgUa
 rcq+pix7ToyCoIgKNPC6hWX1tn48O+eI7clL/giLWbFF8UNOX2xUD6CJEYu6hTY/B0G7Fw8M1Jl
 VvWU6c5MgT1jcvnTCDeguP/jBfTtr7h8v57q6mNQf1C7XCh8UwgMJMJnkhcMpcVsOIei7HSt4gJ
 5XCENyFDnpPpUJ+KhATLuca0PM5vZAsGak0n2Xx029p2aQMkC9yqsdVd1up4+DfL5n1CdjnLq70
 6YJYoehrdE78hlvjusPkfDEBIT7aXuAjsFXHhFTvAX7EsV8mZq94MUFJRaO4DLFaWUvmjgp5HAo
 DMf3AdmW7hbmXiymdwQ==
X-Proofpoint-GUID: mvQrYHiH5j8q03mCMXNBErugQyU2CujE
X-Proofpoint-ORIG-GUID: mvQrYHiH5j8q03mCMXNBErugQyU2CujE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0
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
	TAGGED_FROM(0.00)[bounces-64125-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sashiko-reviews@lists.linux.dev,m:linux-media@vger.kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 3C99F652E34


On 6/3/2026 8:16 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Critical] `iris_glymur_deinit_cb_devs()` unregisters and frees `core->fw_dev` but fails to set the pointer to `NULL`, leaving a dangling pointer in the `core` structure.
> - [High] The address of a local stack variable (`fw_fid`) is stored in a permanent device structure field (`dev->platform_data`), leading to a dangling pointer and Use-After-Free once the initialization function returns.
> - [High] Silent cancellation of IOMMU deferred probe leading to improper fallback.
> --
>
> commit 22223f505726fa5c0ee432b64a8712aa1e89468b
> Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>
> media: iris: Add platform data for glymur
>
> On glymur platform, the iris core shares most properties with the
> iris core on the SM8550 platform. The major difference is that glymur
> integrates two codec cores (vcodec0 and vcodec1), while SM8550 has only
> one. Add glymur specific platform data, reusing SM8550 definitions
> wherever applicable.
>
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_glymur.c b/drivers/media/platform/qcom/iris/iris_platform_glymur.c
>> new file mode 100644
>> index 0000000000000..c42ac99870ede
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_glymur.c
>> @@ -0,0 +1,106 @@
> [ ... ]
>
>> +int iris_glymur_init_cb_devs(struct iris_core *core)
>> +{
>> +	u64 dma_mask = core->iris_platform_data->dma_mask;
>> +	const u32 fw_fid = IOMMU_FID_IRIS_FIRMWARE;
>> +	struct device *dev;
>> +
>> +	dev = iris_vpu_bus_create_device(core->dev, "iris-firmware", dma_mask, &fw_fid);
> [Severity: High]
> Is it safe to pass the address of a local stack variable to device creation?
>
> Looking at iris_vpu_bus_create_device(), it assigns the passed pointer
> directly to dev->platform_data:
>
> iris_vpu_bus_create_device()
>     ...
>     dev->platform_data = (void *)iommu_fid;
>
> Since fw_fid is allocated on the stack in iris_glymur_init_cb_devs(),
> accessing dev->platform_data after this function returns might lead to a
> use-after-free.

These are sync calls, It won' t create dangling pointer de-reference.
Making it to global variable is not required because of one time usage.

>> +	if (IS_ERR(dev))
>> +		return PTR_ERR(dev);
>> +
>> +	if (device_iommu_mapped(dev))
>> +		core->fw_dev = dev;
>> +	else
>> +		device_unregister(dev);
>> +
>> +	return 0;
> [Severity: High]
> Is it intentional to return success (0) here when the IOMMU mapping fails?

Yes, intentional. When Linux runs as KVM managed, the firmware device has a
stream ID mapped via the iommu-map property and the IOMMU mapping is handled
here. When a hypervisor (Gunyah/QHEE) is present, the iommu-map property is
absent and the IOMMU mapping is delegated to the hypervisor. So returning 0
in that case is also a success path, not an error.

> If device_iommu_mapped(dev) is false, the device is unregistered but the
> function still returns 0. Without an error being propagated, the firmware
> loading logic might incorrectly fall back to using core->dev instead of the
> required secure firmware domain. Could this lead to TrustZone load failures or
> IOMMU translation faults?
>
>> +}
>> +
>> +void iris_glymur_deinit_cb_devs(struct iris_core *core)
>> +{
>> +	if (core->fw_dev)
>> +		device_unregister(core->fw_dev);
> [Severity: Critical]
> Could this unregistration leave a dangling pointer in core->fw_dev?
>
> Since core->fw_dev is not set to NULL after calling device_unregister(),
> subsequent initialization attempts might dereference the stale pointer. For
> example, if a later call to iris_glymur_init_cb_devs() fails to map the IOMMU
> and returns 0, core->fw_dev would remain unchanged. The core might then
> proceed to iris_fw_load() and pass the stale pointer to
> devm_qcom_scm_pas_context_alloc(), causing a use-after-free.

If context bank device creation fails, It will end up into error path and
won't reach the iris_fw_load(). And I don't think so that first time iommu
SID is mapped success and next time on-wards iommu SID failure case.

>> +}

