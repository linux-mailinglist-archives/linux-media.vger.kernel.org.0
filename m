Return-Path: <linux-media+bounces-44370-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C852BD828C
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 10:24:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3FCA18A2D8D
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 08:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BA0130F94B;
	Tue, 14 Oct 2025 08:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C+j30v6r"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C19730F932
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 08:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760430288; cv=none; b=CZVGoslY98iRlTJj2iGTclednlNBSmwTFkKIzal3yWyn5daNs/KPOLF7RG+FWzBHK0iQioZb0p36rcxW1R5lh9eLQSaUfkbNiD9kJU4i1tQRcvZUah5CUfEbq0azUYtG/q77Gx4G1KlUoTP5/16QY3NV9cuuHyJXyWa9Rxz3bXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760430288; c=relaxed/simple;
	bh=so8XcI+x/03oOtuo3rwz6tNXONPvNos8iThU9PotsiM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BoER40OSJTDLWVQIHa7seaeQC6YGkR3hZm4NkWCGPoEcgq7vk0ILXtmCtuOtETxMmRP2Qd/VffQSuXpu25ffJDvmRV6kH5NtnrM4pRJxIk8H1k2yThefUzJEREgGmW+5RfX+muibXnmlNNrkcGxkSsJoYruIS4D57D2iLl7T/xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C+j30v6r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87OBj021172
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 08:24:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A+TNAe6m1YYxDo2xBlAV76VGS3L4AttFzxuFepNbuK8=; b=C+j30v6rfPat1IL5
	3z1D7ebXOYADCHhLer5cpNDyuehp/1YD+UkSgy7FbM2+VnyBq956jgaShJvwrAD8
	fOqf0zjs66vUSCwGfFylXNmN1XJO3WNhW0AFqQ/TL7B6VAWma92TiXxYlDeGh6If
	AtgHJsThhBIkX30cnex3VdDaZGFkFIBpq0JVAg0OEGymPaVGoQOfNdDEpciLNopJ
	tx1nhjokl/NrEt6KFmOK1c33v3Bt3zPpdC+acAtkKzwyv9afLQv6mXg2NUFw9fMc
	vh1WW29dyqWEnt55eYJV6MRbAyOXH4NV9L7Sl9bQb9BH642BCo6VB2OtkbD90a9b
	5utnvw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49s6mwj0ty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 08:24:46 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3352a336ee1so19133255a91.0
        for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 01:24:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760430286; x=1761035086;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A+TNAe6m1YYxDo2xBlAV76VGS3L4AttFzxuFepNbuK8=;
        b=CbBZXswbW//WC3Inm0hpZD99H4CQmBd4f25xQeJce/5RwLU2UQQIVChy7MZOE2v+v0
         Ndy1uNxtjey/5jMxiYo+mLj3TmDUvSlVy/HOaZ4nNOYYNCPWhQc0LLZstQrBGMzBq49h
         UXQUVf+vP2pJc5rk7g7hDBLcROsOP+ei7g5lAGhKv8+aFHqLOagFNi2Xm/AN2MOwuBzx
         jjcirRmQ5OtQ5zFXxuyCRHU6IRtj4XhxPfrPX3ooteAoT2oH1o5RVAqL3mxa93RvaIPm
         vbQncXgD1sG28FZYHAgShx3sh70zEvhdoHEOpyCJH0dL4KSTv/avddugevdI//s2A5p4
         08cQ==
X-Gm-Message-State: AOJu0YxS6xQhT8K7Q917GZ+0N9OJJcxfRlI0+UCBQrLmBfYjb1ZWwiH0
	pmi3OYJAZFEv65/6D+Y+BnyhOKvLmyEiioB9M9jw3CX36ptWjoIEFfnVpxcXcEhHgMXlkcaNnBT
	y+cjivNmIVaKQob24onrKCUFOSvH3ZFx9jc5F2N8kmh3nRjfdQ3+lrOHD2/ohOE0xAg==
X-Gm-Gg: ASbGncvieKT6yooK0vLRR0mQrzi/RukB5ypAcrM9DE8fML8P9FYSJMcx//o2AvL1AW8
	WYQsr16Si8ywtZ5oh0oY15KMsASsmWMEeKfFOfKgzzaTo/EcGqUkYBbRgcjQg5ly5v0JN/CEq0K
	ONnrBIKYEim7vOJDkRTXa75sK5sKJHsb2wmzHknF2ZBvy00PROoDb6/FQsLjL2EVgKH0lgxc2/a
	Zb3kuOSR8+4EyDsUpmj9i68nKZqQiK+yB42zipIgn1EIjDHMb8E4pARW/OtGOKLMxXH+flW3InU
	FhZABnkEgfM22E5KuDx5+49fD6bjudXRWUDdDpz6vMWEBwcWlpXiZhoHl03hj7BxqnZyL72B
X-Received: by 2002:a17:90b:2f04:b0:335:2eef:4ca8 with SMTP id 98e67ed59e1d1-33b5139a385mr36822417a91.33.1760430285698;
        Tue, 14 Oct 2025 01:24:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG37bvu8zyNqsfUaQaEJ2zLoNqZQDq93XUmQoaKSFp/oMQ0do/nAne528GPIdA76MJk8wYZuA==
X-Received: by 2002:a17:90b:2f04:b0:335:2eef:4ca8 with SMTP id 98e67ed59e1d1-33b5139a385mr36822375a91.33.1760430285266;
        Tue, 14 Oct 2025 01:24:45 -0700 (PDT)
Received: from [10.206.101.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61ac7cc0sm14775018a91.19.2025.10.14.01.24.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 01:24:44 -0700 (PDT)
Message-ID: <7c65a460-005a-3620-d263-53b6c184491c@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 13:54:39 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 5/8] media: iris: remove duplicateion between generic
 gen2 data and qcs8300
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
 <20251013-iris-sc7280-v3-5-f3bceb77a250@oss.qualcomm.com>
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20251013-iris-sc7280-v3-5-f3bceb77a250@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDA4MyBTYWx0ZWRfX7TkVS+OC1ZqB
 vy0cfqsmQWYQoRe3bSzmqggAqHfsFGeWoJtmzBdqIhrGjUas/ayeB1B3ERYbObsode9Snd1sgCW
 KNLYboujw36fAG8U2XTiOFjnnA6+lAf9VroFl6Fbwb+6az4hGii4sN4gVJvIFpIfmJT5mn10+R9
 cxklKOFTFNMgXoMhhteAj7k3aTADWglhy4UKBtYfh73tapaM6g63zbiGO6bFXD8gf2b2/QqubBc
 PRphvCbcXuwcuGSE/fZIVPzgXXWEMO/fdGkpWVCFnuKvuKG5RUknSTx8XE/7mJKlItZLQkg7+K4
 X137Ot98lJa4pVXvREJNJctqx35CQeB/3PkpXQ8AO6h9N99t7kMn4qn7AJ0CrxrePOw7j8iVcHW
 MoMkcVhqhV+Rl1+EBkCPlrPQ/mr7/A==
X-Authority-Analysis: v=2.4 cv=Fr4IPmrq c=1 sm=1 tr=0 ts=68ee08ce cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=-8pfya1JHn5qUPT2TrgA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: FY3a-IwoaTAaeR2zZo8xztY-5EA8cSdx
X-Proofpoint-ORIG-GUID: FY3a-IwoaTAaeR2zZo8xztY-5EA8cSdx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130083


On 10/13/2025 7:38 AM, Dmitry Baryshkov wrote:
> Now as we have removed PIPE value from inst_fw_caps_dec there should be
> no difference between inst_fw_caps of QCS8300 and SM8550+. Drop the
> QCS8300-specific tables and use generic one instead.
> 
> The differences between QCS8300 and SM8550 data comes from a
> non-conflict merge of commit d22037f3fd33 ("media: iris: Set platform
> capabilities to firmware for encoder video device") (which added .set
> callbacks), and commit 6bdfa3f947a7 ("media: iris: Add platform-specific
> capabilities for encoder video device") (which added QCS8300 data, but
> not the callbacks).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../media/platform/qcom/iris/iris_platform_gen2.c  |   9 +-
>  .../platform/qcom/iris/iris_platform_qcs8300.h     | 534 +--------------------
>  2 files changed, 8 insertions(+), 535 deletions(-)


Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

