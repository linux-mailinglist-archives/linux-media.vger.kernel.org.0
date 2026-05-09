Return-Path: <linux-media+bounces-61006-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHhxKFxp/2nQ6AAAu9opvQ
	(envelope-from <linux-media+bounces-61006-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 09 May 2026 19:05:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BD7500A12
	for <lists+linux-media@lfdr.de>; Sat, 09 May 2026 19:05:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 115FB3013AA4
	for <lists+linux-media@lfdr.de>; Sat,  9 May 2026 17:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D0453BD224;
	Sat,  9 May 2026 17:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mxhxpFNP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O7K1HtJd"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58CD3B9D93
	for <linux-media@vger.kernel.org>; Sat,  9 May 2026 17:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778346320; cv=none; b=G49pgr/PaGvTB5rpfwGEm+xrvyBzErwEyxcuhOzBXvpJjf6tM/pisPPb4Kqxyyc9ty/tcMY0EJG+DYCCQ4ZocrzhNAdZZhrQX5L8dRPmeh/NePhJLZyo2XYVbqXNl2Q1jQ9SHVLztDab3o6MNf3Fyq9Kv3ejjpU6Jqb4qCdbqMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778346320; c=relaxed/simple;
	bh=NVEICKATJvs2+Kctq+POLQ5FvfJ23QzrrplUTCJ+oYU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=of8vx5H6Gw6zkvtZTJDSJvNu+b125GD//MZSKcPXZpeZmyRgKbdliCRw+Fu3FATLxZDWRdFHS5UEP0QBOUmuEuy0L0q5TObKL+h23AkzNorzbdHvX/xV49huTreExFjLX0FQqbc7zcWE7bD3uOfOj7cWDUfTho7dR/QkBhPgV9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mxhxpFNP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O7K1HtJd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6490Jh6J1767958
	for <linux-media@vger.kernel.org>; Sat, 9 May 2026 17:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xp6s8Lkpgmu1HZrD5qkrcJqIJ3vanqdE2IYQa5ZytRI=; b=mxhxpFNPSHyfI4Q8
	/pWIVECDdtxa9ZWYvTY4U54x3Lo9fsJ9htjYScIjlSXVUDWi4R9k7YBAbR5geIBo
	WqYfLASYOxz8AMInOMzC7YCuhiysaek3ky5fvLEfjwIZV1u2sz9V3OG2DkXfEtRO
	I0T/bzIsJJc3KDT7wBYat6SomT9WwdxTTca7e+xzEE/FuXzzCaHceLb5n0X7JUFw
	Ble8E4aUbgi6LMvLGhF6s2CXx+xmEwpMiYi8Xp+AlLt8uWuzCcE/TXiVNR7+ALVH
	f4nR+hrlrDT9BJn0haiYmfjs+cKcG6Q7lOo59nv2DtDoPAYr4FYrhtlM6tFj3zhD
	Ko+dZw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1t9q1p52-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 09 May 2026 17:05:17 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba6fe41283so36973825ad.1
        for <linux-media@vger.kernel.org>; Sat, 09 May 2026 10:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778346316; x=1778951116; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xp6s8Lkpgmu1HZrD5qkrcJqIJ3vanqdE2IYQa5ZytRI=;
        b=O7K1HtJdSgtxfDAHI3m5U36DiSRGjgIqh2A0bg75+PPrI51KLN17y8EYL//AloXSUU
         p2wf+ySAwVHo3LL4Bt8BZ2UWjlG7DsytUgRCOh86ap9mTCMHEdTQzVctRBlCLDruYaDg
         AIMukDR64aPACYilB0UlMnBOTNw2QNo3qyxi1S5SNI4TNjELNonGKEMubHD621Ujzip/
         TplVYQubJP9TDPiHKV5IDJB4pKUnbzV40+SGzVVz29YzR8hEI80M+zWjRBt6vZqJsjJv
         ICXQXOHir8+Qmlvbx2fMbbiBHIeeXwPWC5U+wHNn8oHIBgcKvBXuCuc/K9jBsmS/UEpv
         vunA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778346316; x=1778951116;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xp6s8Lkpgmu1HZrD5qkrcJqIJ3vanqdE2IYQa5ZytRI=;
        b=dYYPJt0/i55IA0aTAhiA97DMqSqKzAnq4VU+Pc8GuX9VJzmqcsFu/ZdxjBbOhGOQk7
         TVobHKFHT5pNLkuDUZp9Ds7ptCGReCOOsctAD8Px4BHbrhQOy9N99moXIgV4R3doc4YB
         ui6GQfQMJKmIHRr2vjiw0DRp6CNwa5hUEk1GoOgL+2OsmrXK7nNRXqZY1PHuP6fVI1zI
         1NKXt2l+p0+4iScDyTYn/oo8IdMBOeq4Uko+Qo2yK0bgClAP24dhgeB0KiTdAH6Ts19e
         fBFnTVOU1NMOxy2QtkcMNqzF8Vr40v9ql4xBt9TgY8sbIRc9g9Im0D86vMy44HGJwqGh
         S+iw==
X-Forwarded-Encrypted: i=1; AFNElJ+ZefLMOqNH+S1eLjSKme/0Ry74W/RFWfZkXtf/+iD1m4dBYfg62vQ3Y1qvUWcXyC5XzgtijC6nPnK5LA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgfeA9M6L+H17TPZvK1QILOHmTaloW0NBQAdEn+q1uaZcohBlU
	wUXw7KQEgGUr1GXpVTc9soU1LEYx22mlX+TkEN0H0JjU54If89HaZekHpTRndWnLK1JARm98cvb
	uSnr+J7YQYf15JXhx4FfQKt1NIvGInQRQc895r6lz74ycXRZcsvv70p2Gm+EZBpThUA==
X-Gm-Gg: Acq92OGTiBsYZ3K1YgVPF8dJPS0Tiw0tpcKDctm8jFy39hLdJsAINWa6QL6EFuCrk+t
	rInZxpdqvGrh5hltQAg5++4Zaj/OdFe10jPae1F7yv9k9Knt7hqCQqgPMQLHx7HsN4zRYvbWGSh
	DTJGlPLTepXfpjSlIvWkEHdOSqLksUM/eZNwmzjT5e7zLqvC6nKkrNi7wUsLWuKb9ibXVuPT3wd
	PAnzhLaE9wsMA8Fy2ZA9mI4hQa2Br8Wz9xzgaxwX49JXYmqtD/ooSycY33rYPE+44YsmKp91rvW
	7nQpjl4E1jTyENktQ3SS5z5DsIMPGKpKoLjsj85QPQZgWmda1XCMJBs7lIgNpXR7B4fnGjp8ehm
	hLuPLEBJOB8dAuiHd4f400vLEw8ySmSmF3P3LNW+u6swYd9Yyx5c=
X-Received: by 2002:a05:6a20:6a09:b0:3a2:dabf:fef7 with SMTP id adf61e73a8af0-3aa5a9ab766mr18187270637.26.1778346316365;
        Sat, 09 May 2026 10:05:16 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a09:b0:3a2:dabf:fef7 with SMTP id adf61e73a8af0-3aa5a9ab766mr18187222637.26.1778346315840;
        Sat, 09 May 2026 10:05:15 -0700 (PDT)
Received: from [192.168.0.9] ([49.205.255.40])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8267696787sm4960455a12.13.2026.05.09.10.05.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 May 2026 10:05:15 -0700 (PDT)
Message-ID: <241a1ff5-b14e-28ee-ae3d-23d5e894fe77@oss.qualcomm.com>
Date: Sat, 9 May 2026 22:35:05 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v5 01/14] media: iris: Add iris vpu bus support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-1-7fbb340c5dbd@oss.qualcomm.com>
 <brt5t4b2eaudpb76rfdutfpe2p3rgjjyyrezcpsarqvuzsvvru@fgf22ttmijfs>
Content-Language: en-US
In-Reply-To: <brt5t4b2eaudpb76rfdutfpe2p3rgjjyyrezcpsarqvuzsvvru@fgf22ttmijfs>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: A0hDOVXfVHMb-TPLPMCmI449cMPFc7oT
X-Proofpoint-ORIG-GUID: A0hDOVXfVHMb-TPLPMCmI449cMPFc7oT
X-Authority-Analysis: v=2.4 cv=J7yaKgnS c=1 sm=1 tr=0 ts=69ff694d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=SpcZ+gRb+6o1zy8jT5J+bQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=bJBNbYhuL5TyR-YRFvMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA5MDE4NSBTYWx0ZWRfXxFUp3vobqxZQ
 X6+EDi/Z9kjD23D1fU+tKDqcULFBqNc64qL58OTHkgWmJeXyi45r6/9U5MWjp9uR4lcPft6FRal
 B46WiY8HH0jsXvKYI5uYNPHv/4M+BfGUkaNSIxR/RNWYTfEa0iutqxnGfFuhjosOE4DeuRd2+M/
 pDtjYmv90J2zdXRgOJzsxlvui+wA9w2NbkLcUP962d+ax7DFQbF0qVtd2ewUrthDENZTPb5mHQy
 AljFrhaGh6lcgNZlZQ3WE9jVSEI48xjnZRip2F3hQEp1yxOVpE7p22FL5fF8bFr5JW1D0pdWCY5
 Ztbc91fFY+m+ki0B5kMnMSsTzGw95tc5j94Z7gGdeVC2C4+AqENycEChJ0vGaPZzoOBa81p6xjh
 JbCQZYtkejfeIGMyy5jO3tt+rL5shVYIWvXBGG3rR5JtWubiJR9wRp/h5uhN+HgqWCLdcLVVO36
 TrJ5hs1oFgQzzX5ITPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-09_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605090185
X-Rspamd-Queue-Id: 32BD7500A12
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61006-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
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


On 5/9/2026 12:46 AM, Dmitry Baryshkov wrote:
> On Sat, May 09, 2026 at 12:29:50AM +0530, Vishnu Reddy wrote:
>> From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>
>> On glymur platform, firmware loading needs a separate IOMMU mapping with
>> its own stream ID. This stream ID is defined in the device tree with the
>> assosiated firmware function ID in the iommu-map property. To create this
>> mapping, a separate child device is needed so the firmware memory can be
>> isolated in its own IOMMU context.
>>
>> Introduced a new bus called iris-vpu-bus. This creates a dynamic device,
>> and its dma_configure() callback calls of_dma_configure_id() with the
>> function ID provided by the client to map the corresponding stream ID.
>> This sets up a dedicated IOMMU context for the child device.
>>
>> Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>>  drivers/media/platform/qcom/iris/Kconfig        |  4 ++
>>  drivers/media/platform/qcom/iris/Makefile       |  1 +
>>  drivers/media/platform/qcom/iris/iris_vpu_bus.c | 69 +++++++++++++++++++++++++
>>  include/linux/iris_vpu_bus.h                    | 25 +++++++++
>>  4 files changed, 99 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/iris/Kconfig b/drivers/media/platform/qcom/iris/Kconfig
>> index 5498f48362d1..025280ef1221 100644
>> --- a/drivers/media/platform/qcom/iris/Kconfig
>> +++ b/drivers/media/platform/qcom/iris/Kconfig
>> @@ -1,3 +1,6 @@
>> +config QCOM_IRIS_VPU_BUS
>> +        bool
>> +
>>  config VIDEO_QCOM_IRIS
>>          tristate "Qualcomm iris V4L2 decoder driver"
>>          depends on VIDEO_DEV
>> @@ -6,6 +9,7 @@ config VIDEO_QCOM_IRIS
>>          select QCOM_MDT_LOADER
>>          select QCOM_SCM
>>          select VIDEOBUF2_DMA_CONTIG
>> +        select QCOM_IRIS_VPU_BUS
>>          help
>>            This is a V4L2 driver for Qualcomm iris video accelerator
>>            hardware. It accelerates decoding operations on various
>> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
>> index 2abbd3aeb4af..79bc67980339 100644
>> --- a/drivers/media/platform/qcom/iris/Makefile
>> +++ b/drivers/media/platform/qcom/iris/Makefile
>> @@ -31,3 +31,4 @@ qcom-iris-objs += iris_platform_gen1.o
>>  endif
>>  
>>  obj-$(CONFIG_VIDEO_QCOM_IRIS) += qcom-iris.o
>> +obj-$(CONFIG_QCOM_IRIS_VPU_BUS) += iris_vpu_bus.o
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_bus.c b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
>> new file mode 100644
>> index 000000000000..15ba4d9c563e
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
>> @@ -0,0 +1,69 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include <linux/device.h>
>> +#include <linux/iris_vpu_bus.h>
>> +#include <linux/of_device.h>
>> +
>> +static int iris_vpu_bus_dma_configure(struct device *dev)
>> +{
>> +	const u32 *iommu_fid = dev_get_drvdata(dev);
> This should be drm_get_platdata() rather than _drvdata().

Ack, will use dev_get_platdata().

>> +
>> +	return of_dma_configure_id(dev, dev->parent->of_node, true, iommu_fid);
>> +}
>> +
>> +const struct bus_type iris_vpu_bus_type = {
>> +	.name = "iris-vpu-bus",
>> +	.dma_configure = iris_vpu_bus_dma_configure,
>> +};
>> +EXPORT_SYMBOL_GPL(iris_vpu_bus_type);
>> +
>> +static void release_iris_vpu_bus_device(struct device *dev)
>> +{
>> +	kfree(dev);
>> +}
>> +
>> +struct device *create_iris_vpu_bus_device(struct device *parent_device, const char *name,
>> +					  u64 dma_mask, const u32 *iommu_fid)
>> +{
>> +	struct device *dev;
>> +	int ret;
>> +
>> +	dev = kzalloc_obj(*dev);
>> +	if (!dev)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	dev->release = release_iris_vpu_bus_device;
>> +	dev->bus = &iris_vpu_bus_type;
>> +	dev->parent = parent_device;
>> +	dev->coherent_dma_mask = dma_mask;
>> +	dev->dma_mask = &dev->coherent_dma_mask;
>> +
>> +	dev_set_name(dev, "%s", name);
>> +	dev_set_drvdata(dev, (void *)iommu_fid);
>> +
>> +	ret = device_register(dev);
>> +	if (ret) {
>> +		put_device(dev);
>> +		return ERR_PTR(ret);
>> +	}
>> +
>> +	return dev;
>> +}
>> +EXPORT_SYMBOL_GPL(create_iris_vpu_bus_device);
>> +
>> +static int __init iris_vpu_bus_init(void)
>> +{
>> +	int ret;
>> +
>> +	ret = bus_register(&iris_vpu_bus_type);
>> +	if (ret) {
>> +		pr_err("iris-vpu-bus registration failed: %d\n", ret);
> Just 'return bus_register();'

Ack.

>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +postcore_initcall(iris_vpu_bus_init);
>> diff --git a/include/linux/iris_vpu_bus.h b/include/linux/iris_vpu_bus.h
>> new file mode 100644
>> index 000000000000..7437a2ba411c
>> --- /dev/null
>> +++ b/include/linux/iris_vpu_bus.h
>> @@ -0,0 +1,25 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#ifndef _LINUX_IRIS_VPU_BUS_H
>> +#define _LINUX_IRIS_VPU_BUS_H
>> +
>> +#include <linux/device.h>
>> +
>> +#ifdef CONFIG_QCOM_IRIS_VPU_BUS
>> +extern const struct bus_type iris_vpu_bus_type;
>> +
>> +struct device *create_iris_vpu_bus_device(struct device *parent_device, const char *name,
>> +					  u64 dma_mask, const u32 *iommu_fid);
>> +#else
>> +static inline struct device *create_iris_vpu_bus_device(struct device *parent_device,
> You are adding globally visible API without _any_ sensible prefix. It
> should be named other way: iris_vpu_bus_create_device().

Ack.

>> +							const char *name, u64 dma_mask,
>> +							const u32 *iommu_fid)
>> +{
>> +	return ERR_PTR(-ENODEV);
>> +}
>> +#endif
>> +
>> +#endif /* _LINUX_IRIS_VPU_BUS_H */
>>
>> -- 
>> 2.34.1
>>

