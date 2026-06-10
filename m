Return-Path: <linux-media+bounces-64395-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NhjhDisyKWriSAMAu9opvQ
	(envelope-from <linux-media+bounces-64395-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 11:45:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE73667F57
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 11:45:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="G0B0/CSr";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Qebo7x/J";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64395-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64395-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C49231404DB
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 09:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72EB13E0233;
	Wed, 10 Jun 2026 09:38:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3D2368953
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 09:38:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781084315; cv=none; b=Rnk66BHG+LtSl78mQBDGkqoqba5FwULg6ev+Jsk6R4ig3u4kf876OtezbZtLWV7YANjCs+rfiwY1bTEX/nUQiRL26nsVqhpzURrKDULK+COLcm3fKwJvpAt6Mzq2OoaEdByQe9l9jtSssrKXGmYZ19Ik7CrMUoEdejJ3+pSec4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781084315; c=relaxed/simple;
	bh=0WkxGCYcSYMAjpBAU3KfnACwHskqbBEptIR+MsEt90g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uyXhGiY5bdwe27rOt5VjZFH5gSngzDtMgWHjQjpahdeGXuBAR/T7snHLUCdrdokc1Jb17c0F9LuS2QN7g1eFdxUvGbTiE8CpZyGbLTV7wKK4XaSoVkuXXABiA+wbOZS80HIlRjYnhq/pQGayJuHifI1y1ldZVCMHfEa1ldyiwZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G0B0/CSr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qebo7x/J; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7iI9Q988894
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 09:38:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fLahizlXX21JZl8j3A8UCWqbtcmXHv2dftjEyU0Kt2U=; b=G0B0/CSrpQkuFS4s
	a7qfxcN0hGzlTeeLtQn7ZxFbd7BJ44iouWigMU3FyRBO5CvV1leqGfgXIUANKPfB
	H4xA2PZ6Ph27nOAOBeI6Gp0IJQTBNxPiETVcGtpyuajkdnaPDkDI/F2KfuGeibzF
	SA3afuC617MKr6lpneo8IA/cbIktCcR/Sf1Na5b0GXr4K7ZbQs9oIg9sO40UmLDx
	FF3AJHxPjixGeBZEh2wAe9m1gp0j0KWoi2HI3JHFnwjAgccj9onPjDHJ9sZ4Tem/
	9GeJ3U5d7ipAXOZRQf33GQ5yVUTaCTtNJTZybBwguakynoj35oJn2vN8xSIficxU
	bcOB6w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq2segq79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 09:38:29 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36d98b74447so5172107a91.2
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 02:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781084308; x=1781689108; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fLahizlXX21JZl8j3A8UCWqbtcmXHv2dftjEyU0Kt2U=;
        b=Qebo7x/JNPhHxWWXrHDknLpE4+4OdcAdGnlGP97wKdWCdawkXprrrAkRVn9mBT0x7P
         0nP32xbOPkqQsb6xH75S4oDOxPXyAlYcFDOjZy8Pie4JYH2UiiRoWiqhliUunxLQiGSR
         owPzy87OQ0ZJu5xkfkqP5d6uRLEJu+zUmc6VpnKeJSqSF6GexPsrm+1Old6x8RMk/JGZ
         BTjPqolvcmjdql+Ztidhpgeag/88Q23nNG6dWQLranq5usIAiAcw3x/Knhd2Jgm/yZld
         VNcD8omqIKk+EXgO9rZr6dVn2v2kGyoULcCNiMHNzVppx4n7KX202Bv63gIByZ0JLSg2
         U+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781084308; x=1781689108;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fLahizlXX21JZl8j3A8UCWqbtcmXHv2dftjEyU0Kt2U=;
        b=NlJU86XA4jyESrdEEKny6HDJyYf/ph0X2MyrvhUHeJxkvoW4pYmKazhZSAI/RL3Qpy
         fSx3/ANiPVrviqASorm+RPyCKkxcd26urncne3EixW7moLMrQCxHYkeLtDIf4MUzJAXM
         Ks/iCliOeXRio+baprQ6E/y88PSXr7RMgxTEE2RpuK7fNhN6fFwRQs2rHWAyHm5eMlym
         W3jXf4A3urtSb1NvOYjf/pNnV2sfMBZnqceVlMe5a5XsYp+HnAthUWyhYouMTlAzb12z
         Dn0LIgPOZ29zuBQ7JKJgv5UavoBhcFmNmkxQipFx6Olb0wZXS9o7ImCJgNCLeVuJhWYy
         24Sw==
X-Forwarded-Encrypted: i=1; AFNElJ8XKSK7Ez2crHvQr6ZPTK1STKEuBay6OT6gaI36QB984MsN0Cp6hJjXBU4HlUaJJOg8lLqzf4Mrer4I9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3/lds4NPkm9GpEw+Rvigck7q55I9/vCNrkI/EwVE/3vkXn0y9
	z4MTDwP+Op/a9rSz6jHmvh/Q2yu7dvf4XjjILlS/HvDDXvjvoJo2Il1vZ1Lf0ctLlh76l0NTC5G
	TpwjejNolROfnsIBxjvM5gYeJrmfGNswVJEJ2KCOTDQp6PoZWPjY1vUNPpKF81YNXHA==
X-Gm-Gg: Acq92OFazto2n2suwcBE1qzm+b1jaaphJu6Dxbt4gZdfuT6xafqsBxZTm4UDHMNSS8S
	EAe4LwQuPcDuYsqNQyEP6k18rAyLuD/rnabZkj7Da2UG+NRIkc0twp+ljRN57O6UInE9gqpQkSd
	RVVeSqXWURrAEW9zqWCzTlfW8rfacpk9O1ZoDx0xjCpO0X7dV5O98ciphWXqmqxdVz1zxmbqBkF
	JFoeY3WLRyB5jWbWOwuQpoxYW5qwjdzq23BYnhCFjFmxwAHiTDbA2M4IF+BsJ5q0dNZFKoocQNS
	SEEpL2K3EsxL1zAMOdOLSRCsVlYjVmrTk2fBndgDgc3ZRdPKQm5ZQgpmAPCW3hlx9dmYb3sixY7
	FzX5Dy3sa2yQ6okYwxJPaei/meNyVvVOuOvTR9jOtnK6FXLf+u6DdsnDvomPx2w==
X-Received: by 2002:a17:90b:5145:b0:36d:81b3:61a1 with SMTP id 98e67ed59e1d1-370eed0b63bmr26327683a91.7.1781084308240;
        Wed, 10 Jun 2026 02:38:28 -0700 (PDT)
X-Received: by 2002:a17:90b:5145:b0:36d:81b3:61a1 with SMTP id 98e67ed59e1d1-370eed0b63bmr26327640a91.7.1781084307708;
        Wed, 10 Jun 2026 02:38:27 -0700 (PDT)
Received: from [10.204.78.173] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37624a8e76csm2773910a91.15.2026.06.10.02.38.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 02:38:26 -0700 (PDT)
Message-ID: <b22703d3-03f2-4835-9eee-c3d1fa50a5ce@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 15:08:17 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/15] accel/qda: Add FastRPC invocation support
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
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>, srini@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        robin.clark@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com>
 <20260519-qda-series-v1-12-b2d984c297f8@oss.qualcomm.com>
 <43a7laqb7mnrvleunnmbxwhvzr6w3au4ofjri4r4ap7clsx6mc@jxqlr4a2lw56>
 <ba003d7d-03f5-4572-8321-3d1f666c8c27@oss.qualcomm.com>
 <q2q6tfnas3kikapwehbp6q7mykvk2wbuvn6ypbzc5ta7azh65w@wdwphde7gcxc>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <q2q6tfnas3kikapwehbp6q7mykvk2wbuvn6ypbzc5ta7azh65w@wdwphde7gcxc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Nfm-X7RRDWCIZWPOnvhnr5GRBwaQUIEK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA5MSBTYWx0ZWRfX1oKMXNC0ZxNP
 frO4S1TkNsaCqT8NE2oUb4CYrThiFN2GbUoUwmwVZa/IuVrj51cwYiCUdPDWHXP7lGkVm5gkI26
 +pY7JVWyAGBwtHEmw6mmGZwTnvE7//pjxgR1pPd0KHs3nMlqP6zGsIjVkLW8xnmIye9MVb08peb
 JCRUTSWvSZebo8H032Dy7fJjuvAQ1vfpK+hYf8PCD7L45mXmOhbwMKXIQw0a1bDV+IYoqTUKv7O
 5D+qic1SCXIYthQwhW7Cg2DZwANLl3Cw16J0OrkEY//vGmzampRzmKQG7Tmk2ca++A5zig8RxmR
 VpMnR78dzwu8OjOcIrsIyiu1JUoX+jQC9CDAVPi8P4snXp2IFkGcy/OebXM5MzCHplgEtk7zOMn
 5QsTG9siWvLXXypp0RmIzju1OxLzkchFVYZbexVGJufqG+NJzXb2MDhcZWq8TpBwoLGK3VwXVcY
 UTZkX0N6zOmVoZL7GGg==
X-Proofpoint-ORIG-GUID: Nfm-X7RRDWCIZWPOnvhnr5GRBwaQUIEK
X-Authority-Analysis: v=2.4 cv=Md1cfZ/f c=1 sm=1 tr=0 ts=6a293095 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=0tHIOXy_Vfvaqy0H-swA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100091
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64395-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,quicinc.com,oss.qualcomm.com,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.linaro.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[ekansh.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,m:srini@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-doc@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8AE73667F57

On 08-06-2026 02:44, Dmitry Baryshkov wrote:
> On Thu, Jun 04, 2026 at 10:39:14AM +0530, Ekansh Gupta wrote:
>> On 20-05-2026 19:26, Dmitry Baryshkov wrote:
>>> On Tue, May 19, 2026 at 11:46:02AM +0530, Ekansh Gupta via B4 Relay wrote:
>>>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>>>
>>>> Implement the FastRPC remote procedure call path, allowing user-space
>>>> to invoke methods on the DSP via DRM_IOCTL_QDA_REMOTE_INVOKE.
>>>>
>>>> qda_fastrpc.c / qda_fastrpc.h
>>>>   Implements the FastRPC protocol layer: argument marshalling
>>>>   (qda_fastrpc_invoke_pack), response unmarshalling
>>>>   (qda_fastrpc_invoke_unpack), and invocation context lifecycle
>>>>   management. Each invocation allocates a fastrpc_invoke_context
>>>>   which tracks buffer descriptors, GEM objects, and the completion
>>>>   used to synchronise with the DSP response.
>>>>
>>>>   Buffer arguments are handled in three ways:
>>>>   - DMA-BUF fd: imported via PRIME, IOMMU-mapped dma_addr used
>>>>   - Direct (inline): copied into the GEM-backed message buffer
>>>>   - DMA handle: fd forwarded to DSP, physical page descriptor computed
>>>
>>> No. This needs to go away. The QDA should support only one way to pass
>>> data - via the GEM buffers. Everything else should be handled by the
>>> shim layer, etc.
>> each FD passed here is a GEM buffer. The reason to pass fd is that there
>> are some APIs on DSP side which takes fd as an argument and the user
>> might use the same on their skel implementation. So in this case the
>> remote call will take fd to DSP and the skel implementation will use the
>> FD.>
> 
> Then handle it all on the userspace side. In the end, bad library API is
> not a reason to complicate kernel API and kernel driver.
The problem is that the user passes the fd as an argument to the remote
call which the fastrpc library cannot decrypt. So basically the user can
allocate some fd buffer(say with FD1) and then call some remote method
passing FD1 as an int argument to call HAP_mmap on the same at DSP side,
this int argument cannot be differentiated by fastrpc library as
FD/non-FD argument.
> 
>>>> +#define FASTRPC_SCALARS(method, in, out) \
>>>> +		FASTRPC_BUILD_SCALARS(0, method, in, out, 0, 0)
>>>> +
>>>> +/**
>>>> + * struct fastrpc_buf_overlap - Buffer overlap tracking structure
>>>> + *
>>>> + * Tracks overlapping buffer regions to optimise memory mapping and avoid
>>>> + * redundant mappings of the same physical memory.
>>>
>>> WHat for? Even if this is a valid optimization, implement it as a
>>> subsequent patch. The first goal should be very simple - get GEM buffers
>>> from the app, pass them to the DSP, read the results.
>> yes, this implementation is mimicking the existing fastrpc design where
>> non-FD buffers are also supported. I am currently evaluating the
>> maintainance of such buffers from userspace side and trying to
>> understand the impacts of the same. I am planning to bring it as a
>> future enhancement if there is no regression.>
> 
> Other way around. Drop it for now and bring it back if it has any
> positive impact.
We did evaluation and don't see userspace side handling being feasible
for non-FD buffers, I'll try to summarize the current design and the
problem:

Currently a remote call can take up to 255 arguments and in many cases
the user passes the buffers as non-FD arguments which is then copied to
meta data and sent to DSP. Before copy there is an operation to identify
if the buffers are overlapped so that it can be maintained efficiently.

DSP understands this based on offset and maps it accordingly, so for
multiple small sized arguments, there is a possibility that a single
page is used. Now if we allocate GEM buffers for each of these small
arguments, it would lead to creation of multiple pages(can go up to 255)
and all these pages then are required to be mapped onto DSP which could
also lead to DSP address space exhaustion. So the limitation is too many
pages and that DSP cannot handling this as efficiently as overlapped
copy buffers.>
>>>> + */
>>>> +struct fastrpc_buf_overlap {
>>>
>>> Stop clashing the names with the existing fastrpc driver.
>> ack.>
>>>> +	/** @start: Start address of the buffer in user virtual address space */
>>>> +	u64 start;
>>>> +	/** @end: End address of the buffer in user virtual address space */
>>>> +	u64 end;
>>>> +	/** @raix: Remote argument index associated with this overlap */
>>>> +	int raix;
>>>> +	/** @mstart: Start address of the mapped region */
>>>> +	u64 mstart;
>>>> +	/** @mend: End address of the mapped region */
>>>> +	u64 mend;
>>>> +	/** @offset: Offset within the mapped region */
>>>> +	u64 offset;
>>>> +};
>>>> +
>>>> +/**
>>>> + * struct fastrpc_remote_dmahandle - Remote DMA handle descriptor
>>>> + */
>>>> +struct fastrpc_remote_dmahandle {
>>>> +	/** @fd: DMA-BUF file descriptor */
>>>> +	s32 fd;
>>>> +	/** @offset: Byte offset within the DMA-BUF */
>>>> +	u32 offset;
>>>> +	/** @len: Length of the region in bytes */
>>>> +	u32 len;
>>>> +};
>>>> +
>>>> +/**
>>>> + * struct fastrpc_remote_buf - Remote buffer descriptor
>>>> + */
>>>> +struct fastrpc_remote_buf {
>>>> +	/** @pv: Buffer pointer (user virtual address) */
>>>> +	u64 pv;
>>>> +	/** @len: Length of the buffer in bytes */
>>>> +	u64 len;
>>>> +};
>>>> +
>>>> +/**
>>>> + * union fastrpc_remote_arg - Remote argument (buffer or DMA handle)
>>>> + */
>>>> +union fastrpc_remote_arg {
>>>> +	/** @buf: Inline buffer descriptor */
>>>> +	struct fastrpc_remote_buf buf;
>>>> +	/** @dma: DMA-BUF handle descriptor */
>>>> +	struct fastrpc_remote_dmahandle dma;
>>>> +};
>>>> +
>>>> +/**
>>>> + * struct fastrpc_phy_page - Physical page descriptor
>>>> + */
>>>> +struct fastrpc_phy_page {
>>>> +	/** @addr: Physical (IOMMU) address of the page */
>>>> +	u64 addr;
>>>> +	/** @size: Size of the contiguous region in bytes */
>>>> +	u64 size;
>>>> +};
>>>> +
>>>> +/**
>>>> + * struct fastrpc_invoke_buf - Invoke buffer descriptor
>>>> + */
>>>> +struct fastrpc_invoke_buf {
>>>> +	/** @num: Number of contiguous physical regions */
>>>> +	u32 num;
>>>> +	/** @pgidx: Index into the physical page array */
>>>> +	u32 pgidx;
>>>> +};
>>>> +
>>>> +/**
>>>> + * struct fastrpc_msg - FastRPC wire message for remote invocations
>>>> + *
>>>> + * Sent to the remote processor via RPMsg. This is the exact layout
>>>> + * the DSP expects; do not reorder or add fields without DSP firmware
>>>> + * coordination.
>>>> + */
>>>> +struct fastrpc_msg {
>>>> +	/** @remote_session_id: Session identifier on the remote processor */
>>>> +	int remote_session_id;
>>>> +	/** @tid: Thread ID of the invoking thread */
>>>> +	int tid;
>>>> +	/** @ctx: Context identifier for matching request/response */
>>>> +	u64 ctx;
>>>> +	/** @handle: Handle of the remote method to invoke */
>>>> +	u32 handle;
>>>> +	/** @sc: Scalars value encoding in/out buffer counts */
>>>> +	u32 sc;
>>>> +	/** @addr: Physical address of the message payload buffer */
>>>> +	u64 addr;
>>>> +	/** @size: Size of the message payload in bytes */
>>>> +	u64 size;
>>>> +};
>>>> +
>>>> +/**
>>>> + * struct qda_msg - FastRPC message with kernel-internal bookkeeping
>>>> + *
>>>> + * The wire-format portion is kept in the embedded @fastrpc member (must
>>>> + * be first) so that &qda_msg->fastrpc can be passed directly to
>>>> + * rpmsg_send() without a copy.
>>>> + */
>>>> +struct qda_msg {
>>>> +	/**
>>>> +	 * @fastrpc: Wire-format message sent to the DSP via RPMsg.
>>>> +	 * Must be the first member.
>>>> +	 */
>>>> +	struct fastrpc_msg fastrpc;
>>>> +	/** @buf: Kernel virtual address of the payload buffer */
>>>> +	void *buf;
>>>> +	/** @phys: Physical/DMA address of the payload buffer */
>>>> +	u64 phys;
>>>> +	/** @ret: Return value from the remote processor */
>>>> +	int ret;
>>>> +	/** @fastrpc_ctx: Back-pointer to the owning invocation context */
>>>> +	struct fastrpc_invoke_context *fastrpc_ctx;
>>>> +	/** @file_priv: DRM file private data for GEM object lookup */
>>>> +	struct drm_file *file_priv;
>>>> +};
>>>> +
>>>> +/**
>>>> + * struct fastrpc_invoke_context - Remote procedure call invocation context
>>>> + *
>>>> + * Maintains all state for a single remote procedure call, including buffer
>>>> + * management, synchronisation, and result handling.
>>>> + */
>>>> +struct fastrpc_invoke_context {
>>>> +	/** @node: List node for linking contexts in a queue */
>>>> +	struct list_head node;
>>>> +	/** @ctxid: Unique context identifier (XArray key shifted left by 4) */
>>>> +	u64 ctxid;
>>>> +	/** @inbufs: Number of input buffers */
>>>> +	int inbufs;
>>>> +	/** @outbufs: Number of output buffers */
>>>> +	int outbufs;
>>>> +	/** @handles: Number of DMA-BUF handle arguments */
>>>> +	int handles;
>>>> +	/** @nscalars: Total number of scalar arguments */
>>>> +	int nscalars;
>>>> +	/** @nbufs: Total number of buffer arguments (inbufs + outbufs) */
>>>> +	int nbufs;
>>>
>>> If it is inbufs + outbufs, why do you need it here?
>>>
>>>> +	/** @pid: Process ID of the calling process */
>>>> +	int pid;
>>>> +	/** @retval: Return value from the remote invocation */
>>>> +	int retval;
>>>> +	/** @metalen: Length of the FastRPC metadata header in bytes */
>>>> +	int metalen;
>>>
>>> size_t, also why do you need it?
>>>
>>>> +	/** @remote_session_id: Session identifier on the remote processor */
>>>> +	int remote_session_id;
>>>> +	/** @pd: Protection domain identifier encoded into the context ID */
>>>> +	int pd;
>>>> +	/** @type: Invocation type (e.g. FASTRPC_RMID_INVOKE_DYNAMIC) */
>>>> +	int type;
>>>> +	/** @sc: Scalars value encoding in/out buffer counts */
>>>> +	u32 sc;
>>>
>>> How is this different from the counts above?
>> sc carries the method id and handle counts. The reason to maintain count
>> separately is to avoid calculating it again and again.>
> 
> Is it just a sum of several values or something more complicated?
just the sum, I'll drop it if it's not really useful.>
>>>> +	/** @handle: Handle of the remote method being invoked */
>>>> +	u32 handle;
>>>> +	/** @crc: Pointer to CRC values for data integrity checking */
>>>> +	u32 *crc;
>>>
>>> Add it later. It's unused. Drop all unused fields.
>> ack.>
>>>> +	/** @fdlist: Pointer to array of DMA-BUF file descriptors */
>>>> +	u64 *fdlist;
>>>
>>> Why do you need DMA-BUFs in the invocation context? They all should be
>>> GEM buffers.
>> the reason is that the users are dependent on FDs as they can import
>> buffers allocated from anywhere and there are DSP APIs which takes fd as
>> an argument, so they might end up using the same in there skel
>> implementation.>
> 
> No, DSP API can't take FD, they don't quite cross the OS and IOMMU
> boundary. It's the userspace library API. Which might be improved,
> rewritten, implemented underneath, etc. For the kernel side please,
> pass _only_ GEM handles + offsets.
Yes, but with the current DSP design, DSP APIs take FD just because of
client/user design. On fastrpc, users could bring FD from any source,
register it with fastrpc and pass it on to DSP. The major problem is
what I mentioned above, where the user application passes the FD as an
integer argument and the fastrpc library not able to identify if that
int is an fd or some other data.>
>>>> +	/** @pkt_size: Total payload size in bytes */
>>>> +	u64 pkt_size;
>>>> +	/** @aligned_pkt_size: Page-aligned payload size for GEM allocation */
>>>> +	u64 aligned_pkt_size;
>>>> +	/** @list: Array of invoke buffer descriptors */
>>>> +	struct fastrpc_invoke_buf *list;
>>>> +	/** @pages: Array of physical page descriptors for all arguments */
>>>> +	struct fastrpc_phy_page *pages;
>>>> +	/** @input_pages: Array of physical page descriptors for input buffers */
>>>> +	struct fastrpc_phy_page *input_pages;
>>>
>>> I think you are trying to bring all the complexity from the old driver
>>> with no added benefit. Please don't. Use the existing memory manager.
>>> Let it handle all the gory details. If someting is not there, we should
>>> consider extending GEM instead.
>> I'm not changing the metadata format as the DSP might not understand the
>> messages if we modify it.
> 
> Well, it's up to you to know if DSP will understand the message or not.
> The probability ("might not") is not suitable here. Anyway, let's get
> rid of the various data formats first, then maybe some of the items will
> go away on their own.
ack>
>> Also, the fd is still being used because of
>> the client dependency on it. I'll check if there is any other logic that
>> needs alteration here.>
> 
> If the client keeps on passing FD to the library calls, you can map
> FD to GEM handles in the library code.
I hope the int argument part mentioned above answers this.>
>>>> +
>>>> +static int fastrpc_context_get_id(struct fastrpc_invoke_context *ctx, struct qda_dev *qdev)
>>>> +{
>>>> +	int ret;
>>>> +	u32 id;
>>>> +
>>>> +	if (!qdev)
>>>> +		return -EINVAL;
>>>> +
>>>> +	ret = xa_alloc(&qdev->ctx_xa, &id, ctx, xa_limit_32b, GFP_KERNEL);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	ctx->ctxid = id << 4;
>>>
>>> Why is it being shifted?
>> this is to accomodate PD type>
> 
> Not really an answer.
Okay, let me bring the ctxid layout that DSP expects:

[11:4] = CCCCCCCC (context ID)
[3:0]  = PPPP (PD type)

Based on this PD type, DSP will decide where to queue the message.
> 
>>>> +	return 0;
>>>> +}
>>>> +
>>>
>>
> 


