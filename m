Return-Path: <linux-media+bounces-62442-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMVBCH/QDmrOCQYAu9opvQ
	(envelope-from <linux-media+bounces-62442-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 11:29:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5AB5A2580
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 11:29:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 621B6300AB29
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 09:29:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE90536894B;
	Thu, 21 May 2026 09:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oO5W9J1M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="blzfeDpM"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C478D368D5C
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 09:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779355768; cv=none; b=jQC5CvR3I3webx7pJvNbms+CDKB7aVq1YmY/DQHTf4xtkdK6+JC2q7Upe5RQqsxIq3kuKlCcJvQjkc+xFw609TuJepBD4xPUH2IkNgFDIKqA7404D9CogpbVULlDWEXZeVUzbhuKH3k0uq7DcO9bUj9ShN6KpDnj9wM486ZjlHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779355768; c=relaxed/simple;
	bh=Yg/cU74Vy9ro3baT9VcjvPWfDGRKJvVgURYJ8fSh8k4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a4djuVzTRD6Tp4jysdM3QbRXNCZV/uchY6D/3p7rflCDbmZ51OXV+csRWZqf3idgU+EJ0l+DycEAhGFp6ckdxzB/hUPVagpt9nKzRfzfnvUvz1nAXkQcRiqOYNQfK9u3PLtoVO75b/MAIYL4xc/Cxk8SlMZJ5p0icyIMkPuel4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oO5W9J1M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=blzfeDpM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99nv23118945
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 09:29:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PCtWrc4L6pgAM/xP7fsEnsajlKUHB7/Vbhu6Xcz8ftM=; b=oO5W9J1M/3SKlU9l
	Lo9+XU7wke3dZ4YYaRSQGr75NdzUYBdf8Vtvn5wKsvBDRwWcYiX1TLHgExB6xEud
	qqYD/P0+nfjKsZ5/wB3namukEJZErDjHLSAjgBCQAJ1AevJQ/JwBzkrL3Txm2Mlr
	YcrVDkplQwcdciD0lmQWxelkVepPYCxou+BALmSultZSft1lCzR8pMnl+eCdtT/X
	2wgA14tuFVJHQPhQ3qA9NjRnVz6lwvwDbKT0nn1wxQV/hkGEgyzXy4FSMAmiPfvy
	RTexzkufIduRZAvF3gZSH6OlQpaarTg3+LcFtMtCSEymoN6UEAr3W/h8iKhglq53
	rKJ3Nw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9r961qe5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 09:29:25 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b99eb06178so145543675ad.2
        for <linux-media@vger.kernel.org>; Thu, 21 May 2026 02:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779355765; x=1779960565; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PCtWrc4L6pgAM/xP7fsEnsajlKUHB7/Vbhu6Xcz8ftM=;
        b=blzfeDpMo5QMcFC6VvnVm0SwtgG1KabJ0O/Cx8Na+f/QaUziFvkX6FiUCyxmTmM+8c
         koAsnuDf1C1tWD2e1Sc41zn8UXJS4bmGe4eVbncGJDQ5tj1UJJYfjmdknPYssuHatwUX
         FtrWIdQNQ8k0E3OISG01UrOGg5qW8aZ+XBDuAw9g6LuC2U2CbNlPa/fVJoZwcjy3zTC+
         bDEDKDJDqPwurtlzWgi/lIQDXf7HTXx6EIfJ6nMQdziqmpNDPhthvYX9CSYZuydM4RdK
         jFwxFBFmSk5vKXsPoiXYCOwaUtDYNEP1bRACTwJi4uv/59Ae891naaicAMF+l22Tcs5n
         TtIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779355765; x=1779960565;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PCtWrc4L6pgAM/xP7fsEnsajlKUHB7/Vbhu6Xcz8ftM=;
        b=r4roAOGGWWYp996UuJ9IixHx9rKr1Dp1BXP35CZVgfzj9BA5Jh7wA8WofSt9uwHV/R
         myBML8AFTTTKobmVGbzIy1MEDtgsr2RNhff32s9J36qIYER1uR3h01aAYeDuHNiXPd69
         2hlszVpxx9QcMeIUWmkdZ1jyBmCItpwzQ3mftjvN/H7zlk9iHCyxa6Dlcr66RDOvMTFl
         PwR2EmNX764/qVmlhwfgsjqSdgb4bNOhd9v5t/qJemfrIgIQC6rSXLkH8rp+mp7VIbB4
         uFhwCHtac/N84GKQYWH/b5tD742q72cZFmVyzhzjfSVUXTLWDGNZ0Jqi6ORtgcvNQwmh
         8bHg==
X-Gm-Message-State: AOJu0YxWZ5B7M2/C3C2mAb+X/Z1edra5MyBI6NijlcR3NuwNj1bf8Jjm
	MOUi+FWQqv8qcilekzxWr2EOUcjlnKL+4gMR3vqfm6qsGkgdLCl71nIgrNrqCb/VvTzCqwoBbmn
	CFtSo2AIPGWF5X+Jg5xl32SynZ0OD7lnN9jfKNGmYxQ+6Mdve16aXDy+b84p3pR7m1w==
X-Gm-Gg: Acq92OG+0tZhg0+g/IAH8aV/w1SIbbficGj0ZTvFNI1FTe2bU68FxVfbyQx6kZfRYde
	NtKPAnZ2kFU/YbKHycl1SLBvli+9afPDnPFXl1oRHxYTlLIDOZnwmT3F5MuZo+lZH57iluU7nwM
	PRR6s7mXv++8/JgSDmNZtFq8xfHYv5FoBbS5zQnRsRBO5NCmteAw7cXkgQ9NpYEnb8xA/0Zp4as
	m2d9NhqEsQdNYtrGnGdPkSojp4U33OM65zjClELsh93fEa2Hvn7J6sjEVOAKHfxzykODiJV1pLF
	mF24gBQEgU6oPc2XqV/aH3EwPHbIbleRK+okDbsg+KfybvLwE8w9Ygz8JGKP//KKlWnwR/05UBw
	VbcQkL8ZM8VnYehwlsUwisXkc0abe6a3xlcErlz3cUiRdL8NV
X-Received: by 2002:a17:90b:33c1:b0:367:f9f1:af78 with SMTP id 98e67ed59e1d1-36a455e4b9emr2003911a91.7.1779355764739;
        Thu, 21 May 2026 02:29:24 -0700 (PDT)
X-Received: by 2002:a17:90b:33c1:b0:367:f9f1:af78 with SMTP id 98e67ed59e1d1-36a455e4b9emr2003869a91.7.1779355764214;
        Thu, 21 May 2026 02:29:24 -0700 (PDT)
Received: from [10.217.216.23] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a5b34a1e1sm106223a91.16.2026.05.21.02.29.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 02:29:23 -0700 (PDT)
Message-ID: <6ae3a89c-f205-45c5-87c0-5550f78502d6@oss.qualcomm.com>
Date: Thu, 21 May 2026 14:59:15 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/9] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
To: Bryan O'Donoghue <bod@kernel.org>, Erikas Bitovtas <xerikasxx@gmail.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
 <e7WD-tbtAA7Bx0uDnXgPHto9hACWxgblhI2eitNHX4VYEgxOOceuY0sOS6KQnGiyTaDYaKudZt4k50z_vJVpnw==@protonmail.internalid>
 <20260519-msm8939-venus-rfc-v8-2-542ec7557ebc@gmail.com>
 <608dc53d-17a8-4230-9ebb-48a94bf03675@kernel.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <608dc53d-17a8-4230-9ebb-48a94bf03675@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 40knHIHTc-riuI-9KDOAUXEowMBedQdO
X-Proofpoint-GUID: 40knHIHTc-riuI-9KDOAUXEowMBedQdO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA5MyBTYWx0ZWRfX0gEI8frqwYlB
 1VH7KDiFs3zpx44TLxImNv82QUzOmaIApZGjCJ6np5P8C2yvFIswEl9j3/Vd0ltXLdVPyHdRXNX
 Y+txYaYa2a4bfJVhoRr9sI4moDUxwuP7DNhVNU6GwKpkEzHFP8gCcRojn6H0Hyf6psPhOxXntzv
 GRvsrj/B/d2hFc0Wq2nSLbMWFSK4ODrEc4eQqgk+yiD0xsKq/a94QAkzQEBqEFBSv041bCqDqtY
 4gyqYMjaNQc73glTh+eOJCGS1ZU/C7rqoAetkhqNB3cCWDfIYnY5c7T/4Jmg67V7aYeyrbAa4Pg
 ktDzPncnSvlm0mPojJq4ZxAQi+psXfU7zn7bMEMEEDZ8YmabnH/etlwRewVyeNCXMmYPhDaIzwB
 UtkGiwXvB1Vz7nDZGNR+AKtgAOpfgsV9OUNVaPa072txYEQupliOZV896kXMoYv/zYg6pNZ0fgn
 pvVqu0oYoS3znij3iGQ==
X-Authority-Analysis: v=2.4 cv=GqFyPE1C c=1 sm=1 tr=0 ts=6a0ed075 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=BwysoTov3wrWWCQ5pjYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210093
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62442-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,oss.qualcomm.com,apitzsch.eu,baylibre.com,redhat.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0C5AB5A2580
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/20/2026 2:02 PM, Bryan O'Donoghue wrote:
> On 19/05/2026 16:10, Erikas Bitovtas wrote:
>> Allow Venus core GDSCs to have their control passed to hardware, so they
>> can be powered on by Venus firmware.
>>
>> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
>> ---
>>   drivers/clk/qcom/gcc-msm8939.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-
>> msm8939.c
>> index 45193b3d714b..243d31a32e92 100644
>> --- a/drivers/clk/qcom/gcc-msm8939.c
>> +++ b/drivers/clk/qcom/gcc-msm8939.c
>> @@ -3664,6 +3664,7 @@ static struct clk_branch gcc_venus0_vcodec0_clk = {
>>
>>   static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
>>       .halt_reg = 0x4c02c,
>> +    .halt_check = BRANCH_HALT_SKIP,

please use .halt_check = BRANCH_HALT

>>       .clkr = {
>>           .enable_reg = 0x4c02c,
>>           .enable_mask = BIT(0),
>> @@ -3681,6 +3682,7 @@ static struct clk_branch
>> gcc_venus0_core0_vcodec0_clk = {
>>
>>   static struct clk_branch gcc_venus0_core1_vcodec0_clk = {
>>       .halt_reg = 0x4c034,
>> +    .halt_check = BRANCH_HALT_SKIP,

please use .halt_check = BRANCH_HALT

>>       .clkr = {
>>           .enable_reg = 0x4c034,
>>           .enable_mask = BIT(0),
>> @@ -3753,6 +3755,7 @@ static struct gdsc venus_core0_gdsc = {
>>       .pd = {
>>           .name = "venus_core0",
>>       },
>> +    .flags = HW_CTRL_TRIGGER,
>>       .pwrsts = PWRSTS_OFF_ON,
>>   };
>>
>> @@ -3761,6 +3764,7 @@ static struct gdsc venus_core1_gdsc = {
>>       .pd = {
>>           .name = "venus_core1",
>>       },
>> +    .flags = HW_CTRL_TRIGGER,
>>       .pwrsts = PWRSTS_OFF_ON,
>>   };
>>
>>
>> -- 
>> 2.54.0
>>
> 
> @Tanyia
> 
> Can you confirm this change please ?
> 
> ---
> bod

-- 
Thanks,
Taniya Das


