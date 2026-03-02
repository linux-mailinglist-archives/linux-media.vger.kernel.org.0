Return-Path: <linux-media+bounces-54106-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAcQOii1pWkiFQAAu9opvQ
	(envelope-from <linux-media+bounces-54106-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 17:04:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1CF1DC55F
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 17:04:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 144A8317AD96
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 15:58:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C99D541B366;
	Mon,  2 Mar 2026 15:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a+ZZvVYl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HS2GHaDA"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0258438F62E
	for <linux-media@vger.kernel.org>; Mon,  2 Mar 2026 15:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772467035; cv=none; b=naOPMGc7hQHacqJMCaYQQlv2YlUGHWgfrjLLx18splto2Q+Kb1ntpTXu8X61SLmSHZ4GdQvkmpoGLPfAY1tJFEZFI6CnNLSthBgnEinkP0ui63xR24JiUEJmhBKVI4OfCEB5VTlYUdrnAooHp7I5quJotLECZ8fRAoS4w9G9b2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772467035; c=relaxed/simple;
	bh=3aHF1WvYb6gbVvXYS4rMRPk0dpmpxM4agexnoYdP0UM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mCPmVlOVr2NMsFAwMm7Q55xvZ0brwXeR2u9d6tiXm0EGkW1sWrzhO/rblr68odIeoEFhSgwgS/uuhWCuWvc5mVYc5mZuqgRvK3z8rCAEHaXCnuDy8t50328Jn5ryurTTAbM5QplLLtd+VwxB/0LScGAlz2fM3l275wTk0jq4Ol4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a+ZZvVYl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HS2GHaDA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622ENKC32524299
	for <linux-media@vger.kernel.org>; Mon, 2 Mar 2026 15:57:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8vyvR83xrrtCU77jvjKIBTD0soAKN/hIqxbrkw2O4Eg=; b=a+ZZvVYlo4wLtBeZ
	mODk+bsqfzDxlaQMCa5Nb/TM3dvekABo4uq/BUsHzK1Pb0vFDXQl9IDHpCrZrvan
	Gy+Oqm2ACVA27CW//s2cPoXfFPOUtdSrPpzsyN1BIONwz9MQl7n65UrxpQKhdCtZ
	paYzk8RKggGp0IvZ21Nf+jjsl87nnfG2fjcbI9h0HJ0zL0dak/Bg8uTF60f3gKE/
	GPsd/zyrYpqTjI7c0lZLm1vajjB4+vKhSXvoatUqNzV5GVigiMR8e8VLxiV9djHR
	RRgRIbLG/ROGR6wFZN1JGbb+MS1rSZiv5ndWd/iZ8dbVn6ji/sccvremCddphhnA
	QbMf/A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cmgbav2ey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 15:57:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb3fae6f60so4138543485a.1
        for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 07:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772467032; x=1773071832; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8vyvR83xrrtCU77jvjKIBTD0soAKN/hIqxbrkw2O4Eg=;
        b=HS2GHaDAmpCVB7E8plO5prfc45y4hXfqNN47ZHe5SulyVi4JnWgHeKDsEQsyoKJ60P
         XrRVGb3KJ7TkBCaraRFPtpaLf/HmWZvqW1q1gtz1+qnbyhnvKPlQFwCP1v8xhcHEdafy
         Rc8/YyFQa54wZROC1PbNaebt+Z8vVaULBdyE2V4EaGJ0EnExAEwNIfs1SI1tyVX4GV5v
         dwQsJZ6HgjwrkHFVmZvBdzbR3t3k5VZ02K8ci925jCuGMFtCSOB/rXvePpsmaog7TLaH
         NlW3I/aeLKcOH2vHJQbBiopVde2RKK9SZtDcBUBRk1IhHs+aaYI/whFyZtzTn3AJrueR
         3yvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772467032; x=1773071832;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8vyvR83xrrtCU77jvjKIBTD0soAKN/hIqxbrkw2O4Eg=;
        b=nQGi+TYzr6oD9YrGd121Tyvx2YPeHMg+2h5P6DptozEbTmDK1QUNkA6XmWW3kJFX6u
         mWt/mgJmeP+r54QMy6YHhJT0zijo2rcMsTbHjjBtaR+SAb8D2PZroYrCds/B1nHdYon7
         tteAw+h0W2qC8mk6FFFCVN+KBPJxo5DOlaiF7aTNGiJd3C6iiZa0++1NhjtSkwSIb8UJ
         YV4wKK4FZzw6f8X48M+fOmt14evJJ1HmK2PzYH09ogPBcvp+MOkiGuaiIdpUV4wHUCCx
         oyWPrqpoucoZ+OJ7ilGwGlQ2WMLJ24S6pVQOrgJMdTXeUytwkMy6y22x3aPQHaXN0JB6
         Jfyg==
X-Forwarded-Encrypted: i=1; AJvYcCX2J+ppWscX+r7zzU5cbKu8nw+34lAIOABBRgD2p1OHixGLI1yFdGrlc8XTT1+HNGOCA0eTkrFfurT8eg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZenO6mP1WqqTTMNBFVXMeca/xsX2Smy4YFX2NWX1JsNdeMbvY
	Ojl7ZLquMu7awwk8VYb0z9CBQdUkxhCo43ex2fwAFoO6QYtXB9RdytEJ/7DK+ENZfPzSd0g2uFi
	DATEi5V5himjJJAivGEdzAiIAFMSmVSNZ3JVeyGmKwoyed/aOhW0QfmSqJo0kfZR40g==
X-Gm-Gg: ATEYQzzfOR8COCr0hL6e1DPpJ0OtWtAfJb2rR6dwuo8Zvk83Rrb6yQmxUoMSDPbGiOT
	IBL5qD2EY08f6cAzyi5+A6IURUVIlEUIYxbAHJ9WE0hDYhSFEokh9mPQSBdrisJQR/VWBeBmBFr
	ncZsNn5g4rqkm5pt4MZM0y9K6AEGRbElbH5ZFfW1n5bi4LfbivPIPDh58EjFmwGnWCDFI/34rCL
	y/1pTP37J9VZSBCIG+o8JMFwi4qGYasx5x9UKZLp/SChzA/mGMmBPskejAhK4nVRjy6hZbL8EDt
	r3LXF3zIuatAkI7Rqz/ty/JWfo2co7XjH6PlkzrwQJiiBRmav9MAfMN0Bej4Uk3wrsYWUCKqjFZ
	fRMST4jDJE25gdeAdh2n+NJJwjWGrSkDXae6hy+jxfWAeMDRt
X-Received: by 2002:a05:620a:2906:b0:8c7:1181:779f with SMTP id af79cd13be357-8cbbf3f540dmr1944225785a.35.1772467032131;
        Mon, 02 Mar 2026 07:57:12 -0800 (PST)
X-Received: by 2002:a05:620a:2906:b0:8c7:1181:779f with SMTP id af79cd13be357-8cbbf3f540dmr1944219785a.35.1772467031498;
        Mon, 02 Mar 2026 07:57:11 -0800 (PST)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-483bfb296bfsm163572955e9.0.2026.03.02.07.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 07:57:09 -0800 (PST)
Message-ID: <e60c6218-ff33-4603-afc1-28a9b891b61d@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 15:57:07 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/18] accel/qda: Introduce Qualcomm DSP Accelerator
 driver
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEzMyBTYWx0ZWRfXzHNutpKgAYLQ
 /xGnEZdie+ruvEzYq1tPWZLTugCFXccz4O1q3A7GkHLVNRtD18os0e6xcIt757gPrvHHhiRK/4m
 tC6DXqjz9h+GJGb6YaAjj4uML7KJX2cVcYupGKi7rVNXXhIt1vrU8yohSKbbrYVNMgxa4+OGn1K
 s9fjH4sio/42mY4STnIYLcKGR7/6UwU7mi01+1Hdb4WXRAF+TkObxNbyKfGyccZdeLqDgLU/w3I
 Br5hi1LpTBXqjo11oQpAyHNrNk1FrTbPb4L8onyIB3f0JWTE/7jGuv/vt47hStpfLtIa4nLL+Ge
 I3WC4dt9z+C40iKo0c8UCZpCWcdF8kQeT6ULalz3hbSLix6sH9p9G67Bf20KNJ8N7dZxaJ2kkrG
 NrIyl6R+yo6BqwX+LmVr+HSTuXOe3P6hOe19S/6G3ongTRIdDtWFTeJfIKY0o4xI2DHsmfFPP/7
 8DCKf6+mvaxTeWfWjDg==
X-Authority-Analysis: v=2.4 cv=QfVrf8bv c=1 sm=1 tr=0 ts=69a5b358 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=9YJduu4mqnAt5a5FaXIA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: qp4kTUorEnhiA4zdendovyhr0Os7Fheu
X-Proofpoint-GUID: qp4kTUorEnhiA4zdendovyhr0Os7Fheu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1011
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020133
X-Rspamd-Queue-Id: 8B1CF1DC55F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54106-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 2/23/26 7:08 PM, Ekansh Gupta wrote:
Thanks Ekansh for this this one out.

> Key Features
> ============
> 
> * Standard DRM accelerator interface via /dev/accel/accelN> * GEM-based buffer management with DMA-BUF import/export support
> * IOMMU-based memory isolation using per-process context banks

> * FastRPC protocol implementation for DSP communication
> * RPMsg transport layer for reliable message passing
> * Support for all DSP domains (ADSP, CDSP, SDSP, GDSP)

To what extent is this support expected ?

> * Comprehensive IOCTL interface for DSP operations
> 
> High-Level Architecture Differences with Existing FastRPC Driver
> =================================================================
> 
> The QDA driver represents a significant architectural departure from the
> existing FastRPC driver (drivers/misc/fastrpc.c), addressing several key
> limitations while maintaining protocol compatibility:
> 
> 3. IOMMU Context Bank Management
> 
> 
> 9. UAPI Design
>   - FastRPC: Custom IOCTL interface
>   - QDA: DRM-style IOCTLs with proper versioning support
>   - Benefit: Follows DRM conventions, easier userspace integration

Can you elaborate this.

Are we really getting leverage from any  of the standard libraries that
are available for drm accel?

In general I would like to understand how standardization of this kernel
driver is helping userspace side of things.

Does this mean that there will be no libfastrpc requirements in future?

If that is not the case then I see no point.

> 
> Open Items
> ===========
> 
> The following items are identified as open items:
> 
> 1. Privilege Level Management
>   - Currently, daemon processes and user processes have the same access
>     level as both use the same accel device node. This needs to be
>     addressed as daemons attach to privileged DSP PDs and require
>     higher privilege levels for system-level operations
>   - Seeking guidance on the best approach: separate device nodes,
>     capability-based checks, or DRM master/authentication mechanisms
> 
> 2. UAPI Compatibility Layer

Simple rule! you can not break anything that is already working with
existing UAPI.

>   - Add UAPI compat layer to facilitate migration of client applications
>     from existing FastRPC UAPI to the new QDA accel driver UAPI,
>     ensuring smooth transition for existing userspace code

What will happen to long term supported devices?

>   - Seeking guidance on implementation approach: in-kernel translation
>     layer, userspace wrapper library, or hybrid solution

> 
> 3. Documentation Improvements
>   - Add detailed IOCTL usage examples
>   - Document DSP firmware interface requirements
>   - Create migration guide from existing FastRPC
> 
> 4. Per-Domain Memory Allocation
>   - Develop new userspace API to support memory allocation on a per
>     domain basis, enabling domain-specific memory management and
>     optimization
> 
> 5. Audio and Sensors PD Support
>   - The current patch series does not handle Audio PD and Sensors PD
>     functionalities. These specialized protection domains require
>     additional support for real-time constraints and power management
Please elaborate, fastrpc support is incomplete without audiopd support.

--srini

