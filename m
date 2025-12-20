Return-Path: <linux-media+bounces-49234-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDF4CD2D4B
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 11:19:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28E9C301E929
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 10:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 322D3309EE4;
	Sat, 20 Dec 2025 10:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kp9wtU7o"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210F829DB64
	for <linux-media@vger.kernel.org>; Sat, 20 Dec 2025 10:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766225918; cv=none; b=ba+q4gd/iPa4P6K2q2mwO4uUYQY+aBnTETW2Cr5pWH/moavRevOYjH8odVHIllxFNwUuA00xwCqiBWBsZaiw6Ff4WPBwxkUGpMeQAQ4pJNGXT87SVoYWM2jV09k9660AZp/pkN/WnBzPS03MnNnF+o3u4QMAt0cuRL2h+Mq4ES8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766225918; c=relaxed/simple;
	bh=+oURe4aXMdk0LjKAZ44d1/hPSLfZHh6FrPzIxlIWzd8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=poT3cZrSZ/sQhmR/cpHVvX76ZoDMLmkrVhl+GD4aMVZJAo0pKnAgfrglNUTdSchvGKES+jPeqfWobPX5agMsjhS0K+VHX7GfV8QXxRIw3Cheg89i08oedRfKfYjZpcPIxuTU7Flvhx78apmnPN48DUImI7Ai/D25QI7G8b1H7EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kp9wtU7o; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4776079ada3so20949955e9.1
        for <linux-media@vger.kernel.org>; Sat, 20 Dec 2025 02:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766225915; x=1766830715; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+oURe4aXMdk0LjKAZ44d1/hPSLfZHh6FrPzIxlIWzd8=;
        b=kp9wtU7o75Zy9gmWnkZJ2sqUlBN7oUu0RXi+xl7r8K4T98LbwJbLK9slQAxYLg7jXq
         34aIDRwE6v8YMRlxl30n6N9RArrxWN5RPNlIvUyqzccW+lKVAI4NZR0eL9q2A2wGf7Lo
         eOe1tAqDEn1XXkZINcH4/rMlhHlQQ2aKN6YiD+38IghgMCweigRX0Pe2xLiv/cJXnt9R
         ewAsbG6ogZBHWMZh9hS3k84wRjnX5ljrFHShZO8f9wpQkOvPQLLnMBvyIOmJuWZcy4aW
         9H8U6VcBh1rqhoaKDYpJoqrc2HotjoHkZSQexBCyMRiQr03jho0HyZHuEtYaov3KYOny
         7JUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766225915; x=1766830715;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+oURe4aXMdk0LjKAZ44d1/hPSLfZHh6FrPzIxlIWzd8=;
        b=xT8jl1x6zxeytFCKKbCe45DcNUdB5uOcl2wz7PNLSZZkST2Gq8pICs9hkYYPn1MAoO
         PKtLgV0lGgzK52BObmscmUPfncyC8+jPU11a6AHB+0uFgtfcdbYUqNS5SUm/a5PY4jHV
         mZQVqAjCfC46uCGi+Hc/7mXehKannq3RWBiLJdCNLugke72qWJlEqcAiLbRAgwsp6YOh
         ZAkKeb5BTTfyy692JPwXt0Hq/g1mcwZcvs+Mt++Uz68p523X+u8cKct8y37hyi3tyfUu
         cVKUBYoozF/e4O02+Dby2CfkvlIZITFySx+j+AFNT0ZEbqg7a92W2cDCSvbqfMbFLmow
         OcQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZIj/Z4rHKnNpk0SXied7TOYxQYsfWsKhXPnskzOt6ubg0pjUJkiZ9AwAJ6swfbJT/yfxjubIhq9PliQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJFWWNTHbiqlc40mgO7UrtZMrNMbiTln2ZkQ/c0Z2gAJTTHB0F
	NDoT6eO+mQRySC400vMgZZgjQw/Mnnjlg79NlHI0gsj3gzGf50s0tXXG0owcRPdiOEh3D4M/uFh
	RmFSa27t1xWPv4dKdaQ==
X-Google-Smtp-Source: AGHT+IHezTbdkQabpgPR3pVcmu1YjPdSolIwP7RQSXNt0PalcelZIDHJL+QGmDx/ShI8sV3gW2XIBlw4p3buplU=
X-Received: from wmxa7-n1.prod.google.com ([2002:a05:600d:6447:10b0:477:5a0f:1860])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b8b:b0:46e:6d5f:f68 with SMTP id 5b1f17b1804b1-47d19566aa8mr51108125e9.12.1766225915629;
 Sat, 20 Dec 2025 02:18:35 -0800 (PST)
Date: Sat, 20 Dec 2025 10:18:34 +0000
In-Reply-To: <aUZ07zYew7Mfwc_C@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251128-gpuvm-rust-v1-0-ebf66bf234e0@google.com>
 <20251128-gpuvm-rust-v1-4-ebf66bf234e0@google.com> <DF2AXQ67412G.33JOX2CF0VFCK@kernel.org>
 <aUZw4fpWRUWFsb9r@google.com> <aUZ07zYew7Mfwc_C@google.com>
Message-ID: <aUZ3-iStCAWShvt8@google.com>
Subject: Re: [PATCH 4/4] rust: drm: add GPUVM immediate mode abstraction
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Matthew Brost <matthew.brost@intel.com>, 
	"Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Lyude Paul <lyude@redhat.com>, 
	Lucas De Marchi <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	"Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, Asahi Lina <lina+kernel@asahilina.net>
Content-Type: text/plain; charset="utf-8"

On Sat, Dec 20, 2025 at 10:05:35AM +0000, Alice Ryhl wrote:

Aha! This one didn't get duplicated on lore. It's the nouveau list that
is broken.

Alice

