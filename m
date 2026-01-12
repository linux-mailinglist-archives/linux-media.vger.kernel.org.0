Return-Path: <linux-media+bounces-50452-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B4ED12308
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 12:11:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79A6130A0D93
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 11:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BD4E28F948;
	Mon, 12 Jan 2026 11:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hfx+xYZR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YD3r6PeD"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAF42D2493
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 11:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768216087; cv=none; b=i7Tmj/cJQt20jQ++dBmNZvXWwn2yEeF2/Ntqvx7CAzpAU7Z/OT33+hbkhMzKExsD33n8gn0Xr2jrxe9rq152sMPdX8xZfHyUKlU6os835ClV4++3Zo8OhHkTURJboFYwqkqCNDKPFcfp1XkqsGCzLpp1BOa3pqug/myjAraIhIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768216087; c=relaxed/simple;
	bh=ttRq3EIRIZYlO0QVYLhCDFcObVhsZ+Odd3rWoH7N9HU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YFEujA+dQhn5BSsQIy/czEJxyira9Q3wy1hX9bd/btqpkexBSJAk3mRkuM3jLo92KPjmvsmuyyTcV5GfyKgEC6ANKk9HMWMk5/DRx8E2sfBTKIjzM7nufDTY1GyzDSkh/pDmq2ZMA8Mk1J4Hbc/tiTA7zJ7lgIgadq6XE4C0XYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hfx+xYZR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YD3r6PeD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60CAEWaL1315822
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 11:08:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wxJGoCtvWzd/ibCsZ4iab40VKlglbQukDFb9mt+kQqY=; b=hfx+xYZRpVkUeymA
	3Ja8ykcT4C3u6CIn0RzQonqRYyirG5dg5XnSuc/yDv+Vg1LBqfWtUq4XP1mOw4pP
	uQsYZFtCHvsb8Z7/aN8c65lRxdsURNE7GJkf4hPPB9/9Cgq0GJFRpGvTpfajeJA1
	MbbsTBgSJK2OaNIEHHseiuXlksLMhLCUpCtk8efail104nbPJYyIxjW85JOQo+BZ
	E1B2O/J+m/pUlEpcsAqcswd3giu941S8lyLfk0N7vJFe9jF+C/zEvmkNhHo7wHF/
	wZpd+zeOkp1KdC2wX8b4HywuXpRqT3IhAhyHJufU7tLb+LSwT8K3XoV7Hm8xJeJx
	lX9ZsQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmy1hg4j0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 11:08:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f1aba09639so17054661cf.0
        for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 03:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768216085; x=1768820885; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wxJGoCtvWzd/ibCsZ4iab40VKlglbQukDFb9mt+kQqY=;
        b=YD3r6PeDytbiv0na47Eq8Vs7sEPFnqT86YLpjmur0WqITAXwhqqH4yx8tgq+NlpYOa
         vdBxe6X329Icjk/DyUzSZLOx6NZX8oPITQ+Md+i1cEWveaZQtkd7fm0WmI5MnV+Ulktp
         zbfmQuSPkU6ciKF1o17Y9VBr92hsoCfYmUNw+UGTB9c8IKUp/FGpgynp8gT0OxzHXFX4
         Ci/uQH4HdssuUrOQx1Rcyc/3mVEeubY2xagKiyZGgsxvK+FX9QEn+dn0zuGZxSvMhiFu
         LHtjczZ4tYLEnOMDYmgOelhjZj+/eGR6nAHTdeQBpUZqKmtOfbOYF+LupvaYsD8ml+ZN
         ax7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768216085; x=1768820885;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wxJGoCtvWzd/ibCsZ4iab40VKlglbQukDFb9mt+kQqY=;
        b=CHAeN7qIDKfexXsILFAtw1E6Z15Fs/TcDI3woA0MTL3wuofTAKb74NRP2p+AOiPa3n
         lgyyqEpdZKgZ7IV1xffPPLv5kPX1JdNGCbh8/fLyNq+Hvj3j4nz7my5JAlKbApqnyrOr
         K8L/UseWkaFOxe+4tGUtolKA+2JGQyzWcEH5ZsldPT22iOW9JTggxAAWmBViy8hpy971
         KcSakEYfPkerUuL4m+xlCVJKDX2W0MwqU47ZJERAoFLrov7KToQFoNA4yF5GOmf8KSrG
         GmZwU96GPwiWlfEu8L1lfE+91KsdwJXG3BSEUirSE1CqfZatnqixOd7ccKYSrki1k8zO
         6dmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBe2P59XpTPel6w2LYa950tgtcobblvfLzM29gG2lCI/MNRoIka0MViGZB/0mhxb0JOCTQo7Xv5qiL1w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh/rsP1dO5j/iJu1euQgPvDAHCDMSjuHZRH7T/PBeBxjKFnXCX
	+8ClQ3DnWBpOVajXhyhuqQwsQrje0boryeZCmQK2vAqgW8HIIPC0y7TQpqXihRRbAbHTOKbMo8y
	kGPi9MvS9xxQ/T+Izi8fYwQg76Hi3JEaK4OTdbMV21EagHzBMqwvCl4ZlbODf4ljFeQ==
X-Gm-Gg: AY/fxX7h7B3uvAmiAN+bMoy90cdwucB4yyA88J8pxq5JI+4svyVlt8SBg3BGjnxQgzO
	X1UcxMKDqUhUid59K4uhXFM9cnViq7qVhK69tYvCW12f57rMWjjY3WjM1k5vIdq09MQL6BeBUQX
	rdzuWKDHrIFxJuRdDXmX/W1EmCBreW0hWzyvAsRYEtOmX43Nm+cGbLCnzHUU92rYJ+p38ZbD/Q6
	GWNccdUnqd1/9TKqOUbLxk1cQo5pPk4991FRs73Oo66I/Vk/4ZhwWXwsP2hWYoP3tBkm7mTq6j+
	fxvdKjMG+UuX9VzM7gaworiCDDnjp8nXCNpGF0Jk/r68jZ4QgeooKdwfGLuvj/LDu05rMhej3UL
	7EGCRCAXteZ70hGSQE0EjENEP3WNU6coC56LXIT9uR1HmkALPGpPjQUprwPY1avUBSyQ=
X-Received: by 2002:a05:622a:1890:b0:4ec:f9c2:c200 with SMTP id d75a77b69052e-4ffb4a6d91cmr183969571cf.11.1768216084938;
        Mon, 12 Jan 2026 03:08:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEMgyGfFYE6XaMmeLltZggmuQ6DITKn6VVK29vyczbb9806g1/vlY8V0ofwUK5H2Z36AvK6RQ==
X-Received: by 2002:a05:622a:1890:b0:4ec:f9c2:c200 with SMTP id d75a77b69052e-4ffb4a6d91cmr183969101cf.11.1768216084412;
        Mon, 12 Jan 2026 03:08:04 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87124e1a1esm374226066b.48.2026.01.12.03.08.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 03:08:03 -0800 (PST)
Message-ID: <0630acb2-f18b-43de-81d5-4260b1add934@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 12:08:00 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/11] drm/msm/mdss: use new helper to set min_acc length
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
 <20260110-iris-ubwc-v1-10-dd70494dcd7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260110-iris-ubwc-v1-10-dd70494dcd7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bkJbFOJy2RZlXf30OR6ZjW8_d0235bbT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4OCBTYWx0ZWRfXyYCnqtOrLeCy
 5tkYyJCkTKnK7B92QXfydoMT98qskQjRmig2E1Un3c4n0BKnADtWRKt1ixP64wNWYtngo7/DwVM
 i3CFUfA4rZNu9/s4dCy8n8OJlcWOdeUI7lFZpYkSiFKfqxeP0o3voH/9ATjv+jHf9YFX3joflCg
 /Fjnfyz8AZAfWR836ahpbtw9PfbW5Ts5q7d0knblJggog5Ay+0WFOihPfk/I9NkDayivLVqSmMQ
 UGE9TnJUrYBVuFEek50y/RG7qRdC2827ALM/p9EdqjK0h8pDluJgKV67MvErgpuJ2fMPM5uD2Qk
 SvtUJY+gSCXVd74li+3exZL71dYC1nLAInVMg5JbD4KwXny7jdHdMqO+TGoLNcSk4MNkx14O5rP
 JhAIWzrM2jKso9L7Hn+K6JfA1aO2ZiUvUb9ZGicQvA1fBhUR4ytUBphiaVP3BlabI1LS42xrubA
 vW3YJPj5CtbB2+p8mrQ==
X-Proofpoint-ORIG-GUID: bkJbFOJy2RZlXf30OR6ZjW8_d0235bbT
X-Authority-Analysis: v=2.4 cv=EovfbCcA c=1 sm=1 tr=0 ts=6964d615 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=su5gWXN3lQTy_5l37lIA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120088

On 1/10/26 8:38 PM, Dmitry Baryshkov wrote:
> Use freshly defined helper instead of hardcoding the checks in the
> driver.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


