Return-Path: <linux-media+bounces-33020-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B33ABF50E
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 15:01:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E29044A04EE
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 13:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F421E272E79;
	Wed, 21 May 2025 13:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bxWJOdko"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C786426560D
	for <linux-media@vger.kernel.org>; Wed, 21 May 2025 13:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747832460; cv=none; b=kaYAtkvDy64vt/WueNRm8kdkJAsIQEboN3OMm8ColipiASuOfxEmnlePmbpk+og4MDHDZ38EDuEK6n9dqjzDgC2aBwAAuVl6NaQlmIEUqWubcc0s1FnROFSp/IucklXIjHamrsarVZNANdNPJcyKo6fTI10CJsqvNySgdA0BNks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747832460; c=relaxed/simple;
	bh=lYzq7FnKukIi50yWRCJdbpDI7oekzUVqld5ufIZMPro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PGeMnVVouzEAIcBT+4IWQRnEFUfsl+p037bBiBoWkvjvWI+f77Y86ZkVU3fGcsXg1WkwqX/9g1BS+isC3ZnsgmbDgk+7IrpOrhUUPO2vXhsOkS09KT0xjqI/94rakmtvBRlM84V9PrPzrZ/1TCavkMGo/GesOD4ZJxv0AWFC41Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bxWJOdko; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XKmE006608
	for <linux-media@vger.kernel.org>; Wed, 21 May 2025 13:00:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Yns8J8yDIbLcf0BsCQyO2F82
	y37jhFFOk2oNKiqIfAc=; b=bxWJOdkoC1gAaaHmK+d9NwpVqkp4DDu7jdw+LyEq
	lWXmq49tw8TF9IZsk2bS5abm8AClZa5zbNH9H82tOOC0deLKxyg+zhKvHeNDaIGs
	sWLhW4XIBCv/KcnoHt4OP2wt3ltV8cmHoxFyPqhrJJLv8hlPJ7lVEz0vst/y8uA0
	wV9JiZ2hWxyY2XjFPxEG1bSCNiGhpA1GAfXCI9OFp+FhyWBPwo4ciI5O9nwTcT6h
	1zQmqTwq/oIvGAzhm7iaH0WihntDXhYbznHKZLyBee3+yhXrRFhDJPOHAPqf1nrM
	38ZCUhrSe3vAV4uEnAeUAZMVUh+977njzitVyOlX9cGNHg==
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf0k1d2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 21 May 2025 13:00:57 +0000 (GMT)
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3db86cfe6d2so76481425ab.0
        for <linux-media@vger.kernel.org>; Wed, 21 May 2025 06:00:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747832457; x=1748437257;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yns8J8yDIbLcf0BsCQyO2F82y37jhFFOk2oNKiqIfAc=;
        b=YIapKaQakqoRwJ9ACYcNpyBg23AsX0HecZmuQHpkbWIGuICdmwVtasAA1Al8neY0me
         UrzRomRdxSvJJ0Tky5wPPI1J4pUkv3jBZrER5RVcY8igmVM6Ypi8rS6XE1r6v5raj/9c
         syYhsFfMKu6ogyeIL3VIzCqw2HJuqtGZQrmo2wKBec48dZf5kWOLFpAnN1NyVESM/Auq
         WKe+H9C3REo+Ocj6WuJTaU1TX4fQL89i7zW+0Kn3uQOYix/tyRnqBHBDv5i/Pp3pDRUX
         rvWAbmJfwBltztxsagcbY3gKQSHqeCC+s/gHgWT1yItO3iQAbmGUCP0Rxaf+c7fuRaOc
         57Vg==
X-Forwarded-Encrypted: i=1; AJvYcCX2hu2tSz3du83RcAbvSU6CDvKYROyM6P+inDHCaWZGJpFoUoD7Xjwh0T0+uX7GvFPsYBwiSWHbpR2giw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaGfXwE5smG5erDJWoyyjt8fiOvc4SJVW94/+IZ5nX0rzLlyOs
	JEfi5zNwCgBSMwOgCeWJoa1wAGb0V54o5ChBpUEfF2r37i0eziMuI79LqRrqnFZyPBi40CdY33D
	3WJP09HURhctwOzmPw8a279RO0IgSbzGDZ2gdrCsWeFEfaVW1yri5drT31TrkhEYyXDade5W35+
	5v
X-Gm-Gg: ASbGnctwtCw44zgjAF9CI5Ko4URSJ+aeR97dAAv4RmGSPj/fiTwuwJbKPtGlyx1QCHb
	MVtdtAjknTLCXdKVXhf3MxXm88cjr3xKXoR64JZss4f6ml2Qdb63fiqJ2C5Rmu89o9bsGviJMJ6
	t0sPmR7zGDqOTpUtBdn+MOmx3zom9yMu0yIugMJcBPbg70Z5RYfoZFFyMXgKURqEqPa2T1nd5bv
	Zy0M/RhOFxATwmxKNZIjEhuI3QCemBAUcMwi5N9gFTBTQeXoq+oTCorGYt81nEvApO7p3tuvZ1p
	fHbBh4daLkYpYWeyPspVPzZzzGda356HeMUqjTroBqEvmpyTIVLKvOuTDQcQDNf+lFBP+MdJx+A
	=
X-Received: by 2002:a05:622a:5143:b0:472:1d98:c6df with SMTP id d75a77b69052e-494ae452646mr367543651cf.52.1747832445316;
        Wed, 21 May 2025 06:00:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYl5pptmjhlEarjw0/xJJoxQp/LNVGwVPm9hkPN2JKLgqOynQ02b10fOufgyOCowuR//KNMQ==
X-Received: by 2002:a05:620a:390e:b0:7cd:1f0f:f61d with SMTP id af79cd13be357-7cd467aada1mr3619274285a.54.1747832427545;
        Wed, 21 May 2025 06:00:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550ed3e3b84sm2577007e87.192.2025.05.21.06.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 06:00:26 -0700 (PDT)
Date: Wed, 21 May 2025 16:00:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Wenmeng Liu <quic_wenmliu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, bryan.odonoghue@linaro.org,
        todor.too@gmail.com, rfoss@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcs615: Enable camss for
 qcs615-adp-air
Message-ID: <6mlnju3b5ecynlmlsmqot2i2y5fkeg7zl7nbzklmq3gcbp24dy@74sht2d4w2uo>
References: <20250520-qcs615-adp-air-camss-v1-0-ac25ca137d34@quicinc.com>
 <20250520-qcs615-adp-air-camss-v1-2-ac25ca137d34@quicinc.com>
 <748f96f7-d690-4823-845f-67642db97a06@linaro.org>
 <dabed183-6907-4483-8c79-616aafaf2851@quicinc.com>
 <76052af9-96c2-46d6-85c6-65998c389554@linaro.org>
 <9babbddc-5c45-4ef4-8fbc-0da64ce99a42@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9babbddc-5c45-4ef4-8fbc-0da64ce99a42@kernel.org>
X-Proofpoint-GUID: 6bKmARhVrcOtjLLaqmgUuHYjEFlJksVu
X-Authority-Analysis: v=2.4 cv=J/Sq7BnS c=1 sm=1 tr=0 ts=682dce8a cx=c_pps
 a=i7ujPs/ZFudY1OxzqguLDw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=gFR2S-RVxxBBcq25oecA:9 a=CjuIK1q_8ugA:10
 a=Ti5FldxQo0BAkOmdeC3H:22
X-Proofpoint-ORIG-GUID: 6bKmARhVrcOtjLLaqmgUuHYjEFlJksVu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDEyNiBTYWx0ZWRfX4Q89cU7AKubE
 2s6N2xGvvJeV4aP6kN/NY7jMD4C3pE/AkR6UimaW4lWA/wIlnhdHEK6vi4J+4kGgY0QU8ecNaZs
 43jENuGvOyA8gVBOiPM+EGDs+dYTOzxMUCLhGkfRdmUCB4oqA18TRwV/pZ7QSia+5JPenKV+X0B
 nlnIB45c0cV1AkIRp1VZvELJE3axmBBAwQ2025b7dXbYCiOZHgsabK4Dbke3z5tK7E5A2WiP+AD
 /d7L3XFwFZeWmNbpk0kcP30w2UaURTeKid/6DD7KOkj3MMAP/QdWLjiy+iHD/PQKD6HM5OAoe7k
 y/DdDx25RWMStk2ZxB+OHbC3hA3ZfJnN1CSTDqcZ2yrXMmMRkzYzgJuGtOttrIYUFxurDY9qv8h
 NxUqrcjXhn+K102SQyXFqlcOBom6rj/LndjZwYNF7FfYEcZa50QxhvkpNcDHVwxODH+3BPfd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 mlxlogscore=734 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505210126

On Wed, May 21, 2025 at 08:04:10AM +0200, Krzysztof Kozlowski wrote:
> On 21/05/2025 07:52, Vladimir Zapolskiy wrote:
> >> We can perform validation through the CSID TPG(Test Pattern Generator),
> >> so I enabled CAMSS.
> >>
> > 
> > Since this is just a test of CAMSS without any sensors/CSIPHY, then
> > 
> > 1. camss-csiphy-3ph-1-0.c changes from the series have never been tested
> >     and added as dead code, it shall be removed from the series,
> > 2. adding voltage regulators to the board dts is void and shall be removed.
> > 
> > Not to substitute but in addition to the above it's still doubtful, if just
> > a hardware/driver test configuration deserves to be added into the dts.
> No, it does not deserve to be added. It's useless code in upstream. They
> just want to push whatever they had downstream and drop their patch count.

I doubt that they had camss downstream.

-- 
With best wishes
Dmitry

