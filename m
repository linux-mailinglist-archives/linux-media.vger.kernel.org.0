Return-Path: <linux-media+bounces-50246-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA09D057D0
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 19:25:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF5FC3634AEA
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 17:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0E8D32AACA;
	Thu,  8 Jan 2026 17:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XKyAyKs/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164EF3271F9;
	Thu,  8 Jan 2026 17:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767893053; cv=none; b=C7LM34qUs1hBc78/qTMaLOPPvevjrols9g8rblZ9AFp2WX59Re6V7LUkehxY4cATWR/giCgExKJk7XO8TkE1q3QvkfQEFXNi2KSLbJCxboVACDcd2MOzme2Gknj59pAUFIHxV5BVPYI2pw9qFs+KSzk+spUjtbhN26Q1tNA4XS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767893053; c=relaxed/simple;
	bh=hq0TVgPrc0pom/V97hgluSg19lH8GAucG7MJGGWa3KI=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=cgNUJV6cEcSEonAIfK30fKLiZM2/4qP5PbLq7Z5P/6RZtatbd1NSK31TLb5gZL3KGUSBMHLJD/Nliv/nOs5bwCSwbyAHpdvPC9W45UfUOwcowQt/9pTr35yo1GVxBuXoB41u62x1xK/BhNqquHYe8AEcZiFvO/uY8stu5B+WlPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XKyAyKs/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA179C116C6;
	Thu,  8 Jan 2026 17:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767893052;
	bh=hq0TVgPrc0pom/V97hgluSg19lH8GAucG7MJGGWa3KI=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=XKyAyKs/CwbFCuPL7zO2AjeTOhShG2a3lDcM2MJrb7R5/ZhZnwSoE4EiuNOoG4fT2
	 un3qnNrPHUot6XOKHiudxgPiDSFf2cKH/uCP9lGfsjMMu83Qpa7Mn2fuH34c9NXQtm
	 2PbE40s9olywJM5M5kNdzMaQu9qO2kcfCGkYfxT5hC2X5xcnf14EsoTiopz3mE333m
	 a4bZM0MB/8sxuo36fNWu0R8BcVkdDX69B/r/v7Q+NdLA5Otpp5ts6Bdvlb4EKETINs
	 2Lidp0s1+l07wnXzjH6Z3N7OT3XP39NYbpZMolhrVdwb/Sq1cUdE+AXnKpG/65s/O0
	 jChUimgAy7L3A==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 08 Jan 2026 18:24:03 +0100
Message-Id: <DFJDS4EY28HD.WZ344DONCS5L@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 0/3] Rust GPUVM prerequisites
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Matthew Brost"
 <matthew.brost@intel.com>, =?utf-8?q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Boris Brezillon"
 <boris.brezillon@collabora.com>, "Steven Price" <steven.price@arm.com>,
 "Liviu Dudau" <liviu.dudau@arm.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Frank Binns" <frank.binns@imgtec.com>, "Matt
 Coster" <matt.coster@imgtec.com>, "Rob Clark"
 <robin.clark@oss.qualcomm.com>, "Dmitry Baryshkov" <lumag@kernel.org>,
 "Abhinav Kumar" <abhinav.kumar@linux.dev>, "Sean Paul" <sean@poorly.run>,
 "Marijn Suijten" <marijn.suijten@somainline.org>, "Lyude Paul"
 <lyude@redhat.com>, "Rodrigo Vivi" <rodrigo.vivi@intel.com>, "Sumit Semwal"
 <sumit.semwal@linaro.org>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <linux-media@vger.kernel.org>
References: <20260108-gpuvm-rust-v2-0-dbd014005a0b@google.com>
In-Reply-To: <20260108-gpuvm-rust-v2-0-dbd014005a0b@google.com>

On Thu Jan 8, 2026 at 5:07 PM CET, Alice Ryhl wrote:
> Alice Ryhl (3):
>       drm/gpuvm: take GEM lock inside drm_gpuvm_bo_obtain_prealloc()

Applied to drm-misc-fixes, thanks!

>       drm/gpuvm: drm_gpuvm_bo_obtain() requires lock and staged mode

   [ Slightly reword commit message to refer to commit 9ce4aef9a5b1
     ("drm/gpuvm: take GEM lock inside drm_gpuvm_bo_obtain_prealloc()").
     - Danilo ]

>       drm/gpuvm: use const for drm_gpuva_op_* ptrs

Applied to drm-misc-next, thanks!

