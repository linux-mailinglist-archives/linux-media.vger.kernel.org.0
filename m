Return-Path: <linux-media+bounces-59393-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJd7He3r6Wm2nAIAu9opvQ
	(envelope-from <linux-media+bounces-59393-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 11:52:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1EC4500BB
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 11:52:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 14DB73007532
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 09:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F3F0374E45;
	Thu, 23 Apr 2026 09:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HONcNDMy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ErMUMcoJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614E33815DB
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 09:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776937958; cv=none; b=TwkNPiVaN8quByels9pKWMvwUlO/3LJrTieIHLTEmwfRRMicUAcdIAvXaTnq8P6o1JX5+kOT3BwoSUT675SnvQKRrnz5I2MtAYX2gWOSqgSo6fXWxwFqSEYyXDqi8IRLiQLOoPc8XjUbASTYsMmA29QP5a6COOUHwBzicuvfVt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776937958; c=relaxed/simple;
	bh=aghY0mkvOIX5kWMQxuTBdzCX8oTd7j2m+sIN2P2xveA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k3zW73QnHlBJ8U5FBE4GQBTs0Yl3kqSjPDNSe07BamzPHv5azYVbcvA/J7LKFOeBji+L8tuAscbiJGQZrtYYYU1et2gpSGVB2ujhq6X+or4Sjmmc7QJi55/lIxCnyQCXl9ax0B1Q34vvh/Rcw+NI3P/lCSKLVpjyUANPnfIFZ18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HONcNDMy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ErMUMcoJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uFkm180881
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 09:52:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iRbyqna0R9V5j2eqn0kZFVeAKLMYFNPMB99FPVqZ3KE=; b=HONcNDMya+Pusp2E
	knzZ+LiIc4G4qMCv4YAJzQpg+I3EUtrjnuz8/oCzk4jkwI+DcagqStjmOEr0PPyd
	oacCf9CsrhbrogCEiJnRuzAhrvcdLtie2v/Vw7p8W6uGcLsFULSb+Ppuune8K2Gf
	kQeYBJELnVqaR+R8RXvfZjVBR+riHL1Xt1A2yGqy7UD80L+TVvNaQ3zPNONWjNSb
	xHWE43T+eVx8eT/Bau+6r/OUgqZ8iTPGLF9CeAerH7IVf9roW1KVJ5FpFaU+pXor
	2OoWoOpwlYo7UGUatjO74AnLyky1suWb/+SSwvRlrsDzphCNqCPehBj0j6RjRoh1
	wb/3HQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqe62gtk6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 09:52:29 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b24e9b4d82so67306095ad.1
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 02:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776937949; x=1777542749; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iRbyqna0R9V5j2eqn0kZFVeAKLMYFNPMB99FPVqZ3KE=;
        b=ErMUMcoJyNvQfg1DVDQahNCHdXLVWhYfMHoSMR7kVT8xJ7Trol5aB3cvj8pEdbd+yc
         lvsvHU+NZOGBBXUAGCX6vJxAoUMv7WwBdjZaaI03H4tAkz/atB/E2cXERm+gxjnP3OFk
         zO1oJAcXRCJS97vwLs/8juleQSzzQw7QIVV+TrMu4N7rgoxA1752Cmg4AU+kcPBq+hWt
         pLhJQZACXYpUw0KeachYtccRbls0KeDuaMKA+x9oSOgzUMViHhVFoYRdvY+JGzZx6sdo
         0BIXcbw79xbPOtbnlTgP4I2/ZXf9iPWzzyDvAnwhV5I+f8HxZRvQ0j19heWu8lMb91r0
         1r9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776937949; x=1777542749;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iRbyqna0R9V5j2eqn0kZFVeAKLMYFNPMB99FPVqZ3KE=;
        b=eemw3V9trt/stwuNKGTWKsTZmlsfJPFGNrVTehT9CfmN6KQEtG9Fq0U/00LtM2lEQC
         DG1EKrHhaDfUdAtWui/UaKw6cqAKYF7Ha47/Q5CApN7jNiCi+NYVUMA9Pd9gmITh2qtR
         fart/FeSad4P9Uw0+5zhGoLTEpJFVCnBmQ81lKLe3+JQdI7YPOcjswDEEGVmh0VPkLiK
         ydbNhbYkY7CC0hFKSrT2Bg3LzTgbunjuEvCUuuUb6b6H6CyC3t0aIAbspyJJlwuoa6Xv
         P/Wge5Ild4tiSegTndMVbQFnK/9LqiAO+KWlkgvrv44I6X5PqtjcZ9e/oEcP2Oo/bkAZ
         gM8g==
X-Gm-Message-State: AOJu0YxbyECo27TJnvAPsLzBnmxg85K0a1SyVNqEBFQ7CWRSrohgHSIb
	JHT0M5CpfA50IxF1t1gHUieXhmePuqtdAKdtv/FC7fK1VoChK/ATdvzAedz+bpOR+32aVI6IuHC
	TIAhH/08YxumC5cPlx1yUip1h7CsUU9yYgQqVjYnD6NNYw9cuz9G2vPbe/iT3Tq4odg==
X-Gm-Gg: AeBDieu8tqb4vJr6gDLkc3Ky5CBLM8fNrPX1Uzrz+5lzMuYyofZ1nTAXffOfraq3yDG
	HZCkpnP32bm9/f37GZ+ZFhVMXVUh0Z9+IeFOVsnk1d/meickh2jL6rHpfdIidgC/s2tQiTBSumg
	RjButuIHtjkFavmFonGDLZj0v3K9RTVIySnOavdKCiRs2LqXUvzRybA16yd4V1BPAp6rRk3qXeL
	KDmrOwMCirS5LAWTY8kzkwDElse/UMFg76yKRJCBQpRyDRKWtEwSEoBBq95GluP14UW1f5iHxqo
	9fOq2Q/oU1T/Qo36rKgbYnOb46gYbzmH7+8NqywYwcgfK3sDmLTyWTGUxgTOXMrqs++VfAP1c4h
	Fw2FncVwYXH5BdYWBkYYShpxkQfXKTdRNHRebsmIXezjBOcn37T/0mfJZHaZkFOI+
X-Received: by 2002:a17:903:b8e:b0:2b0:b258:2a57 with SMTP id d9443c01a7336-2b5f9ef72bbmr214763535ad.27.1776937948585;
        Thu, 23 Apr 2026 02:52:28 -0700 (PDT)
X-Received: by 2002:a17:903:b8e:b0:2b0:b258:2a57 with SMTP id d9443c01a7336-2b5f9ef72bbmr214763235ad.27.1776937948120;
        Thu, 23 Apr 2026 02:52:28 -0700 (PDT)
Received: from [10.0.0.4] ([106.222.228.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff3a8sm178288885ad.12.2026.04.23.02.52.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 02:52:27 -0700 (PDT)
Message-ID: <13f370b9-5f0b-ec97-845e-78a5d6bf9a51@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 15:22:22 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 4/7] media: qcom: iris: Remove dead assignment in
 iris_hfi_gen2_set_tier()
Content-Language: en-US
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260422-iris-code-improvement-v1-0-8e150482212d@oss.qualcomm.com>
 <pMR47_XdB_z0Q6ieCjXZ7n42_j8v68qYRmZdrDew6vKoTv40_GXztPIY1wFWEBr69JxwD8yDpCpzg2qhrw-IgA==@protonmail.internalid>
 <20260422-iris-code-improvement-v1-4-8e150482212d@oss.qualcomm.com>
 <bf19392b-7d48-44ec-93e9-4a2ced795174@kernel.org>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <bf19392b-7d48-44ec-93e9-4a2ced795174@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: m7zCvU9k72bk12nJNCHk901lgfZM86dv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA5NiBTYWx0ZWRfX6NSN+PMSw7ro
 8k/xNfqJFWaAwhrYaH/mZzSw9wzFi8ouokCSvEYKMecqdyZvImZPCyhKSXzgEDbdoOIlclp3Rtk
 lYJhDGUlAzbNkivqwrVUUrQIlRnE6prfaPMrOJr5Ykm70hbQJL6LzaLSjHgL8IO9CmsvN1mEMU2
 uhbsSHcptzIzyP0WSKMH4AX5h8azxLZR8JNAMiQlkV+4fBfuIvATXpSXX811SB9LDDH73NLLNgp
 5v2CmCMyum1v6LpZ9MTi53BMNfJ98WQ/UEmrqfJ/fawRNHpH3OwrfcQVlWu61YX+8ZSnDKH0Mu0
 9g2rhBAvZ1wNZLtAdCVD42IfJtJ/1N7t9ajYdo6a4C9NorvUQDpAPHlR96g+aRPsD1rw7LT8Hq7
 AcmOYigoUrXQfPH4Csk/B66it4lkD9Af3jBKXWv+VkbQoRWwA4nWzhCJ3BZsAaD8FoSbIalvLWt
 ygIKXDROJBc5ZR1YkPg==
X-Proofpoint-ORIG-GUID: m7zCvU9k72bk12nJNCHk901lgfZM86dv
X-Authority-Analysis: v=2.4 cv=Nv7htcdJ c=1 sm=1 tr=0 ts=69e9ebdd cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=rP2ZPG2H70Gfrv7XvIldxw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=l2JAHVFpHO9TSst1FPsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230096
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59393-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DC1EC4500BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/23/2026 2:55 PM, Bryan O'Donoghue wrote:
> On 22/04/2026 12:16, Dikshita Agarwal wrote:
>> Fold the ternary initialiser directly into the variable declaration,
>> removing the dead store that was immediately overwritten.
>>
>> Fixes: 2af481a459a4 ("media: iris: Define AV1-specific platform
>> capabilities and properties")
>> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> index
>> 30bfd90d423ba024caf6ececc827f7102e8f3324..06698fde639ec654ff9ec78a178271ab2284f5f0 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> @@ -536,10 +536,9 @@ static int iris_hfi_gen2_set_tier(struct iris_inst
>> *inst, u32 plane)
>>   {
>>       u32 port = iris_hfi_gen2_get_port(inst,
>> V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>>       struct iris_inst_hfi_gen2 *inst_hfi_gen2 =
>> to_iris_inst_hfi_gen2(inst);
>> -    u32 tier = inst->fw_caps[TIER].value;
>> -
>> -    tier = (inst->codec == V4L2_PIX_FMT_AV1) ?
>> inst->fw_caps[TIER_AV1].value :
>> +    u32 tier = (inst->codec == V4L2_PIX_FMT_AV1) ?
>> inst->fw_caps[TIER_AV1].value :
>>                               inst->fw_caps[TIER].value;
>> +
>>       inst_hfi_gen2->src_subcr_params.tier = tier;
>>
>>       return iris_hfi_gen2_session_set_property(inst,
>>
>> -- 
>> 2.34.1
>>
> 
> I don't get it.
> 
> What's the bug ?

It's not a bug, just removing the dead assignment.
Will remove fixes tag.

Thanks,
Dikshita
> 
> ---
> bod

