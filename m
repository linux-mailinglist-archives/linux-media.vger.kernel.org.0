Return-Path: <linux-media+bounces-51299-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFrlHLEpcWniewAAu9opvQ
	(envelope-from <linux-media+bounces-51299-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 20:32:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9A15C38C
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 20:32:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 413487EF0E1
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 18:49:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5803336A020;
	Wed, 21 Jan 2026 18:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FwWa+K7O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZuuzAHLE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFA12D7DFE
	for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 18:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769021136; cv=none; b=g8SnPpVEpK4hxSaJF6Df7LDUOmumDGABSn/cZbHYrx7TtaCZvf+Zl+kSc5lM3HvMxlc9U8UjLFXm7/hfjJ0tzTgWju5KdPlm+dKW92CoTX/WRnJRKuY27V7VfEI1ptG1h14I1yPkESWC1RK0LBEsbOXJ+lzCic0AzN32pE7z7sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769021136; c=relaxed/simple;
	bh=TqRqRnS/w3Itial/XO253Ilugpi2M5kzQIYGoAuJlcY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SUt9uOID1UBYuTuZSdkr54N50ITdjKvmLwWRgrtLkZpfOYqQ8TOMXNtkPW+xvK9oAXIcwoGultjDbbBuXKnjqKHwTXCpy9rzx2oUYfKEX4R6USdbQ4vR3OdJmtP/Y++I92vQ4EXG8Em5uMoQF2w409MuJIHalhB4dw4BvldKBTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FwWa+K7O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZuuzAHLE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LD06et3217942
	for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 18:45:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0/LJzSk5awQ97LsQfUzwO5hHCTcCtajrVVs1JTzi9h4=; b=FwWa+K7OSixO6CtZ
	p3fyigvGGSSxAAad8nw712SIWT6CMWkGIZdz42a7mhWtpkT1q/CQfRiQu5FlA2wZ
	Rxxxr5/3ksWzOAISaboPbm2iFEnl/L2I4I/n1paAC9S197EpQMGm3PESKqfIB0Zu
	631Hn2K5WWS4fHmuRV4DC1TiG/uJrFzyrNcWafRWNenHt7nFSCoR9RusoQo6Aog1
	+tdJaSV+Fp9yJ35eO4YcjkS/8l3eRzkGVhsuUWuu1DQ46pXPPXyDuSXenAs6b5qd
	gfWqnWmC3gYCSOWugaCtTexTOTst6u0r1YuLWMaC+h3gaP3Y8DRnvY8esref2Fjb
	eQ6NBw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btya295ty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 18:45:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a7b7f04a11so2659715ad.3
        for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 10:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769021130; x=1769625930; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0/LJzSk5awQ97LsQfUzwO5hHCTcCtajrVVs1JTzi9h4=;
        b=ZuuzAHLEZO8X9GkXi1goVzrJQh1X7KxVIniMvoepYVIVm2hrGWwfD/J5kHnqcXQtcS
         7wBAgkDCBgO12cejY7RX4rvxByQeMusDgCF0TTwkZLgAcVhOAwDz6phQ7/nabFMIeblA
         bPCHbu5iad3A2bFoBMNUL3NkYQ00KfR0gPDqPXXDNTMSwHpAAYl9+wqaGoMvgkW0aV/f
         OltPPv+SBcrstimvObBFnmVzkzu9vn1SQlCLkbq7ap2ahd+xT8TtpxawBucC71Wdm4Lg
         jPHBmnFJsqX/AxrRcfMzX2mN9gE41/gyTnXYgehc1pBt6VDbMJ5N0dSOwh4Prvd7TLjB
         auzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769021130; x=1769625930;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0/LJzSk5awQ97LsQfUzwO5hHCTcCtajrVVs1JTzi9h4=;
        b=VvlVdPoibmpTAGKI/my33H+qq2GRCcgA7PxlE8LpQnl+uJshieAunj+GgUAFOLNY4t
         c5dAGE5O1ivPGJmdoLKcomZznnOQototH+tSaHoawM0IfwNHU8DT4EGM/0PFglO9eCT1
         GHS9tPGvoUHNpPMr8XVxyp+Kq7n4ulnI4Yuw5kLYxI/vcIrtxlCzcFfqrMOjc140vT3z
         RoT5N2zV4HXixhJ8baJyybwVEiT1eUXbx3hjUeMSPVVeIcXPgR0vtsU5hqESQHDT2aW6
         L6ZkDJs8rK3Is3GMY/slZW0sx1f0rWkkrZZ0JzwTF9kqw34Anau304ChD/4s2gyqVnim
         lZCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWX+j7cYwd72L8HxWwMMbx4+1KQKsFLIjEPWFL7YcvaXZ/rIGWlF7XqbVEzhlRPu1v6K5GHjXwzwud4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl//I6cSFPqqJghlzxos1ebdwgyzSZASyBLvhAu7FX3F1/M3b5
	8p2Wh21AEr969ctfFym2VZgkP3WRMxNiDy3WjhktDe0Vy++JoGegZ48xs9gXlF0oOymIaCGnvCK
	b0JKBGQI8OMAYcTJvUJk6PPCrZoMEv/3LDt7t1ouUpX1aMDWE193h0BbW4OZVOOI+cg==
X-Gm-Gg: AZuq6aJbvZcAsLgEsaufDS/fd/u60MAvkyBLczf1jt63MxeXwkWrnU2K2bbfjQ8Y2nT
	sUkvbN6laRIwz6nPM5LpYGUsfQSsO2LJEksQr352+RVlwSDsqL9CABUhysFGZqvRWNcBNypiqLl
	pgFcXyihT+pj5maokcTfp7qgQtSspJO5c819xVaduINY98Qm5gWzvg39zAkQNW8yjbHQ2eA6nfn
	9PI0NSoDxmB/yeCv2wuO8f1c05gPkmfvUlOz4hT5iXsTMi09N1ekswoANvzp66OhWUbLkA4KB5w
	Yo0+5TGl9s8m49lo1xWnIuhYdN1yUgYz9/flv8mTCZrASu9aeHEwlKWsb08pQXc9saH/3j9TsHV
	TbVM3P8BxCfU4LUj+xvJIa+ZzKR98NRGmn079MpWHRXKLKrq/2fWTTiVtps3yg8i8Tg==
X-Received: by 2002:a17:902:c410:b0:2a0:c933:beed with SMTP id d9443c01a7336-2a768a7e8b8mr56182015ad.4.1769021130047;
        Wed, 21 Jan 2026 10:45:30 -0800 (PST)
X-Received: by 2002:a17:902:c410:b0:2a0:c933:beed with SMTP id d9443c01a7336-2a768a7e8b8mr56181735ad.4.1769021129417;
        Wed, 21 Jan 2026 10:45:29 -0800 (PST)
Received: from [10.62.37.112] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190e764asm158552975ad.40.2026.01.21.10.45.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 10:45:29 -0800 (PST)
Message-ID: <657eab41-ad2f-4afe-b9bf-2fea8c3868fa@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 10:45:22 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/3] media: qcom: camss: tpg: Add TPG support for
 multiple targets
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260113-camss_tpg-v8-0-fa2cb186a018@oss.qualcomm.com>
 <20260113-camss_tpg-v8-3-fa2cb186a018@oss.qualcomm.com>
 <fb402d00-ee2a-4437-af09-200ef7203420@oss.qualcomm.com>
 <0353c460-dc47-4171-a434-d52b58b50859@oss.qualcomm.com>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <0353c460-dc47-4171-a434-d52b58b50859@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=epbSD4pX c=1 sm=1 tr=0 ts=69711ecb cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=7squt_tPm4BvI6SDO94A:9
 a=ux8SKSwu-4WW2TTj:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: xEnGvDvkSGI1R7ALGrOa5MPCTWr_VJyR
X-Proofpoint-ORIG-GUID: xEnGvDvkSGI1R7ALGrOa5MPCTWr_VJyR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDE1NiBTYWx0ZWRfX4lxgikDWTSYo
 urRSu1qE/VVTiXVhm5AFq5BVSGoS66NopP7YY1UxhzAOYIU9yqtg9jFOQ84HxrdDZdlZMuIsyer
 7xcX7Go6He12Pkzpxn3jHd/25vJFQ+aO3/UB++U+twv1csqofN+acPTK/9XU8g8hLSgukWOKFcb
 /I+gIW33avE9Nr4+//YVkvdRfcqqzcQq3SnrrcuHiQJx8Sy4DZJ3FxFab1hRLRoriLfM1Zh762D
 Gud4oQUqgVNXhlp7pVeh3I08gNZ4f0bq/4wL7TAyEM2vMQGfjTb0LBZb+rsphig6y5MZGEix5oo
 FzN0lx6pg/JGHRWurd5Cw1+LWnI47PzzTwmiTq44BoXb5qI+fLUQaMDQYAruUYgSUfrqFJMuE+K
 yc2WykPFCG+NofbWVLqRHSLbBHhd43PZpVbGzbmPTsx4uMWSpHJEwB0N8pfrLl3IQnkjBRlqHHS
 vaED/CUDq/9SOxh0Q4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_03,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601210156
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org];
	TAGGED_FROM(0.00)[bounces-51299-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vijay.tumati@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CC9A15C38C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 1/18/2026 7:29 PM, Wenmeng Liu wrote:
> 
> Hi Vijay,
> 
> On 1/17/2026 3:32 AM, Vijay Kumar Tumati wrote:
>> Hi Wenmeng,
>>
>> On 1/13/2026 1:03 AM, Wenmeng Liu wrote:
>>> Add support for TPG found on LeMans, Monaco, Hamoa.
>>>
>>> Signed-off-by: Wenmeng Liu<wenmeng.liu@oss.qualcomm.com>
>>> ---
>>>   drivers/media/platform/qcom/camss/Makefile         |   1 +
>>>   drivers/media/platform/qcom/camss/camss-csid-680.c |  14 ++
>>>   .../media/platform/qcom/camss/camss-csid-gen3.c    |  14 ++
>>>   drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 257 ++++++++++ 
>>> + ++++++++++
>>>   drivers/media/platform/qcom/camss/camss.c          | 128 ++++++++++
>>>   5 files changed, 414 insertions(+)
>>>
>>> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/ 
>>> media/platform/qcom/camss/Makefile
>>> index 
>>> d355e67c25700ac061b878543c32ed8defc03ad0..e8996dacf1771d13ec1936c9bebc0e71566898ef 100644
>>> --- a/drivers/media/platform/qcom/camss/Makefile
>>> +++ b/drivers/media/platform/qcom/camss/Makefile
>>> @@ -28,5 +28,6 @@ qcom-camss-objs += \
>>>           camss-video.o \
>>>           camss-format.o \
>>>           camss-tpg.o \
>>> +        camss-tpg-gen1.o \
>>>   obj-$(CONFIG_VIDEO_QCOM_CAMSS) += qcom-camss.o
>>> diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/ 
>>> drivers/media/platform/qcom/camss/camss-csid-680.c
>>> index 
>>> 3ad3a174bcfb8c0d319930d0010df92308cb5ae4..a5da35cae2eb9acf642795c0a91db58d845f211c 100644
>>> --- a/drivers/media/platform/qcom/camss/camss-csid-680.c
>>> +++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
>>> @@ -103,6 +103,8 @@
>>>   #define        CSI2_RX_CFG0_PHY_NUM_SEL            20
>>>   #define        CSI2_RX_CFG0_PHY_SEL_BASE_IDX            1
>>>   #define        CSI2_RX_CFG0_PHY_TYPE_SEL            24
>>> +#define        CSI2_RX_CFG0_TPG_NUM_EN                BIT(27)
>>> +#define        CSI2_RX_CFG0_TPG_NUM_SEL            GENMASK(29, 28)
>>>   #define CSID_CSI2_RX_CFG1                    0x204
>>>   #define        CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN        BIT(0)
>>> @@ -185,11 +187,23 @@ static void __csid_configure_rx(struct 
>>> csid_device *csid,
>>>                   struct csid_phy_config *phy, int vc)
>>>   {
>>>       u32 val;
>>> +    struct camss *camss;
>>> +    struct tpg_device *tpg;
>>> +    camss = csid->camss;
>>>       val = (phy->lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
>>>       val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
>>>       val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX) << 
>>> CSI2_RX_CFG0_PHY_NUM_SEL;
>> "phy_num_sel" and "tpg_num_sel" can be in if-else. They both are not 
>> required at once.
> 
> ACK
> 
>>> +    if (camss->tpg) {
>>> +        tpg = &camss->tpg[phy->csiphy_id];
>>> +
>>> +        if (csid->tpg_linked && tpg->testgen.mode > 0) {
>> If the tpg is linked and the mode is not valid, shouldn't you be 
>> throwing error?
> 
> ACK
>>> +            val |= FIELD_PREP(CSI2_RX_CFG0_TPG_NUM_SEL, phy- 
>>> >csiphy_id + 1);
>>> +            val |= CSI2_RX_CFG0_TPG_NUM_EN;
>> Can we rename this to CSI2_RX_CFG0_TPG_MUX_EN?
> 
> ACK
> 
>>> +        }
>>> +    }
>>> +
>>>       writel(val, csid->base + CSID_CSI2_RX_CFG0);
>>>       val = CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN;
>>> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/ 
>>> drivers/media/platform/qcom/camss/camss-csid-gen3.c
>>> index 
>>> 664245cf6eb0cac662b02f8b920cd1c72db0aeb2..5f9eb533723f2864df64fd6c63e2682fed4a12ae 100644
>>> --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
>>> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
>>> @@ -66,6 +66,8 @@
>>>   #define        CSI2_RX_CFG0_VC_MODE        3
>>>   #define        CSI2_RX_CFG0_DL0_INPUT_SEL    4
>>>   #define        CSI2_RX_CFG0_PHY_NUM_SEL    20
>>> +#define        CSI2_RX_CFG0_TPG_NUM_EN        BIT(27)
>>> +#define        CSI2_RX_CFG0_TPG_NUM_SEL    GENMASK(29, 28)
>>>   #define CSID_CSI2_RX_CFG1        0x204
>>>   #define        CSI2_RX_CFG1_ECC_CORRECTION_EN    BIT(0)
>>> @@ -109,11 +111,23 @@ static void __csid_configure_rx(struct 
>>> csid_device *csid,
>>>                   struct csid_phy_config *phy, int vc)
>> Same as above.
> 
> ACK
> 
>>>   {
>>>       int val;
>>> +    struct camss *camss;
>>> +    struct tpg_device *tpg;
>>> +    camss = csid->camss;
>>>       val = (phy->lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
>>>       val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
>>>       val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX) << 
>>> CSI2_RX_CFG0_PHY_NUM_SEL;
>>> +    if (camss->tpg) {
>>> +        tpg = &camss->tpg[phy->csiphy_id];
>>> +
>>> +        if (csid->tpg_linked && tpg->testgen.mode > 0) {
>>> +            val |= FIELD_PREP(CSI2_RX_CFG0_TPG_NUM_SEL, phy- 
>>> >csiphy_id + 1);
>>> +            val |= CSI2_RX_CFG0_TPG_NUM_EN;
>>> +        }
>>> +    }
>>> +
>>>       writel(val, csid->base + CSID_CSI2_RX_CFG0);
>>>       val = CSI2_RX_CFG1_ECC_CORRECTION_EN;
>>> diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/ 
>>> drivers/media/platform/qcom/camss/camss-tpg-gen1.c
>>> new file mode 100644
>>> index 
>>> 0000000000000000000000000000000000000000..d7ef7a1709648406dc59c210d355851397980769
>>> --- /dev/null
>>> +++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
>>> @@ -0,0 +1,257 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + *
>>> + * Qualcomm MSM Camera Subsystem - TPG (Test Patter Generator) Module
>>> + *
>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>> + */
>>> +#include <linux/bitfield.h>
>>> +#include <linux/completion.h>
>>> +#include <linux/io.h>
>>> +#include <linux/kernel.h>
>>> +#include <linux/of.h>
>>> +
>>> +#include "camss-tpg.h"
>>> +#include "camss.h"
>>> +
>>> +#define TPG_HW_VERSION        0x0
>>> +# define HW_VERSION_STEPPING        GENMASK(15, 0)
>>> +# define HW_VERSION_REVISION        GENMASK(27, 16)
>>> +# define HW_VERSION_GENERATION        GENMASK(31, 28)
>>> +
>>> +#define TPG_HW_VER(gen, rev, step) \
>>> +    (((u32)(gen) << 28) | ((u32)(rev) << 16) | (u32)(step))
>>> +
>>> +#define TPG_HW_VER_2_0_0                TPG_HW_VER(2, 0, 0)
>>> +#define TPG_HW_VER_2_1_0                TPG_HW_VER(2, 1, 0)
>>> +
>>> +#define TPG_HW_STATUS        0x4
>>> +
>>> +#define TPG_VC_n_GAIN_CFG(n)        (0x60 + (n) * 0x60)
>> I know why this is here but it may be is better to group this with VC 
>> based registers. In fact, can you please segregate these macros into 
>> sub sections with headings like "TPG global registers", "TPG VC based 
>> registers", "TPG DT based registers" etc. Just for better readability.
> 
> ACK, registers are arranged according to their addresses, and I will 
> mark the global registers.
> 
>>> +
>>> +#define TPG_CTRL        0x64
>>> +# define TPG_CTRL_TEST_EN        BIT(0)
>>> +# define TPG_CTRL_PHY_SEL        BIT(3)
>>> +# define TPG_CTRL_NUM_ACTIVE_LANES    GENMASK(5, 4)
>>> +# define TPG_CTRL_VC_DT_PATTERN_ID    GENMASK(8, 6)
>>> +# define TPG_CTRL_OVERLAP_SHDR_EN    BIT(10)
>>> +# define TPG_CTRL_NUM_ACTIVE_VC        GENMASK(31, 30)
>>> +#  define NUM_ACTIVE_VC_0_ENABLED        0
>>> +#  define NUM_ACTIVE_VC_0_1_ENABLED        1
>>> +#  define NUM_ACTIVE_VC_0_1_2_ENABLED        2
>>> +#  define NUM_ACTIVE_VC_0_1_3_ENABLED        3
>>> +
>>> +#define TPG_VC_n_CFG0(n)    (0x68 + (n) * 0x60)
>>> +# define TPG_VC_n_CFG0_VC_NUM            GENMASK(4, 0)
>>> +# define TPG_VC_n_CFG0_NUM_ACTIVE_DT        GENMASK(9, 8)
>>> +#  define NUM_ACTIVE_SLOTS_0_ENABLED            0
>>> +#  define NUM_ACTIVE_SLOTS_0_1_ENABLED            1
>>> +#  define NUM_ACTIVE_SLOTS_0_1_2_ENABLED        2
>>> +#  define NUM_ACTIVE_SLOTS_0_1_3_ENABLED        3
>> s/NUM_ACTIVE_SLOTS/DT/?, if you really need these macros. Similarly 
>> for VCs enabled.
> 
> ACK
> 
>>> +# define TPG_VC_n_CFG0_NUM_BATCH        GENMASK(15, 12)
>>> +# define TPG_VC_n_CFG0_NUM_FRAMES        GENMASK(31, 16)
>>> +
>>> +#define TPG_VC_n_LSFR_SEED(n)    (0x6C + (n) * 0x60)
>>> +
>>> +#define TPG_VC_n_HBI_CFG(n)    (0x70 + (n) * 0x60)
>>> +
>>> +#define TPG_VC_n_VBI_CFG(n)    (0x74 + (n) * 0x60)
>>> +
>>> +#define TPG_VC_n_COLOR_BARS_CFG(n)        (0x78 + (n) * 0x60)
>>> +# define TPG_VC_n_COLOR_BARS_CFG_PIX_PATTERN        GENMASK(2, 0)
>>> +# define TPG_VC_n_COLOR_BARS_CFG_QCFA_EN        BIT(3)
>>> +# define TPG_VC_n_COLOR_BARS_CFG_SPLIT_EN        BIT(4)
>>> +# define TPG_VC_n_COLOR_BARS_CFG_NOISE_EN        BIT(5)
>>> +# define TPG_VC_n_COLOR_BARS_CFG_ROTATE_PERIOD        GENMASK(13, 8)
>>> +# define TPG_VC_n_COLOR_BARS_CFG_XCFA_EN        BIT(16)
>>> +# define TPG_VC_n_COLOR_BARS_CFG_SIZE_X            GENMASK(26, 24)
>>> +# define TPG_VC_n_COLOR_BARS_CFG_SIZE_Y            GENMASK(30, 28)
>>> +
>>> +#define TPG_VC_m_DT_n_CFG_0(m, n)        (0x7C + (m) * 0x60 + (n) * 
>>> 0xC)
>>> +# define TPG_VC_m_DT_n_CFG_0_FRAME_HEIGHT    GENMASK(15, 0)
>>> +# define TPG_VC_m_DT_n_CFG_0_FRAME_WIDTH    GENMASK(31, 16)
>>> +
>>> +#define TPG_VC_m_DT_n_CFG_1(m, n)        (0x80 + (m) * 0x60 + (n) * 
>>> 0xC)
>>> +# define TPG_VC_m_DT_n_CFG_1_DATA_TYPE        GENMASK(5, 0)
>>> +# define TPG_VC_m_DT_n_CFG_1_ECC_XOR_MASK    GENMASK(13, 8)
>>> +# define TPG_VC_m_DT_n_CFG_1_CRC_XOR_MASK    GENMASK(31, 16)
>>> +
>>> +#define TPG_VC_m_DT_n_CFG_2(m, n)        (0x84 + (m) * 0x60 + (n) * 
>>> 0xC)
>>> +# define TPG_VC_m_DT_n_CFG_2_PAYLOAD_MODE        GENMASK(3, 0)
>>> +/* v2.0.0: USER[19:4], ENC[23:20] */
>>> +# define TPG_V2_VC_m_DT_n_CFG_2_USER_SPECIFIED_PAYLOAD GENMASK(19, 4)
>>> +# define TPG_V2_VC_m_DT_n_CFG_2_ENCODE_FORMAT            GENMASK(23, 
>>> 20)
>> For better readability, can you make these TPG_V2_0_*?
>>> +/* v2.1.0: USER[27:4], ENC[31:28] */
>>> +# define TPG_V2_1_VC_m_DT_n_CFG_2_USER_SPECIFIED_PAYLOAD GENMASK(27, 4)
>>> +# define TPG_V2_1_VC_m_DT_n_CFG_2_ENCODE_FORMAT GENMASK(31, 28)
>>> +
>>> +#define TPG_VC_n_COLOR_BAR_CFA_COLOR0(n)    (0xB0 + (n) * 0x60)
>>> +#define TPG_VC_n_COLOR_BAR_CFA_COLOR1(n)    (0xB4 + (n) * 0x60)
>>> +#define TPG_VC_n_COLOR_BAR_CFA_COLOR2(n)    (0xB8 + (n) * 0x60)
>>> +#define TPG_VC_n_COLOR_BAR_CFA_COLOR3(n)    (0xBC + (n) * 0x60)
>>> +
>>> +/* Line offset between VC(n) and VC(n-1), n form 1 to 3 */
>>> +#define TPG_VC_n_SHDR_CFG    (0x84 + (n) * 0x60)
>>> +
>>> +#define TPG_CLEAR        0x1F4
>>> +
>>> +#define TPG_HBI_PCT_DEFAULT            545    /* 545% */
>>> +#define TPG_VBI_PCT_DEFAULT            10    /* 10% */
>>> +#define PERCENT_BASE                100
>>> +#define BITS_PER_BYTE                8
>>> +
>>> +/* Default user-specified payload for TPG test generator.
>>> + * Keep consistent with CSID TPG default: 0xBE.
>>> + */
>>> +#define TPG_USER_SPECIFIED_PAYLOAD_DEFAULT    0xBE
>>> +#define TPG_LFSR_SEED_DEFAULT            0x12345678
>>> +#define TPG_COLOR_BARS_CFG_STANDARD \
>>> +    FIELD_PREP(TPG_VC_n_COLOR_BARS_CFG_ROTATE_PERIOD, 0xA)
>>> +
>>> +static int tpg_stream_on(struct tpg_device *tpg)
>> Add function headers? For this  and a few other below.
> 
> I received a comment asking me to remove the comments,
> if a function is not called in multiple places or its purpose cannot be 
> directly understood, adding extra documentation is useless.
> 
>>> +{
>>> +    struct tpg_testgen_config *tg = &tpg->testgen;
>>> +    struct v4l2_mbus_framefmt *input_format;
>>> +    const struct tpg_format_info *format;
>>> +    u8 lane_cnt = tpg->res->lane_cnt;
>>> +    u8 dt_cnt = 0;
>>> +    u8 i;
>>> +    u32 val;
>>> +
>>> +    /* Loop through all enabled VCs and configure stream for each */
>>> +    for (i = 0; i < tpg->res->vc_cnt; i++) {
>> Here as well, can we segregate the code to global, VC based and DT 
>> based configs with some comments?
> 
> This loop all contains configurations related to VC/DT.
> Will add some comments for this.
> 
>>> +        input_format = &tpg->fmt[MSM_TPG_PAD_SRC + i];
>>> +        format = tpg_get_fmt_entry(tpg,
>>> +                       tpg->res->formats->formats,
>>> +                       tpg->res->formats->nformats,
>>> +                       input_format->code);
>>> +        if (IS_ERR(format))
>>> +            return -EINVAL;
>>> +
>>> +        val = FIELD_PREP(TPG_VC_m_DT_n_CFG_0_FRAME_HEIGHT, 
>>> input_format->height & 0xffff) |
>>> +              FIELD_PREP(TPG_VC_m_DT_n_CFG_0_FRAME_WIDTH, 
>>> input_format->width & 0xffff);
>>> +        writel(val, tpg->base + TPG_VC_m_DT_n_CFG_0(i, dt_cnt));
>>> +
>>> +        val = FIELD_PREP(TPG_VC_m_DT_n_CFG_1_DATA_TYPE, format- 
>>> >data_type);
>>> +        writel(val, tpg->base + TPG_VC_m_DT_n_CFG_1(i, dt_cnt));
>>> +
>>> +        if (tpg->hw_version == TPG_HW_VER_2_0_0) {
>>> +            val = FIELD_PREP(TPG_VC_m_DT_n_CFG_2_PAYLOAD_MODE, tg- 
>>> >mode - 1) |
>>> + FIELD_PREP(TPG_V2_VC_m_DT_n_CFG_2_USER_SPECIFIED_PAYLOAD,
>>> +                       TPG_USER_SPECIFIED_PAYLOAD_DEFAULT) |
>>> +                FIELD_PREP(TPG_V2_VC_m_DT_n_CFG_2_ENCODE_FORMAT,
>>> +                       format->encode_format);
>>> +        } else if (tpg->hw_version >= TPG_HW_VER_2_1_0) {
>>> +            val = FIELD_PREP(TPG_VC_m_DT_n_CFG_2_PAYLOAD_MODE, tg- 
>>> >mode - 1) |
>>> + FIELD_PREP(TPG_V2_1_VC_m_DT_n_CFG_2_USER_SPECIFIED_PAYLOAD,
>>> +                       TPG_USER_SPECIFIED_PAYLOAD_DEFAULT) |
>>> +                FIELD_PREP(TPG_V2_1_VC_m_DT_n_CFG_2_ENCODE_FORMAT,
>>> +                       format->encode_format);
>>> +        }
>>> +        writel(val, tpg->base + TPG_VC_m_DT_n_CFG_2(i, dt_cnt));
>>> +
>>> +        writel(TPG_COLOR_BARS_CFG_STANDARD, tpg->base + 
>>> TPG_VC_n_COLOR_BARS_CFG(i));
>>> +
>>> +        val = DIV_ROUND_UP(input_format->width * format->bpp * 
>>> TPG_HBI_PCT_DEFAULT,
>>> +                   BITS_PER_BYTE * lane_cnt * PERCENT_BASE);
>>> +        writel(val, tpg->base + TPG_VC_n_HBI_CFG(i));
>>> +        val = input_format->height * TPG_VBI_PCT_DEFAULT / 
>>> PERCENT_BASE;
>>> +        writel(val, tpg->base + TPG_VC_n_VBI_CFG(i));
>>> +
>>> +        writel(TPG_LFSR_SEED_DEFAULT, tpg->base + 
>>> TPG_VC_n_LSFR_SEED(i));
>>> +
>>> +        /* configure one DT, infinite frames */
>> Although this driver is not supporting more than one DT in a VC right 
>> now, is there a way we can make the API generic enough to receive #DTs 
>> in each VS and their dimensions?
> 
> ACK
> 
>>> +        val = FIELD_PREP(TPG_VC_n_CFG0_VC_NUM, i) |
>>> +              FIELD_PREP(TPG_VC_n_CFG0_NUM_FRAMES, 0);
>>> +        writel(val, tpg->base + TPG_VC_n_CFG0(i));
>>> +    }
>>> +
>>> +    val = FIELD_PREP(TPG_CTRL_TEST_EN, 1) |
>>> +          FIELD_PREP(TPG_CTRL_PHY_SEL, 0) |
>> Same here, is there a way to make the API generic to receive CPHY / 
>> DPHY mode required?
> 
> ACK
> 
>>> +          FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
>>> +          FIELD_PREP(TPG_CTRL_VC_DT_PATTERN_ID, 0) |
>> You are assuming frame interleaved mode always. It may be is a good 
>> start but a bunch of functionality is missing here. Just please think 
>> of the scalability of the API even though the driver support is 
>> limited at this point.
> 
> ACK
> 
>>> +          FIELD_PREP(TPG_CTRL_NUM_ACTIVE_VC, tpg->res->vc_cnt - 1);
>>> +    writel(val, tpg->base + TPG_CTRL);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static void tpg_stream_off(struct tpg_device *tpg)
>>> +{
>>> +    writel(0, tpg->base + TPG_CTRL);
>>> +    writel(1, tpg->base + TPG_CLEAR);
>> Why not just reuse the reset function?
> 
> ACK
> 
>>> +}
>>> +
>>> +static int tpg_configure_stream(struct tpg_device *tpg, u8 enable)
>>> +{
>>> +    int ret = 0;
>>> +
>>> +    if (enable)
>>> +        ret = tpg_stream_on(tpg);
>>> +    else
>>> +        tpg_stream_off(tpg);
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +static int tpg_configure_testgen_pattern(struct tpg_device *tpg, s32 
>>> val)
>>> +{
>>> +    if (val >= 0 && val <= TPG_PAYLOAD_MODE_COLOR_BARS)
>>> +        tpg->testgen.mode = val;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +/*
>>> + * tpg_hw_version - tpg hardware version query
>>> + * @tpg: tpg device
>>> + *
>>> + * Return HW version or error
>>> + */
>>> +static u32 tpg_hw_version(struct tpg_device *tpg)
>>> +{
>>> +    u32 hw_version;
>>> +    u32 hw_gen;
>>> +    u32 hw_rev;
>>> +    u32 hw_step;
>>> +
>>> +    hw_version = readl(tpg->base + TPG_HW_VERSION);
>>> +    hw_gen = FIELD_GET(HW_VERSION_GENERATION, hw_version);
>>> +    hw_rev = FIELD_GET(HW_VERSION_REVISION, hw_version);
>>> +    hw_step = FIELD_GET(HW_VERSION_STEPPING, hw_version);
>>> +
>>> +    tpg->hw_version = hw_version;
>>> +
>>> +    dev_dbg_once(tpg->camss->dev, "tpg HW Version = %u.%u.%u\n",
>>> +             hw_gen, hw_rev, hw_step);
>>> +
>>> +    return hw_version;
>>> +}
>>> +
>>> +/*
>>> + * tpg_reset - Trigger reset on tpg module and wait to complete
>> Doesn't seem like there is any wait here, right?
> 
> Do you have any suggestions on this? I noticed that there is no delay 
> downstream either.
> 
>> Also, do you want to clear the IRQs in reset?
> 
> Following the maintainer's suggestion, I removed IRQ support, but we do 
> need to add IRQ clearing.
> 
>>> + * @tpg: tpg device
>>> + *
>>> + * Return 0 on success or a negative error code otherwise
>>> + */
>>> +static int tpg_reset(struct tpg_device *tpg)
>>> +{
>>> +    writel(0, tpg->base + TPG_CTRL);
>>> +    writel(1, tpg->base + TPG_CLEAR);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static void tpg_subdev_init(struct tpg_device *tpg)
>>> +{
>>> +    tpg->testgen.modes = testgen_payload_modes;
>>> +    tpg->testgen.nmodes = TPG_PAYLOAD_MODE_NUM_SUPPORTED_GEN1;
>>> +}
>>> +
>>> +const struct tpg_hw_ops tpg_ops_gen1 = {
>>> +    .configure_stream = tpg_configure_stream,
>>> +    .configure_testgen_pattern = tpg_configure_testgen_pattern,
>>> +    .hw_version = tpg_hw_version,
>>> +    .reset = tpg_reset,
>>> +    .subdev_init = tpg_subdev_init,
>>> +};
>>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/ 
>>> media/platform/qcom/camss/camss.c
>>> index 
>>> 43fdcb9af101ef34b118035ca9c68757b66118df..5cddf1bc09f97c2c61f907939bb54663d8eab3d4 100644
>>> --- a/drivers/media/platform/qcom/camss/camss.c
>>> +++ b/drivers/media/platform/qcom/camss/camss.c
>>> @@ -3199,6 +3199,65 @@ static const struct camss_subdev_resources 
>>> csiphy_res_8775p[] = {
>>>       },
>>>   };
>>> +static const struct camss_subdev_resources tpg_res_8775p[] = {
>>> +    /* TPG0 */
>>> +    {
>>> +        .regulators = {  },
>>> +        .clock = { "camnoc_rt_axi", "cpas_ahb", "csiphy_rx" },
>> Why should TPG need camnoc_rt_axi clk?
> 
> As tested ,TPG can`t streaming without camnoc_rt_axi clk.
> For Pixel path, some platform can stream without camnoc_rt_axi clk but 
> TPG not.
> 
It is not the expected behavior. There is no path from TPG to CAMNOC / 
DDR. TPG only drives the pattern data from the internal engine to CSID 
and you will only need CAMNOC_RT_AXI clock when the data is written from 
IFE WM to the DDR over CAMNOC, which anyway will be enabled from the IFE 
device. We can check this further together. Thanks.
>>> +        .clock_rate = {
>>> +            { 400000000 },
>>> +            { 0 },
>>> +            { 400000000 },
>>> +        },
>>> +        .reg = { "tpg0" },
>>> +        .interrupt = { "tpg0" },
>>> +        .tpg = {
>>> +            .lane_cnt = 4,
>>> +            .vc_cnt = 1,
>>> +            .formats = &tpg_formats_gen1,
>>> +            .hw_ops = &tpg_ops_gen1
>>> +        }
>>> +    },
>>> +
>>> +    /* TPG1 */
>>> +    {
>>> +        .regulators = {  },
>>> +        .clock = { "camnoc_rt_axi", "cpas_ahb", "csiphy_rx" },
>>> +        .clock_rate = {
>>> +            { 400000000 },
>>> +            { 0 },
>>> +            { 400000000 },
>>> +        },
>>> +        .reg = { "tpg1" },
>>> +        .interrupt = { "tpg1" },
>>> +        .tpg = {
>>> +            .lane_cnt = 4,
>>> +            .vc_cnt = 1,
>>> +            .formats = &tpg_formats_gen1,
>>> +            .hw_ops = &tpg_ops_gen1
>>> +        }
>>> +    },
>>> +
>>> +    /* TPG2 */
>>> +    {
>>> +        .regulators = {  },
>>> +        .clock = { "camnoc_rt_axi", "cpas_ahb", "csiphy_rx" },
>>> +        .clock_rate = {
>>> +            { 400000000 },
>>> +            { 0 },
>>> +            { 400000000 },
>>> +        },
>>> +        .reg = { "tpg2" },
>>> +        .interrupt = { "tpg2" }, + .tpg = { + .lane_cnt = 4, 
>>> + .vc_cnt = 1, + .formats = &tpg_formats_gen1, + .hw_ops = 
>>> &tpg_ops_gen1 + } + }, +}; + static const struct 
>>> camss_subdev_resources csid_res_8775p[] = { /* CSID0 */ { @@ -3595,6 
>>> +3654,62 @@ static const struct camss_subdev_resources 
>>> csiphy_res_x1e80100[] = { }, }; +static const struct 
>>> camss_subdev_resources tpg_res_x1e80100[] = { + /* TPG0 */ + 
>>> { + .regulators = { }, + .clock = { "camnoc_rt_axi", "cpas_ahb", 
>>> "csid_csiphy_rx" },
>>> +        .clock_rate = {
>>> +            { 400000000 },
>>> +            { 0 },
>>> +            { 400000000 },
>>> +        },
>>> +        .reg = { "csitpg0" },
>>> +        .tpg = {
>>> +            .lane_cnt = 4,
>>> +            .vc_cnt = 1,
>>> +            .formats = &tpg_formats_gen1,
>>> +            .hw_ops = &tpg_ops_gen1
>>> +        }
>>> +    },
>>> +
>>> +    /* TPG1 */
>>> +    {
>>> +        .regulators = {  },
>>> +        .clock = { "camnoc_rt_axi", "cpas_ahb", "csid_csiphy_rx" },
>>> +        .clock_rate = {
>>> +            { 400000000 },
>>> +            { 0 },
>>> +            { 400000000 },
>>> +        },
>>> +        .reg = { "csitpg1" },
>>> +        .tpg = {
>>> +            .lane_cnt = 4,
>>> +            .vc_cnt = 1,
>>> +            .formats = &tpg_formats_gen1,
>>> +            .hw_ops = &tpg_ops_gen1
>>> +        }
>>> +    },
>>> +
>>> +    /* TPG2 */
>>> +    {
>>> +        .regulators = {  },
>>> +        .clock = { "camnoc_rt_axi", "cpas_ahb", "csid_csiphy_rx" },
>>> +        .clock_rate = {
>>> +            { 400000000 },
>>> +            { 0 },
>>> +            { 400000000 },
>>> +        },
>>> +        .reg = { "csitpg2" },
>>> +        .tpg = {
>>> +            .lane_cnt = 4,
>>> +            .vc_cnt = 1,
>>> +            .formats = &tpg_formats_gen1,
>>> +            .hw_ops = &tpg_ops_gen1
>>> +        }
>>> +    },
>>> +};
>>> +
>>>   static const struct camss_subdev_resources csid_res_x1e80100[] = {
>>>       /* CSID0 */
>>>       {
>>> @@ -4674,6 +4789,13 @@ static int camss_probe(struct platform_device 
>>> *pdev)
>>>       if (!camss->csiphy)
>>>           return -ENOMEM;
>>> +    if (camss->res->tpg_num > 0) {
>>> +        camss->tpg = devm_kcalloc(dev, camss->res->tpg_num,
>>> +                      sizeof(*camss->tpg), GFP_KERNEL);
>>> +        if (!camss->tpg)
>>> +            return -ENOMEM;
>>> +    }
>>> +
>>>       camss->csid = devm_kcalloc(dev, camss->res->csid_num, 
>>> sizeof(*camss->csid),
>>>                      GFP_KERNEL);
>>>       if (!camss->csid)
>>> @@ -4863,11 +4985,13 @@ static const struct camss_resources 
>>> qcs8300_resources = {
>>>       .version = CAMSS_8300,
>>>       .pd_name = "top", .csiphy_res = csiphy_res_8300, + .tpg_res = 
>>> tpg_res_8775p, .csid_res = csid_res_8775p, .csid_wrapper_res = 
>>> &csid_wrapper_res_sm8550, .vfe_res = vfe_res_8775p, .icc_res = 
>>> icc_res_qcs8300, .csiphy_num = ARRAY_SIZE(csiphy_res_8300), 
>>> + .tpg_num = ARRAY_SIZE(tpg_res_8775p), .csid_num = 
>>> ARRAY_SIZE(csid_res_8775p), .vfe_num = 
>>> ARRAY_SIZE(vfe_res_8775p), .icc_path_num = 
>>> ARRAY_SIZE(icc_res_qcs8300), @@ -4877,11 +5001,13 @@ static const 
>>> struct camss_resources sa8775p_resources = { .version = 
>>> CAMSS_8775P, .pd_name = "top", .csiphy_res = csiphy_res_8775p, 
>>> + .tpg_res = tpg_res_8775p, .csid_res = 
>>> csid_res_8775p, .csid_wrapper_res = 
>>> &csid_wrapper_res_sm8550, .vfe_res = vfe_res_8775p, .icc_res = 
>>> icc_res_sa8775p, .csiphy_num = ARRAY_SIZE(csiphy_res_8775p), 
>>> + .tpg_num = ARRAY_SIZE(tpg_res_8775p), .csid_num = 
>>> ARRAY_SIZE(csid_res_8775p), .vfe_num = 
>>> ARRAY_SIZE(vfe_res_8775p), .icc_path_num = 
>>> ARRAY_SIZE(icc_res_sa8775p), @@ -4992,11 +5118,13 @@ static const 
>>> struct camss_resources x1e80100_resources = { .pd_name = "top",
>>>       .csiphy_res = csiphy_res_x1e80100,
>>>       .csid_res = csid_res_x1e80100,
>>> +    .tpg_res = tpg_res_x1e80100,
>>>       .vfe_res = vfe_res_x1e80100,
>>>       .csid_wrapper_res = &csid_wrapper_res_x1e80100,
>>>       .icc_res = icc_res_x1e80100,
>>>       .icc_path_num = ARRAY_SIZE(icc_res_x1e80100),
>>>       .csiphy_num = ARRAY_SIZE(csiphy_res_x1e80100),
>>> +    .tpg_num = ARRAY_SIZE(tpg_res_x1e80100),
>>>       .csid_num = ARRAY_SIZE(csid_res_x1e80100),
>>>       .vfe_num = ARRAY_SIZE(vfe_res_x1e80100),
>>>   };
>>
>> Thanks,
>>
>> Vijay.
>>
> 
> Thanks,
> Wenmeng


