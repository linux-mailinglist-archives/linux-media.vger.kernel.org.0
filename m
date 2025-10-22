Return-Path: <linux-media+bounces-45182-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EA2BFA1C6
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 07:47:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A76EA561212
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 05:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C50DA2ECD3A;
	Wed, 22 Oct 2025 05:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="itPyFBoZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B3922422D
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 05:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761111981; cv=none; b=asY/87TrUtOsan7oPYHnc1Xa0Npw9LYXsfNSdCi8oXEnhF144TEgeG+Zfompvoe4VN+/xyawCsFX7QEtTzSJ59Z0gcSJJlIHxHvDHCZ/3QC6hm2AKrh2N7ttC4n1Hbxkgycq9BGwD9SgA0ntDfadjXSoOvCMJ1IEdNUZOiiN/IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761111981; c=relaxed/simple;
	bh=GPbtRPqIECeP0yclKwXqY9pSqHQ2lvzxM9YJWlNlbnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K4ebHl9bg5+pXod6S36JKIEmeVmkKtu+1eTZW+E2zMtdfqeMnCXQcuT7SITWvj+OER44Y2qYr4dFsQgmhg5MOJn+U534FlmiUqXwIHKhmsOF+ReSFCTKTu1DvjvZ79M6A0OTh0ARdWp5IH9eGTvO+Uo855OVUO7SrOgkO+xR+IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=itPyFBoZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M3EUXK026879
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 05:46:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CainteRZ8Zd8o7nDkOh94ekQdPJKyfGA6FMGoE2UxGE=; b=itPyFBoZ7vZullgn
	Lbeb/ol/nIwiqcLEAHc2JyyC+bS5ma8gFXGt6j/WWcN3iYJdkV4P36mr9iwtV8nS
	GPFshO7E8mZVVKnKSMPlx8prY1iQeW7w1YJA+kByRsJ/xVoYRzJsnTZy6sa2jHEt
	D0sogVEKIuLQnjx25lkmkJEEhJpbVsnPWtZudFpCLL8MHrkh723JqjWJz41pl8+R
	Z2ygefy2h12LYzMNjr6dt1uFOrxZoQnkc1HaXjLt0cVczJBcUGeHrC6Riwle7Mlg
	/V2pNaW6PqKFQJrfDS9gNDq/D6YAB8I6hV8KDLcsCbva7kHMn18d5ok3neVX9y3b
	/kxv+Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08pkktu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 05:46:18 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-33baef12edaso5951586a91.0
        for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 22:46:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761111977; x=1761716777;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CainteRZ8Zd8o7nDkOh94ekQdPJKyfGA6FMGoE2UxGE=;
        b=OwDn09upNKBGJ+3MguhyKZEJR63CX7HgJ+CruEFgITnOy1v39DQQeFDqv+IP0gQRI1
         GMmWYTEflaoqlxjY2viAnVEx7dXZokheeyLHwYhM9GJWY+qhEcrSJV4K9vXno+WwGPOo
         ipXbPRZ53NokD7ES1K3MNwdSn1aN8nlagSLoZotI7OH2oKjh3OU9Q4l1gPA7wFxgWmtZ
         MOJ969blP2KXh5V10hJdnSwy0Hlwi3BB3yzjF4byBID0c3UANC5COiURzTBt9qeBE4sW
         bCzIdh8gwxf6vvMHTvY71lJU5voQedPEwfbMLrQggWRvyAMeBs8u/6Ecoe6i2RMjheQT
         DObA==
X-Forwarded-Encrypted: i=1; AJvYcCXeHIye9Q9haap4vNd5QfeY4ZvwPlDIklivRK95R2Oit2CcHiGQzGhpXrCOCWJ7DM2aXIeRdn+XHxflTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGW91EAkyi+lfg9BmCjciToqvlMGH900k+W6vIUwFy5ogTp9OF
	Q6nuSRAzpNcoH9qORf2jxHek2WgbNLAV/MG53IQCTYfvpswj2XPqWpSuGr00WsLSx2vlMb85VPQ
	K4l5T+RHppWOyYnONwyx7f9QXszlRA6Un2GLaFhrZU97gwUPXeOHC6hWHnAVpnXMLy1c0WnwDcw
	==
X-Gm-Gg: ASbGncuxoFqMy1hFgC6WXfski3XpQu3Ou5iK1LwD1Hr4NO/wRTexkxdi+LXzO/sJNnM
	HrqCyrfu21UzikWSwP92uEcBO8zMaHZ0Qobn9ejluzwUQ4+2hqRCC1EqOJKiRAPTleAIQSck23Z
	CH2y7z7KQhRio7xHnfInQKJLPe6qSZPgPRwXQSoSFO2zfubY0RA8shcnDfa9AX+lEou/Hm1Qr0Z
	huuifxakUE9ukdD77SVfsvdUIIPhf3Zn89O6WJNuzDWtlK+e9TeHQjepLQVPAOdEdRQEyTEkyUS
	ZQoPdC8ovb7OBpyAWP47e1c91pyI1ia1rLP5MdaTt5byZCy88qAwna2vrJIra9rKygVemPyLz0E
	oVSmIAcf7IiTc0qE9fcUfylYA720rF0gkNQ==
X-Received: by 2002:a17:90b:3f8c:b0:339:a323:30fe with SMTP id 98e67ed59e1d1-33bcf87acdcmr21722174a91.14.1761111976598;
        Tue, 21 Oct 2025 22:46:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7gmWeAdo/ledsoYbIw1NxsAbbcauz1W825kuXhtPHAlp3ip6vJYAzoO9Gi57NsoB2yrPBQg==
X-Received: by 2002:a17:90b:3f8c:b0:339:a323:30fe with SMTP id 98e67ed59e1d1-33bcf87acdcmr21722145a91.14.1761111976164;
        Tue, 21 Oct 2025 22:46:16 -0700 (PDT)
Received: from [192.168.0.166] ([49.205.252.226])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223f11f0sm1409058a91.13.2025.10.21.22.46.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 22:46:15 -0700 (PDT)
Message-ID: <9b9dbab2-7dd2-1ec6-4dec-50063171dd15@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 11:16:10 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 8/8] media: iris: Add platform data for kaanapali
Content-Language: en-US
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <quic_bvisredd@quicinc.com>
References: <20251017-knp_video-v2-0-f568ce1a4be3@oss.qualcomm.com>
 <bRFGFB-aXU67uJWfk8UwBE0tOCTXpquadL2rGHbdcoY0nEdQ17cATN_K1Khk6RWZ8cGONLIs9N6XLd_pe9CHOw==@protonmail.internalid>
 <20251017-knp_video-v2-8-f568ce1a4be3@oss.qualcomm.com>
 <9d39841e-d2c1-46e9-8745-1d4d8d073739@kernel.org>
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <9d39841e-d2c1-46e9-8745-1d4d8d073739@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfX0IYg2eHDmeCn
 e65fg8UHwv5wlQWgH0vsZJcOwCfGwDc3Tis7JUwkPr3gR8gbw5+Or0StwBSELaOjqK4HtRDr1Rw
 jk+Wc9euxy78fMXeeKDoCxyOKZR5X5c0xWUdfexFszMmlxt4JRKY4TYrLT0Q0qOeuRjSkQIzQK7
 N0vmr159ljlB4j61vCqxWDmSCll4COszH3HDHzk7DMpNxbFqaZAjWxKiXrrUWB8vPeK1YDtlUre
 QUCHD6CxpS2K/MYXxuIwwNmYlik5n1jgoNIMI5rWhvd0I3Mjm+K17FZQzBGyQURQKtp3oppW8U+
 uHSv5Xr9/eaRgPzOoMHOfhmfHH6I2pCMCSPDgSMnEc2RA8yjrgmRqo84T7RoQPEmT93oexT6vPg
 TYl629sUAOdLocfBv0fFLIeV8xEBBQ==
X-Proofpoint-GUID: awjF0tSknVXFMNETIa5UYd_NsFIrVwdp
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68f86faa cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=FoPg1IWog9mqHsjG+aRTFA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=aMGEy1ZA8zrtvtRU1IMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: awjF0tSknVXFMNETIa5UYd_NsFIrVwdp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000


On 10/22/2025 5:09 AM, Bryan O'Donoghue wrote:
> On 17/10/2025 15:16, Vikash Garodia wrote:
>> +    .fwname = "qcom/vpu/vpu40_p2_s7.mbn",
> 
> Dmitry pays more attention to this stuff than I have but, is this a released
> firmware ?
> 
> If not, are we sure this _will_ be the correct name that hits linux-firmware
> upstream ?

Yes, the naming was discussed and the bins are accepted in linux-firmware

Regards,
Vikash

