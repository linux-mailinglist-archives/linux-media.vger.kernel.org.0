Return-Path: <linux-media+bounces-41696-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E837B422EC
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 16:03:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 34F204E49F0
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 14:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33F0930EF6D;
	Wed,  3 Sep 2025 14:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bRlYdSsp"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7A81459F7
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 14:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756908156; cv=none; b=rnS0tSAMyarv/kb7ooGPaslauTWmo31mMnElMVRTcg98FZ0FJ5QSCClilITa8ESTzs6clc2UDdIO5jjO+o/ujqJ8pwIk8e65sWGJbJlyvhruzt/JbqT76+ANDMZ30VJyE/Ah2x5/y0ZqLc7FKxdfmiNCe6xcNJFaPr7Ztg1eZ4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756908156; c=relaxed/simple;
	bh=M1LtgKaIxvKtJ+9qrPZwuMH/I9dN5enhPX3YUdHFus4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lruNlIlvOK9dln23BtcR3KsQZyZlAu8+D002TqbA/M3byL88aChwfLf0wE9e2zm1ohHTZQZLxk4bViFH5yt81DsFOob+D1WpYWog/aMZovDsUVqGWwX5S/GAoNhJzhKjEew3mThM+9y7Wy8TudyeWsRs7Xi0s/noj05CgvyWa1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bRlYdSsp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583Dx2aP030111
	for <linux-media@vger.kernel.org>; Wed, 3 Sep 2025 14:02:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n+WcvQ74Ce4lJ577+ml0y8UW
	yDHNSNlwkTL36vqsE/Y=; b=bRlYdSspZpKNzm2T/cwtImHx1+fmgqAOO2AOAF7o
	wGcT89iVb9A6IuUdLa5F1mdHTmBJce+mUxFFhS9rAt5Qfn62K0zs5ue7tTc+FZwE
	sdJonU1/V68ggFK2zIWWWlljsdySDjE+G3VNbG2QSLZI1k8a1APeeOkFIxrQJyOw
	49AQrBPZ3tTk9Zxh1GCpS5fRje3OE2HRs0ARc5YwRZQI7PW+wvAkajLGVPUHJkxw
	WayV7c3miaOWdpu6HtigjV2hmyAPpGz9p8dbohnquZhmWT0bFvimoZSgIjgICCrH
	mFpfaQNrU+5MqRwa5DeIqN4oMRcKO9eKK2cbI/AdXf9Hlw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpc2na-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 03 Sep 2025 14:02:34 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b4f86568434so2506809a12.2
        for <linux-media@vger.kernel.org>; Wed, 03 Sep 2025 07:02:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756908153; x=1757512953;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n+WcvQ74Ce4lJ577+ml0y8UWyDHNSNlwkTL36vqsE/Y=;
        b=A/yP4hagiP1L6ymPJuvVizT4jz7zEW52POgJGFCtBpv1JBd6I1+FXFsk/siyN3qQ2E
         GOIJFcgc1ukEjMQ0L3aK+GrK6h8m4QIUY2q99pc5KvW8p4rxiyaiWwLRtbx5nNU4IJGq
         T1Ceu1bl5ga1gni+XHGWEZpL6tvI6woO7N/T+fVsXmxk9LDJ0QjEdOKf/zBcd5y+84fY
         LSTF2AAfOUhznGiPycO0TnvLqBGwi4o7v9gpUjEcWE2Ym5XT5iMRk2WWkiWRnxdjJB+e
         qLkkL7/1VR0jbJzcvviyTLPGeJHiKB3t1MpxcHulfuE72FOobVI05tb5+q8Iwjr1/izm
         5e1A==
X-Forwarded-Encrypted: i=1; AJvYcCX8QhHJlWmDZUW0baG6aNEVNRDKvgMaUr6/SChz0FpyRf/YwnZy7EU0GLuqkiqPLsi568W4a/Us2Zx0xQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg/g7I+RDChnLxSGoFr8xDxFwf+S2pdbvQnbJuAnAZHOCTqE9o
	XuA/e//LCVwN3LSn580GoPhNR+8RnXppcSxTw3qnw4HKP0pKdImOTQgSnjFWf5obGpbXGVJI78s
	KoTBRwaHLtlWJxgDG0q71bwjrs4d4zIgGZ+n4qmAgHIpWsbUlEkAK7aXSx/F5UqC9/A==
X-Gm-Gg: ASbGncv/M6i+6AesKnE2zkKopa5r1Tr+UI62mHLv47VmRzF/riE5xWPseyQ1ZSW8515
	cuiKUbZ7p6NtqTW3NawjPAnv8R13xwQjcjZmeQ47ojYxagSVubgMKrymp3ZEd3eWcYYU8y7QfdF
	zqPWsr6O2O7acuvId4xH6JmvSeu8DXXSONMMz8sjhRiyeNxpEK5yHvyvnla+S3f3bRgjHBu07QT
	ta5vBAg3U8i+uaF1Eiugi5Xv/rlPrdcCJU2Wlt3/xaTCxs+pjxGrmhEVfp2L1mWIYmqB66Mnar4
	/d3i+WUREdXPWVOFEj/FTQtWrWiVL58wnIG9Pc9IDO94BipwVKJKxfTU4T1tVmGDo3Qez5C6L9M
	mGoOTzYiXW+48ruTPfXAEgdiy3KxI0jl1igsqGX9alYST+aWjmwYC
X-Received: by 2002:a17:902:d512:b0:248:f653:538f with SMTP id d9443c01a7336-24944a12af8mr216023235ad.27.1756908150898;
        Wed, 03 Sep 2025 07:02:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIBrzUehFEhNOQDQfk8OUpugY6wgISvKlXoqbQ3W4x5v+1NPoa7mta8UknLJu8FmxdZvq0rg==
X-Received: by 2002:a17:902:d512:b0:248:f653:538f with SMTP id d9443c01a7336-24944a12af8mr216020855ad.27.1756908148649;
        Wed, 03 Sep 2025 07:02:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ab5e53dsm548761e87.7.2025.09.03.07.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 07:02:27 -0700 (PDT)
Date: Wed, 3 Sep 2025 17:02:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 00/11] Peripheral Image Loader support for Qualcomm
 SoCs running Linux host at EL2
Message-ID: <2g3iwc2en6wh2ucrsth5ontzdwqr7tr6oplxjnfdjsy3lwyyfe@l76frwiadgru>
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <660c2594-9a93-450e-9a2e-17ef6b4c696d@linaro.org>
 <20250820112242.usd4sdd3avxdlcas@hu-mojha-hyd.qualcomm.com>
 <f5582304-8f55-4c3b-b752-9cefa1e4df96@oss.qualcomm.com>
 <b5a0ad0d-ceba-40d3-a111-0831c4538cea@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5a0ad0d-ceba-40d3-a111-0831c4538cea@linaro.org>
X-Proofpoint-GUID: 8TM0JKUXEWtWp81Z87Wdzwf_7MjlHCgZ
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b84a7a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8 a=14clLndLnRljEXVP7n8A:9
 a=CjuIK1q_8ugA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 8TM0JKUXEWtWp81Z87Wdzwf_7MjlHCgZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX25TQ961IDB7X
 +PXFQ4zsof/huWP1yEN0sAWNy0fznyo0QyO0AMXLMFjZ+hUuTpP9mp3jD9f9lFIU8YeESmTCiiy
 ZQVtLc+og1IEyL+H3xVevIGBm5YZR15JHx7PzxXzMeIndsXlGhI50Qq/C+pIM+dod5vkOApAH1F
 hLFqco4hhG7Q28A0YGYmccaT0rEB8tVMw52hEnMLUzpAF2cM3OH9rCPKTzUhexefr/GKDVJngnE
 OdQ94/lbeUdDB5Dft5O9G3NE2weDYqL4ORppAoa9dISgRPFTsbzypgOdbCg3qQg32TEE/NSuvz/
 rQBFY4wkMdysWqFfT9pxSVbSCUmisQd2CvnPaxCYZJ/NDVA03DVZjQnl7jyRF5NrHI9CbCEMEc/
 D6duwoeR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001

On Wed, Sep 03, 2025 at 02:31:55PM +0100, Bryan O'Donoghue wrote:
> On 03/09/2025 12:56, Konrad Dybcio wrote:
> > > Can you try with this next-20250814 tag ?
> > You sent it on the 19th, so it's in your best interest to run a quick
> > 
> > git rebase --onto linux-next/master $(git describe --abbrev=0)
> > 
> > and giving the series a prompt re-test before sending, because there might have
> > been incompatible changes, whether ones that would prevent applying, or break
> > things functionally
> 
> I can't even find that tag next-20250814 closets thing is

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tag/?h=next-20250814

> 
> | * \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \   00062ea01d35e - Merge tag
> 'drm-xe-fixes-2025-08-14' of https://gitlab.freedesktop.org/drm/xe/kernel
> into drm-fixes (3 weeks ago)
> 
> but patch #9 in this series stubbornly won't apply to any SHA I've tried.
> 
> meh
> 
> ---
> bod

-- 
With best wishes
Dmitry

