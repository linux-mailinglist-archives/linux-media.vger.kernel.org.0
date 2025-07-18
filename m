Return-Path: <linux-media+bounces-38105-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D0FB0A973
	for <lists+linux-media@lfdr.de>; Fri, 18 Jul 2025 19:27:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7FD03A5B85
	for <lists+linux-media@lfdr.de>; Fri, 18 Jul 2025 17:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DC552E7BBE;
	Fri, 18 Jul 2025 17:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WkhBU3LM"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794442E716C
	for <linux-media@vger.kernel.org>; Fri, 18 Jul 2025 17:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752859613; cv=none; b=PgkctXZKk9by8LsqvsWH8kxtn2fVYcizVnf9mZijQp9PiMDVHpIKFfpPl5gK61IGChUnGhEdkC3XwvL1GulnYG0zQOa+7QddH/dYXgPeoTLX6mLWeFCiM0vCarilthTdJKDThsSDJ6RT1NNuANIxiA6hBpIL2BkCp9j+Y8ZGZgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752859613; c=relaxed/simple;
	bh=ZQApwEQ02/d8oHeWrr7hvbCAGhlqib0c03SG7L+E0gM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LO7xkLz7+XwjwCQNk8QBo9pdYzrHNRpBhQSRZvZpclESp+08NBTGbZBUrxIHWe9NxKABTNTRvU3dvuqjvPKO5iRhRtjthCL18Kf47I+Ubu47lva9fvrAm0kmivObbFl+VM6aih6lWECOTncQemIbxql9sEPlZ0aeZ3W4Zb+tel8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WkhBU3LM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IFSQMR015664
	for <linux-media@vger.kernel.org>; Fri, 18 Jul 2025 17:26:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fv+mEh4f0MhcLN21Yyg9tehverC4r+K2gbgLijocXdM=; b=WkhBU3LMpFoMdlPM
	vAqhiFUJdo1Zy9EYgRDMvp+udPTuHcKx9lPDzeI2ZXq/5cm7elI1QDI9LLxeG7gS
	hM6o9dZC2AWKDDE9ER2UAtPb/2eWJ6s7I3lTT8VDrIQ8Lz+8/oZgNsOnR6tkiv3M
	94c+I8oV1nqbS5IF9e9qGIAskI1hdNYx8UqAIqikMGRgjMivqEVAGMXOOwgcHFDw
	86IzJ625OAki5wWOvc3cxljvy5wf4/Gn9QN7kvCjiE5iYaW7iZNCxeJgbNqMtIKR
	jnNnOF8dKB9rBjiPu7wk4qG9V5hUF7oHJKiK64hHUIbeNs/4uKN/X6SZ8025kYzP
	0hTlwg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dyyc2m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 18 Jul 2025 17:26:50 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-74913385dd8so3211635b3a.0
        for <linux-media@vger.kernel.org>; Fri, 18 Jul 2025 10:26:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752859610; x=1753464410;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fv+mEh4f0MhcLN21Yyg9tehverC4r+K2gbgLijocXdM=;
        b=R4A1aG4UFUh3mzBtCaUlY50MkdQx4bUD422ul10RJzRHiG2TWs/t57mbyJ6NPGe0Zm
         qFpTMh2moBkb+h3gi9TXTUW0M052VegtdVjjk636dHJ3U0mnhC9vNVhDyn0DBYeBwn81
         pdl5BhOMQZHAAdqkm6vm3QqyQ13HU3Wywo4YOXR7JpANEmPLcLdEsOJSunBye09p5ZsF
         H8WDnZgzd8JYJBXXdfWe7DdJBakgIUlaClEM0GNx4ShhrkkdLDRjVmiXHG7dTU/tbgzj
         Tf3vsfdY3/XdYxrAwp/KqU2z6g/qiaOv6saysXUe8GT9K8dndJjch5EpDZpo/sBXr2A5
         f7WQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHNlA+O3pdjWcSelAc8H6AJJt+cpfM+d2yiO5FPjb8JgZb49/plFEc0IN9ytmn7YlzVffmaKmb4zX5SA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiOOx82098buKijVPdYXZKOdkMznhzPxnHiN6F/JuNZjX125SA
	puEQvdsniQ8lMtv5tdE/sfGjXnQqzCYfPTp3+LMtTZcowPIbzqb5IuxQY8bu/JQco3y4/rThsMl
	y3bUNEkUAIpesLMaAyF77eYzRqWXzt2gK2Ytoe8N9zuxszsHrAYk/DtfIUN6QzS8fsQ==
X-Gm-Gg: ASbGncsqvJrdlXaBeQwIfwrsdRfVahs24fNR93lBZPuIU+jAWfUyG4/fAeakwaueiJV
	WbdyxECvigH9ED/opNUXozdsquOEBeyAY1EsbT+mRocofXhIW6b2tg5zBpS9d1qdIrGLFA66ydx
	7lp1NosQUNJBGnVDOmCjVXQs0B2AjF2RSTjgiwSlhEOSnSjL1NJGWrtenOm5DcjVmULXJ/ewX/U
	roggCKPxBFohcSmxhJ3yNlpg57R2pxUotnRHyRCFSfbrsbMuuK5oJY3LAzHjmkL11zTO1Iacw8a
	X3b7LkfIpOInIefM3Lc3UwyU32fOBR4qf7D8+FKzYXU2n7YrMb119KzwGKBhMOED+m8dnN4rm29
	qw6XKlMBb2EReFQ==
X-Received: by 2002:a05:6a00:3392:b0:740:9e87:9625 with SMTP id d2e1a72fcca58-7572267d1f8mr16458200b3a.4.1752859609722;
        Fri, 18 Jul 2025 10:26:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqQ9S63kSJn6y6OyUDc3uTWz9C+4cH8naBY6AZisiTbM1Dmrh1Aqbj7AEM/eK1YFdABEhA9g==
X-Received: by 2002:a05:6a00:3392:b0:740:9e87:9625 with SMTP id d2e1a72fcca58-7572267d1f8mr16458162b3a.4.1752859609159;
        Fri, 18 Jul 2025 10:26:49 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cbd67ed2sm1530796b3a.135.2025.07.18.10.26.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 10:26:48 -0700 (PDT)
Message-ID: <cd36e463-2499-4e3f-8a02-60ea43de83dd@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 11:26:45 -0600
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 04/10] accel/rocket: Add job submission IOCTL
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
        Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
        Kever Yang <kever.yang@rock-chips.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250713-6-10-rocket-v8-0-64fa3115e910@tomeuvizoso.net>
 <20250713-6-10-rocket-v8-4-64fa3115e910@tomeuvizoso.net>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250713-6-10-rocket-v8-4-64fa3115e910@tomeuvizoso.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cJMONNOm1uqNjXhovKgrt7Erm65b8ggY
X-Authority-Analysis: v=2.4 cv=RtXFLDmK c=1 sm=1 tr=0 ts=687a83da cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=DISFzqtZAAAA:8 a=EUspDBNiAAAA:8
 a=OV0_J1LtQ3fB1FIpcGAA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=aug85vrO5LANNmmtkfAW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEzOCBTYWx0ZWRfX6ztHCt06FQ9G
 QE/0ZnA5ULNmjiERkxYIQ+BEOs915BD9K5TTAqTX0qxS3hhH4DxgEeVbzb8PtZABzJEpU2W7Q22
 9qPE6DvE10IihVw26A+AI3Qvsl6eCRD0KlRhJ4NSW7RUR0YuHHqJCAQrp1S8AXPQlf9LpXonz3Z
 ugsCtqRHKPyTvGFAVlkmW1HWyuurCcW+WiZAe4PxX6wExfvz6yPl23FRfsmUZwSNu0xg4BHLxZO
 BLYOBLCga5rKMOIdlkoOZfbIVT1pnzs5wUUuKf4nEFHtCzsXRZ89URPeCS3xV0EWxMKzxrtoWUt
 1XmHAWQ/a9Qmc/I4ZAux+LgIR/cMqQoZ6zZ6NUbMGlyFF6hewN4jfuC4Up7n7IJzphkWxcmfIOL
 XWRW2wRp2DkLgoCXJAgNd2Dglhu55zThcxJF/piNqMvlt+oaBQ7JmC863/KZ/H9bRkBUwjWl
X-Proofpoint-GUID: cJMONNOm1uqNjXhovKgrt7Erm65b8ggY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180138

On 7/13/2025 2:38 AM, Tomeu Vizoso wrote:
> Using the DRM GPU scheduler infrastructure, with a scheduler for each
> core.
> 
> Userspace can decide for a series of tasks to be executed sequentially
> in the same core, so SRAM locality can be taken advantage of.
> 
> The job submission code was initially based on Panfrost.
> 
> v2:
> - Remove hardcoded number of cores
> - Misc. style fixes (Jeffrey Hugo)
> - Repack IOCTL struct (Jeffrey Hugo)
> 
> v3:
> - Adapt to a split of the register block in the DT bindings (Nicolas
>    Frattaroli)
> - Make use of GPL-2.0-only for the copyright notice (Jeff Hugo)
> - Use drm_* logging functions (Thomas Zimmermann)
> - Rename reg i/o macros (Thomas Zimmermann)
> - Add padding to ioctls and check for zero (Jeff Hugo)
> - Improve error handling (Nicolas Frattaroli)
> 
> v6:
> - Use mutexes guard (Markus Elfring)
> - Use u64_to_user_ptr (Jeff Hugo)
> - Drop rocket_fence (Rob Herring)
> 
> v7:
> - Assign its own IOMMU domain to each client, for isolation (Daniel
>    Stone and Robin Murphy)
> 
> v8:
> - Use reset lines to reset the cores (Robin Murphy)
> - Use the macros to compute the values for the bitfields (Robin Murphy)
> - More descriptive name for the IRQ (Robin Murphy)
> - Simplify job interrupt handing (Robin Murphy)
> - Correctly acquire a reference to the IOMMU (Robin Murphy)
> - Specify the size of the embedded structs in the IOCTLs for future
>    extensibility (Rob Herring)
> - Expose only 32 bits for the address of the regcmd BO (Robin Murphy)
> 
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

One optional nit below -

> +/**
> + * struct drm_rocket_submit - ioctl argument for submitting commands to the NPU.
> + *
> + * The kernel will schedule the execution of these jobs in dependency order.
> + */
> +struct drm_rocket_submit {
> +	/** Input: Pointer to an array of struct drm_rocket_job. */
> +	__u64 jobs;
> +
> +	/** Input: Number of jobs passed in. */
> +	__u32 job_count;
> +
> +	/** Input: Size in bytes of the structs in the @jobs field. */
> +	__u32 job_struct_size;
> +
> +	/** Reserved, must be zero. */
> +	__u64 reserved;

It does not appear that this field is needed for padding, and I don't 
see the rest of the series using this. This could be dropped, although 
maybe you have a use for it in the near future?

