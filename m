Return-Path: <linux-media+bounces-28584-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0503A6BF36
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 17:10:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDCBE3B9785
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 16:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72EAB22A7FF;
	Fri, 21 Mar 2025 16:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MBt27kD4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639251C5F14
	for <linux-media@vger.kernel.org>; Fri, 21 Mar 2025 16:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742573358; cv=none; b=aJyZeb0WcbQ5VDjJMHrUwluU3Hbb3imk9MvKf6lWArjaBV5rq+lrN+z5Zyup2iTkjj4gG0C8Cvnn9A+66VGgkdyenYgT8bpXbwUwVCg9yKMNjyBRqVTNgZIcvBVNFn/qUMtoGAyLfGAxm1zs98/s9xSZhTbWyOtc/I/QMyfzALs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742573358; c=relaxed/simple;
	bh=llZWZG8vrikSmiw8ydIW6hs/MJhHomqckp7K5dqW3d0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KaJoelN2kB/WKR03vguJ7dVutRlPPTGX3yJu3nIhh9OhBcgfgPzT9Vt9vvfoU7k5sFeLPxfJHW4whxsUJxGIjIjeqtnaOPY8BwGpqi53GzGLCg39k8kqfpxPkJPK6r738Wsj1I1M1yHrzlLta/bj8g606XebNLtgxgC+T0P0Xi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MBt27kD4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LATDfb011513
	for <linux-media@vger.kernel.org>; Fri, 21 Mar 2025 16:09:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fdOuElFLpccoJsuXgqKPQO+xF/9Y5vee1gm2/OiO0Gw=; b=MBt27kD4ga1ISE1Y
	oYW+r5SB7YuIJ+WP2qd2UrnA9bVoMbvLpp5Ag6nBiypSs0xrww2+q4JskgZvPgEh
	FfXtDFZQSKbkuuGSua1GvghQRGqBh+9M0S6PEv7JSilvs2kl6QO1uM2FN2H7Zjnr
	LDT7PioLyMjyMH0rl3DqPfPkkWX9cjW4KzssK3WpktwvD0pvXnotcSGd2uKYVkCB
	JM/Tqlr0ZQUgjKJTcL48w3PJVc/nAGf82cwFwiuHmOegvi9e+AD/uQwQWf5RFnOc
	sVLDE2CO6twu/klPDlOell0cX7YaIgiWxafKlBrI1ye4lLVmpLJdRKzyD+3HWF3K
	IrpZ2A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45g15y70ap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 21 Mar 2025 16:09:16 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ff605a7a43so5554672a91.3
        for <linux-media@vger.kernel.org>; Fri, 21 Mar 2025 09:09:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742573355; x=1743178155;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fdOuElFLpccoJsuXgqKPQO+xF/9Y5vee1gm2/OiO0Gw=;
        b=OTP47IDKVSDSC746J3f3tLlHaiDmAKTwqiONJm91JsIZJb2Slz7Dd0LWtng/EIaRUk
         DyDt4fX5xCLseW0HjGG9iN1sgOT28Gb/MGSYgYPtp8no9ioihtj3Akst8FtOr+yAWtcs
         bqQDAu2VaDjOFGIGUbF+rvEOIET3DurEkh/NjpynYbJ4O+DzTV63IqtCsg0+X95einYc
         vvQnx7k/WDRjEjSGLgofF1u3Rp8A6M8PSSx+M0g13t63g9RICyboeRoyYl0P2MmV5KoI
         R12ZCZ5nXxPyuKKe88qK5e/Cc3T2RuxMesYVv+VU7WD1IpdlOTG7dGSMJ8L1BPTRJabk
         RAbg==
X-Forwarded-Encrypted: i=1; AJvYcCWABI3rhLv2v0fODnEfXDvjYoRTZJQ39/8gtP9DgBo5Bt2hbjJV2+SYRHpxc5Hi8oikkVZLCZV4+53Lpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvNj1Lj5RATIk4BOZs2WLsXyH6r7tpq/Xi2mjyr4gpjfEwwaKb
	1DMGlNeRsJSeoGpXWRMCnJNuO+YuiuprFAYePDQLDZZ/VF2kdypcBLKemuY2Omd9CnOFSRE7jwz
	HsFoS/pMfana6nj38xKRrJyO6YMFMY5Xrn5QxyE3tgNk50VXYKv165ZmbTajb0w==
X-Gm-Gg: ASbGncto5WFfNmDcpLjoD5LyYCB/WE2w5yqPzGNWplXwFdOvemlrsqUH5LMkjL2KglG
	ygVb44UPL9P1AedGsb/7oWJzF4+ZzZg/Kq4PFubKr4CiAKq+ucaA99RsoQJHSO6QcvF2Ie3AYoT
	FgoRw6TXBIyY/Hd2IOO3y3K2HYZHWGprTZRU3N04xbUuYXJB409DHuZqFM/U51R11ypjVFpjiLs
	VcmM49ti8qguhxO0PzcBprF5dNJgSR7HOxbTJrvXN5t4ZqMNbpVuUle1MDnWsQTpXDnl1jlsg1i
	Iy3nrokor0MlB5uGnIEVmt1vKMwoWv0uX8sjvjH06fgil4IAjbGdSCTfw4+ItGnuGw==
X-Received: by 2002:a05:6a00:4f81:b0:736:5822:74b4 with SMTP id d2e1a72fcca58-73905a530a9mr6797791b3a.21.1742573354413;
        Fri, 21 Mar 2025 09:09:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGL5fYByHbvsD/gRtsSQfXYP8pBS52gj7BStPaMfEBPmc/gB4ybx9sZflEDEhvH+V7H0dixLA==
X-Received: by 2002:a05:6a00:4f81:b0:736:5822:74b4 with SMTP id d2e1a72fcca58-73905a530a9mr6797719b3a.21.1742573353797;
        Fri, 21 Mar 2025 09:09:13 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a27de717sm1957838a12.12.2025.03.21.09.09.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 09:09:13 -0700 (PDT)
Message-ID: <4d617199-191c-47d9-a0f1-5bf9c149d09d@oss.qualcomm.com>
Date: Fri, 21 Mar 2025 10:09:05 -0600
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] accel/rocket: Add job submission IOCTL
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
        Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net>
 <20250225-6-10-rocket-v2-6-d4dbcfafc141@tomeuvizoso.net>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250225-6-10-rocket-v2-6-d4dbcfafc141@tomeuvizoso.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: N5yLlkrIAVWcZCPtlprVMI-EpHwd4a03
X-Proofpoint-ORIG-GUID: N5yLlkrIAVWcZCPtlprVMI-EpHwd4a03
X-Authority-Analysis: v=2.4 cv=VaD3PEp9 c=1 sm=1 tr=0 ts=67dd8f2c cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=otp63fjl-Mw8CRR8ssMA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210118

On 2/25/2025 12:55 AM, Tomeu Vizoso wrote:
> +/**
> + * struct drm_rocket_task - A task to be run on the NPU
> + *
> + * A task is the smallest unit of work that can be run on the NPU.
> + */
> +struct drm_rocket_task {
> +	/** DMA address to NPU mapping of register command buffer */
> +	__u64 regcmd;
> +
> +	/** Number of commands in the register command buffer */
> +	__u32 regcmd_count;
> +};
> +
> +/**
> + * struct drm_rocket_job - A job to be run on the NPU
> + *
> + * The kernel will schedule the execution of this job taking into account its
> + * dependencies with other jobs. All tasks in the same job will be executed
> + * sequentially on the same core, to benefit from memory residency in SRAM.
> + */
> +struct drm_rocket_job {
> +	/** Pointer to an array of struct drm_rocket_task. */
> +	__u64 tasks;
> +
> +	/** Pointer to a u32 array of the BOs that are read by the job. */
> +	__u64 in_bo_handles;
> +
> +	/** Pointer to a u32 array of the BOs that are written to by the job. */
> +	__u64 out_bo_handles;
> +
> +	/** Number of tasks passed in. */
> +	__u32 task_count;
> +
> +	/** Number of input BO handles passed in (size is that times 4). */
> +	__u32 in_bo_handle_count;
> +
> +	/** Number of output BO handles passed in (size is that times 4). */
> +	__u32 out_bo_handle_count;
> +};
> +
> +/**
> + * struct drm_rocket_submit - ioctl argument for submitting commands to the NPU.
> + *
> + * The kernel will schedule the execution of these jobs in dependency order.
> + */
> +struct drm_rocket_submit {
> +	/** Pointer to an array of struct drm_rocket_job. */
> +	__u64 jobs;
> +
> +	/** Number of jobs passed in. */
> +	__u32 job_count;
> +};

These 3 structs will be different sizes in 32-bit env vs 64-bit env. Yes 
the driver depends on ARM64, but compat (32-bit userspace with 64-bit 
kernel) is still possible. They should all be padded out to 64-bit 
alignment.  When you do that, you should specify that the padding must 
be zero, and check for that in the driver so that you have the option to 
use the padding in the future.

