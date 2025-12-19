Return-Path: <linux-media+bounces-49161-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4289DCCFC77
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 13:27:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F90D3064795
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 12:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E5A333FE20;
	Fri, 19 Dec 2025 12:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kDXoTy4J"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A60332ED51;
	Fri, 19 Dec 2025 12:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766147116; cv=none; b=l/aL5O5Ph/bzbhi+e228UvrYLUsFcWEELvZPkr8OMhB67TXMJScgbJgJPWV+o6mhHy1XuOK7pNh4ixH2XTwliVFQNBVaS8t721R8g22BL3tCyUqN+WKeMlOPDKLeKwfsFRM2ha3dbph7bwCw1C0inWL41ZhGTaqn8unSfduzNvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766147116; c=relaxed/simple;
	bh=IKABffyNvPjVM+RzIL5ZAgHEXRXD7t+eDtpJ1JycBW0=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=OZVBLsaa3DbuXAy/g1S+4GT+AMsKWcIqgEz8wjzVdIO0Qgimc6vYN0WNC0ouvVi5oNN/s8nsXd4RqDLgYu+ir/Q+wvI25ej5NRd1nJc3p1O6SjtsvNW1c9tAjlcgMd1Q2R76fmVyFHQ/+tLcmvCCBD9KSPJp5zFhalHFHmp8ZUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kDXoTy4J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DEE8C4CEF1;
	Fri, 19 Dec 2025 12:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766147115;
	bh=IKABffyNvPjVM+RzIL5ZAgHEXRXD7t+eDtpJ1JycBW0=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=kDXoTy4JgoCQtYGg5/UHAbHNxZs3nuql9kLRBlRL08h4OgY6WohVAyq+6n5wjjjN4
	 ZZ7BAsk+IxUf1OAJjfMLqsezJMiZTEDLMokOj+3p+oBqXBpbXSgX/PHtilfEzw0blp
	 hI2uxR66pgVguorKq8YwmkyNG+YJG6ntsL7+PVOPC7iiav7mLXlrZCEYPzpNzwglj3
	 LtPOVO5vSqBa06DClUFoH9b/rDV+mK9q3/3hxSbYNNEaKu+VQftOBZpinqYnnaPBwT
	 5O4vVWnTHYIEwcwdw47DpyJQ2jk04fUUqn/U+WPbVnna0WAAaaMD7NYx91omtEqNg+
	 CM2oilI8Y6E0g==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Dec 2025 13:25:05 +0100
Message-Id: <DF26WBIDPMPU.3E6XTUPMZTHW1@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 2/4] drm/gpuvm: drm_gpuvm_bo_obtain() requires lock and
 staged mode
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
References: <20251128-gpuvm-rust-v1-0-ebf66bf234e0@google.com>
 <20251128-gpuvm-rust-v1-2-ebf66bf234e0@google.com>
In-Reply-To: <20251128-gpuvm-rust-v1-2-ebf66bf234e0@google.com>

On Fri Nov 28, 2025 at 3:14 PM CET, Alice Ryhl wrote:
> In the previous commit we updated drm_gpuvm_bo_obtain_prealloc() to take
> locks internally, which means that it's only usable in immediate mode.
> In this commit, we notice that drm_gpuvm_bo_obtain() requires you to use
> staged mode. This means that we now have one variant of obtain for each
> mode you might use gpuvm in.
>
> To reflect this information, we add a warning about using it in
> immediate mode, and to make the distinction clearer we rename the method
> with a _locked() suffix so that it's clear that it requires the caller
> to take the locks.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Ultimately, the two different approaches of obtaining a VM_BO have always b=
een
desinged for the two different modes of operation -- great to see this refi=
ned!

Given that, I think it would be great to update the "Locking" section of th=
e
GPUVM's documentation and expand it with a new section "Modes of Operation"=
.

Mind sending a follow-up patch / series for this?

