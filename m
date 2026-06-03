Return-Path: <linux-media+bounces-63481-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rwH5C367H2qZpAAAu9opvQ
	(envelope-from <linux-media+bounces-63481-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 07:28:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B84A634442
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 07:28:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Y1HVuScF;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=W+5UBLpL;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63481-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-63481-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 53D30301D842
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 05:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A093F3793D0;
	Wed,  3 Jun 2026 05:28:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF59D36C9D5
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 05:28:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780464503; cv=none; b=i9OlCUbaiRYXsE0575qRjpNTeqZEY6eCuegYz7hLUIFkeifh8OyOqE4inLyoj5Fgt722Seg0q6Z0ncz6jnPAvgEHOy1NvkAN26jbp0CJTaq3yRcnnV4gazOsRRsDKqE1xGZQhQknVTHwqgl81TT+5XoBIF9tyrkDMtvX4NpkodM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780464503; c=relaxed/simple;
	bh=M4LpOYY88rmRSVdai4s/uD/4i515n02fQjfIzJ4cFJ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RXcw5EGrSRQClPEuDfW9stbMZz5vhLV0x/jukb0Tt3/3IxN1pxlKR7YVr55UF+IwNwDLLpQBvzKVFb+TpHZIsbxFMgeAe4hXJVknZttx6mK/eOJbVp05FQr8mJt9H/jZixpbjNtxLa1f8FmbDH+Bs0FSjaaSM58N6HPnDoliFHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y1HVuScF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W+5UBLpL; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652KjMbC2688188
	for <linux-media@vger.kernel.org>; Wed, 3 Jun 2026 05:28:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eXGduTCF9StMe/W/R1Pp9AQqLYpxIS0I136uVj0AkSI=; b=Y1HVuScF3MC8OaMd
	5TEcIIX7BNLmavVFc4+pBYhu5ujFcjxD20ZbENmoNIqDPk8KkAVWPrSOXgmCY1IB
	SwANjLXUXktvtjk1zO7BTaF8iMxeJ+tEkqf+cYkNufK+qEtzrXyPaxH7n3w9Mzdu
	6oY1Piv/HdG2i4bS9U9aPZh6X+lL+zEvQbFn9v4tWho7XbxyPbfsXLVcZBXV712Y
	l/uNR083CCin5IV0zKpoL6QFh5G7tvai3VbmiAfwNI7NfocCnyqBD4bmqisCdmnd
	jhgmgrhRfbLK9D7EcTMgvxEEdMa6yz5a6Qq1viwMcMjEuIsEvQs2Dhu1l/h/nVUE
	lG5/Qw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsjad9uu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 05:28:20 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8525f0807aso15855336a12.3
        for <linux-media@vger.kernel.org>; Tue, 02 Jun 2026 22:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780464500; x=1781069300; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eXGduTCF9StMe/W/R1Pp9AQqLYpxIS0I136uVj0AkSI=;
        b=W+5UBLpLU3Iita2lP88M6VtIm81kf8fiLFopXlNOWA9C4tu/lAGHDBYzoLJqWsGZYP
         aLLx2nwrSnnouEaaexyejPh9lPF+/ciw1f07rScRsBfA9HiYu5Zvnshd226Krmjppoxh
         z7/m0sRBeFifSa5TyMz5iFPcrPgNb9JF9guV1ihipvQckbdZBJVIYSYlG1axm9IaxKsm
         CqTtnqx3VIR5RwgBHpQQZ8Fk1iI3l+4jqsMTqBsd1leUVC4WYEOvUUTiAGOcHrg9ofeb
         bG1Per62zHh1xiyRXR/h1LzV6SsupFiq/rkgZ1JvkeIKaKbKRPAAQoYnHOi3w/gPLzpA
         xZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780464500; x=1781069300;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eXGduTCF9StMe/W/R1Pp9AQqLYpxIS0I136uVj0AkSI=;
        b=E8ggQ3Ud9wbeI83FJosXyrs87TLafURGeOQ8cowdu4JscCWeXWiH1Tr1DgHAI5F226
         oJ6yEtkRlaBAg57LPZpoGLKIGryXez1pTVAyFLmo7zO01HY5UU4IX1iedmcEjNJbiu2M
         B+p73+gCRhXxGrzkUu7qEcQgsAhAG5M3l4pdncSA5a0S0qfMBSW8w0fuG8GZ/B/umLhY
         /tkdn0NZGXjSphFPDGDJ+layU9I8Uysd5b1DdtrfbnBATDIB2y5eQsMhg8V0Mm0AZc9F
         NKTAEXJFRxY6K9XTyuIO1S6OhCCXBJSfYHJp6jNxA0OkBNZZdNYy5j3UeVInlDNR8AuF
         HpoQ==
X-Forwarded-Encrypted: i=1; AFNElJ+FAt2lAlC25qgQCsHGgNbAb4QpEe5bCnDydq6GnPBzitnRE9yjijf7WH/Buw8jvs+FdxhOdcvjwO7QQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNgpAGfA9ST8CzpDW+ihCwg/redU0qWUeLGtZA5uywSWjMLCT9
	sqi6Od/HBx98dRmIrE80Brq1ujJcYazlz0cvGzjURLWm4jK0bgeVBhfYTU4lYWhh92tJR8iFDIs
	2Z1/qHgnS1aC02aoySXgtQKaUuX9EDsPzVK613otVbirUfT6eftmI1qjwgTd7AmUHzw==
X-Gm-Gg: Acq92OEQn6bPGVamiZUhGKVz97IF6YD4L78ybHrkY4XD1DNv3/t9zwZ3hQd6+qmoSMz
	9jtiJbFGzkdfaL6vn+G0E9ojAEp7ykKpKi5Qc73YNnedg5ACUHuDDW5u1aoM7MTfkF4vI1QyV9L
	JJgd2LteeMEZs3k3ZoA6/1HlXjwg2AGI+NaX57yOJFE0on72Yl9OKNKoFCVVFGAtFS4LAo/PHSS
	1hnBwMbv9GkoocUrKFkR5jzgFMlHtJmrgwlLizLmd50XiFOgY0bYvjTh/kz9rS7FqF+wabFmHXQ
	zC5eGVKa0I5d26GIlxeCH2oH7iwR0pjkv0RdfBYjXZ9rKW4naU97OP+cJN16rrqZ3sn3sWTYHuy
	8O/Now4BOg5Oa0hcfDHD3edrzuDeCmJCTrjijSVLw6dc5NaDkpkXxzxAbqHu/
X-Received: by 2002:a05:6a20:748a:b0:398:6ea8:21d8 with SMTP id adf61e73a8af0-3b49759433cmr2261516637.15.1780464499505;
        Tue, 02 Jun 2026 22:28:19 -0700 (PDT)
X-Received: by 2002:a05:6a20:748a:b0:398:6ea8:21d8 with SMTP id adf61e73a8af0-3b49759433cmr2261470637.15.1780464498951;
        Tue, 02 Jun 2026 22:28:18 -0700 (PDT)
Received: from [10.204.78.54] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0a624fsm986006a12.18.2026.06.02.22.28.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 22:28:18 -0700 (PDT)
Message-ID: <587b450c-c527-4c6a-b48b-8a7a266bd673@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 10:58:09 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/15] accel/qda: Add compute bus for QDA context banks
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
 <20260519-qda-series-v1-4-b2d984c297f8@oss.qualcomm.com>
 <gnlpw4ijwtjv43nhcv5iirhjnuc7dntx5vucdrhnxeyznyxa5x@t65o5owldu5s>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <gnlpw4ijwtjv43nhcv5iirhjnuc7dntx5vucdrhnxeyznyxa5x@t65o5owldu5s>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA0OSBTYWx0ZWRfX3soj/KpGGvOl
 7bKvbm1p9ToD0/Ekat6okA+sVkAyhYKm2yI7RjSmW46b2jPMAvUI7a/PVXRBRyaNaA8xpZxK0gB
 BPTruwMFpyxmqQK+Lvri7UYKwfcgIhpz1X/NzQoDOsPkrARjnCUAyr4WVLvqR76tWvmSfNXEh3U
 /NPeQtuzdcdiqJhaYaIc0kbqjjKdwMDCKqzG76SrYaz6DtByfvPh6RNw0IVAO7gvEpwdNlfT5f4
 vswH5g3oB7rxb2+iFAVNd+s1NfmfxmA4g5lMy28zjsNkL/lo3OE2w5tiWbVmKZbL9sVaoFAwiSI
 dhnuEJlUy3PzcBIYUknVVtxkhMoX1WX7Nc8nwyLYvQwMFpxkrej5LvGykNZ8zV8ADFFkavZYXyZ
 xCVS7/8Cv9IXb1+u5DAdUXkAvpcffa45FonLPAT7b5izQxf5Z+hfBG82lRVLyTzn8ZQwYcGl+gI
 A3gEQ341ZmDa2F3Cm0w==
X-Authority-Analysis: v=2.4 cv=Ld4MLDfi c=1 sm=1 tr=0 ts=6a1fbb74 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=fSmyMkXI2XJwL8L7xYwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: uNU9eFzMoUVuCSW9eyJ7IxqH9Q4lY2m5
X-Proofpoint-ORIG-GUID: uNU9eFzMoUVuCSW9eyJ7IxqH9Q4lY2m5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030049
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63481-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,m:srini@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-doc@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ekansh.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,quicinc.com,oss.qualcomm.com,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2B84A634442

On 20-05-2026 19:49, Dmitry Baryshkov wrote:
> On Tue, May 19, 2026 at 11:45:54AM +0530, Ekansh Gupta via B4 Relay wrote:
>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>
>> Introduce a custom virtual bus (qda-compute-cb) for managing IOMMU
>> context bank (CB) devices used by the QDA driver.
>>
>> IOMMU context banks are synthetic constructs — they are not real
>> platform devices and do not appear as children of a platform bus node
>> in the device tree. Using a platform driver to represent them was
>> therefore incorrect and introduced a probe-ordering race: device nodes
>> were created before the RPMsg channel resources were fully initialized,
>> and because probe runs asynchronously, user-space could open a CB
>> device and attempt to start a session before the underlying transport
>> was ready.
>>
>> The qda-compute-cb bus solves this by allowing the main QDA driver to
>> create CB devices explicitly and under its own control, making their
>> lifetime strictly subordinate to the parent qda_dev. The bus provides
>> a dma_configure callback that calls of_dma_configure() so that each CB
>> device gets its own IOMMU domain derived from its device-tree node,
>> enabling per-session memory isolation.
>>
>> The bus type and the CB device constructor (create_qda_cb_device) are
>> exported for use by the QDA memory manager.
>>
>> A hidden Kconfig symbol (DRM_ACCEL_QDA_COMPUTE_BUS) is introduced and
>> automatically selected by DRM_ACCEL_QDA so that the bus initialisation
>> runs via postcore_initcall before any QDA device probes.
>>
>> Assisted-by: Claude:claude-4-6-sonnet
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/accel/Makefile              |  1 +
>>  drivers/accel/qda/Kconfig           |  4 +++
>>  drivers/accel/qda/Makefile          |  2 ++
>>  drivers/accel/qda/qda_compute_bus.c | 68 +++++++++++++++++++++++++++++++++++++
>>  include/linux/qda_compute_bus.h     | 32 +++++++++++++++++
>>  5 files changed, 107 insertions(+)
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
> 
> Ugh. The previous line should be enough (but don't trust me).
I was seeing build failures if I don't add this. Took it as a reference
from host1x driver and recent iris patch.>
>>  obj-$(CONFIG_DRM_ACCEL_ROCKET)		+= rocket/
>> \ No newline at end of file
>> diff --git a/drivers/accel/qda/Kconfig b/drivers/accel/qda/Kconfig
>> index 484d21ff1b55..2a61a4dda054 100644
>> --- a/drivers/accel/qda/Kconfig
>> +++ b/drivers/accel/qda/Kconfig
>> @@ -3,11 +3,15 @@
>>  # Qualcomm DSP accelerator driver
>>  #
>>  
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
>> index dbe809067a8b..424176f652a5 100644
>> --- a/drivers/accel/qda/Makefile
>> +++ b/drivers/accel/qda/Makefile
>> @@ -8,3 +8,5 @@ obj-$(CONFIG_DRM_ACCEL_QDA)	:= qda.o
>>  qda-y := \
>>  	qda_drv.o \
>>  	qda_rpmsg.o
>> +
>> +obj-$(CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS) += qda_compute_bus.o
>> diff --git a/drivers/accel/qda/qda_compute_bus.c b/drivers/accel/qda/qda_compute_bus.c
>> new file mode 100644
>> index 000000000000..c59d977e924d
>> --- /dev/null
>> +++ b/drivers/accel/qda/qda_compute_bus.c
>> @@ -0,0 +1,68 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> +#include <linux/device.h>
>> +#include <linux/init.h>
>> +#include <linux/of.h>
>> +#include <linux/of_device.h>
>> +#include <linux/qda_compute_bus.h>
>> +#include <linux/slab.h>
>> +
>> +static int qda_cb_bus_dma_configure(struct device *dev)
>> +{
>> +	return of_dma_configure(dev, dev->of_node, true);
>> +}
>> +
>> +const struct bus_type qda_cb_bus_type = {
>> +	.name = "qda-compute-cb",
>> +	.dma_configure = qda_cb_bus_dma_configure,
>> +};
>> +EXPORT_SYMBOL_GPL(qda_cb_bus_type);
>> +
>> +static void release_qda_cb_device(struct device *dev)
>> +{
>> +	of_node_put(dev->of_node);
>> +	kfree(dev);
>> +}
>> +
>> +struct device *create_qda_cb_device(struct device *parent_device, const char *name,
>> +				    u64 dma_mask, struct device_node *of_node)
>> +{
>> +	struct device *dev;
>> +	int ret;
>> +
>> +	dev = kzalloc_obj(*dev);
>> +	if (!dev)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	dev->release = release_qda_cb_device;
>> +	dev->bus = &qda_cb_bus_type;
>> +	dev->parent = parent_device;
>> +	dev->coherent_dma_mask = dma_mask;
>> +	dev->dma_mask = &dev->coherent_dma_mask;
>> +	dev->of_node = of_node_get(of_node);
>> +
>> +	dev_set_name(dev, "%s", name);
>> +
>> +	ret = device_register(dev);
>> +	if (ret) {
>> +		put_device(dev);
>> +		return ERR_PTR(ret);
>> +	}
>> +
>> +	return dev;
>> +}
>> +EXPORT_SYMBOL_GPL(create_qda_cb_device);
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
>> diff --git a/include/linux/qda_compute_bus.h b/include/linux/qda_compute_bus.h
>> new file mode 100644
>> index 000000000000..90bf248c7285
>> --- /dev/null
>> +++ b/include/linux/qda_compute_bus.h
>> @@ -0,0 +1,32 @@
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
>> +extern const struct bus_type qda_cb_bus_type;
>> +
>> +struct device *create_qda_cb_device(struct device *parent_device, const char *name,
>> +				    u64 dma_mask, struct device_node *of_node);
>> +#else
>> +static inline struct device *create_qda_cb_device(struct device *parent_device,
>> +						  const char *name, u64 dma_mask,
>> +						  struct device_node *of_node)
>> +{
>> +	return ERR_PTR(-ENODEV);
>> +}
>> +#endif
>> +
>> +#endif /* __QDA_COMPUTE_BUS_H__ */
>>
>> -- 
>> 2.34.1
>>
>>
> 


