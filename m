Return-Path: <linux-media+bounces-61457-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKTBAl6JBGoxLQIAu9opvQ
	(envelope-from <linux-media+bounces-61457-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 16:23:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B4B534F6C
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 16:23:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 38A7E3073BCC
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 14:10:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1099B311956;
	Wed, 13 May 2026 14:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BC33L7yK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hH80RNEn"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3316130ACF0
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 14:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778681436; cv=none; b=ttEo0ecb+HUAjoItpPoLmn/0g95vkMU/ABWGHVzPoGgkVEuiNt0b1RJAhNX6RWhLmf+NbKgbKeja0iEa4yg2OCs60mIeeUf8jWvV6T8l0iGfroN2dyPXAR6UgKR7atSiDgqlP7tQK1jaRD//HVmjCDuVfAoFAfkQ+ZqLzAuL9Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778681436; c=relaxed/simple;
	bh=m+3FvLJO+xwOla0OXf8VoQ1DLjG55to1DazANcMJeII=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qCnEXRxW0Hn4FTn91GTyTIRaK4fJEgC4+1d24pryk2l9H0Mp17VWlM79nhDKbtbMOn05nI0jrZ0Hi6ADBDY7WT7V8o4lTrb+3ADsvkjH4nNNJMhlhyWg/4hMOIXDPUR/6rzC/gMLlXf2I695RK6DquA7ab+LB6E6GZKPdAkoEGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BC33L7yK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hH80RNEn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8wsm94159821
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 14:10:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qNDTjDQxaaZna2YPydS/Qickq2a/bQ5x4h+79jW/W8A=; b=BC33L7yK8qOiG5Tb
	6HgF1vN2BdmjRSiTnfwFvBYTDniXntRpyVwmizZa9cvsj9GaKc52Wrrfah3Ku6+n
	+WlKdQTos8iT7u7cO/mF1HDk0isf5NFakCqwDcNTdIACXsRNcOz/ga5YoN7ivxUU
	t060ScJtuVBz8U5iK1FEIC1bzJdoWGPEntqOO64DPA63/1LI7BQQZy7fLIjuH9ZF
	j/hwdFH63v64ruuQLWfF+wBSHiWU4VbAXr8bpdEdsUrV5lqzkm1tb+EXUoPJEaKS
	0qhGImPjFUkMfp2rB5UruW/erDnABLHvlTB6BzNDmhhaL0gFdnnGxnheQt9dIjKq
	u7Gi/Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p91s650-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 14:10:34 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f9429f49cso8547655b3a.3
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 07:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778681433; x=1779286233; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qNDTjDQxaaZna2YPydS/Qickq2a/bQ5x4h+79jW/W8A=;
        b=hH80RNEnG1yujPe8GGv6hwpq0jkv5P4aIfhY1GOj8Bg8LPOGDC9SUsfQcOpWwjv3Ln
         zmk19M/TkEwAcI+HExphn92DkbMEiCgSzWsWfT/pkiNb4xO/xdqxSmHaIBxyHf02VPus
         ZK7lDYIpramC6trdEG4QlI48H98aoXisYMVSDkgwHUPHOPEPY4s7yNzuDikKO+BjAq3E
         3LMeHLEYiz8pxmYHgaJ03UkkMZO1EWUgwwqLn3cLeWSL3SxMGPfGKME2YrPwzcsWQzLg
         ZZXFxrYrLw7WodQOz9LPvQNlgqLhGdNT2kTWQLimt7KVgtuoZ/b+kl7twlp5POUeuDVt
         r9iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778681433; x=1779286233;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qNDTjDQxaaZna2YPydS/Qickq2a/bQ5x4h+79jW/W8A=;
        b=B9rH/SZOB4sINlwu7LxzOlhOFp2JbvBOEgRkEC6cZt/kxqDt5KaYZnjfsBMZHfSkcK
         Uv7UJnhk4Nkge7D8XZu8yRp9RgoAbnrRi8LB/S2SZSsOh+1PUOQPjUkAri6lsIyH0SCj
         JUtbPDeMOK2Z7MVpnVq7fJb54YP2RjM0BdzG71aA4EiR5qDcCgqOUbe1m3GYmR9kVLcF
         LNFwKnVEVjrGskVT5CMgUCY8VHq/nKZXfpzIEOsh1cttXNocRq5YehMcNKQVYZJHGjSH
         2TcbVni8IQR6OtqVgIAECgpbKIybTKjcW2QIjnjCe4aXIJypm8UQAAsR+oKyCnnrSHvJ
         0zpQ==
X-Forwarded-Encrypted: i=1; AFNElJ/QnRZ3bOW7w/wvan3EzZaLiAy8l3yUi7mLQsXINFZIocri89e2EGHTEe3Ds2U491iEb5wpiqOuZJXHew==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5x31N9jRM9d3Jzf5xqeSo27cx/ASEq54FTkZ76G3cWbtqKnkm
	WfLlknWtdG/8q1Lz6EPqx2GuwUxHkVqzIYvTOLKzbmBKL3fbu4uEGHPMbmxajZHM4Ow88ApHT+4
	XoPkn1hgam1dfwCmdzoqfbziZq0qN8cbEbNbtljpKX+zwKy87TSlt5YF2PVwc5CHvaQ==
X-Gm-Gg: Acq92OEtTK6OxIWrzyzApcwT3AZo+6bJllf/C8g+TuSWcAyCYJsLSlwSutNq3Y9xqla
	JK6lyF2b5WKhH0bAo1YTGn1PpVatRpw0+3ANU4cmebFoFyv9nWpX388xA8zH3wmKB/q5v1eXgxy
	o9Ze9lGA3FgoRvw2oNw2fEHpJubbfL4mV01AwjvV8uRgL6BzSszu4YVcBoiQMmG/iRGW2Um+Th9
	HbahNKPodFQ7MBMTu/8y2nNuCLFNvFKdvc/Jk8W44nhorIqbhBOGwhH6WiRGJfhqQ/5t2nuCnKO
	+i7IHLHPoQ7lFvESR//ptqDizP/tw/VsBBRFMXPF+hlqLjyc6A9R5wVQYFNDY45arRRFOyfEZZd
	sY271wAphMSELPNiEUOn6C6YiB4A+44BV0I6IR1V6NYVlpf1x96Htemw=
X-Received: by 2002:a05:6a00:4c9c:b0:82f:721f:10ea with SMTP id d2e1a72fcca58-83f03fd3872mr3492434b3a.18.1778681433135;
        Wed, 13 May 2026 07:10:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c9c:b0:82f:721f:10ea with SMTP id d2e1a72fcca58-83f03fd3872mr3492383b3a.18.1778681432540;
        Wed, 13 May 2026 07:10:32 -0700 (PDT)
Received: from [10.204.101.125] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbf0cesm33068690b3a.46.2026.05.13.07.10.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 07:10:31 -0700 (PDT)
Message-ID: <8541d1e8-9ad9-489b-9c00-b7a92ce0a13a@oss.qualcomm.com>
Date: Wed, 13 May 2026 19:40:23 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/14] media: iris: Rename clock and power domain
 macros to use vcodec prefix
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
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
 <20260509-glymur-v5-8-7fbb340c5dbd@oss.qualcomm.com>
 <6hr42ins65rf6ftdmme5lok6ham67piz3343kdwxaff2acktcz@oipdhket32og>
 <4eef8b17-47b5-e8f0-4a44-87fdf1d69d18@oss.qualcomm.com>
 <cyjxjidbe4qpeb5pwv6u5yqwhldqffenzgp6z4irgxkloturt6@buswzuou2w7z>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <cyjxjidbe4qpeb5pwv6u5yqwhldqffenzgp6z4irgxkloturt6@buswzuou2w7z>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wwExHFJv1pkdAYKY8_7dBhWm5voH-K6P
X-Proofpoint-GUID: wwExHFJv1pkdAYKY8_7dBhWm5voH-K6P
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=6a04865a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ZIVIcBtmlPlGufRlQcsA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0NiBTYWx0ZWRfX+4yJdiySFKFf
 5r1T/+u+w7pevYDRXvzS3tAaYm4SBZheQgbghjlYDc0nay0HGobQddq7OBQ8SQZQW/rg0rvutGh
 2RVrMrFWvo/+wu6IzM0kk06lqNshwGIk/nZTdmeQ6xPlvjlVhTaV9d8NUSB+3DupuwLpBfOvkEr
 l8WQLeDdWd56+l+zXHTuaF6U8mCxSeAayL0ineeHfIhp3Z/Tc+V7MXitmJPb0QC67w9dn/BbV+2
 gLNXaufGnVvb5cz2eRBHqT69fx+zBs0wu2+ElrFbtUTkJvc1ol1bJWQkqW1e/MtdJ9iKx8YnxVZ
 loRkz4wsEB2Rmi09xxKhr6a5xh5S5LR01NqSixd4WXh4/TcV6WhDql2Q/TKW3KDrVNmplhJFRF9
 Lj+Mln8y8x2ImGqpjoymEaVKc5B+1x4jRk65fqk13sySU9PAhcP/oknjWgKiNSUiXgrAxeX1x75
 +1pfcG5IydW0CCfcXqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130146
X-Rspamd-Queue-Id: 02B4B534F6C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61457-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/13/2026 7:17 PM, Dmitry Baryshkov wrote:
> On Sat, May 09, 2026 at 10:37:20PM +0530, Vishnu Reddy wrote:
>>
>> On 5/9/2026 1:52 AM, Dmitry Baryshkov wrote:
>>> On Sat, May 09, 2026 at 12:29:57AM +0530, Vishnu Reddy wrote:
>>>> The current clock and power domain enum names are too generic. Rename
>>>> them with a vcodec prefix to make the names more meaningful and to easily
>>>> accommodate vcodec1 enums for the secondary core for glymur platform.
>>>>
>>>> No functional changes intended.
>>>>
>>>> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>> ---
>>>>   .../platform/qcom/iris/iris_platform_common.h      | 12 ++++----
>>>>   .../media/platform/qcom/iris/iris_platform_gen1.c  |  6 ++--
>>>>   .../media/platform/qcom/iris/iris_platform_gen2.c  |  6 ++--
>>>>   .../platform/qcom/iris/iris_platform_sc7280.h      | 10 +++----
>>>>   .../platform/qcom/iris/iris_platform_sm8750.h      | 12 ++++----
>>>>   drivers/media/platform/qcom/iris/iris_vpu3x.c      | 21 +++++++-------
>>>>   drivers/media/platform/qcom/iris/iris_vpu4x.c      | 30 +++++++++++---------
>>>>   drivers/media/platform/qcom/iris/iris_vpu_common.c | 33 +++++++++++-----------
>>>>   8 files changed, 67 insertions(+), 63 deletions(-)
>>>>
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
>>>> index 55ff6137d9a9..30e9d4d288c6 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>>>> @@ -49,14 +49,14 @@ extern const struct iris_platform_data sm8650_data;
>>>>   extern const struct iris_platform_data sm8750_data;
>>>>   
>>>>   enum platform_clk_type {
>>>> -	IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI clocks */
>>>> +	IRIS_AXI_VCODEC_CLK,
>>>>   	IRIS_CTRL_CLK,
>>>>   	IRIS_AHB_CLK,
>>>> -	IRIS_HW_CLK,
>>>> -	IRIS_HW_AHB_CLK,
>>>> -	IRIS_AXI1_CLK,
>>>> +	IRIS_VCODEC_CLK,
>>>> +	IRIS_VCODEC_AHB_CLK,
>>>> +	IRIS_AXI_CTRL_CLK,
>>> Why AXI_CTRL is better than AXI1?
>>
>> Glymur has 3 AXI clocks: axi_vcodec0, axi_ctrl, and axi_vcodec1. Using
>> positional names like AXI0/AXI1/AXI2 doesn't convey their purpose, whereas
>> naming them as AXI_VCODEC_CLK, AXI_CTRL_CLK makes the intent clearer,
>> especially when platforms differ in the number of AXI clocks they expose.
> 
> => commit message
> 
>>
>>>
>>>>   	IRIS_CTRL_FREERUN_CLK,
>>>> -	IRIS_HW_FREERUN_CLK,
>>>> +	IRIS_VCODEC_FREERUN_CLK,
>>> Can we at least group them too?
>>>
>>>>   	IRIS_BSE_HW_CLK,
>>> Is BSE a core or a codec clock?

IRIS_VCODEC_BSE_CLK would be more appropriate here.

Core and vcodec (video codec), it refers to the main processing block 
and are referred interchangeably. BSE and VPP are the sub blocks inside 
the core/vcodec block.
> 
> Unanswered
> 
>>>
>>>>   	IRIS_VPP0_HW_CLK,
>>>>   	IRIS_VPP1_HW_CLK,
>>>> @@ -206,7 +206,7 @@ struct icc_vote_data {
>>>>   
>>>>   enum platform_pm_domain_type {
>>>>   	IRIS_CTRL_POWER_DOMAIN,
>>>> -	IRIS_HW_POWER_DOMAIN,
>>>> +	IRIS_VCODEC_POWER_DOMAIN,
>>>>   	IRIS_VPP0_HW_POWER_DOMAIN,
>>>>   	IRIS_VPP1_HW_POWER_DOMAIN,
>>>>   	IRIS_APV_HW_POWER_DOMAIN,
> 


