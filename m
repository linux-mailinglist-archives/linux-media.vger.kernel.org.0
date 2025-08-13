Return-Path: <linux-media+bounces-39710-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C150B23DF5
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 03:52:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8ACB617FE04
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 01:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F4B01AB6F1;
	Wed, 13 Aug 2025 01:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B6K/66g3"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A5F189F43
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 01:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755049934; cv=none; b=n/POha1/Ut2f5FLmmfNMULr3xwZZj28lNxnQ4bKhP+mPboGXqp78rvF+BRjR3CuC2r/MhybqiUlrPopr2kJUr3nvG91PBDmcmtk3LtbhOjbLrfBB5BDYjEn82U/lStH5PgHoXPQpYWfZJbsRrffLfqIMZmXtpysFXVhYTxOHrIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755049934; c=relaxed/simple;
	bh=Ll38zC0TgNNSiE/fnE9zoGdtVW9LNB6w2+NMjU+NjC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U0nk4aqlrAWLgTzwDfI7Cl0v37yIkTpDt8Td/8CL61qaGAqbIi17HjLXwpyVC6bySv+6J7Q7GwaCkLcjIkeHF+UOJ2nh965luH/7F5on7mDJy9B09r/fyKyKqWUnj/PePyFk2c1/v1U5NaqLMbbMD8PDxTwTvMCnwNOt7KrEKW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B6K/66g3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CJTBuE012901
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 01:52:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=azzIjnnFrhGZepf8cF63On31tVI6l+R0n7SE8DktVtY=; b=B6
	K/66g3ltbZTioLlekcBRWaDkXKx5FaDf29+mwd6bhANi2CiCGfU/pSSR0t1FwC+p
	/iEKACkRvSPcaiJVxDDu/SPP+qLBEp5+AMSbbXX4sldx6dqBLx/lgwIpVEcunWOQ
	4Tti/eM8A9U/rqgDs9cBWNgzx4qvIVFYPlxWvZeOK6Ck1qfR/2Z/C72SPPNDJIl7
	m5BVknnQhhKkwz+82zvQ3Bwmht0Yq3ci2NIIMJ/8RGgI6jgUJ4KtLUfGU2te+jha
	YQ2161nV9Z1wFmmaSQpvez/7MQ6k3qgPbM+cdUedVBrdTtr1PNEqasPezSRk2hfr
	f7UQIuTY4HYiHLgx/bMw==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fjxbd86n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 01:52:12 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-742f52a4cc8so942653a34.3
        for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 18:52:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755049932; x=1755654732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=azzIjnnFrhGZepf8cF63On31tVI6l+R0n7SE8DktVtY=;
        b=IjoCyBSJnh9snuKXQ4DziQzr5OHkacp9sLQJg68LfrXvlpPQfik/DVy2HQuSgrB53z
         ve2M1NOnBVwgdJHyq4ZkBZfA2M5un3dD9Q0iIFYHpOqlLGbCmz4FIxibjtoFQBGc6tKC
         G2E5Hkf2UOo9ZRbx7/imhuFZfyZGxHOKSL2fdOKYD8d2HqdhvUvCZBAFVLwBsPPmy/x2
         NMZjihPHiooy8Y+ir7h3L1C424jrkn9bnDDGivv5eUQYgORxCXhmYZ9DutHPcW/iLCrN
         dgIaW+C5AB6hCEvPIaOBiH1a2nEEkrJxWnGTn8BSGFL2vUR9wU0+rivTgN/yx79+nd0/
         JffQ==
X-Forwarded-Encrypted: i=1; AJvYcCWewPKQh4oFnRI5e8W/znzynK1BQHpV1t0acWF1JhtjfuTNe6IG6J9+AjOme+3M1k4JrUxRpY+DRygNgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgA9f+wa631Ixtte1JAxVfSmogH74VfiS61lXyBZoPq+sJ69Um
	8VAzb8dmAvwI71AJBiNGG15u5ZI13Bpek8GtM9pDLOO/72ikBCw2c8cVBcfMprwKnqSteGhaDe8
	tIdhHimv1PjwlgePHMRF2yCtqHYFYB6ANRtYsxFf0EMKL6CF71+UZqznOFj5iBzmuTKwMIq3Ioy
	bINK1GKDHdEkWzVOv76qZAmEB2mouAvTI7bzu8nRo1
X-Gm-Gg: ASbGncuwu6L85a4dSPmCxV4s16zgDmdRZH8DgcMzdH54Zdv8X6EydE7nGyf5mOq3BKj
	zcP9O9K2F0OoSWGCLp8Q6z3Lj2iC1HSrnQWa8KYp0PbxudqD1jFCqyI7himbDR3FdyEwzI3wwbk
	j5mcEyqOV9T5IqBpllJdM=
X-Received: by 2002:a05:6808:22a9:b0:435:7090:b652 with SMTP id 5614622812f47-435d42a2575mr1191303b6e.34.1755049931468;
        Tue, 12 Aug 2025 18:52:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+oxwqW5ocHWrqoj/uh9nhQTzkltL6bf5O3y495PvLUQY65I8XhC+SpjSkN+0X4azk5mUzEknXbe5Iorw4nT8=
X-Received: by 2002:a05:6808:22a9:b0:435:7090:b652 with SMTP id
 5614622812f47-435d42a2575mr1191273b6e.34.1755049931074; Tue, 12 Aug 2025
 18:52:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
 <20250629201530.25775-15-robin.clark@oss.qualcomm.com> <b0a36f3d-706a-4622-89a1-f88c6255e4fb@dakr.org>
In-Reply-To: <b0a36f3d-706a-4622-89a1-f88c6255e4fb@dakr.org>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 18:52:00 -0700
X-Gm-Features: Ac12FXxxd6WCPyXXb8MbyAX1gkPmIUnWgdFOtYCj3v3CcVsNgXCk29Md82IFzps
Message-ID: <CACSVV02+hE1j9vN_BU5pwz_4cnJjj==j-L5oPeFWCvEr+1HiFQ@mail.gmail.com>
Subject: Re: [PATCH v9 14/42] drm/msm: Convert vm locking
To: Danilo Krummrich <kernel@dakr.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b" <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b" <linaro-mm-sig@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=G6EcE8k5 c=1 sm=1 tr=0 ts=689befcc cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=P-IC7800AAAA:8 a=pbUkqq1XAAAA:8 a=Dc8E7AEoan46jiKjpnQA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22 a=d3PnA9EDa4IxuAV0gXij:22 a=F7rrpbw-2xKc1p48v2RB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA5NyBTYWx0ZWRfX7UTwW0mtsMBr
 p4AHc2V9Z122unXIpRX9mDiZyTPwjOAvZmjRRtzLB0ATBfINUytGQV817Xufn57VFxwNGeka9Lt
 nAXuXNZhXMFuAxeO1IvrPCxpWfM1hZ95JN0eUvJa+VYjxh92Irzxyaj0CjqxWjR1NNMd3/fsyQ/
 iUxPkL6remcKeAvSXxrqoQSzNzQXMyN2WuuY/dQkccZBjKFwJXeWQ46pkI+CJhxJCHxcB5Rjw2Z
 Lv7xXtrS3HQJ1VSxCiglq8+lPDUuLNBtP/1ilhwSX2/OWSlfUPQ+KvxvQlXpWchuPc2VZpBxgU9
 qfbTT1uS+uZKsj2bkvwRstwq2oeg++RS9oQTwUBsDISArwXR/H4PRs1+9ulwF17RTE7Gnijq1OR
 UfZ9HVKN
X-Proofpoint-ORIG-GUID: aVPjyPaRdxeWS6BCUD1z21PLR-5N1bkt
X-Proofpoint-GUID: aVPjyPaRdxeWS6BCUD1z21PLR-5N1bkt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110097

On Tue, Aug 12, 2025 at 1:58=E2=80=AFAM Danilo Krummrich <kernel@dakr.org> =
wrote:
>
> On 6/29/25 10:12 PM, Rob Clark wrote:
> > +     /*
> > +      * We mostly want to use DRM_GPUVM_RESV_PROTECTED, except that
> > +      * makes drm_gpuvm_bo_evict() a no-op for extobjs (ie. we loose
> > +      * tracking that an extobj is evicted) :facepalm:
> > +      */
>
> Yeah, it's a consequence of this locking scheme and I really hate it. How=
ever,
> you don't entirely loose tracking:
>
> The next time you call drm_gpuvm_prepare_objects() it will be added to th=
e list
> [1] and hence picked up by subsequent validation through drm_gpuvm_valida=
te().
>
> [1] https://elixir.bootlin.com/linux/v6.16/source/drivers/gpu/drm/drm_gpu=
vm.c#L1154

Hmm, maybe the issue was with legacy (non-vm_bind) contexts, which use
drm_exec directly for locking?  I guess I can try to revisit that..

BR,
-R

