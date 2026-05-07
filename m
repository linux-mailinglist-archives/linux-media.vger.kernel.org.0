Return-Path: <linux-media+bounces-60804-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKcNAVCT/Gn3RQAAu9opvQ
	(envelope-from <linux-media+bounces-60804-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 15:27:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B71AA4E93CE
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 15:27:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 31EB33050E93
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 13:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4907E3F7870;
	Thu,  7 May 2026 13:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N3CWqQhr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YS2gq9cK"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEE33F7AA7
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 13:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778160243; cv=none; b=URDgu5YO7LiFbWHLSMXhaCBt9Dq7usEzyfUQLHZmAtHNO0rjVQiyCuqp6LWkeF774WZfaWX61ANrhcXUfZUulD2lZOLCnC4yULL9jCrGausFIXD5lADP1FA0M9gV+tZsABCooPfRVUIa9b9uXI7egB+HpS/cipYlXm0MeCXaUVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778160243; c=relaxed/simple;
	bh=0LvcMjoBI/iLO7V68fpoO4iG8nsPdfXEpftRhNV1pXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=imolf6dAjozUG/rUHJO2v/WH0eR0aKKkg1V5lJeT5LofTVkyTg+6jy/KqjVWMwEv/FjVWRCFfSmGaIRqW1NGnGlCRpYIFiRQCEvIrWkG2ufoD3m7obN9WGCEdWBN0Podyg55PyIYonmiCQGBS2CM4Myf2PPuaYTKxbMIbN6sKpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N3CWqQhr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YS2gq9cK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647BcqYu3157830
	for <linux-media@vger.kernel.org>; Thu, 7 May 2026 13:23:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DjVkgLFZHJoObo1IoKJw5EE44WHc0a/C8ljj3j/Rprs=; b=N3CWqQhrtnDd3i18
	cPLRB7z15zvLTAZcslKYrQ9CTjOk49R/5P6uBnkImFcJNPgkMhStK/Ne7HCNjajP
	rHLjdDlNWIBgy6Tq8rCYsre6+J5Pa/rB705RJEDVjrhvJ+33Hc+6uuom1asT2AnA
	hgiA7G+MM9BqvoQeM2YiYPdD5qhhlhHKNd0yEpD9WY3+269cdRGYWPcNTKChkkT/
	AzDovWoWtWJDZdT2jNg6F53yGViFhwa2zrX+tEXZWyiRHYXTtNEcDQEjJ+qdnVBU
	kwJ/b+K71FsHaQtdQTP1EiYyT0Cxrq+tzZfl0xm54rl5AZcg/Nb7WN4Lhk/GwgaI
	sKKzUQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0mhf1r6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 May 2026 13:23:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-366344513a3so233871a91.3
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 06:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778160238; x=1778765038; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DjVkgLFZHJoObo1IoKJw5EE44WHc0a/C8ljj3j/Rprs=;
        b=YS2gq9cKrr8rpgGKN/fFrv6pwKwDNfJ4Nx6Pwj9bQOJNPU99tBwp49hczP4yFpf7TA
         9f1j0IqNdJ59DtVPChF6CgHDa6bZ+K80dvPl/7IQRKq9R/7r16vRGE1lve0ckezT/7iY
         4pI58joKaQ7dSlvrezB+cL5qxgFB+QEIHnobhgCN9Hn0U2g0PrvzBV9MCUfPx5WC78qb
         YTc47Dzv7DDyyiPNBvXjy8msweqw6WXz6zXy1ZCF5MEqYp1PgqR6MSPltoPTeHhV5r0x
         4itgUZODo2ZxRg80R9+rGvNDEFA8SwvZ9h7zhzFSiVhVdcXIdUdXeQ/VsmXGSIU4Ztcw
         hEIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778160238; x=1778765038;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DjVkgLFZHJoObo1IoKJw5EE44WHc0a/C8ljj3j/Rprs=;
        b=pN9EwngBNQlKi1KJWLJpJLdsxQJWnFkKjYF4amS3ybiWm+nV6NjIm1brdu3AYgMAD4
         p8HiYPYCX5vvNO22P/eNwK3h1rZdZi82ZS/kFhBH5oGEP8w/uAwf61XXi+o5EUP8W7Hb
         z1kuyNY3SwJ2M5PATerW8jHYqILS4nOh8Kf4Jk9toTl3yfQUyuNlheOhmkq5NL+tT11H
         2EEl4rbIMM49L6d3G6GmsjRRJSQwMr6uLGX6eeQ5Y++6tx1Xq+YlcrBterK8v3e/k9dL
         IRnHc/cfExV1X5eSkvuk2JRlwtz+8jEZ7LP5mMsLG45qMQ8Yx/xytdmZUQrtXYkfpRk0
         W2Ew==
X-Gm-Message-State: AOJu0Yx6StZQUYAq/KBRLYqmebX9QkitZzzB2Szuupk7lDa2kEUqfsYN
	KFnhfb5S/mUTqBTpJIUPvXt8PqBDhpg+hXrCOb/T5slnscTVXHsGhuMfcKR20eX00jfFaRn/lxG
	K/1Pf05D9TBmaP8fzPmFx6dsiSNR0uCvlEN4lKCHYWohMf+VLHSHh/L57JJ0v7Xavkg==
X-Gm-Gg: AeBDievyA4VQwWmv4GD8BuzG6sgPirM2h2OlwbMxONgkbJbSpKnK+vsCGCPGp+AtxoF
	KFrX093PXF86ouLuULObusk19/dHEXXl7I223wT8mpFNuMYnCGWKvpHxQkoiI6UxFy3ylw7BboZ
	yVS7OKwnO07FXEAwEn7dFTLx9egXcKlOIhug9HqCTBHGVYFTLYc3g2mjUKibEzOUcyXGcTxt+WF
	x54p13H0LsMEDlg+HKtfLZSgxwcwXGF/b0dp6rhgZqXSWwjVZTm/4O33YPhJoMf85rZf4y29e9H
	tb3hhu5pthv1+/vKeM/+wZLoytoZhf3A561pmoeg1vJWj0sQSpiJm8PmpKdyJnkmdwWIledgpq4
	hGMacUvFkYtMEssEjRnW5gTG1XlYy1HlhA9M/KgiXo7RrP5e8EYOqOsusdWkL85bdorM=
X-Received: by 2002:a17:90a:710:b0:366:159a:c228 with SMTP id 98e67ed59e1d1-36615b96cf0mr1223277a91.6.1778160238394;
        Thu, 07 May 2026 06:23:58 -0700 (PDT)
X-Received: by 2002:a17:90a:710:b0:366:159a:c228 with SMTP id 98e67ed59e1d1-36615b96cf0mr1223254a91.6.1778160237937;
        Thu, 07 May 2026 06:23:57 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.248.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b06bce16sm3213237a91.2.2026.05.07.06.23.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 06:23:56 -0700 (PDT)
Message-ID: <30472fb7-dd8f-49ad-9c5f-fd9a7dc9b393@oss.qualcomm.com>
Date: Thu, 7 May 2026 18:53:49 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/16] media: iris: skip PIPE if it is not supported by
 the platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
 <20260507-iris-ar50lt-v1-8-d22cccedc3e2@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-8-d22cccedc3e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMyBTYWx0ZWRfXzazGRBPjmYOr
 j+5jFNCy8q7kkupJ8XdKcB5Mvmib398u0vDPPTULzCJpDeDuOE/rBMDImqURfLrLb3RUvJt3fTc
 mPrZdEZpgqmR67mR9BlEOQ7Y54Laf3otrOETy/lqWY80/nyE1vC+ZzFDQ4yK1BMymnqiYH+kCCr
 4gqBnC7g5Hn+BFuJJoARJ/Qc2Rh4Wk/+rG+1QWvjy9FpoVxGc47UgapIL+2EUNEArPtfdsRxadP
 YhKU9wfF98oGQbBb71ZJaGayc0dMmVDOEDA3a4KkDDXS1uaF5dvCtBeoARfX1DJLiTJ9uRIOrSp
 2+tAkyBt8YtSV6CfixHQEoUP0Pf5fTT1bFAkcYvnAHIxt0eci47PhuS8bJmjnGf/qSMTZdu/1th
 VEn2u+ZvdzZpJR8EDLx8RQlsGN2bCs76q7IwxE32bbR47ZKZIPXP38rc8G+EbhPz2pQiBZ7Ms+4
 g6eADRuWRnV/KOi4hWQ==
X-Proofpoint-ORIG-GUID: Slz4rMvWb4LHws7BUZHRaCgBY751Rp3Q
X-Authority-Analysis: v=2.4 cv=SuagLvO0 c=1 sm=1 tr=0 ts=69fc926f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=EkRsrf7Hk27R9rd+nIzaeA==:17
 a=9TuWGWrZIemhly9L:21 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=J-ePHVnydm4htHqtPd0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: Slz4rMvWb4LHws7BUZHRaCgBY751Rp3Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070133
X-Rspamd-Queue-Id: B71AA4E93CE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-60804-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/7/2026 12:12 PM, Dmitry Baryshkov wrote:
> AR50Lt doesn't support HFI_PROPERTY_PARAM_WORK_ROUTE. Tables for AR50LT
> won't have corresponding entry in the capability tables. Let
> iris_set_pipe() silently skip propgramming the property if there is no
> corresponding capability.
> 
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_ctrls.c | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

