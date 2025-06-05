Return-Path: <linux-media+bounces-34122-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEBDACEF3E
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 14:31:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DB14189A529
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 12:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 263B221C16D;
	Thu,  5 Jun 2025 12:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LiDtUYWj"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF568836
	for <linux-media@vger.kernel.org>; Thu,  5 Jun 2025 12:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749126658; cv=none; b=d3fW1y93ZPPgib4LhQGIlOqzJVI5COtxRhrR8+/v7ocORIdAWRHRLjrNMcWessPQWm5wLbVhYoHXeW+g6fg+bCzofqyia7YQlAal9iXgAL6mcYA2wwVCu6tQ/ZVrFhDJxmEtjvxwIxWnPmFC+7ELbw3Qk2wWl2vOc2F4xVFr1Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749126658; c=relaxed/simple;
	bh=TZWnThcbnTjWRdFMqMCAUjB+YrFrDzfgiH5dW0zatfI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KIrYkAE5+pE4bnwezoXUuUslhasRHQUQKyTYTXOZDilLKxeCxS+cKrZMmtTyJXVAFC0hnBeCAJuA3/ZcfRtb2ROUFKGm0kPbyKNRuz9TP3XmBi7zCEUGe7AdKWeFythjcKqegSG2VCCVA7BN5scVL6zuqQvDu5GVl4nbhPC38v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LiDtUYWj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5557vcJ8000905
	for <linux-media@vger.kernel.org>; Thu, 5 Jun 2025 12:30:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8zoylx1QuLi0pZwoA6HZK4hy
	+63LtfiIZwBR+DzOGNQ=; b=LiDtUYWj/wzhy50SS2P6OKcl/msD9X9Ubi3i+OQP
	AOxAHVNp1me+zbUvD3+LocuizFESHC7TqjZgfxHSEYPtfjv7KN3f/8TLBgdPevuB
	JGSmIshnDWUpc+yocLmAtFA4DuTkWIBtWce3FyAmuXjw0/Owz7vHqx7x3M10F8LR
	W7Vtg7Uxm2oVt+X+0pdAxD1RLvv9OUsWTmdCnBcl3NLcF9hs/3zBIKlePMNnAcIh
	pzXKYdmLzqtrNuOsBZdYZADhf/UVxSrtadTp8dkiIGT08VQ/iVbn+xpdPXl3ELbh
	iZgtNjQs7Z0sMvBBPe4BYorH3qaJsvC8+ZQzuXHbpFxuqQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8q9a63-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 05 Jun 2025 12:30:55 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2358430be61so8295975ad.2
        for <linux-media@vger.kernel.org>; Thu, 05 Jun 2025 05:30:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749126654; x=1749731454;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8zoylx1QuLi0pZwoA6HZK4hy+63LtfiIZwBR+DzOGNQ=;
        b=lrTDbKMCr4gYYdm+/osprrmxQrRpjU8zly2Sim4Ek6gn0YTxf+5y7pAI4d2E3ZqRFO
         scYgPxYmUHY6QMY1lwLECgYBYhXPO7sMQylB+axRKnybhIdEwUmj9FS8lRuvhWbES+aG
         g2jyeP8oKPG+PMrE4YoN960IbyCV0ZN3S8xkFpjaCnOusmHAgkTNnnz6HGrU7hvv1q6k
         VLTboGvOkGa4e/5s2VHUKtwX8zIZOuuA0f5uoNPSgAzVBRubcgfBXpyv8ydmrG+4bRCU
         JpxOk1C9vU2kXXMpn3blgZscpHF6f/IPo0WoSp3pwJK7B4Mnf9E4OEzShE38jraXDF8+
         0pIw==
X-Forwarded-Encrypted: i=1; AJvYcCU7WpHWDBW2XVdr1mx3PnyIZjLw8IzxcDtNh+UkseTWm4DXjgi9MjAy0eGgi15WLykmr5L/TLcrZHieeg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0GTc6DxuvMO3cbg/TZ7To++WF7rNixhJf4C5BV6m/HW6Tho63
	b1GX17gf2zO5TqD7opP+o7gKmRrQCn2uqIW/W7fnBGXKTVENAssIHJHQPyW7zlj8BwbWuIif8eP
	enDHTyGjxyiz4g3iKU7pkSjFyiyo2NLEHvDL2Fi/1FNpygqT362uxN9cwdeWcVGI497BpinLTBH
	9jagtvaBftSIzpNeKdCcqmc1aEvykisSrdUSg4XgA3
X-Gm-Gg: ASbGnctSdy3Z1I6VJ8NhdNVPjmxfwwqqiZOcS5xQXZiyOjOLzWMzccRP+sIL1xCzhLk
	DyNkoK8Ds+Zk26v9z9r0XjUM0uYvOghLi/bWLTY3GtZgnkunpE6CB/KJhWCrj0uz4Ib++
X-Received: by 2002:a17:903:2305:b0:235:91a:31 with SMTP id d9443c01a7336-235e110ddd2mr77356095ad.8.1749126654152;
        Thu, 05 Jun 2025 05:30:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/NaZFI6I8Q3iARrRK1yLX6Hwez8SAK/Pvn5ED6d5mV5zGH3OfKI9Oe4s7eSFk9px/R7JbYs2D+oCJQiXoxLU=
X-Received: by 2002:a17:903:2305:b0:235:91a:31 with SMTP id
 d9443c01a7336-235e110ddd2mr77355695ad.8.1749126653761; Thu, 05 Jun 2025
 05:30:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
 <wmri66tkksq6i3hfyoveedq5slghnnpozjzx6gck5r3zsiwsg6@xevgh54rnlqd>
 <285cae4a-219c-4514-818f-34c8225529de@quicinc.com> <t6niql4jfotjnbducypwxkdjqt3or7k3rwmltvbhifmpphsiwy@er56ey4v2pzo>
 <a3bf69f3-6500-4e45-ba34-8ba24312938a@kernel.org>
In-Reply-To: <a3bf69f3-6500-4e45-ba34-8ba24312938a@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 5 Jun 2025 13:30:42 +0100
X-Gm-Features: AX0GCFvjBbRAMAXejejAvGq6nX_oZcZYy7MLtFcpvOHrihpW2Eqenm74lbaZ_iY
Message-ID: <CAO9ioeWkLu+ne18kjEST7YU7b1aBzcMBBeyfpagzis99BAeOHg@mail.gmail.com>
Subject: Re: [PATCH v8 0/3] media: venus: enable venus on qcs615
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Renjiang Han <quic_renjiang@quicinc.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: f6Lft1QKajZuFy29DROYjOS4rxjBssJ1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDEwNiBTYWx0ZWRfX3hvyLr86AVf3
 uF+ha/SZRNn17EQEECCXmXhpePDBoOoV3GMwaEh+ynpSX43hFQZfVJDJ5ssXCS60MW3dvPif6fB
 UzdiUF8jKAAfb2c7PGeFJ+dbTr9VeLJE5+tE39idhcNdYMzrGMNC8Nl5ULKY6+8C7XB+QsfevWs
 +0wGlvyoJXp+SzNmGl3usSIHYe88DgOcq3RDVIaYuYLFMK+iO5NFgXhABVrPSkdzhpZCt1Uboec
 8/UmaitIAJ/TsWO3q1oiyftO7VBDmw+vUiFJBp+JS59NtrJK9a9WZwwHV00k1KNJakavNLbxiAO
 0Lv/lA6sdWQO6C1Jxj9a9y1ytjVbpFbUPQL4siOnr/cgLYToW+T6CX9kj27dnpcnF9/ujNmrrmQ
 Ah14AH9OZw+8qoWykw01Zs06OYw0EZE1GzL/tnRKGYNEn9iEZjyoFLEP/ibJCnyO90W8s/U8
X-Proofpoint-ORIG-GUID: f6Lft1QKajZuFy29DROYjOS4rxjBssJ1
X-Authority-Analysis: v=2.4 cv=PrmTbxM3 c=1 sm=1 tr=0 ts=68418dff cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=VwQbUJbxAAAA:8 a=0G5chWBQ-Mji-mtY-ZkA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_02,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxlogscore=433 mlxscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050106

On Thu, 5 Jun 2025 at 13:13, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 02/06/2025 08:16, Dmitry Baryshkov wrote:
> > On Sat, May 31, 2025 at 08:05:24AM +0800, Renjiang Han wrote:
> >>
> >> On 5/31/2025 4:27 AM, Dmitry Baryshkov wrote:
> >>> On Fri, May 30, 2025 at 09:32:12AM +0530, Renjiang Han wrote:
> >>>> QCS615 uses the same video core as SC7180, so reuse the same resource
> >>>> data of SC7180 for QCS615 to enable video functionality.
> >>>>
> >>>> There are no resources for the video-decoder and video-encoder nodes
> >>>> in the device tree, so remove these two nodes from the device tree. In
> >>>> addition, to ensure that the video codec functions properly, use [3]
> >>>> to add encoder and decoder node entries in the venus driver.
> >>>>
> >>>> Validated this series on QCS615 and SC7180.
> >>>>
> >>>> Note:
> >>>> This series consist of DT patches and a venus driver patch. The patch
> >>>> 1/3, which is venus driver patch, can be picked independently without
> >>>> having any functional dependency. But patch 2/3 & patch 3/3, which are
> >>>> DT patches, still depend on [1].
> >>> I'd say 2/3 and 3/3 still depend on 1/3, otherwise we can get video core
> >>> on QCS615 over(?)clocked.
> >> Agree, so we need to make sure that the driver patch is not picked after the
> >> DT patch.
> >
> > Worse: we need to make sure that the driver patch is present in the
> > branch which picks up DT patches. Otherwise building & testing that
>
>
> Well, that's a NAK then (although depends what you mean by DT).

I mean qcs615.dtsi. I'd suggest an immutable branch for the driver
patch. Or just merging the patches in two consequent releases.

-- 
With best wishes
Dmitry

