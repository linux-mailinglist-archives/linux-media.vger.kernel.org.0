Return-Path: <linux-media+bounces-33697-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DBEAC93A6
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 18:33:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 649711C2110F
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 16:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EC5C1A7AE3;
	Fri, 30 May 2025 16:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dcweAjVD"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B59246B5
	for <linux-media@vger.kernel.org>; Fri, 30 May 2025 16:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748622826; cv=none; b=Fjn3yrIhrPO//vnA77xZs7BnQSlPwonha54WKELPAlsQM8LceA5KbYEb2bYGHcaW8QmndESNoPThRvlVPxJLRe6Jr/NWJTJxnorEOIL4zwoWOrKXNkG71pxjDvgm20XnX6BQ/568S1ibgYt/aUHTmeIM+fPGYqmI5f6jQEK0dDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748622826; c=relaxed/simple;
	bh=/bLJrvclZOkbWx6KYa3dHosgr8pdwwAJZTB1U1woF5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NeU+2/AJQDiXX+dMDyP/ob2MhRVFf3fqcFLUqhY7f9BjZN+NWK+PEzVkfdceRxecyXgMaS7YVOfdcyFcb0SDYvILXzVvfHZVwPq5fv9QI493rqNJQC3HwQ9DF2cu0JjvUnu5haReXWO8TvSqm8ZeaXLd3+FHkuJTAZhoQ6NOa+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dcweAjVD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UAwR87014001
	for <linux-media@vger.kernel.org>; Fri, 30 May 2025 16:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uCkkqy4vApGz2Fcr6sUFdDKm308UJD0nqqbHUovYzug=; b=dcweAjVDE/LjqPwp
	oTZoLRzOpQtI1JYDCMartltY2c5NB7YMlo/dTDRPndvS7pd9PPQfhgSBch3PEh4H
	oc5W8IPBmxXc8y9f0eJegWB4pykMBiCEZN8j+v7aGdrixd7VyGS2/kjhy0zo0QqA
	XUgfiq0u1OrBVtwV/38j7YZVZ/qTbTyZsx+lQ9ewM1baMS0WsetNFx0znDmQ5qfz
	BRdtzazkc4/gCaP/Gb9+EA695ygVe/1eKNTHi32s/wCYmY4odDJHX8u9qVCsOZJk
	9jXkDDFD0qe9Gq1ZUFCJmTcOm/GSbItFs5zFtondN5eTlNacUbBVYKOzoLNvsXQH
	LTVIag==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46wavm3q1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 30 May 2025 16:33:43 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-742aa6581caso1792860b3a.3
        for <linux-media@vger.kernel.org>; Fri, 30 May 2025 09:33:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748622823; x=1749227623;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uCkkqy4vApGz2Fcr6sUFdDKm308UJD0nqqbHUovYzug=;
        b=wk5oZ+5iPR/K+xxjNJwIYUlAbZV5ILrbQtfeYs5nxzznmKtwYytNoq18MBPLYptnGM
         Ma+/jD+57F/ZPG5a9HSard+oLgFsMzi777cU2xdGjm4jzI7odBBtCtoAMqaWHzL02TmU
         0YoFsa8dFi3DdfK0JskRLjMJO/rU9+Da+mNNUaNvYwm4TspZpz1CbRtr4Pg13xMLFvNS
         JC+GwF7gZnJLJmUlfHHGNUUboYupA5ZBLe/XUrM452O2+9vI7m5uy72t3fCUE7dxs/Ak
         iDscmNVMEE0P1+1LQ1PisHOfsGsXLqh+G56fPBHNcpyIFYgrm9dl/wG8MZsoY9L0dfrU
         gGnQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1ToNf+w2Abbc0qrkn7dMnmk+RE2XnOeAxSkX1ZFI11qcrTdLGsrZXkjlOk68//hQLTNm0QB5k/GA9HA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtTy81WtwDwQ6MPjUqan615tE480nc1qWeyRGXQ6nlnGGgBjI9
	XCbaUk5GiULYSsIbWJhwiCzjTy8COBYoWo4MaO8181uVhKgvCNZS5QEfuG+gIVkiW0OuG/4K46i
	UAVFqRBPLjNML1NsGi7+J694PrRD69dp75jdPjDVftaX6wVcF7l0GwWeq1ZcG++meig==
X-Gm-Gg: ASbGncsi7EvTjpIF8erCFWbFEj0Hrnql2Iyv4axtjIcmgPp+oJNimMC548CMH+UqBlm
	AiHliP7FCwc2TQrd2/bbrpOgA5lLgyICSWWNUIji8CD90YoOzan9AehMeAWLLKDs8fOXapTFco2
	qwRVUM8te2x9ZQmkhCIsDWqZuQZLYDx6X8W3XELa6qhVgQ5ZSa5YasdlXvgCbsl9YFlUJZCfAqF
	f0JIIKz73fCk3HcYfYYWx0jV0TeH/JM6bcGq5ANp9j/PFns8R7CAe0VkyFO9YJ6bowiNjCl/nfD
	SvFiL/poMAsXKa4GUcGlNr/bv5ycfhbZoGBiuJVe3nBcaRUgZQ5AjilwMYKaRw==
X-Received: by 2002:a05:6a00:2e04:b0:73f:e8c:1aac with SMTP id d2e1a72fcca58-747c1a48890mr3832894b3a.2.1748622822628;
        Fri, 30 May 2025 09:33:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtqNwQxZU0xTr2WITGJuLCEWHrD4jd+DcWqKzqx8uZbn4MTH/bomjNfm/KY2N3fVJbrV50ng==
X-Received: by 2002:a05:6a00:2e04:b0:73f:e8c:1aac with SMTP id d2e1a72fcca58-747c1a48890mr3832859b3a.2.1748622822240;
        Fri, 30 May 2025 09:33:42 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afeab820sm3347905b3a.60.2025.05.30.09.33.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 09:33:41 -0700 (PDT)
Message-ID: <34a9bf5e-34f1-46ee-bebb-96bca551768c@oss.qualcomm.com>
Date: Fri, 30 May 2025 10:33:39 -0600
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/10] accel/rocket: Add job submission IOCTL
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net>
 <20250520-6-10-rocket-v5-7-18c9ca0fcb3c@tomeuvizoso.net>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250520-6-10-rocket-v5-7-18c9ca0fcb3c@tomeuvizoso.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nmL32QtYAT5rwlVzELmjebEWuQ_TBdGy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE0NiBTYWx0ZWRfX/8gmlClQkEQ3
 t9B+gPNL3F+hBWcMNLlTB8C2lv3Vn0hvlEpx4RHF+hPDOkAAUd1E3PzE94MS+c/yBX1TFXa4d5w
 JDswvEZOu+GXx3+lTmAlxDk7t4SwnVba+KZBXbJK76IRIRy05XsiYNKfGneGcnyQXQzNxZlpfQF
 +xDoLjk4H9Nyz9D+pBWhtSUdLfqxsz5bfwx1g59GgpqvGaxI8tQTb9GTlxMcclcV3yCiV1WjXfB
 W6qzeKIbHTBkAsDIpwA5nbU8NOjaUCzSYejfHLSqXVQDpJwbn61uHiPEm0h92gysgxZ+hhVL7cJ
 OZsTVkgTCNN4ftXn1B/BLK6ae7Spei32qIlmk0VH1oluKToUenyLadYFcuoOU2VZlnDf57IT9sS
 4Q9D3gtk0GDPiPdgopfHFpCD4Kkn2dGu07qx3ajcQyJ/KGX2hpiqVBURDivmD4ghoceqZpWB
X-Authority-Analysis: v=2.4 cv=fMk53Yae c=1 sm=1 tr=0 ts=6839dde7 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=YifSY7n-Kb6RBMa0OVQA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: nmL32QtYAT5rwlVzELmjebEWuQ_TBdGy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_07,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=825 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300146

On 5/20/2025 4:27 AM, Tomeu Vizoso wrote:
> -	version = rocket_pc_read(core, VERSION);
> -	version += rocket_pc_read(core, VERSION_NUM) & 0xffff;
> +	version = rocket_pc_readl(core, VERSION);
> +	version += rocket_pc_readl(core, VERSION_NUM) & 0xffff;

This seems weird.  Feels like an eariler patch introduced a "bug" and 
you are fixing it here.  If so, then shouldn't the origional patch be 
updated?

> +static int
> +rocket_copy_tasks(struct drm_device *dev,
> +		  struct drm_file *file_priv,
> +		  struct drm_rocket_job *job,
> +		  struct rocket_job *rjob)
> +{
> +	struct drm_rocket_task *tasks;
> +	int ret = 0;
> +	int i;
> +
> +	rjob->task_count = job->task_count;
> +
> +	if (!rjob->task_count)
> +		return 0;
> +
> +	tasks = kvmalloc_array(rjob->task_count, sizeof(*tasks), GFP_KERNEL);
> +	if (!tasks) {
> +		ret = -ENOMEM;
> +		drm_dbg(dev, "Failed to allocate incoming tasks\n");
> +		goto fail;
> +	}
> +
> +	if (copy_from_user(tasks,
> +			   (void __user *)(uintptr_t)job->tasks,

u64_to_user_ptr() ?

Same thing down in rocket_ioctl_submit_job()



