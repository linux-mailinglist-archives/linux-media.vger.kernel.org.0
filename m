Return-Path: <linux-media+bounces-49664-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAAFCE8DB3
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 08:10:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 798C73019BC3
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 07:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35A1D2F999A;
	Tue, 30 Dec 2025 07:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ieezjixL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fpzic+sT"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0682F12C3
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 07:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767078638; cv=none; b=rk8VhTjZ9ZjFDP76sr5kyacLKbby1q5Zd//F1jsWYfXynLIQCg5sEzIpr9WGGaKz6a+iX348sKGFOWUXLD5Tv7bVf35WYjz1yze3GgHhEWmuT3RABHqbXq/v04WTXU0i7LnNMdkLyumqGzFKkTemXln9WrAeskJNm6n/cU7ZO1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767078638; c=relaxed/simple;
	bh=R17+CJsKfPYDagV/52hj0B7Nn/W6fb14oABCDkmtT+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GXYVVR6aUmFpMYWlymMItrKRmj8sCZj2FKL3836SQfLpvbwHw88Z+cqatUajHqzkhL5wzhmzTzY+FHetApXZFb+wOCg30IHSBDjP3Z4s2VOH++GNyIHUgPpEDawtHgRTcGSt0mTBLpsiKWSnUuLFrAwcHJuND968Xv9zzESmTZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ieezjixL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fpzic+sT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU546TW3539557
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 07:10:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9WV7PKT00pAN2x6ZgLCoHXDx
	uNoUm0pfMF+EsPTxgZA=; b=ieezjixLrejr6xDut8QF9m3D4L1UCx7179NMLe4x
	5yFfzXWp76NbzYQV3YF1X1uIUnyenyQlxnNP3OtsLvoWDSaQu/GaFdAg8OcN5GF/
	EaBGmUa98UEI4MZkrAoU1mxfX1PvV+RSbcY6ngMGzbsYy/OFKyf+eSsDIjfICV2D
	LXgjIfolimEchcHpCV+QpEjOsVLbssk4XOft7aZ5UYShcuOIs1bVd0DTmNyihTcW
	kJcEV4ZzfgHEzU2L0/jYH4ww6YvV9VD8dYmSsLCmb+YC7KE/OSIdC5gKt6Vwsgn7
	ntJPR9F0iUybqbhRphP51RXkI6KLNqpJZibhuox8uKkN4A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc88yg8yx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 07:10:36 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edad69b4e8so208218891cf.1
        for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 23:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767078635; x=1767683435; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9WV7PKT00pAN2x6ZgLCoHXDxuNoUm0pfMF+EsPTxgZA=;
        b=Fpzic+sTW2ReyjkDAga6AaACbwATPiotsGTLz32W7ZQYlq3DftCTknjjaRoDS1ynXQ
         hzqOZpI0iFmlxUwBPN5TUdFFOI7FcRScDRtypinCCL7YHz0ZQ7UZgwpJjsYn0wWtNtc4
         D6UzbIg3CeCCODxAtKonXDrL2SkpbZXNyDGhxB8PTJZ8pMF/9Ci1xcWzIU5LWtEr7jse
         XG7hALmLb1Htfp2Ool7XR8/NDQUybCyKQGGWXcxDN8IU921xgcKPplkwpAQHf/G0ttZZ
         ZtRnY6th5FyHFeJxkqBbMzUwMntXY9oGSt5bJ6j9mPAquEkQTy5gWbEvZk3WGmfovEYL
         Hpzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767078635; x=1767683435;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9WV7PKT00pAN2x6ZgLCoHXDxuNoUm0pfMF+EsPTxgZA=;
        b=gPPWDAPgd93hLqdjG8b5RIWVqzD3ZCF+6Sy3gbpyQWaBGgmZYAtGRfHdEtcYA9UowV
         D7ZmsD7mKmqJ3Gonlj8DODJCSne/F8qtyj4es6dRa58QiLWB3zrW2Lp9Cc0Vo7e7wbS+
         KM5Bqlj7KMf5bgXppBV1u6h8ixfwb1M+ahbK0DwrdwE2UWElDUqgdHJEMB/4mXrOb+oQ
         s7MMb4J7KrTMTawl9gtQ3BK7tjRgOEBsa04G8xRmRZ2w2DJCmeY8pHONj+zBZaIgHfgU
         SpuSTsQlNht9SDiA3FXFnjMCtI2XB2D3W5lkfrntNprlQvJnx0yzw2Adp2/vKuIlTzg+
         ZZ1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXoXHbROa8f+hVNp9+HJov1PPGPX6H4GKXNVVms10lENbVyKLNCNHSNsTh/IoFJmg8fE5+j7vb7IkRQ4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6QS3qgnBIKzPRyQF/o4U9xhqLl65yErUGeJCzk6SL+cukF6Jp
	R2kQG4Y/AjOzhKGlURcrpCW7D5jmP+t3+lWmogtj/u8gw5ZVQ0hhGVTH8jrAR9/N7zU7xaRs8Kf
	m3mNNSweDi3EBxBdBKe6WXCCSRbFnjzJdzOc4Q3aT5J14Fx7O/ZcDu9sWGv9Vx7kdyQ==
X-Gm-Gg: AY/fxX53gYFAdwH2PbESLNkuocMSoFnenLxxUwWsC47u+EvPUm/dBwim/5IXMCyNnZm
	wG4cZUpU9HJI17cfqBsg5YrVNP5J+awsFYiXU/5IcdRZwTMXtn5LUYBsviPa3LPnEArkP8qEF1D
	Vsk/RoqXis4rmgKPQ8pMhYbp9A12X0mr+gxAq3LzcTZWh6OXIVWs2yVebazzZmNe/81eYQQZ3kv
	eCWZMk3UVmibCKRlgY6w91TF/hAcspWpOT96so3/XXjEFdbCttJfpG/6UcbQY+g7R8/gB4oIjeu
	wWDXJV33CkVcXYwcmYryN9JIKjtZMVVlOd6BvLSFos/4mRc9DPDiLxjcLsD10niChYIePtZfR4p
	u1TVe/vd6ejkd4dOM/R1lRBFEmcl1VZQ962szYs3hnBW+PwqAPNYncVV8UuxNEldmsAyzKaUP/Z
	N9d6Ell5vKfwiTra1oRBsiznQ=
X-Received: by 2002:ac8:57d0:0:b0:4ed:7fe3:7be7 with SMTP id d75a77b69052e-4f35f43a812mr494351761cf.24.1767078635548;
        Mon, 29 Dec 2025 23:10:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGHd8J9DX7BM4TqV0H7uqpBjz4gc7Ib5HPjkR0SRtqWbScQ68yZAJQX9MYNcv13mKSOr5LlXA==
X-Received: by 2002:ac8:57d0:0:b0:4ed:7fe3:7be7 with SMTP id d75a77b69052e-4f35f43a812mr494351611cf.24.1767078635142;
        Mon, 29 Dec 2025 23:10:35 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812262b360sm93786161fa.28.2025.12.29.23.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 23:10:34 -0800 (PST)
Date: Tue, 30 Dec 2025 09:10:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>, quic_qiweil@quicinc.com,
        Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] media: qcom: iris: encoder feature enhancements
 batch2
Message-ID: <7744i77dgostmgzifadpmewxeqg3olxpnocghd2jae5ky3ijnu@wq3vhrjlpx63>
References: <20251219-batch2_iris_encoder_enhancements-v2-0-371f7fe24801@oss.qualcomm.com>
 <fef64cb8-06a7-580a-7d91-04013ed1c5dd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fef64cb8-06a7-580a-7d91-04013ed1c5dd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=POcCOPqC c=1 sm=1 tr=0 ts=69537aec cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pvVE7NzpYgYTDHsC_WAA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: -ce5610qKmuzRYtRt4omqNysmoANet6e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDA2MyBTYWx0ZWRfX/AKqKeAtBEQD
 iT+isxQn/mg7XsV/DnxbLGeH9VS0KRYSkbHLE9D/4OuaiFfyTe9IfvFSZ+e0wFkCIJdyFbKHDty
 gyppMiMI276ShpP18zpncErz8P9k6+Y2JgASCAWLQCWVPGi1L/735GYPa4Qyqd1YLlUTvA7Ijv/
 PbRxdU4sNq4KmYnKCtfSVxxHF0Obw/YCGlnJvZjiiwyx2gfI1BiwVoYmE+eZ1GE5UDsh559RYcg
 IKPjZ6ei8UDNpToFXoigtUNb9YXobJ/MONpFIolh9N/xu6XOHeKgPCOnVmSICCj8ffYVUZyjeWR
 HuoN1xA6V8qsZsiDiE8gxkQ0lj8v/57Y8XeEAlcSNR/CXwaLaE4+Xj51506UD0kcx89ljCqALMF
 QQEgl9ytNzNaYCOj/XWuyEmDCfh4L/X7DL0w+0uBr+UxrVKqJ8pygEJkQt4EhdgrwLBVdqcZ2zA
 AR0Dnkt+nTziEz9Xm+g==
X-Proofpoint-GUID: -ce5610qKmuzRYtRt4omqNysmoANet6e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300063

On Mon, Dec 29, 2025 at 12:08:43PM +0530, Dikshita Agarwal wrote:
> 
> 
> On 12/19/2025 1:12 PM, Wangao Wang wrote:
> > Hi All,
> > 
> > This patch series introduces several enhancements to the Qualcomm Iris
> > encoder driver, improving support for V4L2 controls and enabling more
> >  video encoding features.
> > 
> > All patches have been tested with v4l2-compliance and v4l2-ctl on 
> > gen1:QCS6490, gen2:QCS8300, QCS8550, QCS9100, X1E-80100.
> 
> Pls test it with SM8250 as well since you are updating the corresponding
> platform file.

Isn't QCS6490 enough?


-- 
With best wishes
Dmitry

