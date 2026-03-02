Return-Path: <linux-media+bounces-54049-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IO//E11GpWkg7AUAu9opvQ
	(envelope-from <linux-media+bounces-54049-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 09:12:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1DB1D4795
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 09:12:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 191E8303351C
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 08:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFB84375AC3;
	Mon,  2 Mar 2026 08:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dLrAYbxi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YUzdmVDc"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40AD379EF8
	for <linux-media@vger.kernel.org>; Mon,  2 Mar 2026 08:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772439068; cv=none; b=b6WFBDwoO7BFa15zrwQK1bkFsgiLFLrCAjZTWM/3PBDZGGiL6N/h8nSF3RNisss067kPmY/2sF2x+dYEgHy/S24ubmbAYNJPw7kW8bN79LPfbuwouX8CKr1NOpkihkMOjXzCU5BmYGp9X6+WZgmluS5rpamWcDFDMo4c8pWGlSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772439068; c=relaxed/simple;
	bh=rv4MpTWLbVDrRZnGJ1y2PRJZKISGnzYKDx8X9nLiGok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g9N71FUVruT8jdvqIc7W/X1HzgzyutEPmt1SHezABp8NI19hfbCV0wk5l8o6PbAiadXE6pf7qEQks2MUIHaFqslXD6Wjyp5Tx4xqiIUIz5t1z//UzeDet1u8Keqh2e8skYrQOO/Z3TemZrrw+VIeaXy77n9JTxl+LPAjd3tqJ0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dLrAYbxi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YUzdmVDc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6227gWro3747869
	for <linux-media@vger.kernel.org>; Mon, 2 Mar 2026 08:11:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bKT2lOHVdbNkn4L+PlCSmA7nngbFfRJNo82IaP0zHDw=; b=dLrAYbxiNF7vvyK6
	SfLrKjq/5QhEdzKtiOGJpMAlUBmgBnsdvHRVnNL6SarLJwCyNmn2PP2Dw6paW7zr
	nYo8fH0aEF0W53Am0NrRUBvhOqD8oho/YUpKHCEjib21BnW14LFX8FbQNhx+SLtQ
	53xSK6zvSZ7Q0xXzdi+75hhBBSjUD983ojc0cMzriV2YOs3fN20pqBvGMZnf58nL
	tXNEmLWU1FUMJZSSKbat+DF+Kzh8ZnPDXzhiW+BeJTPhi4KgX5SjXoyd012GKB0q
	S8h5N4QoyNJfPq+WrGMcR+Ut7+9zhun+dskiYvyshBjzsTjpwGzwNjJiWbJ8A7En
	vOa7zg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksf6mjxa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 08:11:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae59e057f1so2109755ad.1
        for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 00:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772439061; x=1773043861; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bKT2lOHVdbNkn4L+PlCSmA7nngbFfRJNo82IaP0zHDw=;
        b=YUzdmVDcHDaTdRsugPWe6U4XegZJNXjdtHHkZDnOmIZxUlk4ekXzy7x3sD9pakWdvK
         Dvh8ka434zJxpIsgkyB86B66xQfa/u5aSDgVnVWm/Ery0NXcoQOcGrvA2mvKPAiDvcKG
         MfzVJLl1DA0z8/cnqYwBgoJu9s2fiXbInP3MKidhllF8cSpttUIhjLzjXyR6+g883/Hp
         rhZGw5pI5ffKEopkiZDgbGzFR6q9XeFKRptYI6gepj7S6ToY39NySSv5SnidTbfpE0OE
         015OHO0lOsMkFgNLnR0ndCvmGNpZB3wga3JauWEgdlyRuRZkMDaqe8SIN042U2YaOwe/
         l4ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772439061; x=1773043861;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bKT2lOHVdbNkn4L+PlCSmA7nngbFfRJNo82IaP0zHDw=;
        b=n5IRSBxIFrwmMo//WjRLUtXYj5MTFuKjupb0vrGUtQR3HY+G2wgKJGidCLpsTTV1PZ
         fZSCynEV1R5UyzNcfOy6xjQ4w1aTQ0m66RC5LXZvmn4xRiabgpKBkon78vocD9eKoP8r
         h2jnrx+y5xYuju4GcCn6ru8M3ACkV1Qa2k51qxX+EpbO+zwsLyJOV0xjpKHDOyVbFTCr
         hAu/gU8ZKi4P4cARObuvKirYeU1qrQtDXXvCkoA8iGN8UhVUIxJqZ9LGPzLGhg1QGXFZ
         nrvd2v2AdHmreI8vxTtPgbKJdlKs4fY0Hz4JyXDysWr/ql2kVE/it9//A1qEMJkVgNV6
         cVjA==
X-Forwarded-Encrypted: i=1; AJvYcCVoBx8PP5EyK5TceiHiz6Z0Wf0JHf3MKrjre90bXIa4Jo+9bJe6cE6DleiHD2Bg4saZ4BwRAbCdBW1c3g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/L5npHQtPozJLsahLnP7FGbMrCuHeWsiRIBFLSxtA3c1z+TXP
	iIZD0oPyst5L6sfvKSbJUfculL6VXP31TMOwpo8F2S29cuPMpEiUiyLp5dyn6nbqpbLg84ZNhaC
	c9JYYfM9vtt+bgi8WmEC2zVUXoSOOyH4Xb6VFBvdK6irq3VYwa3njicGyx3g1QhnSVQ==
X-Gm-Gg: ATEYQzwIVcc2d0LUPa827JMcmhiNtgS+UQ7PKxKNRamKhg88CISXz0IB1iEmYsZ8/Wi
	XpIxVvqA8NtcawosSXcHLb7WdCs6Xd+wM9X+vxP/H0VcN5kcMkjXqycwU5dPc5YuukVUWM06iez
	F1hjtFzCvEqoGevHPHbpV5ZB9INN7dzYJ+f3RydBr2eFxeg+HZ1nDxSb02lHD+qnXKWqOBVMkCh
	RkTnFieyktWWe8b20wWsi8ZpGMyUvWZrPVhwnwcAjG/CibQp8YNnELNtX279hrviV7DFHxfZznN
	rG1JvlNNvSc9CgMHE4cWDnm533QM2ra2ItLG/i/Aqkl62f3AC2M6vSrOiEfQ1XJyHqcd7ZpRnIS
	EyTzIaeCZPo0FPbySASzgN3geTr/pPXv3+S7e3ys7skeBV0JWiA==
X-Received: by 2002:a17:902:ea02:b0:2ad:c527:e9fd with SMTP id d9443c01a7336-2ae2e4b5a34mr128338655ad.41.1772439061410;
        Mon, 02 Mar 2026 00:11:01 -0800 (PST)
X-Received: by 2002:a17:902:ea02:b0:2ad:c527:e9fd with SMTP id d9443c01a7336-2ae2e4b5a34mr128338135ad.41.1772439060858;
        Mon, 02 Mar 2026 00:11:00 -0800 (PST)
Received: from [10.206.99.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae45e07626sm51334055ad.39.2026.03.02.00.10.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 00:11:00 -0800 (PST)
Message-ID: <0e38e009-8097-4a66-b04f-95468b731b6d@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 13:40:52 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 05/18] accel/qda: Create compute CB devices on QDA
 compute bus
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
 <20260224-qda-firstpost-v1-5-fe46a9c1a046@oss.qualcomm.com>
 <x3s26yr7oy2dokp4plsp67yndr7o4ps6nuj7i4zjze77ifljux@ap537se6npfg>
 <57937a68-7f22-4ca1-8980-0be12cf06c66@oss.qualcomm.com>
 <3y6rn5ujkdbc6cd2ooq7gobjvokwwrey2xoj4d3h2pavi7r5k6@rrc6bbmutz73>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <3y6rn5ujkdbc6cd2ooq7gobjvokwwrey2xoj4d3h2pavi7r5k6@rrc6bbmutz73>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Bjn_3003PWAlaj1wqBjYtIvAKhr792BG
X-Authority-Analysis: v=2.4 cv=JoL8bc4C c=1 sm=1 tr=0 ts=69a54616 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ze67pjzAHjlU0Io9_bMA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA3MCBTYWx0ZWRfXyrsStcfjNXHA
 BXzAMdA/Ey8e0xHkS9qi92GZTIwO3XDN1lh4p9xHVC9zHc3mAM5O+4ziGPu1dfftIml8kQ4V67k
 N9jOl3K4F7BemUlgA4/D3QYLm60JKDvYkN7PBy1KKwhpMUhjYZssaEZxXZehl/tFn7OGJ8QcEv/
 5yB7lSuecL3EVSkfkZ7lM568X4SCZjLzN3mk824XcNn4PXMhlwe0fubEZDT3tpg6SKnr89jHabf
 Cr0BZnaNTTQaCMphsdN41fyqmKJyHhKuIBRvuJlpkIM/M94eXSfGw6y+yTtyvPysK1q9/UzfVEy
 GVHT1SmIwR7FP9rncFeLjt4+bH3+Uoa+s4CMWzMdAZ9xj+ySFgbuKZtkJfg4ytVRDcBzh0AOnNx
 4m8caVeXlZWoYdBAGjOXbncymXNudTB6ri5O9u8zZgawf27lsoy/OXlC5ywRJhkogqRufvdqiAz
 VTTyfyGjJNNEMJwt/Iw==
X-Proofpoint-GUID: Bjn_3003PWAlaj1wqBjYtIvAKhr792BG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020070
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,oss.qualcomm.com,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-54049-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AC1DB1D4795
X-Rspamd-Action: no action



On 2/26/2026 4:16 PM, Dmitry Baryshkov wrote:
> On Thu, Feb 26, 2026 at 02:08:57PM +0530, Ekansh Gupta wrote:
>>
>> On 2/24/2026 4:19 AM, Dmitry Baryshkov wrote:
>>> On Tue, Feb 24, 2026 at 12:38:59AM +0530, Ekansh Gupta wrote:
>>>> Add support for creating compute context-bank (CB) devices under
>>>> the QDA compute bus based on child nodes of the FastRPC RPMsg
>>>> device tree node. Each DT child with compatible
>>>> "qcom,fastrpc-compute-cb" is turned into a QDA-owned struct
>>>> device on qda_cb_bus_type.
>>>>
>>>> A new qda_cb_dev structure and cb_devs list in qda_dev track these
>>>> CB devices. qda_populate_child_devices() walks the DT children
>>>> during QDA RPMsg probe, creates CB devices, configures their DMA
>>>> and IOMMU settings using of_dma_configure(), and associates a SID
>>>> from the "reg" property when present.
>>>>
>>>> On RPMsg remove, qda_unpopulate_child_devices() tears down all CB
>>>> devices, removing them from their IOMMU groups if present and
>>>> unregistering the devices. This prepares the ground for using CB
>>>> devices as IOMMU endpoints for DSP compute workloads in later
>>>> patches.
>>> Are we loosing the nsessions support?
>> Yes, it's not part of this series. I'll try bringing that as well.
>>>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>>> ---
>>>>  drivers/accel/qda/Makefile    |   1 +
>>>>  drivers/accel/qda/qda_cb.c    | 150 ++++++++++++++++++++++++++++++++++++++++++
>>>>  drivers/accel/qda/qda_cb.h    |  26 ++++++++
>>>>  drivers/accel/qda/qda_drv.h   |   3 +
>>>>  drivers/accel/qda/qda_rpmsg.c |  40 +++++++++++
>>>>  5 files changed, 220 insertions(+)
>>>>
>>>> diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
>>>> index 242684ef1af7..4aded20b6bc2 100644
>>>> --- a/drivers/accel/qda/Makefile
>>>> +++ b/drivers/accel/qda/Makefile
>>>> @@ -8,5 +8,6 @@ obj-$(CONFIG_DRM_ACCEL_QDA)	:= qda.o
>>>>  qda-y := \
>>>>  	qda_drv.o \
>>>>  	qda_rpmsg.o \
>>>> +	qda_cb.o \
>>>>  
>>>>  obj-$(CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS) += qda_compute_bus.o
>>>> diff --git a/drivers/accel/qda/qda_cb.c b/drivers/accel/qda/qda_cb.c
>>>> new file mode 100644
>>>> index 000000000000..77a2d8cae076
>>>> --- /dev/null
>>>> +++ b/drivers/accel/qda/qda_cb.c
>>>> @@ -0,0 +1,150 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>> +// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>>> +#include <linux/dma-mapping.h>
>>>> +#include <linux/device.h>
>>>> +#include <linux/of.h>
>>>> +#include <linux/of_device.h>
>>>> +#include <linux/iommu.h>
>>>> +#include <linux/slab.h>
>>>> +#include "qda_drv.h"
>>>> +#include "qda_cb.h"
>>>> +
>>>> +static void qda_cb_dev_release(struct device *dev)
>>>> +{
>>>> +	kfree(dev);
>>> Do you need to put the reference on the OF node?
>> Reference put is happening as part of qda_destroy_cb_device.
> This way: you have a (small) window where of_node is already put (and
> might be gone), but the pointer is not NULL. The of_node should be put
> only when device is no longer accessible from the rest of the system, in
> release function.
I'll move put to release function to avoid suggested scenario. Thanks.
>
>


