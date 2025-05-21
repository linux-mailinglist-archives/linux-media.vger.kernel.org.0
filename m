Return-Path: <linux-media+bounces-33022-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF8AABF593
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 15:08:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C0BE3AECF1
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 13:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1516272E78;
	Wed, 21 May 2025 13:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GcpFgHnx"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91C2270550
	for <linux-media@vger.kernel.org>; Wed, 21 May 2025 13:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747832868; cv=none; b=g75BA03Ajx4evhg3MT4P3S+xxaQefv/p8MgyFXJCGzMd4SscHCIRIU5jvEoF/vB6vBhj41fMoUb0qnV5N1/UxXh08mcipJXoDZ2qD+WeYu6Qzww+yBAP+4quGNvwia0p7UMUjGBRA1gmjE/3o2DUMoCFJEYB9C5F+hkqsn+Ejbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747832868; c=relaxed/simple;
	bh=2h5eOk+PaQWfro9Vv3yg0j/RpaNifxflPxmCSX2uz4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c2rnfe4fP47TE5gvOk6jhDOBqZIXjHZLlrHfB86MTteEVhN1At58mpBysvn1BLCYA4zmaAV38U+eNAr/Vy0ZXRVO5Hlh50ISPVKutF3h577g1RO8ePM9iFHmAuHn2OFJmGOB5JfN4z60RO5IkMrCdR6RFv/77Ju5X/ffrZsw29Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GcpFgHnx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XNaJ027636
	for <linux-media@vger.kernel.org>; Wed, 21 May 2025 13:07:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uYODI0ZMM8S9a1zlWL7NJhRC
	dLxf6RZlwDt4Yz1bkk0=; b=GcpFgHnxSiB98S20oARs8LRm/+kkzMFsOSSpDBnK
	U2ROZCnZ4LVNA3UhTSEEPJ5Ub0IWVwIw3wIHP64Wg1m38TKR8qg8DsNFW7fovOR5
	nJaOtktTUfo0Rd3RyPoyIvJFEXsKVlWS7/kCVsG0//qXujtM0tjAMQn64bbz77jm
	mJrn33Fer5+/pafL1VnGjZIr+LMRGOJb/z+NdlwDyU3XZyPq2nz2N3LDEPWS1yol
	YA1dLPLVsw+AZzjrJQHbcWkiVHGOm2MFQJrO0P7OZNJd/mIVb7r9WY1OfQ8MqFwf
	q4fjHzMrMrKSE1G062aMCqSRbK9PEnRfvR5R5WXd9JKvuw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9b048-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 21 May 2025 13:07:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-30e6980471cso5471897a91.1
        for <linux-media@vger.kernel.org>; Wed, 21 May 2025 06:07:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747832864; x=1748437664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uYODI0ZMM8S9a1zlWL7NJhRCdLxf6RZlwDt4Yz1bkk0=;
        b=Jk0DHUd+BRfF9ycSQE+q8XIPYgdwGzxIGgi9MjNboVufulf0pjA7/afdyrpHAsUQIX
         cLVLvKEo/z7CMzw3rrVEotjGLDXhY9FKSh0OZtRyz7xb+Bg6vI4ddtSRfvj+UCVKgYlZ
         5usf5SzC7JeMzgzMF4r8NRBOnSwovnzy6MnynPlg0Lo4dNdDUOl1C4ERvtSAZ8fp0+U6
         fHAnE5ZTB3XfT3UNzhlxHGmCCgb852GqqPiL04aAqQ5yb2ytiZ3bSRHbimoN/l+YN0BD
         nFgQpw6tbbmoREAiBWFAM/exNIbmUr7mQyKHA0w/Rcx0MRY3dwd50MlIx0e72v4TDm6o
         tDxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCGWSkDJZwzbjJJm0UnSFeA69sHgnIRGhT6wRA4iQHPTc2kflxf6f5NflW7hA5x4xTOt1Fsq2wKOzeOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVq5aCZe4vwn8Ic9Zn5mi1qkYyQm1XnjYoNsNsXhbSNPw85cta
	oQXjb+icljGcvLeoYDaLLVZ0ZdQear4nOuPy7OdwNnAsoKg0uMIacfm/4IkZ3qEOrj3axGb4ZmR
	W+KBbsz0Smdv9U0SDwCYK8/6zpwhESxPdv5uQph0vU0LTVBAcpblC35yYbYLHIrkgMg==
X-Gm-Gg: ASbGncvtFEQzC55k/3RzOeU4lHidZCphjxv78h9hJlwuNvmZVrMePw4dGEoXex+GpmQ
	FY+vmR5zSaBbcurGaCIYIKj7rcL98FSGh7C5B9lY4PJGAwnYLJSDavHC3v7sUoRcOQyBq/PGlXN
	E0QeiCqzr0S0A/oLaeeA+R2a+eTOc15wWRiH3ExMfYXrXGeA6RHGPMjlQAdIgT2uEpeNOAWcsUh
	ZZ8zJiNlNAa0yHXY6gDHTSpZ05T1C+1BvdTpKG2PELlMWNLigmv05pbmoijLRTWtEEZv1XE64WY
	SSfB0kSo6VUgr9Qj1jFoa9BvOQ7PpOdyuGmk3FuihxHIkGn/Y4Td9r+Q4HeyczgdR3JPL59rgHY
	=
X-Received: by 2002:a17:90a:c2cd:b0:2fe:861b:1ae3 with SMTP id 98e67ed59e1d1-30e7d5212aemr31974561a91.8.1747832864088;
        Wed, 21 May 2025 06:07:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQTcM0DEewfI33gItZD9j1h0bGLelB3UY4zmdB1KWV9XM4V5233w4DxRV0kJm45wKsrFEaSg==
X-Received: by 2002:a17:90a:c2cd:b0:2fe:861b:1ae3 with SMTP id 98e67ed59e1d1-30e7d5212aemr31974498a91.8.1747832863677;
        Wed, 21 May 2025 06:07:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e702c19csm2813012e87.170.2025.05.21.06.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 06:07:40 -0700 (PDT)
Date: Wed, 21 May 2025 16:07:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wenmeng Liu <quic_wenmliu@quicinc.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, bryan.odonoghue@linaro.org,
        todor.too@gmail.com, rfoss@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcs615: Enable camss for
 qcs615-adp-air
Message-ID: <osxdr3czofrurub4c4tmqv5vciv7ub3gm3vxygqee6uizjmmq6@mju4r54hpk6j>
References: <20250520-qcs615-adp-air-camss-v1-0-ac25ca137d34@quicinc.com>
 <20250520-qcs615-adp-air-camss-v1-2-ac25ca137d34@quicinc.com>
 <748f96f7-d690-4823-845f-67642db97a06@linaro.org>
 <dabed183-6907-4483-8c79-616aafaf2851@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dabed183-6907-4483-8c79-616aafaf2851@quicinc.com>
X-Proofpoint-ORIG-GUID: ALAHGLMOrkv0HxG694T4W_NMZKhr_7t2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDEyNyBTYWx0ZWRfX8ZGUPVmCNNoF
 6HFTk5nZ7WNqsJ4j3QvzKXXyxwe9m8Zj07szjtEoBSy2/6/u/DUQ2FRI2OVSPZQzNpUMjrbnEqk
 bsv843y56+4vhdz/v8Uq/kLYemdbWZuEiUQzLyDjlLKyq3kSmOBSBNLCwnCTkGvaGrdwZ3rZEuC
 /xiazrZV33zO+xbH6xp4I0rytZw6luyqSdo4P2G+tvZm8nSmr/vFXRJXJHl+PMgFNXXhW3bbuGr
 /mibtfd5CbtbpCl7m05zpCTKunHzgmXDT5wxe1TXMco+3Evpd6MBeeJVVAO8T6QeTwXJehDEkut
 ZpNXjbEIXgl2prpN05UAEPgpe7N2fpSz3J5EcpRlgNr7sO/KUIBTK7DSAaxkfGaTlmowxKMbfpp
 olrDkSMxwU+tLRCDfxYv+ELHMnFIWkf3yCiz850oXSSVOqT8y09Uv+PdPlJDKuUMlIflC/h6
X-Authority-Analysis: v=2.4 cv=GawXnRXL c=1 sm=1 tr=0 ts=682dd021 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=D6KgBE5joMCqelrfVo0A:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: ALAHGLMOrkv0HxG694T4W_NMZKhr_7t2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=801 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505210127

On Wed, May 21, 2025 at 09:32:00AM +0800, Wenmeng Liu wrote:
> 
> 
> On 2025/5/20 20:19, Vladimir Zapolskiy wrote:
> > Hello Wenmeng,
> > 
> > On 5/20/25 11:56, Wenmeng Liu wrote:
> > > This change enables camera driver for QCS615 ADP AIR board.
> > 
> > what is the rationale of enabling CAMSS on the board without giving any
> > description of any sensors connected to the SoC?
> > 
> 
> Hi Vladimir,
> 
> We can perform validation through the CSID TPG(Test Pattern Generator), so I
> enabled CAMSS.

Are there any _actual_ cameras being a part of the RIDE platform? 

-- 
With best wishes
Dmitry

