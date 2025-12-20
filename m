Return-Path: <linux-media+bounces-49232-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C577CD2CD7
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 11:02:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DDC1530198FA
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 10:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E489D1FF7B3;
	Sat, 20 Dec 2025 10:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iDve27GU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A7320459A
	for <linux-media@vger.kernel.org>; Sat, 20 Dec 2025 10:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766224910; cv=none; b=b2p7loK/oeaaZtvsqNF193xTooE+Qb10Pk33wXc6fcyQt+ZIG/MVPP15JZgcZBjhHcj1MZPIqvTVEEDJ7vIJwidOnO+3/NHk/MExSa3Hp0eW6P/aiuWr6AWQEYarksmsNJ5xZ9NrRyvbFLST6NDEfCXFYGk55oKJKnvPnv8IEN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766224910; c=relaxed/simple;
	bh=ocwPq1u4g2mzhV09irHynQ5ZI4NxkFIUPpevQXULN2g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Yu6/da+kSVlslGzgylGlyrunBIQ2b/7xm0aij4vUdCTWZFoU/YZ6KhZ1MSTw5kGFJt21G5LgM6MuH0Wr34Qy1cpEOz8MScELmcYJnQh+ExPSxVnQrce+ZDhhOXlh5ewR3LWlvqDBlVveHeRay0tF5ZMPDnKsPmruSzIPYRTnrs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iDve27GU; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-64d1a0f7206so207187a12.0
        for <linux-media@vger.kernel.org>; Sat, 20 Dec 2025 02:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766224907; x=1766829707; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ocwPq1u4g2mzhV09irHynQ5ZI4NxkFIUPpevQXULN2g=;
        b=iDve27GUkw38lY0+2WnwuPkEeOIQ0ipYYDdG/jAY7DZFIMmPCPQbimEjgxxFm1im5W
         PmxZmGyDh/PEb+8M38T4U8Z0dStqRr2y7X1h/FOr0GjdAwP8xEINlWk3c1XJtdirWEas
         8s8AhTVtWcDopYKFAmkdGMp1KJSYpHtCpKy0VlEE7vBhNWF8iai9EN83kneDvlLaUgRi
         jPGJxg0knV9ZUBFw23L418dVeTWS2bdYOaKSV2gJEUF/Zmd4EiU4vA7VUVTISxHQJ5lU
         qtDy+cpPTGfArRRtTg9IVjeTSdQfeA8If/4c2Ye9bBV47wE/nmjWeAyfvG35dY6uc9rm
         LxbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766224907; x=1766829707;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ocwPq1u4g2mzhV09irHynQ5ZI4NxkFIUPpevQXULN2g=;
        b=Yeveuc2YKKJoq59u5Vx5hWw/HTPVIviGUMFlX+55IYq81RMxvkqph8P65ebp4jvH/x
         3WxTdhsFmAYB1pMQ+k4gfszctEcnNBjmgoAY86+1qcIfTk3dmxZckdgwl+I5XWel8WZY
         vqORmWyDYN3jI41PxQj1utKSKo5SNUkVEHIyWUZFFHT0oGuUMYUVo+w0Fr+5e13Ck2sZ
         WhSSy0s8hBTiziG4Z8Dd2NWRhs6y6dqfKM6kJaCvsM5fnwdLp6ItW0YRgVgvK1FjpfqP
         7AQtufjDI+nl3MlSfHXF+irbJpr7sE/1Symm2nztqDxzgS5nKp7yCONJJU9i6b2Tt0Yg
         jqcA==
X-Forwarded-Encrypted: i=1; AJvYcCXKY3VZe02az2u65G2rbl10cQarvvguFZCWeQMZsEFDbgw0IMftecm4f84OvvDSPJtByduiiUH54zv4yw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjIMhAathqjuMj71eRU1nfsB2t8dehF9tavC0x01kTL2BBfnyR
	sNF0yqSo+3ysZvbdzka54HdGI13NElNaOIK2F9ab0/8cwCTAbGUL6y/TLk90tgkNWf+iEdEJyKS
	35T8ClC7HihPxC/Cf9Q==
X-Google-Smtp-Source: AGHT+IG5pJx6M7iv4XX9yaURjf8mepTlu7YYJc3wOo7y0QcuEDT1u5dJwGmGqq3CfkKzGEqd1szxRNtAfdZCVwY=
X-Received: from ejdcw8.prod.google.com ([2002:a17:907:1608:b0:b72:41e4:7557])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:7e85:b0:b73:4006:1875 with SMTP id a640c23a62f3a-b803719ef9amr511534366b.38.1766224907016;
 Sat, 20 Dec 2025 02:01:47 -0800 (PST)
Date: Sat, 20 Dec 2025 10:01:46 +0000
In-Reply-To: <aUZw4fpWRUWFsb9r@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251128-gpuvm-rust-v1-0-ebf66bf234e0@google.com>
 <20251128-gpuvm-rust-v1-4-ebf66bf234e0@google.com> <DF2AXQ67412G.33JOX2CF0VFCK@kernel.org>
 <aUZw4fpWRUWFsb9r@google.com>
Message-ID: <aUZ0CsLrHjP3wMac@google.com>
Subject: Re: [PATCH 4/4] rust: drm: add GPUVM immediate mode abstraction
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Matthew Brost <matthew.brost@intel.com>, 
	"Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Lyude Paul <lyude@redhat.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	"Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-media@vger.kernel.org, Asahi Lina <lina+kernel@asahilina.net>
Content-Type: text/plain; charset="utf-8"

On Sat, Dec 20, 2025 at 09:48:17AM +0000, Alice Ryhl wrote:

Test email

