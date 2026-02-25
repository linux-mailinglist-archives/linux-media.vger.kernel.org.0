Return-Path: <linux-media+bounces-53341-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABNLLmcAn2lAYgQAu9opvQ
	(envelope-from <linux-media+bounces-53341-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 15:00:07 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C17919875F
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 15:00:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B9B2310B92C
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 13:58:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0A7F3815C7;
	Wed, 25 Feb 2026 13:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SngD41I0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TiTqNl8D"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C469B392815
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 13:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772027881; cv=none; b=pPEDqCR312leP6PGU5rozb/KCBwD1BAmVGqTkd6qt644EJs0HgrwpVMRAxgvGgHsLz3avY3f0zLtwG5TO/Z6RzWtkigQC/Ml125Qloqq/wFLUlS7jZv8lEF6ZMnSmHwXQHgr5BhVL2E9iqa8Lgo+iUrVYfPtq1lCYjHIU2fwUkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772027881; c=relaxed/simple;
	bh=hlHju+yEK+dVSqqOuwhlGHgNoqF1e/GghjjlCMjf4Uo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jTbGjG/BB4HnhouUpC0i9e4Ns/SiwWTcPjoLl/PH9eY2i6AlEL2buOO+DgobhxfCGNDxlo7v9tJUAGu7mUVdVwOXB3KLoPs25hIZE2lt2PcoVWG7HK335vEha+mkoKuFLrbX78t7yxmw9Zpkpsm/7LJMZYOAP6ys455iMR4pQYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SngD41I0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TiTqNl8D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PB3Rxi1512073
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 13:57:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xBYPi7uwmyms6qiKiYpOhYR8HyAd/7uAOTP2ZQu479c=; b=SngD41I08N36oMO6
	tYE2d77d7x+/raH5JgVXcHVUQ8nEjcQrITPqEa2e5yAVeU+u8gH7S2lRGIQI5Ndo
	YIFsSxzcACHZasaST4AD5xRn+hRi1qSKrOjgYRFwlHOaN7W0GGcO+Q8fG0QHEuZa
	m++zp+42KeBUePer+VKMgN7g1bXlLaxRku0dtgMveJpJo+BdO5hzMytiBzI9PZg4
	imrJ2iANeWWl7UP/vlyld9XiBLlmJvC/nfDREkeHpLCqOJilokGRtUxeay9tdy5D
	tIJZVjcEtDoNhTlItSWFjDrNRrpHkPkHgiDx83dp9Q6EsDpPZrqe6h+KS6IoY2SL
	8eTE8Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chyvf0duf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 13:57:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2aae146bab0so72761285ad.0
        for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 05:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772027878; x=1772632678; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xBYPi7uwmyms6qiKiYpOhYR8HyAd/7uAOTP2ZQu479c=;
        b=TiTqNl8DGFWLHMsEelq+HqKEIYRqjjPWJljlLvxcPiZSJz3ukNIAyVEzQGbATBBL/T
         hEc9VcUgcgwXsNy4hkH01k9x/cZ1wfzngquHRbMdQG0ZD82H2xRREIQKy0p2Ku3wDCKq
         sML5hO9NBpQdaIKjUVjg8Aki2HwyoIYGqqI9jpnO7ttufLKjsbZJZM0jxEhfhyrFLD1s
         zVSegAdwFm806QD0hYDhqFWQS9YuOaS2dDgINNVnsJlsmODt0gmixPPNA+8A22MQT85f
         oiwtgorWNwKQag5kY1vpM/FNGHHJXJDCdpD2j2EGk/wjSiC9cT4pbvjjY0YmRm0ch2a0
         IDYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772027878; x=1772632678;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xBYPi7uwmyms6qiKiYpOhYR8HyAd/7uAOTP2ZQu479c=;
        b=XJTQcuwxhb5q1rNiuEwlTBtHfRuUGqTB9SLXvTK992HYPznn7cwuF3GzGgheQCIDdo
         gQrd83zejT88bbPtX4FJpgq83q0+MVmqtq5emmt8KuJ7DCx/7rGoOcM/f6I/KtIpsF87
         kRmb6SfegaXrGgC7lz2kchWZOxz9eHJta2+Sfa7SKPAAvmPCN09QBtixeqinudfEj+Eg
         m+VOvP7icg84ZxbMyw/1sGc1LQgEmD/M0289CkRcO/pnJ2wZxewUQRr0Ig//zLuN+iCR
         JsRAiMttoBx5QTfXTuILpJnRFMB/Cy2jkEdSwwYaiBcLj5azjiASx8PPObanWI8Q9syX
         qBew==
X-Forwarded-Encrypted: i=1; AJvYcCV+LbTG1vrw2AHnx3VFUKlE+ia/pP136G2jG4xFss2ayEncQTBNlJxMrEFLGRWWlKxnhT4SwW/SS1fNpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzRQbRaVSK7HruMmHnxFMB18INOdrHyr4B+W4SWSvjOceLFD6n
	YoJTiT5y86osA/GzLbxa4SlC7tjlEdIQ/cZwA3UyXgZ6wmllf27iLkbWOaJnbZHb/Jd1t+MZf78
	RjDJPa32cyhiLwPNeZUCGdY6j5d2wtinnKFY1U2QY+lNxRJ9kzXMdN/1U7VVtAOc8kw==
X-Gm-Gg: ATEYQzz5IDMzEwtN9//1/oEHcPjhpI7yMvZFJbLKqNZV5k4yNwaqD8jaVEjtjyEuUlf
	1pr3rdeCS4x8j2xtXKi0wE1/7rnbcCrd+qFFlYdzEuwyQFqNZXL0fHFAzmco9DUsSe0Uz2U8v6p
	qgy0yzFRys7JjYzbBnKc6BmRvVt1Xp0KM6X8ApQOC6eVbeyF0UhoodaUxNjoLgm83/rh9LKaazm
	6WJba+Q5uW5PlCRrMMt90mr14QspWBYyZ8zYBzkn7sKuKKvY1vO4L0byzfRsi5Fk7JCB94PRWmh
	IPI8RcHlt6b7XKRvp41EF6HZ/vyM/nIS0Opmfae6Zfa54tqFkDRf6Dn8ucynynmPaTLstxnHjlW
	N9C5xHwAbaBgKY8w76uxb541Pmbb2S95GC969Ei4PdgzejlRpBRI=
X-Received: by 2002:a17:903:22d2:b0:2ad:ca65:a398 with SMTP id d9443c01a7336-2adca65a58cmr27706725ad.57.1772027877462;
        Wed, 25 Feb 2026 05:57:57 -0800 (PST)
X-Received: by 2002:a17:903:22d2:b0:2ad:ca65:a398 with SMTP id d9443c01a7336-2adca65a58cmr27706515ad.57.1772027876861;
        Wed, 25 Feb 2026 05:57:56 -0800 (PST)
Received: from [192.168.1.5] ([171.61.227.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad750275d0sm175587235ad.61.2026.02.25.05.57.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 05:57:55 -0800 (PST)
Message-ID: <ceba8973-4fb7-4497-aebf-dd41f2d2eaa5@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 19:27:47 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 01/18] accel/qda: Add Qualcomm QDA DSP accelerator
 driver docs
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
 <20260224-qda-firstpost-v1-1-fe46a9c1a046@oss.qualcomm.com>
 <jyd3ufisoz4xcfe2dvu26odesaz2czj22jn46qswkzz6ocg4zu@6krzvyvirkmo>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <jyd3ufisoz4xcfe2dvu26odesaz2czj22jn46qswkzz6ocg4zu@6krzvyvirkmo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fcKWkpdG9F7DB7eQIqIF1zcMuapSeTGi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDEzMyBTYWx0ZWRfX8L+26IGfWeL1
 /idqmUk+H958B9x9Qflas+KeVOnx9AwWKdTE6ntCXKZoc5M3HaVOWTVMlKuXyVp7dcrAZlU+SGr
 ln3yUGOns7l3/rY5KSB2IgOToRZAncqjC4GBxOZLRRMZCQ/aOd1IBc4pw5DIA7QfHIKvI7JfuQd
 UsQmAFsGVqIk0ECxv6RpK4kzkyeq/pXwizHqEMyxWozYHcTjpi1Ca0HAZ8ylhswfy76/vI6a4RC
 V6/ME4wboQolO2M8LbvzOVyy3Jq/2tVnWdsISaVmpJgob9kzD8i7AOLzW+NBTk+pKVoBt3kkFhJ
 ayhJA0QGcJ+rYetU1cbH2oTLShQYYWA9m0TcvWRS/favaCxsG49e0/N0Gm0qqO2A1u/hvRP5XsX
 Sl6BLd4m4I+2MMYW11I+edsWw71pY8emK4BHEcPV8BA2KIX2b4jIYmvbFINEOHvfXkcpTahYEN2
 g4EFaGdLYpsqrnwT6cw==
X-Proofpoint-GUID: fcKWkpdG9F7DB7eQIqIF1zcMuapSeTGi
X-Authority-Analysis: v=2.4 cv=dZWNHHXe c=1 sm=1 tr=0 ts=699effe6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=CLJ8B99oKJtQbdnoKiLypA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7m3UXCOrzlUTUB1U0ZMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_01,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602250133
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
	TAGGED_FROM(0.00)[bounces-53341-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1C17919875F
X-Rspamd-Action: no action



On 2/24/2026 2:47 AM, Dmitry Baryshkov wrote:
> On Tue, Feb 24, 2026 at 12:38:55AM +0530, Ekansh Gupta wrote:
>> Add initial documentation for the Qualcomm DSP Accelerator (QDA) driver
>> integrated in the DRM accel subsystem.
>>
>> The new docs introduce QDA as a DRM/accel-based implementation of
>> Hexagon DSP offload that is intended as a modern alternative to the
>> legacy FastRPC driver in drivers/misc. The text describes the driver
>> motivation, high-level architecture and interaction with IOMMU context
>> banks, GEM-based buffer management and the RPMsg transport.
>>
>> The user-space facing section documents the main QDA IOCTLs used to
>> establish DSP sessions, manage GEM buffer objects and invoke remote
>> procedures using the FastRPC protocol, along with a typical lifecycle
>> example for applications.
>>
>> Finally, the driver is wired into the Compute Accelerators
>> documentation index under Documentation/accel, and a brief debugging
>> section shows how to enable dynamic debug for the QDA implementation.
>>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  Documentation/accel/index.rst     |   1 +
>>  Documentation/accel/qda/index.rst |  14 +++++
>>  Documentation/accel/qda/qda.rst   | 129 ++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 144 insertions(+)
>>
>> diff --git a/Documentation/accel/index.rst b/Documentation/accel/index.rst
>> index cbc7d4c3876a..5901ea7f784c 100644
>> --- a/Documentation/accel/index.rst
>> +++ b/Documentation/accel/index.rst
>> @@ -10,4 +10,5 @@ Compute Accelerators
>>     introduction
>>     amdxdna/index
>>     qaic/index
>> +   qda/index
>>     rocket/index
>> diff --git a/Documentation/accel/qda/index.rst b/Documentation/accel/qda/index.rst
>> new file mode 100644
>> index 000000000000..bce188f21117
>> --- /dev/null
>> +++ b/Documentation/accel/qda/index.rst
>> @@ -0,0 +1,14 @@
>> +.. SPDX-License-Identifier: GPL-2.0-only
>> +
>> +==============================
>> + accel/qda Qualcomm DSP Driver
>> +==============================
>> +
>> +The **accel/qda** driver provides support for Qualcomm Hexagon DSPs (Digital
>> +Signal Processors) within the DRM accelerator framework. It serves as a modern
>> +replacement for the legacy FastRPC driver, offering improved resource management
>> +and standard subsystem integration.
>> +
>> +.. toctree::
>> +
>> +   qda
>> diff --git a/Documentation/accel/qda/qda.rst b/Documentation/accel/qda/qda.rst
>> new file mode 100644
>> index 000000000000..742159841b95
>> --- /dev/null
>> +++ b/Documentation/accel/qda/qda.rst
>> @@ -0,0 +1,129 @@
>> +.. SPDX-License-Identifier: GPL-2.0-only
>> +
>> +==================================
>> +Qualcomm Hexagon DSP (QDA) Driver
>> +==================================
>> +
>> +Introduction
>> +============
>> +
>> +The **QDA** (Qualcomm DSP Accelerator) driver is a new DRM-based
>> +accelerator driver for Qualcomm's Hexagon DSPs. It provides a standardized
>> +interface for user-space applications to offload computational tasks ranging
>> +from audio processing and sensor offload to computer vision and AI
>> +inference to the Hexagon DSPs found on Qualcomm SoCs.
>> +
>> +This driver is designed to align with the Linux kernel's modern **Compute
>> +Accelerators** subsystem (`drivers/accel/`), providing a robust and modular
>> +alternative to the legacy FastRPC driver in `drivers/misc/`, offering
>> +improved resource management and better integration with standard kernel
>> +subsystems.
>> +
>> +Motivation
>> +==========
>> +
>> +The existing FastRPC implementation in the kernel utilizes a custom character
>> +device and lacks integration with modern kernel memory management frameworks.
>> +The QDA driver addresses these limitations by:
>> +
>> +1.  **Adopting the DRM accel Framework**: Leveraging standard uAPIs for device
>> +    management, job submission, and synchronization.
>> +2.  **Utilizing GEM for Memory**: Providing proper buffer object management,
>> +    including DMA-BUF import/export capabilities.
>> +3.  **Improving Isolation**: Using IOMMU context banks to enforce memory
>> +    isolation between different DSP user sessions.
>> +
>> +Key Features
>> +============
>> +
>> +*   **Standard Accelerator Interface**: Exposes a standard character device
>> +    node (e.g., `/dev/accel/accel0`) via the DRM subsystem.
>> +*   **Unified Offload Support**: Supports all DSP domains (ADSP, CDSP, SDSP,
>> +    GDSP) via a single driver architecture.
>> +*   **FastRPC Protocol**: Implements the reliable Remote Procedure Call
>> +    (FastRPC) protocol for communication between the application processor
>> +    and DSP.
>> +*   **DMA-BUF Interop**: Seamless sharing of memory buffers between the DSP
>> +    and other multimedia subsystems (GPU, Camera, Video) via standard DMA-BUFs.
>> +*   **Modular Design**: Clean separation between the core DRM logic, the memory
>> +    manager, and the RPMsg-based transport layer.
>> +
>> +Architecture
>> +============
>> +
>> +The QDA driver is composed of several modular components:
>> +
>> +1.  **Core Driver (`qda_drv`)**: Manages device registration, file operations,
>> +    and bridges the driver with the DRM accelerator subsystem.
>> +2.  **Memory Manager (`qda_memory_manager`)**: A flexible memory management
>> +    layer that handles IOMMU context banks. It supports pluggable backends
>> +    (such as DMA-coherent) to adapt to different SoC memory architectures.
>> +3.  **GEM Subsystem**: Implements the DRM GEM interface for buffer management:
>> +
>> +    * **`qda_gem`**: Core GEM object management, including allocation, mmap
>> +      operations, and buffer lifecycle management.
>> +    * **`qda_prime`**: PRIME import functionality for DMA-BUF interoperability,
>> +      enabling seamless buffer sharing with other kernel subsystems.
>> +
>> +4.  **Transport Layer (`qda_rpmsg`)**: Abstraction over the RPMsg framework
>> +    to handle low-level message passing with the DSP firmware.
>> +5.  **Compute Bus (`qda_compute_bus`)**: A custom virtual bus used to
>> +    enumerate and manage the specific compute context banks defined in the
>> +    device tree.
> I'm really not sure if it's a bonus or not. I'm waiting for iommu-map
> improvements to land to send patches reworking FastRPC CB from using
> probe into being created by the main driver: it would remove some of the
> possible race conditions between main driver finishing probe and the CB
> devices probing in the background.
>
> What's the actual benefit of the CB bus?
I tried following the Tegra host1x logic here as was discussed here[1]. My understanding is that
with this the CB will become more manageable reducing the scope of races that exists in the
current fastrpc driver.

That said, I'm not completely aware about the iommu-map improvements. Is it the one
being discussed for this patch[2]? If it helps in main driver to create CB devices directly, then I
would be happy to adapt the design.

[1] https://lore.kernel.org/all/245d602f-3037-4ae3-9af9-d98f37258aae@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20260126-kaanapali-iris-v1-3-e2646246bfc1@oss.qualcomm.com/
>
>> +6.  **FastRPC Core (`qda_fastrpc`)**: Implements the protocol logic for
>> +    marshalling arguments and handling remote invocations.
>> +
>> +User-Space API
>> +==============
>> +
>> +The driver exposes a set of DRM-compliant IOCTLs. Note that these are designed
>> +to be familiar to existing FastRPC users while adhering to DRM standards.
>> +
>> +*   `DRM_IOCTL_QDA_QUERY`: Query DSP type (e.g., "cdsp", "adsp")
>> +    and capabilities.
>> +*   `DRM_IOCTL_QDA_INIT_ATTACH`: Attach a user session to the DSP's protection
>> +    domain.
>> +*   `DRM_IOCTL_QDA_INIT_CREATE`: Initialize a new process context on the DSP.
> You need to explain the difference between these two.
Ack.
>
>> +*   `DRM_IOCTL_QDA_INVOKE`: Submit a remote method invocation (the primary
>> +    execution unit).
>> +*   `DRM_IOCTL_QDA_GEM_CREATE`: Allocate a GEM buffer object for DSP usage.
>> +*   `DRM_IOCTL_QDA_GEM_MMAP_OFFSET`: Retrieve mmap offsets for memory mapping.
>> +*   `DRM_IOCTL_QDA_MAP` / `DRM_IOCTL_QDA_MUNMAP`: Map or unmap buffers into the
>> +    DSP's virtual address space.
> Do we need to make this separate? Can we map/unmap buffers on their
> usage? Or when they are created? I'm thinking about that the
> virtualization. 
The lib provides ways(fastrpc_mmap/remote_mmap64) for users to map/unmap the
buffers on DSP as per processes requirement. The ioctls are added to support the same.
> An alternative approach would be to merge
> GET_MMAP_OFFSET with _MAP: once you map it to the DSP memory, you will
> get the offset. 
_MAP is not need for all the buffers. Most of the remote call buffers that are passed to DSP
are automatically mapped by DSP before invoking the DSP implementation so the user-space
does not need to call _MAP for these.

Some buffers(e.g., shared persistent buffers) do require explicit mapping, which is why
MAP/MUNMAP exists in FastRPC.

Because of this behavioral difference, merging GET_MMAP_OFFSET with MAP is not accurate.
GET_MMAP_OFFSET is for CPU‑side mmap via GEM, whereas MAP is specifically for DSP
virtual address assignment.
>
>> +
>> +Usage Example
>> +=============
>> +
>> +A typical lifecycle for a user-space application:
>> +
>> +1.  **Discovery**: Open `/dev/accel/accel*` and check
>> +    `DRM_IOCTL_QDA_QUERY` to find the desired DSP (e.g., CDSP for
>> +    compute workloads).
>> +2.  **Initialization**: Call `DRM_IOCTL_QDA_INIT_ATTACH` and
>> +    `DRM_IOCTL_QDA_INIT_CREATE` to establish a session.
>> +3.  **Memory**: Allocate buffers via `DRM_IOCTL_QDA_GEM_CREATE` or import
>> +    DMA-BUFs (PRIME fd) from other drivers using `DRM_IOCTL_PRIME_FD_TO_HANDLE`.
>> +4.  **Execution**: Use `DRM_IOCTL_QDA_INVOKE` to pass arguments and execute
>> +    functions on the DSP.
>> +5.  **Cleanup**: Close file descriptors to automatically release resources and
>> +    detach the session.
>> +
>> +Internal Implementation
>> +=======================
>> +
>> +Memory Management
>> +-----------------
>> +The driver's memory manager creates virtual "IOMMU devices" that map to
>> +hardware context banks. This allows the driver to manage multiple isolated
>> +address spaces. The implementation currently uses a **DMA-coherent backend**
>> +to ensure data consistency between the CPU and DSP without manual cache
>> +maintenance in most cases.
>> +
>> +Debugging
>> +=========
>> +The driver includes extensive dynamic debug support. Enable it via the
>> +kernel's dynamic debug control:
>> +
>> +.. code-block:: bash
>> +
>> +    echo "file drivers/accel/qda/* +p" > /sys/kernel/debug/dynamic_debug/control
> Please add documentation on how to build the test apps and how to load
> them to the DSP.
Ack.
>
>> -- 
>> 2.34.1
>>


