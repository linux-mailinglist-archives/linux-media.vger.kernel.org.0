Return-Path: <linux-media+bounces-61004-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOQgEMlo/2nQ6AAAu9opvQ
	(envelope-from <linux-media+bounces-61004-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 09 May 2026 19:03:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4395009BF
	for <lists+linux-media@lfdr.de>; Sat, 09 May 2026 19:03:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E4DF23014657
	for <lists+linux-media@lfdr.de>; Sat,  9 May 2026 17:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 094223BBA04;
	Sat,  9 May 2026 17:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d9T1/UQV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LMKWMujK"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6D13BB9FA
	for <linux-media@vger.kernel.org>; Sat,  9 May 2026 17:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778346162; cv=none; b=CZ9WP7oSISxmupRd5boBrDusA76gmYHURdQDxu5q3vSh1aVl4iFqe8hLi6CUNh/foqEuXdJYYcZBxRdG63fp8D1uLUYRj3pYe3EF0NcW+Igukmx24ZooOlz1rbz1vGdElORJTVdN+vglTsYy0nuLg4a7dJ0fhPjaRzIM62oFITY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778346162; c=relaxed/simple;
	bh=H7SbIXY+1+R0pJqTQxnBbHB7flIW0LRP0IZiEHjKHtE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=GrWM199g2Iaw9arfWtv7PvR0XIt8tr7uqqI7XTyGC5+aZwP3oXUrKl9R7cJVf3Fuw/hkdXqh91Xli+kMvhcd7+f74qV8o9Cx7mUU5uJMwRiOWZCxNO49QHzckzAEz3pLK0HR2kpcVQyu0/xBwP3sfniGKWcCV/UZxIocH/4+VXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d9T1/UQV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LMKWMujK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64928h8j3600440
	for <linux-media@vger.kernel.org>; Sat, 9 May 2026 17:02:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IH3/2ORAYau8uWMETXVpjJ1gCYlVYf6ydQds6fFY2wc=; b=d9T1/UQVWi6GRvSW
	TU5UbeRvcoMIAYsNpp9HTv7Q3Ye1YypMcWPoRSVsNRIiJAMlyJSWRCx1hsBuVehZ
	h1yBri2raE8n4kyj3XPRFkAvvDT8otsXEAG5JAfRWdX8s1PYttjWzt1IZJUW+oTY
	FVF71OTQSxX/C4oGPY7/SCnNMDKGFWAudXTy4VOpCPCUXsIR9mRJ/kt7Bfv0rT6U
	3cbN/YjdFvmh8LfGdjCyekocfQKQaXJFr08L518nUA2XQpbonTmqnqJcudnl9ykL
	AsZO+UooxZDntMlFBz3lUEetyHEQqNaqFqhLtdOhAKys9KX5RSHUFbHNnhibqYGS
	ZIJgVg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1uvshhma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 09 May 2026 17:02:39 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c70f19f0f37so1725679a12.0
        for <linux-media@vger.kernel.org>; Sat, 09 May 2026 10:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778346158; x=1778950958; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IH3/2ORAYau8uWMETXVpjJ1gCYlVYf6ydQds6fFY2wc=;
        b=LMKWMujKQy9iqdIXH6OWZ64EAnHgBX6IeRBCW9SVKIwVvMv8EysYCxSzBKgGvv4mvk
         GUqGlR2QIg3mof5l7OkbtjFsf7jbvFzhxAtqCndu4j/Ngx+2pAMs1p1YoHUyg/g7kNdR
         bMO7bOT3q6KC/qUguBw1jIAXxp+3bwcS8oG+YcJHMvpu+uBAXkeQSZ6WIPBkavtkYwdR
         lXLJWWLla1IXLqXBwN5C5uMrlSq1PJmCJfhOVug0zl06ZZWFk9XTtC05ckPz5dMmwsKa
         fpHb/m1NLj2XILJJc0KmXBmTvTC4U6vSgsQwFVCFc0Ny6tuhZVcPb/1ZHITMTnkxTIzu
         5YbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778346158; x=1778950958;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IH3/2ORAYau8uWMETXVpjJ1gCYlVYf6ydQds6fFY2wc=;
        b=HLiY2umJbmgBWh3KYVQeUXcIjWpKLvreCcAoHjwGvXUJYoKLInqTe1JmBayOZmgrPy
         Z78ZHN7XAIPTENcRZ5l8CYSRGatYk9oiQtYB6foXRsSOIZp7RKoUcbV/avRjjHzEJTFP
         3KQc4RCCLnbxA2xOKv9syiyn4D4HwCKNV/NrTlP/1wTMYzkr7BnBoVFIZE8ryXk0Gcb2
         mToVDQwm6PKJcGC6d5Mjx3fB9DC0IZlXv5Rsi/YZoAjSfaa72v/cF8n3juY3PymZMKgc
         5Vuw8K7q0qBP/CMgAhsxQp9xR1mR4dBatrMt4PK9IluX0iv4hU62IMoDcrhGxz6ZBJaV
         DYlQ==
X-Forwarded-Encrypted: i=1; AFNElJ+hRWRABbWxJD6v0zu7W0Cv/CjocyTrcmLTxQGlMGjzz1o6rcFRxoJS+HPUwN9KIx91LeRGHR7RwTjgfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSsU9GtQu+JbXJWAU35V2ZEzAlK1s24hsGmXveq9K7Ut95Yf2J
	rosC0M8QmuIN3A9uREs3bxAb4R1ZOFT7KHPtPirxC20vXWjWoZEgbYJp5ip+nJpDHY6RGeDdC66
	Wmvv1DbsVjVgllac1F8QQ9frb5baS5H2KYPHcJeCWvHkK4jKwoHFxJf22YsaBdf1qNA==
X-Gm-Gg: Acq92OGtcOqKw67boSplYJV/UQXEbE5VC6+i1GofW2lDlk0ONvx13SAqi6Kf6X9sSZP
	sTs9oLBJCrjbrXAN4Zg7i6vR/gKYyqYwed7WQ2o6D1rT3ny9P9i7LK7ZD5OCIsXDSpHQG7Tqa9a
	RtMTYzKmIKumXKpY8U2TKg28Sk0mugRGGxtZ+vETxlYWKW/bwBhutL88P2PN26M5vyHI2RzwX03
	P9l2Y6wz/VRd+QIsbcqmCKaaHPg5VUurNRqip9vuiX/lCRiGjMGl/tRFPfxDZ8IgRG4jTvaA4S/
	J947sv4+Vro4CP2GO4gIJDnL5JCsXirWWlf2F1WusMYSX7VGxTqBhj+FPbL6xvrgMZ9cqaBaStq
	WNGOTA7j2BatKx4+zqxlivY2lhsVjVP0XEYjcMk3VEuDMyqgSQE0=
X-Received: by 2002:a17:902:cf43:b0:2b4:5bf8:a7e1 with SMTP id d9443c01a7336-2babc85ef7amr108364185ad.6.1778346158126;
        Sat, 09 May 2026 10:02:38 -0700 (PDT)
X-Received: by 2002:a17:902:cf43:b0:2b4:5bf8:a7e1 with SMTP id d9443c01a7336-2babc85ef7amr108363655ad.6.1778346157422;
        Sat, 09 May 2026 10:02:37 -0700 (PDT)
Received: from [192.168.0.9] ([49.205.255.40])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d40677sm56288265ad.33.2026.05.09.10.02.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 May 2026 10:02:36 -0700 (PDT)
Message-ID: <201bfaca-b462-ec34-da00-9bac5804a808@oss.qualcomm.com>
Date: Sat, 9 May 2026 22:32:24 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v5 09/14] media: iris: Use power domain type to look up
 pd_devs index
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
 <20260509-glymur-v5-9-7fbb340c5dbd@oss.qualcomm.com>
 <pkd26h6alzddoky4bfnc3ljwlgxoodcyjo6blreuourlkg7mdl@qkg2jtdcjh7m>
Content-Language: en-US
In-Reply-To: <pkd26h6alzddoky4bfnc3ljwlgxoodcyjo6blreuourlkg7mdl@qkg2jtdcjh7m>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA5MDE4NSBTYWx0ZWRfX6uw0JDm3lK7S
 KfaS79imt6kpxg9ou/geaqFsJHtW9c9gNwgQ7SBSqV63g2uYg6FfcGlq8TrVQIRijf7yVL1HWUN
 eHPBcQN9bFZWG6/qcyk2NGUw25lX+B28x3nTsGUO9Fu/I9LTbYGizlCMs8Yf4e34fUJZ9c6wdg6
 80h7MRZESO6CRiw5XY0T/6jFfMLQTKmxyMt/EQ3nzxJXwXYg4ULvRycYPPHo0gzK7icL/vSNWj1
 n6N5LFr5i7mZjvtHFCvhJcSuWFGdSBNPiWQ82ZP5Rc6kfwu17JCn5Pkz0x4RmT+k5SOnv1q9Ia1
 c0cdZ7YL4859DGbDw2wVP97u/CunyftaaXLwjKoAs1Xooizgt+LFKnqrTTTB7roNEhiUJoh2ede
 eC77MhrRJeBikRew6B1VPuhbPjo7s5oBqRB4P3qKQ3FVy0xAdey3bIdqSQx+Jyxua+bc/fovzn9
 tpUK8Ke30D9Qn1uhntw==
X-Authority-Analysis: v=2.4 cv=dujrzVg4 c=1 sm=1 tr=0 ts=69ff68af cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=SpcZ+gRb+6o1zy8jT5J+bQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=siKIllzpvWrrnXSPHwYA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: AKxWWtlTDRkF4EuJAB9c9Fhsi2nSPjeV
X-Proofpoint-GUID: AKxWWtlTDRkF4EuJAB9c9Fhsi2nSPjeV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-09_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605090185
X-Rspamd-Queue-Id: 9B4395009BF
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
	TAGGED_FROM(0.00)[bounces-61004-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
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


On 5/9/2026 2:14 AM, Dmitry Baryshkov wrote:
> On Sat, May 09, 2026 at 12:29:58AM +0530, Vishnu Reddy wrote:
>> The pmdomain_tbl was a array of strings holding only the power domain
>> names. Callers had to pass a pd_devs[] pointer indexed directly by the
>> platform_pm_domain_type enum value to iris_enable_power_domains() and
>> iris_disable_power_domains().
>>
>> A future platform may need to introduce a new enum value that aliases
>> an existing one (e.g. IRIS_VCODEC1_POWER_DOMAIN aliasing the
>> IRIS_VPP0_HW_POWER_DOMAIN on Glymur), which would break the assumption
> Why do they alias so? Or what do you mean by aliasing? Why VCODEC1 is
> the same as VPP0? Do you mean that the index in DT would match?

VPP0 index in kaanapali and the VCODEC1 index in glymur are same.

>> that enum values map 1:1 to pd_devs[] indices.
>>
>> To fix this, replace the string array with a new struct platform_pd_data
>> that pairs each power domain name with its platform_pm_domain_type. Add
>> a helper iris_get_pd_index_by_type() that walks this table and returns
>> the correct pd_devs[] index for a given type.
> This looks like leaking too many platform details into the
> not-so-generic code.
>
>> Update iris_enable_power_domains() and iris_disable_power_domains()
>> to accept a platform_pm_domain_type instead of a struct device pointer.
>> They now call the helper internally to resolve the index, removing the
>> need for callers to do the index lookup themselves.
>>
>> This prepares the driver for adding new platforms where power domain enum
>> values cannot be used directly as pd_devs[] indices.
>>
>> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>>  .../platform/qcom/iris/iris_platform_common.h      |  9 +++-
>>  .../media/platform/qcom/iris/iris_platform_gen1.c  | 18 +++++---
>>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 24 ++++++----
>>  drivers/media/platform/qcom/iris/iris_probe.c      |  4 +-
>>  drivers/media/platform/qcom/iris/iris_resources.c  | 43 +++++++++++++++++-
>>  drivers/media/platform/qcom/iris/iris_resources.h  |  6 ++-
>>  drivers/media/platform/qcom/iris/iris_vpu3x.c      |  7 ++-
>>  drivers/media/platform/qcom/iris/iris_vpu4x.c      | 52 ++++++++--------------
>>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 23 +++++-----
>>  9 files changed, 115 insertions(+), 71 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> index 30e9d4d288c6..7d59e6364e9d 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> @@ -212,6 +212,12 @@ enum platform_pm_domain_type {
>>  	IRIS_APV_HW_POWER_DOMAIN,
>>  };
>>  
>> +struct platform_pd_data {
>> +	enum platform_pm_domain_type *pd_types;
>> +	const char **pd_names;
>> +	u32 pd_count;
>> +};
>> +
>>  struct iris_platform_data {
>>  	void (*init_hfi_command_ops)(struct iris_core *core);
>>  	void (*init_hfi_response_ops)(struct iris_core *core);
>> @@ -225,8 +231,7 @@ struct iris_platform_data {
>>  	unsigned int icc_tbl_size;
>>  	const struct bw_info *bw_tbl_dec;
>>  	unsigned int bw_tbl_dec_size;
>> -	const char * const *pmdomain_tbl;
>> -	unsigned int pmdomain_tbl_size;
>> +	const struct platform_pd_data *pmdomain_tbl;
>>  	const char * const *opp_pd_tbl;
>>  	unsigned int opp_pd_tbl_size;
>>  	const struct platform_clk_data *clk_tbl;
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
>> index be6a631f8ede..0ec73783bc10 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
>> @@ -279,7 +279,17 @@ static const struct bw_info sm8250_bw_table_dec[] = {
>>  	{ ((1920 * 1080) / 256) * 30,  416000 },
>>  };
>>  
>> -static const char * const sm8250_pmdomain_table[] = { "venus", "vcodec0" };
>> +static const struct platform_pd_data sm8250_pmdomain_table = {
>> +	.pd_types = (enum platform_pm_domain_type []) {
>> +		IRIS_CTRL_POWER_DOMAIN,
>> +		IRIS_VCODEC_POWER_DOMAIN,
>> +	},
>> +	.pd_names = (const char *[]) {
>> +		"venus",
>> +		"vcodec0",
>> +	},
>> +	.pd_count = 2,
>> +};
>>  
>>  static const char * const sm8250_opp_pd_table[] = { "mx" };
>>  
>> @@ -350,8 +360,7 @@ const struct iris_platform_data sm8250_data = {
>>  	.clk_rst_tbl_size = ARRAY_SIZE(sm8250_clk_reset_table),
>>  	.bw_tbl_dec = sm8250_bw_table_dec,
>>  	.bw_tbl_dec_size = ARRAY_SIZE(sm8250_bw_table_dec),
>> -	.pmdomain_tbl = sm8250_pmdomain_table,
>> -	.pmdomain_tbl_size = ARRAY_SIZE(sm8250_pmdomain_table),
>> +	.pmdomain_tbl = &sm8250_pmdomain_table,
>>  	.opp_pd_tbl = sm8250_opp_pd_table,
>>  	.opp_pd_tbl_size = ARRAY_SIZE(sm8250_opp_pd_table),
>>  	.clk_tbl = sm8250_clk_table,
>> @@ -403,8 +412,7 @@ const struct iris_platform_data sc7280_data = {
>>  	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
>>  	.bw_tbl_dec = sc7280_bw_table_dec,
>>  	.bw_tbl_dec_size = ARRAY_SIZE(sc7280_bw_table_dec),
>> -	.pmdomain_tbl = sm8250_pmdomain_table,
>> -	.pmdomain_tbl_size = ARRAY_SIZE(sm8250_pmdomain_table),
>> +	.pmdomain_tbl = &sm8250_pmdomain_table,
>>  	.opp_pd_tbl = sc7280_opp_pd_table,
>>  	.opp_pd_tbl_size = ARRAY_SIZE(sc7280_opp_pd_table),
>>  	.clk_tbl = sc7280_clk_table,
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> index 47c6b650f0b4..5862c89a4971 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> @@ -775,7 +775,17 @@ static const struct bw_info sm8550_bw_table_dec[] = {
>>  	{ ((1920 * 1080) / 256) * 30,  294000 },
>>  };
>>  
>> -static const char * const sm8550_pmdomain_table[] = { "venus", "vcodec0" };
>> +static const struct platform_pd_data sm8550_pmdomain_table = {
>> +	.pd_types = (enum platform_pm_domain_type []) {
>> +		IRIS_CTRL_POWER_DOMAIN,
>> +		IRIS_VCODEC_POWER_DOMAIN,
>> +	},
>> +	.pd_names = (const char *[]) {
>> +		"venus",
>> +		"vcodec0",
>> +	},
>> +	.pd_count = 2,
>> +};
>>  
>>  static const char * const sm8550_opp_pd_table[] = { "mxc", "mmcx" };
>>  
>> @@ -934,8 +944,7 @@ const struct iris_platform_data sm8550_data = {
>>  	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
>>  	.bw_tbl_dec = sm8550_bw_table_dec,
>>  	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
>> -	.pmdomain_tbl = sm8550_pmdomain_table,
>> -	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
>> +	.pmdomain_tbl = &sm8550_pmdomain_table,
>>  	.opp_pd_tbl = sm8550_opp_pd_table,
>>  	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
>>  	.clk_tbl = sm8550_clk_table,
>> @@ -1039,8 +1048,7 @@ const struct iris_platform_data sm8650_data = {
>>  	.controller_rst_tbl_size = ARRAY_SIZE(sm8650_controller_reset_table),
>>  	.bw_tbl_dec = sm8550_bw_table_dec,
>>  	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
>> -	.pmdomain_tbl = sm8550_pmdomain_table,
>> -	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
>> +	.pmdomain_tbl = &sm8550_pmdomain_table,
>>  	.opp_pd_tbl = sm8550_opp_pd_table,
>>  	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
>>  	.clk_tbl = sm8550_clk_table,
>> @@ -1135,8 +1143,7 @@ const struct iris_platform_data sm8750_data = {
>>  	.clk_rst_tbl_size = ARRAY_SIZE(sm8750_clk_reset_table),
>>  	.bw_tbl_dec = sm8550_bw_table_dec,
>>  	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
>> -	.pmdomain_tbl = sm8550_pmdomain_table,
>> -	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
>> +	.pmdomain_tbl = &sm8550_pmdomain_table,
>>  	.opp_pd_tbl = sm8550_opp_pd_table,
>>  	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
>>  	.clk_tbl = sm8750_clk_table,
>> @@ -1235,8 +1242,7 @@ const struct iris_platform_data qcs8300_data = {
>>  	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
>>  	.bw_tbl_dec = sm8550_bw_table_dec,
>>  	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
>> -	.pmdomain_tbl = sm8550_pmdomain_table,
>> -	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
>> +	.pmdomain_tbl = &sm8550_pmdomain_table,
>>  	.opp_pd_tbl = sm8550_opp_pd_table,
>>  	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
>>  	.clk_tbl = sm8550_clk_table,
>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
>> index 34751912f871..34c981be9bc1 100644
>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
>> @@ -43,8 +43,8 @@ static int iris_init_power_domains(struct iris_core *core)
>>  	int ret;
>>  
>>  	struct dev_pm_domain_attach_data iris_pd_data = {
>> -		.pd_names = core->iris_platform_data->pmdomain_tbl,
>> -		.num_pd_names = core->iris_platform_data->pmdomain_tbl_size,
>> +		.pd_names = core->iris_platform_data->pmdomain_tbl->pd_names,
>> +		.num_pd_names = core->iris_platform_data->pmdomain_tbl->pd_count,
>>  		.pd_flags = PD_FLAG_NO_DEV_LINK,
>>  	};
>>  
>> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
>> index 773f6548370a..cc61dc038598 100644
>> --- a/drivers/media/platform/qcom/iris/iris_resources.c
>> +++ b/drivers/media/platform/qcom/iris/iris_resources.c
>> @@ -70,10 +70,42 @@ int iris_opp_set_rate(struct device *dev, unsigned long freq)
>>  	return dev_pm_opp_set_opp(dev, opp);
>>  }
>>  
>> -int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev)
>> +static int iris_get_pd_index_by_type(struct iris_core *core, enum platform_pm_domain_type pd_type)
>>  {
>> +	const struct platform_pd_data *pd_tbl;
>> +	u32 i;
>> +
>> +	pd_tbl = core->iris_platform_data->pmdomain_tbl;
>> +
>> +	for (i = 0; i < pd_tbl->pd_count; i++) {
>> +		if (pd_tbl->pd_types[i] == pd_type)
>> +			return i;
>> +	}
>> +
>> +	return -EINVAL;
>> +}
>> +
>> +int iris_genpd_set_hwmode(struct iris_core *core, enum platform_pm_domain_type pd_type, bool hwmode)
>> +{
>> +	int pd_index = iris_get_pd_index_by_type(core, pd_type);
>> +
>> +	if (pd_index < 0)
>> +		return pd_index;
>> +
>> +	return dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[pd_index], hwmode);
>> +}
>> +
>> +int iris_enable_power_domains(struct iris_core *core, enum platform_pm_domain_type pd_type)
>> +{
>> +	int pd_index = iris_get_pd_index_by_type(core, pd_type);
>> +	struct device *pd_dev;
>>  	int ret;
>>  
>> +	if (pd_index < 0)
>> +		return pd_index;
>> +
>> +	pd_dev = core->pmdomain_tbl->pd_devs[pd_index];
>> +
> As you are touching this code... It looks like the original intent of
> this function was to enable all power domains in a single run (thus it
> has the iris_opp_set_rate() call. Now we are are calling this function
> multiple times and still setting the clock rate to the max all the
> times. Please break it down, so that we bump the OPP performance point
> only once, before the first bump of the power domains. Another option
> would be to restore the behaviour and enable all domains at once.

The dev_pm_opp_set_opp() returns early if the requested rate matches the
previous set rate, so it does not call rpmhpd level set or trigger a clock update.
So, calling it multiple times with the same frequency is not expensive.

>>  	ret = iris_opp_set_rate(core->dev, ULONG_MAX);
>>  	if (ret)
>>  		return ret;
>> @@ -85,10 +117,17 @@ int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev)
>>  	return ret;
>>  }
>>  
>> -int iris_disable_power_domains(struct iris_core *core, struct device *pd_dev)
>> +int iris_disable_power_domains(struct iris_core *core, enum platform_pm_domain_type pd_type)
> The same here.
>
>>  {
>> +	int pd_index = iris_get_pd_index_by_type(core, pd_type);
>> +	struct device *pd_dev;
>>  	int ret;
>>  
>> +	if (pd_index < 0)
>> +		return pd_index;
>> +
>> +	pd_dev = core->pmdomain_tbl->pd_devs[pd_index];
>> +
>>  	ret = iris_opp_set_rate(core->dev, 0);
>>  	if (ret)
>>  		return ret;
>> diff --git a/drivers/media/platform/qcom/iris/iris_resources.h b/drivers/media/platform/qcom/iris/iris_resources.h
>> index 6bfbd2dc6db0..d5692e4694b1 100644
>> --- a/drivers/media/platform/qcom/iris/iris_resources.h
>> +++ b/drivers/media/platform/qcom/iris/iris_resources.h
>> @@ -9,11 +9,13 @@
>>  struct iris_core;
>>  
>>  int iris_opp_set_rate(struct device *dev, unsigned long freq);
>> -int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev);
>> -int iris_disable_power_domains(struct iris_core *core, struct device *pd_dev);
>> +int iris_enable_power_domains(struct iris_core *core, enum platform_pm_domain_type pd_type);
>> +int iris_disable_power_domains(struct iris_core *core, enum platform_pm_domain_type pd_type);
>>  int iris_unset_icc_bw(struct iris_core *core);
>>  int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw);
>>  int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type clk_type);
>>  int iris_prepare_enable_clock(struct iris_core *core, enum platform_clk_type clk_type);
>> +int iris_genpd_set_hwmode(struct iris_core *core, enum platform_pm_domain_type pd_type,
>> +			  bool hwmode);
>>  
>>  #endif
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> index 834194cb5513..13fbb21c2182 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> @@ -208,7 +208,7 @@ static int iris_vpu33_power_off_controller(struct iris_core *core)
>>  	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
>>  
>>  disable_power:
>> -	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
>> +	iris_disable_power_domains(core, IRIS_CTRL_POWER_DOMAIN);
>>  	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
>>  
>>  	return 0;
>> @@ -218,8 +218,7 @@ static int iris_vpu35_power_on_hw(struct iris_core *core)
>>  {
>>  	int ret;
>>  
>> -	ret = iris_enable_power_domains(core,
>> -					core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
>> +	ret = iris_enable_power_domains(core, IRIS_VCODEC_POWER_DOMAIN);
>>  	if (ret)
>>  		return ret;
>>  
>> @@ -242,7 +241,7 @@ static int iris_vpu35_power_on_hw(struct iris_core *core)
>>  err_disable_axi_clk:
>>  	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
>>  err_disable_power:
>> -	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
>> +	iris_disable_power_domains(core, IRIS_VCODEC_POWER_DOMAIN);
>>  
>>  	return ret;
>>  }
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/media/platform/qcom/iris/iris_vpu4x.c
>> index 92c0b06bbbff..bf7ad4e7cb8a 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
>> @@ -27,28 +27,24 @@ static int iris_vpu4x_genpd_set_hwmode(struct iris_core *core, bool hw_mode, u32
>>  {
>>  	int ret;
>>  
>> -	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN],
>> -				      hw_mode);
>> +	ret = iris_genpd_set_hwmode(core, IRIS_VCODEC_POWER_DOMAIN, hw_mode);
>>  	if (ret)
>>  		return ret;
>>  
>>  	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT)) {
>> -		ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs
>> -					      [IRIS_VPP0_HW_POWER_DOMAIN], hw_mode);
>> +		ret = iris_genpd_set_hwmode(core, IRIS_VPP0_HW_POWER_DOMAIN, hw_mode);
>>  		if (ret)
>>  			goto restore_hw_domain_mode;
>>  	}
>>  
>>  	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT)) {
>> -		ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs
>> -					      [IRIS_VPP1_HW_POWER_DOMAIN], hw_mode);
>> +		ret = iris_genpd_set_hwmode(core, IRIS_VPP1_HW_POWER_DOMAIN, hw_mode);
>>  		if (ret)
>>  			goto restore_vpp0_domain_mode;
>>  	}
>>  
>>  	if (!(efuse_value & DISABLE_VIDEO_APV_BIT)) {
>> -		ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs
>> -					      [IRIS_APV_HW_POWER_DOMAIN], hw_mode);
>> +		ret = iris_genpd_set_hwmode(core, IRIS_APV_HW_POWER_DOMAIN, hw_mode);
>>  		if (ret)
>>  			goto restore_vpp1_domain_mode;
>>  	}
>> @@ -57,14 +53,12 @@ static int iris_vpu4x_genpd_set_hwmode(struct iris_core *core, bool hw_mode, u32
>>  
>>  restore_vpp1_domain_mode:
>>  	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT))
>> -		dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VPP1_HW_POWER_DOMAIN],
>> -					!hw_mode);
>> +		iris_genpd_set_hwmode(core, IRIS_VPP1_HW_POWER_DOMAIN, !hw_mode);
>>  restore_vpp0_domain_mode:
>>  	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT))
>> -		dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VPP0_HW_POWER_DOMAIN],
>> -					!hw_mode);
>> +		iris_genpd_set_hwmode(core, IRIS_VPP0_HW_POWER_DOMAIN, !hw_mode);
>>  restore_hw_domain_mode:
>> -	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN], !hw_mode);
>> +	iris_genpd_set_hwmode(core, IRIS_VCODEC_POWER_DOMAIN, !hw_mode);
>>  
>>  	return ret;
>>  }
>> @@ -73,8 +67,7 @@ static int iris_vpu4x_power_on_apv(struct iris_core *core)
>>  {
>>  	int ret;
>>  
>> -	ret = iris_enable_power_domains(core,
>> -					core->pmdomain_tbl->pd_devs[IRIS_APV_HW_POWER_DOMAIN]);
>> +	ret = iris_enable_power_domains(core, IRIS_APV_HW_POWER_DOMAIN);
>>  	if (ret)
>>  		return ret;
>>  
>> @@ -85,7 +78,7 @@ static int iris_vpu4x_power_on_apv(struct iris_core *core)
>>  	return 0;
>>  
>>  disable_apv_hw_power_domain:
>> -	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_APV_HW_POWER_DOMAIN]);
>> +	iris_disable_power_domains(core, IRIS_APV_HW_POWER_DOMAIN);
>>  
>>  	return ret;
>>  }
>> @@ -140,7 +133,7 @@ static void iris_vpu4x_power_off_apv(struct iris_core *core)
>>  
>>  disable_clocks_and_power:
>>  	iris_disable_unprepare_clock(core, IRIS_APV_HW_CLK);
>> -	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_APV_HW_POWER_DOMAIN]);
>> +	iris_disable_power_domains(core, IRIS_APV_HW_POWER_DOMAIN);
>>  }
>>  
>>  static void iris_vpu4x_ahb_sync_reset_apv(struct iris_core *core)
>> @@ -227,21 +220,18 @@ static int iris_vpu4x_power_on_hardware(struct iris_core *core)
>>  	u32 efuse_value = readl(core->reg_base + WRAPPER_EFUSE_MONITOR);
>>  	int ret;
>>  
>> -	ret = iris_enable_power_domains(core,
>> -					core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
>> +	ret = iris_enable_power_domains(core, IRIS_VCODEC_POWER_DOMAIN);
>>  	if (ret)
>>  		return ret;
>>  
>>  	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT)) {
>> -		ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs
>> -						[IRIS_VPP0_HW_POWER_DOMAIN]);
>> +		ret = iris_enable_power_domains(core, IRIS_VPP0_HW_POWER_DOMAIN);
>>  		if (ret)
>>  			goto disable_hw_power_domain;
>>  	}
>>  
>>  	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT)) {
>> -		ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs
>> -						[IRIS_VPP1_HW_POWER_DOMAIN]);
>> +		ret = iris_enable_power_domains(core, IRIS_VPP1_HW_POWER_DOMAIN);
>>  		if (ret)
>>  			goto disable_vpp0_power_domain;
>>  	}
>> @@ -262,14 +252,12 @@ static int iris_vpu4x_power_on_hardware(struct iris_core *core)
>>  	iris_vpu4x_disable_hardware_clocks(core, efuse_value);
>>  disable_vpp1_power_domain:
>>  	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT))
>> -		iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs
>> -						[IRIS_VPP1_HW_POWER_DOMAIN]);
>> +		iris_disable_power_domains(core, IRIS_VPP1_HW_POWER_DOMAIN);
>>  disable_vpp0_power_domain:
>>  	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT))
>> -		iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs
>> -						[IRIS_VPP0_HW_POWER_DOMAIN]);
>> +		iris_disable_power_domains(core, IRIS_VPP0_HW_POWER_DOMAIN);
>>  disable_hw_power_domain:
>> -	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
>> +	iris_disable_power_domains(core, IRIS_VCODEC_POWER_DOMAIN);
>>  
>>  	return ret;
>>  }
>> @@ -340,14 +328,12 @@ static void iris_vpu4x_power_off_hardware(struct iris_core *core)
>>  	iris_vpu4x_disable_hardware_clocks(core, efuse_value);
>>  
>>  	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT))
>> -		iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs
>> -					   [IRIS_VPP1_HW_POWER_DOMAIN]);
>> +		iris_disable_power_domains(core, IRIS_VPP1_HW_POWER_DOMAIN);
>>  
>>  	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT))
>> -		iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs
>> -					   [IRIS_VPP0_HW_POWER_DOMAIN]);
>> +		iris_disable_power_domains(core, IRIS_VPP0_HW_POWER_DOMAIN);
>>  
>> -	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
>> +	iris_disable_power_domains(core, IRIS_VCODEC_POWER_DOMAIN);
>>  }
>>  
>>  static int iris_vpu4x_set_hwmode(struct iris_core *core)
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
>> index 73c094bc4311..2593c04decb0 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
>> @@ -214,15 +214,15 @@ int iris_vpu_power_off_controller(struct iris_core *core)
>>  	iris_disable_unprepare_clock(core, IRIS_AHB_CLK);
>>  	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
>>  	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
>> -	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
>> +	iris_disable_power_domains(core, IRIS_CTRL_POWER_DOMAIN);
>>  
>>  	return 0;
>>  }
>>  
>>  void iris_vpu_power_off_hw(struct iris_core *core)
>>  {
>> -	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN], false);
>> -	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
>> +	iris_genpd_set_hwmode(core, IRIS_VCODEC_POWER_DOMAIN, false);
>> +	iris_disable_power_domains(core, IRIS_VCODEC_POWER_DOMAIN);
>>  	iris_disable_unprepare_clock(core, IRIS_VCODEC_AHB_CLK);
>>  	iris_disable_unprepare_clock(core, IRIS_VCODEC_CLK);
>>  }
>> @@ -243,7 +243,7 @@ int iris_vpu_power_on_controller(struct iris_core *core)
>>  	u32 rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
>>  	int ret;
>>  
>> -	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
>> +	ret = iris_enable_power_domains(core, IRIS_CTRL_POWER_DOMAIN);
>>  	if (ret)
>>  		return ret;
>>  
>> @@ -270,7 +270,7 @@ int iris_vpu_power_on_controller(struct iris_core *core)
>>  err_disable_axi_clock:
>>  	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
>>  err_disable_power:
>> -	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
>> +	iris_disable_power_domains(core, IRIS_CTRL_POWER_DOMAIN);
>>  
>>  	return ret;
>>  }
>> @@ -279,8 +279,7 @@ int iris_vpu_power_on_hw(struct iris_core *core)
>>  {
>>  	int ret;
>>  
>> -	ret = iris_enable_power_domains(core,
>> -					core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
>> +	ret = iris_enable_power_domains(core, IRIS_VCODEC_POWER_DOMAIN);
>>  	if (ret)
>>  		return ret;
>>  
>> @@ -297,14 +296,14 @@ int iris_vpu_power_on_hw(struct iris_core *core)
>>  err_disable_hw_clock:
>>  	iris_disable_unprepare_clock(core, IRIS_VCODEC_CLK);
>>  err_disable_power:
>> -	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
>> +	iris_disable_power_domains(core, IRIS_VCODEC_POWER_DOMAIN);
>>  
>>  	return ret;
>>  }
>>  
>>  int iris_vpu_set_hwmode(struct iris_core *core)
>>  {
>> -	return dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN], true);
>> +	return iris_genpd_set_hwmode(core, IRIS_VCODEC_POWER_DOMAIN, true);
>>  }
>>  
>>  int iris_vpu_switch_to_hwmode(struct iris_core *core)
>> @@ -369,7 +368,7 @@ int iris_vpu35_vpu4x_power_off_controller(struct iris_core *core)
>>  	iris_disable_unprepare_clock(core, IRIS_CTRL_FREERUN_CLK);
>>  	iris_disable_unprepare_clock(core, IRIS_AXI_CTRL_CLK);
>>  
>> -	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
>> +	iris_disable_power_domains(core, IRIS_CTRL_POWER_DOMAIN);
>>  
>>  	reset_control_bulk_reset(clk_rst_tbl_size, core->resets);
>>  
>> @@ -380,7 +379,7 @@ int iris_vpu35_vpu4x_power_on_controller(struct iris_core *core)
>>  {
>>  	int ret;
>>  
>> -	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
>> +	ret = iris_enable_power_domains(core, IRIS_CTRL_POWER_DOMAIN);
>>  	if (ret)
>>  		return ret;
>>  
>> @@ -403,7 +402,7 @@ int iris_vpu35_vpu4x_power_on_controller(struct iris_core *core)
>>  err_disable_axi1_clk:
>>  	iris_disable_unprepare_clock(core, IRIS_AXI_CTRL_CLK);
>>  err_disable_power:
>> -	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
>> +	iris_disable_power_domains(core, IRIS_CTRL_POWER_DOMAIN);
>>  
>>  	return ret;
>>  }
>>
>> -- 
>> 2.34.1
>>

