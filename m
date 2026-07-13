Return-Path: <linux-media+bounces-67425-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id a5aOCs1+VGqLmgMAu9opvQ
	(envelope-from <linux-media+bounces-67425-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 07:59:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 797AC747659
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 07:59:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VSRhJ2SE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LxI+daC+;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67425-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67425-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A1DDF301DBA1
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 05:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B2DC33F8BC;
	Mon, 13 Jul 2026 05:59:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EB32EEE84
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 05:59:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783922354; cv=none; b=WURyWkCKG+A0VoPzlp6Yz4vG/+uAJwKYP1FYP757wn3ly0aBG2cSy/4yLa7aV4x5v0JZCxdjYS0HrC5wFAl409K8suYhR1JiYz5dodefYnSPoYWhyHfH6InT1PDM6XdTD+S6qqtmXVeVjd7AHSPX3w8rZC8REmSRcrjwTmQ95VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783922354; c=relaxed/simple;
	bh=HX+M/Ttq0ZpyquSodBklBR55Op7ZDdKhqWQKfRdMHG4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CLUgqEFzjEALxQ58WAHIdmGHE7WxrSejhjAUo3gMe2Lvf61pp0xCDu4pCVez+wTXvX41JkIaB9bgy+rluzY10vh3Xlt2/WHEbP9mCZQp+6U2S04EKAZd4+GFYq0vgHbGkjvQ4MYdSvIq3wZosFwmANRVXR9O2SWz2+J5aScvmUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VSRhJ2SE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LxI+daC+; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D3AcBZ4155588
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 05:59:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OiMBJyfncjVPEQgB7zWBcHtyC1QxrTuPfMovNL1aoRg=; b=VSRhJ2SEK+dupp55
	HeiuTk+fTYSsonaZgXiTwhr9URGuJafBsi5zy1RLSuptCGqrGJLKZjCpbRVL0jr6
	nPSH+Wj8gP6MAvUJYepH9FKqc6oUtFh5996IjBvUo9x5zHsIqgf9+TLnETQaRJ6Y
	8u3BwIgNYSV1ENYxVtEbsjmHzTTz69L854MXWcfKXGH7hhcJGRgBm3XgkS0XUv/u
	88a4VGws+7FeO3ftt5wXrSltdFoCV/KyYSgyUdKm3PW51TcqAaPVhFweqlDJ5Cm6
	u95weUWW/VP6Zu14XM1JHxgjtDnSBtfXfkaU1nT5T1/ksPKCMKPD5DWnYosW7qOK
	3DIOHg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf0gmffv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 05:59:12 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c891ed872ddso4764189a12.2
        for <linux-media@vger.kernel.org>; Sun, 12 Jul 2026 22:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783922352; x=1784527152; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OiMBJyfncjVPEQgB7zWBcHtyC1QxrTuPfMovNL1aoRg=;
        b=LxI+daC+EEhQd987Eb1pHWggag3M04VuF6mgkN3TyWFxm3dvrECrbxK7pjNo1LqoMB
         ZP4U4rXWZl9meyHE7kGwJxXKsWquz7ZianYon3ixKk3jrk6Nh8255kqQraxeRRycjz/4
         ErlMF9S9asMalwnS78t5RIabv+unSPV4sdN23DlGt8f4P0K4aivQepQvrBara+sfjAC6
         v8rlMcI8AAJXbhJ9A8QzTDOtcSLEKG3085LIVLncX9AxiElvfT9TA2VmSDd7c6r0wP3e
         pBg5oISh4rtrw6bn/eg5PRWYCNEXAWxzIktt+wUrSsLGTh1bQX3iqA9zl7KJy37T4d0T
         Z79g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783922352; x=1784527152;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OiMBJyfncjVPEQgB7zWBcHtyC1QxrTuPfMovNL1aoRg=;
        b=AxblG56BD5sOl8/quNAvNtvWTdbzsC7cLB3uH4zM7qUzZnoE3Dy3t0heFuyiVBkpFR
         B415ceo1ghLpfO4dzoePbj0iubRitYOJDNwM3caZzjTs9+Y6dGfGhJ3cpWtxmxo0ubj5
         nab7/jeoiK9jEHdIL/anmaNi8U2v8Jnr5FH5AjRuq2hMNeMIKZc6VLRsxq5MQkwKBQXE
         uq4qxuQ83NjA2cHPrhzGwxartI8VzNeHD5A/ipcD87AA0rSu38mIFp7HaUEabEGEXuz2
         3ZxJxFyEXZKhv0gXKFfQhabrJUTuy7DcigZbjXy8t2GFg8k9WZvDrsyerTPb3t7ew3pr
         CRWA==
X-Forwarded-Encrypted: i=1; AHgh+RpWZ/JeYdzl+XwaQ7fs0E9ic/ONrBWH7sF0imw08XMo27K9qaAMCJjW4Imv7etcjx3WQdIcw/BZIP1TCA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwG8rGd6CbOqnlhN5lKV/XnVgXhmyGfACbMN22cVNK6MiddvDU8
	oHZS3ryRfdLZg3ODGfIOb7UJ1tW9WHhrHXw5XCk+9EST5XriJ2ond94uM+PcRIBlw8Gq1kRO4tS
	Vlo9JyUhVBhIEBubyxHiq7PwHGs40OFxwrPz5IwfTN+stRuVmXcEDbuK3ntLicrJnhQ==
X-Gm-Gg: AfdE7cmTj+wfd1k3Q8neLP47cTbVGdhvGhQ/ptFaRsa9h13dyE50akvaXuWejP1Rd+J
	NWz+G2a5wLxL1rSV3GQ4SwBErKLIfxhxqjQDnABTTBTjobvxozu8r/BQeah9SLOEwtuInmTrUc/
	ZsoGPnrjnpuymYxMZPSvUsnUibmexJGFYssPSoM16LbZV7sLBCZkYlKmpIlpTKJnP2qBZrU+ItH
	5FptRo6JKCAXIoIKs5X5ZVa58W0A8uYxV4B9LpOKb4B3nhCih9d6Z8t9ntgXv3KTVMQfVog93jA
	HJlDbktFIRIM+WMQRj+yQXbmmtO73iV/SlV0rJLSQ0CvIGmBaGgp43o1de9mzdsx5UrkS1PBSu7
	DEOnNvtI07WyyflzltN1aj8L2M2cqSf4PvVdQH7Xa0AwJ
X-Received: by 2002:a05:6a21:3a85:b0:3bf:99fb:db96 with SMTP id adf61e73a8af0-3c110be06e4mr7512425637.49.1783922352239;
        Sun, 12 Jul 2026 22:59:12 -0700 (PDT)
X-Received: by 2002:a05:6a21:3a85:b0:3bf:99fb:db96 with SMTP id adf61e73a8af0-3c110be06e4mr7512404637.49.1783922351644;
        Sun, 12 Jul 2026 22:59:11 -0700 (PDT)
Received: from [10.204.101.214] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm112959204c88.14.2026.07.12.22.59.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2026 22:59:11 -0700 (PDT)
Message-ID: <6326fa2d-b42f-406a-b4ed-3f8b2c35723b@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 11:29:04 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/11] : media: iris: Migrate iommus to iris sub nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <7GAZnP6jPoRrcDnaVzeaB98cONLhtvbiEXV1yD5MJJrA9pCnC9lmlSiCGA8vlDezSXADjmFiqo3ZdClO5SxCFA==@protonmail.internalid>
 <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <c5d190dc-1ba8-4cdf-ad8d-2f86fef4c93f@kernel.org>
 <JSezSF-U8ovzmiyYmssD6k5kLWpRmD9rhrVrKPD1NLY5xKvjkGwoNBtuKpc8t8LhkFj4TSb9T8-gUiOXny-VWw==@protonmail.internalid>
 <f0fa6acb-2d70-4154-96e0-09e88af129e3@oss.qualcomm.com>
 <1c652464-32b7-4411-8ed2-2885234513cc@kernel.org>
 <95a091d8-1b6b-4510-838f-2cd26ad54eff@oss.qualcomm.com>
 <wyheslzmyi3wsocqtvjpiqjsd5kl5m6at4e4rxoa7tj3ej4cju@vpua43i3rtpe>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <wyheslzmyi3wsocqtvjpiqjsd5kl5m6at4e4rxoa7tj3ej4cju@vpua43i3rtpe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Nq3htcdJ c=1 sm=1 tr=0 ts=6a547eb0 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=su9Nt3zpQreRNCexbPwA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: abgyXAc7C9mZmbRiqG0wwUiOIy_VE4UD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA2MCBTYWx0ZWRfX4scxrCYjBMFo
 +Wy1+6wn77ld+kPpO9CTpCM75twsodQZ4mlmXUP+BixcRaa1pY7KD1h8JzwfU3XMZz9HvwpskNg
 4ju3ugbYqfzMkSO4Ay3eIAdj0x3dFZqbL/0yPRLePyUlx6yPd5QyCzxlIIdrLawy0g0PfR2ailn
 KWEQsu3YuajB41KjPd++wg7kKFxygIRyZbjRPEYlvv9xr25KMt6iwkEprnBMPh8zHdYdBAmGt6i
 YypQYqqLyrYSVWqD82JyJW8aCthNGkuto9X7Bp+g8u6OY4ftw9nF5k6SUdJmlB0ylccwBhuTWUk
 /0pyBVPHyoUnsy8uUOLJrUvL1Fu2j616MgzM2OpUpZn4e8lnGNKhCuG3+vQMcDv6MYolPVbkeUX
 YUpvSrZZfZWuc4kMEE4HYjJpPbxeii+owZzRvNA+0rBvobc6ZIAdrLbIzMo+aC8HRB3tPtAWXiV
 llJXZOxInCcpm+i3Yow==
X-Proofpoint-GUID: abgyXAc7C9mZmbRiqG0wwUiOIy_VE4UD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA2MCBTYWx0ZWRfXya06MKmnaEJr
 /Jn+HXLqNmqfevZuqFijC1ZWFhfryGl2mMvMhMAP40tc8T3BBYllkBWFHhVzTqa2WzUsi/sfQKc
 /3CF7FUi//sI2sV0CK1vpiclrzg3G5M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130060
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67425-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:bod@kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 797AC747659



On 7/12/2026 5:54 PM, Dmitry Baryshkov wrote:
> On Fri, Jul 10, 2026 at 07:32:35PM +0530, Vikash Garodia wrote:
>>
>> On 7/10/2026 7:08 PM, Bryan O'Donoghue wrote:
>>> On 10/07/2026 14:36, Vikash Garodia wrote:
>>>>> What's the addressable range with sub-nodes ?
>>>>>
>>>>> The original problem you were trying to solve was the total addressable
>>>>> size - this other problem here segmenting the linear allocation space is
>>>>> adjacent but not the same thing.
>>>>>
>>>>> Without digging through all of the patches here - my question is does
>>>>> the original sub-node addressable space problem get resolved in your
>>>>> proposal here ?
>>>> The proposal solves both the problem we have so far - total addressable
>>>> size as well as which segment (or range) in that is_not_ addressable.
>>>
>>> So if I can distill this.
>>>
>>> You're proposing two objects in the DT one for each relevant IOMMU SID
>>> and then the driver will register two different devices to get the full
>>> range addresses ?
>>
>> yes, alongwith the _non_ addressable range specific to that object, to avoid
>> the device crash.
> 
> If one of the subtypes can address the whole range, why do we need a
> separate subnode and a separate device for it?
> 

One range for all streams cannot be applied here. VPU streams need 
different ranges for different one, for ex.
pixel stream - 0-3.5GB
non-pixel stream - 600MB-3.5GB
secure non pixel stream - 0 - 600MB
secure pixel - 0 - 3.5GB

Regards,
Vikash


