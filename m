Return-Path: <linux-media+bounces-53405-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJVSDXU4n2m5ZQQAu9opvQ
	(envelope-from <linux-media+bounces-53405-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 18:59:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CE819BEA4
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 18:59:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E59730EC84B
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 17:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1DB53E959C;
	Wed, 25 Feb 2026 17:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="arfaW0Tf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cGVblJW2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFA63E9590
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 17:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772042227; cv=none; b=nnHvFI4AKVRiNs66U0kmQ0vG5IoMmtAoUOFVBHDybPFBMP8jYBk+htD0Id2qd7IKrhhbuVTGVEh4egqOIITZYY868UVfzQe2iPbJeb65NRgWfo0SLTjKsoI3h6uffhEr574xb754mQ4rOT5sUdOHgasps4Jm/dyFXBj7WJ6GExs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772042227; c=relaxed/simple;
	bh=teEJU1kty9uv5hJn5DWv1DC25MgluRijH9zH5ICZN8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BLQ4ZXea7lJTGr9sy1Ue6wN9xaOapdBbwL5ZXI+yGWuZHPuqasQseBuFu4XquOIV/iTjbChov+ne4knTPHd/QWs2txZLB3ZNW/JKRtYmFeTMLJPShYYm+juuVs80Zyoh3hx50E2psmMMOBlEvOq1HnQCGfzg9a9JlTB7S939WXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=arfaW0Tf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cGVblJW2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PGkHRM3632316
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 17:57:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mvsIZr9qVQn4O36RmaOABy93+YNGrflCz5PAS8IaKgM=; b=arfaW0TfHpQRAiB3
	YUxT/Mpf4RJwDwolsP9sX29dPvyxychIKRB9uk3QWcvfIvPnf76Au4Ap0J0MtKmp
	Ze9/v68hrjcyQXPrUuBM6LMvUf0y+jhkpgjL3BfNPmM1etkC2bFeEh0xtXHYs3Iw
	KbYZLJ9kKLbzaHkzQ6bCZkaBF1JuEJYxE4aIHwo+TLG5D+2ilhXVbKenaa+9Op6b
	86VmMxFX5qs9EYajYu8sptVauXO6ZYMx5Gtw/gXYrN0GG1MGybh6Uz/fTKUCFeKF
	tc+h+u7qxTLLtxON7DNtQlwXa+TsD3HBcXyEpXIqQMRQ2ynyjb4DUyoBxq1JiH4O
	miUARA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj4w4r86r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 17:57:03 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2aad6045810so70152145ad.3
        for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 09:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772042222; x=1772647022; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mvsIZr9qVQn4O36RmaOABy93+YNGrflCz5PAS8IaKgM=;
        b=cGVblJW23bcsez1NZdIRxgszDzDF3yM/MI5MGFVx/pXGEXrvSZ3qNVByXJ13nRJcxP
         +86zoT8xnjFvbJwaZl0zxAgYb+25CXEyJfjeD4AwXZnJtUwkfrZytr/iTj/moETH6fN+
         z+91MQB/VXswjhzYZX2UtQJkza4VkkR4pTQPMPyR4mvhpaff0A3v8pH86XnKzBvt7+sL
         uLlnw54B6oPswOitjnDFLtBuWtGGk1qGlk1fcLXCDcmL1Wu0h/OMGJ2FqS5gR7OWIuq0
         0S7nJgPrVqQZCj2A0A1sPzkU5IKgPc7ArF1I5G2RxYtNS/iXgm+L3dpAZ370IiDsD0XO
         lsbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772042222; x=1772647022;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mvsIZr9qVQn4O36RmaOABy93+YNGrflCz5PAS8IaKgM=;
        b=mojiKzy1GLHH4CPT5T+DDHp4FnlxtFuxsZtG34DuyTx2u86a7Appf4VfOQORgwIZHF
         33gQXofAbE237iEfShj4Ab5hYZlZKUnSogxMNXm3j8nw08YbHIEKCwodjY0lUIvHqMgS
         noCBhGwN2YuSJIYAeruL5BxhzP+dBUrYfTCHWSB1P2n0XYl+qKayqPQ281NslPUaZR/1
         rTN/XkPcHcqm3o0hxwFa2w9CShZ9WYcEukXRoKcW+9VkNjs68gVIlN6TSN+YInImiEKP
         6F/+LDZdWwXFvbcyPZFXInzQVDA8sGjvxKfyHZB4M5SmsrM97gCGQRTHiTarWFzuhpU3
         0Qog==
X-Forwarded-Encrypted: i=1; AJvYcCUilAecxRrAi/ZKSIIMHF7bIIBP2CnzZux2of0scFfzExnxAQK+MpLwTlYtpq4E6MSCQDvhkF/qAvINxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzVPK5spIyHt+/QNFtT3o/k6gIDZ5q6SgVbJttYiw2FooxQJlc
	gU2ukhmZWqdnKKxgjVAcUBN9lvWv2riNE/0YD9Z0/FI97Tfe8zRwLU079YjhIpjW0ff8FSLydtI
	ciOM+jNOKqZa8YmcNwDixHHOgL/+Om21pQL7vzaYfeUGz1ZMARAjxd4iEOMwWyhc4wQ==
X-Gm-Gg: ATEYQzwEwX97YxGjv4AjisacCvG7EPmqEb0ift0nq1Dl3Dqs2Zv4rmPBZo14Kse2cxJ
	iJXd1m4xATP4b5mbEMj3y6mpbKo0gzeAiMPthFdFPzq+Hk7vOunrl1LV2Njtteu1DUWlt9UnfLy
	TaF/1/+eAzY8a2A9qIPupQ8Bem/bbMUqBsENYvtqnC9g2+2WDfn74JMFzpz4X8kwY5jr1pmSKZc
	OOVliAby3r0LSNvpPFWz/BdKUBOsGafhgMo+1kOeeg1b/626q7pRb9/f/VNEmzoNQQ1FQi4zFWW
	tieo26Sr6WzhBYCq6pZnbkw/VWwr4EFco82fXNc0VwkOu2YdCtj5D78GeUnxETNkhIkd5JaziUF
	oEpTnn41vtvgM6S/lFQVaioNj+IHT0l5pFJz1ZoSEsz5KcK7ae9w=
X-Received: by 2002:a17:902:e80c:b0:2a1:388d:8ef3 with SMTP id d9443c01a7336-2ad7444e7fcmr172411645ad.18.1772042222020;
        Wed, 25 Feb 2026 09:57:02 -0800 (PST)
X-Received: by 2002:a17:902:e80c:b0:2a1:388d:8ef3 with SMTP id d9443c01a7336-2ad7444e7fcmr172411335ad.18.1772042221493;
        Wed, 25 Feb 2026 09:57:01 -0800 (PST)
Received: from [192.168.1.5] ([171.61.227.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74f5daf5sm135513705ad.24.2026.02.25.09.56.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 09:57:00 -0800 (PST)
Message-ID: <e82443ff-f6c1-4b8e-b573-f4620dd0f17c@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 23:26:52 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 04/18] accel/qda: Add built-in compute CB bus for QDA
 and integrate with IOMMU
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-4-fe46a9c1a046@oss.qualcomm.com>
 <ox7jnqkjo3frhbgpp63sse7ram72obihe4qlbbn4z22wbw4szr@7pzoeecdvsyg>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <ox7jnqkjo3frhbgpp63sse7ram72obihe4qlbbn4z22wbw4szr@7pzoeecdvsyg>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: b5wUUowE_5BNEFi4aVKbbIVqU9NxhJW-
X-Authority-Analysis: v=2.4 cv=IqMTsb/g c=1 sm=1 tr=0 ts=699f37ef cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=CLJ8B99oKJtQbdnoKiLypA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=_kSkizocug0RL_Hz-QYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDE3MiBTYWx0ZWRfXxNMxmXvTJ+eF
 xFFgQwPFL2IH03wnGmzn2HfoURtRSJIrz/2eD3fitmKsi6CT6F9sdj6l3VDw+J6CtWnly+0wQjk
 bmIpxHSbQPnezW1Thh+tHJNtQTA9ZoNbcRnLeLnIbgLRFzF3yABVgwKG792XRquL7Ybhxbn83d1
 LJbM5fdGtA/JdcUWKGm+OAuWZj2F/f8ThjUK5u7U9McERs5mvNnwPwsLgbCxewAtrenYee4Ghfn
 n+NFigTPupU3W3h54kLzQOng2l6tMZhaOcHbw0zSPRmjVzJNUsXKueNNm4ZRvXo8AkFNynmlgCR
 IKspy9pNfUqq8Nndkb6THWogGQ9UiE3IB3taWLasamDCl/6H6UCr6kC5rN0YwPx6XHx2AWj7JuK
 UXjtZLLFOp6Esx+o8V9CWuxHELEbjpBUnwEswaSNebY49XyuQN92d7mQu6LxWXUpLQE2mCpMFSq
 2JTg9OGiF/JswwRAogw==
X-Proofpoint-GUID: b5wUUowE_5BNEFi4aVKbbIVqU9NxhJW-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_02,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 adultscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250172
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,oss.qualcomm.com,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-53405-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C0CE819BEA4
X-Rspamd-Action: no action



On 2/24/2026 4:14 AM, Dmitry Baryshkov wrote:
> On Tue, Feb 24, 2026 at 12:38:58AM +0530, Ekansh Gupta wrote:
>> Introduce a built-in compute context-bank (CB) bus used by the Qualcomm
>> DSP accelerator (QDA) driver to represent DSP CB devices that require
>> IOMMU configuration. This separates the CB bus from the QDA driver and
>> allows QDA to remain a loadable module while the bus is always built-in.
> Why? What is the actual problem that you are trying to solve?
Bus needs to be built-in as it is being used by iommu driver. I'll add more details here.
>
>> A new bool Kconfig symbol DRM_ACCEL_QDA_COMPUTE_BUS is added and is
> Don't describe the patch contents. Please.
Ack.
>
>> selected by the main DRM_ACCEL_QDA driver. The parent accel Makefile is
>> updated to descend into the QDA directory for both built-in and module
>> builds so that the CB bus is compiled into vmlinux while the driver
>> remains modular.
>>
>> The CB bus is registered at postcore_initcall() time and is exposed to
>> the IOMMU core through iommu_buses[] in the same way as the Tegra
>> host1x context-bus. This enables later patches to create CB devices on
>> this bus and obtain IOMMU domains for them.
> Note, there is nothing QDA-specific in this patch. Please explain, why
> the bus is QDA-specific? Can we generalize it?
I needed a custom bus here to use for the compute cb devices for iommu
configurations, I don't see any reason to keep it QDA-specific. The only requirement
is that this should be enabled built in whenever QDA is enabled.

But if I keep it generic, where should this be placed? Should it be accel(or drm?) specific?

>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/accel/Makefile              |  1 +
>>  drivers/accel/qda/Kconfig           |  5 +++++
>>  drivers/accel/qda/Makefile          |  2 ++
>>  drivers/accel/qda/qda_compute_bus.c | 23 +++++++++++++++++++++++
>>  drivers/iommu/iommu.c               |  4 ++++
>>  include/linux/qda_compute_bus.h     | 22 ++++++++++++++++++++++
>>  6 files changed, 57 insertions(+)
>>
>> diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
>> index 58c08dd5f389..9ed843cd293f 100644
>> --- a/drivers/accel/Makefile
>> +++ b/drivers/accel/Makefile
>> @@ -6,4 +6,5 @@ obj-$(CONFIG_DRM_ACCEL_HABANALABS)	+= habanalabs/
>>  obj-$(CONFIG_DRM_ACCEL_IVPU)		+= ivpu/
>>  obj-$(CONFIG_DRM_ACCEL_QAIC)		+= qaic/
>>  obj-$(CONFIG_DRM_ACCEL_QDA)		+= qda/
>> +obj-$(CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS) += qda/
>>  obj-$(CONFIG_DRM_ACCEL_ROCKET)		+= rocket/
>> \ No newline at end of file
>> diff --git a/drivers/accel/qda/Kconfig b/drivers/accel/qda/Kconfig
>> index 484d21ff1b55..ef1fa384efbe 100644
>> --- a/drivers/accel/qda/Kconfig
>> +++ b/drivers/accel/qda/Kconfig
>> @@ -3,11 +3,16 @@
>>  # Qualcomm DSP accelerator driver
>>  #
>>  
>> +
>> +config DRM_ACCEL_QDA_COMPUTE_BUS
>> +	bool
>> +
>>  config DRM_ACCEL_QDA
>>  	tristate "Qualcomm DSP accelerator"
>>  	depends on DRM_ACCEL
>>  	depends on ARCH_QCOM || COMPILE_TEST
>>  	depends on RPMSG
>> +	select DRM_ACCEL_QDA_COMPUTE_BUS
>>  	help
>>  	  Enables the DRM-based accelerator driver for Qualcomm's Hexagon DSPs.
>>  	  This driver provides a standardized interface for offloading computational
>> diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
>> index e7f23182589b..242684ef1af7 100644
>> --- a/drivers/accel/qda/Makefile
>> +++ b/drivers/accel/qda/Makefile
>> @@ -8,3 +8,5 @@ obj-$(CONFIG_DRM_ACCEL_QDA)	:= qda.o
>>  qda-y := \
>>  	qda_drv.o \
>>  	qda_rpmsg.o \
>> +
>> +obj-$(CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS) += qda_compute_bus.o
>> diff --git a/drivers/accel/qda/qda_compute_bus.c b/drivers/accel/qda/qda_compute_bus.c
>> new file mode 100644
>> index 000000000000..1d9c39948fb5
>> --- /dev/null
>> +++ b/drivers/accel/qda/qda_compute_bus.c
>> @@ -0,0 +1,23 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> +#include <linux/device.h>
>> +#include <linux/init.h>
>> +
>> +struct bus_type qda_cb_bus_type = {
>> +	.name = "qda-compute-cb",
>> +};
>> +EXPORT_SYMBOL_GPL(qda_cb_bus_type);
>> +
>> +static int __init qda_cb_bus_init(void)
>> +{
>> +	int err;
>> +
>> +	err = bus_register(&qda_cb_bus_type);
>> +	if (err < 0) {
>> +		pr_err("qda-compute-cb bus registration failed: %d\n", err);
>> +		return err;
>> +	}
>> +	return 0;
>> +}
>> +
>> +postcore_initcall(qda_cb_bus_init);
>> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
>> index 4926a43118e6..5dee912686ee 100644
>> --- a/drivers/iommu/iommu.c
>> +++ b/drivers/iommu/iommu.c
>> @@ -33,6 +33,7 @@
>>  #include <trace/events/iommu.h>
>>  #include <linux/sched/mm.h>
>>  #include <linux/msi.h>
>> +#include <linux/qda_compute_bus.h>
>>  #include <uapi/linux/iommufd.h>
>>  
>>  #include "dma-iommu.h"
>> @@ -178,6 +179,9 @@ static const struct bus_type * const iommu_buses[] = {
>>  #ifdef CONFIG_CDX_BUS
>>  	&cdx_bus_type,
>>  #endif
>> +#ifdef CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS
>> +	&qda_cb_bus_type,
>> +#endif
>>  };
>>  
>>  /*
>> diff --git a/include/linux/qda_compute_bus.h b/include/linux/qda_compute_bus.h
>> new file mode 100644
>> index 000000000000..807122d84e3f
>> --- /dev/null
>> +++ b/include/linux/qda_compute_bus.h
>> @@ -0,0 +1,22 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#ifndef __QDA_COMPUTE_BUS_H__
>> +#define __QDA_COMPUTE_BUS_H__
>> +
>> +#include <linux/device.h>
>> +
>> +/*
>> + * Custom bus type for QDA compute context bank (CB) devices
>> + *
>> + * This bus type is used for manually created CB devices that represent
>> + * IOMMU context banks. The custom bus allows proper IOMMU configuration
>> + * and device management for these virtual devices.
>> + */
>> +#ifdef CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS
>> +extern struct bus_type qda_cb_bus_type;
>> +#endif
>> +
>> +#endif /* __QDA_COMPUTE_BUS_H__ */
>>
>> -- 
>> 2.34.1
>>


