Return-Path: <linux-media+bounces-67426-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8WaWF6J/VGqzmgMAu9opvQ
	(envelope-from <linux-media+bounces-67426-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 08:03:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7177476AA
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 08:03:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="lt/bEIRy";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bt6gAOJ8;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67426-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67426-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3A5D63009F7D
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 06:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A434936308D;
	Mon, 13 Jul 2026 06:03:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EA9360EF7
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 06:03:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783922588; cv=none; b=EUuYreO48WZ7pJntB2LLVnybDbYZNAk4z/pCf4H96NhC9A8weBcDuJNF3u/6um1nEzKuNO/zobffAC3NorC74q6kCPrCQpxZUfAo9QBVC30ExoLbax0WHz12RXs3WefFFkWCKDs2AFX1NfnK8KW1OW+QCy3Sa1Y+DX5ievk66qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783922588; c=relaxed/simple;
	bh=o/cYIypQg/YyC59IxDV/wB+yUdR9cQMVsaZlE6Z40lY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ckGfnL6IpNbiEduMlWi5VJZbV9ZGVf2SA5HQiwOw/F6UUtR0KTcFZIFwRt7a5xFoB7gy7Cgt+qbtoXR7AGBACGJcmPQgU2M2ULslrPzin4qyxOTjKxq+riUQsdr7c0vPfY5R8L3sZOEJ3roso332v7HQPp7OA/7cIp8PghCP4eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lt/bEIRy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bt6gAOJ8; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D39v9g038534
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 06:03:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rx+o5Yj3X86o+vcScF6U5wIbLWITlQ1ZlQ2rgoymQk8=; b=lt/bEIRyA2d1Zlp/
	4UJB5iIrJ5ALQftNQDN3ZwE20relAwc+jBUsVDyBH6NrHklVYth5fnczXZEINWKk
	4TuWjkEM64gryhA+wR7Cq2Pp29zkUwO0sK4kAZiN2Gu3FZ+fCAesygQqFbVdyYx9
	1KpaORZM/XB+dFqtPdKIl1FI6Pc14IVTp1F3L++xIKToY15htVMApzVTZZmXXfHM
	aScsjiiWATuOz5/vf+vOs6aKizlUrU+MPRoY2fUGthjEa6LDMEyFSwwMH+Onc1vz
	nFwjh4Zsjw1IefgBkG2zVsBl9n3wjY88gjgAA3jNX3AKiEiePRBNCy7V45qdBJJ3
	LmzFDA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbee9mkhs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 06:03:05 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88aab7c1d4so3887180a12.3
        for <linux-media@vger.kernel.org>; Sun, 12 Jul 2026 23:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783922584; x=1784527384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rx+o5Yj3X86o+vcScF6U5wIbLWITlQ1ZlQ2rgoymQk8=;
        b=bt6gAOJ8eij1P9xUcwQ8K/0cGILE+vHIbkecBefZgmpf/D/GcJCMEw/KplNKignTGl
         wOODY/oEe8O1oIqKsgCZ9E6N+E1gWlexK9J/4T4d1dkud2OqHo+EfwXxH7iRUy8NGpR/
         IQcQl8+BBl0I76oqhsEXP+0g1fdL7W+mf/EYkgjmqgTrDOuG+8pmAhngTu+wGek3HYQZ
         tVhTvBWllp+XzKFBpeC1JxnLPhZgUVEviO9DcUfwGHvIKkN1ilLUhB7B5NweDbqfmj+X
         iIur0ThWc/sXdn0cSuttNWF7XFN20E8zWJrOlsaggIT35NcWk1uXggiW3JmtFpaXRzcW
         46Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783922584; x=1784527384;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rx+o5Yj3X86o+vcScF6U5wIbLWITlQ1ZlQ2rgoymQk8=;
        b=c8/9AUlewz34P67bQQpkk/FKvb5vwVOhBqeCZji2LrQAJMwrmHvpUEGuvQ4EfZndu7
         fiRpicfim7d+NvPS07UFnIE378tSUMzlejJaVW3mugFZV5/0tFFoGEzzpHGkysAz+kzq
         Oq7lt+38ctiI2dEH90INu4zoCN1EWHDb+3UGKYI/vVCzzGXry3T8212kUbSZUufKE35y
         EHSaVy3pz4Yl0FGWU687mj9lvFxQjRNAZUI5EvycOR8aV1Mlitk1kLRvBNQetF2Y5gdk
         ZH8+ZoHzlALNLWwV59gZWWh5z0z86K+/GuM2F4qMizUuLU79FSYwZ0sifDUuzWZeeCDY
         Yjxg==
X-Forwarded-Encrypted: i=1; AHgh+RpOs3jBrbaRaZ7e/freg7HmTWosyWXLO8fd9PmgeiZTkm8P40ljxO51C8UwR/pODtc0GKv30MHCXGaQ5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsZ4gFW9Q+FZ1ToPUoGxOvLzIbrtK9+Zqb8KC0oSqZhmF0SAdn
	427uR+4h/E3pYoXleBUDY8QKBpd+Omrz3K8CHEYpYmwIc20H/rpqXPBmuYXoepUV8/6orO8c5eI
	W/Z6h2Ugn3BEyMA6qWZhCpkyFdEQBtzRQGAZixAE5FBSDMly1+gTQ5/1199Fa8sOIoQ==
X-Gm-Gg: AfdE7cnK7C4r+RIHwNVbmRP2zuu7+coImzT55oH24l4hgMPtMea1HL1+UYMYgTmJQnt
	MlkbZS/aeLcWIhuONocCwnn1gR5I3KAiifX+x415+m4JD/iikcN4KckLkqZZXOscF6uyXWAkY+R
	T/Aa3oO138QrHkS8lztkTiGXTiKdV+nfk3xV0ms9jQBK9nDbK13n4UYYy3Do3ACAXz6nQBwsBju
	eyz8HD4HC/tBTcce3Lxovl9YMN9a/TKqGXJ3AVBA4og8UyZqwWoVlcAPqoKaNFhygR7i7gtHv10
	wsorlpKLFzRdutXTKcS7KPmUmKHGgNFrkUY/ypZ+64Bm7JvAtOG8IeP1kijyPZ5UplyB8lFkQpH
	YQJOaF8u/z8COglG7YA6mlIVdyLLlAJ9dViB9h7Aak3Lg
X-Received: by 2002:a05:6a21:9e0f:b0:3bf:baed:c797 with SMTP id adf61e73a8af0-3c110b2d84dmr8341108637.49.1783922584563;
        Sun, 12 Jul 2026 23:03:04 -0700 (PDT)
X-Received: by 2002:a05:6a21:9e0f:b0:3bf:baed:c797 with SMTP id adf61e73a8af0-3c110b2d84dmr8341067637.49.1783922584098;
        Sun, 12 Jul 2026 23:03:04 -0700 (PDT)
Received: from [10.204.101.214] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b8a5992c9sm22568953c88.4.2026.07.12.23.02.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2026 23:03:03 -0700 (PDT)
Message-ID: <00df448b-b492-4c85-bba9-84753825c265@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 11:32:56 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 07/11] arm64: dts: qcom: hamoa: Move Iris IOMMUs to
 sub nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
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
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <63t_fLehIKEom4-JPN9kAGFEjUG4_yFoHMhB2aEAppwPHb2oPbK666eGkGgXxEAHRJnfTRRUwuf2EqNRYe_gjA==@protonmail.internalid>
 <20260709-vpu_iommu_iova_handling-v1-7-72bb62cb2dfd@oss.qualcomm.com>
 <5c8af0d5-2477-48ca-bd7c-0f2475a9dd62@kernel.org>
 <xrfd2dbhmpiy7ftpztcswba6iyzt3dsajqtr4fpq2iyn6tbeny@4wijspe7n2ig>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <xrfd2dbhmpiy7ftpztcswba6iyzt3dsajqtr4fpq2iyn6tbeny@4wijspe7n2ig>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA2MCBTYWx0ZWRfX1RGQrFatkNIi
 3WH+myscfqV1dV2Y0wga0o/WohLCyVVN1DCglc1SYrlLAVSEvSoCdnqJkQzxuW86SDABmQIgF0v
 L8MZvK9xrolR+Dk2oWgSiVEvnh+MChk=
X-Proofpoint-GUID: vzrUyeNsKlpCLngDWG8q_fssvkwjIYc_
X-Authority-Analysis: v=2.4 cv=a7UAM0SF c=1 sm=1 tr=0 ts=6a547f99 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=769wdsGJOBCleK3k260A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA2MCBTYWx0ZWRfX0f9i2s00OZk+
 c4+q2O/aC5btt6bafOzcerQnJYiiDQdXI7nZBckwfsAbfVTSdQ3u+cWO7oxogVPn9L9DFGCsRGk
 CKDSm/aYbzE8oXS8xKyY0JSMRjVXM/pvFxvMLXQbpvnQI7CVLt4Gg3hjRFE152zBm0mq6fP0f0e
 7Dq6Khmd2TZLE7SMI0FsPEU+jE7m5CdkV48NLggb0ySUuYHn+UxFFpOjpX3WkWr7EQEzLnnMWbC
 jdZP+FPdEN/cluqD8P5br5BIXp2LWsjwqWt9a8mzZjiFckJMn1dyzoEB6XGfsUZPGf6A2pIWIMf
 WIRqYPZyv8JCoHeSrYPGInS+BAjzHeMizwtnYos9zYnKQ5hzXT1fZQAHssVVASwy0CeXXsDnCB5
 cXZGge/zMVQWoDIOW6QEneEMz1tS3/7wUyIFCG9ve2KiIic0Xw/Bvc9yCXUxlWAweTlY6YQ7r69
 AsCrINOiCT85P5V3IQg==
X-Proofpoint-ORIG-GUID: vzrUyeNsKlpCLngDWG8q_fssvkwjIYc_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130060
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67426-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:bod@kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,gitlab.freedesktop.org:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DF7177476AA


On 7/12/2026 5:49 PM, Dmitry Baryshkov wrote:
> On Fri, Jul 10, 2026 at 11:46:58PM +0100, Bryan O'Donoghue wrote:
>> On 09/07/2026 13:35, Vikash Garodia wrote:
>>> The Iris VPU has separate streams with different IOVA constraints. The
>>> non-pixel stream must be limited to the 0-600 MB IOVA range, while the
>>> pixel stream can use the full IOVA space.
>>
>>
>>> Using a single set of IOMMU entries for the Iris node does not describe
>>> these per-stream limits and can allow accesses outside the supported
>>> range, which may lead to device crashes. One such issue was reported at:
>>> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
>>>
>>> Add non-pixel and pixel child nodes, move each stream ID to its
>>> corresponding child node, and add a reserved IOVA range for the
>>> non-pixel stream.
>>>
>>> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> The thing of it is, this _is_ a bugfix - perhaps its not one that can be
>> backported, actually scratch that, this isn't possible to land in -stable
>> realistically.
>>
>> So what is needed here is a strategy for fixing -stable.
> 
> I think, we need to start with defining, which platforms are affected.
> sm8150+? SM8250+? SDM845+? MSM8996+?

All platforms, including venus.

> 
>>
>> That could be apply Daniel's patch and backport it with Fixes: - with
>> mainline then say applying this change and reverting Daniel's patch
>>
>> or
>>
>> That could mean some other solution for -stable - up for debate - what's not
>> up for debate is this series needs to _address_ what happens to stable for
>> all of the target platforms - and then transition mainline to the new and
>> shiny way.
>>
>> That could mean
>>
>> - Applying Daniel's fix with Fixes: and cc-stable
>> - That patch needs to be extended to _each_ Iris platform containing
>>    this bug... all of them I think.
>> - Updating bindings
>> - Updating DT with new method simultaneously reverting Daniel's fix
>>

Ack. The proposal seems a good way to me addressing stable, i can work 
towards this.

Will wait for couple of days if there are any alternate suggestion on this.

>> And I do mean doing that in one progressive series - a fixup for mainline
>> alone isn't enough.
> 

Regards,
Vikash

