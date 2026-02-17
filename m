Return-Path: <linux-media+bounces-52955-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONZZEHUblGn0/wEAu9opvQ
	(envelope-from <linux-media+bounces-52955-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 08:40:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBC11493DA
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 08:40:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 76AD2301CF84
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 07:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43FDB2C15A0;
	Tue, 17 Feb 2026 07:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xdw3wVqR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="atEC8APd"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8026FCA4E
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 07:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771314028; cv=none; b=WcnvQDf+ptPKeg6keyLbw7sCai7V+3qgsmXsh9mQZax9+FTZaoed7GEphOvqXZGrqlfxRPAX7sjpxvoq+W3ioc+21FIe3ubvvgg3fXZKEXffXEegFydVXG/ufHFnw+dOx0fZRq9NplArLJykEbkJ+COAXyr7bWH6h30Xu2fit0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771314028; c=relaxed/simple;
	bh=hDLQGKM9dIV7RFkC9uJgukv9AYJktOn4LBDGaacvpSw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ji0/O5zozY4VA6BJFTE5g55TH1wP0TfeFupNeQLzI8xM6oBc9Igf2GZwgPQys+l7NxcnYc8enauAVsEGaHAYnh4rj1MkvwPb2YfdEdZ4RxZyss+x8bi0Opk+o0u7SjHCcJVMfmBZdGvBSvwZxmVwmV+Q7OPmu57F7rcrHSsY44g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xdw3wVqR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=atEC8APd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GKfCUi1410854
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 07:40:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5iaSBmIn1qyUfIvnkWdm89QHe25+Xo3VgYMyraXjMpw=; b=Xdw3wVqRjNStiYAN
	fJXtCuVeq75AayRe0DlqOivANILY6hTr3gvLMfJuCMr1U7ntSS/CjGqj44TRP3GL
	DntUeCvNij15y8WZwr2m5cEfkqHWLHdt9tjPRWxjxb1Wfa1VD+Qm2OEi+2GUV/dE
	zByFq6FMw3YyWk8AkMSafg0cKgmApWrtP96Ic2o9nTBYqa2ddxQgFk9Mn45ioyOu
	8tmciFjZD+pbTQIRIQuWPYUnUcWGhBWxg1L+M5b2hS1KL/GzlTCEzTuKSV+oSu8s
	lo617Nvn6BY7JpwSvGAg8nccBqKdCFkitJrhlYBgQxy+/xS2kmLmAIuVEQchVYuG
	lKaR3Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc7ap1dr3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 07:40:26 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a8f8c81d02so38242515ad.2
        for <linux-media@vger.kernel.org>; Mon, 16 Feb 2026 23:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771314026; x=1771918826; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5iaSBmIn1qyUfIvnkWdm89QHe25+Xo3VgYMyraXjMpw=;
        b=atEC8APd44ar3KBdZM8cqyJPw+cDiAhstTv1SaqYYcwzos+Nm+L+5keyYqcWpqqGZp
         eFPaR6DrX5krtVUcvQlpTfq3ouFBdeOwQV6/itF5q7LLyMLHfRYFCapRCNf7p0ToYPqR
         /Pi+4ivi7BTBYtZUswCEm7s289MgJtMu5kPTkZrFsWQbZ/kFADz7bi62LkpAry0rIK8Y
         UMeDMgZaNxhoEGg2cCf+BSndAKpDBTLryUoBzPCHHDK9lAAvcCjGfmEHEHfxsJ7+ham/
         uqWyYy4u9cFEgOtW9uPKIKcxz/7nT83L+RKSWFR0YKUre486ivk2jtL6d3uxcsTmGbWO
         +iuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771314026; x=1771918826;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5iaSBmIn1qyUfIvnkWdm89QHe25+Xo3VgYMyraXjMpw=;
        b=rqm8z4kl+ZzGR1ABRQZ7BxY64Q7WQbFWO3lyTGGmDwQ/1Z+y8Wo5Fe+pO5MlM2AMTM
         Xrm/4jeqIrgpmtA+uRCARsb/gJbBMhm/lkRXzEg2Nyznau58lOldsYJhA8XSiR4O+eFA
         VmRmlTLHoRnRaMPUbLMaGZFLeY7fARF/TqARhD5/lhTkenlxGTobNhKVb1XRoGLp4Qwj
         uAw4kchTUJ63kQPBzdkRT0bwwb/9nlgPA1CdGwuc5jjZDGFTiGzg2APXCU97kjUFAybr
         sRoJe0Yy7NRb99M4Lc8GR9d7Av5KpSusHOBKOKqE5g3egY08Ec3L/jecrDQNyNrknmzH
         cECw==
X-Forwarded-Encrypted: i=1; AJvYcCUkxJh/LWTj66gc/E7PaE3dXIbDRIf0VX1UxIxb2aVVQXjf/lgbPqjSFz+rXbe2FQHQ2A4pwe+YWfCSeg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+Kc9v9Kde6e+gGHmFNsesFFzTQPuji7U5S1WMIcLxK1vyPWg+
	QONrP79GNDSDu+D8r1XGJoCQ+uF25xZBI8b98t/QtE0m6hwEoL4TI+tuSdnvn51ySbmPePjgTow
	xCxOdVCeXl0CUGN9w4iCkFgTcUoxNwuzx9jI5ui3I5Mb9ch15Bhl49slhkrn8h7M7cQ==
X-Gm-Gg: AZuq6aIOpqWyZEh4YSViH2WDeloElxJzHqRYf7LfHeH0ji3sDyAoXFmXQoB172op1Pt
	U/a6SkaMidvPzYloX8Ky8IwYlibSCU5uuiC1NcEzl2sAfhpo7IEMO+WWjvOWj5yExGEsvEKC5B+
	BLcmfISFlhYI0+If2p0L0aegENulhFkN0On7ZljWyk7i9ev+xAv5TWJgA6JcODMsln0zKYuARRb
	i1ZbHJ1IWFeZGHxxSkH1IgyOQX4iy0A791ekWD7AHd2PsmXLvsJ1klhuJkNLOaCbMI1SeZmlIYA
	Iclntdme/SRznN7E8Aa89NvdypE+CW2L+tbSgj+hejEhwYlkUxyCY/zexxc76l1YbAD66M5SUNS
	gD6SpFKdkBXu63GPQBLJk8TesbsknRw+S5JcN/plQqM9oWpLSLKfq
X-Received: by 2002:a17:902:d552:b0:2a0:823f:4da6 with SMTP id d9443c01a7336-2ab506101c6mr136269705ad.50.1771314026046;
        Mon, 16 Feb 2026 23:40:26 -0800 (PST)
X-Received: by 2002:a17:902:d552:b0:2a0:823f:4da6 with SMTP id d9443c01a7336-2ab506101c6mr136269515ad.50.1771314025549;
        Mon, 16 Feb 2026 23:40:25 -0800 (PST)
Received: from [10.0.0.3] ([106.222.232.28])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a7138e1sm124543145ad.25.2026.02.16.23.40.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 23:40:25 -0800 (PST)
Message-ID: <2f85b131-2167-838c-152a-03be689b0b29@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 13:10:21 +0530
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
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
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
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <nb576n2risxl5mabotlu3idmoztedrblur4gbvdlk4cu3mtiqq@ecezsux4w7jz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA2MiBTYWx0ZWRfX32g2oHnnXuWA
 fwGtpcfrQBY+qbNn1rJ6jmI1piMRrtmIu7us+HcdjLzGOEq/2bydQoG6zt1oWYQmv3rxVRixgVd
 gJRfjodmw3yR3uf1VjMpsFxOf80T6eEf56MYRqJXOsTbMcnw6ntzKxX55qyfIqsb/Q3E0wm1UN4
 6RpDZoXhxKOb/YEEXIDp4vNlDkCdDqviUjoc3PHCZdAvyvjXwUIK36fpSq0yRv9tLXnHGINDu75
 mGTkjtYY9YFvKo+BQMtah/1Zs0pLuq58OzQoaGNNCMI7hUk1ldxV2q/GMnBt3X0aURcuiliSSha
 IpspFhmuKt05zTxXWpys+A4bPuKCGRavTF+xdtxWJYxBIqbl0ISmtLrQmC5Uw1iK9WXWqPEO56U
 Ha2+E3upnmMWX5y7peafEx4hukPq8l1cLlmjR1GuPe2WQaObfCyUsv39H26Ev40/mi6nHGXkHUc
 Bv/FfcyECHArQbX56Mg==
X-Proofpoint-ORIG-GUID: PFYfh7KhGJuD1jYX_129y4m__K6AWQNG
X-Proofpoint-GUID: PFYfh7KhGJuD1jYX_129y4m__K6AWQNG
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=69941b6a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=wLlKp180pkOCiHd7nYENcw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=P2x2pnpvN4DjWuG0SLoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170062
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-52955-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9CBC11493DA
X-Rspamd-Action: no action



On 2/13/2026 5:34 PM, Dmitry Baryshkov wrote:
> On Thu, Feb 12, 2026 at 06:35:19PM +0530, Dikshita Agarwal wrote:
>>
>>
>> On 2/12/2026 5:13 PM, Konrad Dybcio wrote:
>>> On 2/12/26 12:16 PM, Dikshita Agarwal wrote:
>>>>
>>>>
>>>> On 2/9/2026 6:05 PM, Dmitry Baryshkov wrote:
>>>>> On Mon, Feb 09, 2026 at 05:04:48PM +0530, Dikshita Agarwal wrote:
>>>>>>
>>>>>>
>>>>>> On 2/9/2026 3:32 PM, Konrad Dybcio wrote:
>>>>>>> On 2/9/26 10:45 AM, Dikshita Agarwal wrote:
>>>>>>>> SC7280 supports both Gen1 and Gen2 HFI firmware. The driver continues to
>>>>>>>> use Gen1 by default, but boards that intend to use Gen2 firmware can
>>>>>>>> opt‑in by specifying a Gen2 image through the Device Tree
>>>>>>>> 'firmware-name' property.
>>>>>>>>
>>>>>>>> Based on this property and the availability of the referenced
>>>>>>>> firmware binary, the driver selects the appropriate HFI generation and
>>>>>>>> updates its platform data accordingly. Boards that do not
>>>>>>>> specify a Gen2 firmware, or where the firmware is not present,
>>>>>>>> automatically fall back to Gen1.
>>>>>>>>
>>>>>>>> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>>>>>>>> ---
>>>
>>> [...]
>>>
>>>>>> To avoid accidental matches, I can switch to an exact filename match
>>>>>> instead. That way, only the specific Gen2 image (for example
>>>>>> "qcom/vpu/vpu20_p1_gen2.mbn") will trigger the Gen2 path, and boards that
>>>>>
>>>>> How do you detect that for the OEM-signed firmware, which can have
>>>>> random name?
>>>>>
>>>>>> want to use Gen2 can opt in by naming the firmware accordingly.
>>>>
>>>> I Explored on suggested alternative approaches and seeing some limitation
>>>> with the both of them:
>>>>
>>>> 1. Detecting Gen1/Gen2 by scanning the firmware blob (fw->data)
>>>> It is possible to parse QC_IMAGE_VERSION_STRING from the .mbn and  extract
>>>> the version string. The issues with this approach :
>>>>
>>>> - the version string has no explicit marker that identifies Gen1 vs Gen2.
>>>>
>>>> - This prefix is not a formal ABI, and it is not consistent across SoCs.
>>>> Each SoC family uses different naming patterns in the version string.
>>>>
>>>> Example : For SC7280 Gen1 we currently see:
>>>> QC_IMAGE_VERSION_STRING=video-firmware.1.0-<hash> while SM8250 has
>>>> QC_IMAGE_VERSION_STRING=VIDEO.VPU.1.0-00119-<>
>>>>
>>>> So the driver would need SoC‑specific string‑matching rules, which is hard
>>>> to maintain if we are looking for a design to address all available SOCs.
>>>
>>> The only SoC with such distinction today is kodiak. So we can simply check:
>>>
>>> if (kodiak && strstr(fw->data, "VIDEO.VPU.1.0.")
>>> 	hfi = gen2;
>>
>> Agree, this works for Kodiak. However, Dmitry was also referring to other
>> SoCs that may support both Gen1 and Gen2, and at the moment there isn’t a
>> generic way to handle that check.
>>
>> Also, please note that the Kodiak Gen1 firmware uses the string
>> video-firmware.1.0, whereas Gen2 uses VIDEO.VPU.3.4.
> 
> This is not quite true. Kodiak Gen2 uses:
> 
> $ strings /lib/firmware/qcom/vpu/vpu20_p1_gen2.mbn | grep VERSION_S
> QC_IMAGE_VERSION_STRING=video-firmware.2.4.2-d7a3d5386743efb16b828e08695bea7722cafadd
> 
> A collection of versions quickly captured from what I have here (for
> different chips, but for the overall picture):
> 
> HFI Gen1:
> 
> [skipping prehistorical / museum data]
> VIDEO.VE.5.2-00023-PROD-2
> VIDEO.VE.5.4-00059-PROD-1
> VIDEO.VE.6.0-00055-PROD-1
> VIDEO.IR.1.0-00005-PROD-4
> VIDEO.VPU.1.0-00119-PROD-2
> video-firmware.1.0-6804c210603073037fb32640a3dd6a46fe04edd6
> video-firmware.1.0-7da9db401e417a006ef915d6c4323f00cdbcf40a
> video-firmware.1.0-ed457c183307eff1737608763ca0f23656c95b53
> video-firmware.1.1-84a8080bf84fa9ab15b353bf03bea6e548d89d2f
> 
> 
> HFI Gen2:
> vfw-0:rel0095-d1a9e7c4a274aa13e4136500d19262f87ef2c921
> vfw-3.1:rel0085-070fa3311d9ef968015fee7fea07198d7eb208a1
> vfw-3.1:rel0093-7925621ff52ecb7b1565341042c4e5ffd4fc76ce
> vfw-3.5:rel0040-1ded01d0e6dcaef08b8155fd5a02f5b57248d5ca
> vfw-4.0:rel0045-25b39e81446baf48716df98dd37099a2103d36ee
> video-firmware.2.4-48ec04082362ef1922fec5e20e22f7954b11d736
> video-firmware.2.4.2-d7a3d5386743efb16b828e08695bea7722cafadd
> video-firmware.3.1-e5aea20c64cb6df9a1c9be99e206053b36424939
> video-firmware.3.4-e299f99ffcd086b43a2ccc7c3279ce5df404d693
> 
> It seems we can assume that Gen2 is:
> - vfw-0
> - vfw-N.M
> - video-firmware.N.M where N >= 2
> 
> All other binaries are Gen1.
> 
> Also, we don't even have to query the binary firmware blob.
> After the firmware is started, you can read the version string from
> smem, saving us from strstr over the firmware image.

AFAIK the video/iris firmware doesn't populates its version string into
SMEM by default.

On venus, the version string appears in SMEM only once the driver
explicitly writes it after receiving the version info from the firmware as
part of an HFI response.
https://elixir.bootlin.com/linux/v6.18-rc5/source/drivers/media/platform/qcom/venus/hfi_msgs.c#L289


Iris does not implement this SMEM population path today, and the firmware
itself does not publish its version into SMEM automatically. Because of
that, reading the version from SMEM is not currently possible for iris.

Also, relying on HFI to retrieve the version is not viable for detection
because we cannot issue a protocol‑specific HFI command until we already
know which HFI generation (Gen1 or Gen2) the currently loaded firmware
supports.

Due to these constraints, I think, the only possible way is to extract the
version from the firmware binary blob itself.

Thanks,
Dikshita
> 
>>
>>>
>>>
>>> Can we agree that VIDEO.VPU.x firmwares are hfigen2? If so, problem also
>>> solved for <=8450
>>>
>>
>> Nope. that's not true for all, SM8250 uses VIDEO.VPU.1.0 which is gen1.
>>
>> Thanks,
>> Dikshita
>>
>>> Konrad
> 

