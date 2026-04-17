Return-Path: <linux-media+bounces-59032-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBkWH1ZY4mn65AAAu9opvQ
	(envelope-from <linux-media+bounces-59032-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 17:57:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C9241CDB0
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 17:57:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4406530A1F68
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 15:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5D78314A86;
	Fri, 17 Apr 2026 15:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kC4U9wpN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zv8Apc5n"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C79B3314A1
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 15:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776441165; cv=none; b=Rog/CJAwdhEgxCsKMg/CCd9Wl6B72H8d+bfRJ0+Fw4/DKDgZSv4KcuID9WRswUjgme3c54ddchUiR77d5eeSXM2EFiU5fFk23w6CB2ei8XBbPVI0+eJz7GJ7aFSgKSn3eH5zL92avc7l3p4qj/68cDnDPetKadYGW9mnQUBlZ3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776441165; c=relaxed/simple;
	bh=C8SVjNgScMrk7Il1HbbL1snzm3PVGD0QfSo4TfFgmW4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=pnbwqvScQRAqPOzg3WU2Wbu6v9am43rgtW/MRr4xvMg0RoufUIy+AXOZ2YWBn+ZklAZgwwQKIgVG6azLi948xbUt72jF+Lu8bnRXZX2zkE+2WPqlKvOdwMMaBjZ3RaZnHp5PHz60WR2MeoP+iVqbXASd8SEBo/38GmwBK5c2zUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kC4U9wpN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zv8Apc5n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HEEc1n667679
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 15:52:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VFvLsXOjyGEUKAbEbC/CpbEcHSlUrHJaLSiirxzXi5o=; b=kC4U9wpNOR6gT7G3
	jV7ZuV2FwH4O2o/sGc6ArozAMI4zsoXFEXhSUY0iQJU8RfVmimdv+9j7ZFumk/FW
	R343MFY0zbAUrv22mbAR6fbEEhjDNFrKi5A1jDO13D4dqp/ZTjVSHW/dWQqUEjOL
	E/gS4M6QR7iALs1b5ECCfUEmOeCgHRsADNZFRyc5/wmXavFSZkLgmdGpXp6AmQ8Z
	cBJk/mXFmmzk4JpqnlBjNB3PnEl7zvNCLv4JedyqbVtEyVqBOHaYtgKKgwMFAnp1
	C10YU+N1qZ/8sUPT1ShIsSDZ8KTs0JjCzF1EDs6+gxHwMLpmYxxGZhY0+sf69njv
	LyTEaA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkaxctv3w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 15:52:42 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f9429f49cso408690b3a.3
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 08:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776441161; x=1777045961; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VFvLsXOjyGEUKAbEbC/CpbEcHSlUrHJaLSiirxzXi5o=;
        b=Zv8Apc5nBMZVq+kqdD/vEkFqy7OfmEG7r7NH5WG8/svx4MiX4cD+QLyTThnCaSAb7L
         btwkxVrEX6HhRFjDXe3pl3q2MjAOhjj+b64F7EHy7eXWaKk+KyyW3OGD0dAR3zL2fd56
         dn/waNuGn6lk+eiT7BdXfmv7xthzAvU9j1dK75ga8LwIBtp2vwhzFTxMDgeId64269RB
         UQe+UQKdyuuqYb0zW+lwzWRgsW9gLxZufq7gyIr+7wJIOamPffPFMznDnpM+EkTggJnn
         9zlz5B/ChYyvQIWR90thhnVJDUSjDTiUJawHZrQOsAjZ0LVh/Y78Et2fe2jncCTtRaxQ
         TFzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776441161; x=1777045961;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VFvLsXOjyGEUKAbEbC/CpbEcHSlUrHJaLSiirxzXi5o=;
        b=eGX15hhw1d9IFfACI5Y4lTT7PiYh12aDqgzCVOlNfTAfOOHmJ8qwFzmMOq7Pu36zv3
         GWm+80ZjrBEzMzDHL3iQ8PCeabvzqcR+dQkqGayrgUnFzIbvlW2svnzuMCc6GdPvLwG+
         MsCTvJ+myg93sCkysOwJYsCryeIxYE6wY+8GG5n1olfT6FIN/xqD7NRFvr9yLfU2lgm7
         sDJc0kAAJ+1wRLbD9NtGMItu/TtVYS4FZcFsPegRIcR6N5RGp4+AcEOx+w3EL+fB8Y96
         WwfoeRnthc1rIt+0DErvoogC/glV5etQykg8EfWOo1A4z8wKRH+c+Kj3x8494w4wOBbI
         KpHQ==
X-Forwarded-Encrypted: i=1; AFNElJ8kCNsCiL1TWdB169RGTphSAzBKo5XjJTe03HIKjP+jTbDiyReXfhBJx1R4R1YXVvCQIUq0dtrwGo9Mcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzY/Nt5fNcxCGW+2UhtiLHgsBmV678NylFXr/Es+QuMx0g6FqGs
	4vKe9WiF6FKmY1Au+WhFaFivy7N+jyPZA6dtqK+TmCqXSFuKDseX0pmxTk9RVNL/5mV/nKHIxiC
	V1zbFIRQCUpN1obCFHQkdJH8DgKWxJbNUGubSNzW0H6Z4HpHbYpshoAhFvrpx1tHhhw==
X-Gm-Gg: AeBDiesgZTiFzaBLAPHckILmtgEC0Jrr/zjn+3meePK4rNH4PMuBcAXHR2JQgK7vtss
	nDkbCiHIkYamtc7I6hkwL42QxiMU4lAcn3gsmzXKXL7SiLlZGKsSWaBmQ9Wp+aDdM9hAH1j62n3
	NjDB0xhBdwtH9dXrR1ku/2cJmdNEEy0RqeCIuZpdcijIGflBz5Ag7sRd/BEsbdKS2hVRTrmBAwR
	dLKD75ELS8laqLppAVrpdfSKYvbw/hfLK7wrTG+IxnGWkc2SzvXpS+u/80FHkkZZsLLvySx9iB6
	Y9G610cgY9dKcEI3+69Dl2nriAZYIrDi0e90G2rrmlNOMcv/zon7cPCqq4lj+bzSB1g96iFtiZP
	YcJpy34OgGcNuL7BVXx0op/J10e+SmP9jCgmkjyBu1Gc+ylQHsG1IqMEr2sL+hhbq
X-Received: by 2002:a05:6a00:3cd1:b0:82f:8a29:e3b4 with SMTP id d2e1a72fcca58-82f8c97f212mr3360989b3a.50.1776441161311;
        Fri, 17 Apr 2026 08:52:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:3cd1:b0:82f:8a29:e3b4 with SMTP id d2e1a72fcca58-82f8c97f212mr3360954b3a.50.1776441160601;
        Fri, 17 Apr 2026 08:52:40 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebb38f2sm2168338b3a.30.2026.04.17.08.52.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 08:52:40 -0700 (PDT)
Message-ID: <26bd9e14-7e63-d5d8-f9e1-cc8143672a49@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 21:22:31 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH 10/11] media: iris: Add platform data for glymur
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-10-7d3d1cf57b16@oss.qualcomm.com>
 <zieokmtef7z4sqle7dgy4rv7t3egcgzji5fwrogc7pz4sz4msa@gthghxow3gkf>
Content-Language: en-US
In-Reply-To: <zieokmtef7z4sqle7dgy4rv7t3egcgzji5fwrogc7pz4sz4msa@gthghxow3gkf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JcqMa0KV c=1 sm=1 tr=0 ts=69e2574a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=jqMbv88wRcHZcgUF81UA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE2MCBTYWx0ZWRfX2LOO2dfVnKQC
 Y52olOZFKSdIWduMsUS54OUNWq6cDvye53YXzVITrfDo9+whOgSV5+PgsVWJvS2YqyWSKShrX87
 bkPgjHCozWyJcZjzwUFa5pusArs8kp21PjrfDdUA2OiQCKv7AEl/nzC4Dtxhg2/snzrD9k642Gl
 bZdtY+fS6ltdLQLSAuINzNHitUk/AcsJFw3OWvvoiPv/MV0txwb6VB0AiLlNRprS7YoEH1YXCcG
 AL+Csm9RgVuu3Ccy89Jy+kXGaJ4hEKCXbljjCXenSyuQmtBbqDGTIA7UJir7JrBmJ4gzShoqdV7
 ezlYHMX9/238OCvUiKl2vldImQ/1alfasXBCfZ4HVmdZ3HluZRwOtY53fowpXWUnY43LapoTT5C
 SyKyFhuUOYnsKM+1/16Tbe+kTMA6y6opHmmxu7mpWhy8ZuyOhen3ddAOeeWfUcnM9fa6+rdZxMx
 7BUeN53r6mj1T4weg3w==
X-Proofpoint-GUID: AcUPpAg2jgmRgXDt4tIjf6QJbY14hwrk
X-Proofpoint-ORIG-GUID: AcUPpAg2jgmRgXDt4tIjf6QJbY14hwrk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604170160
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59032-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 16C9241CDB0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/14/2026 9:35 PM, Dmitry Baryshkov wrote:
> On Tue, Apr 14, 2026 at 10:30:06AM +0530, Vishnu Reddy wrote:
>> Add glymur platform data by reusing most of the SM8550 definitions.
>> Move configuration that differs in a per-SoC platform specific data.
>>
>> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/Makefile          |   1 +
>>   .../platform/qcom/iris/iris_platform_common.h      |   1 +
>>   .../media/platform/qcom/iris/iris_platform_gen2.c  | 100 +++++++++++++++++++++
>>   .../platform/qcom/iris/iris_platform_glymur.c      |  93 +++++++++++++++++++
>>   .../platform/qcom/iris/iris_platform_glymur.h      |  17 ++++
>>   drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
>>   6 files changed, 216 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
>> index 6f4052b98491..677513c7c045 100644
>> --- a/drivers/media/platform/qcom/iris/Makefile
>> +++ b/drivers/media/platform/qcom/iris/Makefile
>> @@ -11,6 +11,7 @@ qcom-iris-objs += iris_buffer.o \
>>                iris_hfi_gen2_response.o \
>>                iris_hfi_queue.o \
>>                iris_platform_gen2.o \
>> +             iris_platform_glymur.o \
>>                iris_power.o \
>>                iris_probe.o \
>>                iris_resources.o \
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> index aeb70f54be10..a279ea462ee6 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> @@ -41,6 +41,7 @@ enum pipe_type {
>>   	PIPE_4 = 4,
>>   };
>>   
>> +extern const struct iris_platform_data glymur_data;
>>   extern const struct iris_platform_data qcs8300_data;
>>   extern const struct iris_platform_data sc7280_data;
>>   extern const struct iris_platform_data sm8250_data;
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> index 47c6b650f0b4..fa2115092be8 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> @@ -12,6 +12,7 @@
>>   #include "iris_vpu_buffer.h"
>>   #include "iris_vpu_common.h"
>>   
>> +#include "iris_platform_glymur.h"
>>   #include "iris_platform_qcs8300.h"
>>   #include "iris_platform_sm8650.h"
>>   #include "iris_platform_sm8750.h"
>> @@ -921,6 +922,105 @@ static const u32 sm8550_enc_op_int_buf_tbl[] = {
>>   	BUF_SCRATCH_2,
>>   };
>>   
>> +const struct iris_platform_data glymur_data = {
> If you add a platform-specific file, then move the data to the file too.

glymur_data reusing the most of the sm8550 definitions which is in this 
source file.
one option is to introduce gen2 header file and extern all the glymur 
required definitions
in that. glymur source can include that gen2 header.

> Also, please use iris_something prefix for all your visible symbols.

Ack, I'll add iris prefix.

>> +	.get_instance = iris_hfi_gen2_get_instance,
>> +	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
>> +	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
>> +	.get_vpu_buffer_size = iris_vpu_buf_size,
>> +	.vpu_ops = &iris_vpu36_ops,
>> +	.set_preset_registers = iris_set_sm8550_preset_registers,
>> +	.init_cb_devs = glymur_init_cb_devs,
>> +	.deinit_cb_devs = glymur_deinit_cb_devs,
>> +	.icc_tbl = sm8550_icc_table,
>> +	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
>> +	.clk_rst_tbl = glymur_clk_reset_table,
>> +	.clk_rst_tbl_size = ARRAY_SIZE(glymur_clk_reset_table),
>> +	.bw_tbl_dec = sm8550_bw_table_dec,
>> +	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
>> +	.pmdomain_tbl = glymur_pmdomain_table,
>> +	.pmdomain_tbl_size = ARRAY_SIZE(glymur_pmdomain_table),
>> +	.opp_pd_tbl = sm8550_opp_pd_table,
>> +	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
>> +	.clk_tbl = glymur_clk_table,
>> +	.clk_tbl_size = ARRAY_SIZE(glymur_clk_table),
>> +	.opp_clk_tbl = glymur_opp_clk_table,
>> +	/* Upper bound of DMA address range */
>> +	.dma_mask = 0xffe00000 - 1,
>> +	.fwname = "qcom/vpu/vpu36_p4_s7.mbn",
>> +	.pas_id = IRIS_PAS_ID,
>> +	.dual_core = true,
>> +	.inst_iris_fmts = platform_fmts_sm8550_dec,
>> +	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
>> +	.inst_caps = &platform_inst_cap_sm8550,
>> +	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
>> +	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
>> +	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
>> +	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
>> +	.tz_cp_config_data = tz_cp_config_glymur,
>> +	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_glymur),
>> +	.core_arch = VIDEO_ARCH_LX,
>> +	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
>> +	.ubwc_config = &ubwc_config_sm8550,
>> +	.num_vpp_pipe = 4,
>> +	.max_session_count = 16,
>> +	.max_core_mbpf = NUM_MBS_8K * 2,
>> +	.max_core_mbps = ((8192 * 4320) / 256) * 60,
>> +	.dec_input_config_params_default =
>> +		sm8550_vdec_input_config_params_default,
>> +	.dec_input_config_params_default_size =
>> +		ARRAY_SIZE(sm8550_vdec_input_config_params_default),
>> +	.dec_input_config_params_hevc =
>> +		sm8550_vdec_input_config_param_hevc,
>> +	.dec_input_config_params_hevc_size =
>> +		ARRAY_SIZE(sm8550_vdec_input_config_param_hevc),
>> +	.dec_input_config_params_vp9 =
>> +		sm8550_vdec_input_config_param_vp9,
>> +	.dec_input_config_params_vp9_size =
>> +		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
>> +	.dec_input_config_params_av1 =
>> +		sm8550_vdec_input_config_param_av1,
>> +	.dec_input_config_params_av1_size =
>> +		ARRAY_SIZE(sm8550_vdec_input_config_param_av1),
>> +	.dec_output_config_params =
>> +		sm8550_vdec_output_config_params,
>> +	.dec_output_config_params_size =
>> +		ARRAY_SIZE(sm8550_vdec_output_config_params),
>> +
>> +	.enc_input_config_params =
>> +		sm8550_venc_input_config_params,
>> +	.enc_input_config_params_size =
>> +		ARRAY_SIZE(sm8550_venc_input_config_params),
>> +	.enc_output_config_params =
>> +		sm8550_venc_output_config_params,
>> +	.enc_output_config_params_size =
>> +		ARRAY_SIZE(sm8550_venc_output_config_params),
>> +
>> +	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
>> +	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
>> +	.dec_output_prop_avc = sm8550_vdec_subscribe_output_properties_avc,
>> +	.dec_output_prop_avc_size =
>> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_avc),
>> +	.dec_output_prop_hevc = sm8550_vdec_subscribe_output_properties_hevc,
>> +	.dec_output_prop_hevc_size =
>> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_hevc),
>> +	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
>> +	.dec_output_prop_vp9_size =
>> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
>> +	.dec_output_prop_av1 = sm8550_vdec_subscribe_output_properties_av1,
>> +	.dec_output_prop_av1_size =
>> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_av1),
>> +
>> +	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
>> +	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
>> +	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
>> +	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
>> +
>> +	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
>> +	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
>> +	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
>> +	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
>> +};
>> +
>>   const struct iris_platform_data sm8550_data = {
>>   	.get_instance = iris_hfi_gen2_get_instance,
>>   	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_glymur.c b/drivers/media/platform/qcom/iris/iris_platform_glymur.c
>> new file mode 100644
>> index 000000000000..64b150db9f73
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_glymur.c
>> @@ -0,0 +1,93 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include <dt-bindings/media/qcom,glymur-iris.h>
>> +#include "iris_core.h"
>> +#include "iris_platform_common.h"
>> +#include "iris_platform_glymur.h"
>> +
>> +#define VIDEO_REGION_SECURE_FW_REGION_ID	0
>> +#define VIDEO_REGION_VM0_SECURE_NP_ID		1
>> +#define VIDEO_REGION_VM0_NONSECURE_NP_ID	5
> These are not glymur-specific, are they?

It's common for upcoming platforms as well. I'll move this to common 
platform header.

>> +
>> +const struct platform_clk_data glymur_clk_table[] = {
>> +	{IRIS_AXI_VCODEC_CLK,		"iface"			},
>> +	{IRIS_CTRL_CLK,			"core"			},
>> +	{IRIS_VCODEC_CLK,		"vcodec0_core"		},
>> +	{IRIS_AXI_CTRL_CLK,		"iface_ctrl"		},
>> +	{IRIS_CTRL_FREERUN_CLK,		"core_freerun"		},
>> +	{IRIS_VCODEC_FREERUN_CLK,	"vcodec0_core_freerun"	},
>> +	{IRIS_AXI_VCODEC1_CLK,		"iface1"		},
>> +	{IRIS_VCODEC1_CLK,		"vcodec1_core"		},
>> +	{IRIS_VCODEC1_FREERUN_CLK,	"vcodec1_core_freerun"	},
>> +};
>> +
>> +const char * const glymur_clk_reset_table[] = {
>> +	"bus0",
>> +	"bus_ctrl",
>> +	"core",
>> +	"vcodec0_core",
>> +	"bus1",
>> +	"vcodec1_core",
>> +};
>> +
>> +const char * const glymur_opp_clk_table[] = {
>> +	"vcodec0_core",
>> +	"vcodec1_core",
>> +	"core",
>> +	NULL,
>> +};
>> +
>> +const char * const glymur_pmdomain_table[] = {
>> +	"venus",
>> +	"vcodec0",
>> +	"vcodec1",
>> +};
>> +
>> +const struct tz_cp_config tz_cp_config_glymur[] = {
>> +	{
>> +		.cp_start = VIDEO_REGION_SECURE_FW_REGION_ID,
>> +		.cp_size = 0,
>> +		.cp_nonpixel_start = 0,
>> +		.cp_nonpixel_size = 0x1000000,
>> +	},
>> +	{
>> +		.cp_start = VIDEO_REGION_VM0_SECURE_NP_ID,
>> +		.cp_size = 0,
>> +		.cp_nonpixel_start = 0x1000000,
>> +		.cp_nonpixel_size = 0x24800000,
>> +	},
>> +	{
>> +		.cp_start = VIDEO_REGION_VM0_NONSECURE_NP_ID,
>> +		.cp_size = 0,
>> +		.cp_nonpixel_start = 0x25800000,
>> +		.cp_nonpixel_size = 0xda600000,
>> +	},
>> +};
>> +
>> +int glymur_init_cb_devs(struct iris_core *core)
>> +{
>> +	const u32 f_id = IRIS_FIRMWARE;
>> +	struct device *dev;
>> +
>> +	dev = iris_create_cb_dev(core, "iris_firmware", &f_id);
>> +	if (IS_ERR(dev))
>> +		return PTR_ERR(dev);
>> +
>> +	if (device_iommu_mapped(dev))
>> +		core->dev_fw = dev;
>> +	else
>> +		device_unregister(dev);
>> +
>> +	return 0;
>> +}
>> +
>> +void glymur_deinit_cb_devs(struct iris_core *core)
>> +{
>> +	if (core->dev_fw)
>> +		device_unregister(core->dev_fw);
>> +
>> +	core->dev_fw = NULL;
> Why do you need to set it to NULL?

Not needed, I'll drop it.

Thanks,
Vishnu Reddy.

>> +}
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_glymur.h b/drivers/media/platform/qcom/iris/iris_platform_glymur.h
>> new file mode 100644
>> index 000000000000..03c83922f0d9
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_glymur.h
>> @@ -0,0 +1,17 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#ifndef __IRIS_PLATFORM_GLYMUR_H__
>> +#define __IRIS_PLATFORM_GLYMUR_H__
>> +
>> +extern const struct platform_clk_data glymur_clk_table[9];
>> +extern const char * const glymur_clk_reset_table[6];
>> +extern const char * const glymur_opp_clk_table[4];
>> +extern const char * const glymur_pmdomain_table[3];
>> +extern const struct tz_cp_config tz_cp_config_glymur[3];
>> +int glymur_init_cb_devs(struct iris_core *core);
>> +void glymur_deinit_cb_devs(struct iris_core *core);
>> +
>> +#endif
>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
>> index 34751912f871..53869d9113d5 100644
>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
>> @@ -369,6 +369,10 @@ static const struct dev_pm_ops iris_pm_ops = {
>>   };
>>   
>>   static const struct of_device_id iris_dt_match[] = {
>> +	{
>> +		.compatible = "qcom,glymur-iris",
>> +		.data = &glymur_data,
>> +	},
>>   	{
>>   		.compatible = "qcom,qcs8300-iris",
>>   		.data = &qcs8300_data,
>>
>> -- 
>> 2.34.1
>>

