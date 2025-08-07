Return-Path: <linux-media+bounces-39037-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DE1B1D70C
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 13:54:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B72F91896D57
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 11:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0AC623BF8F;
	Thu,  7 Aug 2025 11:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fDzMOl7x"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DB4233701
	for <linux-media@vger.kernel.org>; Thu,  7 Aug 2025 11:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754567645; cv=none; b=nSOOTu9YhgYjgMJ2uQJXDp11FCAV+Gi059StfruFOUKFlc3Z36Gkv3CLlHIpM5fEIC76rEoszpi3sBdnNRdf+XA1Gltyxe1zBLNcrGR7mhUSOyxqDdvp2SHqOa3uck/2a7rZZG060aEiiLwKm4/rdY13mA97erucpywY5Qw49YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754567645; c=relaxed/simple;
	bh=ZZJ+58v5xVPIVDkFEIoUq75jX+V+PSTGi4Gi+0x9868=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NnTg+1/Ueb9+yaE1LKwy0AmBg7+e8Iw/5fyp4D1s3+zIURYf7XZkblOEfMsTPVN2GMQPfgIr6KQjPYmLgAD0XeLQ8vhnDMLa+G8nqedT7wqz36gU5d2NTokctoPfgPLa3L0EVk6JdM9IPen5EhS/Ba0nRcDgC7Tbv4RaLXSAA3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fDzMOl7x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5779DDXP022732
	for <linux-media@vger.kernel.org>; Thu, 7 Aug 2025 11:54:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JmsYXKB6unnEWfBMH3uLtxy/
	JZx2U35Fps5OvfGfeC8=; b=fDzMOl7xqzlv7RYzExEPyE1icsp+4hkb+9Whd0jU
	e7PGg2yS3ezCbYrHaKmmIC4RapiJMwvGHJ5IywhH1TeZ9lXiprHRHKLmXUiuqVZt
	dcShI5rNTAMeVPpcJVFpNtD3P/KvQuhvxkoB38huTwb92DG5+kmF+0cS9bthmtsV
	MGga/q16G77lPAW1UAncjlUI3S+OhgWXBbJWzUBOozYVO8uLeL8faIA8tCME28X5
	1S8AXB6QyRH0DmhhN40mQekaOH7eL8FNCld5VP1Qut0+j1gCAM76O9oZFmuuZlbv
	CXoBPsY74I8oxMOfE9UD7Hm8wxTjkazXrLNqSTjk7mZ8tA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48cs5n8e5g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 Aug 2025 11:54:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b08d73cc8cso23560021cf.0
        for <linux-media@vger.kernel.org>; Thu, 07 Aug 2025 04:54:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754567642; x=1755172442;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JmsYXKB6unnEWfBMH3uLtxy/JZx2U35Fps5OvfGfeC8=;
        b=syGf8THquDv+hV/eccSVzELvyyUYj1CtFawVJVXhBayo4OQEGWM7mo1TxXBDiZ6YwF
         vKF8kidyhNB3v7BGXHQSLZDAi3fQ+JMGuR1S6w5v52UkfkfAxYD5iwRuyko0PMYTVZYv
         qkw3bwQGJTPF08H2iYdblCT3IUjMgtZESY7rSrIkNp7xILrmuIZHZSQmiZsy3pVfnyw4
         txADR14tAhg2eIvJdcydM1dn+HDpB/oktfR3KNrUW64dpdCOJV1ef0xfFKVYY+C+jgPX
         TCeYlLLZ1GY+fh2yTHDqK1CtthWrI+B6ETSsaBhwmlISFOlVKC+x7GTuREbZajjNawWg
         cb0A==
X-Forwarded-Encrypted: i=1; AJvYcCVB4Gi4OQOnfKXXdUI1Yx2uo3nLEzMo7t2TSPJ8JQKVlQQRWhzw8xElqy5Qn3RzKfIjEeZx0APUOsCFWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbBQU5rlYgVxV2jxfu1cJ+mS4OWkX8dCiI1iMd6JdGa8CB14g8
	GB5hTXBlDLGVJYsldfHtRMSBPihj3OSu6ihjgzcjUbhNuNhMYpqdCSWpYTLxavQmDKPY4VqfcP/
	IchjfezAX4Jm1wlS9ePRLN0KZ1lzuFpBHxKGvQWldHxjCIozfOPhvFl+873OiIkBBpw==
X-Gm-Gg: ASbGncvFmO9zYLnRDoQMmV0Hpw8qna0gCpm1VtDqevKuCOJWr7n3Iq240//vK6zPIVO
	6dA3c6ixqKJBNUbRo8MmDhdnJ4LTTDcQei4jkhPL2fVqpP3CS95DOmh4woj9ufp0FrKKC2HHnH0
	YN7G4nrZHszTopfLEI0LQYJP8rRw0OnssOsXfByL03I25A6UIiGtsoUSDFmMtBOSVm1WBqcPgh/
	DEmg23a89waY3RF4jshzSdqC/puZ+zBrUxYUP2Zxvq2XaOLTijyrCQccVbC70ibAjf+mlmUr+zB
	whRPygOxp9y3wVL1rwWHgHWtsolDewUKaDFlSkoXZ2Oi1RqOhGYS7dN+u6CVpUx1V+onKbbOBSN
	CtpTamwq/EIoOSzLD8ICv0tpKls3OhmR5BtZfR681Dh1IF266IFKP
X-Received: by 2002:ac8:5a12:0:b0:4b0:7170:8559 with SMTP id d75a77b69052e-4b0915a001cmr123089091cf.40.1754567641719;
        Thu, 07 Aug 2025 04:54:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGa8xjZrgk7JKGa+kcJ7fkcp9cBxJaas2DISbCOZ14pSOMtXEioAO7a/COluo9VEZGCXO56jg==
X-Received: by 2002:ac8:5a12:0:b0:4b0:7170:8559 with SMTP id d75a77b69052e-4b0915a001cmr123088521cf.40.1754567641205;
        Thu, 07 Aug 2025 04:54:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b8899ebd2sm2602768e87.42.2025.08.07.04.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 04:54:00 -0700 (PDT)
Date: Thu, 7 Aug 2025 14:53:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>, quic_dikshita@quicinc.com,
        quic_vgarodia@quicinc.com, konradybcio@kernel.org, krzk+dt@kernel.org,
        mchehab@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 5/7] media: venus: core: Add qcm2290 DT compatible and
 resource data
Message-ID: <pt7dlwbxcipukwc734ftspj6ekehtnzfwndb7rqx2ihpxqwyzn@m2pyqy6nugdd>
References: <20250805064430.782201-1-jorge.ramirez@oss.qualcomm.com>
 <20250805064430.782201-6-jorge.ramirez@oss.qualcomm.com>
 <4chbcvub4scnv4jxjaagbswl74tz4ygovn3vhktfodakysbgy3@kukktkwd2zsr>
 <aJHgh8mon9auOHzi@trex>
 <ce9cf017-5447-457c-9579-700782f9f0c2@linaro.org>
 <aJRMUzF0GN2LFIZd@trex>
 <40d543e4-e53d-4289-9b87-5ca8c0139bbb@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40d543e4-e53d-4289-9b87-5ca8c0139bbb@linaro.org>
X-Authority-Analysis: v=2.4 cv=Q+XS452a c=1 sm=1 tr=0 ts=689493db cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=7TY_VEaP9L5SwCdglBoA:9 a=CjuIK1q_8ugA:10
 a=ZXulRonScM0A:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 0NNL_HY33lGjSn4fEF8M3TVl6OXgoq_u
X-Proofpoint-ORIG-GUID: 0NNL_HY33lGjSn4fEF8M3TVl6OXgoq_u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA3MDA2OSBTYWx0ZWRfX+AB6HfxM3plQ
 3lZMKqoK3VYqunkFxOy1QIh5xYDxFbmtmKkAvuD4AMmLQLn3GNms8WVo4/GcY5q+YsMxpm3mvmE
 Gq4FDbjFMQce2iqmpCLNUlMOjVkZJna+NDlGwtrs8HKqZHA6IlM1KqB0M3HjvujvZCttQZrLubc
 urZmu/rHm0PEpRzi7XuQGjhM1qw2z+VBGmxiybCFqrKg+zQqOJ+LU/jSuF+QJWc9IcrTAojs2RR
 dYZ3+iHTW8Kk8Y7AhZHkmuzdHFiIvc/JhSEkDm7SsYwCtDgp6IdRWb92occu49SwXK/7kldglPu
 34Jx3n8EVMZVTFzzlhhSgumgMVZ9YGo2eotdUfoTiba4zkOYLDCcCggo3T0bHBltvLFga5FtoRE
 yRSb1msR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508070069

On Thu, Aug 07, 2025 at 11:11:31AM +0100, Bryan O'Donoghue wrote:
> On 07/08/2025 07:48, Jorge Ramirez wrote:
> > > There's not alot of value to the user in that configuration.
> > I dont know the user base but when I originally did the code (v7) I was
> > thinking about security conscious users (signed firmwares) who might not
> > be able to switch to the new fw release so easily (unnaccessible key
> > management and updates).
> 
> Since the driver for the LITE hasn't been upstreamed the # of users must be
> ... zero

The question is about the firmware side: if we support decoder for
6.0.55, users can get video decoding using existing distro firmware (and
just update the kernel).

-- 
With best wishes
Dmitry

