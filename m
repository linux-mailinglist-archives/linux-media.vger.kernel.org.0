Return-Path: <linux-media+bounces-57432-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uChXCeq5x2l8bQUAu9opvQ
	(envelope-from <linux-media+bounces-57432-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 12:22:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A9134E2A6
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 12:22:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A280D303A5F0
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 11:22:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA1E4388E47;
	Sat, 28 Mar 2026 11:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZGDSk71s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z2dVCuD1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777DE337BB0
	for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 11:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774696924; cv=none; b=d30eg+S5glFrW7JsMmdKjVD+tjb13LPltSxctmaAasqYrdGKxehg3UR+E0Xyt64u6ztkRuz5XyXWGz9bx9vd+XH5NAS4+UayeO9qNUN7nlOW+qiAmzgq9s+uxpocYg7LJLadjD+D6vtmoNNLfsLhVQuupB6JJ6h9lG/Scifrj+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774696924; c=relaxed/simple;
	bh=RtNXBGNtRATM5jqnHVn3bv+4chif7R/yZkqXomXDMTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pZ/3ullzufBwB/PgoaMD/wQvR5B4ZtlqmnCyRnR2urWdeItt3NgreWhCf6kguKqAhQ6hEYP/+vrYWD3VPw6kGCPE80XOcWc0c2k69pI7UUVDENPyS/+zlvaG+j322ykUWrNGD+Q6n7Eoa306n30efWnhJBwlzUA7RsWnu8hGnkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZGDSk71s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z2dVCuD1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62S4BoPH2275279
	for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 11:22:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fHSZ6caN9gdEFf4pzLfXl5hJ0qRQBkpE/9XtrzJn3VU=; b=ZGDSk71s0QHAPjHH
	5u2hLCdm4aZ2avufHtVHWUeQs8reEpdPIxA5MkbUXUlzYBOilgNCxMj60VnGonMc
	GJKd87vyY85a3Evxf7lFdSVwUamuAs0VNZnkNowigSfjxXiCKNfAYBoZaZFln6oY
	XIOzERua/3OKDHHpo0pGAhKJfdiQJxn9uPUS3HaU7Hm/qjBjQgH5bMWJDho2W4kq
	gxfx/3+7jjH06baZxl6dbbdiyu6yFTGW3iPX/JbBD46mKiv8i7tuNQaI+4J4SYJe
	BozUaEO4YQYw6zmUiKGLBiu5XVissyWyHVrqRymOOwjPTJzq6Wrro1+MTsSo3iPa
	TiIqsg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d67rc0mth-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 11:22:01 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35d9467e85aso435948a91.0
        for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 04:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774696921; x=1775301721; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fHSZ6caN9gdEFf4pzLfXl5hJ0qRQBkpE/9XtrzJn3VU=;
        b=Z2dVCuD16q1vdoMLZZQH6UN+BrXPF1Wow24Dv81t7V/GHkquPN3mVCg674brDpOVPl
         97crHKtze0Bfd96klTPdVxYclExMLAOzsCMmOYvTSRjzPL00dhBb8du2kEC7FzjA+6n0
         9uvQ/8QcF2CwBci4X4PfXHppqnHGaxsWGzQjhnRlUEKm/2Dvnew0fcwqK9LRvqah9S4b
         NIcSllVxW1FXG0cVv3YLU0/rZ5vRbJ8VK3UvJN6CiKTW+OlVH9nGBv4CNJkMSHmfnU8K
         drlRO2gmOC+2AcktGWISfZISYIXABP+wYAAMif8U0xptAAknw7e24mlk35p7A/cwRR2q
         fK/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774696921; x=1775301721;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fHSZ6caN9gdEFf4pzLfXl5hJ0qRQBkpE/9XtrzJn3VU=;
        b=XDfEbhGSZeWV7qpXI0rsnps0kaL4376e7zdf5jE3PdeNtT4F4cxgffM+v7kiiGpsEg
         V1CpIOQj5bnsti4FXSh3G0HyywYwFFvE+tubzsgNkKOS4gBKheAjMmqX35Lt5HPvGyI+
         GBqF3Od2YJojJAs8zeuUX4ISN/kdpUbA3qi2ofeIVDbuKfwSg1q6vWl8IPD76o8DCc1l
         QuRq0ZG/eOdMDaavgL2oPzTfYdDn+d6Jvb0tbeNDv5yl/n6OHiv3PG0+cLW+wnaa42la
         kCH8jvQqkAeuZGckzfRKvNWzbH7kRvtT7zxlxdd/DPniUa8BlsVdQvvo+2559HbWU/Zp
         /gdA==
X-Forwarded-Encrypted: i=1; AJvYcCVMEo0JnoAPgm4QQtbSi1Nl0kA9T4pfH6aZkLRn5rgHzTu5Z8z+SwxIrz8GPTjBpLX+xOqRUSEaF8krDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwXiclJ9RfpPkO3tnVt0DcDrkP9ooIiW7GPCRIWNtSBNlUKCe5
	dMN5iwwSdqWFvLZP3iPsKOVSfF/Zyj4QFN4tT05tlDaNbHZzsCV4fdv1aDKPaO/SV8T4Efu5ch3
	/bQ6ruM6q9/VfziCoty03ks/NyDx8t+SL3JGozIjPt6oqR6qmUBdwB1y6ymMww+W3Zw==
X-Gm-Gg: ATEYQzw0diqS+JL5nOt2NoRSEu1BeTp6LhJepWwgsol0rFEnEVov2N5O6dxxt/n//Qi
	CYwwVNDLCs658KKI2uXkN60DUdMFu7SjkzBHYYdyN+kw9Lh8Ey6hE9wExa5n0bsZ/N55Dz818mM
	1YAkftBqWxTCjahJvUiz/MxEcEgD0lKx8GnPZ8lCuaLv+XYn0bgFFCKEbkcIWUZOaxPvrFt02jw
	CzoG9WdiaGWl2+nMlosYD1O8YBYMP209bEbKyo2oh5NxE4glhPNR6nYj6IVpIMDDkCBum8TTIa5
	5DhdI3e81RqIKMZQiz9TCsObONOocjhtaL/WX8ZfOJRbT2yJ2QlomrYXbAYoQ0aHGOoiW6I5mUi
	m9s78aKthiPsqH+Jko7nYzreo1sYniQELCHNEV/rqlRc5gBtwrzDbSGo=
X-Received: by 2002:a17:90b:4a8a:b0:35a:329:73c6 with SMTP id 98e67ed59e1d1-35c2ff50d24mr5384533a91.3.1774696921045;
        Sat, 28 Mar 2026 04:22:01 -0700 (PDT)
X-Received: by 2002:a17:90b:4a8a:b0:35a:329:73c6 with SMTP id 98e67ed59e1d1-35c2ff50d24mr5384505a91.3.1774696920519;
        Sat, 28 Mar 2026 04:22:00 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.250.68])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22db1321sm7232716a91.14.2026.03.28.04.21.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Mar 2026 04:22:00 -0700 (PDT)
Message-ID: <a0d39848-eae3-4aba-95e1-9df923e8772f@oss.qualcomm.com>
Date: Sat, 28 Mar 2026 16:51:51 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] media: iris: add platform data for kaanapali
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260313-kaanapali-iris-v3-0-9c0d1a67af4b@oss.qualcomm.com>
 <20260313-kaanapali-iris-v3-7-9c0d1a67af4b@oss.qualcomm.com>
 <5t3bke2sjkxahn4pjhdpyznbrdmu67u7cfgdfwqgjcgo7cbg2e@4wr2jadk6b7i>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <5t3bke2sjkxahn4pjhdpyznbrdmu67u7cfgdfwqgjcgo7cbg2e@4wr2jadk6b7i>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=atu/yCZV c=1 sm=1 tr=0 ts=69c7b9d9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=yLWmkx75ThOYqhw51wEqsw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=lgd4gDGqqKjXK5urUKYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI4MDA4MiBTYWx0ZWRfXzc9vjMD4/ZPz
 AfBjQ3dFijJ+7wQBy0rv3wsgXbjtd/3ZdhJOKNe4IONeBfH9iVKYCGiZKIVpQsBvnkIyGM6Tvls
 yCw7Yw2R4/MQaqvSc4OcNupGBy/3/z7sOTdNIO7cEpUt8VY6PJXOBKC1w018So9LfveJgfTuA2o
 P3UPTRnm0eXXMhYXDgsDcz7RDxK/+HKc6rx9HrWD9XK5VeI8LYMZeDYV8cunwz5+cd7noDlBA2I
 3GUU+/PJ6Khj7iaElO1hXOi2Mfne2IYNbs1VmncCEjqF+f8oMGU6ifnQsBra1S9mRvVB+qvxAqz
 Ip36TbSRuQiOd/yVjdjMt4Ty8M+/JsqW6SF6S3OOTf/nzFriKwolOvKMfIMhmBPxRuWHZX9GXCa
 2ZZGeCtY1tzfLKSGjiMPuw0OZFImpe4GzSplL10sDcS9bQYWw8Th2CviD/Y/7F638lmBP/gUYdP
 TWQ3mHQstBVVTXLJ4Vw==
X-Proofpoint-ORIG-GUID: Plnbh6z3O8HpGh6zcinGcfDlMpxghfCo
X-Proofpoint-GUID: Plnbh6z3O8HpGh6zcinGcfDlMpxghfCo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_02,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603280082
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
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57432-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 79A9134E2A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/13/2026 9:16 PM, Dmitry Baryshkov wrote:
> On Fri, Mar 13, 2026 at 06:49:41PM +0530, Vikash Garodia wrote:
>> Add support for the kaanapali platform by re-using the SM8550
>> definitions and using the vpu4 ops.
>> Move the configurations that differs in a per-SoC platform header, that
>> will contain SoC specific data.
>>
>> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
>>   .../platform/qcom/iris/iris_platform_common.h      |  1 +
>>   .../media/platform/qcom/iris/iris_platform_gen2.c  | 90 ++++++++++++++++++++++
>>   .../platform/qcom/iris/iris_platform_kaanapali.h   | 83 ++++++++++++++++++++
>>   drivers/media/platform/qcom/iris/iris_probe.c      |  4 +
>>   4 files changed, 178 insertions(+)
>>
> 
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_kaanapali.h b/drivers/media/platform/qcom/iris/iris_platform_kaanapali.h
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..bdca1e5bf673353862c1554fb0420f73b3f519cb
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_kaanapali.h
>> @@ -0,0 +1,83 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#ifndef __IRIS_PLATFORM_KAANAPALI_H__
>> +#define __IRIS_PLATFORM_KAANAPALI_H__
>> +
>> +#include <dt-bindings/media/qcom,kaanapali-iris.h>
> 
> So, you are including the bindings here, from the header, which gets
> included from the C source file including headers for all the platforms.
> What if Kaanapali+1 (or +3) defines different sets of regions?
> 

thats correct, to handle this, the soc platform data can be defined in 
iris_platform_kaanapali.c, and iris_platform_kaanapali.h can extern the 
platform data struct which gets included in gen2.c.
Also would have preferred naming the binding abi header 
"qcom,kaanapali-iris.h" to something generic so that it can be included 
in other platforms, but it seems like the maintainer does not like that 
idea.

>> +
>> +#define VIDEO_REGION_VM0_SECURE_NP_ID		1
>> +#define VIDEO_REGION_VM0_NONSECURE_NP_ID	5
>> +
>> +static const char *const kaanapali_clk_reset_table[] = {
>> +	"bus0",
>> +	"bus1",
>> +	"core",
>> +	"vcodec0_core",
>> +};
>> +
>> +static const char *const kaanapali_pmdomain_table[] = {
>> +	"venus",
>> +	"vcodec0",
>> +	"vpp0",
>> +	"vpp1",
>> +	"apv",
>> +};
>> +
>> +static const struct platform_clk_data kaanapali_clk_table[] = {
>> +	{ IRIS_AXI_CLK, "iface" },
>> +	{ IRIS_CTRL_CLK, "core" },
>> +	{ IRIS_HW_CLK, "vcodec0_core" },
>> +	{ IRIS_AXI1_CLK, "iface1" },
>> +	{ IRIS_CTRL_FREERUN_CLK, "core_freerun" },
>> +	{ IRIS_HW_FREERUN_CLK, "vcodec0_core_freerun" },
>> +	{ IRIS_BSE_HW_CLK, "vcodec_bse" },
>> +	{ IRIS_VPP0_HW_CLK, "vcodec_vpp0" },
>> +	{ IRIS_VPP1_HW_CLK, "vcodec_vpp1" },
>> +	{ IRIS_APV_HW_CLK, "vcodec_apv" },
>> +};
>> +
>> +static const char *const kaanapali_opp_clk_table[] = {
>> +	"vcodec0_core",
>> +	"vcodec_apv",
>> +	"vcodec_bse",
>> +	"core",
>> +	NULL,
>> +};
>> +
>> +static struct tz_cp_config tz_cp_config_kaanapali[] = {
>> +	{
>> +		.cp_start = VIDEO_REGION_VM0_SECURE_NP_ID,
>> +		.cp_size = 0,
>> +		.cp_nonpixel_start = 0x01000000,
>> +		.cp_nonpixel_size = 0x24800000,
>> +	},
>> +	{
>> +		.cp_start = VIDEO_REGION_VM0_NONSECURE_NP_ID,
>> +		.cp_size = 0,
>> +		.cp_nonpixel_start = 0x25800000,
>> +		.cp_nonpixel_size = 0xda400000,
>> +	},
>> +};
>> +
>> +static struct iris_context_bank kaanapali_cb_data[] = {
>> +	{
>> +		.name = "iris_bitstream",
>> +		.f_id = IRIS_BITSTREAM,
>> +		.region_mask = BIT(IRIS_BITSTREAM_REGION),
> 
> I'd say, it's really easy to mix IRIS_BITSTREAM and
> IRIS_BITSTREAM_REGION when looking at the code, which might be bad
> because they are not equal.

this logic have changed now given that the handling is now 1:1, rather 
than multi map case. Maybe..we can revisit this in v4.

Regards,
Vikash

> 
>> +	},
>> +	{
>> +		.name = "iris_non_pixel",
>> +		.f_id = IRIS_NON_PIXEL,
>> +		.region_mask = BIT(IRIS_NON_PIXEL_REGION),
>> +	},
>> +	{
>> +		.name = "iris_pixel",
>> +		.f_id = IRIS_PIXEL,
>> +		.region_mask = BIT(IRIS_PIXEL_REGION),
>> +	},
>> +};
>> +
>> +#endif /* __IRIS_PLATFORM_KAANAPALI_H__ */
>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
>> index 439e6e0fe8adf8287f81d26257ef2a7e9f21e53d..f6d8761daf0471d3aabec21c708445ee7698487b 100644
>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
>> @@ -406,6 +406,10 @@ static const struct dev_pm_ops iris_pm_ops = {
>>   };
>>   
>>   static const struct of_device_id iris_dt_match[] = {
>> +	{
>> +		.compatible = "qcom,kaanapali-iris",
>> +		.data = &kaanapali_data,
>> +	},
>>   	{
>>   		.compatible = "qcom,qcs8300-iris",
>>   		.data = &qcs8300_data,
>>
>> -- 
>> 2.34.1
>>
> 


