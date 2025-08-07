Return-Path: <linux-media+bounces-39056-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBDDB1D969
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 15:52:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 887893B1170
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 13:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66FB425F780;
	Thu,  7 Aug 2025 13:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fL+ZZ/nQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82365221269
	for <linux-media@vger.kernel.org>; Thu,  7 Aug 2025 13:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754574740; cv=none; b=loXc4V1ilFQZhCmsL3ke3X1JFhhmbRq5dnOwm/1ZsgsRURPO75k13dPGZOzUkAX+NQcKTty8TRF/tSUl3qOA3LCfWGbSDR9PN77jgWBadfbALGXIdJ1wmkFk9bgRTtqBxLHsWkRklEOcPlVPM1WTSrGq2KCkQob8pgeWBcCGWck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754574740; c=relaxed/simple;
	bh=3RJmbFyaEI/2Q7w0DwSZjNnb3wdVv2MTkMkwaeC/i14=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tD8juQwShlEfBofE4D3UfF5qeKy63KSBskbANLpbdpnjK3gj62m1i9SuBRtgfJCCYNXgF2M1Wh/L1FoyAn8s99X/mmnxyYl1gucrfA/Ns7oDMs7ZSzC6znjXIZqd47k7DNn2ARh/oVAI81Z/JCLGUBFJ1hqddKgQuIQc1BJZ71I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fL+ZZ/nQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5779D0cS019004
	for <linux-media@vger.kernel.org>; Thu, 7 Aug 2025 13:52:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rx2HlkhZ5XkdhRBXb9tvkQ1L
	h/1Dq2jL/Wn7+DWmLHM=; b=fL+ZZ/nQQyDavnPSVlOqAFsFopj4WqOMip1q3L3z
	KKhq2DQ3WVJg2G8MOLXnT502V1wrxmy5HGTxs1OCW/VSlbA1H7bNyqtl6uj7+Ga/
	MGOvBTmRBE2dsy/h75ql3hnLQfmd2KYjFiK0M9f0VGR3YA2dzOdFb11w4v8wr5/E
	ifrYNfotJa9YAScxKFO+XwxOEcpiExapssaYQzkct/E86XoNClncG/4h2Wvh3mTa
	GBHsYJxpFBAB2a4avfUIxSPcwNO4hgn3iHmotKNVlIe7vxvyihii++g0GubTuyYi
	+X/ii7mDBIHkqZNEuD7dE+wNOMk9vqxch1rReb5zCW6gsg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy8eeqd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 Aug 2025 13:52:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4af1a20cbcfso26292971cf.3
        for <linux-media@vger.kernel.org>; Thu, 07 Aug 2025 06:52:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754574737; x=1755179537;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rx2HlkhZ5XkdhRBXb9tvkQ1Lh/1Dq2jL/Wn7+DWmLHM=;
        b=OBowdZBfHtZcGBcH/xgp8PcyghZ9QBkSq0xJ1/Dez9MxEZ79/gnrVIBJ26xDwyivEt
         Fl+85hU0Fk2ZBNWqNwShg6dCHEqP63NJVKdfn9SiBv3vMo7HcFN+YKE+wJLO0M83wwx1
         It2kByTGqzmwbYBOnxTCE6jLfPr4Xfsc/vDlGJnva6vjy+L6mY0kyCzYjSENTGDrr2ct
         1y2b+iKhYvVa9J3Rs+apNcWpfdbMyxQJZPkepjzH0iiWgObiq8GveB46qTF/OWJD7MGX
         rvoafVfpG9LVkVsbkzVmQFS0MpZJ2RW5Nns0qba15GKZYgd8ZZw+uMlvyXTkEPIeamb+
         4umQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqSg+L8Hcf0ieH+0rr+8YQuMU6xeerfKWdGrUDiePIw9zABqEzqkV4C8f/G4DtmifQXYU8zSc/l6fB+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkKlUeZXIsIyVuP570IWMiB3ioEC8hKBNK8Ke9AtCID9aLcHnf
	tXIIcd80/sLfkJR/sNhENn2LYu0iktBHTzjSypwGA9ydVmFahxB+ErS4HImifeT/opnc/am8M3/
	43puF648UtCmFKhJAQycx5JLwpkNdA7iQNMpuyP3RlsAGN5z3ankTvgvQ0JbuC+6v6w==
X-Gm-Gg: ASbGncv3L+fAHGfVZUYnXNxoRIUrRfQWptFZvgdptTiP8zt1t20bnijaqwdztqFvNtC
	qiN95mEP8iYColmIduOuNlaht4OwszfG9LGn2Z9cQQiocwmCdDMBULwmvCJmUPD0hujHK050N23
	OAx9TIasqsmrnQQ6Ql/t1dMAXEeo/M/AE6vOySn+yov/MkJlzXI0U2qhKNYS0IVu0ovWL7fM6DS
	bgwbdLKRyBO1fmnCDML73Es4ufZ0TW2iR27L8rude4lD6T205z+fYxHovEXweqkMqOl2liO6SUN
	L4KOvRPKalzt4BQROoLqADlUdHD3kwRXw2TfJKNfEL+aqvVkGYPw0lvO/hQswlw4gUfJjg==
X-Received: by 2002:ac8:7f48:0:b0:4ab:aa73:9600 with SMTP id d75a77b69052e-4b0a16adddcmr44580751cf.51.1754574737244;
        Thu, 07 Aug 2025 06:52:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8h/LmSHvY2xjExIpWEd1N45JRbMyTF9ezrl99kb/xqJfV6y+UvYKQinxMnY+ofhU4FWNwBQ==
X-Received: by 2002:ac8:7f48:0:b0:4ab:aa73:9600 with SMTP id d75a77b69052e-4b0a16adddcmr44580261cf.51.1754574736758;
        Thu, 07 Aug 2025 06:52:16 -0700 (PDT)
Received: from trex (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458b501f22dsm145939755e9.0.2025.08.07.06.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 06:52:16 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Thu, 7 Aug 2025 15:52:14 +0200
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        bryan.odonoghue@linaro.org, quic_dikshita@quicinc.com,
        konradybcio@kernel.org, krzk+dt@kernel.org, mchehab@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 5/7] media: venus: core: Add qcm2290 DT compatible and
 resource data
Message-ID: <aJSvjqfQw3kNrVVH@trex>
References: <20250805064430.782201-1-jorge.ramirez@oss.qualcomm.com>
 <20250805064430.782201-6-jorge.ramirez@oss.qualcomm.com>
 <4chbcvub4scnv4jxjaagbswl74tz4ygovn3vhktfodakysbgy3@kukktkwd2zsr>
 <aJHgh8mon9auOHzi@trex>
 <aJHqpiqvulGY2BYH@trex>
 <to2hrxml3um6iep4fcxhkq7pbibuimfnv4kfwqzlwdkh4osk5f@orjzbuawwgko>
 <aJMMhIqNupwPjCN+@trex>
 <0248afed-b82d-4555-8277-e84aacf153fd@oss.qualcomm.com>
 <aJNTigOMy1JFOxot@trex>
 <fcdd9534-d494-3fdb-dfa7-1d15da6f697a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fcdd9534-d494-3fdb-dfa7-1d15da6f697a@quicinc.com>
X-Proofpoint-GUID: wwWNNcgG7QAPSjSbG9Da5vUxTonJfc6B
X-Proofpoint-ORIG-GUID: wwWNNcgG7QAPSjSbG9Da5vUxTonJfc6B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX697hm0Dg6jtZ
 8HEMOb8aF1bEkJjFPEEDOq1YM0oVljvx795g01doWH0gh/pt6A7PtGIP0DgVc433UO4RrQ7wGIn
 3xOyx1QysLBNoJX1DBQU5mXTVeSb65dIzjkp9PZfUiX7kgu8Ag3DZghfK+p7vCsdty8zFWI+rom
 3yGMPhuHueVKSFFSBCBJXbqLatnqCslD6Utjl33SGiHaUe1REPoFuM6S+07uWyx3ob9Jj/kOQ5E
 lig0kciuob6DNCYn2uQduUe7n9GosqEbqiTH5qEl57hGTeF4JgM0w3CvqJycJVkopC/tECjA+5S
 zFOrthd8IggD/dv9xOP/oaf1Fmc+QGN/pC2FiHBOa5D9Z5piHfgpf28l8mF14ZuDqYrkJ/hDIqA
 hH7d1W4C
X-Authority-Analysis: v=2.4 cv=GrlC+l1C c=1 sm=1 tr=0 ts=6894af92 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=FCMjqHPL4a2t-UUgg6oA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

On 07/08/25 16:36:41, Vikash Garodia wrote:
> 
> > It was agreed that this complexity was not necessary and that we should
> > just drop <6.0.55 firmware support (which would in any case only include
> > video decode).
> > 
> > And so on v8, I removed the above.
> > 
> > Now I have v9 ready to post it, but Dmitry is asking why cant we have
> > the v7 functionality so I am waiting for direction.
> 
> the issue is in firmware for both encoder and decoder. Didn't like the idea of
> driver carrying the hack for a firmware issue. Just because, for encoder, we are
> unable to hack it in driver, we are ok to have it enabled in a newer version of
> the firmware, we can follow the same for decoders as well.

if that is the only reason please do explain what do you mean by hack.

