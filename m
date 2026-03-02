Return-Path: <linux-media+bounces-54050-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WG9nK/1GpWkg7AUAu9opvQ
	(envelope-from <linux-media+bounces-54050-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 09:14:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2590C1D481D
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 09:14:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 809B53025C41
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 08:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07AB5322B6F;
	Mon,  2 Mar 2026 08:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zcdf6M3T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D4ilGxuI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11FD28D830
	for <linux-media@vger.kernel.org>; Mon,  2 Mar 2026 08:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772439164; cv=none; b=oPWL2RHwRiC1Ra9HVceDJkE6WrvWGe2+j3So8/ijq9zLR8UgsRgIuO4R9xuE00daRcStaITZ5VZmWC0e3j5RJ44+YSnZUN9rJqmxwT4GZrGl43VwWwMn+gLtVkWUg4GkHw31oU2aDYSQ6CPh8RkkQ7kLke9xiSh36koh2Nk/i2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772439164; c=relaxed/simple;
	bh=YsoqRWEnmbezHwWXwK/cDOGeLeQ6w9y75yey82wwwm4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dmngPhoWkQJzAJx1Hy/cl5W9AYk7xWIpZVNw2ClK4+YU3aWQeZqeaw4zlWUb/v4Cx583U03qitvLPSRU4FeAnbL4E2MpmkLCMC49qXL4QuW2sNvg/F1ttFZoxM8Q5bIxKptV+TMiXZkqgUgtZnWWFTrFB6RnjF+7GOikq6GeOdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zcdf6M3T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D4ilGxuI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 621MaH9E1952593
	for <linux-media@vger.kernel.org>; Mon, 2 Mar 2026 08:12:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YsoqRWEnmbezHwWXwK/cDOGeLeQ6w9y75yey82wwwm4=; b=Zcdf6M3TDZSqgLfi
	2fOACi2y03BjI9OAyOXRdu+xMXNoPtWdj6Ek1x0Qy/8C4fGtH76ZW/iXVF3mWHAA
	ztFRrpNZLG/8+C5HjF+ze1OXv5Y42H48tv31J8YAeKOdKDxcmE2vUM4XHdK1SH8N
	jqX0S6BVY+TTHOKa8leb4b0QIf0+mKpOvK/3mI1ThRJe9zUEqvEukp/XDr4nbxUA
	jTo+HvAOgYjTVPbYEgaxGiCkubU/Qs+Ysfngq2+QgLtFbQ/5LSG4vly1R6QsXvWS
	TMUF1Drizz87ppE9SsMzmlkgV+Ggb5Rd3yAQJTIXDHGPAD5hIZQufb/rTITsRA5J
	nkpwuA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ckshkvm5d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 08:12:39 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-824ae2c9ff4so12391655b3a.0
        for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 00:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772439159; x=1773043959; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YsoqRWEnmbezHwWXwK/cDOGeLeQ6w9y75yey82wwwm4=;
        b=D4ilGxuIfa3j3PfnGkcMNeqt4t782rLpSmgNoJ+y7q3rq3ToOsohHVtfIFy6xQ/HNy
         49UL9OQwxuMS7zH8zTd4S7gUSTJ0MHp1yG9mqg8PSCqaNFpL9Ae150VchoLUlBozgid/
         ecEwWDAP6iJZ5q632Ztgbd60RKeEn/12tMroIDGZwuMNMA7v2MxAvNddnUUxU8ucJrS0
         AMhEDh91Y9or+GfGxSMrpf7ZcYXU0n8V8qpyTJi2DuBM0Wn/kl+eDU/ar5zBRMqloZXn
         TLEoZVNs0V7oHpGHPO8+IkP+Ie8y98CHTgTCtkVR6LepHaJXvd1D+FaonrNBK7sbU7UH
         edGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772439159; x=1773043959;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YsoqRWEnmbezHwWXwK/cDOGeLeQ6w9y75yey82wwwm4=;
        b=TFt3sTuJM4gh8SOem6onbLwhJL9Rw8qAOyuq0hXnnA5VXrcuEOkNlMAymemyjY0zjv
         lsncT4A8e+qn5u7K3bwdJAU/ttr0VNQNHLDijDPzVGJKkK1mK5aaWj6BfyFn255TDFTl
         WnN3Oj2Ks5gcLcFP9dkJifaI8KbELYoL+/9igss7hb8I0UV4ej4S9QI21drekB2mEvr7
         l5+31scNDQfuHMN95pNSPmN7CL9038sBVRdKscbVfvWRYQ6fcCClE/A8gGdPPJqbn/sn
         igRpQ9ZT5vDtSxfpAhu/x2MviHK0Wp0nh/yeAt59qdZ04Sd4Nz/6IeqEvPey0UIa0tm9
         LeVw==
X-Forwarded-Encrypted: i=1; AJvYcCXq/m/eOhpQe5FtyoCtmPRaCThgPy6IsOr4oojFWX7Ieae5p3Ec+UaG31B4LhDyqER1PY59c6m7VI8ksQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHlBbhPjLJCve+U6/PB5T9GczNGjwan9T9VfHyspqXXFRDoW3/
	Qd3ByUp6qq4L5KixQcPGTH4lSiuOf+83hSOIf8Ts/6ObcnUTwLeVuwCeljxFUMx6npw3vXLi/ae
	alVZFrxoMpVxSgOlzsVXXvsMyP7BOK9mrruRCsrLfkTMmzBgMjn8P0Q57LdAiLgKnzQ==
X-Gm-Gg: ATEYQzw46TzYwSSeL1aX4stBHQPupFqfKRK3RS5QK/R8ITvjEUql82RsFGS3KFsXXJc
	txo6aYSb24ujjVNQqqEYVE+Wm8SxFLw+l+CpEfpDsf4oA4asxGwsFV3H6YSnGu+ocCXAKna9i1C
	EjPB1dgTN3PWSvpdsHKAajjMbwroOgI6bA16AZM2QDqU7VOFowB6grE9L7VtNFGozfuAkmTxTjY
	veDPW44MrvABx8CTom7TYLXA5fAkHgY+D2kesMRcqN4pBiK8XrUZwIc/L4Pcj0syr+m8QhrgjQW
	5H7kciolA6NyadfZJAyWM7LPQ7esK+2DytmCqMow9JW1N009UtyW+pWu7VK+XkrQgVnuSGAzNt7
	HSIrdr0eq//3n0s1Tu7/gPY7+ehGMyZ+MAqhIqtPMCGO8/38q8g==
X-Received: by 2002:a05:6a00:414a:b0:81b:8872:ae10 with SMTP id d2e1a72fcca58-8274d8090eemr11013987b3a.0.1772439158704;
        Mon, 02 Mar 2026 00:12:38 -0800 (PST)
X-Received: by 2002:a05:6a00:414a:b0:81b:8872:ae10 with SMTP id d2e1a72fcca58-8274d8090eemr11013957b3a.0.1772439158150;
        Mon, 02 Mar 2026 00:12:38 -0800 (PST)
Received: from [10.206.99.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a060071sm12915292b3a.63.2026.03.02.00.12.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 00:12:37 -0800 (PST)
Message-ID: <7c795b4b-3a3f-47fb-9ef9-0b13601f584c@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 13:42:30 +0530
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
 <e82443ff-f6c1-4b8e-b573-f4620dd0f17c@oss.qualcomm.com>
 <x6zseuf7g3ngtdlszf3vxj3nqexlkbtrp5kifo4tg4muzdef4n@5rngfg4gu47m>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <x6zseuf7g3ngtdlszf3vxj3nqexlkbtrp5kifo4tg4muzdef4n@5rngfg4gu47m>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA3MSBTYWx0ZWRfX8UZh2jmooxAk
 ARuAhnPrMoueCXjllBot53MxX0cE4YUQ+46fdM5bZaGG4265qChK/C5gaYUmF8sm4YjAOG98eN6
 Czw1fvctf4mZSApUEqNPSNR5bEMojDWQZUtaLaQS8yRmX7cqamx/UbJpSfbaiLzrkb9OKkiauIX
 sz3MbUvJ021xbmGvoY+8VM3jzglQl7wGzhGQiyhr8mApI7xpSzmVm5e+Rfoikg2xBT2r5fcyrv+
 o/PnBVtwSF2Aio9GAf8lS7aG2kKm1u+dtxo+Orr8dakz9QsLgLlVwzX84x2L8uAtpBQ7gn1ViCm
 Zb2s/PRIHn48WO55ExQWuY9t1Xm6Zh/XMK8Q/sgZorrfQ+tRCXnB12GN5iA/tqND5tcCnYLE4FB
 fe9VjtWKxJ3Rof8ONo6C/82Pk6vKaadBuAkY8F1rSNB0CaI5Ms1nd/WU+7WPPcAHF21z+CFK0O4
 lehaAumQJe/7wM7de3w==
X-Proofpoint-ORIG-GUID: btjTBK0dk8iGTn1NvFoEh7Wtl4vbp_6y
X-Authority-Analysis: v=2.4 cv=EvbfbCcA c=1 sm=1 tr=0 ts=69a54677 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=jwkSyuDCPDQl0KFoS7wA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: btjTBK0dk8iGTn1NvFoEh7Wtl4vbp_6y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020071
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,oss.qualcomm.com,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-54050-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2590C1D481D
X-Rspamd-Action: no action



On 2/26/2026 12:39 AM, Dmitry Baryshkov wrote:
> On Wed, Feb 25, 2026 at 11:26:52PM +0530, Ekansh Gupta wrote:
>>
>> On 2/24/2026 4:14 AM, Dmitry Baryshkov wrote:
>>> On Tue, Feb 24, 2026 at 12:38:58AM +0530, Ekansh Gupta wrote:
>>>> Introduce a built-in compute context-bank (CB) bus used by the Qualcomm
>>>> DSP accelerator (QDA) driver to represent DSP CB devices that require
>>>> IOMMU configuration. This separates the CB bus from the QDA driver and
>>>> allows QDA to remain a loadable module while the bus is always built-in.
>>> Why? What is the actual problem that you are trying to solve?
>> Bus needs to be built-in as it is being used by iommu driver. I'll add more details here.
> It's an implementation detail. Start your commit message with the
> description of the issue or a problem that you are solving.
Ack.
>
>>>> A new bool Kconfig symbol DRM_ACCEL_QDA_COMPUTE_BUS is added and is
>>> Don't describe the patch contents. Please.
>> Ack.
>>>> selected by the main DRM_ACCEL_QDA driver. The parent accel Makefile is
>>>> updated to descend into the QDA directory for both built-in and module
>>>> builds so that the CB bus is compiled into vmlinux while the driver
>>>> remains modular.
>>>>
>>>> The CB bus is registered at postcore_initcall() time and is exposed to
>>>> the IOMMU core through iommu_buses[] in the same way as the Tegra
>>>> host1x context-bus. This enables later patches to create CB devices on
>>>> this bus and obtain IOMMU domains for them.
>>> Note, there is nothing QDA-specific in this patch. Please explain, why
>>> the bus is QDA-specific? Can we generalize it?
>> I needed a custom bus here to use for the compute cb devices for iommu
>> configurations, I don't see any reason to keep it QDA-specific. The only requirement
>> is that this should be enabled built in whenever QDA is enabled.
> Why? FastRPC uses platform_bus. You need to explain, why it's not
> correct.
Ack.
>
>> But if I keep it generic, where should this be placed? Should it be accel(or drm?) specific?
> drivers/base? Or drivers/iommu? That would totally depend on the issue
> description. E.g. can we use the same code for host1x?
I'll evaluate and bring this change separately for fastrpc and host1x.
>
>


