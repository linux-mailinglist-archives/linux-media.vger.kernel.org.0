Return-Path: <linux-media+bounces-49160-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 722F9CCFBAF
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 13:15:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EA5BC301934E
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 12:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F38F338925;
	Fri, 19 Dec 2025 12:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GZI+KIIM"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEA6335574;
	Fri, 19 Dec 2025 12:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766146514; cv=none; b=QFADyAJZInxD0zahsoMX3MrkIO2ZLLVJOC9VPeq3ihO+DUvf6M2enp7r0xHw5Wpx0HcXsau0foI4ciddUkC0g7kEzyUZSDNF5fNG1IX4pYBcyIBnHU0O/YwdN7AnuF0YM9RzF3xfDYtaiobTHkm64CeQNOYPmP95bKtcep+JYbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766146514; c=relaxed/simple;
	bh=zr3MOIdRIiLo5rQVA/Ls8ftqQmh9k+HKygN/fGUhHUM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=VBMo9x79vxWFL9SVZSAwjZjdb10ajk3HnKgy1eqkQm673T1HvmrwAcD0KTGYgJi4r71LXPYdbII0JAaqIvzClA7HGtczHQM4ncpDKEunTvxzEAWSulvWXEGvxJm4MhQIAkXPTMjaml4NapN1lsACt2S6uPXT7W/fSbZ1ZQkl78A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GZI+KIIM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A36E2C4CEF1;
	Fri, 19 Dec 2025 12:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766146514;
	bh=zr3MOIdRIiLo5rQVA/Ls8ftqQmh9k+HKygN/fGUhHUM=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=GZI+KIIMKdrldmwo7anW9rvr4aLsQBZAC9pHRgRsTbVfoUDi8BU6ovBSAJYDNojJh
	 4AYAUZonScKOOogC43EkXDdgB04ocA8/I5WdYaWRnXC8I6s6hlfcjVZrZOmk0glcjQ
	 iPgk0U6tK4L20VCTNJbufSlESIsU620vyTVv/beEcIAlqx1m/rD8o2RM228EyXbNiZ
	 SDBQgev8wOx9x0nh0FR1geOg+/5LPLtX1dOYq7Sevx09h/yPEn8K5XoCwW9UwIVKHl
	 fuKOEaTs33EyjO4TMdIoTR0BvTGHRMJrgHgQ1rHBQT/rIyqGZzr+qbMfvwOcuHZHyT
	 GmcaQve3a1qGg==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Dec 2025 13:15:04 +0100
Message-Id: <DF26ONGZ03KH.31FVI22UBGJFX@kernel.org>
Subject: Re: [PATCH 1/4] drm/gpuvm: take GEM lock inside
 drm_gpuvm_bo_obtain_prealloc()
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
 "Abhinav Kumar" <abhinav.kumar@linux.dev>, "Jessica Zhang"
 <jessica.zhang@oss.qualcomm.com>, "Sean Paul" <sean@poorly.run>, "Marijn
 Suijten" <marijn.suijten@somainline.org>, "Lyude Paul" <lyude@redhat.com>,
 "Lucas De Marchi" <lucas.demarchi@intel.com>, "Rodrigo Vivi"
 <rodrigo.vivi@intel.com>, "Sumit Semwal" <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <linux-media@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251128-gpuvm-rust-v1-0-ebf66bf234e0@google.com>
 <20251128-gpuvm-rust-v1-1-ebf66bf234e0@google.com>
In-Reply-To: <20251128-gpuvm-rust-v1-1-ebf66bf234e0@google.com>

On Fri Nov 28, 2025 at 3:14 PM CET, Alice Ryhl wrote:
> +static void
> +drm_gpuvm_bo_destroy_not_in_lists(struct drm_gpuvm_bo *vm_bo)
> +{
> +	struct drm_gpuvm *gpuvm =3D vm_bo->vm;
> +	const struct drm_gpuvm_ops *ops =3D gpuvm->ops;
> +	struct drm_gem_object *obj =3D vm_bo->obj;
> +
> +	if (ops && ops->vm_bo_free)
> +		ops->vm_bo_free(vm_bo);
> +	else
> +		kfree(vm_bo);
> +
> +	drm_gpuvm_put(gpuvm);
> +	drm_gem_object_put(obj);
> +}

I think to us it seems obvious, but I think for new people it might not be.=
 Can
you please add a comment that mentions that this is about the evict and ext=
obj
lists and explains how this is related to locking?

