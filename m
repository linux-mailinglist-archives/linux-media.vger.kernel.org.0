Return-Path: <linux-media+bounces-44890-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D3DBE8D0F
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 15:23:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FF496E2C9D
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 13:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABDFB350D65;
	Fri, 17 Oct 2025 13:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uRqb+eVM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B0E345738
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 13:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760707390; cv=none; b=W4lLskbfANv4eWafk8PtRKDvkG7X0SbujYCZWCtFRWfkfEZoUT90nlC2DtajlPwMIeaCGjizNGQpFb+fmkxYeN2IpcKHyCLUEqD4uXJGyFdMHaxRdvP1ZT9/FmxRjJr6P7b51IzPiAI4a0DuqsDAwuWRj7StXYN/UvQbbDbkpTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760707390; c=relaxed/simple;
	bh=FqUJZOxa6wftUR/btW/DFFPGj7yyzJyrFIh3F2Zge3M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JJi/0dAG7ZZcLfK/ujRl/ohLGsms7BNB6PAFNHOfgsn0FUSQhQQmwQSs7iyGWkaSgKqTf6dJ+5VGMltFEc3SF5tG85/14fdX9BN7jdcs5fZzcos3I4h+vXklHjBrytvDyVdQJZSoaIChf8Gxjm3RemXGa4fRsJzl//75kWYob4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uRqb+eVM; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3ee888281c3so4286164f8f.3
        for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 06:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760707385; x=1761312185; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=S5Yn8qbQoqMlqz8J8ZWtSvsw3x4TMtEW0q43wUSvDUs=;
        b=uRqb+eVMv5CUd8vf5hIs4eCnSoZYmJ1Q3pb3+5vjLCppoRpspJGYR69zF2LGJqdI4N
         EZczzhi7irn8HorOR3DzVfNzLCuGrND+RU/XNru2LLgN2tMtdZXg7qiJInIpiPjioLpG
         IgtINKhXw0oZ5YEWIIEI+NwWbxBf9Qr4ilY0tVsZ6JyaO5qQOAj31yepaA8Nrlq/jcqc
         J1o+WoeGf4QYxQKESzR1O/A1DZPaqpaHEibhKnUX8ggh07dFl5RXSXWce8l6M8ZHFIzo
         k5tJuPECBg51cVc9YdxxvxfXn53l5PrR6zZQ3Dsl9X+mjDhBFZm6XwYt78K39x6Le1xb
         OlOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760707385; x=1761312185;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S5Yn8qbQoqMlqz8J8ZWtSvsw3x4TMtEW0q43wUSvDUs=;
        b=cMIPZOAdUqGFBPu+9wXG3hQvGfJI84l1B09pNGerhoBmEiIKo0QafDW8bBT8bhmi08
         usYZL8PgynKPsw2mIi+VfPDVCe7VIK+zFkbmsLLCOBGJrBUYzOO9dongZnSkBMrXT/DE
         G/l2DmcI4w0XMTDfW6cPHdMtWs+XPBUgP8OHR2MyuScCjtIePadmliz2gxd8L1BiLH4c
         KKE7xVJIX5lMOUZC9OUNvNkRhr5B+Tu46/QxK6Z/r86GwKFVvJ5hmIfeRTT0Yz8VC3k7
         +UQf1sjtj/xfhYgTwOdfaQTaWu1nRsWaFNyJf/wakw5vfLuVeY2iPQhgVnAvc+Ocq7c9
         eP0Q==
X-Forwarded-Encrypted: i=1; AJvYcCX0Iq3KloEDXghFUwVUql+B0+lFJfhpeTeCl/HGN+lDW8FH965xc3mdLeaFnBHW9Mi6Nysa+efTy57xig==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIICUI35cch3gw7UQzC6KGTtjfdP/3DcOoLh+bqVr9033vLuch
	OV6rFmyYFnEYE1flkfIjA8wefEMi4D/stygBMPWOgi7BlzOpsTzUXFfiBGYF80V8l6hz4+DqQ7k
	JtQCiF9qa/znWoyOU7g==
X-Google-Smtp-Source: AGHT+IEYb4fFMQvjDzvyv+R6CQU79EQ8AAQbZcI28Pmog6TT3PGCHiGdYfpHiQEQ7liXGiI1hW8U/8CHkswY9G4=
X-Received: from wmgb8.prod.google.com ([2002:a05:600c:1508:b0:46e:3190:9ce])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:811b:b0:471:13fa:1b84 with SMTP id 5b1f17b1804b1-4711787c803mr27313335e9.12.1760707385665;
 Fri, 17 Oct 2025 06:23:05 -0700 (PDT)
Date: Fri, 17 Oct 2025 13:23:04 +0000
In-Reply-To: <20251016210955.2813186-4-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251016210955.2813186-1-lyude@redhat.com> <20251016210955.2813186-4-lyude@redhat.com>
Message-ID: <aPJDOLvBldH_Km91@google.com>
Subject: Re: [PATCH v4 3/9] rust: helpers: Add bindings/wrappers for dma_resv_lock
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	Daniel Almeida <daniel.almeida@collabora.com>, Asahi Lina <lina@asahilina.net>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	"Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Asahi Lina <lina+kernel@asahilina.net>, Viresh Kumar <viresh.kumar@linaro.org>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Krishna Ketan Rai <prafulrai522@gmail.com>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b" <linux-media@vger.kernel.org>, 
	"moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b" <linaro-mm-sig@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"

On Thu, Oct 16, 2025 at 05:08:16PM -0400, Lyude Paul wrote:
> From: Asahi Lina <lina@asahilina.net>
> 
> This is just for basic usage in the DRM shmem abstractions for implied
> locking, not intended as a full DMA Reservation abstraction yet.
> 
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

