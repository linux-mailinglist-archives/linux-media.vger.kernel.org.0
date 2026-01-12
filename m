Return-Path: <linux-media+bounces-50449-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7B7D12290
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 12:06:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A6F293050016
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 11:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88D4D35581A;
	Mon, 12 Jan 2026 11:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T5ZYtTpZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aQZLeUHm"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C725B34DB7C
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 11:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768215979; cv=none; b=CHUd9/pJ1HjAzHhJoftnQMlT1xqQmiREPNjk0QYUKLLHRzKP373BGS0qwXlmKEwaM6m59ZQh7otO5dGHRnqz0aaxupE5TBf5pEuZE2sXaNOFXZZGdat5HIiAj3BNS2TIX62W7sJKCQ++7k1iWrfltGyZNoMmEMy8g1OkCvX/UsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768215979; c=relaxed/simple;
	bh=jPrW8dy9yhomlwRk0yMvp69HdNqXkBKMtdrI4ho1R4w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hwK80NES7YdOx3XNNulIOrZ3RspKDwv4Ftt2eVGzhm9/KOP88x4VOjEVwp8stFGRYrZleH9PkOcDEnqLUae49FTj5s+wU4HB5K5RmNsnsKMLmYc7mHMysu6bh3+ivrB8pC6Q+9xIOBwoMyfemTEBiqlNsd/bTEV2mz66Hdx91Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T5ZYtTpZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aQZLeUHm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60CAEXPe1315847
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 11:06:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8afs7XBatBRPfjZn/K8JHD8vDykz785GYcRAb1f0hO8=; b=T5ZYtTpZSe2TzbqX
	6JHS/5mADeL3Am90SylVsj90XQWwXfZbUbNv++j7poNfVC8QaJnqJpzODV8Rhcub
	7fqY4BTsGRpi+33pBSLWW/1JjiFc/8+kPP0yCui4u2tXdofpvUTlVMuVN1QNCisQ
	+8Y7AaGbpxLRkX9PiT1aXYo21ia+uZVvvIYYs47aCkV/MQVq76fJrwE/29KSllfj
	sIvpOECx4kGx6d8IEWtnMJTkhyZQdzQQ4hJ2b0ehBqI6YmSbhx2L23LvWKJJs3I7
	tZB6YSTpsIwF2ir1kOQACDew1mqI3d5mHns+QJSAP8BUp39JC9B1reQ1LJRSX1Tp
	Kg8NlQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmy1hg4ds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 11:06:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f77be4f283so8728121cf.2
        for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 03:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768215977; x=1768820777; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8afs7XBatBRPfjZn/K8JHD8vDykz785GYcRAb1f0hO8=;
        b=aQZLeUHmEnWYLwuR9AcXCpSCGGdG9ykrwwsgNifI9now0yx42Keba/I3ECl9cqJtW+
         R6aL8LW/zCzRhy01ByZaL1YwRolwksZvI3H+oV9Rkis2NTM9cTJclgeHYD+qsguIMTK7
         d9tv+bo2jbIzkTRt/+a1KaxsaBHrizrtDHbSEJblrp4b0h8SIwyRYDQzFwqfxxLpFLHc
         Yf5XGbnLckfuziWE8al5fZ+iFX6igwTdaAaYrjTgIChtGtBTyzycnQGsL5yzFQEOvxb4
         ujs1m5F8Pvx0EhjgY8hbqfUv6E9YLJ6vLQqZv3r64P8J5mg4zRDYXnhHYt9ULVVqFtYO
         NKQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768215977; x=1768820777;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8afs7XBatBRPfjZn/K8JHD8vDykz785GYcRAb1f0hO8=;
        b=V4SZejGF+R9t+WW/1ZGWQiQ9YEeBRqj3IwujNG/6fWm15XMDJyPyda/TGRwI1my46W
         CtKoOn0/7RiE4nwiyNYQOwG3hU7Oa6D1gCcLwL7E/gfRfjlTXMGaiFd4d9NiSqf41xSt
         ej0hn16u4laH5ItPII94M9FZWb4yDa5x6Lkb4/UQtdbStr9p4ftPD8vEGNQTcGeKhUET
         FCuSc/Ue4rmrZM6lGrIEBuqt3lRE6ifs+rWR20GS0/Yw4iXUU1/ex/zyi98Gnq7oENXb
         BxR2gZw2b/8PwreCuPnVDKT/ZvbFuTg3FFK2lvBj/hIYg9EcVz1F05Q6IK5Yf9PgWiRw
         CdvA==
X-Forwarded-Encrypted: i=1; AJvYcCWtH9N/iYeCBIGGvBcuNeWieHn4S1iCUZ8Rx8LjNuHYnDwG8ruCFAsN0zrXgqVil7LOULNX3XlGneAUaw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj/I+1biQxOF+pArWvp2PFKwinQa/sRDbeOCV3e/NvL202Na26
	lRgEejnjNtKFSfA/INig4IJ41+e+hht1Wgt+/iQxspbS7t25VP7IGnaQVNSwLSelOkZkJyxueEt
	x3k4fpeh60O6Xb/D0t0hSdGqFBCIqYfXV0omZuQqaok7ju5/c4URExa8KFwUZvXQytQ==
X-Gm-Gg: AY/fxX7yzylYHg+XIBZVHbMfQGPZ+jU1Px4YmAOrPS/B/s6x0/VospuySMyV0NDQUjm
	6+g1UnKwY4qi2eFJUXkpSfDTZJXlIoAVlo09PBYjwzASl5UB3bEEG5ldc3OZ6tlxz+dQdE85iNB
	+qEdu9hZQR7v3rK7IYfJDjGT/0twYVe+ux5RlpqbZjvWyLdRrh4SYx0FUWQST0c+eQPoHF2bJDh
	aOcVdQm+at1XMrsYjMUFzQSPylDuNNNFTmDSvXdgTI2iR2KaZyMX4kOoR7dVI/dugPCyOj89PQp
	wwWgRPCsjhAPBRqYLj30V7ixk72x63JfaK4tvU00CUQtowtP+/Mthutxcx2jRe/WVc9uha9nHTc
	FH+baFt/jzS7cShvzlSXknYFKgBYh/hbEL5ejjLil2BuNKHdKAaCZAo9CZ0XDpqreEGM=
X-Received: by 2002:a05:622a:1890:b0:4ec:eec8:e9cb with SMTP id d75a77b69052e-4ffb49f6842mr188340891cf.7.1768215977107;
        Mon, 12 Jan 2026 03:06:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEoROZPkrFaKwWGha6CXTBLtHxCU47doHYO2L9KQ5RvLt9XOFT6EtYsvfRFTpRB9pmoi7emoA==
X-Received: by 2002:a05:622a:1890:b0:4ec:eec8:e9cb with SMTP id d75a77b69052e-4ffb49f6842mr188340531cf.7.1768215976475;
        Mon, 12 Jan 2026 03:06:16 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8713416418sm381115666b.49.2026.01.12.03.06.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 03:06:15 -0800 (PST)
Message-ID: <9c9ef8f4-8305-4151-b079-f24c8cf8d51b@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 12:06:13 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/11] media: iris: drop remnants of UBWC configuration
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
 <20260110-iris-ubwc-v1-9-dd70494dcd7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260110-iris-ubwc-v1-9-dd70494dcd7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xMXQ9F-3Lf0VZlTwLas53IhCY-oegXJ2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4OCBTYWx0ZWRfX2R1anL/eWqMb
 JZ0DHfcQ2GhrOjth0W9/KmlykrO73ZVRSjbj8BToIVrlEKjknOGpfAuuPCd9ex77a88xhIzh4Tv
 e2DvyQgZ6J6pvc9ps1S/84gb4UqKh0azzzrZiqBPFE2PYXVf81Bcptj+NwTuqfJv2aPOqrXWb0L
 S6KvbEFuKNQ5A8zBUwuKc3CXoAipOpaZEYUznJ2LRhVG6EswMMH2T5TV7G3rNo6/gRtdYomEFEr
 y2qcSF6LJKJldQBwnld+Us6bdmIjaFIURbmcCxnQZQylc5XQJeMoYnns5IzDlg3ChoZGDsSDx1E
 G1Y5dffRwqQIQyK/HHPXT4Tr2OUjhiXRhrM0ocGQHVgClTp2Oc6SpZAE7PGOcH9+WA+lmQhJmvk
 jywQd0vMyMObjyU5Tya5Yev0Xv/UXYUxp9mpiGbdQC2vlnLQT0wD+D6Atn12YlmPWNkJCVlp7OB
 mEolRhMarPXyy4ELYKw==
X-Proofpoint-ORIG-GUID: xMXQ9F-3Lf0VZlTwLas53IhCY-oegXJ2
X-Authority-Analysis: v=2.4 cv=EovfbCcA c=1 sm=1 tr=0 ts=6964d5aa cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FQNS5iDjU0T2HGSwfYQA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
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
> Now as all UBWC configuration bits were migrated to be used or derived
> from the global UBWC platform-specific data, drop the unused struct and
> field definitions.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


