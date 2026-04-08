Return-Path: <linux-media+bounces-58214-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LZhGCUe1mluBAgAu9opvQ
	(envelope-from <linux-media+bounces-58214-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 11:21:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C10B03B9CAB
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 11:21:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22D96301FF8A
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 09:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F0162EACF2;
	Wed,  8 Apr 2026 09:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h4DAvfDN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hfI6n+t5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0A1277CB8
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 09:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775640043; cv=none; b=I8SZmsJ+eXRhckAr0tMwgNDu31vNf2sMrq7f94fPCAwnfrfh+UTQX4v54k3ta9pFE8ThDKlw5I63XJgwqv8DSMzFqF6tZ7PfwePTzG/LxSZyrngsxh3Bo6FtmBffP9u7zCM6RjR7fX0tDcR/ZRNd3i8wTLqrxGxPtBT24PBGC9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775640043; c=relaxed/simple;
	bh=1fEK+3/IUaI6PtifAJ2tgPApAe8vnhtB5kNDXeehzzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l7LO8pqycKPf+/tlSJPYh6RJaWExlQhTswzI+UL+3osUPCcM/m4gKF4UTfZlrtdGtlpRWrWmE74mVuGXuTEIEexFLQXqIdIEyWExwhOQmf2gSJDOgEI7FG6EziAV+DaUB6sOheWh1tq9yduphSe0AAFDimqGmwJAswlwV5bb5kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h4DAvfDN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hfI6n+t5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6385LEov1006077
	for <linux-media@vger.kernel.org>; Wed, 8 Apr 2026 09:20:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EAKmIBB8y58Nqz0XUXe/YyaPrczRj5pQrkOyWHus9SU=; b=h4DAvfDNKDlR4sAy
	ZZ6qcNPxwUbDAsBIQCLqK20ilbf7/A1LN99AO8gEj7ml1YVzHCizEGrBtbWCnXgU
	AwD9jAyGTdgFtviLpWAJopm6CYLkn4G8L7jxq3/ejyd1bDZJCZWEwpjNITvjM2au
	QYk4Sw0Z8hCjkjSZMIQtNXd36XIVqJMzpf/G45y3SaA+wb5S/CRP5tyd+BacypCT
	XSsTcYNcYrt+bTvVaERG9ur5yDj9VlC+tNLPvrjhU+5nmpFkGhWa40X1fzGd6yuA
	DxVNGciUerA1HbMoF2SZNTrDl+oQBJ47wB8+ZtMs7s9qFZOvSCYV17iYfWIUYG9e
	H8YTcA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd7tpahtx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 08 Apr 2026 09:20:41 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2adef9d486bso88692715ad.2
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2026 02:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775640041; x=1776244841; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EAKmIBB8y58Nqz0XUXe/YyaPrczRj5pQrkOyWHus9SU=;
        b=hfI6n+t5fZqydA3iXu2mh3qmy3zaL9SpFZ4oaI4AYcLMEH7r2/dbVesTDYoW1eYusL
         qUl3gRZnuajmthuw5SlcXIDBvC+cTFjLQyaNRCOckxS2MIDVstbnYUUaemSF12iLc6IG
         64XOJ1Fj/ZIvSloZKn1G+rYHP+8DhSMWZH6oi7JisesTw5CptQR5hClCs/7ODbtAfU4V
         SWUgMzrxIvVW15D5GjDYTVythr0/UO8zV3gJa1wboX/OqWFuDOQrVmHuuefw9dtcXn0C
         4ARrHcHVwvBElNDpVtrQsBiC1R4cCr96wdKWsSXXlJFzt4gzi1HSE3GgIldNQwLwEbE3
         U7Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775640041; x=1776244841;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EAKmIBB8y58Nqz0XUXe/YyaPrczRj5pQrkOyWHus9SU=;
        b=dxfOTzbPusE3R7VkrVLm6fUjdstUYs53AfljsI7MzaLvJyIC8bK0JNqG6cH0Vkj2JT
         QH8/jbmo4RySBmWHNAJpmQvCazbwvwlz3Xo6g6rW4zqOYW4bv/mhlXATMZfm5ZZFJ97y
         Gvb3DiftzG3z+7LnKEKiooeSfcDEImVztfOH4LpdofkAMtrFjnnU6ctbP0vwHKXPkUEU
         ATIKgOHRwgZqX4hMhJxSVeOo16htg4f73D8wvdeT5unRpQixWNwEmeGEPjEEwxHgDGIu
         rSX6PxcDRPhJzcIlxHGD2oRHXqaVTA9Pm7/P8BTl8fdQIWX/7+HTOxuCVKqcHLfJBYcQ
         nddA==
X-Gm-Message-State: AOJu0YxP1kAw8OYI552QWQL/PQviot3jrGqGITZN2F2RZpsUTVDCehSk
	cChBIn+YhGZrWqsWWKYezSBtbSXxjou+kAfDhr9cMdy8Q+YK/mCVNxYCLA3tD6io3W2Bbk+QFiH
	8zq4l7dl99NPiCs5iHYQh7nCQtPiZUmzOCwm8K6/HTkPUSZP52JiWEchSRpdXrCBMNw==
X-Gm-Gg: AeBDievFLrHKOwEP7wz9rj4MSsy4hazu7eTkP4hVSIpGOPjaodNb+ZSN+8r/hBCBBLz
	tztETczNTOVDdqAVfOaIoQ/zlx30kmppVM/DPhC1OzTQ93HFFYpJ3n5IUxmkmDZJ0JnJWjXVNB3
	mpf5WbQa1RNx6tN0+nJUx27OOZoClmlRye+E/nnwF6L90yNdosGQQLFVdMwjjnE8M7pGHLfdP0V
	AAR3bjgQbUHjrHTVyMt5E6TS/uFRrJPscIUjwessddvSzg4ejMIqWdVHvnaywXLzv8hvZhJTinn
	gRqgATPsZr2ATaeLlZPxzCTYcbzMkVesE1xWjoDxywqMMw+Kw1/smQjnuzCyHwaJXDArjGmZNp3
	WEKGfGBvp72wHFf/bXTBeUuK5DHkqcKroPdhbpa/OI/M5N7DEeeOH
X-Received: by 2002:a17:903:37c7:b0:2b0:c451:aea8 with SMTP id d9443c01a7336-2b28ecb83e7mr183196335ad.14.1775640041295;
        Wed, 08 Apr 2026 02:20:41 -0700 (PDT)
X-Received: by 2002:a17:903:37c7:b0:2b0:c451:aea8 with SMTP id d9443c01a7336-2b28ecb83e7mr183196065ad.14.1775640040829;
        Wed, 08 Apr 2026 02:20:40 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.228.76])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27477736dsm193886955ad.24.2026.04.08.02.20.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:20:40 -0700 (PDT)
Message-ID: <fe1379a5-57f2-e618-dbeb-32d1c3c7536a@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 14:50:34 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 3/5] media: iris: Add platform data for X1P42100
Content-Language: en-US
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com>
 <20260401-enable_iris_on_purwa-v4-3-ca784552a3e9@oss.qualcomm.com>
 <437123c2-35af-227c-3fe1-7d45ea1243da@oss.qualcomm.com>
 <7e7f7778-9a26-45f3-89c1-0113969cc1d8@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <7e7f7778-9a26-45f3-89c1-0113969cc1d8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: VhjYdit1SpNiR5a0vKUXCh_M2ntfLhot
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4NSBTYWx0ZWRfX14LU45lJ6D2z
 gC9NixJV2VD3kT70zdkivCvV9zEBfuzSh0+a2lpsUundPu1X28hwz2LKZV7CwcX77QWR4wDLu8c
 Mk9TQyce6Coq6FSr2GyqMmMODU8iNXx5Xq4zWJyPspCN978z982JPtyejJxQ/ci+70EfS2n3UwF
 YiThTD+21pHtk8cwn/cb80qN1LHEkqOgUULVTH+oZGVT+puyN5vym8/DS3wJZVux6rvKgUHxV8/
 pohRLDtLNj3eLnANT+phRd7e4gICQRC8EBKvjB/ipD6N8NhWDdh4Y/EYLp++hly+pdHPTa24tIW
 S/bTTmIVR89zz/BWy9v1gaeVj+ZBvUgTwNfwKgyIK/iiZyHa7XvHnKtp8/dkm8C1sTI3qNsLIFE
 qYrtAw4/Z/EQUNkB4xkutY0NCeiyu9JOYkxnVKrleWsUSgcoqsSwQ1njYp+TG2AHkHiLNPolq36
 TCVwNb8WiwqfOwukoMA==
X-Proofpoint-ORIG-GUID: VhjYdit1SpNiR5a0vKUXCh_M2ntfLhot
X-Authority-Analysis: v=2.4 cv=DNS/JSNb c=1 sm=1 tr=0 ts=69d61de9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=/ZU3Ovutwf0He1FzxNd9ng==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=JisTeJLCnvBdXki043gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080085
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-58214-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C10B03B9CAB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/8/2026 2:47 PM, Wangao Wang wrote:
> 
> 
> On 2026/4/1 20:40, Dikshita Agarwal wrote:
> 
>>> +const struct iris_platform_data x1p42100_data = {
>>> +    .get_instance = iris_hfi_gen2_get_instance,
>>> +    .init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
>>> +    .init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
>>> +    .get_vpu_buffer_size = iris_vpu_buf_size,
>>
>> this needs a rebase on latest platform rework series.
>>
>> Thanks,
>> Dikshita
>>
> 
> Will fix in next version.

The rework series was expected to land in 7.1, which may no longer be the
case. Please hold off on any rebasing until it is clear what the correct
base for this series should be.

Thanks,
Dikshita
> 

