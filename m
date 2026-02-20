Return-Path: <linux-media+bounces-53117-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qD/yJUH9l2kf/AIAu9opvQ
	(envelope-from <linux-media+bounces-53117-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Feb 2026 07:20:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E4455164ED6
	for <lists+linux-media@lfdr.de>; Fri, 20 Feb 2026 07:20:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DEF83021E55
	for <lists+linux-media@lfdr.de>; Fri, 20 Feb 2026 06:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C97A632BF55;
	Fri, 20 Feb 2026 06:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aEtIi2Fe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VCsWyZnJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2BC1D555
	for <linux-media@vger.kernel.org>; Fri, 20 Feb 2026 06:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771568443; cv=none; b=N2RnsgmGkK63N1jeCghIzz+EszDQtUf8jVMUcqyqimGrO9s/ieT3I00mMxd2Ung46VTyg3Oq9QcEAYH7bn0Idb1qNqO8NW5MRbQgSplmcP6KCXpW9NdL781Wq+uDVRsUNrftLwCxYxVGCfJjBnw3fUyBuovY+jWN0ZAmcOgkxHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771568443; c=relaxed/simple;
	bh=/Ee0MDttlo0ZLU+/gvshDdigqAF2ajUDwDe5lx5K2lw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nTUSwdsxXI7igsPp89ZvzMlV6BXfF4DtagFiXKZIVGj+DCnGpSQ+aerUDq/ZAww9DEkcApr6L/2CWthY3wPTDGEToG55fMbR9n4Ho3whCqf5BJbxZ8NfGfg3D9C4Ef3s+YBScHko9VQvK1Qcp/S4uUyIcJY7EhJqu4PwX5lkhlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aEtIi2Fe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VCsWyZnJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61K5S9aS3337682
	for <linux-media@vger.kernel.org>; Fri, 20 Feb 2026 06:20:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mybsvf91+c0jUlm8F+KdP2UDzK9GF9JRuERWkTSLC1c=; b=aEtIi2FeSddDfvN2
	OHRYwpC5ig++XKUyn9znl/s1jlbWfEenOAfEMnK54xBKgrzOp4/r5RH8pe8+FrBL
	KhWLsXV+fkC0Ml1N8Naxw5Ntix+i76R8HQhMetBHfUvL/KbgHKqdMObIObSar4ZQ
	LzbFSHZkOXDBtxvGbatq/66L6qXlurGhSfqa/NNEa9PTB6ZN6FJXFtFFJNoCUZp6
	yJS8Rmjj59Q+j6YPuOFpaQebZwl36I2/pgTfo2nW83e2zvj1qrgfxQL7+FYFkXFG
	FlsxMIEvV9of/lydX+HGTqf1xgFR+7GkhInP/HGWPbNjypQ24cfSAWqq5pcx4Cn5
	kXqrgA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cedp6gp6d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 20 Feb 2026 06:20:41 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c6e1e748213so1137214a12.2
        for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 22:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771568440; x=1772173240; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mybsvf91+c0jUlm8F+KdP2UDzK9GF9JRuERWkTSLC1c=;
        b=VCsWyZnJ1fL/9bisA5zr3fXp31zeeZEMbu/IMsRlKdImGH3BlCGVmyhe2wkuJOBYmw
         ueI1wIwe7M3ppggc5H2qHrp5CZ6MKsg0yGWc6KCT3Srjhm26hQWToGxQI9KXSyINqV0o
         XZGYfqKA3V3rlnzO31QaBPjmLTa6g30Pfo7oSTOWjcViFaZxdxAeaFVv9EcZsX7XLqxX
         7+zIzQ4aa4ZbuwosM9fqgG+edqrvIYR0G4PUZpMQjE4JPWn7qYAF2WC7AUsOWBdX2IJh
         iXHHTvDjsNybKRgIZCTBAKCwr6edUwu3eyjktuCdXcy4Htft39vddizW29xqoxA0YaOn
         66tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771568440; x=1772173240;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mybsvf91+c0jUlm8F+KdP2UDzK9GF9JRuERWkTSLC1c=;
        b=l66qsJTabbikp77RbR4TD31kdQ3rvo1ZLnqvBb5SEbm5OUZbdsog06LeFXS/zMnhbg
         1q0skvIVVRSLpSdepyIz2T4UmAn6OpxDIbDQiWUBzeZYexmJZ6oXPCBRj6x0XFHCkSv7
         XPX/gL5qlkQPCGk/TxalAqkmOYcnIdndI7SFc7oY0nCGS7PNZfEV35qbQwyqtVY1GscF
         JBSyEJb8CGneHs7GEO0Us2LcVrNvtqV2p2oR+3wLgzZuYtce62fjzpeYspV8XSUMSmgo
         dYR4wUlumEWwiZl2J8l6d7K5IiRwwN2EBxnJK2+ileST9ezlCbRPwhNLExJEtJSwSapu
         nx7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVhaIENnyD+1hFvKO+/82sjKB7MerlIoM0iSl1UdabB1mhT/B2qwRpoeZm/yXGUkj3S5dxGtr6TaUzscg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUSRNavyzHtqcXtaOI5THcZ9BK6XCrCn63iSbqjon4TAjSNwi0
	rsIEydSVnh0473toL/ymOWX64p7eXqho1SG9vF+rwhh1oOrk1vpbWaodIPPyoeYt/L/oj3G4L3I
	sLsDS3CCNK2wOvNYlMszCohcZjzOhYpwX00Kldza47Fsz3EIro2SA6Q7MyCat9WuXtA==
X-Gm-Gg: AZuq6aJHHu9hPogBqdSNbqs/Y3e2ayNvSj+KXtRtFHTZProsW7emT6k3nL5o8yjSTX2
	ZT/Netp6uuHNPL3fvgiMJ/A6ijVgbQieSUXeU0COCeOamtgy3pnHVaE6cXojGOqy2dq6ojhyppO
	1b4mta6YKF7eVTT3c7xrlJNyC19yeI8XH80ENFJGlKXa6ymX8zIkRCJ5KXzJ1JzRYs3IgYSOVoV
	3SNa6AHfBuMwtYOxu8fySqtqo/bcyExaPqyv2xMHt1/Il7y7fxJ8evyo9U7LRckkQOoKFiaEcyx
	cT9uDVcE/DFJaSZIB4DqLoJEqOkCai/fsEPRTxj8pvJ/xlXmVeOQ/9IvatdVkOuZwCOIbZwgVsx
	g40FKDPkWU993kqGqnykyCbi6RdrpgOITq7pAUffWRys7oPX6c/Y=
X-Received: by 2002:a05:6a00:1746:b0:81f:3fbd:ccf with SMTP id d2e1a72fcca58-825274bc309mr7361812b3a.23.1771568440403;
        Thu, 19 Feb 2026 22:20:40 -0800 (PST)
X-Received: by 2002:a05:6a00:1746:b0:81f:3fbd:ccf with SMTP id d2e1a72fcca58-825274bc309mr7361787b3a.23.1771568439874;
        Thu, 19 Feb 2026 22:20:39 -0800 (PST)
Received: from [10.0.0.3] ([106.222.231.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6b94b80sm21341339b3a.55.2026.02.19.22.20.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 22:20:39 -0800 (PST)
Message-ID: <06059a6c-96ef-f6f0-ded0-e536fd46c3b2@oss.qualcomm.com>
Date: Fri, 20 Feb 2026 11:50:35 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/2] media: iris: Enable Gen2 HFI on SC7280
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260209-iris_sc7280_gen2_support-v1-0-390000a4fa39@oss.qualcomm.com>
 <20260209-iris_sc7280_gen2_support-v1-2-390000a4fa39@oss.qualcomm.com>
 <0da582a6-5bba-4450-99ec-cf57b67915e6@oss.qualcomm.com>
 <0a324898-092b-3e44-c35c-15de20b50f40@oss.qualcomm.com>
 <2uih6xdzarkwnvhlhv5kznmdwo4jorqvsrb7xxrxgr6vprx3ey@4kx45k5i3c4y>
 <6b9042c8-767e-0fdb-9012-f3790899509e@oss.qualcomm.com>
 <f9f40ac7-e6fe-41eb-92e4-311913567ef0@oss.qualcomm.com>
 <b759fb04-22b7-cd5c-9e53-f4ffe9f37dc5@oss.qualcomm.com>
 <nb576n2risxl5mabotlu3idmoztedrblur4gbvdlk4cu3mtiqq@ecezsux4w7jz>
 <2f85b131-2167-838c-152a-03be689b0b29@oss.qualcomm.com>
 <ed9a5194-356a-4c18-8ddb-c1017e87fb7b@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <ed9a5194-356a-4c18-8ddb-c1017e87fb7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDA1MyBTYWx0ZWRfXwrHoKA+icJFL
 adrTqT7o0BfYtQqOu0ikMn83hWsrW9W5OBwx7PoDT9SZMVlZQGNpKggTbyIOpaKhcIA6yz5htXS
 +LXgGZfehDoh7DNHpN61iUi36IEYxdgxKhrbz+CqZneNAnvDEFWxuJxhL1V/vUDEdjsARkxQIEp
 wnxYkSZsSUAMJAi/bf+wFumTkANcVuYBUEGRx9DWYZR3PILywQ1txiU7dVXz/myNNKD5xD+SvK0
 NA4SAcllWxpvM3m7zW7vJmrdkfWZllD8SqHyi3YOmGkD5KuMFavOpoV4XUR79YAa/DmF2/U3uRh
 ZitUBOzhuo3PHU/Q6vLBh4Ek/qe8wOyX+8Ql91bnYG0NNStIvzvY92xedtDRgLTrKiKa8QsP8Pi
 Z7uZHQRu13b7/JmSmVBZ75pZbecid3YuIVcFEaTo+jjcGLj8hA8s2wkqStnd9WTAPXnZqC6QsSV
 nENiMmGUZ2rP1hny2Kg==
X-Proofpoint-ORIG-GUID: TDCi1hfbXdI3OxuCeeD7bGktFOK8oiCU
X-Authority-Analysis: v=2.4 cv=Vuouwu2n c=1 sm=1 tr=0 ts=6997fd39 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=vgTJ3uqYKia970mDUHNZug==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=6zC6iEmdMWnqphWyt5EA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: TDCi1hfbXdI3OxuCeeD7bGktFOK8oiCU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_06,2026-02-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602200053
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:url,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53117-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E4455164ED6
X-Rspamd-Action: no action



On 2/17/2026 5:50 PM, Konrad Dybcio wrote:
> On 2/17/26 8:40 AM, Dikshita Agarwal wrote:
>>
>>
>> On 2/13/2026 5:34 PM, Dmitry Baryshkov wrote:
>>> On Thu, Feb 12, 2026 at 06:35:19PM +0530, Dikshita Agarwal wrote:
>>>>
>>>>
>>>> On 2/12/2026 5:13 PM, Konrad Dybcio wrote:
>>>>> On 2/12/26 12:16 PM, Dikshita Agarwal wrote:
>>>>>>
>>>>>>
>>>>>> On 2/9/2026 6:05 PM, Dmitry Baryshkov wrote:
>>>>>>> On Mon, Feb 09, 2026 at 05:04:48PM +0530, Dikshita Agarwal wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 2/9/2026 3:32 PM, Konrad Dybcio wrote:
>>>>>>>>> On 2/9/26 10:45 AM, Dikshita Agarwal wrote:
>>>>>>>>>> SC7280 supports both Gen1 and Gen2 HFI firmware. The driver continues to
>>>>>>>>>> use Gen1 by default, but boards that intend to use Gen2 firmware can
>>>>>>>>>> opt‑in by specifying a Gen2 image through the Device Tree
>>>>>>>>>> 'firmware-name' property.
>>>>>>>>>>
>>>>>>>>>> Based on this property and the availability of the referenced
>>>>>>>>>> firmware binary, the driver selects the appropriate HFI generation and
>>>>>>>>>> updates its platform data accordingly. Boards that do not
>>>>>>>>>> specify a Gen2 firmware, or where the firmware is not present,
>>>>>>>>>> automatically fall back to Gen1.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>>>>>>>>>> ---
>>>>>
>>>>> [...]
>>>>>
>>>>>>>> To avoid accidental matches, I can switch to an exact filename match
>>>>>>>> instead. That way, only the specific Gen2 image (for example
>>>>>>>> "qcom/vpu/vpu20_p1_gen2.mbn") will trigger the Gen2 path, and boards that
>>>>>>>
>>>>>>> How do you detect that for the OEM-signed firmware, which can have
>>>>>>> random name?
>>>>>>>
>>>>>>>> want to use Gen2 can opt in by naming the firmware accordingly.
>>>>>>
>>>>>> I Explored on suggested alternative approaches and seeing some limitation
>>>>>> with the both of them:
>>>>>>
>>>>>> 1. Detecting Gen1/Gen2 by scanning the firmware blob (fw->data)
>>>>>> It is possible to parse QC_IMAGE_VERSION_STRING from the .mbn and  extract
>>>>>> the version string. The issues with this approach :
>>>>>>
>>>>>> - the version string has no explicit marker that identifies Gen1 vs Gen2.
>>>>>>
>>>>>> - This prefix is not a formal ABI, and it is not consistent across SoCs.
>>>>>> Each SoC family uses different naming patterns in the version string.
>>>>>>
>>>>>> Example : For SC7280 Gen1 we currently see:
>>>>>> QC_IMAGE_VERSION_STRING=video-firmware.1.0-<hash> while SM8250 has
>>>>>> QC_IMAGE_VERSION_STRING=VIDEO.VPU.1.0-00119-<>
>>>>>>
>>>>>> So the driver would need SoC‑specific string‑matching rules, which is hard
>>>>>> to maintain if we are looking for a design to address all available SOCs.
>>>>>
>>>>> The only SoC with such distinction today is kodiak. So we can simply check:
>>>>>
>>>>> if (kodiak && strstr(fw->data, "VIDEO.VPU.1.0.")
>>>>> 	hfi = gen2;
>>>>
>>>> Agree, this works for Kodiak. However, Dmitry was also referring to other
>>>> SoCs that may support both Gen1 and Gen2, and at the moment there isn’t a
>>>> generic way to handle that check.
>>>>
>>>> Also, please note that the Kodiak Gen1 firmware uses the string
>>>> video-firmware.1.0, whereas Gen2 uses VIDEO.VPU.3.4.
>>>
>>> This is not quite true. Kodiak Gen2 uses:
>>>
>>> $ strings /lib/firmware/qcom/vpu/vpu20_p1_gen2.mbn | grep VERSION_S
>>> QC_IMAGE_VERSION_STRING=video-firmware.2.4.2-d7a3d5386743efb16b828e08695bea7722cafadd
>>>
>>> A collection of versions quickly captured from what I have here (for
>>> different chips, but for the overall picture):
>>>
>>> HFI Gen1:
>>>
>>> [skipping prehistorical / museum data]
>>> VIDEO.VE.5.2-00023-PROD-2
>>> VIDEO.VE.5.4-00059-PROD-1
>>> VIDEO.VE.6.0-00055-PROD-1
>>> VIDEO.IR.1.0-00005-PROD-4
>>> VIDEO.VPU.1.0-00119-PROD-2
>>> video-firmware.1.0-6804c210603073037fb32640a3dd6a46fe04edd6
>>> video-firmware.1.0-7da9db401e417a006ef915d6c4323f00cdbcf40a
>>> video-firmware.1.0-ed457c183307eff1737608763ca0f23656c95b53
>>> video-firmware.1.1-84a8080bf84fa9ab15b353bf03bea6e548d89d2f
>>>
>>>
>>> HFI Gen2:
>>> vfw-0:rel0095-d1a9e7c4a274aa13e4136500d19262f87ef2c921
>>> vfw-3.1:rel0085-070fa3311d9ef968015fee7fea07198d7eb208a1
>>> vfw-3.1:rel0093-7925621ff52ecb7b1565341042c4e5ffd4fc76ce
>>> vfw-3.5:rel0040-1ded01d0e6dcaef08b8155fd5a02f5b57248d5ca
>>> vfw-4.0:rel0045-25b39e81446baf48716df98dd37099a2103d36ee
>>> video-firmware.2.4-48ec04082362ef1922fec5e20e22f7954b11d736
>>> video-firmware.2.4.2-d7a3d5386743efb16b828e08695bea7722cafadd
>>> video-firmware.3.1-e5aea20c64cb6df9a1c9be99e206053b36424939
>>> video-firmware.3.4-e299f99ffcd086b43a2ccc7c3279ce5df404d693
>>>
>>> It seems we can assume that Gen2 is:
>>> - vfw-0
>>> - vfw-N.M
>>> - video-firmware.N.M where N >= 2
>>>
>>> All other binaries are Gen1.
>>>
>>> Also, we don't even have to query the binary firmware blob.
>>> After the firmware is started, you can read the version string from
>>> smem, saving us from strstr over the firmware image.
>>
>> AFAIK the video/iris firmware doesn't populates its version string into
>> SMEM by default.
>>
>> On venus, the version string appears in SMEM only once the driver
>> explicitly writes it after receiving the version info from the firmware as
>> part of an HFI response.
>> https://elixir.bootlin.com/linux/v6.18-rc5/source/drivers/media/platform/qcom/venus/hfi_msgs.c#L289
>>
>>
>> Iris does not implement this SMEM population path today, and the firmware
>> itself does not publish its version into SMEM automatically. Because of
>> that, reading the version from SMEM is not currently possible for iris.
>>
>> Also, relying on HFI to retrieve the version is not viable for detection
>> because we cannot issue a protocol‑specific HFI command until we already
>> know which HFI generation (Gen1 or Gen2) the currently loaded firmware
>> supports.
>>
>> Due to these constraints, I think, the only possible way is to extract the
>> version from the firmware binary blob itself.
> 
> Looks like both gens use the same iris_hfi_queue_write() logic for issuing
> packets and they both use the largely common iris_hfi_queue_dbg_read() logic
> 
> So, knowing that e.g. HFI_CMD_SYS_INIT (0x10001) and HFI_CMD_INIT (0x01000001)
> seem not to conflict, we should be able to issue say a gen1 command and check
> if we get a timeout, no?

The two HFI generations do share some lower‑level queue infrastructure, but
the command formats and packet layouts for Gen1 and Gen2 differ.

Because of this, sending a Gen1 HFI_CMD_SYS_INIT into a Gen2 firmware (or
vice‑versa) is not safe. The firmware will interpret the buffer strictly
according to its own expected packet layout, and since there is no
protocol‑level version discriminator, it has no way to recognize that the
host used the wrong HFI format.

Additionally, using a timeout as a discriminator is unreliable. If we issue
a command and receive no response, we cannot differentiate whether it due
to using the wrong HFI generation, or due to a genuine sys_init failure.

So, I will proceed with implementing the solution based on reading the
firmware blob, extracting the version string, and switching between Gen1
and Gen2 HFI accordingly. This avoids protocol ambiguity and does not
require the firmware to support any additional detection mechanism.

Thanks,
Dikshita

> 
> Konrad

