Return-Path: <linux-media+bounces-50446-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E359D12230
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 12:03:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2788C30341AD
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 11:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E36BC23ABAA;
	Mon, 12 Jan 2026 11:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N92VpAJm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NA0wQyZg"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49C92D47E3
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 11:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768215797; cv=none; b=ppIOLLiJTZoTXBi0hJjA9XxBfNjEAUZoWW16FiGRyDY7cJWfygcKAGEWa1eOkMAt0acDdfp4TCHiwUjHFSxV/MaE4xxnZ+OyBqgznPUYw3SNSvH2pIGIhtM/xf+yR4OxK5jLWv0Ddm7S6CjHUlBsTQGV99ZgcFrCzd71hiohpt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768215797; c=relaxed/simple;
	bh=Ac0RtMxAr7r9nLWzPT4woiRfuaN43jxd9G1Dha2yJPk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OJ/R7KorvU16Je4tfY6J9g2YzTyO3UuXvWD7A5T6j1iw9qK1j4IXR7lXhravXwBEc8Su0NAXETb4ZcEogBhVf57wmUnoUkyf06G/n58PFnjNFp+G1i5NRNqnk6NBVxUew5gRI3vtsIHkppz6ck0KT+ZtxbQs1fjYhvE3VcNwQkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N92VpAJm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NA0wQyZg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C7OcT2555254
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 11:03:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dh7GwtFX/nRTX/eU/m8L3lQyGYVksdn9wMWspYflDIU=; b=N92VpAJm2B0J72Xz
	ZktU0OSwjYr40awJYJIiU0YSL63Z6jPC10H6sqrh9GaUnWrtGnKWuAX6CggLNoWy
	yBrm6x1NOjdvs0un5q049WP1IGK1ZOGkD6IRdsDUc3AI/DAked3UKd1oX6wOG/ly
	RmC1XpK2VevFfqM/FiS+uqJda2Ij7ina/r14ks4TVFtzm8xQXsrM9Qxuh8xQv7A8
	Goi+ZuqiMPK6f+G7jXWCwX7Ha1ux9ec+FE4DL5udZTJEfos9q7L1vWemr7tc1BxQ
	xVo4UBaHieS+0XX9Cj124LA8WKgJ6rBEoffaDRmJMulRYWh3dTVPphGPLnNGY2Dd
	qYQWRA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmvhw0qm1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 11:03:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f1e17aa706so32658061cf.2
        for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 03:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768215795; x=1768820595; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dh7GwtFX/nRTX/eU/m8L3lQyGYVksdn9wMWspYflDIU=;
        b=NA0wQyZgAnYqFVP+kHdZ5/kfSIZVF7LebPFRj0l/wVFQRz60F8CbAibIclAPQy5Yvj
         5hlacXAy/8gbm9SXkLe5aSA0F1YROx/SdF9S3NIoao5bEBPRJiL3nIpE7zxSlAv4Xakk
         P4paLaJ+4WLAzrk3DyIv2dFaRTqjWPyPymb2Nij/Rp77c6FbTsphbsoDxvn1rHzWRJQ/
         F/Th0sT4yFY+aF9Yp7BDO6ucXVJ97+Xd3PZWQtTfD7emwaE589v/qSRLiwy97Wg3pDqm
         crxIVZ+y0vCzF3x7fzmHSsSjHMhM5jDBknANS1g2lBNGubrdU+KGqW1ai7/U2sOfBHWg
         YLTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768215795; x=1768820595;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dh7GwtFX/nRTX/eU/m8L3lQyGYVksdn9wMWspYflDIU=;
        b=n3FM0uk5kSOxh99NtP+rWQSN+t+Dy8/2vIFwTH74XdkaPBDouopj7Ry5AP9bv1RjyL
         91kaULMnXpYDht3rIV3mHvXyBBXxTxMyoPEk2pWeFNQao2LQj+2GwRPmpkSstIBu2ydk
         t/5PZV5YWD4IMlG9k97fPbE+X7Hrmb6tyFy/EZ2Jnti9KBCVqsfgcEgUbmG3kOYTG+9/
         vEKqd3bKa1CIgOeFidxkp0QSrWGbVEcVeUqQl2K9MSJ1zxostUMtEEMzVVM8ruovVzyV
         fAvCPcChLjym6o33lhGANvS2/lLKdUSzEyuIzrQDkyCrmihi/2zJLvkk6WofzNYQVsUG
         sL+w==
X-Forwarded-Encrypted: i=1; AJvYcCWIEoqyyJhJtP7zmXVo0Egrn3uR99NJthnWHNvNW2Nbf11fSq9KofpCxA4kQFsec2R3FaBJk6kaLadIKg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8Tdk854I1tc2Gv+Xv342XSqUqYBHEaKvZx7iu5fWCNV7Sqdp9
	eri9U8zReagzWONYbGOjMDzQVttMj8Y/UeCnouxn2t7klesA06l6RKBN/aA3oZS7OFZassAVILj
	Q+BNGQTnP2oQQBXm6rhQ0t1t5IaJOLFZ68+ci9axtDsi1lwVlVwD8B8jBd6H3BLw6Zg==
X-Gm-Gg: AY/fxX5QvwjIcXoaVYK/Idj72wxhyTCy3fJQKg2GCS/t5ZT/dddwXK1/QS9PsUhzk2j
	48AK2FoGuuEsXEZw/kG/oDhagWQzI7bfH8376mYVif465Mfhwxk2xpKeQNNfycavG6CEs/Fz7KU
	siMEw2VaRpG2ou3ZlN7WYja3jGNDLpPduKNnajtSZ3PzGbV+J/HtNFEzXj0NmgaPSdicrJZcPye
	Z8vdhdwXl3NpXMSoakxJaoha0Kftm6t6wUxsJEHNVP1NgKLFu3zz5T3UX04TDSrG+eJs3K6PPEU
	EpQrSenkMxTeEY5fWe/gS37Qs6kYHYmVIf5FEduB6YSnTZMebGUl5jhnxnmH2E1FE+H3irNoSPQ
	FZR4vOAMHjlj3upeAh6Z1TneZ1a4UZKXCzKd4+E3/CZvJdiSatJviwElgixBJNMXooMY=
X-Received: by 2002:a05:622a:5a8f:b0:4ff:b754:3a52 with SMTP id d75a77b69052e-4ffb7544295mr183416251cf.0.1768215794631;
        Mon, 12 Jan 2026 03:03:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPdWC6RVtIWLJZLBsPSoSldl8ze1rlBRJp0qiP2IpWdz0SLjxgaaX3bN1FJ0pL6PgEwpUCsA==
X-Received: by 2002:a05:622a:5a8f:b0:4ff:b754:3a52 with SMTP id d75a77b69052e-4ffb7544295mr183415731cf.0.1768215794228;
        Mon, 12 Jan 2026 03:03:14 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b872642beb3sm153934766b.46.2026.01.12.03.03.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 03:03:13 -0800 (PST)
Message-ID: <5865a207-16a3-4448-955f-beb769c1931a@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 12:03:10 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/11] media: iris: don't specify ubwc_swizzle in the
 source code
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
 <20260110-iris-ubwc-v1-6-dd70494dcd7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260110-iris-ubwc-v1-6-dd70494dcd7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4NyBTYWx0ZWRfXw4ZhGRkrDMKc
 5FozYctP4nSu71xateN47y3UGM7SA/hlcmMfSuloyGIt4fMqm5GRU12Ubo0t6SwP5HuEoU1JACx
 ZQv8utEL2yMSwjln9Cx1eHEQxPFJUxEirpKanQ4Ed9JAzWddI5UeBC230TQiddcqOjtzGFYuOqU
 rtjPvDmBzZkIpboNCFfXClz+rPACFKYp4Bu+lnpBfZQiOn8Jexnajfx6Eh8Mvfut24jNpyLTKXW
 bNnb3hJU6qgH9QpNqX0lgvJpiHECmG+VBZD0oTUS6iRiFbZfxSO0oQKTMtRq3ap0vGTaeRHBggT
 G2s3Rs7HdbHDM/QBlkVWUE/brvQ0jWsyZMlChyuxIcP5HQ8YL3M2/ASZXVI3zBc6XsGONNJpgln
 p8wDTrqIVia1XEIv0kk6fEpietomf9qT/63jdVVoOZkX5PCy5DF7bXkTOANDvcuKWTt4tX++OA8
 CLiM+Fl3sbVL2MIcYoA==
X-Authority-Analysis: v=2.4 cv=JP02csKb c=1 sm=1 tr=0 ts=6964d4f3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ss-qTuU1ZYQsC6pQTdcA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: jFylMJ8VXQ6PXzgt-zKpuPOJdviMsyQ_
X-Proofpoint-ORIG-GUID: jFylMJ8VXQ6PXzgt-zKpuPOJdviMsyQ_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120087

On 1/10/26 8:37 PM, Dmitry Baryshkov wrote:
> The UBWC swizzle is specified both in the Iris driver and in the
> platform UBWC config. Use the platform UBWC configuration instead of
> specifying it directly in the source.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


