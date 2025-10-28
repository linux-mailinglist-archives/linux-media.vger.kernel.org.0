Return-Path: <linux-media+bounces-45825-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC467C14A6B
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 13:37:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44B2119C37BF
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 12:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4FD532D0F1;
	Tue, 28 Oct 2025 12:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B4kv3vN2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2F621883F
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 12:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761654885; cv=none; b=SFQT6Jc+Prj0Eq5JajWYe17gDrDe6/ta3SeNzk0+m7T+GW2/ubaux+h6guaoV6eX6xwXyHXN24P59L3/r6h/PG/4Q49zE4KSmEiftn08ePw0MG8LpFmP4SKFcTUP9WlYmPN6VVw7NHuvWc7f0S9j9ejgQcDqe3GdFmvHKwUC4Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761654885; c=relaxed/simple;
	bh=KyBNCgzXGkyMfGBWB7EOwo8zzP48TIxps6ZrPhg/LD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mv0p/roIXX6ur44opqFGMiTm878WZW6qojCOmSY6QRwVrsIGLIZ0beVGl6rHh8WzbMlL3p0tFcBJlK7w9KWbSuD4yEQU6rreR7S8IKXd5FV8xzcLHy6sDh9sipIU9jJixZ3PLiD0Jtk3y9+BDOQa+d9eJfUkJ75AXth9zQ62i30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B4kv3vN2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SB4h5R573507
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 12:34:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M95gJXcFdZpIJCFc0EnHtF25lf7trZtvDZHldkLO1f0=; b=B4kv3vN2EwmWINN9
	sZs9ldxIb139BIykET7LxTnr+S3DFN+TiahNLuZnetvaShrB+1nweAbWDRlmGUlh
	FFygzEccaAa6mpG+ifBID/vXi41nt1FV4iGloT16EP6X1ldhBeOF0EREEfA4RgzJ
	tlugQ2aqUlA5uMj7SvQ6Z1FyybpzDhQYUiGu4xfxOdmRTsJ0HS330u6a1u2rW4R+
	MGTRKeL6VR2ld2Qkk54922zb1swUTy5/O/pnpI2YWaR1CQZND4htsgqtr+Rfg8PO
	31Mv5OoQGpxwxZp7gIGNELqdtHGciBJAz2dNH73aROCPkvduq0bDIGaORAUeldwH
	2UgjzQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2pge9dsj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 12:34:43 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7a2878dca50so7764844b3a.1
        for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 05:34:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761654883; x=1762259683;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M95gJXcFdZpIJCFc0EnHtF25lf7trZtvDZHldkLO1f0=;
        b=NHz3RZIs27TWoA7TBY/KQfRbiR+oeX2xoseCuwpipYJq6ETjicrEZbB4QFNRyhRlZC
         oSoXZCS2Uhiuw4Qzk9Gp5XirTIKh5dhPRRQaaPIS+xYulPlNj58JStPUtHawkB0gRYj0
         dUG8Wz1DQJJ6ZMELZnkVORwRUvz9mFu/IKGRp65PqzBo9DKL0+ANA4InaBcV/0n4JD+t
         lCzhi2cB28QYWccpPPN8graVRXJR5MCVjBwZn/DUoUqwIh1sDZ/DC3tcNhV9kpVCYqL8
         C7qFmgBDSbjXf7PtP7Zxv4RyPQVcz9+JDrYohg1avzMFm3quPmYSuOkzgFIX07Rg0G/3
         m/DA==
X-Gm-Message-State: AOJu0YxXJiUuZHK7u2FF3nzX3KUT6zMU9+W0sFGSVl566DRmn+BxFfr0
	3vRA9ajI5qJsKd/t3WpoX10HQwxD6LAPpRXAH2bgnDC37iKVJY7NrdIBiovInERX9zIFCFb6Qqq
	xdjz4Rn2LwEzhL1BL4Bo2Jwgvc+9qiOTCOBKEqGpZiQJyWg8qRbnJQCTQp5k5ucqGgQ==
X-Gm-Gg: ASbGnct0P3K3yzTkW8PZ97rLzC1OMsA5r7fNoWe06Nb+nd4G9yHx5jMyY+pvevIoG1H
	wwtF39xgfDJtjSma9IBb5mxHCUzDQNoVf0j5WbjF065SZqVtjB3mvvgHXSPOAohNFzzyFtQ93Eo
	nHH7NKsVziBX2X8FYCUlMRnbX2B4hKsNa5Nw85lOAeUOnTGzEHqyWqnjatfVz4OqG3Y0Kpor7J6
	A0BjHxnkD84LshRyyxln86bFZwavDNVwkJyNKVrD+OLN1o6+qrKfHKSt3/6TA83Q0iBGg204Rd3
	qWyyQF91KpsUK2wGJb5jVOwuaejayBBYptaM96d4Q4UkRrm3QLffN4QRzOdfbSw0XTPnnyTKni7
	Eg9lMyvcm/rlGum3ehVTZxbNEPZ4RtoBV
X-Received: by 2002:a05:6a00:14c4:b0:7a2:7833:8b5d with SMTP id d2e1a72fcca58-7a441c36fd9mr4823913b3a.17.1761654882458;
        Tue, 28 Oct 2025 05:34:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDZgEIJrt0gDk5O/GM4oOTTTrpxlFBa6bU7qOKpY2eoQVr68fPqZaq01zJuj3yQEKGsGh9lQ==
X-Received: by 2002:a05:6a00:14c4:b0:7a2:7833:8b5d with SMTP id d2e1a72fcca58-7a441c36fd9mr4823878b3a.17.1761654881999;
        Tue, 28 Oct 2025 05:34:41 -0700 (PDT)
Received: from [10.204.100.217] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a427684bddsm8298102b3a.31.2025.10.28.05.34.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 05:34:41 -0700 (PDT)
Message-ID: <bb39b556-dd70-ad95-3d29-1e2bf7f45380@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 18:04:36 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 6/6] media: iris: enable support for SC7280 platform
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251028-iris-sc7280-v6-0-48b1ea9169f6@oss.qualcomm.com>
 <20251028-iris-sc7280-v6-6-48b1ea9169f6@oss.qualcomm.com>
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20251028-iris-sc7280-v6-6-48b1ea9169f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gpzqotEeEMtIiP5ldaQf9jDk90vM_TVN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDEwNSBTYWx0ZWRfX9c6NgsZpxp8E
 UclLLXn2eVwzUW9BthNQE6B9QmoNGQcJtQkgpjcp8YZYVsZZx8mBgZL0KMHD7NOA5soyA3bWArp
 zGc7+Vw8i0r1/ZyChKn03NroFkVQxQ8Mx7WbCvdQY+2P5gUFGyq03X48A8VQfe2DlgdzFECeljx
 kzXGcltNnpvvaySFzetxnrL3OJLxg5Czz48+d25ShmgC/V9dOi1WSamghEnHi/oIKoYLUs16/+T
 BaJsLd/yLbp9kCOq2hyfcZMJpDPpod4hNahvl5eaaaXayaF+2omaJ8dY9C90HgBb9lUtteS9oZa
 DWvhx3AIaE046KvSxFta8Cqqf3LhyVh9knbBjcBiCerOj1DnS1bh2lz2DjLQ4AiyGPBxWHtOxFm
 xEsqWs8PMi1dN8CNsnEmxqxyWrCpZA==
X-Proofpoint-GUID: gpzqotEeEMtIiP5ldaQf9jDk90vM_TVN
X-Authority-Analysis: v=2.4 cv=fLU0HJae c=1 sm=1 tr=0 ts=6900b863 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=fr3eplbp6RILtt3BeFwA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510280105


On 10/28/2025 5:16 PM, Dmitry Baryshkov wrote:
> As a part of migrating code from the old Venus driver to the new Iris
> one, add support for the SC7280 platform. It is very similar to SM8250,
> but it (currently) uses no reset controls (there is an optional
> GCC-generated reset, it will be added later) and no AON registers
> region. Extend the VPU ops to support optional clocks and skip the AON
> shutdown for this platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

