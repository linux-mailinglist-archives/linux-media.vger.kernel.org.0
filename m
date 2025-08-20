Return-Path: <linux-media+bounces-40392-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E78BB2DAE2
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 13:26:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 270F33A6218
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 11:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A555C2E4251;
	Wed, 20 Aug 2025 11:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gsZO/7Yq"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E06D2E2678
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 11:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755688973; cv=none; b=WapI6FD27viYnkhE0TlA2NNIMkmUCIjGNIxSa17JVt5OI8v6ZfFRMWrWEoF3Xaq7nO/Rx92vLNYzD7xgOZn3qkuOFzfo0WZVSgVTRB0ALuq49SDEimOeTfCWoh9QflMIXlkTwqWJ/ZTL0lRMKbMg+cnZXb3TjsU6/XcUSIoNVBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755688973; c=relaxed/simple;
	bh=VZtTyZqYgCPoBF4RLQ8FP4HETh9OS5HmOoryIXIYzgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BU8E4+evDK0GCJHgF3ptqOY9+bAXEFuyGRXM0bwUFoRp/setjM5GjL0k6mjqvx/bQZ7NP6xWn+GufzSmeIAb6DclC6vdoHiPT1qVn1mm8XLMWicKRyQPVqLJCQGVGZoIpcc1ftqJ9xoiDBhWix15SMG4CWeYCLXthKT5z1SzP0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gsZO/7Yq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K9rvk6002673
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 11:22:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1teVV9lLZMsgoOx2s0zCWnuedYjSU8VV3kG4L2Ma0Bo=; b=gsZO/7YqY8uH+zua
	rPZNMfYw+JhDuXjtWOCR9yhmHAng40YTnGJOqMaQVWaRl1q22pPWVjrJKzH1/4Z+
	puNkxOoBt81pMggKtQLja15BEX2x6SBunuD6W7eCAHerJdQjqGnjwY8oMLad36TH
	KfMmyPGgFrTgg/v8tPbn/yZGFNM0gNgy8aqtH9k2mk+7BrEUauyLrEd7R+iP39ct
	UvCCyOyc70Sm/WAv0UuQWcPOsUQ5qJNy/9wqGCXRF31QhMzS1o1JjvRRfk4HgxpC
	iCPZrQW5ms9QJHpuwtXC9JR0IVLr07dhDip2ETl2I4meStrqOuuCOnqQ9BCfUg8t
	+iHU5g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n528sg15-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 11:22:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24458027f67so148118515ad.1
        for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 04:22:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755688969; x=1756293769;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1teVV9lLZMsgoOx2s0zCWnuedYjSU8VV3kG4L2Ma0Bo=;
        b=Pp/hA1v0g3ojL7s0azqlDPwDddGkSPnUqaphPl7/RNHE4qdeNj875EJb8iNtCfEtDR
         4SSOf3AC07JRyFC59gzFtofmp07SRahx5rRvMG42/B3jIfyGsfT4FK+7G/PxFDODCxHu
         iL37A0WJP9UqFoe1Pjg+proX8AmfVj5EkDyveAYEKisI3d2bDIoLkXSDkFIqzOO7pX7w
         U7ptQ+QdouSgIdGgXPBXB5PCN187MeNj38ukcXxLL4wee3f9hyYY68yj0RCOOpGzCv0Y
         NoQEJLuZoWHlmYvRQ5wo3IWA+PDOLqNzqAk+/QmKzJ69wbCrdXha15F0Qjki9mxAhxPN
         ryCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSKohZz6yyDQ4DSIFvUm0yi/YUTfOiyZHYgK4mjAqKq/vRUmqrgrKwB09+6jQJfJJZsMJNKhW398qNSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxODwiES1zruIKLYxeVpFzCTNmGx7EV7xvMvwN1uWs5/Oc/n0mR
	UWYg2pYk7B+UFkJ5hNRBbqJqbtn66WAlvxnQaQWdpf/VfKHfHTDWlEvosZ0cPrjrv9/sLeGJeaz
	UCGik7fiI6kueh2a+bt5ZfvIl9mZoSApvp6tqNZSkdNE6iJKsaVpADngwWxcZBc6lQA==
X-Gm-Gg: ASbGncsX3kC4RGNoaGX1gJhOm9wGLqA5SVVF2GPkWPDTSGQfukGTfZ3BAR8hp82PZfp
	yAeqhnHbLTFpT5td1TWz/UJiGmtOqlExjJQ+WpJF1DTaMiBwyFQje+9UXRqcfUHYUe06+A7zs8Q
	c82jo45bXTh+jZMSn0/0m7xopueb7AmCB12ssqisiMMYh53pt9BDRUue9wh5jTAf7xuxq4mkjdQ
	5qu7wVtbUSotzb+0/1qav+igeygsHf6yYHPMcMapqu5wR9w16gTlKBCLkhcP1b+GN3EEeQYFxfP
	thgLgdBAZUr+LHLDeXiGuZvYQsF/FFohsnBA0orzxgZr3+tjchh64JGYLCygei7LZWY=
X-Received: by 2002:a17:902:d547:b0:245:f2c2:650c with SMTP id d9443c01a7336-245f2c270b1mr17097755ad.18.1755688968905;
        Wed, 20 Aug 2025 04:22:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaKEx4GU9sGjm64Ya4mNcH/P2kGCGO4aNdZjLPT8WXV2jTp2OktIMBv/IPAaIoaHGHIyo+2g==
X-Received: by 2002:a17:902:d547:b0:245:f2c2:650c with SMTP id d9443c01a7336-245f2c270b1mr17097535ad.18.1755688968452;
        Wed, 20 Aug 2025 04:22:48 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed35ac08sm24269015ad.42.2025.08.20.04.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 04:22:48 -0700 (PDT)
Date: Wed, 20 Aug 2025 16:52:42 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
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
Message-ID: <20250820112242.usd4sdd3avxdlcas@hu-mojha-hyd.qualcomm.com>
Mail-Followup-To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <660c2594-9a93-450e-9a2e-17ef6b4c696d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <660c2594-9a93-450e-9a2e-17ef6b4c696d@linaro.org>
X-Authority-Analysis: v=2.4 cv=fpOFpF4f c=1 sm=1 tr=0 ts=68a5b00a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=OaBmBNw08KxK7u3tEGwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: u5MDfnPbFAuQwzQbZQuBskPn---Oxdqu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXxlupiKqO+6w6
 Zld9xS1dSiWTD6UaIJxNinWzl917xKHI7W711apoSnGeR/FS6eXAGhHIUZSo4PL8U0U3AduAmim
 KqDtmRHcStBJmn57B8SLIm8RuxvNSxW3WWusSbEIWee/v/SCk4PwdQbZc0YgIOgfypPDeXz5C0p
 9tYLKVQbBS2QP4pIdggk90IdxlIVR3u3keji3BhWlw4jPuDq7mkU6SxDFgJ5TAwc1FLiS81tR6R
 8Q5+pUaVnddJ4mHQHZRWWQRYtBrlqm+IhWNLXjE1/pMsDcjuD+ZNGRczM3vfsemEt+pOfjqGgcG
 1NMf1ybOsd6fTAmazctmF7xKWtDgY22XpBNAvY8Cpjq+kbzcxW16vtPoUhqXUlNFAlz/Rc5jYiI
 XcjDwgbSdBV/zL9zup3/hKfJ19KDLQ==
X-Proofpoint-ORIG-GUID: u5MDfnPbFAuQwzQbZQuBskPn---Oxdqu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Wed, Aug 20, 2025 at 12:03:16PM +0100, Bryan O'Donoghue wrote:
> On 19/08/2025 17:54, Mukesh Ojha wrote:
> > This is a further continuation with a new approach to the topic
> > discussed in [1] regarding the enablement of Secure Peripheral Image
> > Loader support on Qualcomm SoCs when Linux runs at EL2.
> > 
> > A few months ago, we also discussed the challenges at Linaro Connect
> > 2025 [2] related to enabling remoteproc when Linux is running at EL2.
> > 
> > [1]
> > https://lore.kernel.org/lkml/20241004212359.2263502-1-quic_mojha@quicinc.com/
> > 
> > [2]
> > https://resources.linaro.org/en/resource/sF8jXifdb9V1mUefdbfafa
> > 
> > Below, is the summary of the discussion.
> 
> Which tree does this apply to exactly ?
> 
> git-log-graph linux-stable/master
> * c17b750b3ad9f - (tag: v6.17-rc2, linux-stable/master, linux-stable/HEAD)
> Linux 6.17-rc2 (3 days ago)
> *   8d561baae505b - Merge tag 'x86_urgent_for_v6.17_rc2' of
> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip (3 days ago)
> 
> b4 shazam 20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-7-ce7a1a774803@oss.qualcomm.com
> 
> b4 shazam 20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com
> 
> Grabbing thread from lore.kernel.org/all/20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com/t.mbox.gz
> Checking for newer revisions
> Grabbing search results from lore.kernel.org
> Analyzing 18 messages in the thread
> Analyzing 0 code-review messages
> Checking attestation on all messages, may take a moment...
> ---
>   ✓ [PATCH v2 1/11] firmware: qcom_scm: Introduce PAS context initialization
> helper
>   ✓ [PATCH v2 2/11] soc: qcom: mdtloader: Add context aware
> qcom_mdt_pas_load() helper
>   ✓ [PATCH v2 3/11] firmware: qcom_scm: Add a prep version of auth_and_reset
> function
>   ✓ [PATCH v2 4/11] firmware: qcom_scm: Simplify qcom_scm_pas_init_image()
>   ✓ [PATCH v2 5/11] firmware: qcom_scm: Add shmbridge support to
> pas_init/release function
>   ✓ [PATCH v2 6/11] remoteproc: Move resource table data structure to its
> own header
>   ✓ [PATCH v2 7/11] firmware: qcom_scm: Add qcom_scm_pas_get_rsc_table() to
> get resource table
>   ✓ [PATCH v2 8/11] soc: qcom: mdt_loader: Add helper functions to map and
> unmap resources
>   ✓ [PATCH v2 9/11] remoteproc: pas: Extend parse_fw callback to parse
> resource table
>   ✓ [PATCH v2 10/11] remoteproc: qcom: pas: Enable Secure PAS support with
> IOMMU managed by Linux
>   ✓ [PATCH v2 11/11] media: iris: Enable Secure PAS support with IOMMU
> managed by Linux
>   ---
>   ✓ Signed: DKIM/qualcomm.com (From: mukesh.ojha@oss.qualcomm.com)
> ---
> Total patches: 11
> ---
> Applying: firmware: qcom_scm: Introduce PAS context initialization helper
> Applying: soc: qcom: mdtloader: Add context aware qcom_mdt_pas_load() helper
> Patch failed at 0002 soc: qcom: mdtloader: Add context aware
> qcom_mdt_pas_load() helper
> error: patch failed: drivers/remoteproc/qcom_q6v5_pas.c:235
> error: drivers/remoteproc/qcom_q6v5_pas.c: patch does not apply
> error: patch failed: drivers/soc/qcom/mdt_loader.c:302
> error: drivers/soc/qcom/mdt_loader.c: patch does not apply
> error: patch failed: include/linux/soc/qcom/mdt_loader.h:10
> error: include/linux/soc/qcom/mdt_loader.h: patch does not apply
> hint: Use 'git am --show-current-patch=diff' to see the failed patch
> hint: When you have resolved this problem, run "git am --continue".
> hint: If you prefer to skip this patch, run "git am --skip" instead.
> hint: To restore the original branch and stop patching, run "git am
> --abort".
> hint: Disable this message with "git config set advice.mergeConflict false"

Very sorry for the error.

Can you try with this next-20250814 tag ?
But yes, forgive me for the minor manual edit I did

https://lore.kernel.org/lkml/20250820111448.tjaz2wld2nxg52aq@hu-mojha-hyd.qualcomm.com/

> 
> ---
> bod

-- 
-Mukesh Ojha

