Return-Path: <linux-media+bounces-35927-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 321C2AE95A7
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 08:08:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B88205A37B2
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 06:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3A882264B9;
	Thu, 26 Jun 2025 06:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ctxmq2RL"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC17204F73
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 06:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750918106; cv=none; b=QbdYLOFNA4yceu9O7OhkYKFo6SoP1j1mCNmgpRFfb9ZRXo9WJUXTYNKmxfs7W7e7UIdwK1qWFQiL6EwxVKyyA1vvLWt6RskHhqwkpN5xlIxq3aiBNxuZ33Sm32sxMtrotqjJEgGnBx38FJ4ZIBp3sQ9OklEmFa4YGxZ5SfXt3rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750918106; c=relaxed/simple;
	bh=hQt7Bb+9AHZnoLo9cKQWepwSiZXlnwjoIITYMD6kz1o=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kLI1H1eKrM8saa6Vn5ZesPOyyH9kX9mvHME+q07Zs3C7tf+hHryKLHxQycDd7k9pFmmsPrr84DQsMTe7rdi8Df+4yck3RY4oGhHQLo6vfQ/R/fkJ+Et5SvdeIoUpJ/JX05WRNMuOMMCQk6iTn0cyyvldbMxh9YjwJEdkdsJNZ5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ctxmq2RL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q0Dnvi008318
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 06:08:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JgSSowuZf4akXznD5e5++XsT
	7x22KvtmyyRb459j924=; b=Ctxmq2RLgZ6RxWpMA06IHd8X0JAGu/tBkkA0dPUU
	qrPcAsIM3REiCkumKTxejL6N4onSYH+KAdiRNlz2iSR3twby8ocsisgEgmvp3rcj
	E9WXyKXVEKDKzRhU05K2Bye9A7KnPVpfKylg1YRvuiWf/aEEDxiq/gY8cv5athIB
	HdREA1Xn/pt9yE97iVbiwHJuXaMnkGcC5tfYrs4rh2ELEtwrAqs8YpuM6SOHro+p
	1KA2nLFCZwDpZYVllCJnbiodpQ8JkCCntG3kyRKdpbX1nJIj6nPASfz7K10zRFKi
	kYTaM8BsRE3Uz/c37BkOEFpJrOAQ8J8it/dd9h/G/Y93tA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqrkm6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 06:08:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c955be751aso87664485a.2
        for <linux-media@vger.kernel.org>; Wed, 25 Jun 2025 23:08:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750918103; x=1751522903;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JgSSowuZf4akXznD5e5++XsT7x22KvtmyyRb459j924=;
        b=RqqqxIV1SMKbPcYd4VC2mju9O64gjtY9VvL0eNt+9t/sfweAEtblnxTC526K6LCbmE
         ylmpw/oUJbe1TMsx5t/Dax5L7++7Mi6XUB5V+tom+kGB0vJP4gyQIKtB+XDO6KeWBRBN
         yUbiYUpMTVjSn/eZjVkfxAKQqFBf0Sa+U5fBLOQF9al7jmcdu2pi6GzvRF9wTSVQ6Qnq
         CgOHIFrqcicBLLSEJTDxqumCbgRiNdkpYaxQEc4pcJMzhMYtqbGAbx8bJjGEGKl0BVn2
         9AA89UjTAyZwhP+bjv7RyWJiJBSBz3prb7uO8x8ZztsUqfiCm6Y6qJvp6DhXoQ/cIxTp
         Zduw==
X-Forwarded-Encrypted: i=1; AJvYcCXmDpc/phnWUvc/bjcrU2FFPnt3q/79cG+UY7cKMVjUDTAc71nuji6sCeatwfTLyGNfQGYacR5MK7vphw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0HgsZi4K/p4GQ5PEPQos04rNWdf3wOUEdY4nAAu6PHjjwU6j6
	OuvufU0z76IlnNcQcgnoEpB5loVM5adcgoxGUzMmsau967R6rD60Q9+123V1i6gyi6iq10Zzt2M
	JqxSZQFs1IZp0KDOC5z6kV8t2RzdNUQr92hUwolASQaNQsgBnG9CnHDvaClswp1uMDA==
X-Gm-Gg: ASbGncuhpBHotaxp/2cD6HdpPiyvBBMqD8FasafdZ0O7dfl/lMRsymxOe9ttLVz25xt
	kaibW6fu1ljnLKwxNZ+xVPeqJ7y81eLVqfsU3mgc6Zkfj5gft47mTttrdDxbyWulEFD3nhEg7IA
	fwVoBP7VoIejOh53foB2oUvbxdqQPGK6ZEuVl+HeNUxIHKgiefz02EKASIsB6/Q1m3aFiFkLQbN
	AOMBkzKwxt8HltlcMEBTrAuLgVApomeqAOWo92wDEpaj6jEIWiXq6dH0OnEckntsRNX+4Msjmll
	x0hPAhu/C/pDKCJfMxJZL+JQyyW+sOYIq4Sa1Y1hONhO4+fU8ogT5e6jwQ==
X-Received: by 2002:a05:620a:178d:b0:7d4:3bc6:1df4 with SMTP id af79cd13be357-7d43bc61e4amr309276485a.16.1750918102929;
        Wed, 25 Jun 2025 23:08:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/nANbsNfBPYKM6JWc6VRoFZoFTj2niADtQPcOroE/JQv3VpyDDjmmolr+6Zi96Ucr4lEHUw==
X-Received: by 2002:a05:620a:178d:b0:7d4:3bc6:1df4 with SMTP id af79cd13be357-7d43bc61e4amr309273185a.16.1750918102498;
        Wed, 25 Jun 2025 23:08:22 -0700 (PDT)
Received: from trex (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453822c6b9fsm39477585e9.0.2025.06.25.23.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 23:08:21 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Thu, 26 Jun 2025 08:08:20 +0200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/5] media: dt-bindings: venus: Add qcm2290 dt schema
Message-ID: <aFzj1LxEbxa3rHhD@trex>
References: <20250623105107.3461661-1-jorge.ramirez@oss.qualcomm.com>
 <20250623105107.3461661-2-jorge.ramirez@oss.qualcomm.com>
 <cbd6b7e3-850a-4bde-a1f9-393c291c1ee3@kernel.org>
 <aFlHlxO/V3MMARVK@trex>
 <73aa4738-6730-44fd-bb26-451ef49d588f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73aa4738-6730-44fd-bb26-451ef49d588f@kernel.org>
X-Proofpoint-ORIG-GUID: bW0afBZA3AiWtHVyIzD29x_f4E97L3om
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685ce3d7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=LfWDrbMk3Fy7126_j0sA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: bW0afBZA3AiWtHVyIzD29x_f4E97L3om
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDA0OCBTYWx0ZWRfX1Wq9QtQ+iyfg
 L8KuI06xOnhy7HvQ7PdD6MTxxQ3wTQEk2BVfzho6HE3HdN0RzUwfsmS+2YJgJwbXNaxKJSmyTbf
 E/QQE8Kd+OVmVYqypRu2OjYCcrhYvkgqzQZb4bKIW28wF5GtQrSiThNQrnhmmlfTquQumgKQXXQ
 M6FRFRp3gDxopb8zg00rs3USoblWsRf3Qr2fIfn4aLQmiQQ/ktyeYr6dOe8vcBAyAWiT0G68VUz
 wdjBePCvePWaRN7/1QA1i3F6dauGbm3i0CsDWj5TAsTrU/meEMlAUnJqnxuMODvURBMumXwhipV
 4FrwpqIoR/boM2zZZ0wmQ9zKO3v3xl7A6AfUday3QvxlIx1BcI1jEUiVhD23AHuarr0L6Y2kJjZ
 Dj1e355R9j4Qmxnxnbf9ab9lniT/8SEq9ThYRwTFTuE08QLyuMcsQ21QF9UefMcRfNO02Tu4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_03,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=853 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506260048

On 24/06/25 08:03:46, Krzysztof Kozlowski wrote:
> On 23/06/2025 14:24, Jorge Ramirez wrote:
> > On 23/06/25 13:49:21, Krzysztof Kozlowski wrote:
> >> On 23/06/2025 12:51, Jorge Ramirez-Ortiz wrote:
> >>> Add a schema for the venus video encoder/decoder on the qcm2290.
> >>>
> >>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> >>> ---
> >> Don't send multiple versions per day and allow other to actually perform
> >> review of your patchset instead of sending for every little thing.
> > 
> > No. this is not what this was about - I already explained to you the
> > call I chose to make. You can disagree but you should not misrepresent
> > it. 
> 
> 
> No, you did not explain me anything. You sent v4 with only one little
> change:
> "Changes since v3:
> - Fixed schema commit subject."

um, I dont want to delve in this (only because the conversation takes
longer than actual changes but just to close the loop), I did acknowledge
that you had trouble receiving my patches - since they were threaded -
and that I would be respining on the same day in case others were having
the same issue.

> 
> The same day, also skipping review.

yep. will repost later today and thanks for the persistance (dont think
I dont value it!).

