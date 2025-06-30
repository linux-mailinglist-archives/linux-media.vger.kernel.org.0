Return-Path: <linux-media+bounces-36346-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E739CAEE8A1
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 22:56:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D93117F03D
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 20:56:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9A4723F434;
	Mon, 30 Jun 2025 20:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HhKs9WPS"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155B91E32D6;
	Mon, 30 Jun 2025 20:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751316977; cv=none; b=I1C9M5K6REYKz0LQpRzEUnpNy4uyTP6LMXkkAy+97pJ4I/F8uDD3UsD7FYttxEv14cALT/ymJ49FT1Q0hVvPx3tEIQ+6RrAX7TWEnJkG4lBRfiV/uZCa0ulKmxO73Hdo+NBlEmNbfGwF+maBp1sdiM+02eOlrICmb75JVjMHIu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751316977; c=relaxed/simple;
	bh=PO44svPAYFFi6GiqbWS4Fm1Ty0ssVHLymeJlTxwzafk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CVVNtiwdewpZkMn6DLggeld9XDg7QSwDSIQeqe/VJW1/vqLmp3cPTLPXjE1S7JzZcFd9eykaLN0fO+d1lhfKJzveJnBJdMETd1w0VqJRzIhp/CqYDgZ+knAccEWZcjx5nWYdw7QtoPyljwGcznmQzvx92tEt23bqWL7ZJ8fG6pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HhKs9WPS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8247EC4CEF7;
	Mon, 30 Jun 2025 20:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751316975;
	bh=PO44svPAYFFi6GiqbWS4Fm1Ty0ssVHLymeJlTxwzafk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HhKs9WPSntjrnVGvwtUXKtRXfRp7ZFQTMeoh2xdI+oPDKiaU8VWwMUVyewuWLutRg
	 thNMMLiVjeUeK8jrFPHKkQyxzP2F2NksS+Un0A8qTqqrV8pBLyPcDk6KCv22zCVQYV
	 qZ4FU2CVCJSancybT61fdQYX+fdRJEBBnLKiCvNU1+Q4l7zPtuANNbD94XMmClnpQc
	 fl1gtL8ERG1fIzjVoe5OuU8vLVx1bKu7M3+zBmUIMmzC0EA6hJf/Xnu2pCN/sSbiII
	 ck22XgFecXDsY2l7lnuGZhGrb+5aQiMIxfvnxQbH95E1q4CaoZnFLDAqHjLiwO3N5f
	 WnRbpWKBx5XlA==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ae36e88a5daso506961166b.1;
        Mon, 30 Jun 2025 13:56:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUUkTJI/PPbxVrF73M3wqeC4KnBHg+bHY11A6mqOVP9b/rnnN76FTSkHTbW4AuYWDSv9sC6G7lg1dU/@vger.kernel.org, AJvYcCUYpIkAspNNTX9YxUvTjjHBOM2kGb8kYzA1vDqA3gMAbL5jk+Y1BYW5+obo9adTtSzjH+bqdn8K7WiKLJMA@vger.kernel.org, AJvYcCWFWSsIhdjidSvU/ZIU0PLMphtQd73qVz9KAU7f8bOZL+AYjWaxkHiKkPhhONgVUMZDWfidRUsL8u92@vger.kernel.org, AJvYcCWxp1pMinJYeeqyQmrNdOLp279XfvTM6xo9F7YuVlmVF0gjakPccYVf7KYJ4kdbE/Pp2k0wTvdXXJ4SUy8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp29YOz7PUDYlegOsFDuBGMXD3n5cJuUS3vWgyoaDBzWFp1uYE
	wsTx8brXt4+/bNdJO8EnUXCVx22m2netZ1FDjSm/5xQwedKWmpKuo9wJwAfdroE47NpvI3ffLvp
	05LIzowuU1sfpkQPB+GIIxH2O6HE0yw==
X-Google-Smtp-Source: AGHT+IHN6KYVrLpEyM//LpRHGQ3ciilHAEEns6c2p0uRqrws7WdVXCCQfCRU6orJIR5QnGKwW7fUExXvkMdYX3eTq8k=
X-Received: by 2002:a17:907:868b:b0:ad9:db54:ba47 with SMTP id
 a640c23a62f3a-ae350190c99mr1589912566b.43.1751316973962; Mon, 30 Jun 2025
 13:56:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net> <20250606-6-10-rocket-v7-4-dc16cfe6fe4e@tomeuvizoso.net>
In-Reply-To: <20250606-6-10-rocket-v7-4-dc16cfe6fe4e@tomeuvizoso.net>
From: Rob Herring <robh@kernel.org>
Date: Mon, 30 Jun 2025 15:56:02 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJtKCXE0MLaBN5-r+w+2jVwt8UMwHtr-nP0PoBmfNodpg@mail.gmail.com>
X-Gm-Features: Ac12FXy8hWxpEFoW3ELH4IZXVQDuQYuBeJxvmHd6gayxY_Y6diMDIDxJ1A0GBAM
Message-ID: <CAL_JsqJtKCXE0MLaBN5-r+w+2jVwt8UMwHtr-nP0PoBmfNodpg@mail.gmail.com>
Subject: Re: [PATCH v7 04/10] accel/rocket: Add job submission IOCTL
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Kever Yang <kever.yang@rock-chips.com>, 
	Robin Murphy <robin.murphy@arm.com>, Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>, 
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 6, 2025 at 1:29=E2=80=AFAM Tomeu Vizoso <tomeu@tomeuvizoso.net>=
 wrote:
>
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
>   Frattaroli)
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
>   Stone and Robin Murphy)
>
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> ---

[...]

> --- a/include/uapi/drm/rocket_accel.h
> +++ b/include/uapi/drm/rocket_accel.h
> @@ -12,8 +12,10 @@ extern "C" {
>  #endif
>
>  #define DRM_ROCKET_CREATE_BO                   0x00
> +#define DRM_ROCKET_SUBMIT                      0x01
>
>  #define DRM_IOCTL_ROCKET_CREATE_BO             DRM_IOWR(DRM_COMMAND_BASE=
 + DRM_ROCKET_CREATE_BO, struct drm_rocket_create_bo)
> +#define DRM_IOCTL_ROCKET_SUBMIT                        DRM_IOW(DRM_COMMA=
ND_BASE + DRM_ROCKET_SUBMIT, struct drm_rocket_submit)
>
>  /**
>   * struct drm_rocket_create_bo - ioctl argument for creating Rocket BOs.
> @@ -37,6 +39,68 @@ struct drm_rocket_create_bo {
>         __u64 offset;
>  };
>
> +/**
> + * struct drm_rocket_task - A task to be run on the NPU
> + *
> + * A task is the smallest unit of work that can be run on the NPU.
> + */
> +struct drm_rocket_task {
> +       /** Input: DMA address to NPU mapping of register command buffer =
*/
> +       __u64 regcmd;
> +
> +       /** Input: Number of commands in the register command buffer */
> +       __u32 regcmd_count;
> +
> +       /** Reserved, must be zero. */
> +       __u32 reserved;
> +};
> +
> +/**
> + * struct drm_rocket_job - A job to be run on the NPU
> + *
> + * The kernel will schedule the execution of this job taking into accoun=
t its
> + * dependencies with other jobs. All tasks in the same job will be execu=
ted
> + * sequentially on the same core, to benefit from memory residency in SR=
AM.
> + */
> +struct drm_rocket_job {
> +       /** Input: Pointer to an array of struct drm_rocket_task. */
> +       __u64 tasks;
> +
> +       /** Input: Pointer to a u32 array of the BOs that are read by the=
 job. */
> +       __u64 in_bo_handles;
> +
> +       /** Input: Pointer to a u32 array of the BOs that are written to =
by the job. */
> +       __u64 out_bo_handles;
> +
> +       /** Input: Number of tasks passed in. */
> +       __u32 task_count;
> +
> +       /** Input: Number of input BO handles passed in (size is that tim=
es 4). */
> +       __u32 in_bo_handle_count;
> +
> +       /** Input: Number of output BO handles passed in (size is that ti=
mes 4). */
> +       __u32 out_bo_handle_count;
> +
> +       /** Reserved, must be zero. */
> +       __u32 reserved;
> +};
> +
> +/**
> + * struct drm_rocket_submit - ioctl argument for submitting commands to =
the NPU.
> + *
> + * The kernel will schedule the execution of these jobs in dependency or=
der.
> + */
> +struct drm_rocket_submit {
> +       /** Input: Pointer to an array of struct drm_rocket_job. */
> +       __u64 jobs;
> +
> +       /** Input: Number of jobs passed in. */
> +       __u32 job_count;

Isn't there a problem if you need to expand drm_rocket_job beyond
using the 1 reserved field? You can't add to the struct because then
you don't know the size here. So you have to modify drm_rocket_submit
to modify drm_rocket_job. Maybe better if you plan for that now rather
than later by making the size explicit.

Though etnaviv at least has similar issues.

Rob

> +
> +       /** Reserved, must be zero. */
> +       __u32 reserved;
> +};

