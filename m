Return-Path: <linux-media+bounces-44371-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AD760BD82B9
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 10:27:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D906423124
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 08:25:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAF2D30F92C;
	Tue, 14 Oct 2025 08:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OMxMHk67"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BE530F551
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 08:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760430342; cv=none; b=UkIUXKRZMOrHcINURWngbq5qP2Dt5opTq6K8jcXgp0WozbYfuNQtajgdm85pMjjqcodEO/CtqRe7KhLAxeZBN2fhX72hmhYwgElaXtt1EFVQcP9IgHgdMw9qHXq4d2bDHV3JwjiWaWzI3gZbSpk/Xk0kRiQ1fvoVpOPGv1A3O5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760430342; c=relaxed/simple;
	bh=bqbERKIw/xSy0mRLmRp7Ht1mMntEfecsoPf4+hpZs28=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IKuSts0xlT+uiiW53dCrtkewmPQN/GtYkdeuyR6wME0GdsRAzxR25rxX+qz5iBtL7i7D/WlcNa1HH9aLtESRMoPIYqkVmH9rNbVQu0IRiWxA3kpvNEcTqNH6Wa9fuiFGq+orFxO7yQ/NfEIrHp3GgAdJY+eHzvtJXyV8YK63hOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OMxMHk67; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87Ikh001502
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 08:25:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gSJMVS9Iibrg0L/GDCLFrpAEBfnCWQ9ZrgtUzwHovaY=; b=OMxMHk67D3m9lmG5
	Qf8GII7VbXgpfaWizxdDv01iXoR/6+gFo+ZR7tOvAdYpVhvP/y69DhXEP9IhtuJh
	uay55rqs0XUa6dSTTbSZA5DmpkLt/c5lQciICJuD8Fv2B1LgFJQ3URN3XldN4oYA
	mWZVFkSXy3DrTGuk/8/Z16ap/OnZI56kpxmn3T5txDeWolz124EvxYAHDfaxzeA0
	Ot5720xnQxuMpu7xB9HqylYC7Gqm3pDr5q9d9HnQzsOf3bXGiUXs9L1Epe9oF2CB
	0/J6i4i8y+kfJ2hxTuC7lCWASo3AOrK4ug1d/MvM7YenVeaggNqRc2G581Gptv/R
	yxxcSA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa87r0n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 08:25:39 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-339b704e2e3so10384057a91.2
        for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 01:25:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760430338; x=1761035138;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gSJMVS9Iibrg0L/GDCLFrpAEBfnCWQ9ZrgtUzwHovaY=;
        b=iHRcYvPQE7pPlU85S55wCkkqyvzb8TUAaiCfgu4lYOoNQB5lImIPTDUqzQzWVWPB93
         vWyW+R6CnB3AGCtT2e3hE+biDZzg7/fCuIzZTjYymwvuVQ/Xqcdn2rpV2JyhA6AFVT9j
         WJw9u1tTU6UvtKQ4P7ptV4Nb8QAGHLCVTuA4HBpwDOgDxRaVB3TONoJh+PPpV7Ybuoby
         JqVYhx287t2DGM0Uln3rt+UPwdBM+vtTErAwRufi5XOWnE0fakq+w/WnR2wDQepTaFVN
         i5VXLLTFJi5r0szXaQQb88NdBiqSPOsQy6cjRVZdkvi/sUf1VDNu5PDeasiSmFd+3peM
         qVwg==
X-Gm-Message-State: AOJu0Yxyqah6uioAUr5kPTxKUOjCDGY4J+z6fi4WAFvbzGZdJizckGGs
	hKceNaYm/q2jNchcRaNnYeKx55Zq8plI4ub9FmmUbO5KCTYPelXc1piNNvWhPWQcFoE/HvX18YI
	rhwiaYh4CFQ01Wxt8HHrSIfbegV8xaoJfV5/d5MGRkIX3SWgL7MsljbrOQcVzEowUMw==
X-Gm-Gg: ASbGncukZKsoXyqOKkv+A/8cQHz9As1z3Ryan/bMdgg0wQdG6xll31Q+7Ax6OqbzZYq
	pF06gMQsyQM3OKc/fU2Zns+FkU3MEsn4a7hUnitL4eg9xPtkhFjN13Gob3dbwEARVMPIPlR/wuD
	QEF3YyiyTvGc9U13j0QVvlxuhB1smhcmRep7tQr8Fn3ukNpV7BKPBQA2YCLBr9IRGk/DNM2l/E3
	qpwmux4cjlPYBUFuEDLrk97SccFqwG6TCXrRsQky+ITTrNb6GJ9kh0A/+G7NFNMhJiOQZm5uHpE
	TW1Z4YHAFiar+KjBgUiN8vDIRtFRgIYLNjbCGrYm38j20/64IfDO9Kdja/TwuP/r6sQ1DYko
X-Received: by 2002:a17:90b:2889:b0:33b:6e60:b846 with SMTP id 98e67ed59e1d1-33b6e60b8d1mr14896207a91.11.1760430338205;
        Tue, 14 Oct 2025 01:25:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHx77WB8/5wRwZJxz+GXjiMEsSbHz+VvV1kplZrzsrb2qudf5GAaryBEY0nknZndSGOnrfo7Q==
X-Received: by 2002:a17:90b:2889:b0:33b:6e60:b846 with SMTP id 98e67ed59e1d1-33b6e60b8d1mr14896178a91.11.1760430337709;
        Tue, 14 Oct 2025 01:25:37 -0700 (PDT)
Received: from [10.206.101.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61aab514sm15042035a91.16.2025.10.14.01.25.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 01:25:37 -0700 (PDT)
Message-ID: <d8d26b77-ef20-7c09-147b-5b8f54f50483@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 13:55:32 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 6/8] media: iris: rename sm8250 platform file to gen1
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251013-iris-sc7280-v3-0-f3bceb77a250@oss.qualcomm.com>
 <20251013-iris-sc7280-v3-6-f3bceb77a250@oss.qualcomm.com>
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20251013-iris-sc7280-v3-6-f3bceb77a250@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: edNsJ4kW72lALsRlZ_t5U3WZNKxMEABw
X-Proofpoint-ORIG-GUID: edNsJ4kW72lALsRlZ_t5U3WZNKxMEABw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfX4BsLTa6geXNr
 7qWb3kV8QszRX81vIuJOYqvD+QiZlCxvAX4LXhujbwCJW1VRtxYYIzQY0tjCiLyC7b9XEjx2n9r
 2mNCPA7OZMuzK5rosvwAc92WFq6IfPGz3+gDU8nj1thzQSWhc8QGbGRddBCFKMi5QGtheFOzVtc
 P57IWOrdgMmDCG+ls63hndJfggR3Ckhcwsv7TKStr7Vdi6FRbAMRWJvYd8gZDCZ/1vLN8vHKOng
 Vs/Q5dwYMaF8nrjeFizx4xz7tUC9ZrmAG6ELFL/SfVQffc77a/DtQ+NnMMHbRPQI7OPT8dGAYsL
 tcnzBbaxn1sFCP8gumheO3osxsusReSd0FpjbYEliMENkCaOHqjKK3geWrtQLR0wKJDrt9Ljfa9
 dQZOE8MAqFHz407Y4G8v3gYljh8OOQ==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68ee0903 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=tkggsdbV04ru4vqEU2sA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017


On 10/13/2025 7:39 AM, Dmitry Baryshkov wrote:
> In preparation to adding more Gen1 platforms, which will share a
> significant amount of data, rename the SM8250 platform file to
> iris_platform_gen1.c.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/Makefile                               | 2 +-
>  .../platform/qcom/iris/{iris_platform_sm8250.c => iris_platform_gen1.c} | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)


Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

