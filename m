Return-Path: <linux-media+bounces-38987-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF64B1D1D9
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 07:10:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD697626F80
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 05:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 502A31F463E;
	Thu,  7 Aug 2025 05:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aqrs9qkh"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549828F6E
	for <linux-media@vger.kernel.org>; Thu,  7 Aug 2025 05:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754543401; cv=none; b=qPvihvSheVdLIQDwXbK1zHmPMKIdpR3utVUYwjfN7Gsdv5mw0dVtrHDRdb5RZUYcL1V2Kz2JtgeI/nuOD9UCGc12L15UI/jkux5UntjAOOjk914qhmgcOV/JvB7hitGCpDY0rxkKicI8IkWcOC7hYRXsDo//5vDfcJlESwNm6RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754543401; c=relaxed/simple;
	bh=Tlr/AsUjBkz+xny+/rpFl7o+Ey8YWX6po2IM+lvkxEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QBcTVs34CK4Y0JV9GRRVx9bcq8LwBsUR7TNwcIs6cUfvnNCgXXpEN95cZA8Hi2dOTb3uiadEQGbEydlpuNEQ4NBqMWBB86stz4W5twNMdKllec4KbMKj7ZVQ5TtzNWDfyiw9Watxkbz8iUzOlfZjEFcGsu7Yf6bQEgnBTDeOv/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aqrs9qkh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5772DRbp004180
	for <linux-media@vger.kernel.org>; Thu, 7 Aug 2025 05:09:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bmXjPpDHd0Cgpzu9CL46gO7J
	+euneT5LSuqRLfgfzJA=; b=aqrs9qkhORFhgqiUNUP0pYhKt1VB6oMXbtys+wIJ
	lllsaCtVARHRehkk2xlv/zI5+koVePpz1iNe+b2INzZibBh7Yi7rE/W7pjymGhR7
	olOL9jaES0sYiNoNsYhRTjye27XU/mHsU5fhF7dRyn0dkcHHIhRCoJrUaPVv7qb/
	tBhJGP+3QysAA9t6Kf1KVZdqSLrMWD+pb/tsoIbJdXvKYlEBGlIP7iGNNxnLE1UA
	pIqUSY5LiyjCS8JsZSwEqXI9TEezGgVPisDefxobZ0i3s846grVh7fBJ5dJhaGCW
	P7MKmhrcytNa2AbShQ8+93IFOZJRLiCohcH8Pl5/C9esvg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48c8u2225b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 Aug 2025 05:09:59 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3214765a5b9so1246856a91.3
        for <linux-media@vger.kernel.org>; Wed, 06 Aug 2025 22:09:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754543399; x=1755148199;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bmXjPpDHd0Cgpzu9CL46gO7J+euneT5LSuqRLfgfzJA=;
        b=tJjGfu8FhXSq8Brp2LCVshqjj7BY2o5M3Ekj30kBFkuys3Y6qj85P7r0iKIH/DM69C
         ejIvep2FXzZzISr2oTjGK/D6efu7WCGGoR2oMFpj5PrEVkhkY9NwmuF0V+nouIbkBhrP
         EAYBDK44nnyODYyRP+z1ofg9aMvIYKiM4QVflE43RQNnLjMw9yUHO0OmrfvraLp5iqeM
         RyCLr9CEgQVz8dzjUpsx1PqJxSGgU75WsvuylnjyialqPxziyQA8YVv/z5MUbNrxRHz2
         L1LpYTdfBInR9qFSLAxwpn9YnO7oO19JuKNHSRt5dhwHGDBZJs6NRySB8zqcHLo5hhA2
         GgBA==
X-Forwarded-Encrypted: i=1; AJvYcCWEwxQMYt/DDxd8S+sNafmbyBJnGN7TjIE0mgMXDGNz1n82C/zbPnF0fZLWJWszR/oJZfqnnyFEpz22dg==@vger.kernel.org
X-Gm-Message-State: AOJu0YybcO50SieNRJL5bpwBOgNdY4kwwSWlZnQq9QWTTfsYxwt7qbXM
	SeSjT87rsto+C4YYWqsO5UpCTwCsxngODHuuyLJMkfyLtaV64/19rhekzc0w+k83nRk9ImPIuHS
	RfMunxn7/r+A0gtKaZY9mSgsePHiMXylGN/p5viF+Otk16OsLmoTTMY7LBx/eLBQ+xw==
X-Gm-Gg: ASbGnct0fm3awLrqPLxNcmzddO1g2ONqxLeZYSYwDppcqFMJuLT3v3usBhvYuZ/PGUS
	5mLPhjowUZ4wqfgUi0q+8XNsS52D1rCgoYYCJUaq0WCnqqbrb5noOBwSd0f+iodi1va+UWIh4Xg
	paPSsWHnNQuk0vhgG4/sWYy0JQYDopphs1+GoTJ+7m7S36D3tRbi8vhzQ1rjWUeMiCDa4Q3Y7pz
	fICHKFVP6hnBWg89RQYxRwnwEhXJkhdjJn8amNtNA+Ykpuawn/4nRxWGG0S0vrXAMsKZIss5+T7
	X9FjMEdg+VCt+2lcz1fFxbuyppBLZeIhNalAD5EvgutAUc7fg/hUx0R/h2ac9giq+7c=
X-Received: by 2002:a17:90b:5101:b0:31f:3c3:947c with SMTP id 98e67ed59e1d1-32166c2af67mr7690692a91.10.1754543398724;
        Wed, 06 Aug 2025 22:09:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG47kar2q36LtbPQN4NmJWmgREGO2dRSmwYDlKD0mRi6OR7+kX7FHIYLR3UKacYjpT+SbKlfg==
X-Received: by 2002:a17:90b:5101:b0:31f:3c3:947c with SMTP id 98e67ed59e1d1-32166c2af67mr7690645a91.10.1754543398204;
        Wed, 06 Aug 2025 22:09:58 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422b77f33asm14674650a12.5.2025.08.06.22.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 22:09:57 -0700 (PDT)
Date: Thu, 7 Aug 2025 10:39:50 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 1/4] soc: qcom: mdt_loader: Fix check
 mdt_header_valid()
Message-ID: <20250807050950.n76f4vtndgjnujbo@hu-mojha-hyd.qualcomm.com>
Mail-Followup-To: Bjorn Andersson <andersson@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org
References: <20250806172531.1865088-1-mukesh.ojha@oss.qualcomm.com>
 <wgpgwf2yq4awig5cztgkgm32h6zjtqzv4irpxd277gwjydofzu@f3zb6t4iyahc>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wgpgwf2yq4awig5cztgkgm32h6zjtqzv4irpxd277gwjydofzu@f3zb6t4iyahc>
X-Proofpoint-GUID: w4-rQdBQ_7jarerr0OVBxG5KfWHJgq1H
X-Authority-Analysis: v=2.4 cv=Q/TS452a c=1 sm=1 tr=0 ts=68943527 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=OaSFCp3QGDZU0s8We4QA:9
 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: w4-rQdBQ_7jarerr0OVBxG5KfWHJgq1H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDA5MCBTYWx0ZWRfX9ymZ46vlOOuG
 IMZVYlmtd6BCgEufv1Al1riWwY4deZFddgZQ0PAtb92FLSIYRkvgqWnhvhob3yjuKtRk4DHLHe1
 Lq1iZesI2jaZCiMkYGyrjQinpqWUaYKWAz34aDkiJydNJD9+jN0GLXQV7lNJDwRxgNwP16c/GNk
 Pu4Cz5vDUmv+26r49QX3I199l871Ms68LzbJiNbicD9olV1HUyj+Ds4/FikQH+7me2XKwyhZEQ4
 k22pYiPMgnZwyDjvV2MXJWnNPWLInD1MiQ4Vcmlmx9N3P785E2JyBqa4wVGDrnT3hl3KUGxSIJU
 IXqdmfoGq1v1AfkgHw8Bfl1O1q9l859AXVJv1PcxN2cB6/74BSoF9XkK0ynQPIEosulzi+cvco4
 h71Rlgxf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_05,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060090

On Wed, Aug 06, 2025 at 03:01:45PM -0700, Bjorn Andersson wrote:
> On Wed, Aug 06, 2025 at 10:55:28PM +0530, Mukesh Ojha wrote:
> > Firmware binaries may lack section headers, in which case
> > the e_shentsize field in the ELF header can be zero.
> > 
> > Update mdt_header_valid() to correctly handle this scenario
> > by adjusting the validation logic accordingly.
> > 
> 
> As I replied earlier today on v1 (probably after you sent this), I've
> applied the patch I sent out earlier for this problem.

Sure, thank you.

-Mukesh

